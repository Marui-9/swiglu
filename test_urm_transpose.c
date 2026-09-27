// test_urm_transpose.c — Validate URAM-transposed nibble layout
// Verifies that the transposed matmul is bit-identical to reference Q4_K matmul.
// Compile: gcc -o test_urm_transpose test_urm_transpose.c -lm
// Run:     ./test_urm_transpose

#include <stdio.h>
#include <stdint.h>
#include <string.h>
#include <math.h>
#include <stdlib.h>

// ─── Constants ─────────────────────────────────────────────────────────────────
#define BLOCKS_PER_ROW    8
#define NIBBLES_PER_BLOCK 256
#define SUB_BLOCKS        8       // 256 / 32
#define Q4_K_BYTES        144
#define HDR_BYTES          20     // d(2) + dmin(2) + sc6(8) + mn6(8)

// ─── fp16_to_fp32 (same as swiglu.cpp) ─────────────────────────────────────────
static float fp16_to_fp32(uint16_t h) {
    uint32_t sign = ((uint32_t)(h >> 15)) << 31;
    uint32_t exp  = (h >> 10) & 0x1F;
    uint32_t mant = (uint32_t)(h & 0x3FF);
    uint32_t f32;
    if (exp == 0 && mant == 0) {
        f32 = sign;
    } else if (exp == 0) {
        uint32_t m = mant, e = 112;
        for (int i = 0; i < 10; i++) {
            if (!(m & 0x200)) { m <<= 1; e--; }
        }
        f32 = sign | (e << 23) | ((m & 0x1FF) << 14);
    } else if (exp == 31) {
        f32 = sign | 0x7F800000 | (mant << 13);
    } else {
        f32 = sign | ((exp + 112) << 23) | (mant << 13);
    }
    union { uint32_t u; float f; } c; c.u = f32;
    return c.f;
}

// ─── Q4_K block accessors ──────────────────────────────────────────────────────
static inline uint8_t q4k_nibble(const uint8_t *block, int n) {
    return (block[16 + (n >> 1)] >> ((n & 1) << 2)) & 0xF;
}

static inline uint8_t q4k_sc6(const uint8_t *block, int sub) {
    if (sub < 4)
        return block[4 + sub] & 0x3F;
    else
        return (block[12 + (sub - 4)] & 0x0F) | (uint8_t)((block[4 + (sub - 4)] >> 6) << 4);
}

static inline uint8_t q4k_mn6(const uint8_t *block, int sub) {
    if (sub < 4)
        return block[8 + sub] & 0x3F;
    else
        return (block[12 + (sub - 4)] >> 4) | (uint8_t)((block[8 + (sub - 4)] >> 6) << 4);
}

static inline float q4k_d(const uint8_t *block) {
    uint16_t raw = block[0] | ((uint16_t)block[1] << 8);
    return fp16_to_fp32(raw);
}

static inline float q4k_dmin(const uint8_t *block) {
    uint16_t raw = block[2] | ((uint16_t)block[3] << 8);
    return fp16_to_fp32(raw);
}

// ─── Reference Q4_K matmul — uses 4-sub-accumulator pattern matching HLS ────────
// Both reference and URM paths use identical accumulation order so results are
// bit-identical when the algorithm is correct.
static float q4k_row_dot_ref(const uint8_t row[BLOCKS_PER_ROW * Q4_K_BYTES],
                              const int8_t x[BLOCKS_PER_ROW * NIBBLES_PER_BLOCK],
                              float x_scale) {
    int32_t acc_w[BLOCKS_PER_ROW][4];
    int32_t acc_m[BLOCKS_PER_ROW][4];
    memset(acc_w, 0, sizeof(acc_w));
    memset(acc_m, 0, sizeof(acc_m));

    for (int b = 0; b < BLOCKS_PER_ROW; b++) {
        const uint8_t *block = row + b * Q4_K_BYTES;
        for (int n = 0; n < 256; n++) {
            int sub = n >> 5;
            int k   = n & 3;
            int8_t  xi8 = x[b * 256 + n];
            uint8_t nib = q4k_nibble(block, n);
            uint8_t sc6 = q4k_sc6(block, sub);
            uint8_t mn6 = q4k_mn6(block, sub);
            acc_w[b][k] += (int32_t)xi8 * (int32_t)nib * (int32_t)sc6;
            acc_m[b][k] += (int32_t)xi8 * (int32_t)mn6;
        }
    }

    float total = 0.0f;
    for (int b = 0; b < BLOCKS_PER_ROW; b++) {
        const uint8_t *block = row + b * Q4_K_BYTES;
        float d    = q4k_d(block);
        float dmin = q4k_dmin(block);
        int32_t sw = 0, sm = 0;
        for (int k = 0; k < 4; k++) {
            sw += acc_w[b][k];
            sm += acc_m[b][k];
        }
        total += d * (float)sw - dmin * (float)sm;
    }
    return total * x_scale;
}

// ─── Transpose Q4_K row to URM nibble layout ───────────────────────────────────
// Output:
//   headers[10][128]:  flat sc6/mn6 per block, same as hybrid format
//                       bytes: d(2)+dmin(2)+sc6[8]+mn6[8] = 20 per block
//                       8 blocks × 20 bytes = 160 bytes = 10 × 128-bit words
//   nib_urm_A[128]:    nibbles for even elements 0,2,4,...,254
//   nib_urm_B[128]:    nibbles for odd elements  1,3,5,...,255
// Each nib_urm word is 32 bits: nib_urm[n>>1].range(b*4+3, b*4) = nibble for block b
static void transpose_q4k_to_urm(const uint8_t row[BLOCKS_PER_ROW * Q4_K_BYTES],
                                  uint8_t       headers[BLOCKS_PER_ROW * HDR_BYTES],
                                  uint32_t      nib_urm_even[128],
                                  uint32_t      nib_urm_odd[128]) {
    // Decode headers to flat format (same as hybrid)
    for (int b = 0; b < BLOCKS_PER_ROW; b++) {
        const uint8_t *block = row + b * Q4_K_BYTES;
        uint8_t *hdr = headers + b * HDR_BYTES;

        // d/dmin: verbatim copy (2+2 bytes fp16)
        hdr[0] = block[0]; hdr[1] = block[1];
        hdr[2] = block[2]; hdr[3] = block[3];

        // sc6[8] and mn6[8]: decode interleaved 6-bit to flat INT8
        for (int s = 0; s < 4; s++) {
            hdr[4 + s]  = block[4 + s] & 0x3F;          // sc6[0..3]
            hdr[12 + s] = block[8 + s] & 0x3F;          // mn6[0..3]
        }
        for (int s = 4; s < 8; s++) {
            int si = s - 4;
            hdr[4 + s]  = (block[12 + si] & 0x0F)       // sc6[4..7] lo 4 bits
                        | ((block[4 + si] >> 6) << 4);   // sc6[4..7] hi 2 bits
            hdr[12 + s] = (block[12 + si] >> 4)          // mn6[4..7] lo 4 bits
                        | ((block[8 + si] >> 6) << 4);   // mn6[4..7] hi 2 bits
        }
    }

    // Transpose nibbles: element n, blocks 0..7 → 32-bit word
    // even: elements 0,2,4,...,254 → nib_urm_even[0..127]
    // odd:  elements 1,3,5,...,255 → nib_urm_odd[0..127]
    memset(nib_urm_even, 0, 128 * sizeof(uint32_t));
    memset(nib_urm_odd,  0, 128 * sizeof(uint32_t));

    for (int n = 0; n < 256; n++) {
        uint32_t word = 0;
        for (int b = 0; b < BLOCKS_PER_ROW; b++) {
            const uint8_t *block = row + b * Q4_K_BYTES;
            uint32_t nib = q4k_nibble(block, n);
            word |= (nib << (b * 4));
        }
        if (n & 1)
            nib_urm_odd[n >> 1] = word;
        else
            nib_urm_even[n >> 1] = word;
    }
}

// ─── URM-transposed matmul ─────────────────────────────────────────────────────
// Uses pre-transposed headers and nib_urm to compute the same dot product.
// The MAC loop mirrors the intended HLS pipeline:
//   for n in 0..127:
//     read nib_urm_even[n], nib_urm_odd[n]  (1 URAM read each)
//     for b in 0..7:
//       nib_even = nib_urm_even[n].range(b*4+3, b*4)
//       nib_odd  = nib_urm_odd[n].range(b*4+3, b*4)
//       accumulate (element 2n)   with nib_even
//       accumulate (element 2n+1) with nib_odd
//
// Processes 2 elements per outer iteration (even+odd), matching the
// double-URAM-tile architecture (one tile per parity).
static float urm_row_dot(const uint8_t  headers[BLOCKS_PER_ROW * HDR_BYTES],
                          const uint32_t nib_urm_even[128],
                          const uint32_t nib_urm_odd[128],
                          const int8_t   x[BLOCKS_PER_ROW * NIBBLES_PER_BLOCK],
                          float          x_scale) {
    // Decode headers back to float d/dmin and int8 sc6/mn6 per block
    float   d[BLOCKS_PER_ROW], dmin[BLOCKS_PER_ROW];
    int8_t  sc6[BLOCKS_PER_ROW][SUB_BLOCKS];
    int8_t  mn6[BLOCKS_PER_ROW][SUB_BLOCKS];

    for (int b = 0; b < BLOCKS_PER_ROW; b++) {
        const uint8_t *hdr = headers + b * HDR_BYTES;
        uint16_t d_raw    = hdr[0] | ((uint16_t)hdr[1] << 8);
        uint16_t dmin_raw = hdr[2] | ((uint16_t)hdr[3] << 8);
        d[b]    = fp16_to_fp32(d_raw);
        dmin[b] = fp16_to_fp32(dmin_raw);
        for (int s = 0; s < SUB_BLOCKS; s++) {
            sc6[b][s] = (int8_t) hdr[4 + s];
            mn6[b][s] = (int8_t) hdr[12 + s];
        }
    }

    // INT32 accumulators mirroring HLS int_acc_w/m [8][4]
    int32_t acc_w[BLOCKS_PER_ROW][4];
    int32_t acc_m[BLOCKS_PER_ROW][4];
    memset(acc_w, 0, sizeof(acc_w));
    memset(acc_m, 0, sizeof(acc_m));

    // MAC: 128 outer iterations × 2 elements = 256 total
    // Each iteration: read nib_urm_even[n] and nib_urm_odd[n], process all 8 blocks
    for (int i = 0; i < 128; i++) {
        uint32_t w_even = nib_urm_even[i];  // nibbles for element 2i, blocks 0..7
        uint32_t w_odd  = nib_urm_odd[i];   // nibbles for element 2i+1, blocks 0..7

        for (int b = 0; b < BLOCKS_PER_ROW; b++) {
            // Extract nibbles at compile-time fixed bit positions
            uint8_t nib_even = (w_even >> (b * 4)) & 0xF;
            uint8_t nib_odd  = (w_odd  >> (b * 4)) & 0xF;

            // Element 2i (even) and 2i+1 (odd):
            int sub_even = (2*i)     >> 5;
            int sub_odd  = (2*i + 1) >> 5;
            int k_even   = (2*i)     & 3;
            int k_odd    = (2*i + 1) & 3;

            int8_t xe  = x[b * 256 + 2*i];
            int8_t xo  = x[b * 256 + 2*i + 1];

            acc_w[b][k_even] += (int32_t)xe * (int32_t)nib_even * (int32_t)sc6[b][sub_even];
            acc_m[b][k_even] += (int32_t)xe * (int32_t)mn6[b][sub_even];
            acc_w[b][k_odd]  += (int32_t)xo * (int32_t)nib_odd  * (int32_t)sc6[b][sub_odd];
            acc_m[b][k_odd]  += (int32_t)xo * (int32_t)mn6[b][sub_odd];
        }
    }

    // REDUCE: sum sub-accumulators, apply d/dmin scaling
    float total = 0.0f;
    for (int b = 0; b < BLOCKS_PER_ROW; b++) {
        int32_t sw = 0, sm = 0;
        for (int k = 0; k < 4; k++) {
            sw += acc_w[b][k];
            sm += acc_m[b][k];
        }
        total += d[b] * (float)sw - dmin[b] * (float)sm;
    }
    return total * x_scale;
}

// ─── Test helpers ──────────────────────────────────────────────────────────────

// Fill a Q4_K block with deterministic pseudorandom data within valid ranges.
// d/dmin: small positive fp16 values (exponent near 0x10 = 2^1..2^2)
// sc6/mn6: 6-bit values in [1,63] (no zero)
// nibbles: 4-bit values in [0,15]
static void fill_random_q4k_row(uint8_t row[BLOCKS_PER_ROW * Q4_K_BYTES], uint32_t seed) {
    srand(seed);

    for (int b = 0; b < BLOCKS_PER_ROW; b++) {
        uint8_t *block = row + b * Q4_K_BYTES;
        memset(block, 0, Q4_K_BYTES);

        // d: fp16, small positive (~0.5..2.0)
        uint16_t d_val = 0x3800 | (rand() & 0x3FF);   // exp=14 (2^0), random mantissa
        block[0] = d_val & 0xFF;
        block[1] = d_val >> 8;

        // dmin: fp16, smaller (~0.01..0.1)
        uint16_t dmin_val = 0x2C00 | (rand() & 0x3FF); // exp=11 (2^-4)
        block[2] = dmin_val & 0xFF;
        block[3] = dmin_val >> 8;

        // sc6[0..3]: 6 bits each in bytes 4..7
        for (int s = 0; s < 4; s++) {
            block[4 + s] = (rand() & 0x3F);           // lower 6 bits
            block[8 + s] = (rand() & 0x3F);           // mn6 lower 6 bits
        }

        // sc6/mn6 upper bits in bytes 12..15
        // Each byte: bits[3:0]=sc6[4+s] lo, bits[7:4]=mn6[4+s] lo
        // sc6 carry bits come from bytes 4+s bit[7:6]
        for (int s = 0; s < 4; s++) {
            uint8_t sc_lo = rand() & 0x0F;
            uint8_t mn_lo = rand() & 0x0F;
            block[12 + s] = sc_lo | (mn_lo << 4);
            // Carry: upper 2 bits of sc6[4+s] stored in block[4+s] bits [7:6]
            block[4 + s] |= ((rand() & 0x03) << 6);
            // Carry: upper 2 bits of mn6[4+s] stored in block[8+s] bits [7:6]
            block[8 + s] |= ((rand() & 0x03) << 6);
        }

        // nibbles: 128 random bytes (256 × 4-bit nibbles)
        for (int i = 16; i < 144; i++) {
            block[i] = rand() & 0xFF;
        }
    }
}

// Fill INT8 x vector with random values
static void fill_random_x(int8_t *x, int len, uint32_t seed) {
    srand(seed);
    for (int i = 0; i < len; i++) {
        x[i] = (int8_t)((rand() & 0xFF) - 128);  // [-128, 127]
    }
}

// ─── Main ──────────────────────────────────────────────────────────────────────
int main(void) {
    int tests = 0, passed = 0;
    printf("=== URAM-Transposed Nibble Layout Validation ===\n\n");

    // Test 1: Single block nibble round-trip
    printf("T1: Single block, verify transposed nibble extraction ... ");
    {
        uint8_t row[BLOCKS_PER_ROW * Q4_K_BYTES];
        uint8_t headers[BLOCKS_PER_ROW * HDR_BYTES];
        uint32_t nib_even[128], nib_odd[128];

        fill_random_q4k_row(row, 42);

        // Manually check one specific nibble: block 3, element 137
        int b_test = 3, n_test = 137;
        uint8_t nib_ref = q4k_nibble(row + b_test * Q4_K_BYTES, n_test);

        // Transpose
        transpose_q4k_to_urm(row, headers, nib_even, nib_odd);

        // Read back: element 137 is odd → nib_odd[137>>1] = nib_odd[68]
        uint32_t word = nib_odd[n_test >> 1];  // nib_odd[68]
        uint8_t nib_transposed = (word >> (b_test * 4)) & 0xF;

        if (nib_transposed == nib_ref) {
            printf("PASS  (nib=%u, block=%d, element=%d)\n", nib_ref, b_test, n_test);
            passed++;
        } else {
            printf("FAIL  (ref=%u, got=%u)\n", nib_ref, nib_transposed);
        }
        tests++;
    }

    // Test 2: Full row, deterministic data, bit-identical dot product
    printf("T2: Full row (8 blocks), bit-identical dot product ... ");
    {
        uint8_t row[BLOCKS_PER_ROW * Q4_K_BYTES];
        uint8_t headers[BLOCKS_PER_ROW * HDR_BYTES];
        uint32_t nib_even[128], nib_odd[128];
        int8_t x[BLOCKS_PER_ROW * NIBBLES_PER_BLOCK];
        float x_scale = 0.0787f;  // X12_QUANT_SCALE

        fill_random_q4k_row(row, 123);
        fill_random_x(x, BLOCKS_PER_ROW * NIBBLES_PER_BLOCK, 456);

        float ref = q4k_row_dot_ref(row, x, x_scale);

        transpose_q4k_to_urm(row, headers, nib_even, nib_odd);
        float got = urm_row_dot(headers, nib_even, nib_odd, x, x_scale);

        // Float equality — both paths use the same fp16_to_fp32 and integer
        // accumulation order (b then k). Should be bit-identical.
        if (ref == got) {
            printf("PASS  (ref=%.8e, got=%.8e)\n", ref, got);
            passed++;
        } else {
            float diff = ref - got;
            float rel  = ref != 0.0f ? fabsf(diff / ref) : fabsf(diff);
            printf("FAIL  ref=%.8e got=%.8e diff=%.2e rel=%.2e\n",
                   ref, got, diff, rel);
        }
        tests++;
    }

    // Test 3: 100 random rows, verify bit-identity
    printf("T3: 100 random rows, all bit-identical ... ");
    {
        int failures = 0;
        for (int r = 0; r < 100; r++) {
            uint8_t row[BLOCKS_PER_ROW * Q4_K_BYTES];
            uint8_t headers[BLOCKS_PER_ROW * HDR_BYTES];
            uint32_t nib_even[128], nib_odd[128];
            int8_t x[BLOCKS_PER_ROW * NIBBLES_PER_BLOCK];

            fill_random_q4k_row(row, r * 1000 + 1);
            fill_random_x(x, BLOCKS_PER_ROW * NIBBLES_PER_BLOCK, r * 1000 + 2);
            float x_scale = 0.0787f;

            float ref = q4k_row_dot_ref(row, x, x_scale);
            transpose_q4k_to_urm(row, headers, nib_even, nib_odd);
            float got = urm_row_dot(headers, nib_even, nib_odd, x, x_scale);

            if (ref != got) {
                failures++;
                if (failures <= 3) {
                    float diff = fabsf(ref - got);
                    printf("\n  row %d: ref=%.8e got=%.8e diff=%.2e", r, ref, got, diff);
                }
            }
        }
        if (failures == 0) {
            printf("PASS  (100/100 rows)\n");
            passed++;
        } else {
            printf("FAIL  (%d/100 rows mismatched)\n", failures);
        }
        tests++;
    }

    // Test 4: Subnormal fp16 d/dmin values (DAZ edge case)
    printf("T4: Subnormal fp16 d/dmin values ... ");
    {
        uint8_t row[BLOCKS_PER_ROW * Q4_K_BYTES];
        uint8_t headers[BLOCKS_PER_ROW * HDR_BYTES];
        uint32_t nib_even[128], nib_odd[128];
        int8_t x[BLOCKS_PER_ROW * NIBBLES_PER_BLOCK];

        memset(row, 0, sizeof(row));
        memset(x, 0, sizeof(x));

        // Block 0: subnormal d value (exp=0, mant≠0)
        row[0] = 0x01; row[1] = 0x00;  // fp16 = 2^-24 (very small subnormal)
        row[2] = 0x00; row[3] = 0x00;  // dmin = 0

        // sc6 all = 1, mn6 all = 0
        for (int s = 0; s < 4; s++) {
            row[4 + s] = 1;  // sc6=1
            row[8 + s] = 0;  // mn6=0
        }

        // One nibble active: block 0, element 0, nibble = 1
        row[16] = 0x01;  // nibbles 0 = 1, nibble 1 = 0

        // x[0] = 1
        x[0] = 1;
        float x_scale = 1.0f;

        float ref = q4k_row_dot_ref(row, x, x_scale);
        transpose_q4k_to_urm(row, headers, nib_even, nib_odd);
        float got = urm_row_dot(headers, nib_even, nib_odd, x, x_scale);

        if (ref == got) {
            printf("PASS  (subnormal, ref=%.8e)\n", ref);
            passed++;
        } else {
            printf("FAIL  ref=%.8e got=%.8e\n", ref, got);
        }
        tests++;
    }

    // Test 5: Verify header decode — sc6 and mn6 interleaved → flat round-trip
    printf("T5: Header decode (sc6/mn6 interleaved → flat) round-trip ... ");
    {
        uint8_t row[BLOCKS_PER_ROW * Q4_K_BYTES];
        uint8_t headers[BLOCKS_PER_ROW * HDR_BYTES];
        uint32_t nib_even[128], nib_odd[128];

        fill_random_q4k_row(row, 789);
        transpose_q4k_to_urm(row, headers, nib_even, nib_odd);

        int mismatches = 0;
        for (int b = 0; b < BLOCKS_PER_ROW && mismatches == 0; b++) {
            const uint8_t *block = row + b * Q4_K_BYTES;
            const uint8_t *hdr   = headers + b * HDR_BYTES;

            // Check d/dmin
            if (hdr[0] != block[0] || hdr[1] != block[1] ||
                hdr[2] != block[2] || hdr[3] != block[3]) {
                mismatches = 1;
                break;
            }

            // Check sc6 and mn6
            for (int s = 0; s < SUB_BLOCKS; s++) {
                if ((uint8_t)hdr[4 + s]  != q4k_sc6(block, s) ||
                    (uint8_t)hdr[12 + s] != q4k_mn6(block, s)) {
                    mismatches = 1;
                    break;
                }
            }
        }
        if (mismatches == 0) {
            printf("PASS  (all headers correct)\n");
            passed++;
        } else {
            printf("FAIL  (header mismatch)\n");
        }
        tests++;
    }

    printf("\n=== Results: %d/%d tests passed ===\n", passed, tests);
    return (passed == tests) ? 0 : 1;
}
