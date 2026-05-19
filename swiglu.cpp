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

// Per-row DDR word totals (must match hybrid's WV_ROW_WORDS=80, DOWN_Q4K_WORDS=320)
#define WV_ROW_WORDS         (URM_WV_HDR_WORDS   + URM_WV_NIB_WORDS)        // 80
#define DOWN_Q4K_WORDS       (URM_DOWN_HDR_WORDS + URM_DOWN_NIB_WORDS)      // 320
// ─── INT8 quantisation scale for X1/X2 intermediate caches ───────────────────
#define X12_SCALE_RANGE  10.0f
#define X12_INV_SCALE    (127.0f / X12_SCALE_RANGE)   // 12.7f
#define X12_QUANT_SCALE  (X12_SCALE_RANGE / 127.0f)   // ~0.0787f

// ─── URAM nibble tile dimensions ──────────────────────────────────────────────
#define URM_NIB_ELEMS        256
#define URM_NIB_TILE_DEPTH   256

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

// load_row_wv_urm: load one WV row into headers (registers) + 4 URAM nibble tiles.
// 4 interleaved tiles for II=1 DDR→URAM load: each DDR word fans out to all
// 4 tiles simultaneously at the same index (independent write ports → no conflict).
// Header: 2 DDR words per block (32 bytes). 8 blocks → 16 DDR words.
// Nibble: 64 DDR words, each = 4 element-slices → 4 URAM tiles, II=1.
#define URM_WV_TILE_DEPTH  (URM_NIB_ELEMS / 4)   // 64
static void load_row_wv_urm(const ap_uint<128> *W_wide, int row,
                             ap_uint<32> t0[URM_WV_TILE_DEPTH],
                             ap_uint<32> t1[URM_WV_TILE_DEPTH],
                             ap_uint<32> t2[URM_WV_TILE_DEPTH],
                             ap_uint<32> t3[URM_WV_TILE_DEPTH],
                             float   d[WV_BLOCKS_PER_ROW],
                             float   dmin[WV_BLOCKS_PER_ROW],
                             int8_t  sc6[WV_BLOCKS_PER_ROW][8],
                             int8_t  mn6[WV_BLOCKS_PER_ROW][8]) {
#pragma HLS INLINE off
    // URAM tiles bound in caller (compute_X1); sc6/mn6 are small regs

    // ── Load headers: 16 DDR words, blocks 0..7 ──────────────────────────────
    LOAD_HDR_WV: for (int b = 0; b < WV_BLOCKS_PER_ROW; b++) {
        #pragma HLS PIPELINE II=1
        ap_uint<128> w0 = W_wide[(ap_uint<64>)row * WV_ROW_WORDS + b * 2];
        ap_uint<128> w1 = W_wide[(ap_uint<64>)row * WV_ROW_WORDS + b * 2 + 1];

        uint16_t d_raw    = (uint16_t)w0.range(15, 0);
        uint16_t dmin_raw = (uint16_t)w0.range(31, 16);
        d[b]    = fp16_to_fp32(d_raw);
        dmin[b] = fp16_to_fp32(dmin_raw);
        for (int i = 0; i < 4; i++) {
            sc6[b][i] = (int8_t)(uint8_t)w0.range(32 + i*8 + 7, 32 + i*8);
            mn6[b][i] = (int8_t)(uint8_t)w0.range(64 + i*8 + 7, 64 + i*8);
        }
        for (int i = 4; i < 8; i++) {
            int j = i - 4;
            sc6[b][i] = (int8_t)(uint8_t)w1.range(j*8 + 7, j*8);
            mn6[b][i] = (int8_t)(uint8_t)w1.range(32 + j*8 + 7, 32 + j*8);
        }
    }

    // ── Load nibbles: 64 DDR words → 4 URAM tiles, II=1 ─────────────────────
    // DDR word e: t0[e]=elem[4e], t1[e]=elem[4e+1], t2[e]=elem[4e+2], t3[e]=elem[4e+3]
    LOAD_NIB_WV: for (int e = 0; e < URM_WV_NIB_WORDS; e++) {
        #pragma HLS PIPELINE II=1
        ap_uint<128> ddr = W_wide[(ap_uint<64>)row * WV_ROW_WORDS + URM_WV_HDR_WORDS + e];
        t0[e] = ddr.range(31,  0);
        t1[e] = ddr.range(63,  32);
        t2[e] = ddr.range(95,  64);
        t3[e] = ddr.range(127, 96);
    }
}

// load_row_down_urm: load one output row into headers + nibble URAM tiles.
// 32 blocks = 4 groups. Headers: 64 DDR words. Nibbles: 256 DDR words.
// Each nibble DDR word = all 4 groups for one element → 4 URAM writes at II=1.
static void load_row_down_urm(const ap_uint<128> *Wd_wide, int out_i,
                               ap_uint<32> nib_g0[URM_NIB_TILE_DEPTH],
                               ap_uint<32> nib_g1[URM_NIB_TILE_DEPTH],
                               ap_uint<32> nib_g2[URM_NIB_TILE_DEPTH],
                               ap_uint<32> nib_g3[URM_NIB_TILE_DEPTH],
                               float   d[DOWN_BLOCKS_PER_ROW],
                               float   dmin[DOWN_BLOCKS_PER_ROW],
                               int8_t  sc6[DOWN_BLOCKS_PER_ROW][8],
                               int8_t  mn6[DOWN_BLOCKS_PER_ROW][8]) {
#pragma HLS INLINE off
    // URAM tiles bound in caller (compute_output); sc6/mn6 are small regs

    // ── Load headers: 32 blocks × 2 DDR words = 64 DDR words ────────────────
    LOAD_HDR_DOWN: for (int b = 0; b < DOWN_BLOCKS_PER_ROW; b++) {
        #pragma HLS PIPELINE II=1
        ap_uint<128> w0 = Wd_wide[(ap_uint<64>)out_i * DOWN_Q4K_WORDS + b * 2];
        ap_uint<128> w1 = Wd_wide[(ap_uint<64>)out_i * DOWN_Q4K_WORDS + b * 2 + 1];

        uint16_t d_raw    = (uint16_t)w0.range(15, 0);
        uint16_t dmin_raw = (uint16_t)w0.range(31, 16);
        d[b]    = fp16_to_fp32(d_raw);
        dmin[b] = fp16_to_fp32(dmin_raw);
        for (int i = 0; i < 4; i++) {
            sc6[b][i] = (int8_t)(uint8_t)w0.range(32 + i*8 + 7, 32 + i*8);
            mn6[b][i] = (int8_t)(uint8_t)w0.range(64 + i*8 + 7, 64 + i*8);
        }
        for (int i = 4; i < 8; i++) {
            int j = i - 4;
            sc6[b][i] = (int8_t)(uint8_t)w1.range(j*8 + 7, j*8);
            mn6[b][i] = (int8_t)(uint8_t)w1.range(32 + j*8 + 7, 32 + j*8);
        }
    }

    // ── Load nibbles: 256 DDR words → 4 URAM tiles, one element per word ────
    LOAD_NIB_DOWN: for (int e = 0; e < URM_NIB_ELEMS; e++) {
        #pragma HLS PIPELINE II=1
        ap_uint<128> ddr = Wd_wide[(ap_uint<64>)out_i * DOWN_Q4K_WORDS + URM_DOWN_HDR_WORDS + e];
        nib_g0[e] = ddr.range(31,  0);
        nib_g1[e] = ddr.range(63,  32);
        nib_g2[e] = ddr.range(95,  64);
        nib_g3[e] = ddr.range(127, 96);
    }
}

// ============================================================================
// MAC functions — URAM-transposed nibble access, K=4 parallelism
// ============================================================================

// mac_blocks_wv_k4_urm: 4 rows, 8 blocks, 32 parallel INT32 MAC chains.
// URAM nibble access: nib_urm[n] → compile-time .range(b*4+3, b*4) → 0 LUT.
// mac_blocks_wv_k4_urm: K=4, 4 interleaved URAM tiles per row (16 total).
// Tile t0: elements 0,4,...; t1: 1,5,...; t2: 2,6,...; t3: 3,7,...
// MAC reads from correct tile based on n&3.  Small 4:1 32-bit mux per row.
static void mac_blocks_wv_k4_urm(
    // Row 0 tiles
    const ap_uint<32> r0t0[URM_WV_TILE_DEPTH], const ap_uint<32> r0t1[URM_WV_TILE_DEPTH],
    const ap_uint<32> r0t2[URM_WV_TILE_DEPTH], const ap_uint<32> r0t3[URM_WV_TILE_DEPTH],
    // Row 1 tiles
    const ap_uint<32> r1t0[URM_WV_TILE_DEPTH], const ap_uint<32> r1t1[URM_WV_TILE_DEPTH],
    const ap_uint<32> r1t2[URM_WV_TILE_DEPTH], const ap_uint<32> r1t3[URM_WV_TILE_DEPTH],
    // Row 2 tiles
    const ap_uint<32> r2t0[URM_WV_TILE_DEPTH], const ap_uint<32> r2t1[URM_WV_TILE_DEPTH],
    const ap_uint<32> r2t2[URM_WV_TILE_DEPTH], const ap_uint<32> r2t3[URM_WV_TILE_DEPTH],
    // Row 3 tiles
    const ap_uint<32> r3t0[URM_WV_TILE_DEPTH], const ap_uint<32> r3t1[URM_WV_TILE_DEPTH],
    const ap_uint<32> r3t2[URM_WV_TILE_DEPTH], const ap_uint<32> r3t3[URM_WV_TILE_DEPTH],
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
// URAM tiles: no partition — stay as single URAM tile (1 read port/cycle)
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
        int sub = n >> 5;
        int k   = n & 3;
        int t   = n & 3;           // tile selector
        int idx = n >> 2;          // index within tile

        // Read from correct tile per row — 4:1 32-bit mux per row (negligible LUT)
        ap_uint<32> wr0, wr1, wr2, wr3;
        if (t == 0)      { wr0 = r0t0[idx]; wr1 = r1t0[idx]; wr2 = r2t0[idx]; wr3 = r3t0[idx]; }
        else if (t == 1) { wr0 = r0t1[idx]; wr1 = r1t1[idx]; wr2 = r2t1[idx]; wr3 = r3t1[idx]; }
        else if (t == 2) { wr0 = r0t2[idx]; wr1 = r1t2[idx]; wr2 = r2t2[idx]; wr3 = r3t2[idx]; }
        else             { wr0 = r0t3[idx]; wr1 = r1t3[idx]; wr2 = r2t3[idx]; wr3 = r3t3[idx]; }

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

// mac_blocks_down_q4k_k4_urm: 32 blocks, 4-groups × 4-rows K=4.
// 16 URAM nibble tiles (4 groups × 4 rows).  Within each group, 4 rows
// are UNROLL'd → 32 parallel MACs (8 blocks × 4 rows).  4 groups are
// sequential → DSPs shared, 1024 MAC cycles/4-row iteration.
// 4 output results per call (one per row).
static void mac_blocks_down_q4k_k4_urm(
    // Group 0: 4 rows
    const ap_uint<32> g0r0[URM_NIB_TILE_DEPTH], const ap_uint<32> g0r1[URM_NIB_TILE_DEPTH],
    const ap_uint<32> g0r2[URM_NIB_TILE_DEPTH], const ap_uint<32> g0r3[URM_NIB_TILE_DEPTH],
    // Group 1: 4 rows
    const ap_uint<32> g1r0[URM_NIB_TILE_DEPTH], const ap_uint<32> g1r1[URM_NIB_TILE_DEPTH],
    const ap_uint<32> g1r2[URM_NIB_TILE_DEPTH], const ap_uint<32> g1r3[URM_NIB_TILE_DEPTH],
    // Group 2: 4 rows
    const ap_uint<32> g2r0[URM_NIB_TILE_DEPTH], const ap_uint<32> g2r1[URM_NIB_TILE_DEPTH],
    const ap_uint<32> g2r2[URM_NIB_TILE_DEPTH], const ap_uint<32> g2r3[URM_NIB_TILE_DEPTH],
    // Group 3: 4 rows
    const ap_uint<32> g3r0[URM_NIB_TILE_DEPTH], const ap_uint<32> g3r1[URM_NIB_TILE_DEPTH],
    const ap_uint<32> g3r2[URM_NIB_TILE_DEPTH], const ap_uint<32> g3r3[URM_NIB_TILE_DEPTH],
    // Headers: 4 rows × 32 blocks
    const float  d0[DOWN_BLOCKS_PER_ROW], const float  dmin0[DOWN_BLOCKS_PER_ROW],
    const float  d1[DOWN_BLOCKS_PER_ROW], const float  dmin1[DOWN_BLOCKS_PER_ROW],
    const float  d2[DOWN_BLOCKS_PER_ROW], const float  dmin2[DOWN_BLOCKS_PER_ROW],
    const float  d3[DOWN_BLOCKS_PER_ROW], const float  dmin3[DOWN_BLOCKS_PER_ROW],
    const int8_t sc60[DOWN_BLOCKS_PER_ROW][8], const int8_t mn60[DOWN_BLOCKS_PER_ROW][8],
    const int8_t sc61[DOWN_BLOCKS_PER_ROW][8], const int8_t mn61[DOWN_BLOCKS_PER_ROW][8],
    const int8_t sc62[DOWN_BLOCKS_PER_ROW][8], const int8_t mn62[DOWN_BLOCKS_PER_ROW][8],
    const int8_t sc63[DOWN_BLOCKS_PER_ROW][8], const int8_t mn63[DOWN_BLOCKS_PER_ROW][8],
    const int8_t gate[DOWN_BLOCKS_PER_ROW][256],
    float  gate_scale,
    float *result0, float *result1, float *result2, float *result3)
{
#pragma HLS INLINE off
#pragma HLS BIND_OP op=mul impl=dsp
#pragma HLS ARRAY_PARTITION variable=gate dim=1 complete

    fxd_accum_t total0 = 0, total1 = 0, total2 = 0, total3 = 0;

    // 4 groups sequential (share DSPs), 4 rows UNROLL'd per group
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

        // Select group tiles — 4:1 32-bit mux per row (negligible LUT)
        MAC_GRP: for (int n = 0; n < 256; n++) {
            #pragma HLS PIPELINE II=1
            int sub = n >> 5;
            int k   = n & 3;

            ap_uint<32> w0, w1, w2, w3;
            if      (grp == 0) { w0 = g0r0[n]; w1 = g0r1[n]; w2 = g0r2[n]; w3 = g0r3[n]; }
            else if (grp == 1) { w0 = g1r0[n]; w1 = g1r1[n]; w2 = g1r2[n]; w3 = g1r3[n]; }
            else if (grp == 2) { w0 = g2r0[n]; w1 = g2r1[n]; w2 = g2r2[n]; w3 = g2r3[n]; }
            else               { w0 = g3r0[n]; w1 = g3r1[n]; w2 = g3r2[n]; w3 = g3r3[n]; }

            for (int b = 0; b < 8; b++) {
                #pragma HLS UNROLL
                int babs = grp * 8 + b;
                ap_int<8>  gi8  = (ap_int<8>)  gate[babs][n];
                ap_uint<4> nb0  = (ap_uint<4>) w0.range(b*4+3, b*4);
                ap_uint<4> nb1  = (ap_uint<4>) w1.range(b*4+3, b*4);
                ap_uint<4> nb2  = (ap_uint<4>) w2.range(b*4+3, b*4);
                ap_uint<4> nb3  = (ap_uint<4>) w3.range(b*4+3, b*4);

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
            total0 += (fxd_scale_t)d0[babs]    * (fxd_accum_t)sw0
                    - (fxd_scale_t)dmin0[babs]  * (fxd_accum_t)sm0;
            total1 += (fxd_scale_t)d1[babs]    * (fxd_accum_t)sw1
                    - (fxd_scale_t)dmin1[babs]  * (fxd_accum_t)sm1;
            total2 += (fxd_scale_t)d2[babs]    * (fxd_accum_t)sw2
                    - (fxd_scale_t)dmin2[babs]  * (fxd_accum_t)sm2;
            total3 += (fxd_scale_t)d3[babs]    * (fxd_accum_t)sw3
                    - (fxd_scale_t)dmin3[babs]  * (fxd_accum_t)sm3;
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

    // 4 rows × 4 interleaved tiles = 16 URAM tiles
    #define DECL_URAM_TILES(r) \
        ap_uint<32> r##t0[URM_WV_TILE_DEPTH], r##t1[URM_WV_TILE_DEPTH]; \
        ap_uint<32> r##t2[URM_WV_TILE_DEPTH], r##t3[URM_WV_TILE_DEPTH];
    DECL_URAM_TILES(r0) DECL_URAM_TILES(r1) DECL_URAM_TILES(r2) DECL_URAM_TILES(r3)
    #pragma HLS BIND_STORAGE variable=r0t0 type=ram_1p impl=uram
    #pragma HLS BIND_STORAGE variable=r0t1 type=ram_1p impl=uram
    #pragma HLS BIND_STORAGE variable=r0t2 type=ram_1p impl=uram
    #pragma HLS BIND_STORAGE variable=r0t3 type=ram_1p impl=uram
    #pragma HLS BIND_STORAGE variable=r1t0 type=ram_1p impl=uram
    #pragma HLS BIND_STORAGE variable=r1t1 type=ram_1p impl=uram
    #pragma HLS BIND_STORAGE variable=r1t2 type=ram_1p impl=uram
    #pragma HLS BIND_STORAGE variable=r1t3 type=ram_1p impl=uram
    #pragma HLS BIND_STORAGE variable=r2t0 type=ram_1p impl=uram
    #pragma HLS BIND_STORAGE variable=r2t1 type=ram_1p impl=uram
    #pragma HLS BIND_STORAGE variable=r2t2 type=ram_1p impl=uram
    #pragma HLS BIND_STORAGE variable=r2t3 type=ram_1p impl=uram
    #pragma HLS BIND_STORAGE variable=r3t0 type=ram_1p impl=uram
    #pragma HLS BIND_STORAGE variable=r3t1 type=ram_1p impl=uram
    #pragma HLS BIND_STORAGE variable=r3t2 type=ram_1p impl=uram
    #pragma HLS BIND_STORAGE variable=r3t3 type=ram_1p impl=uram

    float  d0[WV_BLOCKS_PER_ROW], dmin0[WV_BLOCKS_PER_ROW];
    float  d1[WV_BLOCKS_PER_ROW], dmin1[WV_BLOCKS_PER_ROW];
    float  d2[WV_BLOCKS_PER_ROW], dmin2[WV_BLOCKS_PER_ROW];
    float  d3[WV_BLOCKS_PER_ROW], dmin3[WV_BLOCKS_PER_ROW];
    int8_t sc60[WV_BLOCKS_PER_ROW][8], mn60[WV_BLOCKS_PER_ROW][8];
    int8_t sc61[WV_BLOCKS_PER_ROW][8], mn61[WV_BLOCKS_PER_ROW][8];
    int8_t sc62[WV_BLOCKS_PER_ROW][8], mn62[WV_BLOCKS_PER_ROW][8];
    int8_t sc63[WV_BLOCKS_PER_ROW][8], mn63[WV_BLOCKS_PER_ROW][8];

    COMPUTE_X1: for (int row = 0; row < FFN_DIM; row += 4) {
        load_row_wv_urm(W_wide, row,     r0t0, r0t1, r0t2, r0t3, d0, dmin0, sc60, mn60);
        load_row_wv_urm(W_wide, row + 1, r1t0, r1t1, r1t2, r1t3, d1, dmin1, sc61, mn61);
        load_row_wv_urm(W_wide, row + 2, r2t0, r2t1, r2t2, r2t3, d2, dmin2, sc62, mn62);
        load_row_wv_urm(W_wide, row + 3, r3t0, r3t1, r3t2, r3t3, d3, dmin3, sc63, mn63);

        float r0, r1, r2, r3;
        mac_blocks_wv_k4_urm(
            r0t0, r0t1, r0t2, r0t3, r1t0, r1t1, r1t2, r1t3,
            r2t0, r2t1, r2t2, r2t3, r3t0, r3t1, r3t2, r3t3,
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

    #define DECL_URAM_X2(r) \
        ap_uint<32> r##t0[URM_WV_TILE_DEPTH], r##t1[URM_WV_TILE_DEPTH]; \
        ap_uint<32> r##t2[URM_WV_TILE_DEPTH], r##t3[URM_WV_TILE_DEPTH];
    DECL_URAM_X2(r0) DECL_URAM_X2(r1) DECL_URAM_X2(r2) DECL_URAM_X2(r3)
    #pragma HLS BIND_STORAGE variable=r0t0 type=ram_1p impl=uram
    #pragma HLS BIND_STORAGE variable=r0t1 type=ram_1p impl=uram
    #pragma HLS BIND_STORAGE variable=r0t2 type=ram_1p impl=uram
    #pragma HLS BIND_STORAGE variable=r0t3 type=ram_1p impl=uram
    #pragma HLS BIND_STORAGE variable=r1t0 type=ram_1p impl=uram
    #pragma HLS BIND_STORAGE variable=r1t1 type=ram_1p impl=uram
    #pragma HLS BIND_STORAGE variable=r1t2 type=ram_1p impl=uram
    #pragma HLS BIND_STORAGE variable=r1t3 type=ram_1p impl=uram
    #pragma HLS BIND_STORAGE variable=r2t0 type=ram_1p impl=uram
    #pragma HLS BIND_STORAGE variable=r2t1 type=ram_1p impl=uram
    #pragma HLS BIND_STORAGE variable=r2t2 type=ram_1p impl=uram
    #pragma HLS BIND_STORAGE variable=r2t3 type=ram_1p impl=uram
    #pragma HLS BIND_STORAGE variable=r3t0 type=ram_1p impl=uram
    #pragma HLS BIND_STORAGE variable=r3t1 type=ram_1p impl=uram
    #pragma HLS BIND_STORAGE variable=r3t2 type=ram_1p impl=uram
    #pragma HLS BIND_STORAGE variable=r3t3 type=ram_1p impl=uram

    float  d0[WV_BLOCKS_PER_ROW], dmin0[WV_BLOCKS_PER_ROW];
    float  d1[WV_BLOCKS_PER_ROW], dmin1[WV_BLOCKS_PER_ROW];
    float  d2[WV_BLOCKS_PER_ROW], dmin2[WV_BLOCKS_PER_ROW];
    float  d3[WV_BLOCKS_PER_ROW], dmin3[WV_BLOCKS_PER_ROW];
    int8_t sc60[WV_BLOCKS_PER_ROW][8], mn60[WV_BLOCKS_PER_ROW][8];
    int8_t sc61[WV_BLOCKS_PER_ROW][8], mn61[WV_BLOCKS_PER_ROW][8];
    int8_t sc62[WV_BLOCKS_PER_ROW][8], mn62[WV_BLOCKS_PER_ROW][8];
    int8_t sc63[WV_BLOCKS_PER_ROW][8], mn63[WV_BLOCKS_PER_ROW][8];

    COMPUTE_X2: for (int row = 0; row < FFN_DIM; row += 4) {
        load_row_wv_urm(V_wide, row,     r0t0, r0t1, r0t2, r0t3, d0, dmin0, sc60, mn60);
        load_row_wv_urm(V_wide, row + 1, r1t0, r1t1, r1t2, r1t3, d1, dmin1, sc61, mn61);
        load_row_wv_urm(V_wide, row + 2, r2t0, r2t1, r2t2, r2t3, d2, dmin2, sc62, mn62);
        load_row_wv_urm(V_wide, row + 3, r3t0, r3t1, r3t2, r3t3, d3, dmin3, sc63, mn63);

        float r0, r1, r2, r3;
        mac_blocks_wv_k4_urm(
            r0t0, r0t1, r0t2, r0t3, r1t0, r1t1, r1t2, r1t3,
            r2t0, r2t1, r2t2, r2t3, r3t0, r3t1, r3t2, r3t3,
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
// Load: 4 sequential calls to load_row_down_urm (one per row).
// MAC:  4 groups sequential × 4 rows UNROLL'd = 1024 cycles.
// Total: 1280 (load) + 1024 (MAC) = 2304 cycles/4-rows → 1.18M total.
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

        // 4 groups × 4 rows = 16 URAM nibble tiles, declared outside loop
        ap_uint<32> g0r0[URM_NIB_TILE_DEPTH], g0r1[URM_NIB_TILE_DEPTH], g0r2[URM_NIB_TILE_DEPTH], g0r3[URM_NIB_TILE_DEPTH];
        ap_uint<32> g1r0[URM_NIB_TILE_DEPTH], g1r1[URM_NIB_TILE_DEPTH], g1r2[URM_NIB_TILE_DEPTH], g1r3[URM_NIB_TILE_DEPTH];
        ap_uint<32> g2r0[URM_NIB_TILE_DEPTH], g2r1[URM_NIB_TILE_DEPTH], g2r2[URM_NIB_TILE_DEPTH], g2r3[URM_NIB_TILE_DEPTH];
        ap_uint<32> g3r0[URM_NIB_TILE_DEPTH], g3r1[URM_NIB_TILE_DEPTH], g3r2[URM_NIB_TILE_DEPTH], g3r3[URM_NIB_TILE_DEPTH];
        #pragma HLS BIND_STORAGE variable=g0r0 type=ram_1p impl=uram
        #pragma HLS BIND_STORAGE variable=g0r1 type=ram_1p impl=uram
        #pragma HLS BIND_STORAGE variable=g0r2 type=ram_1p impl=uram
        #pragma HLS BIND_STORAGE variable=g0r3 type=ram_1p impl=uram
        #pragma HLS BIND_STORAGE variable=g1r0 type=ram_1p impl=uram
        #pragma HLS BIND_STORAGE variable=g1r1 type=ram_1p impl=uram
        #pragma HLS BIND_STORAGE variable=g1r2 type=ram_1p impl=uram
        #pragma HLS BIND_STORAGE variable=g1r3 type=ram_1p impl=uram
        #pragma HLS BIND_STORAGE variable=g2r0 type=ram_1p impl=uram
        #pragma HLS BIND_STORAGE variable=g2r1 type=ram_1p impl=uram
        #pragma HLS BIND_STORAGE variable=g2r2 type=ram_1p impl=uram
        #pragma HLS BIND_STORAGE variable=g2r3 type=ram_1p impl=uram
        #pragma HLS BIND_STORAGE variable=g3r0 type=ram_1p impl=uram
        #pragma HLS BIND_STORAGE variable=g3r1 type=ram_1p impl=uram
        #pragma HLS BIND_STORAGE variable=g3r2 type=ram_1p impl=uram
        #pragma HLS BIND_STORAGE variable=g3r3 type=ram_1p impl=uram

        // Headers: 4 rows × 32 blocks
        float  d0[DOWN_BLOCKS_PER_ROW], dmin0[DOWN_BLOCKS_PER_ROW];
        float  d1[DOWN_BLOCKS_PER_ROW], dmin1[DOWN_BLOCKS_PER_ROW];
        float  d2[DOWN_BLOCKS_PER_ROW], dmin2[DOWN_BLOCKS_PER_ROW];
        float  d3[DOWN_BLOCKS_PER_ROW], dmin3[DOWN_BLOCKS_PER_ROW];
        int8_t sc60[DOWN_BLOCKS_PER_ROW][8], mn60[DOWN_BLOCKS_PER_ROW][8];
        int8_t sc61[DOWN_BLOCKS_PER_ROW][8], mn61[DOWN_BLOCKS_PER_ROW][8];
        int8_t sc62[DOWN_BLOCKS_PER_ROW][8], mn62[DOWN_BLOCKS_PER_ROW][8];
        int8_t sc63[DOWN_BLOCKS_PER_ROW][8], mn63[DOWN_BLOCKS_PER_ROW][8];
        #pragma HLS ARRAY_PARTITION variable=d0    complete
        #pragma HLS ARRAY_PARTITION variable=dmin0 complete
        #pragma HLS ARRAY_PARTITION variable=d1    complete
        #pragma HLS ARRAY_PARTITION variable=dmin1 complete
        #pragma HLS ARRAY_PARTITION variable=d2    complete
        #pragma HLS ARRAY_PARTITION variable=dmin2 complete
        #pragma HLS ARRAY_PARTITION variable=d3    complete
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
            // Load 4 rows — each populates one group's 4-row URAM tiles
            load_row_down_urm(W_down_wide, out_i,
                               g0r0, g1r0, g2r0, g3r0, d0, dmin0, sc60, mn60);
            load_row_down_urm(W_down_wide, out_i + 1,
                               g0r1, g1r1, g2r1, g3r1, d1, dmin1, sc61, mn61);
            load_row_down_urm(W_down_wide, out_i + 2,
                               g0r2, g1r2, g2r2, g3r2, d2, dmin2, sc62, mn62);
            load_row_down_urm(W_down_wide, out_i + 3,
                               g0r3, g1r3, g2r3, g3r3, d3, dmin3, sc63, mn63);

            mac_blocks_down_q4k_k4_urm(
                g0r0, g0r1, g0r2, g0r3, g1r0, g1r1, g1r2, g1r3,
                g2r0, g2r1, g2r2, g2r3, g3r0, g3r1, g3r2, g3r3,
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
    // URM DDR layout: WV=80 words/row (1280 B), Down=320 words/row (5120 B)
    // W/V: 8192 rows × 1280 = 10,485,760 B   W_down: 2048 rows × 5120 = 10,485,760 B
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
