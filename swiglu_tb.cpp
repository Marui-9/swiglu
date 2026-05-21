// swiglu_tb.cpp — C-simulation testbench for Q4_0 K=8 merged-load swiglu().
//
// Tests validate the Q4_0 pre-decode + FPGA IP numerical correctness.
// All weight data is generated as Q4_0 blocks, transposed to the element-major
// DDR layout that the HLS IP expects, then processed through swiglu().
// Reference: brute-force float MAC matching the Q4_0 dequant formula.

#include "swiglu.h"
#include "sigmoid_lut.h"
#include <iostream>
#include <cmath>
#include <cstdint>
#include <cstring>

#define VECTOR_DIM         2048
#define FFN_DIM            8192
#define Q40_BLK_BYTES      18
#define Q40_VALS_PER_BLOCK 32
#define Q40_WV_BLOCKS      64
#define Q40_WV_GROUPS      8
#define Q40_DOWN_BLOCKS    256
#define Q40_DOWN_GROUPS    32
#define Q40_DOWN_MG        8
#define Q40_WV_ROW_BYTES   1280    // 80 × 16
#define Q40_DOWN_ROW_BYTES 5120    // 320 × 16
#define Q40_WV_HDR_WORDS   16
#define Q40_WV_NIB_WORDS   64
#define Q40_WV_ROW_WORDS   80
#define Q40_DOWN_HDR_WORDS 64
#define Q40_DOWN_NIB_WORDS 256
#define Q40_DOWN_ROW_WORDS 320

#define X12_INV_SCALE   (127.0f / 10.0f)
#define X12_QUANT_SCALE (10.0f  / 127.0f)

using namespace std;

// ─── Global weight buffers ──────────────────────────────────────────────────
// Raw Q4_0 weights for reference computation
static uint8_t W_raw  [FFN_DIM    * Q40_WV_BLOCKS   * Q40_BLK_BYTES]; // 9.0 MB
static uint8_t V_raw  [FFN_DIM    * Q40_WV_BLOCKS   * Q40_BLK_BYTES]; // 9.0 MB
static uint8_t Wd_raw [VECTOR_DIM * Q40_DOWN_BLOCKS * Q40_BLK_BYTES]; // 9.0 MB

// Pre-decoded element-major DDR buffers for the HLS IP
static uint8_t W_urm  [FFN_DIM    * Q40_WV_ROW_BYTES];     // 10.0 MB
static uint8_t V_urm  [FFN_DIM    * Q40_WV_ROW_BYTES];     // 10.0 MB
static uint8_t Wd_urm [VECTOR_DIM * Q40_DOWN_ROW_BYTES];   // 10.0 MB

static int8_t  x_batch_buf [MAX_BATCH * VECTOR_DIM];
static float   out_batch_buf[MAX_BATCH * VECTOR_DIM];

// Reference intermediate arrays
static float X1_ref  [MAX_BATCH][FFN_DIM];
static float X2_ref  [MAX_BATCH][FFN_DIM];
static float gate_ref[MAX_BATCH][FFN_DIM];
static float expected[MAX_BATCH][VECTOR_DIM];

// ============================================================================
// fp16 reference — matches the FPGA fp16_to_fp32 implementation.
// ============================================================================
static float fp16_to_fp32_ref(uint16_t h) {
    uint32_t sign = ((uint32_t)(h >> 15)) << 31;
    uint32_t exp  = (h >> 10) & 0x1F;
    uint32_t mant = (uint32_t)(h & 0x3FF);
    uint32_t f32;
    if (exp == 0 && mant == 0) {
        f32 = sign;
    } else if (exp == 0) {
        uint32_t m = mant, e = 112;
        for (int i = 0; i < 10; i++) { if (!(m & 0x200)) { m <<= 1; e--; } }
        f32 = sign | (e << 23) | ((m & 0x1FF) << 14);
    } else if (exp == 31) {
        f32 = sign | 0x7F800000 | (mant << 13);
    } else {
        f32 = sign | ((exp + 112) << 23) | (mant << 13);
    }
    union { uint32_t u; float f; } c; c.u = f32; return c.f;
}

// ============================================================================
// Q4_0 block fill: random d (fp16) and random nibbles.
// ============================================================================
static void fill_q40_block(uint8_t *blk, uint16_t d_fp16, const uint8_t nibbles[32]) {
    blk[0] = (uint8_t)(d_fp16 & 0xFF);
    blk[1] = (uint8_t)(d_fp16 >> 8);
    for (int i = 0; i < 16; i++) {
        blk[2 + i] = (nibbles[i*2] & 0xF) | ((nibbles[i*2+1] & 0xF) << 4);
    }
}

// ============================================================================
// Q4_0 reference dot product: sum over elements of d * (q_i - 8) * x_i
// ============================================================================
static float q40_dot_ref(const uint8_t *row_data, const float *x_vec, int n_vals) {
    int n_blocks = n_vals / Q40_VALS_PER_BLOCK;
    float sum = 0.f;
    for (int b = 0; b < n_blocks; b++) {
        const uint8_t *blk = row_data + (size_t)b * Q40_BLK_BYTES;
        uint16_t d_fp16 = (uint16_t)blk[0] | ((uint16_t)blk[1] << 8);
        float d = fp16_to_fp32_ref(d_fp16);
        float acc = 0.f;
        for (int j = 0; j < Q40_VALS_PER_BLOCK; j++) {
            int byte_off = 2 + (j >> 1);
            int shift = (j & 1) * 4;
            int q = (blk[byte_off] >> shift) & 0xF;
            acc += x_vec[b * Q40_VALS_PER_BLOCK + j] * (q - 8);
        }
        sum += d * acc;
    }
    return sum;
}

// ============================================================================
// Pre-decode transpose — matches transpose_q40_to_urm() in ggml-cpu.c exactly.
// ============================================================================
static void transpose_q40_to_urm_csim(const uint8_t *src, uint8_t *dst,
                                       int n_rows, int blocks_per_row) {
    const int src_block_bytes = Q40_BLK_BYTES;
    const int groups = blocks_per_row / 8;
    const int row_hdr = blocks_per_row * 4;   // fp32 d per row
    const int row_nib = 32 * groups * 4;
    const int row_stride = row_hdr + row_nib;

    for (int row = 0; row < n_rows; row++) {
        uint8_t *hdr_base = dst + (size_t)row * row_stride;
        for (int b = 0; b < blocks_per_row; b++) {
            const uint8_t *blk = src + ((size_t)row * blocks_per_row + b) * src_block_bytes;
            uint16_t d_fp16 = (uint16_t)blk[0] | ((uint16_t)blk[1] << 8);
            float d_fp32 = fp16_to_fp32_ref(d_fp16);
            uint32_t d_bits;
            memcpy(&d_bits, &d_fp32, 4);
            uint32_t *ddr32 = (uint32_t *)(hdr_base + (size_t)(b >> 2) * 16);
            ddr32[b & 3] = d_bits;
        }

        uint8_t *nib_base = dst + (size_t)row * row_stride + (size_t)row_hdr;

        if (groups <= 8) {
            // WV: 8 groups, 4 element-slices per DDR word
            for (int g = 0; g < groups; g++) {
                for (int n = 0; n < 32; n++) {
                    uint32_t nib32 = 0;
                    for (int b = 0; b < 8; b++) {
                        const uint8_t *blk = src + ((size_t)row * blocks_per_row
                                                    + (size_t)g * 8 + (size_t)b) * src_block_bytes;
                        int byte_off = 2 + (n >> 1);
                        int shift    = (n & 1) * 4;
                        uint32_t nib = (blk[byte_off] >> shift) & 0xF;
                        nib32 |= (nib << (b * 4));
                    }
                    int e = n >> 2, s = n & 3;
                    uint32_t *ddr32 = (uint32_t *)(nib_base
                        + ((size_t)g * 8 + (size_t)e) * 16);
                    ddr32[s] = nib32;
                }
            }
        } else {
            // Output: 32 groups, 8 meta-groups of 4
            for (int mg = 0; mg < Q40_DOWN_MG; mg++) {
                for (int n = 0; n < 32; n++) {
                    uint32_t nib32[4] = {0, 0, 0, 0};
                    for (int k = 0; k < 4; k++) {
                        int g = mg * 4 + k;
                        for (int b = 0; b < 8; b++) {
                            const uint8_t *blk = src + ((size_t)row * blocks_per_row
                                                        + (size_t)g * 8 + (size_t)b) * src_block_bytes;
                            int byte_off = 2 + (n >> 1);
                            int shift    = (n & 1) * 4;
                            uint32_t nib = (blk[byte_off] >> shift) & 0xF;
                            nib32[k] |= (nib << (b * 4));
                        }
                    }
                    uint32_t *ddr32 = (uint32_t *)(nib_base
                        + ((size_t)mg * 32 + (size_t)n) * 16);
                    ddr32[0] = nib32[0]; ddr32[1] = nib32[1];
                    ddr32[2] = nib32[2]; ddr32[3] = nib32[3];
                }
            }
        }
    }
}

// ============================================================================
// Reference SiLU gate
// ============================================================================
static float sigmoid_ref(float x) {
    return 1.0f / (1.0f + expf(-x));
}

// ============================================================================
// Test runner
// ============================================================================
static int run_test(const char *name, int n_tokens,
                    float x_scale, bool subnormal_fp16,
                    float tol_rel, float tol_abs) {
    cout << "  Test " << name << " ... " << flush;

    // Build x batch from random float → INT8 quant
    for (int tok = 0; tok < n_tokens; tok++) {
        float max_abs = 0.f;
        for (int j = 0; j < VECTOR_DIM; j++) {
            // Small x range [-0.01, 0.01] to keep X1/X2 within INT8 quant range
            // (X12_SCALE_RANGE=10.0) given 64-block Q4_0 accumulation.
            float v = (float)(rand() % 2001 - 1000) / 100000.f;
            if (v < 0 ? -v > max_abs : v > max_abs) max_abs = v < 0 ? -v : v;
            float xf = v / x_scale;
            int iq = (int)(xf + (xf >= 0.f ? 0.5f : -0.5f));
            if (iq >  127) iq =  127;
            if (iq < -128) iq = -128;
            x_batch_buf[tok * VECTOR_DIM + j] = (int8_t)iq;
        }
    }

    // Reference: FP32 brute-force MAC
    for (int tok = 0; tok < n_tokens; tok++) {
        // Build full fp32 x vector from INT8 quantized values
        float x_fp32[VECTOR_DIM];
        for (int j = 0; j < VECTOR_DIM; j++) {
            x_fp32[j] = (float)x_batch_buf[tok * VECTOR_DIM + j] * x_scale;
        }

        // X1_ref[r] = dot(W_gate_row_r, x)
        for (int r = 0; r < FFN_DIM; r++) {
            X1_ref[tok][r] = q40_dot_ref(W_raw + (size_t)r * Q40_WV_BLOCKS * Q40_BLK_BYTES,
                                         x_fp32, VECTOR_DIM);
        }
        // X2_ref[r] = dot(W_up_row_r, x)
        for (int r = 0; r < FFN_DIM; r++) {
            X2_ref[tok][r] = q40_dot_ref(V_raw + (size_t)r * Q40_WV_BLOCKS * Q40_BLK_BYTES,
                                         x_fp32, VECTOR_DIM);
        }
        // Gate = SiLU(X1) * X2
        for (int r = 0; r < FFN_DIM; r++) {
            float silu = X1_ref[tok][r] * sigmoid_ref(X1_ref[tok][r]);
            gate_ref[tok][r] = silu * X2_ref[tok][r];
        }
        // Output[j] = dot(W_down_row_j, gate)
        for (int j = 0; j < VECTOR_DIM; j++) {
            expected[tok][j] = q40_dot_ref(Wd_raw + (size_t)j * Q40_DOWN_BLOCKS * Q40_BLK_BYTES,
                                           gate_ref[tok], FFN_DIM);
        }
    }

    // Transpose to URM DDR layout
    transpose_q40_to_urm_csim(W_raw,  W_urm,  FFN_DIM,     Q40_WV_BLOCKS);
    transpose_q40_to_urm_csim(V_raw,  V_urm,  FFN_DIM,     Q40_WV_BLOCKS);
    transpose_q40_to_urm_csim(Wd_raw, Wd_urm, VECTOR_DIM,  Q40_DOWN_BLOCKS);

    // Call HLS IP
    swiglu(W_urm, V_urm, Wd_urm, x_batch_buf, out_batch_buf, 0, x_scale);

    // Compare
    float max_err = 0.f;
    for (int tok = 0; tok < n_tokens; tok++) {
        for (int j = 0; j < VECTOR_DIM; j++) {
            float err = fabsf(out_batch_buf[tok * VECTOR_DIM + j] - expected[tok][j]);
            if (err > max_err) max_err = err;
        }
    }

    cout << "max_err=" << max_err;
    if (max_err < tol_abs || max_err < tol_rel) {
        cout << "  PASS" << endl;
        return 0;
    } else {
        cout << "  FAIL (tol abs=" << tol_abs << " rel=" << tol_rel << ")" << endl;
        return 1;
    }
}

// ============================================================================
// main
// ============================================================================
int main() {
    cout << "swiglu Q4_0 K=8 C-simulation Testbench" << endl;
    cout << "======================================" << endl;

    // ── Generate weight data ──────────────────────────────────────────────
    srand(42);

    // Fill Q4_0 weight blocks with random values
    for (int r = 0; r < FFN_DIM; r++) {
        for (int b = 0; b < Q40_WV_BLOCKS; b++) {
            uint8_t nibbles[32];
            for (int j = 0; j < 32; j++) nibbles[j] = rand() & 0xF;
            // Realistic fp16 d: exp in [1..10] → values [~6e-5, ~0.06].
            // This prevents fixed-point accumulator overflow (fxd_accum_t range ±131K)
            // while still providing meaningful non-zero test values.
            uint16_t d_fp16 = (uint16_t)((rand() % 10 + 1) << 10) | (uint16_t)(rand() & 0x3FF);
            fill_q40_block(W_raw + ((size_t)r * Q40_WV_BLOCKS + b) * Q40_BLK_BYTES,
                          d_fp16, nibbles);
        }
    }
    for (int r = 0; r < FFN_DIM; r++) {
        for (int b = 0; b < Q40_WV_BLOCKS; b++) {
            uint8_t nibbles[32];
            for (int j = 0; j < 32; j++) nibbles[j] = rand() & 0xF;
            uint16_t d_fp16 = (uint16_t)((rand() % 10 + 1) << 10) | (uint16_t)(rand() & 0x3FF);
            fill_q40_block(V_raw + ((size_t)r * Q40_WV_BLOCKS + b) * Q40_BLK_BYTES,
                          d_fp16, nibbles);
        }
    }
    for (int r = 0; r < VECTOR_DIM; r++) {
        for (int b = 0; b < Q40_DOWN_BLOCKS; b++) {
            uint8_t nibbles[32];
            for (int j = 0; j < 32; j++) nibbles[j] = rand() & 0xF;
            uint16_t d_fp16 = (uint16_t)((rand() % 10 + 1) << 10) | (uint16_t)(rand() & 0x3FF);
            fill_q40_block(Wd_raw + ((size_t)r * Q40_DOWN_BLOCKS + b) * Q40_BLK_BYTES,
                          d_fp16, nibbles);
        }
    }

    int failures = 0;

    // T1: Normal fp16 scales (exp != 0), x_scale = 0.0001
    failures += run_test("T1 (normal fp16, x_scale=1e-4)",  1, 1e-4f, false, 0.3f, 1e-3f);

    // T2: Subnormal fp16 scales (exp == 0, mant != 0)
    // Rebuild weights with subnormal d values
    for (int r = 0; r < FFN_DIM; r++) {
        for (int b = 0; b < Q40_WV_BLOCKS; b++) {
            uint8_t nibbles[32];
            for (int j = 0; j < 32; j++) nibbles[j] = rand() & 0xF;
            uint16_t d_fp16 = (uint16_t)(rand() & 0x3FF);  // exp=0, subnormal
            fill_q40_block(W_raw + ((size_t)r * Q40_WV_BLOCKS + b) * Q40_BLK_BYTES,
                          d_fp16, nibbles);
        }
    }
    for (int r = 0; r < FFN_DIM; r++) {
        for (int b = 0; b < Q40_WV_BLOCKS; b++) {
            uint8_t nibbles[32];
            for (int j = 0; j < 32; j++) nibbles[j] = rand() & 0xF;
            uint16_t d_fp16 = (uint16_t)(rand() & 0x3FF);
            fill_q40_block(V_raw + ((size_t)r * Q40_WV_BLOCKS + b) * Q40_BLK_BYTES,
                          d_fp16, nibbles);
        }
    }
    for (int r = 0; r < VECTOR_DIM; r++) {
        for (int b = 0; b < Q40_DOWN_BLOCKS; b++) {
            uint8_t nibbles[32];
            for (int j = 0; j < 32; j++) nibbles[j] = rand() & 0xF;
            uint16_t d_fp16 = (uint16_t)(rand() & 0x3FF);
            fill_q40_block(Wd_raw + ((size_t)r * Q40_DOWN_BLOCKS + b) * Q40_BLK_BYTES,
                          d_fp16, nibbles);
        }
    }
    failures += run_test("T2 (subnormal fp16, x_scale=1e-4)", 1, 1e-4f, true, 0.3f, 1e-3f);

    // T3: All-zero weights
    memset(W_raw,  0, sizeof(W_raw));
    memset(V_raw,  0, sizeof(V_raw));
    memset(Wd_raw, 0, sizeof(Wd_raw));
    failures += run_test("T3 (all-zero weights)",             1, 1e-4f, false, 0.0f, 1e-6f);

    // T4: Single non-zero value
    memset(W_raw,  0, sizeof(W_raw));
    memset(V_raw,  0, sizeof(V_raw));
    memset(Wd_raw, 0, sizeof(Wd_raw));
    {
        uint8_t nibbles[32] = {0};
        nibbles[0] = 5;  // q_0 = 5 → q_0 - 8 = -3
        fill_q40_block(W_raw, 0x3C00, nibbles);  // d = 1.0 (fp16 0x3C00)

        uint8_t v_nibbles[32] = {0};
        v_nibbles[0] = 3;  // q_0 = 3 → q_0 - 8 = -5
        fill_q40_block(V_raw, 0x4000, v_nibbles);  // d = 2.0 (fp16 0x4000)

        uint8_t wd_nibbles[32] = {0};
        wd_nibbles[0] = 2;  // q_0 = 2 → q_0 - 8 = -6
        fill_q40_block(Wd_raw, 0x4200, wd_nibbles);  // d = 3.0 (fp16 0x4200)
    }
    failures += run_test("T4 (single non-zero)",             1, 1e-4f, false, 0.3f, 1e-3f);

    // T5: Random weights with small x_scale
    srand(12345);
    for (int r = 0; r < FFN_DIM; r++) {
        for (int b = 0; b < Q40_WV_BLOCKS; b++) {
            uint8_t nibbles[32];
            for (int j = 0; j < 32; j++) nibbles[j] = rand() & 0xF;
            uint16_t d_fp16 = (uint16_t)((rand() % 10 + 1) << 10) | (uint16_t)(rand() & 0x3FF);
            fill_q40_block(W_raw + ((size_t)r * Q40_WV_BLOCKS + b) * Q40_BLK_BYTES,
                          d_fp16, nibbles);
        }
    }
    for (int r = 0; r < FFN_DIM; r++) {
        for (int b = 0; b < Q40_WV_BLOCKS; b++) {
            uint8_t nibbles[32];
            for (int j = 0; j < 32; j++) nibbles[j] = rand() & 0xF;
            uint16_t d_fp16 = (uint16_t)((rand() % 10 + 1) << 10) | (uint16_t)(rand() & 0x3FF);
            fill_q40_block(V_raw + ((size_t)r * Q40_WV_BLOCKS + b) * Q40_BLK_BYTES,
                          d_fp16, nibbles);
        }
    }
    for (int r = 0; r < VECTOR_DIM; r++) {
        for (int b = 0; b < Q40_DOWN_BLOCKS; b++) {
            uint8_t nibbles[32];
            for (int j = 0; j < 32; j++) nibbles[j] = rand() & 0xF;
            uint16_t d_fp16 = (uint16_t)((rand() % 10 + 1) << 10) | (uint16_t)(rand() & 0x3FF);
            fill_q40_block(Wd_raw + ((size_t)r * Q40_DOWN_BLOCKS + b) * Q40_BLK_BYTES,
                          d_fp16, nibbles);
        }
    }
    failures += run_test("T5 (random, x_scale=1e-3)",        1, 1e-3f, false, 0.3f, 1e-3f);

    cout << "======================================" << endl;
    if (failures == 0) {
        cout << "ALL TESTS PASSED" << endl;
        return 0;
    } else {
        cout << failures << " TEST(S) FAILED" << endl;
        return 1;
    }
}
