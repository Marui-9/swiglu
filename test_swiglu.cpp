#include "swiglu.h"
#include "sigmoid_lut.h"
#include <stdint.h>
// Q6K path disabled — all 16 ffn_down layers in the target GGUF are Q4_K.
// Re-enable by uncommenting: #define ENABLE_Q6K
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
#define Q4_K_WORDS           9
#define Q6_K_BYTES           210

// ─── Derived constants ────────────────────────────────────────────────────────
#define WV_BLOCKS_PER_ROW    8
#define DOWN_BLOCKS_PER_ROW  32
#define WV_ROW_BYTES         (WV_BLOCKS_PER_ROW   * Q4_K_BYTES)
#define DOWN_ROW_Q4K_BYTES   (DOWN_BLOCKS_PER_ROW * Q4_K_BYTES)
#ifdef ENABLE_Q6K
#define DOWN_ROW_Q6K_BYTES   (DOWN_BLOCKS_PER_ROW * Q6_K_BYTES)
#endif

#define WV_ROW_WORDS         (WV_ROW_BYTES       / 16)
#define DOWN_Q4K_WORDS       (DOWN_ROW_Q4K_BYTES / 16)
#ifdef ENABLE_Q6K
#define DOWN_Q6K_WORDS       (DOWN_ROW_Q6K_BYTES / 16)
#endif

#define X12_SCALE_RANGE  10.0f
#define X12_INV_SCALE    (127.0f / X12_SCALE_RANGE)
#define X12_QUANT_SCALE  (X12_SCALE_RANGE / 127.0f)

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

// ─── Byte extractor ──────────────────────────────────────────────────────────
static inline uint8_t get_byte(const ap_uint<128>* data, int byte_idx) {
#pragma HLS INLINE
    return (uint8_t)data[byte_idx >> 4].range((byte_idx & 0xF) * 8 + 7,
                                               (byte_idx & 0xF) * 8);
}


// ─── DATAFLOW sub-functions ───────────────────────────────────────────────────

// load_row_wv: unchanged from swiglu.cpp.
// Single 72-word AXI burst per call via flat counter loop.
static void load_row_wv(const ap_uint<128> *W_wide, int row,
                         ap_uint<128> rb[WV_BLOCKS_PER_ROW][Q4_K_WORDS]) {
#pragma HLS INLINE off
#pragma HLS ARRAY_PARTITION variable=rb dim=1 complete

    int b_cnt = 0, w_cnt = 0;
    LOAD_FLAT: for (int i = 0; i < WV_ROW_WORDS; i++) {
        #pragma HLS PIPELINE II=1
        rb[b_cnt][w_cnt] = W_wide[(ap_uint<64>)row * WV_ROW_WORDS + i];
        if (w_cnt == Q4_K_WORDS - 1) { w_cnt = 0; b_cnt++; }
        else { w_cnt++; }
    }
}

// ─── NEW: load_pair_wv ───────────────────────────────────────────────────────
// Loads the even and odd rows of one K=2 pair as two sequential 72-word bursts.
// INLINE off: appears as a distinct DATAFLOW producer task in the ping-pong loop.
// HLS infers two separate AXI transactions from the same gmem_W/V port.
static void load_pair_wv(const ap_uint<128> *W_wide, int pair,
                          ap_uint<128> rb0[WV_BLOCKS_PER_ROW][Q4_K_WORDS],
                          ap_uint<128> rb1[WV_BLOCKS_PER_ROW][Q4_K_WORDS]) {
#pragma HLS INLINE off
#pragma HLS ARRAY_PARTITION variable=rb0 dim=1 complete
#pragma HLS ARRAY_PARTITION variable=rb1 dim=1 complete
    load_row_wv(W_wide, pair * 2,     rb0);
    load_row_wv(W_wide, pair * 2 + 1, rb1);
}

// ─── mac_blocks_wv_k2: unchanged from swiglu.cpp ─────────────────────────────
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

// ─── NEW: mac_quantize_wv_pair ────────────────────────────────────────────────
// MAC + INT8 quantize for one WV row pair. Distinct DATAFLOW consumer task.
// Called from the DATAFLOW ping-pong loop inside compute_X1 / compute_X2.
// rb0/rb1 are the ping-pong channel arrays written by load_pair_wv in the
// previous DATAFLOW task of the same iteration.
static void mac_quantize_wv_pair(
    const ap_uint<128> rb0[WV_BLOCKS_PER_ROW][Q4_K_WORDS],
    const ap_uint<128> rb1[WV_BLOCKS_PER_ROW][Q4_K_WORDS],
    const int8_t x[WV_BLOCKS_PER_ROW][256],
    float x_scale,
    int8_t *out0, int8_t *out1)
{
#pragma HLS INLINE off
#pragma HLS ARRAY_PARTITION variable=rb0 dim=1 complete
#pragma HLS ARRAY_PARTITION variable=rb1 dim=1 complete
#pragma HLS ARRAY_PARTITION variable=x   dim=1 complete
    float r0, r1;
    mac_blocks_wv_k2(rb0, rb1, x, x_scale, &r0, &r1);

    float fq0 = r0 * X12_INV_SCALE;
    int   iq0 = (int)(fq0 + (fq0 >= 0.f ? 0.5f : -0.5f));
    if (iq0 >  127) iq0 =  127;
    if (iq0 < -128) iq0 = -128;
    *out0 = (int8_t)iq0;

    float fq1 = r1 * X12_INV_SCALE;
    int   iq1 = (int)(fq1 + (fq1 >= 0.f ? 0.5f : -0.5f));
    if (iq1 >  127) iq1 =  127;
    if (iq1 < -128) iq1 = -128;
    *out1 = (int8_t)iq1;
}

// ─── Phase 2: X1 = x @ W.T  (Q4_K) — PING-PONG ──────────────────────────────
// DATAFLOW inside the pair loop overlaps load_pair_wv (producer) with
// mac_quantize_wv_pair (consumer). rb0/rb1 declared inside the DATAFLOW scope
// are automatically double-buffered by HLS (UG1399 task-level pipelining):
// iteration N+1's load starts while iteration N's MAC is still running.
// Expected: per-pair time = max(load≈204cy, MAC≈270cy) ≈ 270 cy vs 480 cy sequential.
// BRAM cost: 2 ping-pong instances × 8 banks × 1 BRAM18K × 2 arrays = +32 BRAM18K.
static void compute_X1(
    const uint8_t  *W,
    const int8_t   x_local_1[MAX_BATCH][WV_BLOCKS_PER_ROW][256],
    float          x_scale,
    int8_t         X1_cache[MAX_BATCH][FFN_DIM])
{
#pragma HLS INLINE off
#pragma HLS ARRAY_PARTITION variable=x_local_1 dim=2 complete
    const ap_uint<128> *W_wide = (const ap_uint<128>*)W;

    COMPUTE_X1_PP: for (int pair = 0; pair < FFN_DIM / 2; pair++) {
        #pragma HLS DATAFLOW
        // rb0/rb1 declared inside the DATAFLOW loop body → HLS infers ping-pong.
        ap_uint<128> rb0[WV_BLOCKS_PER_ROW][Q4_K_WORDS];
        ap_uint<128> rb1[WV_BLOCKS_PER_ROW][Q4_K_WORDS];
        #pragma HLS ARRAY_PARTITION variable=rb0 dim=1 complete
        #pragma HLS BIND_STORAGE    variable=rb0 type=ram_1p impl=bram
        #pragma HLS ARRAY_PARTITION variable=rb1 dim=1 complete
        #pragma HLS BIND_STORAGE    variable=rb1 type=ram_1p impl=bram

        load_pair_wv(W_wide, pair, rb0, rb1);
        mac_quantize_wv_pair(rb0, rb1, x_local_1[0], x_scale,
                             &X1_cache[0][pair * 2], &X1_cache[0][pair * 2 + 1]);
    }
}

// ─── Phase 3: X2 = x @ V.T  (Q4_K) — PING-PONG ──────────────────────────────
// Identical structure to compute_X1; uses gmem_V port.
static void compute_X2(
    const uint8_t  *V,
    const int8_t   x_local_2[MAX_BATCH][WV_BLOCKS_PER_ROW][256],
    float          x_scale,
    int8_t         X2_cache[MAX_BATCH][FFN_DIM])
{
#pragma HLS INLINE off
#pragma HLS ARRAY_PARTITION variable=x_local_2 dim=2 complete
    const ap_uint<128> *V_wide = (const ap_uint<128>*)V;

    COMPUTE_X2_PP: for (int pair = 0; pair < FFN_DIM / 2; pair++) {
        #pragma HLS DATAFLOW
        ap_uint<128> rb0[WV_BLOCKS_PER_ROW][Q4_K_WORDS];
        ap_uint<128> rb1[WV_BLOCKS_PER_ROW][Q4_K_WORDS];
        #pragma HLS ARRAY_PARTITION variable=rb0 dim=1 complete
        #pragma HLS BIND_STORAGE    variable=rb0 type=ram_1p impl=bram
        #pragma HLS ARRAY_PARTITION variable=rb1 dim=1 complete
        #pragma HLS BIND_STORAGE    variable=rb1 type=ram_1p impl=bram

        load_pair_wv(V_wide, pair, rb0, rb1);
        mac_quantize_wv_pair(rb0, rb1, x_local_2[0], x_scale,
                             &X2_cache[0][pair * 2], &X2_cache[0][pair * 2 + 1]);
    }
}

// ─── Phase 4: compute_gate — unchanged from swiglu.cpp ───────────────────────
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

// ─── Phase 5 sub-functions: Q4K output path ──────────────────────────────────

// load_row_down_q4k: unchanged from swiglu.cpp.
static void load_row_down_q4k(const ap_uint<128> *W_down_wide, int out_i,
                                ap_uint<128> rb[DOWN_BLOCKS_PER_ROW][Q4_K_WORDS]) {
#pragma HLS INLINE off
#pragma HLS ARRAY_PARTITION variable=rb dim=1 complete
#pragma HLS BIND_STORAGE    variable=rb type=ram_1p impl=lutram

    int b = 0, w = 0;
    LOAD_DOWN_Q4K: for (int i = 0; i < DOWN_Q4K_WORDS; i++) {
        #pragma HLS PIPELINE II=1
        rb[b][w] = W_down_wide[(ap_uint<64>)out_i * DOWN_Q4K_WORDS + i];
        if (w == Q4_K_WORDS - 1) { w = 0; b++; }
        else w++;
    }
}

// ─── NEW: load_pair_down_q4k ─────────────────────────────────────────────────
// Loads even and odd output rows of one K=2 pair as two sequential 288-word bursts.
// INLINE off: distinct DATAFLOW producer task in the compute_output ping-pong loop.
static void load_pair_down_q4k(const ap_uint<128> *W_down_wide, int pair,
                                 ap_uint<128> rb0[DOWN_BLOCKS_PER_ROW][Q4_K_WORDS],
                                 ap_uint<128> rb1[DOWN_BLOCKS_PER_ROW][Q4_K_WORDS]) {
#pragma HLS INLINE off
#pragma HLS ARRAY_PARTITION variable=rb0 dim=1 complete
#pragma HLS ARRAY_PARTITION variable=rb1 dim=1 complete
    load_row_down_q4k(W_down_wide, pair * 2,     rb0);
    load_row_down_q4k(W_down_wide, pair * 2 + 1, rb1);
}

// mac_blocks_down_q4k_k2: unchanged from swiglu.cpp.
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

// ─── Phase 5: compute_output (Q4_K) — PING-PONG ──────────────────────────────
// DATAFLOW inside the pair loop overlaps load_pair_down_q4k (producer) with
// mac_blocks_down_q4k_k2 (consumer). rb0/rb1 declared inside the DATAFLOW scope
// are automatically double-buffered (ping-pong) by HLS.
// Expected: per-pair time = max(load≈636cy, MAC≈1024cy) ≈ 1024 cy vs 1724 cy sequential.
// LUT cost: doubles the LUTRAM for rb0/rb1: +12K LUT (tight — monitor post-synthesis).
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

        DOWN_Q4K_PP: for (int pair = 0; pair < VECTOR_DIM / 2; pair++) {
            #pragma HLS DATAFLOW
            // rb0/rb1 declared inside DATAFLOW loop → HLS ping-pong buffers them.
            ap_uint<128> rb0[DOWN_BLOCKS_PER_ROW][Q4_K_WORDS];
            ap_uint<128> rb1[DOWN_BLOCKS_PER_ROW][Q4_K_WORDS];
            #pragma HLS ARRAY_PARTITION variable=rb0 dim=1 complete
            #pragma HLS BIND_STORAGE    variable=rb0 type=ram_1p impl=lutram
            #pragma HLS ARRAY_PARTITION variable=rb1 dim=1 complete
            #pragma HLS BIND_STORAGE    variable=rb1 type=ram_1p impl=lutram

            load_pair_down_q4k(W_down_wide, pair, rb0, rb1);
            mac_blocks_down_q4k_k2(rb0, rb1, gate_cache[0], gate_scale,
                                    &out_local[pair * 2], &out_local[pair * 2 + 1]);
        }
        memcpy(out_batch, out_local, VECTOR_DIM * sizeof(float));
    }
    // Q6K branch omitted (ENABLE_Q6K disabled; all 16 layers are Q4_K).
}

// ─── Phase 1: load_x_local — unchanged from swiglu.cpp ───────────────────────
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
// swiglu — top-level, unchanged from swiglu.cpp
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
    #pragma HLS INTERFACE mode=m_axi port=W         bundle=gmem_W    offset=slave depth=9437184  max_read_burst_length=128  latency=64 num_read_outstanding=1 max_widen_bitwidth=128
    #pragma HLS INTERFACE mode=m_axi port=V         bundle=gmem_V    offset=slave depth=9437184  max_read_burst_length=128  latency=64 num_read_outstanding=1 max_widen_bitwidth=128
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

// NOTE: No top-level DATAFLOW here. compute_X1/X2/compute_output each contain
// their own DATAFLOW ping-pong loop (task-level pipelining inside a loop).
// Nesting those inside a top-level DATAFLOW region causes channel deadlocks
// in synthesis (Vitis HLS does not support nested DATAFLOW). X1 and X2 run
// sequentially, but each benefits from load/MAC overlap within its own loop.
    load_x_local(x_batch, x_local_1, x_local_2);
    compute_X1(W, x_local_1, x_scale, X1_cache);
    compute_X2(V, x_local_2, x_scale, X2_cache);
    compute_gate(X1_cache, X2_cache, gate_cache, gate_scale);
    compute_output(W_down, gate_cache, gate_scale, out_batch, down_quant_mode);
}
