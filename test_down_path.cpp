// test_down_path.cpp — Isolate output load + MAC with known nibble data.
// Compile manually in Vitis HLS C-sim environment or with:
//   g++ -I<vitis>/include -std=c++14 test_down_path.cpp
// Run standalone to verify output wide-BRAM correctness.

#include <stdint.h>
#include <stdio.h>
#include <ap_int.h>
#include <ap_fixed.h>

typedef ap_fixed<32,8>  fxd_scale_t;
typedef ap_fixed<56,38> fxd_accum_t;

#define VECTOR_DIM 2048
#define FFN_DIM 8192
#define WV_BLOCKS_PER_ROW 8
#define DOWN_BLOCKS_PER_ROW 32
#define WV_ROW_WORDS 80
#define DOWN_Q4K_WORDS 320
#define URM_HDR_BYTES 32
#define URM_DOWN_HDR_WORDS 64
#define URM_NIB_ELEMS 256

// --- Copy of the output load function ---
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

static void load_4_rows_down_urm(const ap_uint<128> *Wd_wide, int out_i,
                                  ap_uint<128> nib_r0[256], float  d0[32], float  dmin0[32], int8_t sc60[32][8], int8_t mn60[32][8],
                                  ap_uint<128> nib_r1[256], float  d1[32], float  dmin1[32], int8_t sc61[32][8], int8_t mn61[32][8],
                                  ap_uint<128> nib_r2[256], float  d2[32], float  dmin2[32], int8_t sc62[32][8], int8_t mn62[32][8],
                                  ap_uint<128> nib_r3[256], float  d3[32], float  dmin3[32], int8_t sc63[32][8], int8_t mn63[32][8]) {
    const ap_uint<64> base = (ap_uint<64>)out_i * DOWN_Q4K_WORDS;

    HDR_ALL_DOWN: for (int b = 0; b < 128; b++) {
        int r = b >> 5;
        int blk = b & 31;
        ap_uint<128> w0 = Wd_wide[base + (ap_uint<64>)r * 320 + blk * 2];
        ap_uint<128> w1 = Wd_wide[base + (ap_uint<64>)r * 320 + blk * 2 + 1];
        uint16_t d_raw = (uint16_t)w0.range(15, 0), dmin_raw = (uint16_t)w0.range(31, 16);
        float dv = fp16_to_fp32(d_raw), dmv = fp16_to_fp32(dmin_raw);
        int8_t sc_tmp[8], mn_tmp[8];
        for (int i = 0; i < 4; i++) {
            sc_tmp[i] = (int8_t)(uint8_t)w0.range(32 + i*8 + 7, 32 + i*8);
            mn_tmp[i] = (int8_t)(uint8_t)w0.range(64 + i*8 + 7, 64 + i*8);
        }
        for (int i = 4; i < 8; i++) {
            int j = i - 4;
            sc_tmp[i] = (int8_t)(uint8_t)w1.range(j*8 + 7, j*8);
            mn_tmp[i] = (int8_t)(uint8_t)w1.range(32 + j*8 + 7, 32 + j*8);
        }
        if (r == 0)      { d0[blk]=dv; dmin0[blk]=dmv; for(int i=0;i<8;i++){sc60[blk][i]=sc_tmp[i];mn60[blk][i]=mn_tmp[i];} }
        else if (r == 1) { d1[blk]=dv; dmin1[blk]=dmv; for(int i=0;i<8;i++){sc61[blk][i]=sc_tmp[i];mn61[blk][i]=mn_tmp[i];} }
        else if (r == 2) { d2[blk]=dv; dmin2[blk]=dmv; for(int i=0;i<8;i++){sc62[blk][i]=sc_tmp[i];mn62[blk][i]=mn_tmp[i];} }
        else             { d3[blk]=dv; dmin3[blk]=dmv; for(int i=0;i<8;i++){sc63[blk][i]=sc_tmp[i];mn63[blk][i]=mn_tmp[i];} }
    }

    NIB_ALL_DOWN: for (int i = 0; i < 1024; i++) {
        int r = i >> 8;
        int e = i & 255;
        ap_uint<128> ddr = Wd_wide[base + 64 + (ap_uint<64>)r * 320 + e];
        if      (r == 0) nib_r0[e] = ddr;
        else if (r == 1) nib_r1[e] = ddr;
        else if (r == 2) nib_r2[e] = ddr;
        else             nib_r3[e] = ddr;
    }
}

int main() {
    printf("=== Output Path Standalone Test ===\n");

    // Create a DDR buffer: 4 rows × 320 words each
    ap_uint<128> Wd_buf[4 * 320];
    for (int i = 0; i < 4 * 320; i++) Wd_buf[i] = 0;

    // Fill known nibble data for rows 0-3
    // Row layout: 64 headers, 256 nibbles
    // Each nibble DDR word: g0[31:0] | g1[63:32] | g2[95:64] | g3[127:96]
    // Set element 1 (nibble word at index 64+1=65) to known values
    for (int r = 0; r < 4; r++) {
        int nib_start = r * 320 + 64;  // first nibble DDR word of row r

        // Element 0: all groups = 0xAAAAAAAA (each block nibble = 0xA)
        ap_uint<128> e0;
        e0.range(31,  0)  = 0xAAAAAAAAu;
        e0.range(63,  32) = 0xBBBBBBBBu;
        e0.range(95,  64) = 0xCCCCCCCCu;
        e0.range(127, 96) = 0xDDDDDDDDu;
        Wd_buf[nib_start + 0] = e0;

        // Element 1: all groups = known distinct values
        ap_uint<128> e1;
        e1.range(31,  0)  = 0x11111111u;
        e1.range(63,  32) = 0x22222222u;
        e1.range(95,  64) = 0x33333333u;
        e1.range(127, 96) = 0x44444444u;
        Wd_buf[nib_start + 1] = e1;

        // Set header d/dmin: d = 0x3C00 (fp16 1.0), dmin = 0
        for (int b = 0; b < 32; b++) {
            Wd_buf[r * 320 + b * 2].range(15, 0) = 0x3C00;  // d = 1.0
            Wd_buf[r * 320 + b * 2].range(31, 16) = 0;       // dmin = 0
        }

        // Set sc6 = 1, mn6 = 0 for all blocks
        for (int b = 0; b < 32; b++) {
            Wd_buf[r * 320 + b * 2].range(39, 32) = 1;   // sc6[0]
            Wd_buf[r * 320 + b * 2].range(47, 40) = 1;   // sc6[1]
            Wd_buf[r * 320 + b * 2].range(55, 48) = 1;   // sc6[2]
            Wd_buf[r * 320 + b * 2].range(63, 56) = 1;   // sc6[3]
        }
    }

    // Allocate BRAM arrays
    ap_uint<128> nib_r0[256], nib_r1[256], nib_r2[256], nib_r3[256];
    float  d0[32], dmin0[32], d1[32], dmin1[32], d2[32], dmin2[32], d3[32], dmin3[32];
    int8_t sc60[32][8], mn60[32][8], sc61[32][8], mn61[32][8];
    int8_t sc62[32][8], mn62[32][8], sc63[32][8], mn63[32][8];

    // Clear nib arrays (uninitialized in real HLS)
    for (int i = 0; i < 256; i++) {
        nib_r0[i] = 0; nib_r1[i] = 0; nib_r2[i] = 0; nib_r3[i] = 0;
    }

    // Call the load function for out_i=0
    load_4_rows_down_urm(Wd_buf, 0,
        nib_r0, d0, dmin0, sc60, mn60,
        nib_r1, d1, dmin1, sc61, mn61,
        nib_r2, d2, dmin2, sc62, mn62,
        nib_r3, d3, dmin3, sc63, mn63);

    // Verify element 0
    printf("Row 0, element 0: %08X_%08X_%08X_%08X  (exp: AAAAAAAA_BBBBBBBB_CCCCCCCC_DDDDDDDD)\n",
        (unsigned)nib_r0[0].range(127,96), (unsigned)nib_r0[0].range(95,64),
        (unsigned)nib_r0[0].range(63,32),  (unsigned)nib_r0[0].range(31,0));

    printf("Row 1, element 0: %08X_%08X_%08X_%08X  (exp: AAAAAAAA_BBBBBBBB_CCCCCCCC_DDDDDDDD)\n",
        (unsigned)nib_r1[0].range(127,96), (unsigned)nib_r1[0].range(95,64),
        (unsigned)nib_r1[0].range(63,32),  (unsigned)nib_r1[0].range(31,0));

    // Verify element 1
    printf("Row 0, element 1: %08X_%08X_%08X_%08X  (exp: 44444444_33333333_22222222_11111111)\n",
        (unsigned)nib_r0[1].range(127,96), (unsigned)nib_r0[1].range(95,64),
        (unsigned)nib_r0[1].range(63,32),  (unsigned)nib_r0[1].range(31,0));

    // Check for errors
    int errors = 0;
    for (int r = 0; r < 4; r++) {
        ap_uint<128> *nib = (r == 0) ? nib_r0 : (r == 1) ? nib_r1 : (r == 2) ? nib_r2 : nib_r3;
        uint32_t e0_g0 = (uint32_t)nib[0].range(31, 0);
        uint32_t e0_g3 = (uint32_t)nib[0].range(127, 96);
        uint32_t e1_g1 = (uint32_t)nib[1].range(63, 32);
        uint32_t e1_g2 = (uint32_t)nib[1].range(95, 64);

        if (e0_g0 != 0xAAAAAAAAu) { printf("FAIL row %d e0 g0: got 0x%08X\n", r, e0_g0); errors++; }
        if (e0_g3 != 0xDDDDDDDDu) { printf("FAIL row %d e0 g3: got 0x%08X\n", r, e0_g3); errors++; }
        if (e1_g1 != 0x22222222u) { printf("FAIL row %d e1 g1: got 0x%08X\n", r, e1_g1); errors++; }
        if (e1_g2 != 0x33333333u) { printf("FAIL row %d e1 g2: got 0x%08X\n", r, e1_g2); errors++; }
    }

    printf("\n=== Result: %d errors ===\n", errors);
    return errors;
}
