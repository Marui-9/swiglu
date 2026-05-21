#include "swiglu.h"
#include "sigmoid_lut.h"
#include <stdint.h>
#include <string.h>
#include <ap_int.h>
#include <ap_fixed.h>

// ─── Fixed-point types for DSP-mapped REDUCE loops ───────────────────────────
// fxd_scale_t: maps float d values (typically 0.001-6.0), fits DSP48E2 input
// fxd_accum_t: 56-bit accumulator, 38 fractional bits.  Default AP_WRAP+AP_TRN
//   avoids extra rounding/saturation LUTs — testbench data is constrained to
//   keep 64-block Q4_0 accumulation within the ±131K range.
typedef ap_fixed<32,8>  fxd_scale_t;
typedef ap_fixed<56,38> fxd_accum_t;

// ─── Float from uint32_t bits ─────────────────────────────────────────────────
static inline float float_from_bits(uint32_t u) {
    union { uint32_t u; float f; } c;
    c.u = u;
    return c.f;
}

// ============================================================================
// Q4_0 WV Merged Load — K=6 rows in one AXI burst
// ============================================================================

// load_4_rows_wv_q40: merged load of 4 WV rows, one AXI burst.
static void load_4_rows_wv_q40(
    const ap_uint<128> *W_wide,
    int base_row,
    ap_uint<128> nib_r0[64], ap_uint<128> nib_r1[64],
    ap_uint<128> nib_r2[64], ap_uint<128> nib_r3[64],
    float d[K_WV][Q40_WV_BLOCKS])
{
#pragma HLS INLINE off

    LOAD_HDR: for (int i = 0; i < K_WV * Q40_WV_HDR_WORDS; i++) {
        #pragma HLS PIPELINE II=1
        int r = i / Q40_WV_HDR_WORDS;
        int w = i % Q40_WV_HDR_WORDS;
        ap_uint<128> ddr = W_wide[(ap_uint<64>)(base_row + r) * Q40_WV_ROW_WORDS + w];

        d[r][w*4 + 0] = float_from_bits((uint32_t)ddr.range(31,  0));
        d[r][w*4 + 1] = float_from_bits((uint32_t)ddr.range(63,  32));
        d[r][w*4 + 2] = float_from_bits((uint32_t)ddr.range(95,  64));
        d[r][w*4 + 3] = float_from_bits((uint32_t)ddr.range(127, 96));
    }

    LOAD_NIB: for (int i = 0; i < K_WV * Q40_WV_NIB_WORDS; i++) {
        #pragma HLS PIPELINE II=1
        int r = i / Q40_WV_NIB_WORDS;
        int e = i % Q40_WV_NIB_WORDS;
        ap_uint<128> ddr = W_wide[(ap_uint<64>)(base_row + r) * Q40_WV_ROW_WORDS
                                    + Q40_WV_HDR_WORDS + e];

        if      (r == 0) nib_r0[e] = ddr;
        else if (r == 1) nib_r1[e] = ddr;
        else if (r == 2) nib_r2[e] = ddr;
        else             nib_r3[e] = ddr;
    }
}

// ============================================================================
// Q4_0 WV MAC — K=4, 32 chains, II=1 native (no sub-group fix needed)
// ============================================================================

static void mac_blocks_wv_k4_q40(
    const ap_uint<128> nib_r0[64], const ap_uint<128> nib_r1[64],
    const ap_uint<128> nib_r2[64], const ap_uint<128> nib_r3[64],
    const float d[K_WV][Q40_WV_BLOCKS],
    const int8_t  x[Q40_WV_GROUPS][256],
    float  x_scale,
    float *result0, float *result1, float *result2, float *result3)
{
#pragma HLS INLINE off
#pragma HLS BIND_OP op=mul impl=dsp
    fxd_accum_t total0 = 0, total1 = 0, total2 = 0, total3 = 0;

    MAC_GROUPS: for (int g = 0; g < Q40_WV_GROUPS; g++) {
        int32_t acc0[8][4], acc1[8][4], acc2[8][4], acc3[8][4];
        #pragma HLS ARRAY_PARTITION variable=acc0 dim=0 complete
        #pragma HLS ARRAY_PARTITION variable=acc1 dim=0 complete
        #pragma HLS ARRAY_PARTITION variable=acc2 dim=0 complete
        #pragma HLS ARRAY_PARTITION variable=acc3 dim=0 complete

        INIT_GRP: for (int b = 0; b < 8; b++) {
            #pragma HLS UNROLL
            for (int k = 0; k < 4; k++) {
                #pragma HLS UNROLL
                acc0[b][k] = 0; acc1[b][k] = 0;
                acc2[b][k] = 0; acc3[b][k] = 0;
            }
        }

        MAC_ALL: for (int n = 0; n < 32; n++) {
            #pragma HLS PIPELINE II=1
            int idx = g * 8 + (n >> 2);
            int s   = n & 3;
            int k   = n & 3;

            ap_uint<128> w0 = nib_r0[idx], w1 = nib_r1[idx];
            ap_uint<128> w2 = nib_r2[idx], w3 = nib_r3[idx];

            ap_uint<32> wr0, wr1, wr2, wr3;
            if      (s == 0) { wr0 = w0.range(31,  0);  wr1 = w1.range(31,  0);  wr2 = w2.range(31,  0);  wr3 = w3.range(31,  0);  }
            else if (s == 1) { wr0 = w0.range(63,  32); wr1 = w1.range(63,  32); wr2 = w2.range(63,  32); wr3 = w3.range(63,  32); }
            else if (s == 2) { wr0 = w0.range(95,  64); wr1 = w1.range(95,  64); wr2 = w2.range(95,  64); wr3 = w3.range(95,  64); }
            else             { wr0 = w0.range(127, 96); wr1 = w1.range(127, 96); wr2 = w2.range(127, 96); wr3 = w3.range(127, 96); }

            for (int b = 0; b < 8; b++) {
                #pragma HLS UNROLL
                ap_int<8>  xi8 = (ap_int<8>)x[g][b * 32 + n];
                ap_uint<4> nb0 = wr0.range(b*4+3, b*4);
                ap_uint<4> nb1 = wr1.range(b*4+3, b*4);
                ap_uint<4> nb2 = wr2.range(b*4+3, b*4);
                ap_uint<4> nb3 = wr3.range(b*4+3, b*4);

                acc0[b][k] += (int32_t)(xi8 * ((ap_int<5>)nb0 - 8));
                acc1[b][k] += (int32_t)(xi8 * ((ap_int<5>)nb1 - 8));
                acc2[b][k] += (int32_t)(xi8 * ((ap_int<5>)nb2 - 8));
                acc3[b][k] += (int32_t)(xi8 * ((ap_int<5>)nb3 - 8));
            }
        }

        REDUCE_GRP: for (int b = 0; b < 8; b++) {
            #pragma HLS PIPELINE II=1
            int abs_b = g * 8 + b;
            int32_t sw0 = 0, sw1 = 0, sw2 = 0, sw3 = 0;
            for (int k = 0; k < 4; k++) {
                #pragma HLS UNROLL
                sw0 += acc0[b][k]; sw1 += acc1[b][k];
                sw2 += acc2[b][k]; sw3 += acc3[b][k];
            }
            total0 += (fxd_scale_t)d[0][abs_b] * (fxd_accum_t)sw0;
            total1 += (fxd_scale_t)d[1][abs_b] * (fxd_accum_t)sw1;
            total2 += (fxd_scale_t)d[2][abs_b] * (fxd_accum_t)sw2;
            total3 += (fxd_scale_t)d[3][abs_b] * (fxd_accum_t)sw3;
        }
    }

    *result0 = (float)total0 * x_scale; *result1 = (float)total1 * x_scale;
    *result2 = (float)total2 * x_scale; *result3 = (float)total3 * x_scale;
}

// ============================================================================
// Q4_0 Output Path — merged load, K=4, 128 pre-allocated BRAM tiles
// ============================================================================

// load_mg_down_q40: per-meta-group merged load.  4 rows × 40 DDR words = 160
// words in one AXI burst.  16 BRAM tiles (4 groups × 4 rows) filled per call.
static void load_mg_down_q40(
    const ap_uint<128> *Wd_wide,
    int out_i,
    int mg,
    ap_uint<32> g0_r0[Q40_NIB_ELEMS], ap_uint<32> g1_r0[Q40_NIB_ELEMS],
    ap_uint<32> g2_r0[Q40_NIB_ELEMS], ap_uint<32> g3_r0[Q40_NIB_ELEMS],
    ap_uint<32> g0_r1[Q40_NIB_ELEMS], ap_uint<32> g1_r1[Q40_NIB_ELEMS],
    ap_uint<32> g2_r1[Q40_NIB_ELEMS], ap_uint<32> g3_r1[Q40_NIB_ELEMS],
    ap_uint<32> g0_r2[Q40_NIB_ELEMS], ap_uint<32> g1_r2[Q40_NIB_ELEMS],
    ap_uint<32> g2_r2[Q40_NIB_ELEMS], ap_uint<32> g3_r2[Q40_NIB_ELEMS],
    ap_uint<32> g0_r3[Q40_NIB_ELEMS], ap_uint<32> g1_r3[Q40_NIB_ELEMS],
    ap_uint<32> g2_r3[Q40_NIB_ELEMS], ap_uint<32> g3_r3[Q40_NIB_ELEMS],
    float d_r0[32], float d_r1[32], float d_r2[32], float d_r3[32])
{
#pragma HLS INLINE off

    LOAD_MG_HDR: for (int i = 0; i < K_DOWN * 8; i++) {
        #pragma HLS PIPELINE II=1
        int r = i / 8;
        int w = i % 8;
        ap_uint<128> ddr = Wd_wide[(ap_uint<64>)(out_i + r) * Q40_DOWN_ROW_WORDS
                                    + (ap_uint<64>)mg * 8 + w];
        if      (r == 0) { d_r0[w*4] = float_from_bits((uint32_t)ddr.range(31,0));
                           d_r0[w*4+1] = float_from_bits((uint32_t)ddr.range(63,32));
                           d_r0[w*4+2] = float_from_bits((uint32_t)ddr.range(95,64));
                           d_r0[w*4+3] = float_from_bits((uint32_t)ddr.range(127,96)); }
        else if (r == 1) { d_r1[w*4] = float_from_bits((uint32_t)ddr.range(31,0));
                           d_r1[w*4+1] = float_from_bits((uint32_t)ddr.range(63,32));
                           d_r1[w*4+2] = float_from_bits((uint32_t)ddr.range(95,64));
                           d_r1[w*4+3] = float_from_bits((uint32_t)ddr.range(127,96)); }
        else if (r == 2) { d_r2[w*4] = float_from_bits((uint32_t)ddr.range(31,0));
                           d_r2[w*4+1] = float_from_bits((uint32_t)ddr.range(63,32));
                           d_r2[w*4+2] = float_from_bits((uint32_t)ddr.range(95,64));
                           d_r2[w*4+3] = float_from_bits((uint32_t)ddr.range(127,96)); }
        else             { d_r3[w*4] = float_from_bits((uint32_t)ddr.range(31,0));
                           d_r3[w*4+1] = float_from_bits((uint32_t)ddr.range(63,32));
                           d_r3[w*4+2] = float_from_bits((uint32_t)ddr.range(95,64));
                           d_r3[w*4+3] = float_from_bits((uint32_t)ddr.range(127,96)); }
    }

    LOAD_MG_NIB: for (int i = 0; i < K_DOWN * 32; i++) {
        #pragma HLS PIPELINE II=1
        int r = i / 32;
        int e = i % 32;
        ap_uint<128> ddr = Wd_wide[(ap_uint<64>)(out_i + r) * Q40_DOWN_ROW_WORDS
                                    + Q40_DOWN_HDR_WORDS
                                    + (ap_uint<64>)mg * 32 + e];
        if (r == 0) {
            g0_r0[e] = ddr.range(31,  0);  g1_r0[e] = ddr.range(63,  32);
            g2_r0[e] = ddr.range(95,  64); g3_r0[e] = ddr.range(127, 96);
        } else if (r == 1) {
            g0_r1[e] = ddr.range(31,  0);  g1_r1[e] = ddr.range(63,  32);
            g2_r1[e] = ddr.range(95,  64); g3_r1[e] = ddr.range(127, 96);
        } else if (r == 2) {
            g0_r2[e] = ddr.range(31,  0);  g1_r2[e] = ddr.range(63,  32);
            g2_r2[e] = ddr.range(95,  64); g3_r2[e] = ddr.range(127, 96);
        } else {
            g0_r3[e] = ddr.range(31,  0);  g1_r3[e] = ddr.range(63,  32);
            g2_r3[e] = ddr.range(95,  64); g3_r3[e] = ddr.range(127, 96);
        }
    }
}

// mac_mg_down_q40: process one meta-group (4 groups) for K_DOWN output rows.
static void mac_mg_down_q40(
    ap_uint<32> g0_r0[Q40_NIB_ELEMS], ap_uint<32> g1_r0[Q40_NIB_ELEMS],
    ap_uint<32> g2_r0[Q40_NIB_ELEMS], ap_uint<32> g3_r0[Q40_NIB_ELEMS],
    ap_uint<32> g0_r1[Q40_NIB_ELEMS], ap_uint<32> g1_r1[Q40_NIB_ELEMS],
    ap_uint<32> g2_r1[Q40_NIB_ELEMS], ap_uint<32> g3_r1[Q40_NIB_ELEMS],
    ap_uint<32> g0_r2[Q40_NIB_ELEMS], ap_uint<32> g1_r2[Q40_NIB_ELEMS],
    ap_uint<32> g2_r2[Q40_NIB_ELEMS], ap_uint<32> g3_r2[Q40_NIB_ELEMS],
    ap_uint<32> g0_r3[Q40_NIB_ELEMS], ap_uint<32> g1_r3[Q40_NIB_ELEMS],
    ap_uint<32> g2_r3[Q40_NIB_ELEMS], ap_uint<32> g3_r3[Q40_NIB_ELEMS],
    const float d_r0[32], const float d_r1[32],
    const float d_r2[32], const float d_r3[32],
    const int8_t gate[Q40_DOWN_BLOCKS][Q40_NIB_ELEMS],
    int mg,
    fxd_accum_t *total0, fxd_accum_t *total1,
    fxd_accum_t *total2, fxd_accum_t *total3)
{
#pragma HLS INLINE off
#pragma HLS BIND_OP op=mul impl=dsp

    MG_GROUPS: for (int kg = 0; kg < 4; kg++) {
        int abs_g = mg * 4 + kg;
        int32_t acc0[8][4], acc1[8][4], acc2[8][4], acc3[8][4];
        #pragma HLS ARRAY_PARTITION variable=acc0 dim=0 complete
        #pragma HLS ARRAY_PARTITION variable=acc1 dim=0 complete
        #pragma HLS ARRAY_PARTITION variable=acc2 dim=0 complete
        #pragma HLS ARRAY_PARTITION variable=acc3 dim=0 complete

        INIT_MG: for (int b = 0; b < 8; b++) {
            #pragma HLS UNROLL
            for (int k = 0; k < 4; k++) {
                #pragma HLS UNROLL
                acc0[b][k] = 0; acc1[b][k] = 0;
                acc2[b][k] = 0; acc3[b][k] = 0;
            }
        }

        MAC_MG: for (int n = 0; n < 32; n++) {
            #pragma HLS PIPELINE II=1
            int k = n & 3;
            ap_uint<32> wr0, wr1, wr2, wr3;
            if (kg == 0) {
                wr0 = g0_r0[n]; wr1 = g0_r1[n]; wr2 = g0_r2[n]; wr3 = g0_r3[n];
            } else if (kg == 1) {
                wr0 = g1_r0[n]; wr1 = g1_r1[n]; wr2 = g1_r2[n]; wr3 = g1_r3[n];
            } else if (kg == 2) {
                wr0 = g2_r0[n]; wr1 = g2_r1[n]; wr2 = g2_r2[n]; wr3 = g2_r3[n];
            } else {
                wr0 = g3_r0[n]; wr1 = g3_r1[n]; wr2 = g3_r2[n]; wr3 = g3_r3[n];
            }
            for (int b = 0; b < 8; b++) {
                #pragma HLS UNROLL
                int abs_b = abs_g * 8 + b;
                ap_int<8>  gi8 = (ap_int<8>)gate[abs_b][n];
                ap_uint<4> nb0 = wr0.range(b*4+3, b*4);
                ap_uint<4> nb1 = wr1.range(b*4+3, b*4);
                ap_uint<4> nb2 = wr2.range(b*4+3, b*4);
                ap_uint<4> nb3 = wr3.range(b*4+3, b*4);
                acc0[b][k] += (int32_t)(gi8 * ((ap_int<5>)nb0 - 8));
                acc1[b][k] += (int32_t)(gi8 * ((ap_int<5>)nb1 - 8));
                acc2[b][k] += (int32_t)(gi8 * ((ap_int<5>)nb2 - 8));
                acc3[b][k] += (int32_t)(gi8 * ((ap_int<5>)nb3 - 8));
            }
        }

        REDUCE_MG: for (int b = 0; b < 8; b++) {
            #pragma HLS PIPELINE II=1
            int abs_b = abs_g * 8 + b;
            int32_t sw0 = 0, sw1 = 0, sw2 = 0, sw3 = 0;
            for (int k = 0; k < 4; k++) {
                #pragma HLS UNROLL
                sw0 += acc0[b][k]; sw1 += acc1[b][k];
                sw2 += acc2[b][k]; sw3 += acc3[b][k];
            }
            *total0 += (fxd_scale_t)d_r0[abs_b - mg*32] * (fxd_accum_t)sw0;
            *total1 += (fxd_scale_t)d_r1[abs_b - mg*32] * (fxd_accum_t)sw1;
            *total2 += (fxd_scale_t)d_r2[abs_b - mg*32] * (fxd_accum_t)sw2;
            *total3 += (fxd_scale_t)d_r3[abs_b - mg*32] * (fxd_accum_t)sw3;
        }
    }
}

// ============================================================================
// Phase 2 & 3: compute_X1 / compute_X2 — K=4, merged loads
// ============================================================================

static int8_t quantize_x12(float r) {
#pragma HLS INLINE off
    float fq = r * X12_INV_SCALE;
    int   iq = (int)(fq + (fq >= 0.f ? 0.5f : -0.5f));
    if (iq >  127) iq =  127;
    if (iq < -128) iq = -128;
    return (int8_t)iq;
}

static void compute_X1(
    const uint8_t  *W,
    const int8_t   x_local_1[MAX_BATCH][Q40_WV_GROUPS][256],
    float          x_scale,
    int8_t         X1_cache[MAX_BATCH][FFN_DIM])
{
#pragma HLS INLINE off
#pragma HLS ARRAY_PARTITION variable=x_local_1 dim=2 complete
    const ap_uint<128> *W_wide = (const ap_uint<128>*)W;

    ap_uint<128> nib_r0[64], nib_r1[64], nib_r2[64], nib_r3[64];
    #pragma HLS BIND_STORAGE variable=nib_r0 type=ram_1p impl=bram
    #pragma HLS BIND_STORAGE variable=nib_r1 type=ram_1p impl=bram
    #pragma HLS BIND_STORAGE variable=nib_r2 type=ram_1p impl=bram
    #pragma HLS BIND_STORAGE variable=nib_r3 type=ram_1p impl=bram

    float d[K_WV][Q40_WV_BLOCKS];
    #pragma HLS ARRAY_PARTITION variable=d dim=0 complete

    COMPUTE_X1: for (int row = 0; row < FFN_DIM; row += K_WV) {
        load_4_rows_wv_q40(W_wide, row,
                            nib_r0, nib_r1, nib_r2, nib_r3, d);

        float r0, r1, r2, r3;
        mac_blocks_wv_k4_q40(
            nib_r0, nib_r1, nib_r2, nib_r3,
            d, x_local_1[0], x_scale,
            &r0, &r1, &r2, &r3);

        X1_cache[0][row + 0] = quantize_x12(r0);
        X1_cache[0][row + 1] = quantize_x12(r1);
        X1_cache[0][row + 2] = quantize_x12(r2);
        X1_cache[0][row + 3] = quantize_x12(r3);
    }
}

static void compute_X2(
    const uint8_t  *V,
    const int8_t   x_local_2[MAX_BATCH][Q40_WV_GROUPS][256],
    float          x_scale,
    int8_t         X2_cache[MAX_BATCH][FFN_DIM])
{
#pragma HLS INLINE off
#pragma HLS ARRAY_PARTITION variable=x_local_2 dim=2 complete
    const ap_uint<128> *V_wide = (const ap_uint<128>*)V;

    ap_uint<128> nib_r0[64], nib_r1[64], nib_r2[64], nib_r3[64];
    #pragma HLS BIND_STORAGE variable=nib_r0 type=ram_1p impl=bram
    #pragma HLS BIND_STORAGE variable=nib_r1 type=ram_1p impl=bram
    #pragma HLS BIND_STORAGE variable=nib_r2 type=ram_1p impl=bram
    #pragma HLS BIND_STORAGE variable=nib_r3 type=ram_1p impl=bram

    float d[K_WV][Q40_WV_BLOCKS];
    #pragma HLS ARRAY_PARTITION variable=d dim=0 complete

    COMPUTE_X2: for (int row = 0; row < FFN_DIM; row += K_WV) {
        load_4_rows_wv_q40(V_wide, row,
                            nib_r0, nib_r1, nib_r2, nib_r3, d);

        float r0, r1, r2, r3;
        mac_blocks_wv_k4_q40(
            nib_r0, nib_r1, nib_r2, nib_r3,
            d, x_local_2[0], x_scale,
            &r0, &r1, &r2, &r3);

        X2_cache[0][row + 0] = quantize_x12(r0);
        X2_cache[0][row + 1] = quantize_x12(r1);
        X2_cache[0][row + 2] = quantize_x12(r2);
        X2_cache[0][row + 3] = quantize_x12(r3);
    }
}

// ============================================================================
// Phase 4: compute_gate — SiLU(X1) × X2, INT8 quantized
// ============================================================================

static void compute_gate(
    const int8_t X1_cache[MAX_BATCH][FFN_DIM],
    const int8_t X2_cache[MAX_BATCH][FFN_DIM],
    int8_t       gate_cache[MAX_BATCH][Q40_DOWN_BLOCKS][Q40_NIB_ELEMS],
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
            // Q4_0 gate indexing: block = j/32, elem = j%32
            gate_cache[n][j >> 5][j & 31] = (int8_t)iq;
        }
    }
}

// ============================================================================
// Phase 5: compute_output — merged load, 128 BRAM tiles, K=4
// ============================================================================

static void compute_output(
    const uint8_t  *W_down,
    const int8_t   gate_cache[MAX_BATCH][Q40_DOWN_BLOCKS][Q40_NIB_ELEMS],
    const float    gate_scale_array[MAX_BATCH],
    float         *out_batch)
{
#pragma HLS INLINE off
#pragma HLS ARRAY_PARTITION variable=gate_cache dim=1 cyclic factor=8

    const ap_uint<128> *W_down_wide = (const ap_uint<128>*)W_down;
    float gate_scale = gate_scale_array[0];
    float out_local[VECTOR_DIM];
    #pragma HLS BIND_STORAGE variable=out_local type=ram_1p impl=bram

    // 16 time-multiplexed BRAM tiles: 4 groups × 4 rows, reused across meta-groups
    ap_uint<32> g0_r0[Q40_NIB_ELEMS], g1_r0[Q40_NIB_ELEMS];
    ap_uint<32> g2_r0[Q40_NIB_ELEMS], g3_r0[Q40_NIB_ELEMS];
    ap_uint<32> g0_r1[Q40_NIB_ELEMS], g1_r1[Q40_NIB_ELEMS];
    ap_uint<32> g2_r1[Q40_NIB_ELEMS], g3_r1[Q40_NIB_ELEMS];
    ap_uint<32> g0_r2[Q40_NIB_ELEMS], g1_r2[Q40_NIB_ELEMS];
    ap_uint<32> g2_r2[Q40_NIB_ELEMS], g3_r2[Q40_NIB_ELEMS];
    ap_uint<32> g0_r3[Q40_NIB_ELEMS], g1_r3[Q40_NIB_ELEMS];
    ap_uint<32> g2_r3[Q40_NIB_ELEMS], g3_r3[Q40_NIB_ELEMS];
    #pragma HLS BIND_STORAGE variable=g0_r0 type=ram_1p impl=bram
    #pragma HLS BIND_STORAGE variable=g1_r0 type=ram_1p impl=bram
    #pragma HLS BIND_STORAGE variable=g2_r0 type=ram_1p impl=bram
    #pragma HLS BIND_STORAGE variable=g3_r0 type=ram_1p impl=bram
    #pragma HLS BIND_STORAGE variable=g0_r1 type=ram_1p impl=bram
    #pragma HLS BIND_STORAGE variable=g1_r1 type=ram_1p impl=bram
    #pragma HLS BIND_STORAGE variable=g2_r1 type=ram_1p impl=bram
    #pragma HLS BIND_STORAGE variable=g3_r1 type=ram_1p impl=bram
    #pragma HLS BIND_STORAGE variable=g0_r2 type=ram_1p impl=bram
    #pragma HLS BIND_STORAGE variable=g1_r2 type=ram_1p impl=bram
    #pragma HLS BIND_STORAGE variable=g2_r2 type=ram_1p impl=bram
    #pragma HLS BIND_STORAGE variable=g3_r2 type=ram_1p impl=bram
    #pragma HLS BIND_STORAGE variable=g0_r3 type=ram_1p impl=bram
    #pragma HLS BIND_STORAGE variable=g1_r3 type=ram_1p impl=bram
    #pragma HLS BIND_STORAGE variable=g2_r3 type=ram_1p impl=bram
    #pragma HLS BIND_STORAGE variable=g3_r3 type=ram_1p impl=bram

    DOWN_Q40: for (int out_i = 0; out_i < VECTOR_DIM; out_i += K_DOWN) {
        fxd_accum_t total0 = 0, total1 = 0, total2 = 0, total3 = 0;

        META_GROUPS: for (int mg = 0; mg < Q40_DOWN_MG; mg++) {
            float d_r0[32], d_r1[32], d_r2[32], d_r3[32];
            #pragma HLS ARRAY_PARTITION variable=d_r0 complete
            #pragma HLS ARRAY_PARTITION variable=d_r1 complete
            #pragma HLS ARRAY_PARTITION variable=d_r2 complete
            #pragma HLS ARRAY_PARTITION variable=d_r3 complete

            load_mg_down_q40(W_down_wide, out_i, mg,
                             g0_r0, g1_r0, g2_r0, g3_r0,
                             g0_r1, g1_r1, g2_r1, g3_r1,
                             g0_r2, g1_r2, g2_r2, g3_r2,
                             g0_r3, g1_r3, g2_r3, g3_r3,
                             d_r0, d_r1, d_r2, d_r3);

            mac_mg_down_q40(
                g0_r0, g1_r0, g2_r0, g3_r0,
                g0_r1, g1_r1, g2_r1, g3_r1,
                g0_r2, g1_r2, g2_r2, g3_r2,
                g0_r3, g1_r3, g2_r3, g3_r3,
                d_r0, d_r1, d_r2, d_r3,
                gate_cache[0], mg,
                &total0, &total1, &total2, &total3);
        }

        out_local[out_i]     = (float)total0 * gate_scale;
        out_local[out_i + 1] = (float)total1 * gate_scale;
        out_local[out_i + 2] = (float)total2 * gate_scale;
        out_local[out_i + 3] = (float)total3 * gate_scale;
    }
    memcpy(out_batch, out_local, VECTOR_DIM * sizeof(float));
}

// ============================================================================
// Phase 1: load_x_local (unchanged — same shape [1][8][256])
// ============================================================================

static void load_x_local(
    const int8_t  *x_batch,
    int8_t        x_local_1[MAX_BATCH][Q40_WV_GROUPS][256],
    int8_t        x_local_2[MAX_BATCH][Q40_WV_GROUPS][256])
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
// Top Level: swiglu — DATAFLOW orchestration
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
    // Q4_0 DDR layout:
    // W/V:   8192 rows × 1280 B (80 DDR words) = 10,485,760 B
    // W_down: 2048 rows × 5120 B (320 DDR words) = 10,485,760 B
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

    int8_t x_local_1[MAX_BATCH][Q40_WV_GROUPS][256];
    #pragma HLS BIND_STORAGE variable=x_local_1 type=ram_1p impl=lutram
    #pragma HLS ARRAY_PARTITION variable=x_local_1 dim=2 complete

    int8_t x_local_2[MAX_BATCH][Q40_WV_GROUPS][256];
    #pragma HLS BIND_STORAGE variable=x_local_2 type=ram_1p impl=lutram
    #pragma HLS ARRAY_PARTITION variable=x_local_2 dim=2 complete

    int8_t X1_cache[MAX_BATCH][FFN_DIM];
    int8_t X2_cache[MAX_BATCH][FFN_DIM];
    #pragma HLS BIND_STORAGE variable=X1_cache type=ram_2p impl=bram
    #pragma HLS BIND_STORAGE variable=X2_cache type=ram_2p impl=bram

    int8_t gate_cache[MAX_BATCH][Q40_DOWN_BLOCKS][Q40_NIB_ELEMS];
    #pragma HLS BIND_STORAGE variable=gate_cache type=ram_1p impl=uram
    #pragma HLS ARRAY_PARTITION variable=gate_cache dim=1 cyclic factor=8

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
    compute_output(W_down, gate_cache, gate_scale, out_batch);
}
