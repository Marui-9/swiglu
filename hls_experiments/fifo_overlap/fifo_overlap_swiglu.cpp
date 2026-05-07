// fifo_overlap_swiglu.cpp
// Streaming FIFO variant of swiglu.cpp.
//
// ARCHITECTURE CHANGE vs swiglu.cpp:
//   swiglu.cpp:    compute_X1/X2/output each do load→MAC sequentially per row-pair.
//   This file:     each phase is split into two flat top-level DATAFLOW tasks:
//                    stream_load_wv  (producer) → FIFO → stream_mac_wv  (consumer) × 2
//                    stream_load_wd  (producer) → FIFO → stream_mac_output (consumer)
//
// WHY FLAT DATAFLOW:
//   test_swiglu.cpp used #pragma HLS DATAFLOW inside a loop (nested DATAFLOW).
//   This caused deadlocks (with outer DATAFLOW) or a monolithic FSM with -6.3ns WNS
//   (without outer DATAFLOW). This design keeps everything at ONE DATAFLOW level,
//   using hls::stream FIFOs between producers and consumers. HLS synthesizes each
//   task as its own small FSM, which closes timing cleanly.
//
// EXPECTED BENEFIT:
//   The overlap is between ITERATIONS (loader one pair ahead of MAC), not within a pair.
//   - stream_load_wv per pair:    1×144-word burst = ~174cy (vs 2×72-word = 204cy)
//   - stream_mac_wv per pair:     144cy (FIFO pop) + 272cy (MAC) = 416cy  [bottleneck]
//   - Steady-state: max(174, 416) = 416cy/pair  vs  current 476cy/pair  → ~13% X1/X2
//   - stream_load_wd per pair:    ~576cy
//   - stream_mac_output per pair: 576cy (FIFO pop) + 1024cy (MAC) = 1600cy [bottleneck]
//   - Output: no improvement (MAC dominates; pop time ≈ DDR load time, no savings)
//   The single-burst WV load (144-word merged burst vs 2×72-word) saves one DDR
//   latency per pair (~30cy), contributing ~122K cycles = 0.49ms @ 250MHz per phase.
//
// FUNCTIONS REMOVED vs swiglu.cpp:
//   load_row_wv        — replaced by inline burst loop inside stream_load_wv
//   load_row_down_q4k  — replaced by inline burst loop inside stream_load_wd
//   compute_X1/X2      — split into stream_load_wv + stream_mac_wv (one each)
//   compute_output     — split into stream_load_wd + stream_mac_output
//
// FUNCTIONS UNCHANGED vs swiglu.cpp (verbatim):
//   fp16_to_fp32, get_byte, mac_blocks_wv_k2, mac_blocks_down_q4k_k2,
//   compute_gate, load_x_local
//
// ============================================================================

#include "swiglu.h"
#include "sigmoid_lut.h"
#include <stdint.h>
#include <string.h>
#include <ap_int.h>
#include <ap_fixed.h>
#include <hls_stream.h>

typedef ap_fixed<32,8>  fxd_scale_t;
typedef ap_fixed<56,38> fxd_accum_t;

#define VECTOR_DIM           2048
#define FFN_DIM              8192
#define Q4_K_BYTES           144
#define Q4_K_WORDS           9
#define WV_BLOCKS_PER_ROW    8
#define DOWN_BLOCKS_PER_ROW  32
#define WV_ROW_WORDS         72      // WV_BLOCKS_PER_ROW * Q4_K_WORDS
#define DOWN_Q4K_WORDS       288     // DOWN_BLOCKS_PER_ROW * Q4_K_WORDS
#define WV_PAIR_WORDS        144     // 2 rows × WV_ROW_WORDS — loaded as single burst
#define DOWN_PAIR_WORDS      576     // 2 rows × DOWN_Q4K_WORDS

#define X12_SCALE_RANGE  10.0f
#define X12_INV_SCALE    (127.0f / X12_SCALE_RANGE)
#define X12_QUANT_SCALE  (X12_SCALE_RANGE / 127.0f)

// ─── FIFO stream type ────────────────────────────────────────────────────────
// One element = one 128-bit AXI word. Producer writes DDR words directly;
// consumer reads them into a local rb buffer before MAC.
typedef hls::stream<ap_uint<128>> row_stream_t;

// ─── fp16_to_fp32 — UNCHANGED ────────────────────────────────────────────────
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

// ─── get_byte — UNCHANGED ────────────────────────────────────────────────────
static inline uint8_t get_byte(const ap_uint<128>* data, int byte_idx) {
#pragma HLS INLINE
    return (uint8_t)data[byte_idx >> 4].range((byte_idx & 0xF) * 8 + 7,
                                               (byte_idx & 0xF) * 8);
}

// ─── mac_blocks_wv_k2 — UNCHANGED ────────────────────────────────────────────
static void mac_blocks_wv_k2(const ap_uint<128> rb0[WV_BLOCKS_PER_ROW][Q4_K_WORDS],
                              const ap_uint<128> rb1[WV_BLOCKS_PER_ROW][Q4_K_WORDS],
                              const int8_t x[WV_BLOCKS_PER_ROW][256],
                              float x_scale,
                              float *result0, float *result1) {
#pragma HLS INLINE off
#pragma HLS BIND_OP op=mul impl=dsp
#pragma HLS ARRAY_PARTITION variable=rb0 dim=1 complete
#pragma HLS ARRAY_PARTITION variable=rb1 dim=1 complete
#pragma HLS ARRAY_PARTITION variable=x   dim=1 complete

    float   d0[WV_BLOCKS_PER_ROW],    dmin0[WV_BLOCKS_PER_ROW];
    float   d1[WV_BLOCKS_PER_ROW],    dmin1[WV_BLOCKS_PER_ROW];
    uint8_t sc60[WV_BLOCKS_PER_ROW][8], mn60[WV_BLOCKS_PER_ROW][8];
    uint8_t sc61[WV_BLOCKS_PER_ROW][8], mn61[WV_BLOCKS_PER_ROW][8];
    #pragma HLS ARRAY_PARTITION variable=d0    complete
    #pragma HLS ARRAY_PARTITION variable=dmin0 complete
    #pragma HLS ARRAY_PARTITION variable=d1    complete
    #pragma HLS ARRAY_PARTITION variable=dmin1 complete
    #pragma HLS ARRAY_PARTITION variable=sc60  dim=0 complete
    #pragma HLS ARRAY_PARTITION variable=mn60  dim=0 complete
    #pragma HLS ARRAY_PARTITION variable=sc61  dim=0 complete
    #pragma HLS ARRAY_PARTITION variable=mn61  dim=0 complete

    UNPACK_HDR_K2: for (int b = 0; b < WV_BLOCKS_PER_ROW; b++) {
        #pragma HLS PIPELINE II=1
        d0[b]    = fp16_to_fp32((uint16_t)get_byte(rb0[b], 0) | ((uint16_t)get_byte(rb0[b], 1) << 8));
        dmin0[b] = fp16_to_fp32((uint16_t)get_byte(rb0[b], 2) | ((uint16_t)get_byte(rb0[b], 3) << 8));
        sc60[b][0] = get_byte(rb0[b],  4) & 0x3F; sc60[b][1] = get_byte(rb0[b],  5) & 0x3F;
        sc60[b][2] = get_byte(rb0[b],  6) & 0x3F; sc60[b][3] = get_byte(rb0[b],  7) & 0x3F;
        mn60[b][0] = get_byte(rb0[b],  8) & 0x3F; mn60[b][1] = get_byte(rb0[b],  9) & 0x3F;
        mn60[b][2] = get_byte(rb0[b], 10) & 0x3F; mn60[b][3] = get_byte(rb0[b], 11) & 0x3F;
        sc60[b][4] = (get_byte(rb0[b], 12) & 0x0F) | (uint8_t)((get_byte(rb0[b],  4) >> 6) << 4);
        sc60[b][5] = (get_byte(rb0[b], 13) & 0x0F) | (uint8_t)((get_byte(rb0[b],  5) >> 6) << 4);
        sc60[b][6] = (get_byte(rb0[b], 14) & 0x0F) | (uint8_t)((get_byte(rb0[b],  6) >> 6) << 4);
        sc60[b][7] = (get_byte(rb0[b], 15) & 0x0F) | (uint8_t)((get_byte(rb0[b],  7) >> 6) << 4);
        mn60[b][4] = (get_byte(rb0[b], 12) >> 4) | (uint8_t)((get_byte(rb0[b],  8) >> 6) << 4);
        mn60[b][5] = (get_byte(rb0[b], 13) >> 4) | (uint8_t)((get_byte(rb0[b],  9) >> 6) << 4);
        mn60[b][6] = (get_byte(rb0[b], 14) >> 4) | (uint8_t)((get_byte(rb0[b], 10) >> 6) << 4);
        mn60[b][7] = (get_byte(rb0[b], 15) >> 4) | (uint8_t)((get_byte(rb0[b], 11) >> 6) << 4);
        d1[b]    = fp16_to_fp32((uint16_t)get_byte(rb1[b], 0) | ((uint16_t)get_byte(rb1[b], 1) << 8));
        dmin1[b] = fp16_to_fp32((uint16_t)get_byte(rb1[b], 2) | ((uint16_t)get_byte(rb1[b], 3) << 8));
        sc61[b][0] = get_byte(rb1[b],  4) & 0x3F; sc61[b][1] = get_byte(rb1[b],  5) & 0x3F;
        sc61[b][2] = get_byte(rb1[b],  6) & 0x3F; sc61[b][3] = get_byte(rb1[b],  7) & 0x3F;
        mn61[b][0] = get_byte(rb1[b],  8) & 0x3F; mn61[b][1] = get_byte(rb1[b],  9) & 0x3F;
        mn61[b][2] = get_byte(rb1[b], 10) & 0x3F; mn61[b][3] = get_byte(rb1[b], 11) & 0x3F;
        sc61[b][4] = (get_byte(rb1[b], 12) & 0x0F) | (uint8_t)((get_byte(rb1[b],  4) >> 6) << 4);
        sc61[b][5] = (get_byte(rb1[b], 13) & 0x0F) | (uint8_t)((get_byte(rb1[b],  5) >> 6) << 4);
        sc61[b][6] = (get_byte(rb1[b], 14) & 0x0F) | (uint8_t)((get_byte(rb1[b],  6) >> 6) << 4);
        sc61[b][7] = (get_byte(rb1[b], 15) & 0x0F) | (uint8_t)((get_byte(rb1[b],  7) >> 6) << 4);
        mn61[b][4] = (get_byte(rb1[b], 12) >> 4) | (uint8_t)((get_byte(rb1[b],  8) >> 6) << 4);
        mn61[b][5] = (get_byte(rb1[b], 13) >> 4) | (uint8_t)((get_byte(rb1[b],  9) >> 6) << 4);
        mn61[b][6] = (get_byte(rb1[b], 14) >> 4) | (uint8_t)((get_byte(rb1[b], 10) >> 6) << 4);
        mn61[b][7] = (get_byte(rb1[b], 15) >> 4) | (uint8_t)((get_byte(rb1[b], 11) >> 6) << 4);
    }

    int32_t int_acc_w0[WV_BLOCKS_PER_ROW][4], int_acc_m0[WV_BLOCKS_PER_ROW][4];
    int32_t int_acc_w1[WV_BLOCKS_PER_ROW][4], int_acc_m1[WV_BLOCKS_PER_ROW][4];
    #pragma HLS ARRAY_PARTITION variable=int_acc_w0 dim=0 complete
    #pragma HLS ARRAY_PARTITION variable=int_acc_m0 dim=0 complete
    #pragma HLS ARRAY_PARTITION variable=int_acc_w1 dim=0 complete
    #pragma HLS ARRAY_PARTITION variable=int_acc_m1 dim=0 complete

    INIT_ACC_K2: for (int b = 0; b < WV_BLOCKS_PER_ROW; b++) {
        #pragma HLS UNROLL
        for (int k = 0; k < 4; k++) {
            #pragma HLS UNROLL
            int_acc_w0[b][k] = 0; int_acc_m0[b][k] = 0;
            int_acc_w1[b][k] = 0; int_acc_m1[b][k] = 0;
        }
    }

    MAC_ALL_K2: for (int n = 0; n < 256; n++) {
        #pragma HLS PIPELINE II=1
        int nib_byte = 16 + (n & 31) + ((n & 0xC0) >> 1);
        int nib_shft = (n & 32) ? 4 : 0;
        int sub = n >> 5;
        int k   = n & 3;
        for (int b = 0; b < WV_BLOCKS_PER_ROW; b++) {
            #pragma HLS UNROLL
            ap_int<8>  xi8   = (ap_int<8>) x[b][n];
            ap_uint<4> nib0  = (ap_uint<4>)((get_byte(rb0[b], nib_byte) >> nib_shft) & 0xF);
            ap_uint<4> nib1  = (ap_uint<4>)((get_byte(rb1[b], nib_byte) >> nib_shft) & 0xF);
            ap_uint<6> sc60u = (ap_uint<6>) sc60[b][sub];
            ap_uint<6> mn60u = (ap_uint<6>) mn60[b][sub];
            ap_uint<6> sc61u = (ap_uint<6>) sc61[b][sub];
            ap_uint<6> mn61u = (ap_uint<6>) mn61[b][sub];
            int_acc_w0[b][k] += (int32_t)(xi8 * (ap_int<5>)nib0 * (ap_int<7>)sc60u);
            int_acc_m0[b][k] += (int32_t)(xi8 * (ap_int<7>)mn60u);
            int_acc_w1[b][k] += (int32_t)(xi8 * (ap_int<5>)nib1 * (ap_int<7>)sc61u);
            int_acc_m1[b][k] += (int32_t)(xi8 * (ap_int<7>)mn61u);
        }
    }

    fxd_accum_t total0 = 0, total1 = 0;
    REDUCE_K2: for (int b = 0; b < WV_BLOCKS_PER_ROW; b++) {
        int32_t sw0 = 0, sm0 = 0, sw1 = 0, sm1 = 0;
        for (int k = 0; k < 4; k++) {
            #pragma HLS UNROLL
            sw0 += int_acc_w0[b][k]; sm0 += int_acc_m0[b][k];
            sw1 += int_acc_w1[b][k]; sm1 += int_acc_m1[b][k];
        }
        total0 += (fxd_scale_t)d0[b] * (fxd_accum_t)sw0 - (fxd_scale_t)dmin0[b] * (fxd_accum_t)sm0;
        total1 += (fxd_scale_t)d1[b] * (fxd_accum_t)sw1 - (fxd_scale_t)dmin1[b] * (fxd_accum_t)sm1;
    }
    *result0 = (float)total0 * x_scale;
    *result1 = (float)total1 * x_scale;
}

// ─── mac_blocks_down_q4k_k2 — UNCHANGED ──────────────────────────────────────
static void mac_blocks_down_q4k_k2(
    const ap_uint<128> rb0[DOWN_BLOCKS_PER_ROW][Q4_K_WORDS],
    const ap_uint<128> rb1[DOWN_BLOCKS_PER_ROW][Q4_K_WORDS],
    const int8_t gate[DOWN_BLOCKS_PER_ROW][256],
    float gate_scale,
    float *result0, float *result1) {
#pragma HLS INLINE off
#pragma HLS BIND_OP op=mul impl=dsp
#pragma HLS ARRAY_PARTITION variable=rb0  dim=1 complete
#pragma HLS BIND_STORAGE    variable=rb0  type=ram_1p impl=lutram
#pragma HLS ARRAY_PARTITION variable=rb1  dim=1 complete
#pragma HLS BIND_STORAGE    variable=rb1  type=ram_1p impl=lutram
#pragma HLS ARRAY_PARTITION variable=gate dim=1 complete

    float   d0  [DOWN_BLOCKS_PER_ROW], d1  [DOWN_BLOCKS_PER_ROW];
    float   dmin0[DOWN_BLOCKS_PER_ROW], dmin1[DOWN_BLOCKS_PER_ROW];
    uint8_t sc6_0[DOWN_BLOCKS_PER_ROW][8], sc6_1[DOWN_BLOCKS_PER_ROW][8];
    uint8_t mn6_0[DOWN_BLOCKS_PER_ROW][8], mn6_1[DOWN_BLOCKS_PER_ROW][8];
    #pragma HLS ARRAY_PARTITION variable=d0    complete
    #pragma HLS ARRAY_PARTITION variable=d1    complete
    #pragma HLS ARRAY_PARTITION variable=dmin0 complete
    #pragma HLS ARRAY_PARTITION variable=dmin1 complete
    #pragma HLS ARRAY_PARTITION variable=sc6_0 dim=0 complete
    #pragma HLS ARRAY_PARTITION variable=mn6_0 dim=0 complete
    #pragma HLS ARRAY_PARTITION variable=sc6_1 dim=0 complete
    #pragma HLS ARRAY_PARTITION variable=mn6_1 dim=0 complete

    UNPACK_HDR_K2: for (int b = 0; b < DOWN_BLOCKS_PER_ROW; b++) {
        #pragma HLS PIPELINE II=1
        d0[b]    = fp16_to_fp32((uint16_t)get_byte(rb0[b], 0) | ((uint16_t)get_byte(rb0[b], 1) << 8));
        dmin0[b] = fp16_to_fp32((uint16_t)get_byte(rb0[b], 2) | ((uint16_t)get_byte(rb0[b], 3) << 8));
        d1[b]    = fp16_to_fp32((uint16_t)get_byte(rb1[b], 0) | ((uint16_t)get_byte(rb1[b], 1) << 8));
        dmin1[b] = fp16_to_fp32((uint16_t)get_byte(rb1[b], 2) | ((uint16_t)get_byte(rb1[b], 3) << 8));
        sc6_0[b][0] = get_byte(rb0[b],  4) & 0x3F; sc6_0[b][1] = get_byte(rb0[b],  5) & 0x3F;
        sc6_0[b][2] = get_byte(rb0[b],  6) & 0x3F; sc6_0[b][3] = get_byte(rb0[b],  7) & 0x3F;
        mn6_0[b][0] = get_byte(rb0[b],  8) & 0x3F; mn6_0[b][1] = get_byte(rb0[b],  9) & 0x3F;
        mn6_0[b][2] = get_byte(rb0[b], 10) & 0x3F; mn6_0[b][3] = get_byte(rb0[b], 11) & 0x3F;
        sc6_0[b][4] = (get_byte(rb0[b], 12) & 0x0F) | (uint8_t)((get_byte(rb0[b],  4) >> 6) << 4);
        sc6_0[b][5] = (get_byte(rb0[b], 13) & 0x0F) | (uint8_t)((get_byte(rb0[b],  5) >> 6) << 4);
        sc6_0[b][6] = (get_byte(rb0[b], 14) & 0x0F) | (uint8_t)((get_byte(rb0[b],  6) >> 6) << 4);
        sc6_0[b][7] = (get_byte(rb0[b], 15) & 0x0F) | (uint8_t)((get_byte(rb0[b],  7) >> 6) << 4);
        mn6_0[b][4] = (get_byte(rb0[b], 12) >> 4) | (uint8_t)((get_byte(rb0[b],  8) >> 6) << 4);
        mn6_0[b][5] = (get_byte(rb0[b], 13) >> 4) | (uint8_t)((get_byte(rb0[b],  9) >> 6) << 4);
        mn6_0[b][6] = (get_byte(rb0[b], 14) >> 4) | (uint8_t)((get_byte(rb0[b], 10) >> 6) << 4);
        mn6_0[b][7] = (get_byte(rb0[b], 15) >> 4) | (uint8_t)((get_byte(rb0[b], 11) >> 6) << 4);
        sc6_1[b][0] = get_byte(rb1[b],  4) & 0x3F; sc6_1[b][1] = get_byte(rb1[b],  5) & 0x3F;
        sc6_1[b][2] = get_byte(rb1[b],  6) & 0x3F; sc6_1[b][3] = get_byte(rb1[b],  7) & 0x3F;
        mn6_1[b][0] = get_byte(rb1[b],  8) & 0x3F; mn6_1[b][1] = get_byte(rb1[b],  9) & 0x3F;
        mn6_1[b][2] = get_byte(rb1[b], 10) & 0x3F; mn6_1[b][3] = get_byte(rb1[b], 11) & 0x3F;
        sc6_1[b][4] = (get_byte(rb1[b], 12) & 0x0F) | (uint8_t)((get_byte(rb1[b],  4) >> 6) << 4);
        sc6_1[b][5] = (get_byte(rb1[b], 13) & 0x0F) | (uint8_t)((get_byte(rb1[b],  5) >> 6) << 4);
        sc6_1[b][6] = (get_byte(rb1[b], 14) & 0x0F) | (uint8_t)((get_byte(rb1[b],  6) >> 6) << 4);
        sc6_1[b][7] = (get_byte(rb1[b], 15) & 0x0F) | (uint8_t)((get_byte(rb1[b],  7) >> 6) << 4);
        mn6_1[b][4] = (get_byte(rb1[b], 12) >> 4) | (uint8_t)((get_byte(rb1[b],  8) >> 6) << 4);
        mn6_1[b][5] = (get_byte(rb1[b], 13) >> 4) | (uint8_t)((get_byte(rb1[b],  9) >> 6) << 4);
        mn6_1[b][6] = (get_byte(rb1[b], 14) >> 4) | (uint8_t)((get_byte(rb1[b], 10) >> 6) << 4);
        mn6_1[b][7] = (get_byte(rb1[b], 15) >> 4) | (uint8_t)((get_byte(rb1[b], 11) >> 6) << 4);
    }

    fxd_accum_t total0 = 0, total1 = 0;
    for (int grp = 0; grp < 4; grp++) {
        #pragma HLS UNROLL
        int32_t acc_w0[8][4], acc_m0[8][4];
        int32_t acc_w1[8][4], acc_m1[8][4];
        #pragma HLS ARRAY_PARTITION variable=acc_w0 dim=0 complete
        #pragma HLS ARRAY_PARTITION variable=acc_m0 dim=0 complete
        #pragma HLS ARRAY_PARTITION variable=acc_w1 dim=0 complete
        #pragma HLS ARRAY_PARTITION variable=acc_m1 dim=0 complete
        INIT_GRP: for (int b = 0; b < 8; b++) {
            #pragma HLS UNROLL
            for (int k = 0; k < 4; k++) {
                #pragma HLS UNROLL
                acc_w0[b][k] = 0; acc_m0[b][k] = 0;
                acc_w1[b][k] = 0; acc_m1[b][k] = 0;
            }
        }
        MAC_GRP: for (int n = 0; n < 256; n++) {
            #pragma HLS PIPELINE II=1
            int nib_byte = 16 + (n & 31) + ((n & 0xC0) >> 1);
            int nib_shft = (n & 32) ? 4 : 0;
            int sub = n >> 5;
            int k   = n & 3;
            for (int b = 0; b < 8; b++) {
                #pragma HLS UNROLL
                int babs = grp * 8 + b;
                ap_int<8>  gi8    = (ap_int<8>)  gate[babs][n];
                ap_uint<4> nib4_0 = (ap_uint<4>)((get_byte(rb0[babs], nib_byte) >> nib_shft) & 0xF);
                ap_uint<4> nib4_1 = (ap_uint<4>)((get_byte(rb1[babs], nib_byte) >> nib_shft) & 0xF);
                ap_uint<6> sc6u_0 = (ap_uint<6>) sc6_0[babs][sub];
                ap_uint<6> mn6u_0 = (ap_uint<6>) mn6_0[babs][sub];
                ap_uint<6> sc6u_1 = (ap_uint<6>) sc6_1[babs][sub];
                ap_uint<6> mn6u_1 = (ap_uint<6>) mn6_1[babs][sub];
                acc_w0[b][k] += (int32_t)(gi8 * (ap_int<5>)nib4_0 * (ap_int<7>)sc6u_0);
                acc_m0[b][k] += (int32_t)(gi8 * (ap_int<7>)mn6u_0);
                acc_w1[b][k] += (int32_t)(gi8 * (ap_int<5>)nib4_1 * (ap_int<7>)sc6u_1);
                acc_m1[b][k] += (int32_t)(gi8 * (ap_int<7>)mn6u_1);
            }
        }
        REDUCE_GRP: for (int b = 0; b < 8; b++) {
            int babs = grp * 8 + b;
            int32_t sw0 = 0, sm0 = 0, sw1 = 0, sm1 = 0;
            for (int k = 0; k < 4; k++) {
                #pragma HLS UNROLL
                sw0 += acc_w0[b][k]; sm0 += acc_m0[b][k];
                sw1 += acc_w1[b][k]; sm1 += acc_m1[b][k];
            }
            total0 += (fxd_scale_t)d0[babs]   * (fxd_accum_t)sw0
                    - (fxd_scale_t)dmin0[babs] * (fxd_accum_t)sm0;
            total1 += (fxd_scale_t)d1[babs]   * (fxd_accum_t)sw1
                    - (fxd_scale_t)dmin1[babs] * (fxd_accum_t)sm1;
        }
    }
    *result0 = (float)total0 * gate_scale;
    *result1 = (float)total1 * gate_scale;
}

// ─── compute_gate — UNCHANGED ─────────────────────────────────────────────────
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

// ─── load_x_local — UNCHANGED ─────────────────────────────────────────────────
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
// NEW: Streaming DATAFLOW tasks
// ============================================================================

// ─── stream_load_W / stream_load_V ───────────────────────────────────────────
// Producer tasks for X1 and X2 phases respectively. Each streams all FFN_DIM
// rows in pair order into its FIFO, 144 words per pair (both rows merged into
// a single burst).
//
// KEY CHANGE vs swiglu.cpp / load_row_wv:
//   swiglu.cpp calls load_row_wv twice per pair (2 × 72-word burst per pair).
//   Here a single 144-word inner loop covers both rows in one contiguous burst:
//     address = pair * WV_PAIR_WORDS + i  (monotone, no stride between rows)
//   This saves one DDR latency per pair: ~30cy × 4096 pairs ≈ 0.49ms @ 250MHz.
//
// HLS burst inference: inner loop is PIPELINE II=1 with monotone address →
//   one 144-word burst per pair (within 256-beat AXI4 limit set by
//   max_read_burst_length=256). One DDR latency per pair (not two).
//
// DATAFLOW role: runs as an independent FSM in top-level DATAFLOW.
//   Pushes to x1_fifo/x2_fifo while stream_mac_X1/X2 pops from it.
//   FIFO depth 144 → loader can be one full pair ahead of MAC.
// Two separately-named functions required
// because HLS DATAFLOW does not allow the same function to appear more than
// once in a DATAFLOW region. Both bodies are identical; only the name differs
// so HLS treats them as independent tasks that can run concurrently.
//
// max_read_burst_length raised to 256 (from 128 on W/V ports) so the 144-word
// merged burst fits in a single AXI transaction. With 128-word limit the burst
// would split into 128+16 = 2 transactions, giving no latency advantage over
// the current 72+72 approach in swiglu.cpp.
static void stream_load_W(const uint8_t *W, row_stream_t &fifo)
{
#pragma HLS INLINE off
    const ap_uint<128> *W_wide = (const ap_uint<128>*)W;
    LOAD_W_PAIRS: for (int pair = 0; pair < FFN_DIM / 2; pair++) {
        PUSH_W_PAIR: for (int i = 0; i < WV_PAIR_WORDS; i++) {
            #pragma HLS PIPELINE II=1
            fifo.write(W_wide[(ap_uint<64>)pair * WV_PAIR_WORDS + i]);
        }
    }
}

static void stream_load_V(const uint8_t *V, row_stream_t &fifo)
{
#pragma HLS INLINE off
    const ap_uint<128> *V_wide = (const ap_uint<128>*)V;
    LOAD_V_PAIRS: for (int pair = 0; pair < FFN_DIM / 2; pair++) {
        PUSH_V_PAIR: for (int i = 0; i < WV_PAIR_WORDS; i++) {
            #pragma HLS PIPELINE II=1
            fifo.write(V_wide[(ap_uint<64>)pair * WV_PAIR_WORDS + i]);
        }
    }
}

// stream_mac_X1 / stream_mac_X2: two separately-named consumer tasks, one per
// X cache. Bodies are identical; separate names allow HLS DATAFLOW to schedule
// them as independent concurrent tasks (each fed by its own FIFO).
//
// Per-pair timing (MAC task determines overall throughput):
//   POP_RB0:            72cy  (FIFO read, PIPELINE II=1)
//   POP_RB1:            72cy  (FIFO read, PIPELINE II=1)
//   mac_blocks_wv_k2:  ~272cy (UNPACK 8cy + MAC 256cy + REDUCE 8cy)
//   Total:             ~416cy  vs  current ~476cy sequential  → ~13% faster
//
// DDR loads (stream_load_W/V) run concurrently and are fully hidden since
// load (144cy, single burst) << MAC task (416cy). Steady-state rate = 416cy/pair.
//
// rb0/rb1 are loop-local BRAMs — unavoidable because mac_blocks_wv_k2 requires
// random nibble-byte access (nib_byte = 16 + (n&31) + ((n&0xC0)>>1)).
static void stream_mac_X1(
    row_stream_t         &fifo,
    const int8_t         x_local[MAX_BATCH][WV_BLOCKS_PER_ROW][256],
    float                x_scale,
    int8_t               X_cache[MAX_BATCH][FFN_DIM])
{
#pragma HLS INLINE off
#pragma HLS ARRAY_PARTITION variable=x_local dim=2 complete
    MAC_X1_PAIRS: for (int pair = 0; pair < FFN_DIM / 2; pair++) {
        ap_uint<128> rb0[WV_BLOCKS_PER_ROW][Q4_K_WORDS];
        ap_uint<128> rb1[WV_BLOCKS_PER_ROW][Q4_K_WORDS];
        #pragma HLS ARRAY_PARTITION variable=rb0 dim=1 complete
        #pragma HLS BIND_STORAGE    variable=rb0 type=ram_1p impl=bram
        #pragma HLS ARRAY_PARTITION variable=rb1 dim=1 complete
        #pragma HLS BIND_STORAGE    variable=rb1 type=ram_1p impl=bram
        int b = 0, w = 0;
        POP_X1_RB0: for (int i = 0; i < WV_ROW_WORDS; i++) {
            #pragma HLS PIPELINE II=1
            rb0[b][w] = fifo.read();
            if (w == Q4_K_WORDS - 1) { w = 0; b++; } else { w++; }
        }
        b = 0; w = 0;
        POP_X1_RB1: for (int i = 0; i < WV_ROW_WORDS; i++) {
            #pragma HLS PIPELINE II=1
            rb1[b][w] = fifo.read();
            if (w == Q4_K_WORDS - 1) { w = 0; b++; } else { w++; }
        }
        float r0, r1;
        mac_blocks_wv_k2(rb0, rb1, x_local[0], x_scale, &r0, &r1);
        float fq0 = r0 * X12_INV_SCALE;
        int   iq0 = (int)(fq0 + (fq0 >= 0.f ? 0.5f : -0.5f));
        if (iq0 >  127) iq0 =  127; if (iq0 < -128) iq0 = -128;
        X_cache[0][pair * 2]     = (int8_t)iq0;
        float fq1 = r1 * X12_INV_SCALE;
        int   iq1 = (int)(fq1 + (fq1 >= 0.f ? 0.5f : -0.5f));
        if (iq1 >  127) iq1 =  127; if (iq1 < -128) iq1 = -128;
        X_cache[0][pair * 2 + 1] = (int8_t)iq1;
    }
}

static void stream_mac_X2(
    row_stream_t         &fifo,
    const int8_t         x_local[MAX_BATCH][WV_BLOCKS_PER_ROW][256],
    float                x_scale,
    int8_t               X_cache[MAX_BATCH][FFN_DIM])
{
#pragma HLS INLINE off
#pragma HLS ARRAY_PARTITION variable=x_local dim=2 complete
    MAC_X2_PAIRS: for (int pair = 0; pair < FFN_DIM / 2; pair++) {
        ap_uint<128> rb0[WV_BLOCKS_PER_ROW][Q4_K_WORDS];
        ap_uint<128> rb1[WV_BLOCKS_PER_ROW][Q4_K_WORDS];
        #pragma HLS ARRAY_PARTITION variable=rb0 dim=1 complete
        #pragma HLS BIND_STORAGE    variable=rb0 type=ram_1p impl=bram
        #pragma HLS ARRAY_PARTITION variable=rb1 dim=1 complete
        #pragma HLS BIND_STORAGE    variable=rb1 type=ram_1p impl=bram
        int b = 0, w = 0;
        POP_X2_RB0: for (int i = 0; i < WV_ROW_WORDS; i++) {
            #pragma HLS PIPELINE II=1
            rb0[b][w] = fifo.read();
            if (w == Q4_K_WORDS - 1) { w = 0; b++; } else { w++; }
        }
        b = 0; w = 0;
        POP_X2_RB1: for (int i = 0; i < WV_ROW_WORDS; i++) {
            #pragma HLS PIPELINE II=1
            rb1[b][w] = fifo.read();
            if (w == Q4_K_WORDS - 1) { w = 0; b++; } else { w++; }
        }
        float r0, r1;
        mac_blocks_wv_k2(rb0, rb1, x_local[0], x_scale, &r0, &r1);
        float fq0 = r0 * X12_INV_SCALE;
        int   iq0 = (int)(fq0 + (fq0 >= 0.f ? 0.5f : -0.5f));
        if (iq0 >  127) iq0 =  127; if (iq0 < -128) iq0 = -128;
        X_cache[0][pair * 2]     = (int8_t)iq0;
        float fq1 = r1 * X12_INV_SCALE;
        int   iq1 = (int)(fq1 + (fq1 >= 0.f ? 0.5f : -0.5f));
        if (iq1 >  127) iq1 =  127; if (iq1 < -128) iq1 = -128;
        X_cache[0][pair * 2 + 1] = (int8_t)iq1;
    }
}

// ─── stream_load_wd ───────────────────────────────────────────────────────────
// Producer task for the output phase. Streams all VECTOR_DIM W_down rows in
// pair order into a FIFO, 576 words per pair (2 × 288-word rows merged).
//
// AXI burst: 576 words > 256-beat AXI4 limit → split into 256+256+64 bursts
//   (3 DDR latencies per pair). Current swiglu.cpp issues 2 calls × (256+32)
//   bursts = 4 bursts per pair. Merged loop saves 1 DDR latency per pair:
//   ~30cy × 1024 pairs ≈ 30K cycles = 0.12ms @ 250MHz.
//
// For output phase: MAC dominates (1024cy >> 576cy FIFO pop), so this saving
// is absorbed and does not reduce the bottleneck. The primary benefit of the
// streaming structure here is architectural consistency and hiding any DDR
// contention from the MAC task.
static void stream_load_wd(const uint8_t *W_down, row_stream_t &fifo)
{
#pragma HLS INLINE off
    const ap_uint<128> *W_down_wide = (const ap_uint<128>*)W_down;
    LOAD_WD_PAIRS: for (int pair = 0; pair < VECTOR_DIM / 2; pair++) {
        PUSH_WD_PAIR: for (int i = 0; i < DOWN_PAIR_WORDS; i++) {
            #pragma HLS PIPELINE II=1
            fifo.write(W_down_wide[(ap_uint<64>)pair * DOWN_PAIR_WORDS + i]);
        }
    }
}

// ─── stream_mac_output ────────────────────────────────────────────────────────
// Consumer task for the output phase. Reads 576 words per pair from FIFO,
// reconstructs rb0[32][9] and rb1[32][9] locally, then MACs.
//
// Per-pair timing:
//   POP_RB0:                    288cy
//   POP_RB1:                    288cy
//   mac_blocks_down_q4k_k2:   ~1024cy (32cy UNPACK + 4×256cy MAC + 4×8cy REDUCE)
//   Total:                     ~1600cy  — same as swiglu.cpp sequential path
//
// No throughput improvement vs swiglu.cpp for the output phase: FIFO pop
// (576cy) ≈ original DDR load (576cy), so MAC task takes the same total time.
// The architectural benefit is that DDR loads for pair N+1 run concurrently
// with MAC for pair N, eliminating any DDR→MAC serialization at the top level.
static void stream_mac_output(
    row_stream_t       &fifo,
    const int8_t       gate_cache[MAX_BATCH][DOWN_BLOCKS_PER_ROW][256],
    const float        gate_scale_array[MAX_BATCH],
    float             *out_batch)
{
#pragma HLS INLINE off
#pragma HLS ARRAY_PARTITION variable=gate_cache dim=2 cyclic factor=8
    float gate_scale = gate_scale_array[0];
    float out_local[VECTOR_DIM];
    #pragma HLS BIND_STORAGE variable=out_local type=ram_1p impl=bram

    OUT_PAIRS: for (int pair = 0; pair < VECTOR_DIM / 2; pair++) {
        ap_uint<128> rb0[DOWN_BLOCKS_PER_ROW][Q4_K_WORDS];
        ap_uint<128> rb1[DOWN_BLOCKS_PER_ROW][Q4_K_WORDS];
        #pragma HLS ARRAY_PARTITION variable=rb0 dim=1 complete
        #pragma HLS BIND_STORAGE    variable=rb0 type=ram_1p impl=lutram
        #pragma HLS ARRAY_PARTITION variable=rb1 dim=1 complete
        #pragma HLS BIND_STORAGE    variable=rb1 type=ram_1p impl=lutram

        int b = 0, w = 0;
        POP_WD0: for (int i = 0; i < DOWN_Q4K_WORDS; i++) {
            #pragma HLS PIPELINE II=1
            rb0[b][w] = fifo.read();
            if (w == Q4_K_WORDS - 1) { w = 0; b++; } else { w++; }
        }
        b = 0; w = 0;
        POP_WD1: for (int i = 0; i < DOWN_Q4K_WORDS; i++) {
            #pragma HLS PIPELINE II=1
            rb1[b][w] = fifo.read();
            if (w == Q4_K_WORDS - 1) { w = 0; b++; } else { w++; }
        }

        mac_blocks_down_q4k_k2(rb0, rb1, gate_cache[0], gate_scale,
                                &out_local[pair * 2], &out_local[pair * 2 + 1]);
    }
    memcpy(out_batch, out_local, VECTOR_DIM * sizeof(float));
}

// ============================================================================
// swiglu — top-level, flat DATAFLOW with 8 tasks
//
// Task graph (arrows = data dependency via BRAM/FIFO):
//
//   load_x_local  ──┬──► stream_mac_X1(x1_fifo, x_local_1) ──► X1_cache ──┐
//                   │                                                        ├─► compute_gate ──► gate_cache ──► stream_mac_output
//                   └──► stream_mac_X2(x2_fifo, x_local_2) ──► X2_cache ──┘
//
//   stream_load_W(W, x1_fifo)     ──► x1_fifo ──► stream_mac_X1
//   stream_load_V(V, x2_fifo)     ──► x2_fifo ──► stream_mac_X2
//   stream_load_wd(W_down, wd_f)  ──► wd_fifo ──► stream_mac_output
//
// HLS DATAFLOW sees 8 independent tasks. X1 loader/MAC and X2 loader/MAC
// can run concurrently (no shared data). compute_gate waits for both
// X1_cache and X2_cache. stream_mac_output waits for gate_cache.
//
// FIFO depths (words of ap_uint<128>):
//   x1_fifo / x2_fifo: 144  (one pair of WV rows)    → ~18 Kbit → 1 BRAM_18K each
//   wd_fifo:           576  (one pair of W_down rows) → ~74 Kbit → 5 BRAM_18K
//   Total additional BRAM: 7 BRAM_18K (vs 288 available on ZU5EV).
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
    // max_read_burst_length=256: merged 144-word burst fits in one AXI transaction.
    // With 128-word limit it would split into 128+16 (two latencies, same as before).
    #pragma HLS INTERFACE mode=m_axi port=W         bundle=gmem_W    offset=slave depth=9437184  max_read_burst_length=256  latency=64 num_read_outstanding=1 max_widen_bitwidth=128
    #pragma HLS INTERFACE mode=m_axi port=V         bundle=gmem_V    offset=slave depth=9437184  max_read_burst_length=256  latency=64 num_read_outstanding=1 max_widen_bitwidth=128
    #pragma HLS INTERFACE mode=m_axi port=W_down    bundle=gmem_Wd   offset=slave depth=13762560 max_read_burst_length=256  latency=64 num_read_outstanding=1 max_widen_bitwidth=128
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

    // x_local: LUTRAM, dim=2 complete (256-element bank access for MAC).
    int8_t x_local_1[MAX_BATCH][WV_BLOCKS_PER_ROW][256];
    #pragma HLS BIND_STORAGE    variable=x_local_1 type=ram_1p impl=lutram
    #pragma HLS ARRAY_PARTITION variable=x_local_1 dim=2 complete
    int8_t x_local_2[MAX_BATCH][WV_BLOCKS_PER_ROW][256];
    #pragma HLS BIND_STORAGE    variable=x_local_2 type=ram_1p impl=lutram
    #pragma HLS ARRAY_PARTITION variable=x_local_2 dim=2 complete

    // X1/X2 caches: ram_1p — stream_mac_X1/X2 fully complete before compute_gate
    // reads (BRAM channel in DATAFLOW, not FIFO — gate waits for full array).
    // ram_2p would waste one BRAM port (and double tile count) with no benefit.
    int8_t X1_cache[MAX_BATCH][FFN_DIM];
    int8_t X2_cache[MAX_BATCH][FFN_DIM];
    #pragma HLS BIND_STORAGE variable=X1_cache type=ram_1p impl=bram
    #pragma HLS BIND_STORAGE variable=X2_cache type=ram_1p impl=bram

    // gate_cache: ram_1p URAM, cyclic factor=8 for 8-block parallel reads in MAC_GRP.
    int8_t gate_cache[MAX_BATCH][DOWN_BLOCKS_PER_ROW][256];
    #pragma HLS BIND_STORAGE    variable=gate_cache type=ram_1p impl=uram
    #pragma HLS ARRAY_PARTITION variable=gate_cache dim=2 cyclic factor=8

    float gate_scale[MAX_BATCH];

    // FIFO channels between producer and consumer tasks.
    // Depth = one pair ahead → enough for the producer to stay one iteration
    // ahead of the consumer, enabling steady-state overlap.
    row_stream_t x1_fifo("x1_fifo");
    row_stream_t x2_fifo("x2_fifo");
    row_stream_t wd_fifo("wd_fifo");
    #pragma HLS STREAM variable=x1_fifo depth=144
    #pragma HLS STREAM variable=x2_fifo depth=144
    #pragma HLS STREAM variable=wd_fifo depth=576

    #pragma HLS BIND_STORAGE variable=sigmoid_lut type=rom_1p impl=bram

#ifndef __SYNTHESIS__
    init_sigmoid_lut_csim();
#endif

    // Flat top-level DATAFLOW — no nesting.
    // HLS sees 8 tasks; each is a simple loop with its own FSM.
    // Tasks with no shared data (X1 loader+MAC, X2 loader+MAC) can overlap.
    #pragma HLS DATAFLOW
    load_x_local(x_batch, x_local_1, x_local_2);
    stream_load_W(W,      x1_fifo);
    stream_mac_X1(x1_fifo, x_local_1, x_scale, X1_cache);
    stream_load_V(V,      x2_fifo);
    stream_mac_X2(x2_fifo, x_local_2, x_scale, X2_cache);
    compute_gate(X1_cache, X2_cache, gate_cache, gate_scale);
    stream_load_wd(W_down, wd_fifo);
    stream_mac_output(wd_fifo, gate_cache, gate_scale, out_batch);
}
