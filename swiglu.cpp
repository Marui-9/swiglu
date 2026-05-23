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
typedef ap_fixed<18,8>  fxd_scale_t;   // fits DSP48E2 18-bit B input (was 32-bit)
typedef ap_fixed<56,38> fxd_accum_t;
typedef ap_int<48>     dsp_acc_t;   // DSP48E2 P register — 48-bit signed accumulation

// ─── Float from uint32_t bits ─────────────────────────────────────────────────
static inline float float_from_bits(uint32_t u) {
    union { uint32_t u; float f; } c;
    c.u = u;
    return c.f;
}
static inline fxd_scale_t fxd_from_raw(int32_t raw) {
    union { int32_t i; fxd_scale_t f; } u;
    u.i = raw;
    return u.f;
}

// ============================================================================
// Q4_0 WV Merged Load — K_WV=12 rows, one AXI burst, sub-group-major DDR
// ============================================================================

static void load_12_rows_wv_q40(
    const ap_uint<128> *W_wide,
    int base_row,
    ap_uint<128> nib_r0[64],  ap_uint<128> nib_r1[64],
    ap_uint<128> nib_r2[64],  ap_uint<128> nib_r3[64],
    ap_uint<128> nib_r4[64],  ap_uint<128> nib_r5[64],
    ap_uint<128> nib_r6[64],  ap_uint<128> nib_r7[64],
    ap_uint<128> nib_r8[64],  ap_uint<128> nib_r9[64],
    ap_uint<128> nib_r10[64], ap_uint<128> nib_r11[64],
    fxd_scale_t d[K_WV][Q40_WV_BLOCKS])
{
#pragma HLS INLINE off

    LOAD_HDR: for (int i = 0; i < K_WV * Q40_WV_HDR_WORDS; i++) {
        #pragma HLS PIPELINE II=1
        int r = i / Q40_WV_HDR_WORDS;
        int w = i % Q40_WV_HDR_WORDS;
        ap_uint<128> ddr = W_wide[(ap_uint<64>)(base_row + r) * Q40_WV_ROW_WORDS + w];

        d[r][w*4 + 0] = fxd_from_raw((int32_t)ddr.range(31,  0));
        d[r][w*4 + 1] = fxd_from_raw((int32_t)ddr.range(63,  32));
        d[r][w*4 + 2] = fxd_from_raw((int32_t)ddr.range(95,  64));
        d[r][w*4 + 3] = fxd_from_raw((int32_t)ddr.range(127, 96));
    }

    LOAD_NIB: for (int i = 0; i < K_WV * Q40_WV_NIB_WORDS; i++) {
        #pragma HLS PIPELINE II=1
        int r = i / Q40_WV_NIB_WORDS;
        int e = i % Q40_WV_NIB_WORDS;
        ap_uint<128> ddr = W_wide[(ap_uint<64>)(base_row + r) * Q40_WV_ROW_WORDS
                                    + Q40_WV_HDR_WORDS + e];

        if      (r == 0)  nib_r0[e]  = ddr;
        else if (r == 1)  nib_r1[e]  = ddr;
        else if (r == 2)  nib_r2[e]  = ddr;
        else if (r == 3)  nib_r3[e]  = ddr;
        else if (r == 4)  nib_r4[e]  = ddr;
        else if (r == 5)  nib_r5[e]  = ddr;
        else if (r == 6)  nib_r6[e]  = ddr;
        else if (r == 7)  nib_r7[e]  = ddr;
        else if (r == 8)  nib_r8[e]  = ddr;
        else if (r == 9)  nib_r9[e]  = ddr;
        else if (r == 10) nib_r10[e] = ddr;
        else              nib_r11[e] = ddr;
    }
}

// ============================================================================
// Q4_0 WV MAC — K_WV=12, 1-block sub-group, DSP48E2, II=1 target
// ============================================================================

static void mac_blocks_wv_k12_q40(
    const ap_uint<128> nib_r0[64], const ap_uint<128> nib_r1[64],
    const ap_uint<128> nib_r2[64], const ap_uint<128> nib_r3[64],
    const ap_uint<128> nib_r4[64], const ap_uint<128> nib_r5[64],
    const ap_uint<128> nib_r6[64], const ap_uint<128> nib_r7[64],
    const ap_uint<128> nib_r8[64],  const ap_uint<128> nib_r9[64],
    const ap_uint<128> nib_r10[64], const ap_uint<128> nib_r11[64],
    const fxd_scale_t d[K_WV][Q40_WV_BLOCKS],
    const int8_t  x[Q40_WV_GROUPS][256],
    float  x_scale,
    int8_t X_cache[MAX_BATCH][FFN_DIM_PAD],
    int     base_row)
{
#pragma HLS INLINE off
#pragma HLS BIND_OP op=mul impl=dsp

    dsp_acc_t dsp0[8], dsp1[8], dsp2[8], dsp3[8];
    dsp_acc_t dsp4[8], dsp5[8], dsp6[8], dsp7[8];
    dsp_acc_t dsp8[8], dsp9[8], dsp10[8], dsp11[8];
    #pragma HLS ARRAY_PARTITION variable=dsp0 complete
    #pragma HLS ARRAY_PARTITION variable=dsp1 complete
    #pragma HLS ARRAY_PARTITION variable=dsp2 complete
    #pragma HLS ARRAY_PARTITION variable=dsp3 complete
    #pragma HLS ARRAY_PARTITION variable=dsp4 complete
    #pragma HLS ARRAY_PARTITION variable=dsp5 complete
    #pragma HLS ARRAY_PARTITION variable=dsp6 complete
    #pragma HLS ARRAY_PARTITION variable=dsp7 complete
    #pragma HLS ARRAY_PARTITION variable=dsp8 complete
    #pragma HLS ARRAY_PARTITION variable=dsp9 complete
    #pragma HLS ARRAY_PARTITION variable=dsp10 complete
    #pragma HLS ARRAY_PARTITION variable=dsp11 complete

    ap_fixed<32,8> qs = x_scale * X12_INV_SCALE;
    dsp_acc_t total0 = 0, total1 = 0, total2 = 0, total3 = 0;
    dsp_acc_t total4 = 0, total5 = 0, total6 = 0, total7 = 0;
    dsp_acc_t total8 = 0, total9 = 0, total10 = 0, total11 = 0;

    MAC_GROUPS: for (int g = 0; g < Q40_WV_GROUPS; g++) {
        ZERO_DSP: for (int b = 0; b < 8; b++) {
            #pragma HLS PIPELINE II=1
            dsp0[b] = 0; dsp1[b] = 0; dsp2[b] = 0; dsp3[b] = 0;
            dsp4[b] = 0; dsp5[b] = 0; dsp6[b] = 0; dsp7[b] = 0;
            dsp8[b] = 0; dsp9[b] = 0; dsp10[b] = 0; dsp11[b] = 0;
        }

        MAC_ALL: for (int n = 0; n < 256; n++) {
            #pragma HLS PIPELINE II=1
            int n_elem = n >> 3;
            int sg     = n & 7;
            int b      = sg;
            int e_lo   = n_elem & 15;
            int n_half = n_elem >> 4;
            int pair   = sg >> 1;
            int idx    = g * 8 + pair * 2 + n_half;

            ap_uint<128> w0  = nib_r0[idx],  w1  = nib_r1[idx];
            ap_uint<128> w2  = nib_r2[idx],  w3  = nib_r3[idx];
            ap_uint<128> w4  = nib_r4[idx],  w5  = nib_r5[idx];
            ap_uint<128> w6  = nib_r6[idx],  w7  = nib_r7[idx];
            ap_uint<128> w8  = nib_r8[idx],  w9  = nib_r9[idx];
            ap_uint<128> w10 = nib_r10[idx], w11 = nib_r11[idx];

            ap_int<18> xi8 = (ap_int<18>)x[g][b * 32 + n_elem];
            int bo = (b & 1) * 4;
            ap_uint<4> nb0  = w0.range(e_lo*8 + bo + 3, e_lo*8 + bo);
            ap_uint<4> nb1  = w1.range(e_lo*8 + bo + 3, e_lo*8 + bo);
            ap_uint<4> nb2  = w2.range(e_lo*8 + bo + 3, e_lo*8 + bo);
            ap_uint<4> nb3  = w3.range(e_lo*8 + bo + 3, e_lo*8 + bo);
            ap_uint<4> nb4  = w4.range(e_lo*8 + bo + 3, e_lo*8 + bo);
            ap_uint<4> nb5  = w5.range(e_lo*8 + bo + 3, e_lo*8 + bo);
            ap_uint<4> nb6  = w6.range(e_lo*8 + bo + 3, e_lo*8 + bo);
            ap_uint<4> nb7  = w7.range(e_lo*8 + bo + 3, e_lo*8 + bo);
            ap_uint<4> nb8  = w8.range(e_lo*8 + bo + 3, e_lo*8 + bo);
            ap_uint<4> nb9  = w9.range(e_lo*8 + bo + 3, e_lo*8 + bo);
            ap_uint<4> nb10 = w10.range(e_lo*8 + bo + 3, e_lo*8 + bo);
            ap_uint<4> nb11 = w11.range(e_lo*8 + bo + 3, e_lo*8 + bo);

            dsp0[b]  += xi8 * (ap_int<18>)((ap_int<5>)nb0  - 8);
            dsp1[b]  += xi8 * (ap_int<18>)((ap_int<5>)nb1  - 8);
            dsp2[b]  += xi8 * (ap_int<18>)((ap_int<5>)nb2  - 8);
            dsp3[b]  += xi8 * (ap_int<18>)((ap_int<5>)nb3  - 8);
            dsp4[b]  += xi8 * (ap_int<18>)((ap_int<5>)nb4  - 8);
            dsp5[b]  += xi8 * (ap_int<18>)((ap_int<5>)nb5  - 8);
            dsp6[b]  += xi8 * (ap_int<18>)((ap_int<5>)nb6  - 8);
            dsp7[b]  += xi8 * (ap_int<18>)((ap_int<5>)nb7  - 8);
            dsp8[b]  += xi8 * (ap_int<18>)((ap_int<5>)nb8  - 8);
            dsp9[b]  += xi8 * (ap_int<18>)((ap_int<5>)nb9  - 8);
            dsp10[b] += xi8 * (ap_int<18>)((ap_int<5>)nb10 - 8);
            dsp11[b] += xi8 * (ap_int<18>)((ap_int<5>)nb11 - 8);
        }

        REDUCE_GRP: for (int b = 0; b < 8; b++) {
            #pragma HLS PIPELINE II=1
            int abs_b = g * 8 + b;
            total0  += (dsp_acc_t)((ap_int<27>)dsp0[b]  * d[0][abs_b]);
            total1  += (dsp_acc_t)((ap_int<27>)dsp1[b]  * d[1][abs_b]);
            total2  += (dsp_acc_t)((ap_int<27>)dsp2[b]  * d[2][abs_b]);
            total3  += (dsp_acc_t)((ap_int<27>)dsp3[b]  * d[3][abs_b]);
            total4  += (dsp_acc_t)((ap_int<27>)dsp4[b]  * d[4][abs_b]);
            total5  += (dsp_acc_t)((ap_int<27>)dsp5[b]  * d[5][abs_b]);
            total6  += (dsp_acc_t)((ap_int<27>)dsp6[b]  * d[6][abs_b]);
            total7  += (dsp_acc_t)((ap_int<27>)dsp7[b]  * d[7][abs_b]);
            total8  += (dsp_acc_t)((ap_int<27>)dsp8[b]  * d[8][abs_b]);
            total9  += (dsp_acc_t)((ap_int<27>)dsp9[b]  * d[9][abs_b]);
            total10 += (dsp_acc_t)((ap_int<27>)dsp10[b] * d[10][abs_b]);
            total11 += (dsp_acc_t)((ap_int<27>)dsp11[b] * d[11][abs_b]);
        }
    }

    QUANTIZE_LOOP: for (int r = 0; r < K_WV; r++) {
        #pragma HLS PIPELINE II=1
        dsp_acc_t t_raw = (r == 0) ? total0 : (r == 1) ? total1 :
                          (r == 2) ? total2 : (r == 3) ? total3 :
                          (r == 4) ? total4 : (r == 5) ? total5 :
                          (r == 6) ? total6 : (r == 7) ? total7 :
                          (r == 8) ? total8 : (r == 9) ? total9 :
                          (r == 10) ? total10 : total11;
        fxd_accum_t t = (fxd_accum_t)((ap_fixed<48,8>)t_raw);
        ap_fixed<56,38> scaled = t * qs;
        int val = scaled.to_int() + (scaled >= 0 ? 1 : -1) / 2;
        X_cache[0][base_row + r] = (val > 127) ? 127 : (val < -128) ? -128 : (int8_t)val;
    }
}

// ============================================================================
// Phase 2 & 3: compute_X1 / compute_X2 — BRAM, K_WV=12, parallel REDUCE, CPU pre-converted d
// ============================================================================

static void compute_X1(
    const uint8_t  *W,
    const int8_t   x_local_1[MAX_BATCH][Q40_WV_GROUPS][256],
    float          x_scale,
    int8_t         X1_cache[MAX_BATCH][FFN_DIM_PAD])
{
#pragma HLS INLINE off
#pragma HLS ARRAY_PARTITION variable=x_local_1 dim=2 complete
    const ap_uint<128> *W_wide = (const ap_uint<128>*)W;

    ap_uint<128> nib_r0[64],  nib_r1[64],  nib_r2[64],  nib_r3[64];
    ap_uint<128> nib_r4[64],  nib_r5[64],  nib_r6[64],  nib_r7[64];
    ap_uint<128> nib_r8[64],  nib_r9[64],  nib_r10[64], nib_r11[64];
    #pragma HLS BIND_STORAGE variable=nib_r0  type=ram_1p impl=bram
    #pragma HLS BIND_STORAGE variable=nib_r1  type=ram_1p impl=bram
    #pragma HLS BIND_STORAGE variable=nib_r2  type=ram_1p impl=bram
    #pragma HLS BIND_STORAGE variable=nib_r3  type=ram_1p impl=bram
    #pragma HLS BIND_STORAGE variable=nib_r4  type=ram_1p impl=bram
    #pragma HLS BIND_STORAGE variable=nib_r5  type=ram_1p impl=bram
    #pragma HLS BIND_STORAGE variable=nib_r6  type=ram_1p impl=bram
    #pragma HLS BIND_STORAGE variable=nib_r7  type=ram_1p impl=bram
    #pragma HLS BIND_STORAGE variable=nib_r8  type=ram_1p impl=bram
    #pragma HLS BIND_STORAGE variable=nib_r9  type=ram_1p impl=bram
    #pragma HLS BIND_STORAGE variable=nib_r10 type=ram_1p impl=bram
    #pragma HLS BIND_STORAGE variable=nib_r11 type=ram_1p impl=bram

    fxd_scale_t d[K_WV][Q40_WV_BLOCKS];
    #pragma HLS ARRAY_PARTITION variable=d dim=0 complete

    COMPUTE_X1: for (int row = 0; row < FFN_DIM_PAD; row += K_WV) {
        load_12_rows_wv_q40(W_wide, row,
                            nib_r0, nib_r1, nib_r2, nib_r3,
                            nib_r4, nib_r5, nib_r6, nib_r7,
                            nib_r8, nib_r9, nib_r10, nib_r11, d);

        for (int n = 0; n < MAX_BATCH; n++) {
            mac_blocks_wv_k12_q40(
                nib_r0, nib_r1, nib_r2, nib_r3,
                nib_r4, nib_r5, nib_r6, nib_r7,
                nib_r8, nib_r9, nib_r10, nib_r11,
                d, x_local_1[n], x_scale, X1_cache, row);
        }
    }
}

static void compute_X2(
    const uint8_t  *V,
    const int8_t   x_local_2[MAX_BATCH][Q40_WV_GROUPS][256],
    float          x_scale,
    int8_t         X2_cache[MAX_BATCH][FFN_DIM_PAD])
{
#pragma HLS INLINE off
#pragma HLS ARRAY_PARTITION variable=x_local_2 dim=2 complete
    const ap_uint<128> *V_wide = (const ap_uint<128>*)V;

    ap_uint<128> nib_r0[64],  nib_r1[64],  nib_r2[64],  nib_r3[64];
    ap_uint<128> nib_r4[64],  nib_r5[64],  nib_r6[64],  nib_r7[64];
    ap_uint<128> nib_r8[64],  nib_r9[64],  nib_r10[64], nib_r11[64];
    #pragma HLS BIND_STORAGE variable=nib_r0  type=ram_1p impl=bram
    #pragma HLS BIND_STORAGE variable=nib_r1  type=ram_1p impl=bram
    #pragma HLS BIND_STORAGE variable=nib_r2  type=ram_1p impl=bram
    #pragma HLS BIND_STORAGE variable=nib_r3  type=ram_1p impl=bram
    #pragma HLS BIND_STORAGE variable=nib_r4  type=ram_1p impl=bram
    #pragma HLS BIND_STORAGE variable=nib_r5  type=ram_1p impl=bram
    #pragma HLS BIND_STORAGE variable=nib_r6  type=ram_1p impl=bram
    #pragma HLS BIND_STORAGE variable=nib_r7  type=ram_1p impl=bram
    #pragma HLS BIND_STORAGE variable=nib_r8  type=ram_1p impl=bram
    #pragma HLS BIND_STORAGE variable=nib_r9  type=ram_1p impl=bram
    #pragma HLS BIND_STORAGE variable=nib_r10 type=ram_1p impl=bram
    #pragma HLS BIND_STORAGE variable=nib_r11 type=ram_1p impl=bram

    fxd_scale_t d[K_WV][Q40_WV_BLOCKS];
    #pragma HLS ARRAY_PARTITION variable=d dim=0 complete

    COMPUTE_X2: for (int row = 0; row < FFN_DIM_PAD; row += K_WV) {
        load_12_rows_wv_q40(V_wide, row,
                            nib_r0, nib_r1, nib_r2, nib_r3,
                            nib_r4, nib_r5, nib_r6, nib_r7,
                            nib_r8, nib_r9, nib_r10, nib_r11, d);

        for (int n = 0; n < MAX_BATCH; n++) {
            mac_blocks_wv_k12_q40(
                nib_r0, nib_r1, nib_r2, nib_r3,
                nib_r4, nib_r5, nib_r6, nib_r7,
                nib_r8, nib_r9, nib_r10, nib_r11,
                d, x_local_2[n], x_scale, X2_cache, row);
        }
    }
}

// Q4_0 Output Path — merged load, K_DOWN=8, 32 time-multiplexed BRAM tiles
// ============================================================================
// Q4_0 Output Path — merged load, K_DOWN=8, 32 time-multiplexed BRAM tiles
// ============================================================================

// load_mg_down_q40: per-meta-group merged load.  K_DOWN rows × 40 DDR words in
// one AXI burst.  32 BRAM tiles (4 groups × K_DOWN rows) filled per call.
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
    ap_uint<32> g0_r4[Q40_NIB_ELEMS], ap_uint<32> g1_r4[Q40_NIB_ELEMS],
    ap_uint<32> g2_r4[Q40_NIB_ELEMS], ap_uint<32> g3_r4[Q40_NIB_ELEMS],
    ap_uint<32> g0_r5[Q40_NIB_ELEMS], ap_uint<32> g1_r5[Q40_NIB_ELEMS],
    ap_uint<32> g2_r5[Q40_NIB_ELEMS], ap_uint<32> g3_r5[Q40_NIB_ELEMS],
    ap_uint<32> g0_r6[Q40_NIB_ELEMS], ap_uint<32> g1_r6[Q40_NIB_ELEMS],
    ap_uint<32> g2_r6[Q40_NIB_ELEMS], ap_uint<32> g3_r6[Q40_NIB_ELEMS],
    ap_uint<32> g0_r7[Q40_NIB_ELEMS], ap_uint<32> g1_r7[Q40_NIB_ELEMS],
    ap_uint<32> g2_r7[Q40_NIB_ELEMS], ap_uint<32> g3_r7[Q40_NIB_ELEMS],
    fxd_scale_t d_r0[32], fxd_scale_t d_r1[32], fxd_scale_t d_r2[32], fxd_scale_t d_r3[32],
    fxd_scale_t d_r4[32], fxd_scale_t d_r5[32], fxd_scale_t d_r6[32], fxd_scale_t d_r7[32])
{
#pragma HLS INLINE off

    LOAD_MG_HDR: for (int i = 0; i < K_DOWN * 8; i++) {
        #pragma HLS PIPELINE II=1
        int r = i / 8;
        int w = i % 8;
        ap_uint<128> ddr = Wd_wide[(ap_uint<64>)(out_i + r) * Q40_DOWN_ROW_WORDS
                                    + (ap_uint<64>)mg * 8 + w];
        if      (r == 0) { d_r0[w*4] = fxd_from_raw((int32_t)ddr.range(31,0));
                           d_r0[w*4+1] = fxd_from_raw((int32_t)ddr.range(63,32));
                           d_r0[w*4+2] = fxd_from_raw((int32_t)ddr.range(95,64));
                           d_r0[w*4+3] = fxd_from_raw((int32_t)ddr.range(127,96)); }
        else if (r == 1) { d_r1[w*4] = fxd_from_raw((int32_t)ddr.range(31,0));
                           d_r1[w*4+1] = fxd_from_raw((int32_t)ddr.range(63,32));
                           d_r1[w*4+2] = fxd_from_raw((int32_t)ddr.range(95,64));
                           d_r1[w*4+3] = fxd_from_raw((int32_t)ddr.range(127,96)); }
        else if (r == 2) { d_r2[w*4] = fxd_from_raw((int32_t)ddr.range(31,0));
                           d_r2[w*4+1] = fxd_from_raw((int32_t)ddr.range(63,32));
                           d_r2[w*4+2] = fxd_from_raw((int32_t)ddr.range(95,64));
                           d_r2[w*4+3] = fxd_from_raw((int32_t)ddr.range(127,96)); }
        else if (r == 3) { d_r3[w*4] = fxd_from_raw((int32_t)ddr.range(31,0));
                           d_r3[w*4+1] = fxd_from_raw((int32_t)ddr.range(63,32));
                           d_r3[w*4+2] = fxd_from_raw((int32_t)ddr.range(95,64));
                           d_r3[w*4+3] = fxd_from_raw((int32_t)ddr.range(127,96)); }
        else if (r == 4) { d_r4[w*4] = fxd_from_raw((int32_t)ddr.range(31,0));
                           d_r4[w*4+1] = fxd_from_raw((int32_t)ddr.range(63,32));
                           d_r4[w*4+2] = fxd_from_raw((int32_t)ddr.range(95,64));
                           d_r4[w*4+3] = fxd_from_raw((int32_t)ddr.range(127,96)); }
        else if (r == 5) { d_r5[w*4] = fxd_from_raw((int32_t)ddr.range(31,0));
                           d_r5[w*4+1] = fxd_from_raw((int32_t)ddr.range(63,32));
                           d_r5[w*4+2] = fxd_from_raw((int32_t)ddr.range(95,64));
                           d_r5[w*4+3] = fxd_from_raw((int32_t)ddr.range(127,96)); }
        else if (r == 6) { d_r6[w*4] = fxd_from_raw((int32_t)ddr.range(31,0));
                           d_r6[w*4+1] = fxd_from_raw((int32_t)ddr.range(63,32));
                           d_r6[w*4+2] = fxd_from_raw((int32_t)ddr.range(95,64));
                           d_r6[w*4+3] = fxd_from_raw((int32_t)ddr.range(127,96)); }
        else             { d_r7[w*4] = fxd_from_raw((int32_t)ddr.range(31,0));
                           d_r7[w*4+1] = fxd_from_raw((int32_t)ddr.range(63,32));
                           d_r7[w*4+2] = fxd_from_raw((int32_t)ddr.range(95,64));
                           d_r7[w*4+3] = fxd_from_raw((int32_t)ddr.range(127,96)); }
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
        } else if (r == 3) {
            g0_r3[e] = ddr.range(31,  0);  g1_r3[e] = ddr.range(63,  32);
            g2_r3[e] = ddr.range(95,  64); g3_r3[e] = ddr.range(127, 96);
        } else if (r == 4) {
            g0_r4[e] = ddr.range(31,  0);  g1_r4[e] = ddr.range(63,  32);
            g2_r4[e] = ddr.range(95,  64); g3_r4[e] = ddr.range(127, 96);
        } else if (r == 5) {
            g0_r5[e] = ddr.range(31,  0);  g1_r5[e] = ddr.range(63,  32);
            g2_r5[e] = ddr.range(95,  64); g3_r5[e] = ddr.range(127, 96);
        } else if (r == 6) {
            g0_r6[e] = ddr.range(31,  0);  g1_r6[e] = ddr.range(63,  32);
            g2_r6[e] = ddr.range(95,  64); g3_r6[e] = ddr.range(127, 96);
        } else {
            g0_r7[e] = ddr.range(31,  0);  g1_r7[e] = ddr.range(63,  32);
            g2_r7[e] = ddr.range(95,  64); g3_r7[e] = ddr.range(127, 96);
        }
    }
}

// mac_mg_down_q40: process one meta-group (4 groups) for K_DOWN output rows.
// DSP48E2 accumulation — no fabric accumulator banking.
static void mac_mg_down_q40(
    ap_uint<32> g0_r0[Q40_NIB_ELEMS], ap_uint<32> g1_r0[Q40_NIB_ELEMS],
    ap_uint<32> g2_r0[Q40_NIB_ELEMS], ap_uint<32> g3_r0[Q40_NIB_ELEMS],
    ap_uint<32> g0_r1[Q40_NIB_ELEMS], ap_uint<32> g1_r1[Q40_NIB_ELEMS],
    ap_uint<32> g2_r1[Q40_NIB_ELEMS], ap_uint<32> g3_r1[Q40_NIB_ELEMS],
    ap_uint<32> g0_r2[Q40_NIB_ELEMS], ap_uint<32> g1_r2[Q40_NIB_ELEMS],
    ap_uint<32> g2_r2[Q40_NIB_ELEMS], ap_uint<32> g3_r2[Q40_NIB_ELEMS],
    ap_uint<32> g0_r3[Q40_NIB_ELEMS], ap_uint<32> g1_r3[Q40_NIB_ELEMS],
    ap_uint<32> g2_r3[Q40_NIB_ELEMS], ap_uint<32> g3_r3[Q40_NIB_ELEMS],
    ap_uint<32> g0_r4[Q40_NIB_ELEMS], ap_uint<32> g1_r4[Q40_NIB_ELEMS],
    ap_uint<32> g2_r4[Q40_NIB_ELEMS], ap_uint<32> g3_r4[Q40_NIB_ELEMS],
    ap_uint<32> g0_r5[Q40_NIB_ELEMS], ap_uint<32> g1_r5[Q40_NIB_ELEMS],
    ap_uint<32> g2_r5[Q40_NIB_ELEMS], ap_uint<32> g3_r5[Q40_NIB_ELEMS],
    ap_uint<32> g0_r6[Q40_NIB_ELEMS], ap_uint<32> g1_r6[Q40_NIB_ELEMS],
    ap_uint<32> g2_r6[Q40_NIB_ELEMS], ap_uint<32> g3_r6[Q40_NIB_ELEMS],
    ap_uint<32> g0_r7[Q40_NIB_ELEMS], ap_uint<32> g1_r7[Q40_NIB_ELEMS],
    ap_uint<32> g2_r7[Q40_NIB_ELEMS], ap_uint<32> g3_r7[Q40_NIB_ELEMS],
    const fxd_scale_t d_r0[32], const fxd_scale_t d_r1[32],
    const fxd_scale_t d_r2[32], const fxd_scale_t d_r3[32],
    const fxd_scale_t d_r4[32], const fxd_scale_t d_r5[32],
    const fxd_scale_t d_r6[32], const fxd_scale_t d_r7[32],
    const int8_t gate[Q40_DOWN_BLOCKS][Q40_NIB_ELEMS],
    int mg,
    dsp_acc_t *total0, dsp_acc_t *total1,
    dsp_acc_t *total2, dsp_acc_t *total3,
    dsp_acc_t *total4, dsp_acc_t *total5,
    dsp_acc_t *total6, dsp_acc_t *total7)
{
#pragma HLS INLINE off
#pragma HLS BIND_OP op=mul impl=dsp

    // K_DOWN × 8 DSP accumulators: one DSP48E2 P register per (row, block) pair
    dsp_acc_t odsp0[8], odsp1[8], odsp2[8], odsp3[8];
    dsp_acc_t odsp4[8], odsp5[8], odsp6[8], odsp7[8];
    #pragma HLS ARRAY_PARTITION variable=odsp0 complete
    #pragma HLS ARRAY_PARTITION variable=odsp1 complete
    #pragma HLS ARRAY_PARTITION variable=odsp2 complete
    #pragma HLS ARRAY_PARTITION variable=odsp3 complete
    #pragma HLS ARRAY_PARTITION variable=odsp4 complete
    #pragma HLS ARRAY_PARTITION variable=odsp5 complete
    #pragma HLS ARRAY_PARTITION variable=odsp6 complete
    #pragma HLS ARRAY_PARTITION variable=odsp7 complete

    MG_GROUPS: for (int kg = 0; kg < 4; kg++) {
        int abs_g = mg * 4 + kg;

        // Zero DSP accumulators for this group (8 cycles, II=1)
        ZERO_ODSP: for (int b = 0; b < 8; b++) {
            #pragma HLS PIPELINE II=1
            odsp0[b] = 0; odsp1[b] = 0; odsp2[b] = 0; odsp3[b] = 0;
            odsp4[b] = 0; odsp5[b] = 0; odsp6[b] = 0; odsp7[b] = 0;
        }

        MAC_MG: for (int n = 0; n < 32; n++) {
            #pragma HLS PIPELINE II=1
            ap_uint<32> wr0, wr1, wr2, wr3, wr4, wr5, wr6, wr7;
            if (kg == 0) {
                wr0 = g0_r0[n]; wr1 = g0_r1[n]; wr2 = g0_r2[n]; wr3 = g0_r3[n];
                wr4 = g0_r4[n]; wr5 = g0_r5[n]; wr6 = g0_r6[n]; wr7 = g0_r7[n];
            } else if (kg == 1) {
                wr0 = g1_r0[n]; wr1 = g1_r1[n]; wr2 = g1_r2[n]; wr3 = g1_r3[n];
                wr4 = g1_r4[n]; wr5 = g1_r5[n]; wr6 = g1_r6[n]; wr7 = g1_r7[n];
            } else if (kg == 2) {
                wr0 = g2_r0[n]; wr1 = g2_r1[n]; wr2 = g2_r2[n]; wr3 = g2_r3[n];
                wr4 = g2_r4[n]; wr5 = g2_r5[n]; wr6 = g2_r6[n]; wr7 = g2_r7[n];
            } else {
                wr0 = g3_r0[n]; wr1 = g3_r1[n]; wr2 = g3_r2[n]; wr3 = g3_r3[n];
                wr4 = g3_r4[n]; wr5 = g3_r5[n]; wr6 = g3_r6[n]; wr7 = g3_r7[n];
            }
            for (int b = 0; b < 8; b++) {
                #pragma HLS UNROLL
                int abs_b = abs_g * 8 + b;
                ap_int<18> gi8 = (ap_int<18>)gate[abs_b][n];
                ap_uint<4> nb0 = wr0.range(b*4+3, b*4);
                ap_uint<4> nb1 = wr1.range(b*4+3, b*4);
                ap_uint<4> nb2 = wr2.range(b*4+3, b*4);
                ap_uint<4> nb3 = wr3.range(b*4+3, b*4);
                ap_uint<4> nb4 = wr4.range(b*4+3, b*4);
                ap_uint<4> nb5 = wr5.range(b*4+3, b*4);
                ap_uint<4> nb6 = wr6.range(b*4+3, b*4);
                ap_uint<4> nb7 = wr7.range(b*4+3, b*4);

                odsp0[b] += gi8 * (ap_int<18>)((ap_int<5>)nb0 - 8);
                odsp1[b] += gi8 * (ap_int<18>)((ap_int<5>)nb1 - 8);
                odsp2[b] += gi8 * (ap_int<18>)((ap_int<5>)nb2 - 8);
                odsp3[b] += gi8 * (ap_int<18>)((ap_int<5>)nb3 - 8);
                odsp4[b] += gi8 * (ap_int<18>)((ap_int<5>)nb4 - 8);
                odsp5[b] += gi8 * (ap_int<18>)((ap_int<5>)nb5 - 8);
                odsp6[b] += gi8 * (ap_int<18>)((ap_int<5>)nb6 - 8);
                odsp7[b] += gi8 * (ap_int<18>)((ap_int<5>)nb7 - 8);
            }
        }

        REDUCE_MG: for (int b = 0; b < 8; b++) {
            #pragma HLS PIPELINE II=1
            int abs_b = abs_g * 8 + b;
            int li = abs_b - mg * 32;
            *total0 += (dsp_acc_t)((ap_int<27>)odsp0[b] * d_r0[li]);
            *total1 += (dsp_acc_t)((ap_int<27>)odsp1[b] * d_r1[li]);
            *total2 += (dsp_acc_t)((ap_int<27>)odsp2[b] * d_r2[li]);
            *total3 += (dsp_acc_t)((ap_int<27>)odsp3[b] * d_r3[li]);
            *total4 += (dsp_acc_t)((ap_int<27>)odsp4[b] * d_r4[li]);
            *total5 += (dsp_acc_t)((ap_int<27>)odsp5[b] * d_r5[li]);
            *total6 += (dsp_acc_t)((ap_int<27>)odsp6[b] * d_r6[li]);
            *total7 += (dsp_acc_t)((ap_int<27>)odsp7[b] * d_r7[li]);
        }
    }
}

// ============================================================================
// Phase 4: compute_gate — SiLU(X1) × X2, INT8 quantized
// ============================================================================

static void compute_gate(
    const int8_t X1_cache[MAX_BATCH][FFN_DIM_PAD],
    const int8_t X2_cache[MAX_BATCH][FFN_DIM_PAD],
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
// Phase 5: compute_output — merged load, K_DOWN=8, DSP48E2 accumulation
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
    float out_local[MAX_BATCH][VECTOR_DIM];
    #pragma HLS BIND_STORAGE variable=out_local type=ram_1p impl=bram

    // 32 time-multiplexed BRAM tiles: 4 groups × K_DOWN rows, reused across meta-groups
    ap_uint<32> g0_r0[Q40_NIB_ELEMS], g1_r0[Q40_NIB_ELEMS];
    ap_uint<32> g2_r0[Q40_NIB_ELEMS], g3_r0[Q40_NIB_ELEMS];
    ap_uint<32> g0_r1[Q40_NIB_ELEMS], g1_r1[Q40_NIB_ELEMS];
    ap_uint<32> g2_r1[Q40_NIB_ELEMS], g3_r1[Q40_NIB_ELEMS];
    ap_uint<32> g0_r2[Q40_NIB_ELEMS], g1_r2[Q40_NIB_ELEMS];
    ap_uint<32> g2_r2[Q40_NIB_ELEMS], g3_r2[Q40_NIB_ELEMS];
    ap_uint<32> g0_r3[Q40_NIB_ELEMS], g1_r3[Q40_NIB_ELEMS];
    ap_uint<32> g2_r3[Q40_NIB_ELEMS], g3_r3[Q40_NIB_ELEMS];
    ap_uint<32> g0_r4[Q40_NIB_ELEMS], g1_r4[Q40_NIB_ELEMS];
    ap_uint<32> g2_r4[Q40_NIB_ELEMS], g3_r4[Q40_NIB_ELEMS];
    ap_uint<32> g0_r5[Q40_NIB_ELEMS], g1_r5[Q40_NIB_ELEMS];
    ap_uint<32> g2_r5[Q40_NIB_ELEMS], g3_r5[Q40_NIB_ELEMS];
    ap_uint<32> g0_r6[Q40_NIB_ELEMS], g1_r6[Q40_NIB_ELEMS];
    ap_uint<32> g2_r6[Q40_NIB_ELEMS], g3_r6[Q40_NIB_ELEMS];
    ap_uint<32> g0_r7[Q40_NIB_ELEMS], g1_r7[Q40_NIB_ELEMS];
    ap_uint<32> g2_r7[Q40_NIB_ELEMS], g3_r7[Q40_NIB_ELEMS];
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
    #pragma HLS BIND_STORAGE variable=g0_r4 type=ram_1p impl=bram
    #pragma HLS BIND_STORAGE variable=g1_r4 type=ram_1p impl=bram
    #pragma HLS BIND_STORAGE variable=g2_r4 type=ram_1p impl=bram
    #pragma HLS BIND_STORAGE variable=g3_r4 type=ram_1p impl=bram
    #pragma HLS BIND_STORAGE variable=g0_r5 type=ram_1p impl=bram
    #pragma HLS BIND_STORAGE variable=g1_r5 type=ram_1p impl=bram
    #pragma HLS BIND_STORAGE variable=g2_r5 type=ram_1p impl=bram
    #pragma HLS BIND_STORAGE variable=g3_r5 type=ram_1p impl=bram
    #pragma HLS BIND_STORAGE variable=g0_r6 type=ram_1p impl=bram
    #pragma HLS BIND_STORAGE variable=g1_r6 type=ram_1p impl=bram
    #pragma HLS BIND_STORAGE variable=g2_r6 type=ram_1p impl=bram
    #pragma HLS BIND_STORAGE variable=g3_r6 type=ram_1p impl=bram
    #pragma HLS BIND_STORAGE variable=g0_r7 type=ram_1p impl=bram
    #pragma HLS BIND_STORAGE variable=g1_r7 type=ram_1p impl=bram
    #pragma HLS BIND_STORAGE variable=g2_r7 type=ram_1p impl=bram
    #pragma HLS BIND_STORAGE variable=g3_r7 type=ram_1p impl=bram

    DOWN_Q40: for (int out_i = 0; out_i < VECTOR_DIM; out_i += K_DOWN) {
        dsp_acc_t totals[MAX_BATCH][K_DOWN] = {{0}};
        #pragma HLS ARRAY_PARTITION variable=totals dim=0 complete

        META_GROUPS: for (int mg = 0; mg < Q40_DOWN_MG; mg++) {
            fxd_scale_t d_r0[32], d_r1[32], d_r2[32], d_r3[32];
            fxd_scale_t d_r4[32], d_r5[32], d_r6[32], d_r7[32];
            #pragma HLS ARRAY_PARTITION variable=d_r0 complete
            #pragma HLS ARRAY_PARTITION variable=d_r1 complete
            #pragma HLS ARRAY_PARTITION variable=d_r2 complete
            #pragma HLS ARRAY_PARTITION variable=d_r3 complete
            #pragma HLS ARRAY_PARTITION variable=d_r4 complete
            #pragma HLS ARRAY_PARTITION variable=d_r5 complete
            #pragma HLS ARRAY_PARTITION variable=d_r6 complete
            #pragma HLS ARRAY_PARTITION variable=d_r7 complete

            load_mg_down_q40(W_down_wide, out_i, mg,
                             g0_r0, g1_r0, g2_r0, g3_r0,
                             g0_r1, g1_r1, g2_r1, g3_r1,
                             g0_r2, g1_r2, g2_r2, g3_r2,
                             g0_r3, g1_r3, g2_r3, g3_r3,
                             g0_r4, g1_r4, g2_r4, g3_r4,
                             g0_r5, g1_r5, g2_r5, g3_r5,
                             g0_r6, g1_r6, g2_r6, g3_r6,
                             g0_r7, g1_r7, g2_r7, g3_r7,
                             d_r0, d_r1, d_r2, d_r3,
                             d_r4, d_r5, d_r6, d_r7);

            for (int n = 0; n < MAX_BATCH; n++) {
                mac_mg_down_q40(
                    g0_r0, g1_r0, g2_r0, g3_r0,
                    g0_r1, g1_r1, g2_r1, g3_r1,
                    g0_r2, g1_r2, g2_r2, g3_r2,
                    g0_r3, g1_r3, g2_r3, g3_r3,
                    g0_r4, g1_r4, g2_r4, g3_r4,
                    g0_r5, g1_r5, g2_r5, g3_r5,
                    g0_r6, g1_r6, g2_r6, g3_r6,
                    g0_r7, g1_r7, g2_r7, g3_r7,
                    d_r0, d_r1, d_r2, d_r3,
                    d_r4, d_r5, d_r6, d_r7,
                    gate_cache[n], mg,
                    &totals[n][0], &totals[n][1], &totals[n][2], &totals[n][3],
                    &totals[n][4], &totals[n][5], &totals[n][6], &totals[n][7]);
            }
        }

        for (int n = 0; n < MAX_BATCH; n++) {
            float gs = gate_scale_array[n] / 256.0f;
            for (int r = 0; r < K_DOWN; r++) {
                out_local[n][out_i + r] = (float)totals[n][r] * gs;
            }
        }
    }
    for (int n = 0; n < MAX_BATCH; n++)
        memcpy(out_batch + n * VECTOR_DIM, out_local[n], VECTOR_DIM * sizeof(float));
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
    #pragma HLS INTERFACE mode=m_axi port=W         bundle=gmem_W    offset=slave depth=10490880 max_read_burst_length=128  latency=64 num_read_outstanding=1 max_widen_bitwidth=128
    #pragma HLS INTERFACE mode=m_axi port=V         bundle=gmem_V    offset=slave depth=10490880 max_read_burst_length=128  latency=64 num_read_outstanding=1 max_widen_bitwidth=128
    #pragma HLS INTERFACE mode=m_axi port=W_down    bundle=gmem_Wd   offset=slave depth=10485760 max_read_burst_length=256  latency=64 num_read_outstanding=1 max_widen_bitwidth=128
    #pragma HLS INTERFACE mode=m_axi port=x_batch   bundle=gmem_x    offset=slave depth=32768    max_read_burst_length=128  latency=64 num_read_outstanding=1 max_widen_bitwidth=128
    #pragma HLS INTERFACE mode=m_axi port=out_batch bundle=gmem_out  offset=slave depth=32768    max_write_burst_length=256 latency=64 num_write_outstanding=1

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

    int8_t X1_cache[MAX_BATCH][FFN_DIM_PAD];
    int8_t X2_cache[MAX_BATCH][FFN_DIM_PAD];
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
