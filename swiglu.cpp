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
// Q4_0 WV Merged Load — 8 rows in one AXI burst
// ============================================================================

// load_8_rows_wv_q40: merged load of 8 WV rows. One function → one set of
// AXI bursts → eliminates 7 of 8 AXI setups per iteration.
//
// Headers: 8 rows × 16 DDR words = 128 sequential words.
//   Each DDR word = 4 fp32 d values (blocks 4w..4w+3).  Row-major read order
//   keeps DDR accesses sequential — rows r, r+1, ..., r+7 are contiguous in
//   the pre-decode buffer.
//
// Nibbles: 8 rows × 64 DDR words = 512 sequential words.
//   Each 128-bit DDR word written verbatim to one wide BRAM tile — 1 write/cy.
//   Steering: row r → nib_rN BRAM (8-way mux, compile-time — ~10K LUTs).
static void load_8_rows_wv_q40(
    const ap_uint<128> *W_wide,
    int base_row,
    ap_uint<128> nib_r0[64], ap_uint<128> nib_r1[64],
    ap_uint<128> nib_r2[64], ap_uint<128> nib_r3[64],
    ap_uint<128> nib_r4[64], ap_uint<128> nib_r5[64],
    ap_uint<128> nib_r6[64], ap_uint<128> nib_r7[64],
    float d[K_WV][Q40_WV_BLOCKS])
{
#pragma HLS INLINE off

    // ── Headers: 128 DDR words, sequential ─────────────────────────────────
    LOAD_HDR: for (int i = 0; i < K_WV * Q40_WV_HDR_WORDS; i++) {
        #pragma HLS PIPELINE II=1
        int r = i / Q40_WV_HDR_WORDS;   // row 0..7
        int w = i % Q40_WV_HDR_WORDS;   // word within row 0..15
        ap_uint<128> ddr = W_wide[(ap_uint<64>)(base_row + r) * Q40_WV_ROW_WORDS + w];

        // 4 fp32 values per DDR word → blocks w*4..w*4+3
        d[r][w*4 + 0] = float_from_bits((uint32_t)ddr.range(31,  0));
        d[r][w*4 + 1] = float_from_bits((uint32_t)ddr.range(63,  32));
        d[r][w*4 + 2] = float_from_bits((uint32_t)ddr.range(95,  64));
        d[r][w*4 + 3] = float_from_bits((uint32_t)ddr.range(127, 96));
    }

    // ── Nibbles: 512 DDR words, verbatim BRAM write, II=1 ──────────────────
    LOAD_NIB: for (int i = 0; i < K_WV * Q40_WV_NIB_WORDS; i++) {
        #pragma HLS PIPELINE II=1
        int r = i / Q40_WV_NIB_WORDS;
        int e = i % Q40_WV_NIB_WORDS;
        ap_uint<128> ddr = W_wide[(ap_uint<64>)(base_row + r) * Q40_WV_ROW_WORDS
                                    + Q40_WV_HDR_WORDS + e];

        // 8-way steering mux: r selects the target BRAM tile
        if      (r == 0) nib_r0[e] = ddr;
        else if (r == 1) nib_r1[e] = ddr;
        else if (r == 2) nib_r2[e] = ddr;
        else if (r == 3) nib_r3[e] = ddr;
        else if (r == 4) nib_r4[e] = ddr;
        else if (r == 5) nib_r5[e] = ddr;
        else if (r == 6) nib_r6[e] = ddr;
        else             nib_r7[e] = ddr;
    }
}

// ============================================================================
// Q4_0 WV MAC — K=8, single accumulator, 8 groups sequential
// ============================================================================

// mac_blocks_wv_k8_q40: K=8 (8 rows, 64 MAC chains).  8 groups sequential →
// DSPs shared across groups.  Single accumulator (no min-subtraction).
//
// nib_rN[idx] = 128-bit word = 4 element-slices (same as DDR).
// Slice selector s = n&3 → 4:1 32-bit mux per row (~32 LUT/row).
// Inner .range(b*4+3, b*4) is compile-time → 0 LUT.
//
// Formula: result[r] = sum over g,b (d[r][g*8+b] * sum_n(x[g][b*32+n] * (nb-8)))
static void mac_blocks_wv_k8_q40(
    const ap_uint<128> nib_r0[64], const ap_uint<128> nib_r1[64],
    const ap_uint<128> nib_r2[64], const ap_uint<128> nib_r3[64],
    const ap_uint<128> nib_r4[64], const ap_uint<128> nib_r5[64],
    const ap_uint<128> nib_r6[64], const ap_uint<128> nib_r7[64],
    const float d[K_WV][Q40_WV_BLOCKS],
    const int8_t  x[Q40_WV_GROUPS][256],
    float  x_scale,
    float *result0, float *result1, float *result2, float *result3,
    float *result4, float *result5, float *result6, float *result7)
{
#pragma HLS INLINE off
#pragma HLS BIND_OP op=mul impl=dsp
    fxd_accum_t total0 = 0, total1 = 0, total2 = 0, total3 = 0;
    fxd_accum_t total4 = 0, total5 = 0, total6 = 0, total7 = 0;

    // ── 8 groups sequential (share DSPs) ───────────────────────────────────
    MAC_GROUPS: for (int g = 0; g < Q40_WV_GROUPS; g++) {
        int32_t acc0[8][4], acc1[8][4], acc2[8][4], acc3[8][4];
        int32_t acc4[8][4], acc5[8][4], acc6[8][4], acc7[8][4];
        #pragma HLS ARRAY_PARTITION variable=acc0 dim=0 complete
        #pragma HLS ARRAY_PARTITION variable=acc1 dim=0 complete
        #pragma HLS ARRAY_PARTITION variable=acc2 dim=0 complete
        #pragma HLS ARRAY_PARTITION variable=acc3 dim=0 complete
        #pragma HLS ARRAY_PARTITION variable=acc4 dim=0 complete
        #pragma HLS ARRAY_PARTITION variable=acc5 dim=0 complete
        #pragma HLS ARRAY_PARTITION variable=acc6 dim=0 complete
        #pragma HLS ARRAY_PARTITION variable=acc7 dim=0 complete

        INIT_GRP: for (int b = 0; b < 8; b++) {
            #pragma HLS UNROLL
            for (int k = 0; k < 4; k++) {
                #pragma HLS UNROLL
                acc0[b][k] = 0; acc1[b][k] = 0;
                acc2[b][k] = 0; acc3[b][k] = 0;
                acc4[b][k] = 0; acc5[b][k] = 0;
                acc6[b][k] = 0; acc7[b][k] = 0;
            }
        }

        // Trip count doubled: 64 iterations, processing 4 of 8 blocks each.
        // n_even(n=0,2,4,...): blocks 0..3  → 32 MACs/cycle (proven II=1 like Q4_K K=4)
        // n_odd (n=1,3,5,...): blocks 4..7  → 32 MACs/cycle
        MAC_ALL: for (int n = 0; n < 64; n++) {
            #pragma HLS PIPELINE II=1
            int n_elem = n >> 1;       // element 0..31
            int sg     = n & 1;         // sub-group: 0→blocks 0..3, 1→blocks 4..7
            int b_base = sg << 2;       // 0 or 4
            int idx    = g * 8 + (n_elem >> 2);
            int s      = n_elem & 3;
            int k      = n_elem & 3;

            ap_uint<128> w0 = nib_r0[idx], w1 = nib_r1[idx];
            ap_uint<128> w2 = nib_r2[idx], w3 = nib_r3[idx];
            ap_uint<128> w4 = nib_r4[idx], w5 = nib_r5[idx];
            ap_uint<128> w6 = nib_r6[idx], w7 = nib_r7[idx];

            ap_uint<32> wr0, wr1, wr2, wr3, wr4, wr5, wr6, wr7;
            if      (s == 0) { wr0 = w0.range(31,  0);  wr1 = w1.range(31,  0);  wr2 = w2.range(31,  0);  wr3 = w3.range(31,  0);  wr4 = w4.range(31,  0);  wr5 = w5.range(31,  0);  wr6 = w6.range(31,  0);  wr7 = w7.range(31,  0);  }
            else if (s == 1) { wr0 = w0.range(63,  32); wr1 = w1.range(63,  32); wr2 = w2.range(63,  32); wr3 = w3.range(63,  32); wr4 = w4.range(63,  32); wr5 = w5.range(63,  32); wr6 = w6.range(63,  32); wr7 = w7.range(63,  32); }
            else if (s == 2) { wr0 = w0.range(95,  64); wr1 = w1.range(95,  64); wr2 = w2.range(95,  64); wr3 = w3.range(95,  64); wr4 = w4.range(95,  64); wr5 = w5.range(95,  64); wr6 = w6.range(95,  64); wr7 = w7.range(95,  64); }
            else             { wr0 = w0.range(127, 96); wr1 = w1.range(127, 96); wr2 = w2.range(127, 96); wr3 = w3.range(127, 96); wr4 = w4.range(127, 96); wr5 = w5.range(127, 96); wr6 = w6.range(127, 96); wr7 = w7.range(127, 96); }

            for (int bi = 0; bi < 4; bi++) {
                #pragma HLS UNROLL
                int b = b_base + bi;
                ap_int<8>  xi8 = (ap_int<8>)x[g][b * 32 + n_elem];
                ap_uint<4> nb0 = wr0.range(b*4+3, b*4);
                ap_uint<4> nb1 = wr1.range(b*4+3, b*4);
                ap_uint<4> nb2 = wr2.range(b*4+3, b*4);
                ap_uint<4> nb3 = wr3.range(b*4+3, b*4);
                ap_uint<4> nb4 = wr4.range(b*4+3, b*4);
                ap_uint<4> nb5 = wr5.range(b*4+3, b*4);
                ap_uint<4> nb6 = wr6.range(b*4+3, b*4);
                ap_uint<4> nb7 = wr7.range(b*4+3, b*4);

                acc0[b][k] += (int32_t)(xi8 * ((ap_int<5>)nb0 - 8));
                acc1[b][k] += (int32_t)(xi8 * ((ap_int<5>)nb1 - 8));
                acc2[b][k] += (int32_t)(xi8 * ((ap_int<5>)nb2 - 8));
                acc3[b][k] += (int32_t)(xi8 * ((ap_int<5>)nb3 - 8));
                acc4[b][k] += (int32_t)(xi8 * ((ap_int<5>)nb4 - 8));
                acc5[b][k] += (int32_t)(xi8 * ((ap_int<5>)nb5 - 8));
                acc6[b][k] += (int32_t)(xi8 * ((ap_int<5>)nb6 - 8));
                acc7[b][k] += (int32_t)(xi8 * ((ap_int<5>)nb7 - 8));
            }
        }

        REDUCE_GRP: for (int b = 0; b < 8; b++) {
            #pragma HLS PIPELINE II=1
            int abs_b = g * 8 + b;
            int32_t sw0 = 0, sw1 = 0, sw2 = 0, sw3 = 0;
            int32_t sw4 = 0, sw5 = 0, sw6 = 0, sw7 = 0;
            for (int k = 0; k < 4; k++) {
                #pragma HLS UNROLL
                sw0 += acc0[b][k]; sw1 += acc1[b][k];
                sw2 += acc2[b][k]; sw3 += acc3[b][k];
                sw4 += acc4[b][k]; sw5 += acc5[b][k];
                sw6 += acc6[b][k]; sw7 += acc7[b][k];
            }
            total0 += (fxd_scale_t)d[0][abs_b] * (fxd_accum_t)sw0;
            total1 += (fxd_scale_t)d[1][abs_b] * (fxd_accum_t)sw1;
            total2 += (fxd_scale_t)d[2][abs_b] * (fxd_accum_t)sw2;
            total3 += (fxd_scale_t)d[3][abs_b] * (fxd_accum_t)sw3;
            total4 += (fxd_scale_t)d[4][abs_b] * (fxd_accum_t)sw4;
            total5 += (fxd_scale_t)d[5][abs_b] * (fxd_accum_t)sw5;
            total6 += (fxd_scale_t)d[6][abs_b] * (fxd_accum_t)sw6;
            total7 += (fxd_scale_t)d[7][abs_b] * (fxd_accum_t)sw7;
        }
    }

    *result0 = (float)total0 * x_scale; *result1 = (float)total1 * x_scale;
    *result2 = (float)total2 * x_scale; *result3 = (float)total3 * x_scale;
    *result4 = (float)total4 * x_scale; *result5 = (float)total5 * x_scale;
    *result6 = (float)total6 * x_scale; *result7 = (float)total7 * x_scale;
}

// ============================================================================
// Q4_0 Output Path — merged load, K=4, 128 pre-allocated BRAM tiles
// ============================================================================

// load_output_rows_q40: single AXI burst loads all 4 rows (headers + nibbles).
// 128 BRAM tiles (32 groups × 4 rows) filled once per iteration.
// 4 writes per nibble DDR word → 4 independent BRAM banks (different groups).
static void load_output_rows_q40(
    const ap_uint<128> *Wd_wide,
    int out_i,
    ap_uint<32> nib[Q40_DOWN_GROUPS][K_DOWN][Q40_NIB_ELEMS],
    float d[K_DOWN][Q40_DOWN_BLOCKS])
{
#pragma HLS INLINE off

    // ── Headers: 4 rows × 64 DDR words = 256 words, sequential ────────────
    LOAD_HDR: for (int i = 0; i < K_DOWN * Q40_DOWN_HDR_WORDS; i++) {
        #pragma HLS PIPELINE II=1
        int r = i / Q40_DOWN_HDR_WORDS;
        int w = i % Q40_DOWN_HDR_WORDS;
        ap_uint<128> ddr = Wd_wide[(ap_uint<64>)(out_i + r) * Q40_DOWN_ROW_WORDS + w];
        d[r][w*4 + 0] = float_from_bits((uint32_t)ddr.range(31,  0));
        d[r][w*4 + 1] = float_from_bits((uint32_t)ddr.range(63,  32));
        d[r][w*4 + 2] = float_from_bits((uint32_t)ddr.range(95,  64));
        d[r][w*4 + 3] = float_from_bits((uint32_t)ddr.range(127, 96));
    }

    // ── Nibbles: 4 rows × 256 DDR words = 1024 words, one burst ──────────
    LOAD_NIB: for (int i = 0; i < K_DOWN * Q40_DOWN_NIB_WORDS; i++) {
        #pragma HLS PIPELINE II=1
        int r  = i / Q40_DOWN_NIB_WORDS;
        int w  = i % Q40_DOWN_NIB_WORDS;
        int mg = w >> 5;        // meta-group 0..7 (= w/32)
        int e  = w & 31;        // element 0..31 (= w%32)
        ap_uint<128> ddr = Wd_wide[(ap_uint<64>)(out_i + r) * Q40_DOWN_ROW_WORDS
                                    + Q40_DOWN_HDR_WORDS + w];
        // 4 group writes per DDR word → 4 independent BRAM banks
        nib[mg * 4 + 0][r][e] = ddr.range(31,  0);
        nib[mg * 4 + 1][r][e] = ddr.range(63,  32);
        nib[mg * 4 + 2][r][e] = ddr.range(95,  64);
        nib[mg * 4 + 3][r][e] = ddr.range(127, 96);
    }
}

// mac_output_q40: 32-group sequential MAC, K_DOWN=4 rows, II=1 native.
// 32 chains per group (4 rows × 8 blocks) — proven II=1 configuration.
static void mac_output_q40(
    const ap_uint<32> nib[Q40_DOWN_GROUPS][K_DOWN][Q40_NIB_ELEMS],
    const float d[K_DOWN][Q40_DOWN_BLOCKS],
    const int8_t gate[Q40_DOWN_BLOCKS][Q40_NIB_ELEMS],
    float gate_scale,
    float result[K_DOWN])
{
#pragma HLS INLINE off
#pragma HLS BIND_OP op=mul impl=dsp

    fxd_accum_t total0 = 0, total1 = 0, total2 = 0, total3 = 0;

    // 32 groups sequential (share DSPs), 4 rows × 8 blocks UNROLL
    GROUPS: for (int g = 0; g < Q40_DOWN_GROUPS; g++) {
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

        // 32 elements, 32 MAC chains → II=1 (proven)
        MAC_GRP: for (int n = 0; n < 32; n++) {
            #pragma HLS PIPELINE II=1
            int k = n & 3;

            ap_uint<32> wr0 = nib[g][0][n], wr1 = nib[g][1][n];
            ap_uint<32> wr2 = nib[g][2][n], wr3 = nib[g][3][n];

            for (int b = 0; b < 8; b++) {
                #pragma HLS UNROLL
                int abs_b = g * 8 + b;
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
    result[0] = (float)total0 * gate_scale;
    result[1] = (float)total1 * gate_scale;
    result[2] = (float)total2 * gate_scale;
    result[3] = (float)total3 * gate_scale;
}

// ============================================================================
// Phase 2 & 3: compute_X1 / compute_X2 — K=8, merged loads
// ============================================================================

// Shared INT8 quantizer — called 8× per iteration.  INLINE off creates one RTL
// module shared across all call sites, replacing 8× p_hls_fptosi_float_i32.
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

    // 8 rows × 1 wide BRAM each = 8 × 128-bit × 64 deep = 32 BRAM_18K
    ap_uint<128> nib_r0[64], nib_r1[64], nib_r2[64], nib_r3[64];
    ap_uint<128> nib_r4[64], nib_r5[64], nib_r6[64], nib_r7[64];
    #pragma HLS BIND_STORAGE variable=nib_r0 type=ram_1p impl=bram
    #pragma HLS BIND_STORAGE variable=nib_r1 type=ram_1p impl=bram
    #pragma HLS BIND_STORAGE variable=nib_r2 type=ram_1p impl=bram
    #pragma HLS BIND_STORAGE variable=nib_r3 type=ram_1p impl=bram
    #pragma HLS BIND_STORAGE variable=nib_r4 type=ram_1p impl=bram
    #pragma HLS BIND_STORAGE variable=nib_r5 type=ram_1p impl=bram
    #pragma HLS BIND_STORAGE variable=nib_r6 type=ram_1p impl=bram
    #pragma HLS BIND_STORAGE variable=nib_r7 type=ram_1p impl=bram

    float d[K_WV][Q40_WV_BLOCKS];
    #pragma HLS ARRAY_PARTITION variable=d dim=0 complete

    COMPUTE_X1: for (int row = 0; row < FFN_DIM; row += K_WV) {
        load_8_rows_wv_q40(W_wide, row,
                            nib_r0, nib_r1, nib_r2, nib_r3,
                            nib_r4, nib_r5, nib_r6, nib_r7, d);

        float r0, r1, r2, r3, r4, r5, r6, r7;
        mac_blocks_wv_k8_q40(
            nib_r0, nib_r1, nib_r2, nib_r3,
            nib_r4, nib_r5, nib_r6, nib_r7,
            d, x_local_1[0], x_scale,
            &r0, &r1, &r2, &r3, &r4, &r5, &r6, &r7);

        X1_cache[0][row + 0] = quantize_x12(r0);
        X1_cache[0][row + 1] = quantize_x12(r1);
        X1_cache[0][row + 2] = quantize_x12(r2);
        X1_cache[0][row + 3] = quantize_x12(r3);
        X1_cache[0][row + 4] = quantize_x12(r4);
        X1_cache[0][row + 5] = quantize_x12(r5);
        X1_cache[0][row + 6] = quantize_x12(r6);
        X1_cache[0][row + 7] = quantize_x12(r7);
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
    ap_uint<128> nib_r4[64], nib_r5[64], nib_r6[64], nib_r7[64];
    #pragma HLS BIND_STORAGE variable=nib_r0 type=ram_1p impl=bram
    #pragma HLS BIND_STORAGE variable=nib_r1 type=ram_1p impl=bram
    #pragma HLS BIND_STORAGE variable=nib_r2 type=ram_1p impl=bram
    #pragma HLS BIND_STORAGE variable=nib_r3 type=ram_1p impl=bram
    #pragma HLS BIND_STORAGE variable=nib_r4 type=ram_1p impl=bram
    #pragma HLS BIND_STORAGE variable=nib_r5 type=ram_1p impl=bram
    #pragma HLS BIND_STORAGE variable=nib_r6 type=ram_1p impl=bram
    #pragma HLS BIND_STORAGE variable=nib_r7 type=ram_1p impl=bram

    float d[K_WV][Q40_WV_BLOCKS];
    #pragma HLS ARRAY_PARTITION variable=d dim=0 complete

    COMPUTE_X2: for (int row = 0; row < FFN_DIM; row += K_WV) {
        load_8_rows_wv_q40(V_wide, row,
                            nib_r0, nib_r1, nib_r2, nib_r3,
                            nib_r4, nib_r5, nib_r6, nib_r7, d);

        float r0, r1, r2, r3, r4, r5, r6, r7;
        mac_blocks_wv_k8_q40(
            nib_r0, nib_r1, nib_r2, nib_r3,
            nib_r4, nib_r5, nib_r6, nib_r7,
            d, x_local_2[0], x_scale,
            &r0, &r1, &r2, &r3, &r4, &r5, &r6, &r7);

        X2_cache[0][row + 0] = quantize_x12(r0);
        X2_cache[0][row + 1] = quantize_x12(r1);
        X2_cache[0][row + 2] = quantize_x12(r2);
        X2_cache[0][row + 3] = quantize_x12(r3);
        X2_cache[0][row + 4] = quantize_x12(r4);
        X2_cache[0][row + 5] = quantize_x12(r5);
        X2_cache[0][row + 6] = quantize_x12(r6);
        X2_cache[0][row + 7] = quantize_x12(r7);
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

    // 128 pre-allocated BRAM tiles: 32 groups × 4 rows × 32-bit × 32 deep
    ap_uint<32> nib[Q40_DOWN_GROUPS][K_DOWN][Q40_NIB_ELEMS];
    #pragma HLS ARRAY_PARTITION variable=nib dim=0 complete
    #pragma HLS ARRAY_PARTITION variable=nib dim=1 complete
    #pragma HLS BIND_STORAGE variable=nib type=ram_1p impl=bram

    // d arrays: 4 rows × 256 blocks
    float d[K_DOWN][Q40_DOWN_BLOCKS];
    #pragma HLS ARRAY_PARTITION variable=d dim=0 complete

    DOWN_Q40: for (int out_i = 0; out_i < VECTOR_DIM; out_i += K_DOWN) {
        load_output_rows_q40(W_down_wide, out_i, nib, d);

        float result[K_DOWN];
        mac_output_q40(nib, d, gate_cache[0], gate_scale, result);

        out_local[out_i]     = result[0];
        out_local[out_i + 1] = result[1];
        out_local[out_i + 2] = result[2];
        out_local[out_i + 3] = result[3];
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
