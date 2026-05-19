#include "swiglu.h"
#include "sigmoid_lut.h"
#include <stdint.h>
#include <string.h>
#include <ap_int.h>
#include <ap_fixed.h>
// ─── Fixed-point types for DSP-mapped REDUCE loops ───────────────────────────
typedef ap_fixed<32,8>  fxd_scale_t;
typedef ap_fixed<56,38> fxd_accum_t;

// ─── Dimensions ──────────────────────────────────────────────────────────────
#define VECTOR_DIM           2048
#define FFN_DIM              8192

// ─── Quantisation block sizes ─────────────────────────────────────────────────
#define Q4_K_BYTES           144

// ─── Derived constants ────────────────────────────────────────────────────────
#define WV_BLOCKS_PER_ROW    8      // VECTOR_DIM / 256
#define DOWN_BLOCKS_PER_ROW  32     // FFN_DIM    / 256
#define WV_ROW_BYTES         (WV_BLOCKS_PER_ROW   * Q4_K_BYTES)   // 1152
#define DOWN_ROW_Q4K_BYTES   (DOWN_BLOCKS_PER_ROW * Q4_K_BYTES)   // 4608

// ─── URAM-transposed layout constants ─────────────────────────────────────────
// CPU pre-decodes Q4_K headers to flat sc6/mn6 and transposes nibbles:
//   on-chip URAM: nib_urm[n] = 32-bit word with nibbles for all 8 blocks
//   at element n in one group.  MAC extracts at compile-time .range() — 0 LUT.
// DDR row format (same total byte count as 160-byte/block hybrid):
//   Headers: blocks_per_row * 32 B  — block-major, d+dmin+sc6[8]+mn6[8]+pad
//   Nibbles: 256 * groups * 4 B     — element-major, 4 element-slices per DDR word

#define URM_HDR_BYTES        32     // d(2)+dmin(2)+sc6[8]+mn6[8]+pad(12)
#define URM_WV_GROUPS        (WV_BLOCKS_PER_ROW   / 8)   // 1
#define URM_DOWN_GROUPS      (DOWN_BLOCKS_PER_ROW / 8)   // 4

// DDR words per row (totals match hybrid: 80 WV, 320 down)
#define URM_WV_HDR_WORDS     ((WV_BLOCKS_PER_ROW   * URM_HDR_BYTES) / 16)  // 16
#define URM_DOWN_HDR_WORDS   ((DOWN_BLOCKS_PER_ROW * URM_HDR_BYTES) / 16)  // 64
#define URM_WV_NIB_WORDS     (URM_NIB_ELEMS / 4)                            // 64  (4 elem-slices/DDR word)
#define URM_DOWN_NIB_WORDS   (URM_NIB_ELEMS * URM_DOWN_GROUPS / 4)          // 256 (4 group-slices/DDR word)

// Per-row DDR word totals (WV: 16 hdr + 64 nib = 80. Down: 64 hdr + 256 nib = 320.)
#define WV_ROW_WORDS         (URM_WV_HDR_WORDS   + URM_WV_NIB_WORDS)        // 80
#define DOWN_Q4K_WORDS       (URM_DOWN_HDR_WORDS + URM_DOWN_NIB_WORDS)      // 320
// ─── INT8 quantisation scale for X1/X2 intermediate caches ───────────────────
#define X12_SCALE_RANGE  10.0f
#define X12_INV_SCALE    (127.0f / X12_SCALE_RANGE)   // 12.7f
#define X12_QUANT_SCALE  (X12_SCALE_RANGE / 127.0f)   // ~0.0787f

// ─── URAM nibble tile dimensions ──────────────────────────────────────────────
#define URM_NIB_ELEMS        256
// ─── fp16_to_fp32 ─────────────────────────────────────────────────────────────
static float fp16_to_fp32(uint16_t h) {
#pragma HLS INLINE off
    uint32_t sign = ((uint32_t)(h >> 15)) << 31;
    uint32_t exp  = (h >> 10) & 0x1F;
    uint32_t mant = (uint32_t)(h & 0x3FF);
    uint32_t f32;
    if (exp == 0 && mant == 0) {
        f32 = sign;
    } else if (exp == 0) {
        uint32_t m = mant, e = 112;
        for (int i = 0; i < 10; i++) {
            #pragma HLS UNROLL
            if (!(m & 0x200)) { m <<= 1; e--; }
        }
        f32 = sign | (e << 23) | ((m & 0x1FF) << 14);
    } else if (exp == 31) {
        f32 = sign | 0x7F800000 | (mant << 13);
    } else {
        f32 = sign | ((exp + 112) << 23) | (mant << 13);
    }
    union { uint32_t u; float f; } c; c.u = f32; return c.f;
}

// ─── Byte extractor for 128-bit packed data (Q6K path only) ───────────────────
static inline uint8_t get_byte(const ap_uint<128>* data, int byte_idx) {
#pragma HLS INLINE
    return (uint8_t)data[byte_idx >> 4].range((byte_idx & 0xF) * 8 + 7,
                                               (byte_idx & 0xF) * 8);
}

// ============================================================================
// URAM-transposed load functions
// ============================================================================

// load_4_rows_wv_urm: one DDR burst → 2 pipeline instances (HDR + NIB).
// Single header loop (32 blocks) and single nibble loop (256 words)
// minimize pipeline initialization overhead.  Guaranteed II=1 on nibble writes.
static void load_4_rows_wv_urm(const ap_uint<128> *W_wide, int row,
                                ap_uint<128> nib_r0[64], float  d0[8], float  dmin0[8], int8_t sc60[8][8], int8_t mn60[8][8],
                                ap_uint<128> nib_r1[64], float  d1[8], float  dmin1[8], int8_t sc61[8][8], int8_t mn61[8][8],
                                ap_uint<128> nib_r2[64], float  d2[8], float  dmin2[8], int8_t sc62[8][8], int8_t mn62[8][8],
                                ap_uint<128> nib_r3[64], float  d3[8], float  dmin3[8], int8_t sc63[8][8], int8_t mn63[8][8]) {
#pragma HLS INLINE off
    const ap_uint<64> base = (ap_uint<64>)row * WV_ROW_WORDS;

    // ── Headers: 32 blocks (4 rows × 8), single pipeline ────────────────────
    HDR_ALL: for (int b = 0; b < 32; b++) {
        #pragma HLS PIPELINE II=1
        int r = b >> 3;
        int blk = b & 7;
        ap_uint<128> w0 = W_wide[base + (ap_uint<64>)r * 80 + blk * 2];
        ap_uint<128> w1 = W_wide[base + (ap_uint<64>)r * 80 + blk * 2 + 1];

        uint16_t d_raw    = (uint16_t)w0.range(15, 0);
        uint16_t dmin_raw = (uint16_t)w0.range(31, 16);
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
        // Route to correct row (small 4-way mux on write enable)
        if (r == 0) {
            d0[blk] = dv; dmin0[blk] = dmv;
            for (int i = 0; i < 8; i++) { sc60[blk][i] = sc_tmp[i]; mn60[blk][i] = mn_tmp[i]; }
        } else if (r == 1) {
            d1[blk] = dv; dmin1[blk] = dmv;
            for (int i = 0; i < 8; i++) { sc61[blk][i] = sc_tmp[i]; mn61[blk][i] = mn_tmp[i]; }
        } else if (r == 2) {
            d2[blk] = dv; dmin2[blk] = dmv;
            for (int i = 0; i < 8; i++) { sc62[blk][i] = sc_tmp[i]; mn62[blk][i] = mn_tmp[i]; }
        } else {
            d3[blk] = dv; dmin3[blk] = dmv;
            for (int i = 0; i < 8; i++) { sc63[blk][i] = sc_tmp[i]; mn63[blk][i] = mn_tmp[i]; }
        }
    }

    // ── Nibbles: 256 words (4 rows × 64), single pipeline, II=1 ────────────
    // Index i: row = i>>6, e = i&63.  DDR offset = 16 + row*80 + e.
    NIB_ALL: for (int i = 0; i < 256; i++) {
        #pragma HLS PIPELINE II=1
        int r = i >> 6;
        int e = i & 63;
        ap_uint<128> ddr = W_wide[base + 16 + (ap_uint<64>)r * 80 + e];
        // Route to correct row's BRAM
        if      (r == 0) nib_r0[e] = ddr;
        else if (r == 1) nib_r1[e] = ddr;
        else if (r == 2) nib_r2[e] = ddr;
        else             nib_r3[e] = ddr;
    }
}

// load_4_rows_down_urm: merged 4-row output load — one 1280-word DDR burst.
// 4 rows × (64 header + 256 nibble) words.  nib_bram is 128-bit: DDR words
// stored verbatim (all 4 groups packed), 1 write/cycle → guaranteed II=1.
static void load_4_rows_down_urm(const ap_uint<128> *Wd_wide, int out_i,
                                  ap_uint<128> nib_r0[256], float  d0[32], float  dmin0[32], int8_t sc60[32][8], int8_t mn60[32][8],
                                  ap_uint<128> nib_r1[256], float  d1[32], float  dmin1[32], int8_t sc61[32][8], int8_t mn61[32][8],
                                  ap_uint<128> nib_r2[256], float  d2[32], float  dmin2[32], int8_t sc62[32][8], int8_t mn62[32][8],
                                  ap_uint<128> nib_r3[256], float  d3[32], float  dmin3[32], int8_t sc63[32][8], int8_t mn63[32][8]) {
#pragma HLS INLINE off
    const ap_uint<64> base = (ap_uint<64>)out_i * DOWN_Q4K_WORDS;

    // ── Headers: 128 blocks (4 rows × 32), single pipeline ──────────────────
    HDR_ALL_DOWN: for (int b = 0; b < 128; b++) {
        #pragma HLS PIPELINE II=1
        int r = b >> 5;       // row 0..3 (32 blocks each)
        int blk = b & 31;     // block 0..31 within row
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
        if (r == 0)      { d0[blk] = dv; dmin0[blk] = dmv; for (int i=0;i<8;i++) {sc60[blk][i]=sc_tmp[i]; mn60[blk][i]=mn_tmp[i];} }
        else if (r == 1) { d1[blk] = dv; dmin1[blk] = dmv; for (int i=0;i<8;i++) {sc61[blk][i]=sc_tmp[i]; mn61[blk][i]=mn_tmp[i];} }
        else if (r == 2) { d2[blk] = dv; dmin2[blk] = dmv; for (int i=0;i<8;i++) {sc62[blk][i]=sc_tmp[i]; mn62[blk][i]=mn_tmp[i];} }
        else             { d3[blk] = dv; dmin3[blk] = dmv; for (int i=0;i<8;i++) {sc63[blk][i]=sc_tmp[i]; mn63[blk][i]=mn_tmp[i];} }
    }

    // ── Nibbles: 1024 words (4 rows × 256), single pipeline, II=1 ──────────
    NIB_ALL_DOWN: for (int i = 0; i < 1024; i++) {
        #pragma HLS PIPELINE II=1
        int r = i >> 8;        // row 0..3
        int e = i & 255;       // element 0..255
        ap_uint<128> ddr = Wd_wide[base + 64 + (ap_uint<64>)r * 320 + e];
        if      (r == 0) nib_r0[e] = ddr;
        else if (r == 1) nib_r1[e] = ddr;
        else if (r == 2) nib_r2[e] = ddr;
        else             nib_r3[e] = ddr;
    }
    #ifndef __SYNTHESIS__
    printf("[SZ] sizeof(ap128)=%zu  Wd_wide+64 byteoff=%zu  expect=%zu\n",
        sizeof(ap_uint<128>), (size_t)(Wd_wide + 64) - (size_t)Wd_wide, (size_t)64 * 16);
#endif

}

// ============================================================================
// MAC functions — URAM-transposed nibble access, K=4 parallelism
// ============================================================================

// mac_blocks_wv_k4_urm: 4 rows × 8 blocks, 32 parallel MACs.  K=4.
// nib_bram[idx] = 128-bit word = 4 element-slices (same as DDR word).
// Read nib_bram[n>>2], slice the (n&3)-th 32-bit slot → 4:1 mux (~32 LUT/row).
// Inner .range(b*4+3, b*4) is compile-time → 0 LUT.
static void mac_blocks_wv_k4_urm(
    const ap_uint<128> nib_r0[64],
    const ap_uint<128> nib_r1[64],
    const ap_uint<128> nib_r2[64],
    const ap_uint<128> nib_r3[64],
    const float   d0[WV_BLOCKS_PER_ROW], const float dmin0[WV_BLOCKS_PER_ROW],
    const float   d1[WV_BLOCKS_PER_ROW], const float dmin1[WV_BLOCKS_PER_ROW],
    const float   d2[WV_BLOCKS_PER_ROW], const float dmin2[WV_BLOCKS_PER_ROW],
    const float   d3[WV_BLOCKS_PER_ROW], const float dmin3[WV_BLOCKS_PER_ROW],
    const int8_t  sc60[WV_BLOCKS_PER_ROW][8], const int8_t mn60[WV_BLOCKS_PER_ROW][8],
    const int8_t  sc61[WV_BLOCKS_PER_ROW][8], const int8_t mn61[WV_BLOCKS_PER_ROW][8],
    const int8_t  sc62[WV_BLOCKS_PER_ROW][8], const int8_t mn62[WV_BLOCKS_PER_ROW][8],
    const int8_t  sc63[WV_BLOCKS_PER_ROW][8], const int8_t mn63[WV_BLOCKS_PER_ROW][8],
    const int8_t  x[WV_BLOCKS_PER_ROW][256],
    float  x_scale,
    float *result0, float *result1, float *result2, float *result3)
{
#pragma HLS INLINE off
#pragma HLS BIND_OP op=mul impl=dsp
#pragma HLS ARRAY_PARTITION variable=x dim=1 complete

    int32_t acc_w0[WV_BLOCKS_PER_ROW][4], acc_m0[WV_BLOCKS_PER_ROW][4];
    int32_t acc_w1[WV_BLOCKS_PER_ROW][4], acc_m1[WV_BLOCKS_PER_ROW][4];
    int32_t acc_w2[WV_BLOCKS_PER_ROW][4], acc_m2[WV_BLOCKS_PER_ROW][4];
    int32_t acc_w3[WV_BLOCKS_PER_ROW][4], acc_m3[WV_BLOCKS_PER_ROW][4];
    #pragma HLS ARRAY_PARTITION variable=acc_w0 dim=0 complete
    #pragma HLS ARRAY_PARTITION variable=acc_m0 dim=0 complete
    #pragma HLS ARRAY_PARTITION variable=acc_w1 dim=0 complete
    #pragma HLS ARRAY_PARTITION variable=acc_m1 dim=0 complete
    #pragma HLS ARRAY_PARTITION variable=acc_w2 dim=0 complete
    #pragma HLS ARRAY_PARTITION variable=acc_m2 dim=0 complete
    #pragma HLS ARRAY_PARTITION variable=acc_w3 dim=0 complete
    #pragma HLS ARRAY_PARTITION variable=acc_m3 dim=0 complete

    INIT: for (int b = 0; b < WV_BLOCKS_PER_ROW; b++) {
        #pragma HLS UNROLL
        for (int k = 0; k < 4; k++) {
            #pragma HLS UNROLL
            acc_w0[b][k] = 0; acc_m0[b][k] = 0;
            acc_w1[b][k] = 0; acc_m1[b][k] = 0;
            acc_w2[b][k] = 0; acc_m2[b][k] = 0;
            acc_w3[b][k] = 0; acc_m3[b][k] = 0;
        }
    }

    MAC_ALL: for (int n = 0; n < 256; n++) {
        #pragma HLS PIPELINE II=1
        int idx = n >> 2;          // BRAM index (same for 4 consecutive n)
        int s   = n & 3;           // slice selector (0..3)
        int sub = n >> 5;
        int k   = n & 3;

        // Read 128-bit word, slice the correct 32-bit slot — 4:1 mux
        ap_uint<128> w0 = nib_r0[idx];
        ap_uint<128> w1 = nib_r1[idx];
        ap_uint<128> w2 = nib_r2[idx];
        ap_uint<128> w3 = nib_r3[idx];

        ap_uint<32> wr0, wr1, wr2, wr3;
        if      (s == 0) { wr0 = w0.range(31,  0);  wr1 = w1.range(31,  0);  wr2 = w2.range(31,  0);  wr3 = w3.range(31,  0);  }
        else if (s == 1) { wr0 = w0.range(63,  32); wr1 = w1.range(63,  32); wr2 = w2.range(63,  32); wr3 = w3.range(63,  32); }
        else if (s == 2) { wr0 = w0.range(95,  64); wr1 = w1.range(95,  64); wr2 = w2.range(95,  64); wr3 = w3.range(95,  64); }
        else             { wr0 = w0.range(127, 96); wr1 = w1.range(127, 96); wr2 = w2.range(127, 96); wr3 = w3.range(127, 96); }

        for (int b = 0; b < WV_BLOCKS_PER_ROW; b++) {
            #pragma HLS UNROLL
            ap_int<8>  xi8 = (ap_int<8>)  x[b][n];
            ap_uint<4> nb0 = (ap_uint<4>) wr0.range(b*4+3, b*4);
            ap_uint<4> nb1 = (ap_uint<4>) wr1.range(b*4+3, b*4);
            ap_uint<4> nb2 = (ap_uint<4>) wr2.range(b*4+3, b*4);
            ap_uint<4> nb3 = (ap_uint<4>) wr3.range(b*4+3, b*4);

            acc_w0[b][k] += (int32_t)(xi8 * (ap_int<5>)nb0 * sc60[b][sub]);
            acc_m0[b][k] += (int32_t)(xi8 * mn60[b][sub]);
            acc_w1[b][k] += (int32_t)(xi8 * (ap_int<5>)nb1 * sc61[b][sub]);
            acc_m1[b][k] += (int32_t)(xi8 * mn61[b][sub]);
            acc_w2[b][k] += (int32_t)(xi8 * (ap_int<5>)nb2 * sc62[b][sub]);
            acc_m2[b][k] += (int32_t)(xi8 * mn62[b][sub]);
            acc_w3[b][k] += (int32_t)(xi8 * (ap_int<5>)nb3 * sc63[b][sub]);
            acc_m3[b][k] += (int32_t)(xi8 * mn63[b][sub]);
        }
    }

    fxd_accum_t total0 = 0, total1 = 0, total2 = 0, total3 = 0;
    REDUCE: for (int b = 0; b < WV_BLOCKS_PER_ROW; b++) {
        int32_t sw0 = 0, sm0 = 0, sw1 = 0, sm1 = 0;
        int32_t sw2 = 0, sm2 = 0, sw3 = 0, sm3 = 0;
        for (int k = 0; k < 4; k++) {
            #pragma HLS UNROLL
            sw0 += acc_w0[b][k]; sm0 += acc_m0[b][k];
            sw1 += acc_w1[b][k]; sm1 += acc_m1[b][k];
            sw2 += acc_w2[b][k]; sm2 += acc_m2[b][k];
            sw3 += acc_w3[b][k]; sm3 += acc_m3[b][k];
        }
        total0 += (fxd_scale_t)d0[b] * (fxd_accum_t)sw0 - (fxd_scale_t)dmin0[b] * (fxd_accum_t)sm0;
        total1 += (fxd_scale_t)d1[b] * (fxd_accum_t)sw1 - (fxd_scale_t)dmin1[b] * (fxd_accum_t)sm1;
        total2 += (fxd_scale_t)d2[b] * (fxd_accum_t)sw2 - (fxd_scale_t)dmin2[b] * (fxd_accum_t)sm2;
        total3 += (fxd_scale_t)d3[b] * (fxd_accum_t)sw3 - (fxd_scale_t)dmin3[b] * (fxd_accum_t)sm3;
    }
    *result0 = (float)total0 * x_scale;
    *result1 = (float)total1 * x_scale;
    *result2 = (float)total2 * x_scale;
    *result3 = (float)total3 * x_scale;
}

// mac_blocks_down_q4k_k4_urm: 32 blocks, 4-groups × 4-rows, K=4.
// 4 wide BRAM tiles (128-bit each, one per row).  Each holds all 4 groups.
// Read nib_rN[n], slice group grp at bits (grp*32+31, grp*32).
// Groups are sequential → DSPs shared.  4 output results per call.
static void mac_blocks_down_q4k_k4_urm(
    const ap_uint<128> nib_r0[256], const ap_uint<128> nib_r1[256],
    const ap_uint<128> nib_r2[256], const ap_uint<128> nib_r3[256],
    const float  d0[32], const float  dmin0[32], const float  d1[32], const float  dmin1[32],
    const float  d2[32], const float  dmin2[32], const float  d3[32], const float  dmin3[32],
    const int8_t sc60[32][8], const int8_t mn60[32][8], const int8_t sc61[32][8], const int8_t mn61[32][8],
    const int8_t sc62[32][8], const int8_t mn62[32][8], const int8_t sc63[32][8], const int8_t mn63[32][8],
    const int8_t gate[32][256],
    float  gate_scale,
    float *result0, float *result1, float *result2, float *result3)
{
#pragma HLS INLINE off
#pragma HLS BIND_OP op=mul impl=dsp
#pragma HLS ARRAY_PARTITION variable=gate dim=1 complete

    fxd_accum_t total0 = 0, total1 = 0, total2 = 0, total3 = 0;

    DOWN_GROUPS: for (int grp = 0; grp < 4; grp++) {
        int32_t acc_w0[8][4], acc_m0[8][4];
        int32_t acc_w1[8][4], acc_m1[8][4];
        int32_t acc_w2[8][4], acc_m2[8][4];
        int32_t acc_w3[8][4], acc_m3[8][4];
        #pragma HLS ARRAY_PARTITION variable=acc_w0 dim=0 complete
        #pragma HLS ARRAY_PARTITION variable=acc_m0 dim=0 complete
        #pragma HLS ARRAY_PARTITION variable=acc_w1 dim=0 complete
        #pragma HLS ARRAY_PARTITION variable=acc_m1 dim=0 complete
        #pragma HLS ARRAY_PARTITION variable=acc_w2 dim=0 complete
        #pragma HLS ARRAY_PARTITION variable=acc_m2 dim=0 complete
        #pragma HLS ARRAY_PARTITION variable=acc_w3 dim=0 complete
        #pragma HLS ARRAY_PARTITION variable=acc_m3 dim=0 complete

        INIT_GRP: for (int b = 0; b < 8; b++) {
            #pragma HLS UNROLL
            for (int k = 0; k < 4; k++) {
                #pragma HLS UNROLL
                acc_w0[b][k] = 0; acc_m0[b][k] = 0;
                acc_w1[b][k] = 0; acc_m1[b][k] = 0;
                acc_w2[b][k] = 0; acc_m2[b][k] = 0;
                acc_w3[b][k] = 0; acc_m3[b][k] = 0;
            }
        }

        MAC_GRP: for (int n = 0; n < 256; n++) {
            #pragma HLS PIPELINE II=1
            int sub = n >> 5;
            int k   = n & 3;

            // Read 128-bit word per row, slice group grp's 32-bit slot
            ap_uint<128> w0 = nib_r0[n], w1 = nib_r1[n], w2 = nib_r2[n], w3 = nib_r3[n];
            ap_uint<32> wr0, wr1, wr2, wr3;
            if      (grp == 0) { wr0 = w0.range(31,  0);  wr1 = w1.range(31,  0);  wr2 = w2.range(31,  0);  wr3 = w3.range(31,  0);  }
            else if (grp == 1) { wr0 = w0.range(63,  32); wr1 = w1.range(63,  32); wr2 = w2.range(63,  32); wr3 = w3.range(63,  32); }
            else if (grp == 2) { wr0 = w0.range(95,  64); wr1 = w1.range(95,  64); wr2 = w2.range(95,  64); wr3 = w3.range(95,  64); }
            else               { wr0 = w0.range(127, 96); wr1 = w1.range(127, 96); wr2 = w2.range(127, 96); wr3 = w3.range(127, 96); }

            for (int b = 0; b < 8; b++) {
                #pragma HLS UNROLL
                int babs = grp * 8 + b;
                ap_int<8>  gi8 = (ap_int<8>)  gate[babs][n];
                ap_uint<4> nb0 = (ap_uint<4>) wr0.range(b*4+3, b*4);
                ap_uint<4> nb1 = (ap_uint<4>) wr1.range(b*4+3, b*4);
                ap_uint<4> nb2 = (ap_uint<4>) wr2.range(b*4+3, b*4);
                ap_uint<4> nb3 = (ap_uint<4>) wr3.range(b*4+3, b*4);

#ifndef __SYNTHESIS__
                if (n == 1 && b == 0 && grp == 0)
                    printf("[MAC] n=1 g0: wr0=0x%08X wr1=0x%08X wr2=0x%08X wr3=0x%08X  gi8=%d nb0=%d sc60=%d\n",
                        (unsigned)wr0, (unsigned)wr1, (unsigned)wr2, (unsigned)wr3,
                        (int)gi8, (int)nb0, (int)sc60[babs][sub]);
#endif

                acc_w0[b][k] += (int32_t)(gi8 * (ap_int<5>)nb0 * sc60[babs][sub]);
                acc_m0[b][k] += (int32_t)(gi8 * mn60[babs][sub]);
                acc_w1[b][k] += (int32_t)(gi8 * (ap_int<5>)nb1 * sc61[babs][sub]);
                acc_m1[b][k] += (int32_t)(gi8 * mn61[babs][sub]);
                acc_w2[b][k] += (int32_t)(gi8 * (ap_int<5>)nb2 * sc62[babs][sub]);
                acc_m2[b][k] += (int32_t)(gi8 * mn62[babs][sub]);
                acc_w3[b][k] += (int32_t)(gi8 * (ap_int<5>)nb3 * sc63[babs][sub]);
                acc_m3[b][k] += (int32_t)(gi8 * mn63[babs][sub]);
            }
        }

        REDUCE_GRP: for (int b = 0; b < 8; b++) {
            int babs = grp * 8 + b;
            int32_t sw0 = 0, sm0 = 0, sw1 = 0, sm1 = 0;
            int32_t sw2 = 0, sm2 = 0, sw3 = 0, sm3 = 0;
            for (int k = 0; k < 4; k++) {
                #pragma HLS UNROLL
                sw0 += acc_w0[b][k]; sm0 += acc_m0[b][k];
                sw1 += acc_w1[b][k]; sm1 += acc_m1[b][k];
                sw2 += acc_w2[b][k]; sm2 += acc_m2[b][k];
                sw3 += acc_w3[b][k]; sm3 += acc_m3[b][k];
            }
            total0 += (fxd_scale_t)d0[babs]    * (fxd_accum_t)sw0 - (fxd_scale_t)dmin0[babs]  * (fxd_accum_t)sm0;
            total1 += (fxd_scale_t)d1[babs]    * (fxd_accum_t)sw1 - (fxd_scale_t)dmin1[babs]  * (fxd_accum_t)sm1;
            total2 += (fxd_scale_t)d2[babs]    * (fxd_accum_t)sw2 - (fxd_scale_t)dmin2[babs]  * (fxd_accum_t)sm2;
            total3 += (fxd_scale_t)d3[babs]    * (fxd_accum_t)sw3 - (fxd_scale_t)dmin3[babs]  * (fxd_accum_t)sm3;
        }
    }
    *result0 = (float)total0 * gate_scale;
    *result1 = (float)total1 * gate_scale;
    *result2 = (float)total2 * gate_scale;
    *result3 = (float)total3 * gate_scale;
}

// ============================================================================
// Phase 2 & 3: X1 = x @ W.T  and  X2 = x @ V.T  (Q4_K, K=4, URAM)
// ============================================================================

static void compute_X1(
    const uint8_t  *W,
    const int8_t   x_local_1[MAX_BATCH][WV_BLOCKS_PER_ROW][256],
    float          x_scale,
    int8_t         X1_cache[MAX_BATCH][FFN_DIM])
{
#pragma HLS INLINE off
#pragma HLS ARRAY_PARTITION variable=x_local_1 dim=2 complete
    const ap_uint<128> *W_wide = (const ap_uint<128>*)W;

    // 4 rows × 1 wide BRAM each = 4 × 128-bit × 64 deep
    ap_uint<128> nib_r0[64], nib_r1[64], nib_r2[64], nib_r3[64];
    #pragma HLS BIND_STORAGE variable=nib_r0 type=ram_1p impl=bram
    #pragma HLS BIND_STORAGE variable=nib_r1 type=ram_1p impl=bram
    #pragma HLS BIND_STORAGE variable=nib_r2 type=ram_1p impl=bram
    #pragma HLS BIND_STORAGE variable=nib_r3 type=ram_1p impl=bram

    float  d0[WV_BLOCKS_PER_ROW], dmin0[WV_BLOCKS_PER_ROW];
    float  d1[WV_BLOCKS_PER_ROW], dmin1[WV_BLOCKS_PER_ROW];
    float  d2[WV_BLOCKS_PER_ROW], dmin2[WV_BLOCKS_PER_ROW];
    float  d3[WV_BLOCKS_PER_ROW], dmin3[WV_BLOCKS_PER_ROW];
    int8_t sc60[WV_BLOCKS_PER_ROW][8], mn60[WV_BLOCKS_PER_ROW][8];
    int8_t sc61[WV_BLOCKS_PER_ROW][8], mn61[WV_BLOCKS_PER_ROW][8];
    int8_t sc62[WV_BLOCKS_PER_ROW][8], mn62[WV_BLOCKS_PER_ROW][8];
    int8_t sc63[WV_BLOCKS_PER_ROW][8], mn63[WV_BLOCKS_PER_ROW][8];

    COMPUTE_X1: for (int row = 0; row < FFN_DIM; row += 4) {
        load_4_rows_wv_urm(W_wide, row,
            nib_r0, d0, dmin0, sc60, mn60,
            nib_r1, d1, dmin1, sc61, mn61,
            nib_r2, d2, dmin2, sc62, mn62,
            nib_r3, d3, dmin3, sc63, mn63);

        float r0, r1, r2, r3;
        mac_blocks_wv_k4_urm(
            nib_r0, nib_r1, nib_r2, nib_r3,
            d0, dmin0, d1, dmin1, d2, dmin2, d3, dmin3,
            sc60, mn60, sc61, mn61, sc62, mn62, sc63, mn63,
            x_local_1[0], x_scale, &r0, &r1, &r2, &r3);

        // Quantize 4 results to INT8
        float fq0 = r0 * X12_INV_SCALE;
        int   iq0 = (int)(fq0 + (fq0 >= 0.f ? 0.5f : -0.5f));
        if (iq0 >  127) iq0 =  127; if (iq0 < -128) iq0 = -128;
        X1_cache[0][row]     = (int8_t)iq0;

        float fq1 = r1 * X12_INV_SCALE;
        int   iq1 = (int)(fq1 + (fq1 >= 0.f ? 0.5f : -0.5f));
        if (iq1 >  127) iq1 =  127; if (iq1 < -128) iq1 = -128;
        X1_cache[0][row + 1] = (int8_t)iq1;

        float fq2 = r2 * X12_INV_SCALE;
        int   iq2 = (int)(fq2 + (fq2 >= 0.f ? 0.5f : -0.5f));
        if (iq2 >  127) iq2 =  127; if (iq2 < -128) iq2 = -128;
        X1_cache[0][row + 2] = (int8_t)iq2;

        float fq3 = r3 * X12_INV_SCALE;
        int   iq3 = (int)(fq3 + (fq3 >= 0.f ? 0.5f : -0.5f));
        if (iq3 >  127) iq3 =  127; if (iq3 < -128) iq3 = -128;
        X1_cache[0][row + 3] = (int8_t)iq3;
    }
}

static void compute_X2(
    const uint8_t  *V,
    const int8_t   x_local_2[MAX_BATCH][WV_BLOCKS_PER_ROW][256],
    float          x_scale,
    int8_t         X2_cache[MAX_BATCH][FFN_DIM])
{
#pragma HLS INLINE off
#pragma HLS ARRAY_PARTITION variable=x_local_2 dim=2 complete
    const ap_uint<128> *V_wide = (const ap_uint<128>*)V;

    // 4 rows × 1 wide BRAM each = 4 × 128-bit × 64 deep
    ap_uint<128> nib_r0[64], nib_r1[64], nib_r2[64], nib_r3[64];
    #pragma HLS BIND_STORAGE variable=nib_r0 type=ram_1p impl=bram
    #pragma HLS BIND_STORAGE variable=nib_r1 type=ram_1p impl=bram
    #pragma HLS BIND_STORAGE variable=nib_r2 type=ram_1p impl=bram
    #pragma HLS BIND_STORAGE variable=nib_r3 type=ram_1p impl=bram

    float  d0[WV_BLOCKS_PER_ROW], dmin0[WV_BLOCKS_PER_ROW];
    float  d1[WV_BLOCKS_PER_ROW], dmin1[WV_BLOCKS_PER_ROW];
    float  d2[WV_BLOCKS_PER_ROW], dmin2[WV_BLOCKS_PER_ROW];
    float  d3[WV_BLOCKS_PER_ROW], dmin3[WV_BLOCKS_PER_ROW];
    int8_t sc60[WV_BLOCKS_PER_ROW][8], mn60[WV_BLOCKS_PER_ROW][8];
    int8_t sc61[WV_BLOCKS_PER_ROW][8], mn61[WV_BLOCKS_PER_ROW][8];
    int8_t sc62[WV_BLOCKS_PER_ROW][8], mn62[WV_BLOCKS_PER_ROW][8];
    int8_t sc63[WV_BLOCKS_PER_ROW][8], mn63[WV_BLOCKS_PER_ROW][8];

    COMPUTE_X2: for (int row = 0; row < FFN_DIM; row += 4) {
        load_4_rows_wv_urm(V_wide, row,
            nib_r0, d0, dmin0, sc60, mn60,
            nib_r1, d1, dmin1, sc61, mn61,
            nib_r2, d2, dmin2, sc62, mn62,
            nib_r3, d3, dmin3, sc63, mn63);

        float r0, r1, r2, r3;
        mac_blocks_wv_k4_urm(
            nib_r0, nib_r1, nib_r2, nib_r3,
            d0, dmin0, d1, dmin1, d2, dmin2, d3, dmin3,
            sc60, mn60, sc61, mn61, sc62, mn62, sc63, mn63,
            x_local_2[0], x_scale, &r0, &r1, &r2, &r3);

        float fq0 = r0 * X12_INV_SCALE;
        int   iq0 = (int)(fq0 + (fq0 >= 0.f ? 0.5f : -0.5f));
        if (iq0 >  127) iq0 =  127; if (iq0 < -128) iq0 = -128;
        X2_cache[0][row]     = (int8_t)iq0;

        float fq1 = r1 * X12_INV_SCALE;
        int   iq1 = (int)(fq1 + (fq1 >= 0.f ? 0.5f : -0.5f));
        if (iq1 >  127) iq1 =  127; if (iq1 < -128) iq1 = -128;
        X2_cache[0][row + 1] = (int8_t)iq1;

        float fq2 = r2 * X12_INV_SCALE;
        int   iq2 = (int)(fq2 + (fq2 >= 0.f ? 0.5f : -0.5f));
        if (iq2 >  127) iq2 =  127; if (iq2 < -128) iq2 = -128;
        X2_cache[0][row + 2] = (int8_t)iq2;

        float fq3 = r3 * X12_INV_SCALE;
        int   iq3 = (int)(fq3 + (fq3 >= 0.f ? 0.5f : -0.5f));
        if (iq3 >  127) iq3 =  127; if (iq3 < -128) iq3 = -128;
        X2_cache[0][row + 3] = (int8_t)iq3;
    }
}

// ─── Phase 4: gate[n][b][elem] = SiLU(X1[n][j]) × X2[n][j], quantized to INT8 ──
// (unchanged from hybrid K=2)
static void compute_gate(
    const int8_t X1_cache[MAX_BATCH][FFN_DIM],
    const int8_t X2_cache[MAX_BATCH][FFN_DIM],
    int8_t       gate_cache[MAX_BATCH][DOWN_BLOCKS_PER_ROW][256],
    float        gate_scale_out[MAX_BATCH])
{
#pragma HLS INLINE off
#pragma HLS BIND_OP op=mul impl=dsp
    SWISH_GATE: for (int n = 0; n < MAX_BATCH; n++) {
        #pragma HLS UNROLL
        float pmax[8] = {0.f,0.f,0.f,0.f,0.f,0.f,0.f,0.f};
        #pragma HLS ARRAY_PARTITION variable=pmax complete

        GATE_PASS1: for (int j = 0; j < FFN_DIM; j++) {
            #pragma HLS PIPELINE II=1
            float z      = (float)X1_cache[n][j] * X12_QUANT_SCALE;
            float x2     = (float)X2_cache[n][j] * X12_QUANT_SCALE;
            float scaled = (z + 8.0f) * 256.0f;
            int   idx    = (int)scaled;
            if (idx < 0)    idx = 0;
            if (idx > 4095) idx = 4095;
            float g      = z * sigmoid_lut[idx] * x2;
            float abs_g  = g < 0.f ? -g : g;
            if (abs_g > pmax[j & 7]) pmax[j & 7] = abs_g;
        }

        float max_abs = 0.f;
        for (int k = 0; k < 8; k++) {
            #pragma HLS UNROLL
            if (pmax[k] > max_abs) max_abs = pmax[k];
        }
        float gs     = (max_abs > 0.f) ? (max_abs / 127.0f) : 1.0f;
        float inv_gs = 1.0f / gs;
        gate_scale_out[n] = gs;

        GATE_PASS2: for (int j = 0; j < FFN_DIM; j++) {
            #pragma HLS PIPELINE II=1
            float z      = (float)X1_cache[n][j] * X12_QUANT_SCALE;
            float x2     = (float)X2_cache[n][j] * X12_QUANT_SCALE;
            float scaled = (z + 8.0f) * 256.0f;
            int   idx    = (int)scaled;
            if (idx < 0)    idx = 0;
            if (idx > 4095) idx = 4095;
            float g      = z * sigmoid_lut[idx] * x2;
            float fq     = g * inv_gs;
            int   iq     = (int)(fq + (fq >= 0.f ? 0.5f : -0.5f));
            if (iq >  127) iq =  127;
            if (iq < -128) iq = -128;
            gate_cache[n][j >> 8][j & 255] = (int8_t)iq;
        }
    }
}

// ============================================================================
// Phase 5: output = gate @ W_down.T  (Q4_K, K=4, 16 URAM tiles)
// ============================================================================
// 4 rows per iteration.  16 URAM nibble tiles (4 groups × 4 rows).
// Load: one merged call to load_4_rows_down_urm (1280-word burst).
// MAC:  4 groups sequential × 4 rows = 1024 cycles.
// Total: ~600 (load) + 1024 (MAC) = ~1624 cycles/4-rows.
static void compute_output(
    const uint8_t  *W_down,
    const int8_t   gate_cache[MAX_BATCH][DOWN_BLOCKS_PER_ROW][256],
    const float    gate_scale_array[MAX_BATCH],
    float         *out_batch,
    uint32_t       down_quant_mode)
{
#pragma HLS INLINE off
#pragma HLS ARRAY_PARTITION variable=gate_cache dim=2 cyclic factor=8

    const ap_uint<128> *W_down_wide = (const ap_uint<128>*)W_down;
    float gate_scale = gate_scale_array[0];

    if (down_quant_mode == 0) {
        float out_local[VECTOR_DIM];
        #pragma HLS BIND_STORAGE variable=out_local type=ram_1p impl=bram

        // 4 rows × 1 wide BRAM each = 4 × 128-bit × 256 deep
        ap_uint<128> nib_r0[256], nib_r1[256], nib_r2[256], nib_r3[256];
        #pragma HLS BIND_STORAGE variable=nib_r0 type=ram_1p impl=bram
        #pragma HLS BIND_STORAGE variable=nib_r1 type=ram_1p impl=bram
        #pragma HLS BIND_STORAGE variable=nib_r2 type=ram_1p impl=bram
        #pragma HLS BIND_STORAGE variable=nib_r3 type=ram_1p impl=bram

        float  d0[32], dmin0[32], d1[32], dmin1[32], d2[32], dmin2[32], d3[32], dmin3[32];
        int8_t sc60[32][8], mn60[32][8], sc61[32][8], mn61[32][8];
        int8_t sc62[32][8], mn62[32][8], sc63[32][8], mn63[32][8];
        #pragma HLS ARRAY_PARTITION variable=d0 complete
        #pragma HLS ARRAY_PARTITION variable=dmin0 complete
        #pragma HLS ARRAY_PARTITION variable=d1 complete
        #pragma HLS ARRAY_PARTITION variable=dmin1 complete
        #pragma HLS ARRAY_PARTITION variable=d2 complete
        #pragma HLS ARRAY_PARTITION variable=dmin2 complete
        #pragma HLS ARRAY_PARTITION variable=d3 complete
        #pragma HLS ARRAY_PARTITION variable=dmin3 complete
        #pragma HLS ARRAY_PARTITION variable=sc60  dim=0 complete
        #pragma HLS ARRAY_PARTITION variable=mn60  dim=0 complete
        #pragma HLS ARRAY_PARTITION variable=sc61  dim=0 complete
        #pragma HLS ARRAY_PARTITION variable=mn61  dim=0 complete
        #pragma HLS ARRAY_PARTITION variable=sc62  dim=0 complete
        #pragma HLS ARRAY_PARTITION variable=mn62  dim=0 complete
        #pragma HLS ARRAY_PARTITION variable=sc63  dim=0 complete
        #pragma HLS ARRAY_PARTITION variable=mn63  dim=0 complete

        DOWN_Q4K: for (int out_i = 0; out_i < VECTOR_DIM; out_i += 4) {
            load_4_rows_down_urm(W_down_wide, out_i,
                nib_r0, d0, dmin0, sc60, mn60,
                nib_r1, d1, dmin1, sc61, mn61,
                nib_r2, d2, dmin2, sc62, mn62,
                nib_r3, d3, dmin3, sc63, mn63);

#ifndef __SYNTHESIS__
            if (out_i == 0)
                printf("[CO] nib_r0[1]=%08X_%08X_%08X_%08X  d0[0]=%.6f  sc60[0][0]=%d  gate_b0_e1=%d\n",
                    (unsigned)nib_r0[1].range(127,96), (unsigned)nib_r0[1].range(95,64),
                    (unsigned)nib_r0[1].range(63,32),  (unsigned)nib_r0[1].range(31,0),
                    d0[0], (int)sc60[0][0], (int)gate_cache[0][0][1]);
#endif

            mac_blocks_down_q4k_k4_urm(
                nib_r0, nib_r1, nib_r2, nib_r3,
                d0, dmin0, d1, dmin1, d2, dmin2, d3, dmin3,
                sc60, mn60, sc61, mn61, sc62, mn62, sc63, mn63,
                gate_cache[0], gate_scale,
                &out_local[out_i], &out_local[out_i + 1],
                &out_local[out_i + 2], &out_local[out_i + 3]);
        }
        memcpy(out_batch, out_local, VECTOR_DIM * sizeof(float));
    }
}

// ─── Phase 1: Load x_batch into dual x_local BRAMs ───────────────────────────
static void load_x_local(
    const int8_t  *x_batch,
    int8_t        x_local_1[MAX_BATCH][WV_BLOCKS_PER_ROW][256],
    int8_t        x_local_2[MAX_BATCH][WV_BLOCKS_PER_ROW][256])
{
#pragma HLS INLINE off
#pragma HLS ARRAY_PARTITION variable=x_local_1 dim=2 complete
#pragma HLS ARRAY_PARTITION variable=x_local_2 dim=2 complete
    const ap_uint<128> *x_wide = (const ap_uint<128>*)x_batch;
    LOAD_X_BATCH: for (int n = 0; n < MAX_BATCH; n++) {
        LOAD_X_VEC: for (int i = 0; i < VECTOR_DIM / 16; i++) {
            #pragma HLS PIPELINE II=1
            ap_uint<128> wide_val = x_wide[n * (VECTOR_DIM / 16) + i];
            for (int j = 0; j < 16; j++) {
                #pragma HLS UNROLL
                int8_t val = (int8_t)wide_val.range(j*8+7, j*8);
                int elem = i * 16 + j;
                x_local_1[n][elem >> 8][elem & 255] = val;
                x_local_2[n][elem >> 8][elem & 255] = val;
            }
        }
    }
}

// ============================================================================
// swiglu — top-level AXI4 IP entry point
// ============================================================================
void swiglu(
    const uint8_t *W,
    const uint8_t *V,
    const uint8_t *W_down,
    const int8_t  *x_batch,
    float         *out_batch,
    uint32_t       down_quant_mode,
    float          x_scale)
{
    // URM DDR: WV=80 words/row (1280 B), Down=320 words/row (5120 B)
    // W/V: 8192 × 1280 = 10,485,760 B   W_down: 2048 × 5120 = 10,485,760 B
    #pragma HLS INTERFACE mode=m_axi port=W         bundle=gmem_W    offset=slave depth=10485760 max_read_burst_length=128  latency=64 num_read_outstanding=1 max_widen_bitwidth=128
    #pragma HLS INTERFACE mode=m_axi port=V         bundle=gmem_V    offset=slave depth=10485760 max_read_burst_length=128  latency=64 num_read_outstanding=1 max_widen_bitwidth=128
    #pragma HLS INTERFACE mode=m_axi port=W_down    bundle=gmem_Wd   offset=slave depth=10485760 max_read_burst_length=256  latency=64 num_read_outstanding=1 max_widen_bitwidth=128
    #pragma HLS INTERFACE mode=m_axi port=x_batch   bundle=gmem_x    offset=slave depth=8192     max_read_burst_length=128  latency=64 num_read_outstanding=1 max_widen_bitwidth=128
    #pragma HLS INTERFACE mode=m_axi port=out_batch bundle=gmem_out  offset=slave depth=8192     max_write_burst_length=256 latency=64 num_write_outstanding=1

    #pragma HLS INTERFACE mode=s_axilite port=W               bundle=CTRL
    #pragma HLS INTERFACE mode=s_axilite port=V               bundle=CTRL
    #pragma HLS INTERFACE mode=s_axilite port=W_down          bundle=CTRL
    #pragma HLS INTERFACE mode=s_axilite port=x_batch         bundle=CTRL
    #pragma HLS INTERFACE mode=s_axilite port=out_batch       bundle=CTRL
    #pragma HLS INTERFACE mode=s_axilite port=down_quant_mode bundle=CTRL
    #pragma HLS INTERFACE mode=s_axilite port=x_scale         bundle=CTRL
    #pragma HLS INTERFACE mode=s_axilite port=return          bundle=CTRL

    int8_t x_local_1[MAX_BATCH][WV_BLOCKS_PER_ROW][256];
    #pragma HLS BIND_STORAGE variable=x_local_1 type=ram_1p impl=lutram
    #pragma HLS ARRAY_PARTITION variable=x_local_1 dim=2 complete

    int8_t x_local_2[MAX_BATCH][WV_BLOCKS_PER_ROW][256];
    #pragma HLS BIND_STORAGE variable=x_local_2 type=ram_1p impl=lutram
    #pragma HLS ARRAY_PARTITION variable=x_local_2 dim=2 complete

    int8_t X1_cache[MAX_BATCH][FFN_DIM];
    int8_t X2_cache[MAX_BATCH][FFN_DIM];
    #pragma HLS BIND_STORAGE variable=X1_cache type=ram_2p impl=bram
    #pragma HLS BIND_STORAGE variable=X2_cache type=ram_2p impl=bram

    int8_t gate_cache[MAX_BATCH][DOWN_BLOCKS_PER_ROW][256];
    #pragma HLS BIND_STORAGE variable=gate_cache type=ram_1p impl=uram
    #pragma HLS ARRAY_PARTITION variable=gate_cache dim=2 cyclic factor=8

    float gate_scale[MAX_BATCH];

    #pragma HLS BIND_STORAGE variable=sigmoid_lut type=rom_1p impl=bram

#ifndef __SYNTHESIS__
    init_sigmoid_lut_csim();
#endif

#pragma HLS DATAFLOW
    load_x_local(x_batch, x_local_1, x_local_2);
    compute_X1(W, x_local_1, x_scale, X1_cache);
    compute_X2(V, x_local_2, x_scale, X2_cache);
    compute_gate(X1_cache, X2_cache, gate_cache, gate_scale);
    compute_output(W_down, gate_cache, gate_scale, out_batch, down_quant_mode);
}
