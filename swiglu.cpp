#include "swiglu.h"
#include "sigmoid_lut.h"
#include <stdint.h>
#include <string.h>
#include <ap_int.h>
#include <ap_fixed.h>
// ─── Fixed-point types for DSP-mapped REDUCE loops ───────────────────────────
// fxd_scale_t: holds d/dmin fp16 values converted to fixed-point.
//   <32,8>: 8 integer bits, 24 fractional bits.
//   Min positive: 2^-24 = 5.96e-8 — covers LFM2 subnormal d values (~9.8e-6).
//   Max: 128 — covers all real Q4K/Q6K d values (always << 1 for LFM2).
// fxd_accum_t: accumulates d_fixed * sw across all blocks.
//   <56,38>: 38 integer bits, 18 fractional bits.
//   Max per block: 128 * 30.7M = 3.93G < 2^32 (fits in 32 int bits).
//   Max across 32 blocks: 32 * 3.93G = 125.8G < 2^37 (38 int bits gives margin).
//   Precision: 2^-18 = 3.8e-6 < minimum subnormal d value (~9.8e-6) in LFM2.
//   This ensures d*sw is representable even when sw=1 and d is subnormal.
//   48-bit version had 10 frac bits (2^-10=9.77e-4), too coarse for Q6K near-
//   cancellation patterns where sw≈0 and d*sw << 9.77e-4.
// x_scale / gate_scale multiplied as a single fp32 at the end of each row.
typedef ap_fixed<32,8>  fxd_scale_t;
typedef ap_fixed<56,38> fxd_accum_t;

// ─── Dimensions ──────────────────────────────────────────────────────────────
#define VECTOR_DIM           2048
#define FFN_DIM              8192

// ─── Quantisation block sizes ─────────────────────────────────────────────────
#define Q4_K_BYTES           144
#define Q4_K_WORDS           9       // Q4_K_BYTES / 16
#define Q6_K_BYTES           210

// ─── Derived constants ────────────────────────────────────────────────────────
#define WV_BLOCKS_PER_ROW    8      // VECTOR_DIM / 256
#define DOWN_BLOCKS_PER_ROW  32     // FFN_DIM    / 256
#define WV_ROW_BYTES         (WV_BLOCKS_PER_ROW   * Q4_K_BYTES)   // 1152
#define DOWN_ROW_Q4K_BYTES   (DOWN_BLOCKS_PER_ROW * Q4_K_BYTES)   // 4608
#define DOWN_ROW_Q6K_BYTES   (DOWN_BLOCKS_PER_ROW * Q6_K_BYTES)   // 6720

#define WV_ROW_WORDS         (WV_ROW_BYTES       / 16)   //  72
#define DOWN_Q4K_WORDS       (DOWN_ROW_Q4K_BYTES / 16)   // 288
#define DOWN_Q6K_WORDS       (DOWN_ROW_Q6K_BYTES / 16)   // 420

// ─── INT8 quantisation scale for X1/X2 intermediate caches ───────────────────
// Fixed scale chosen to cover |X1|, |X2| <= 10 for LFM2 activations.
// Single-pass: no need to buffer floats or re-read weights a second time.
#define X12_SCALE_RANGE  10.0f
#define X12_INV_SCALE    (127.0f / X12_SCALE_RANGE)   // 12.7f  -- multiply to quantize
#define X12_QUANT_SCALE  (X12_SCALE_RANGE / 127.0f)   // ~0.0787f -- multiply to dequant

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

// ─── Byte extractor for 128-bit packed row_buf ────────────────────────────────
// byte_idx is local to the passed pointer (not a global row offset).
static inline uint8_t get_byte(const ap_uint<128>* data, int byte_idx) {
#pragma HLS INLINE
    return (uint8_t)data[byte_idx >> 4].range((byte_idx & 0xF) * 8 + 7,
                                               (byte_idx & 0xF) * 8);
}


// ─── DATAFLOW sub-functions ───────────────────────────────────────────────────

// load_row_wv: read one Q4_K row into 2D rb[8][9].
// dim=1 complete → 8 independent BRAM banks; bank b holds rb[b][0..8].
// Nested loop avoids non-power-of-2 division in synthesis address arithmetic.
static void load_row_wv(const ap_uint<128> *W_wide, int row,
                         ap_uint<128> rb[WV_BLOCKS_PER_ROW][Q4_K_WORDS]) {
#pragma HLS INLINE off
#pragma HLS ARRAY_PARTITION variable=rb dim=1 complete
    // b * Q4_K_WORDS + w is linear with no division; AXI bursts the row sequentially.
    LOAD_WV: for (int b = 0; b < WV_BLOCKS_PER_ROW; b++) {
        for (int w = 0; w < Q4_K_WORDS; w++) {
            #pragma HLS PIPELINE II=1
            rb[b][w] = W_wide[(ap_uint<64>)row * WV_ROW_WORDS + b * Q4_K_WORDS + w];
        }
    }
}

// ─── mac_blocks_wv_k1: K=1 output-row parallelism ────────────────────────────
// Process 1 row at a time. 8 parallel INT32 MAC chains (b-loop only, no kr).
// Reduced from K=2 to relieve routing congestion (was 98% LUT → hold violations).
// Load cost: 72 cycles; MAC cost: 256 cycles.
// Total per row: ~330 cycles.
// Resource: int_acc_w/m[8][8] = 128 INT32 registers (vs 256 at K=2).
static void mac_blocks_wv_k1(const ap_uint<128> rb[WV_BLOCKS_PER_ROW][Q4_K_WORDS],
                              const int8_t x[WV_BLOCKS_PER_ROW][256],
                              float x_scale,
                              float *result) {
#pragma HLS INLINE off
#pragma HLS BIND_OP op=mul impl=dsp
#pragma HLS ARRAY_PARTITION variable=rb  dim=1 complete
#pragma HLS ARRAY_PARTITION variable=x   dim=1 complete

    float   d   [WV_BLOCKS_PER_ROW];
    float   dmin[WV_BLOCKS_PER_ROW];
    uint8_t sc6 [WV_BLOCKS_PER_ROW][8];
    uint8_t mn6 [WV_BLOCKS_PER_ROW][8];
    #pragma HLS ARRAY_PARTITION variable=d    complete
    #pragma HLS ARRAY_PARTITION variable=dmin complete
    #pragma HLS ARRAY_PARTITION variable=sc6  dim=0 complete
    #pragma HLS ARRAY_PARTITION variable=mn6  dim=0 complete

    // PIPELINE II=1 instead of UNROLL: 8 iterations × 1 cycle = 8 cycles UNPACK overhead.
    // Replaces 16 parallel fp16_to_fp32 instances with 2 (one per call per cycle).
    // Saves ~14 fp16_to_fp32 instances × ~100 LUT = ~1,400 LUT per module (×2 = ~2,800 total).
    // Overhead: 8 cycles/row × 8192 rows = 65K cycles ≈ 0.33ms. Acceptable.
    UNPACK_HDR_WV_K1: for (int b = 0; b < WV_BLOCKS_PER_ROW; b++) {
        #pragma HLS PIPELINE II=1
        d[b]    = fp16_to_fp32((uint16_t)get_byte(rb[b], 0) |
                               ((uint16_t)get_byte(rb[b], 1) << 8));
        dmin[b] = fp16_to_fp32((uint16_t)get_byte(rb[b], 2) |
                               ((uint16_t)get_byte(rb[b], 3) << 8));
        sc6[b][0] = get_byte(rb[b],  4) & 0x3F;
        sc6[b][1] = get_byte(rb[b],  5) & 0x3F;
        sc6[b][2] = get_byte(rb[b],  6) & 0x3F;
        sc6[b][3] = get_byte(rb[b],  7) & 0x3F;
        mn6[b][0] = get_byte(rb[b],  8) & 0x3F;
        mn6[b][1] = get_byte(rb[b],  9) & 0x3F;
        mn6[b][2] = get_byte(rb[b], 10) & 0x3F;
        mn6[b][3] = get_byte(rb[b], 11) & 0x3F;
        sc6[b][4] = (get_byte(rb[b], 12) & 0x0F) |
                    (uint8_t)((get_byte(rb[b],  4) >> 6) << 4);
        sc6[b][5] = (get_byte(rb[b], 13) & 0x0F) |
                    (uint8_t)((get_byte(rb[b],  5) >> 6) << 4);
        sc6[b][6] = (get_byte(rb[b], 14) & 0x0F) |
                    (uint8_t)((get_byte(rb[b],  6) >> 6) << 4);
        sc6[b][7] = (get_byte(rb[b], 15) & 0x0F) |
                    (uint8_t)((get_byte(rb[b],  7) >> 6) << 4);
        mn6[b][4] = (get_byte(rb[b], 12) >> 4) |
                    (uint8_t)((get_byte(rb[b],  8) >> 6) << 4);
        mn6[b][5] = (get_byte(rb[b], 13) >> 4) |
                    (uint8_t)((get_byte(rb[b],  9) >> 6) << 4);
        mn6[b][6] = (get_byte(rb[b], 14) >> 4) |
                    (uint8_t)((get_byte(rb[b], 10) >> 6) << 4);
        mn6[b][7] = (get_byte(rb[b], 15) >> 4) |
                    (uint8_t)((get_byte(rb[b], 11) >> 6) << 4);
    }

    int32_t int_acc_w[WV_BLOCKS_PER_ROW][8];
    int32_t int_acc_m[WV_BLOCKS_PER_ROW][8];
    #pragma HLS ARRAY_PARTITION variable=int_acc_w dim=0 complete
    #pragma HLS ARRAY_PARTITION variable=int_acc_m dim=0 complete

    INIT_ACC_WV_K1: for (int b = 0; b < WV_BLOCKS_PER_ROW; b++) {
        #pragma HLS UNROLL
        for (int k = 0; k < 8; k++) {
            #pragma HLS UNROLL
            int_acc_w[b][k] = 0;
            int_acc_m[b][k] = 0;
        }
    }

    // 8 parallel MAC chains: b-loop (8 blocks) UNROLL'd inside 256-cycle pipeline.
    // No LATENCY min=2: INT32 MAC latency ~1-2 cycles; revisit period=8 > latency.
    MAC_ALL_K1: for (int n = 0; n < 256; n++) {
        #pragma HLS PIPELINE II=1
        for (int b = 0; b < WV_BLOCKS_PER_ROW; b++) {
            #pragma HLS UNROLL
            ap_int<8>  xi8  = (ap_int<8>) x[b][n];
            ap_uint<4> nib4 = (ap_uint<4>)((get_byte(rb[b], 16 + (n & 31) + ((n & 0xC0) >> 1))
                                             >> ((n & 32) ? 4 : 0)) & 0xF);
            int        sub  = n >> 5;
            int        k    = n & 7;
            ap_uint<6> sc6u = (ap_uint<6>) sc6[b][sub];
            ap_uint<6> mn6u = (ap_uint<6>) mn6[b][sub];
            int_acc_w[b][k] += (int32_t)(xi8 * (ap_int<5>)nib4 * (ap_int<7>)sc6u);
            int_acc_m[b][k] += (int32_t)(xi8 * (ap_int<7>)mn6u);
        }
    }

    // Sequential reduction: fxd<56,38> is 56 bits wide — 8 parallel muls cost ~13K LUT
    // in adder trees (confirmed: X1 jumped from 17K to 30K LUT when UNROLL'd).
    // Sequential reuse of one fxd mul instance: 8 cycles/row × 8192 rows = negligible.
    fxd_accum_t total = 0;
    REDUCE_WV_K1: for (int b = 0; b < WV_BLOCKS_PER_ROW; b++) {
        int32_t sw = 0, sm = 0;
        for (int k = 0; k < 8; k++) {
            #pragma HLS UNROLL
            sw += int_acc_w[b][k];
            sm += int_acc_m[b][k];
        }
        total += (fxd_scale_t)d[b] * (fxd_accum_t)sw
               - (fxd_scale_t)dmin[b] * (fxd_accum_t)sm;
    }
    *result = (float)total * x_scale;
}

// ─── Phase 2: X1 = x @ W.T  (Q4_K) ──────────────────────────────────────────
// K=1: one row per call, 8 parallel MAC chains. Reduced from K=2 to relieve
// routing congestion (K=2 at 98% LUT caused congestion level 6, 83K hold fails).
// Load cost: 72 cycles; MAC cost: 256 cycles. Total: 8192 rows × ~330 = 2.7M cycles.
static void compute_X1(
    const uint8_t  *W,
    const int8_t   x_local_1[MAX_BATCH][WV_BLOCKS_PER_ROW][256],
    float          x_scale,
    int8_t         X1_cache[MAX_BATCH][FFN_DIM])
{
#pragma HLS INLINE off
#pragma HLS ARRAY_PARTITION variable=x_local_1 dim=2 complete
    const ap_uint<128> *W_wide = (const ap_uint<128>*)W;
    COMPUTE_X1: for (int row = 0; row < FFN_DIM; row++) {
        ap_uint<128> row_buf[WV_BLOCKS_PER_ROW][Q4_K_WORDS];
        #pragma HLS ARRAY_PARTITION variable=row_buf dim=1 complete
        // BRAM: 8 banks × 9-word 128-bit. BRAM_18K holds 144 entries at 128-bit.
        // 9 words << 144 capacity → 1 BRAM tile per bank = 8 tiles. Saves ~1K LUTs.
        #pragma HLS BIND_STORAGE variable=row_buf type=ram_1p impl=bram
        load_row_wv(W_wide, row, row_buf);
        float row_result;
        mac_blocks_wv_k1(row_buf, x_local_1[0], x_scale, &row_result);
        float fq = row_result * X12_INV_SCALE;
        int   iq = (int)(fq + (fq >= 0.f ? 0.5f : -0.5f));
        if (iq >  127) iq =  127;
        if (iq < -128) iq = -128;
        X1_cache[0][row] = (int8_t)iq;
    }
}

// ─── Phase 3: X2 = x @ V.T  (Q4_K) ──────────────────────────────────────────
// K=1: identical structure to compute_X1, operating on V weights.
static void compute_X2(
    const uint8_t  *V,
    const int8_t   x_local_2[MAX_BATCH][WV_BLOCKS_PER_ROW][256],
    float          x_scale,
    int8_t         X2_cache[MAX_BATCH][FFN_DIM])
{
#pragma HLS INLINE off
#pragma HLS ARRAY_PARTITION variable=x_local_2 dim=2 complete
    const ap_uint<128> *V_wide = (const ap_uint<128>*)V;
    COMPUTE_X2: for (int row = 0; row < FFN_DIM; row++) {
        ap_uint<128> row_buf[WV_BLOCKS_PER_ROW][Q4_K_WORDS];
        #pragma HLS ARRAY_PARTITION variable=row_buf dim=1 complete
        #pragma HLS BIND_STORAGE variable=row_buf type=ram_1p impl=bram
        load_row_wv(V_wide, row, row_buf);
        float row_result;
        mac_blocks_wv_k1(row_buf, x_local_2[0], x_scale, &row_result);
        float fq = row_result * X12_INV_SCALE;
        int   iq = (int)(fq + (fq >= 0.f ? 0.5f : -0.5f));
        if (iq >  127) iq =  127;
        if (iq < -128) iq = -128;
        X2_cache[0][row] = (int8_t)iq;
    }
}

// ─── Phase 4: gate[n][b][elem] = SiLU(X1[n][j]) × X2[n][j], quantized to INT8 ──
// Two-pass without a full FP32 gate buffer: pass 1 tracks abs-max with
// 8 partial accumulators (same revisit-period trick as MAC loops) for II=1;
// pass 2 recomputes and quantizes to INT8.
// gate_scale_out[n] = max_abs / 127.0f, passed to Phase 5 for dequantization.
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

        // Pass 1: compute max(|SiLU(X1)*X2|) with 8-lane partial maxima.
        // This avoids buffering the full gate vector (saves BRAM tiles).
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

        // Pass 2: recompute SiLU(X1)*X2 and quantize directly to INT8.
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

// load_row_down_q4k: read one Q4_K row (32 blocks) into 2D rb[32][9].
// dim=1 cyclic factor=8 → 8 banks, matching 8-lane MAC fold (4-group × 8-block).
static void load_row_down_q4k(const ap_uint<128> *W_down_wide, int out_i,
                                ap_uint<128> rb[DOWN_BLOCKS_PER_ROW][Q4_K_WORDS]) {
#pragma HLS INLINE off
#pragma HLS ARRAY_PARTITION variable=rb dim=1 cyclic factor=8
    LOAD_DOWN_Q4K: for (int b = 0; b < DOWN_BLOCKS_PER_ROW; b++) {
        for (int w = 0; w < Q4_K_WORDS; w++) {
            #pragma HLS PIPELINE II=1
            rb[b][w] = W_down_wide[(ap_uint<64>)out_i * DOWN_Q4K_WORDS + b * Q4_K_WORDS + w];
        }
    }
}

// mac_blocks_down_q4k: 32 Q4_K blocks, W4A8 integer datapath, 4-group × 8-block fold.
// gate is INT8 (quantized from FP32 in compute_gate); gate_scale dequantizes at reduction.
// INT32 accumulators: INT8 × INT4 × UINT6 ≤ 22 bits/step, 32 accumulations → safe.
// 4 groups × 8 blocks: 4 × 256 = 1024 cycles/row; 8 parallel INT32 pipelines per group.
// cyclic factor=8 avoids bank conflicts; matches 8-lane unroll in MAC_GROUP.
// Per-group local accumulators: acc_w_g/acc_m_g[8][8] declared inside group loop so 'g'
// is compile-time within each loop body. Old acc[32][8] dim=0 complete made 'g' runtime
// → 32:1 mux on every UNROLL'd access instead of 8:1. Also enables sequential per-group
// REDUCE (8 blocks, no UNROLL), synthesizing one fxd multiply instance per function.
static void mac_blocks_down_q4k(const ap_uint<128> rb[DOWN_BLOCKS_PER_ROW][Q4_K_WORDS],
                                  const int8_t gate[DOWN_BLOCKS_PER_ROW][256],
                                  float gate_scale,
                                  float *result) {
#pragma HLS INLINE off
#pragma HLS BIND_OP op=mul impl=dsp
#pragma HLS ARRAY_PARTITION variable=rb   dim=1 cyclic factor=8
#pragma HLS ARRAY_PARTITION variable=gate dim=1 cyclic factor=8

    float   d   [DOWN_BLOCKS_PER_ROW];
    float   dmin[DOWN_BLOCKS_PER_ROW];
    uint8_t sc6 [DOWN_BLOCKS_PER_ROW][8];
    uint8_t mn6 [DOWN_BLOCKS_PER_ROW][8];
    #pragma HLS ARRAY_PARTITION variable=d    complete
    #pragma HLS ARRAY_PARTITION variable=dmin complete
    #pragma HLS ARRAY_PARTITION variable=sc6  dim=0 complete
    #pragma HLS ARRAY_PARTITION variable=mn6  dim=0 complete

    // PIPELINE II=1: 32 iterations × 1 cycle = 32 cycles UNPACK overhead.
    // Replaces up to 64 parallel fp16_to_fp32 instances (32 blocks × d + dmin) with 2.
    // Saves ~62 fp16_to_fp32 instances × ~100 LUT = ~6,200 LUT.
    // Overhead: 32 cycles/row × 1024 rows = 33K cycles ≈ 0.16ms. Acceptable.
    UNPACK_HDR_DOWN: for (int b = 0; b < DOWN_BLOCKS_PER_ROW; b++) {
        #pragma HLS PIPELINE II=1
        d[b]    = fp16_to_fp32((uint16_t)get_byte(rb[b], 0) | ((uint16_t)get_byte(rb[b], 1) << 8));
        dmin[b] = fp16_to_fp32((uint16_t)get_byte(rb[b], 2) | ((uint16_t)get_byte(rb[b], 3) << 8));
        
        sc6[b][0] = get_byte(rb[b],  4) & 0x3F; sc6[b][1] = get_byte(rb[b],  5) & 0x3F;
        sc6[b][2] = get_byte(rb[b],  6) & 0x3F; sc6[b][3] = get_byte(rb[b],  7) & 0x3F;
        mn6[b][0] = get_byte(rb[b],  8) & 0x3F; mn6[b][1] = get_byte(rb[b],  9) & 0x3F;
        mn6[b][2] = get_byte(rb[b], 10) & 0x3F; mn6[b][3] = get_byte(rb[b], 11) & 0x3F;
        
        sc6[b][4] = (get_byte(rb[b], 12) & 0x0F) | (uint8_t)((get_byte(rb[b],  4) >> 6) << 4);
        sc6[b][5] = (get_byte(rb[b], 13) & 0x0F) | (uint8_t)((get_byte(rb[b],  5) >> 6) << 4);
        sc6[b][6] = (get_byte(rb[b], 14) & 0x0F) | (uint8_t)((get_byte(rb[b],  6) >> 6) << 4);
        sc6[b][7] = (get_byte(rb[b], 15) & 0x0F) | (uint8_t)((get_byte(rb[b],  7) >> 6) << 4);
        
        mn6[b][4] = (get_byte(rb[b], 12) >> 4) | (uint8_t)((get_byte(rb[b],  8) >> 6) << 4);
        mn6[b][5] = (get_byte(rb[b], 13) >> 4) | (uint8_t)((get_byte(rb[b],  9) >> 6) << 4);
        mn6[b][6] = (get_byte(rb[b], 14) >> 4) | (uint8_t)((get_byte(rb[b], 10) >> 6) << 4);
        mn6[b][7] = (get_byte(rb[b], 15) >> 4) | (uint8_t)((get_byte(rb[b], 11) >> 6) << 4);
    }

    // Per-group accumulation: declare acc inside g-loop so 'g' is compile-time within
    // each body. acc_w_g[8][8] = 64 × 32-bit registers vs old int_acc_w[32][8] = 256.
    // Reduces acc mux from 32:1 (runtime g) to 8:1 (runtime k only).
    // REDUCE runs sequentially per group (8 blocks, no UNROLL) → one fxd mul instance.
    // Cycle cost: +8 REDUCE cycles/group × 4 groups × 2 calls/pair × 1024 pairs ≈ 0.22ms.
    fxd_accum_t total = 0;
    for (int g = 0; g < 4; g++) {
        int32_t acc_w_g[8][8];
        int32_t acc_m_g[8][8];
        #pragma HLS ARRAY_PARTITION variable=acc_w_g dim=0 complete
        #pragma HLS ARRAY_PARTITION variable=acc_m_g dim=0 complete

        INIT_ACC_G: for (int bs = 0; bs < 8; bs++) {
            #pragma HLS UNROLL
            for (int k = 0; k < 8; k++) {
                #pragma HLS UNROLL
                acc_w_g[bs][k] = 0;
                acc_m_g[bs][k] = 0;
            }
        }

        // 8 parallel INT32 pipelines: bs is UNROLL'd (compile-time), b = g*8+bs with
        // g compile-time (loop-invariant in this scope) → sc6/mn6/rb/gate accesses
        // are 8:1 mux on k/sub only, not 32:1 with runtime g.
        MAC_GROUP: for (int n = 0; n < 256; n++) {
            #pragma HLS PIPELINE II=1
            for (int bs = 0; bs < 8; bs++) {
                #pragma HLS UNROLL
                int b = g * 8 + bs;
                ap_int<8>  gi8  = (ap_int<8>) gate[b][n];
                ap_uint<4> nib4 = (ap_uint<4>)((get_byte(rb[b], 16 + (n & 31) + ((n & 0xC0) >> 1))
                                                 >> ((n & 32) ? 4 : 0)) & 0xF);
                int sub = n >> 5; int k = n & 7;
                ap_uint<6> sc6u = (ap_uint<6>) sc6[b][sub];
                ap_uint<6> mn6u = (ap_uint<6>) mn6[b][sub];
                acc_w_g[bs][k] += (int32_t)(gi8 * (ap_int<5>)nib4 * (ap_int<7>)sc6u);
                acc_m_g[bs][k] += (int32_t)(gi8 * (ap_int<7>)mn6u);
            }
        }

        // Sequential reduction: fxd<56,38> parallel muls too costly (see REDUCE_WV_K1 note).
        REDUCE_G: for (int bs = 0; bs < 8; bs++) {
            int b = g * 8 + bs;
            int32_t sw = 0, sm = 0;
            for (int k = 0; k < 8; k++) {
                #pragma HLS UNROLL
                sw += acc_w_g[bs][k];
                sm += acc_m_g[bs][k];
            }
            total += (fxd_scale_t)d[b] * (fxd_accum_t)sw
                   - (fxd_scale_t)dmin[b] * (fxd_accum_t)sm;
        }
    }
    *result = (float)total * gate_scale;
}


// ─── Phase 5 sub-functions: Q6K output path ──────────────────────────────────
// Weights stored in field-split layout by ggml-cpu.c reformat_q6k_to_fieldsplit():
//   Row stride: 6720 bytes = 420 × 128-bit words (unchanged from GGUF total)
//   Word offsets within a row:
//     ql:  words   0..255  (32 blocks × 128 bytes = 4096 bytes = 256 words)
//     qh:  words 256..383  (32 blocks ×  64 bytes = 2048 bytes = 128 words)
//     sc:  words 384..415  (32 blocks ×  16 bytes =  512 bytes =  32 words)
//     d:   words 416..419  (32 blocks ×   2 bytes =   64 bytes =   4 words)
// No flat[] staging BRAM needed. No extraction loop.
// Load cost: 420 AXI cycles (was 7076). Q6K call: 420 + 2048 MAC = 2468 cycles.
//
// ql_buf[b][w]: block b (0..31), word w (0..7). Each word is 128 bits = 16 bytes.
// 32 blocks × 8 words = 256 words total = 4096 bytes of ql data. Matches AXI burst.
// qh_buf[b][w]: 32 blocks × 4 words = 128 words = 2048 bytes.
// sc_buf[b][0]: 32 blocks × 1 word  =  32 words =  512 bytes.
// cyclic factor=8: 8 BRAM banks; blocks 0,8,16,24 share bank 0, etc.
// Write: one full 128-bit word/cycle (II=1); no 16-byte UNROLL fanout → no LUTRAM.
// MAC reads: 4 blocks UNROLL'd → banks (g*4)%8 .. (g*4+3)%8 → always 4 distinct.
static void load_row_down_q6k(const ap_uint<128> *W_down_wide, int out_i,
                                ap_uint<128> ql_buf[DOWN_BLOCKS_PER_ROW][8],
                                ap_uint<128> qh_buf[DOWN_BLOCKS_PER_ROW][4],
                                ap_uint<128> sc_buf[DOWN_BLOCKS_PER_ROW],
                                float        d_buf [DOWN_BLOCKS_PER_ROW]) {
#pragma HLS INLINE off
// ql_buf/qh_buf: 128-bit arrays → use URAM (1 tile/bank) not BRAM (4 tiles/bank).
// cyclic factor=8: 8 URAM banks; LOAD writes 8 words/block sequentially (no bank
// conflict); MAC reads 4 blocks/cycle from 4 distinct banks (b%8 all distinct) → II=1.
#pragma HLS ARRAY_PARTITION variable=ql_buf dim=1 cyclic factor=8
#pragma HLS BIND_STORAGE    variable=ql_buf type=ram_1p impl=uram
#pragma HLS ARRAY_PARTITION variable=qh_buf dim=1 cyclic factor=8
#pragma HLS BIND_STORAGE    variable=qh_buf type=ram_1p impl=uram
// sc_buf: 32 blocks × 1 word × 128 bits = 512 bytes → complete partition = registers.
// Avoids 8 URAM tiles for near-empty arrays. 32 × 128-bit registers are feasible.
#pragma HLS ARRAY_PARTITION variable=sc_buf complete
#pragma HLS ARRAY_PARTITION variable=d_buf  complete

    const ap_uint<128> *base = W_down_wide + (ap_uint<64>)out_i * DOWN_Q6K_WORDS;

    // ql: 256 words, 8 words/block. w>>3 = block index, w&7 = word within block.
    LOAD_QL: for (int w = 0; w < 256; w++) {
        #pragma HLS PIPELINE II=1
        ql_buf[w >> 3][w & 7] = base[w];
    }

    // qh: 128 words, 4 words/block.
    LOAD_QH: for (int w = 0; w < 128; w++) {
        #pragma HLS PIPELINE II=1
        qh_buf[w >> 2][w & 3] = base[256 + w];
    }

    // sc: 32 words, 1 word/block (16 bytes each). Direct write to register array.
    LOAD_SC: for (int w = 0; w < 32; w++) {
        #pragma HLS PIPELINE II=1
        sc_buf[w] = base[384 + w];
    }

    // d: 4 words, each holds 8 fp16 values. Must decode fp16 here (8 UNROLL per word).
    LOAD_D: for (int w = 0; w < 4; w++) {
        #pragma HLS PIPELINE II=1
        ap_uint<128> word = base[416 + w];
        for (int j = 0; j < 8; j++) {
            #pragma HLS UNROLL
            int b = w * 8 + j;
            uint16_t d_raw = (uint16_t)word.range(j * 16 + 15, j * 16);
            d_buf[b] = fp16_to_fp32(d_raw);
        }
    }
}

// ─── Phase 5 helper: DATAFLOW parallel load of two Q6K rows ──────────────────
// The two load calls access completely independent AXI ports (gmem_Wd HP2 vs
// gmem_Wd2 HP3) with no shared data — textbook DATAFLOW: zero shared inputs,
// zero shared outputs, no gate argument. HLS will issue both AXI bursts
// simultaneously, halving the effective load time from 2×7076 to 1×7076 cycles.
// With field-split layout: load cost is 420 cycles (pure AXI burst, no flat[] BRAM).
// DATAFLOW halves this to max(420,420)=420 cycles per pair vs sequential 2×420=840.
// No flat[] BRAM needed at all — net BRAM reduction vs previous implementation.
static void load_pair_q6k(
    const ap_uint<128> *W_down_wide,  int out_i0,
    const ap_uint<128> *W_down2_wide, int out_i1,
    ap_uint<128> ql0[DOWN_BLOCKS_PER_ROW][8], ap_uint<128> qh0[DOWN_BLOCKS_PER_ROW][4],
    ap_uint<128> sc0[DOWN_BLOCKS_PER_ROW],    float        d0 [DOWN_BLOCKS_PER_ROW],
    ap_uint<128> ql1[DOWN_BLOCKS_PER_ROW][8], ap_uint<128> qh1[DOWN_BLOCKS_PER_ROW][4],
    ap_uint<128> sc1[DOWN_BLOCKS_PER_ROW],    float        d1 [DOWN_BLOCKS_PER_ROW])
{
#pragma HLS INLINE off
#pragma HLS DATAFLOW
    load_row_down_q6k(W_down_wide,  out_i0, ql0, qh0, sc0, d0);
    load_row_down_q6k(W_down2_wide, out_i1, ql1, qh1, sc1, d1);
}

// mac_blocks_down_q6k: 8×4 structure (8 groups of 4 blocks).
// W4A8 integer datapath: INT8 gate × INT6 q × INT8 scale → INT32 accumulators.
// Per-group local accumulator acc_local[4][8] declared inside group loop: 'g' is
// compile-time within each body. 4 blocks UNROLL'd in MAC loop → 4 parallel INT32
// pipelines per 256-cycle stage. cyclic factor=8 on input arrays keeps banks distinct
// for bsg=0..3 (banks = (g*4+bsg) % 8 → {0,1,2,3} or {4,5,6,7} per group).
// Restores 8×4 = 2048 MAC cycles vs 32×1 = 8192 cycles (4× speedup, ~520ms saved).
// No dmin path (Q6_K uses a single scale per sub-block, not a min-subtraction).
static void mac_blocks_down_q6k(const ap_uint<128> ql_buf[DOWN_BLOCKS_PER_ROW][8],
                                  const ap_uint<128> qh_buf[DOWN_BLOCKS_PER_ROW][4],
                                  const ap_uint<128> sc_buf[DOWN_BLOCKS_PER_ROW],
                                  const float        d_buf [DOWN_BLOCKS_PER_ROW],
                                  const int8_t       gate  [DOWN_BLOCKS_PER_ROW][256],
                                  float gate_scale,
                                  float *result) {
#pragma HLS INLINE off
#pragma HLS BIND_OP op=mul impl=dsp
// ql_buf/qh_buf: URAM, cyclic factor=8. 4-block UNROLL: b=g*4+bsg → 4 distinct banks.
// sc_buf: complete partition (registers) — 32×128-bit registers, all independent.
// gate: cyclic factor=8 (URAM or BRAM); 4-block reads always distinct banks.
#pragma HLS ARRAY_PARTITION variable=ql_buf dim=1 cyclic factor=8
#pragma HLS BIND_STORAGE    variable=ql_buf type=ram_1p impl=uram
#pragma HLS ARRAY_PARTITION variable=qh_buf dim=1 cyclic factor=8
#pragma HLS BIND_STORAGE    variable=qh_buf type=ram_1p impl=uram
#pragma HLS ARRAY_PARTITION variable=sc_buf complete
#pragma HLS ARRAY_PARTITION variable=d_buf  complete
#pragma HLS ARRAY_PARTITION variable=gate   dim=1 cyclic factor=8

    // 8 groups × 4 blocks: 8 sequential stages of 256-cycle pipelined MAC.
    // acc_local[4][8]: 4 block accumulators × 8 sub-accumulators = 32 INT32 registers.
    // dim=0 complete → all 32 registers are independent (bsg and k both compile-time in body).
    fxd_accum_t total = 0;
    for (int g = 0; g < 8; g++) {
        int32_t acc_local[4][8];
        #pragma HLS ARRAY_PARTITION variable=acc_local dim=0 complete

        INIT_Q6K_G: for (int bsg = 0; bsg < 4; bsg++) {
            #pragma HLS UNROLL
            for (int k = 0; k < 8; k++) {
                #pragma HLS UNROLL
                acc_local[bsg][k] = 0;
            }
        }

        Q6K_MAC_GROUP: for (int n = 0; n < 256; n++) {
            #pragma HLS PIPELINE II=1
            for (int bsg = 0; bsg < 4; bsg++) {
                #pragma HLS UNROLL
                int b = g * 4 + bsg;
                // ql: byte (n>>1) within block b. Word = (n>>1)>>4, byte-in-word = (n>>1)&0xF.
                int ql_byte_idx = n >> 1;
                uint8_t ql_byte = (uint8_t)ql_buf[b][ql_byte_idx >> 4].range(
                                      (ql_byte_idx & 0xF) * 8 + 7, (ql_byte_idx & 0xF) * 8);
                uint8_t ql      = (n & 1) ? (ql_byte >> 4) : (ql_byte & 0x0F);
                // qh: byte (n>>2) within block b. Word = (n>>2)>>4, byte-in-word = (n>>2)&0xF.
                int qh_byte_idx = n >> 2;
                uint8_t qh_byte = (uint8_t)qh_buf[b][qh_byte_idx >> 4].range(
                                      (qh_byte_idx & 0xF) * 8 + 7, (qh_byte_idx & 0xF) * 8);
                uint8_t qh      = (qh_byte >> ((n & 3) << 1)) & 0x03;
                int8_t  q       = (int8_t)((uint8_t)((qh << 4) | ql)) - 32;
                // sc: byte (n>>4) within block b. Register sc_buf[b] (complete), byte = n>>4.
                uint8_t sc_b    = (uint8_t)sc_buf[b].range((n >> 4) * 8 + 7, (n >> 4) * 8);
                int8_t  sc      = (int8_t)sc_b;
                int8_t  gv      = gate[b][n];
                acc_local[bsg][n & 7] += (int32_t)(ap_int<8>)gv * (int32_t)(ap_int<7>)q
                                        * (int32_t)(ap_int<8>)sc;
            }
        }

        // Per-group reduce: sum 4 blocks × 8 sub-accumulators, then scale.
        for (int bsg = 0; bsg < 4; bsg++) {
            int b = g * 4 + bsg;
            int32_t sw = 0;
            for (int k = 0; k < 8; k++) {
                #pragma HLS UNROLL
                sw += acc_local[bsg][k];
            }
            total += (fxd_scale_t)d_buf[b] * (fxd_accum_t)sw;
        }
    }
    *result = (float)total * gate_scale;
}

// ─── Phase 5: output = gate @ W_down.T  (Q4_K or Q6_K) ──────────────────────
// K=2: two rows processed per loop iteration using two independent AXI ports.
// W_down  (gmem_Wd,  HP2): supplies even rows (out_i = 0, 2, 4, ...)
// W_down2 (gmem_Wd2, HP3): supplies odd  rows (out_i = 1, 3, 5, ...)
// Q4K: sequential load+MAC (load 288 << MAC 2048 cycles — parallelism not needed).
// Q6K: load_pair_q6k DATAFLOW (no shared data → true parallel AXI bursts on HP2+HP3).
//      Per-pair cost: max(load0,load1) + mac0 + mac1 = 2084 + 4096 = 6180 cycles
//      vs sequential 2×(2084+2048) = 8264 cycles → 25% further speedup.
// VECTOR_DIM=2048 is even so the loop always has a complete pair.
static void compute_output(
    const uint8_t  *W_down,
    const uint8_t  *W_down2,
    const int8_t   gate_cache[MAX_BATCH][DOWN_BLOCKS_PER_ROW][256],
    const float    gate_scale_array[MAX_BATCH],
    float         *out_batch,
    uint32_t       down_quant_mode)
{
#pragma HLS INLINE off
#pragma HLS ARRAY_PARTITION variable=gate_cache dim=2 cyclic factor=8

    const ap_uint<128> *W_down_wide  = (const ap_uint<128>*)W_down;
    const ap_uint<128> *W_down2_wide = (const ap_uint<128>*)W_down2;
    float gate_scale = gate_scale_array[0];

    if (down_quant_mode == 0) {
        float out_local[VECTOR_DIM];
        #pragma HLS BIND_STORAGE variable=out_local type=ram_1p impl=bram
        DOWN_Q4K: for (int out_i = 0; out_i < VECTOR_DIM; out_i += 2) {
            ap_uint<128> rb0[DOWN_BLOCKS_PER_ROW][Q4_K_WORDS];
            ap_uint<128> rb1[DOWN_BLOCKS_PER_ROW][Q4_K_WORDS];
            #pragma HLS ARRAY_PARTITION variable=rb0 dim=1 cyclic factor=8
            #pragma HLS ARRAY_PARTITION variable=rb1 dim=1 cyclic factor=8
            #pragma HLS BIND_STORAGE variable=rb0 type=ram_1p impl=bram
            #pragma HLS BIND_STORAGE variable=rb1 type=ram_1p impl=bram
            load_row_down_q4k(W_down_wide,  out_i,     rb0);
            load_row_down_q4k(W_down2_wide, out_i + 1, rb1);
            mac_blocks_down_q4k(rb0, gate_cache[0], gate_scale, &out_local[out_i]);
            mac_blocks_down_q4k(rb1, gate_cache[0], gate_scale, &out_local[out_i + 1]);
        }
        memcpy(out_batch, out_local, VECTOR_DIM * sizeof(float));
    } else {
        float out_local[VECTOR_DIM];
        #pragma HLS BIND_STORAGE variable=out_local type=ram_1p impl=bram
        DOWN_Q6K: for (int out_i = 0; out_i < VECTOR_DIM; out_i += 2) {
            ap_uint<128> ql_buf0[DOWN_BLOCKS_PER_ROW][8];
            ap_uint<128> qh_buf0[DOWN_BLOCKS_PER_ROW][4];
            ap_uint<128> sc_buf0[DOWN_BLOCKS_PER_ROW];   // flattened: 32 registers
            float        d_buf0 [DOWN_BLOCKS_PER_ROW];
            ap_uint<128> ql_buf1[DOWN_BLOCKS_PER_ROW][8];
            ap_uint<128> qh_buf1[DOWN_BLOCKS_PER_ROW][4];
            ap_uint<128> sc_buf1[DOWN_BLOCKS_PER_ROW];   // flattened: 32 registers
            float        d_buf1 [DOWN_BLOCKS_PER_ROW];
            // ql/qh: URAM (1 tile/bank for 128-bit) — saves 4× BRAM vs BRAM impl.
            // sc: complete → registers (32×128-bit = 512 bytes, no BRAM or URAM needed).
            #pragma HLS ARRAY_PARTITION variable=ql_buf0 dim=1 cyclic factor=8
            #pragma HLS BIND_STORAGE    variable=ql_buf0 type=ram_1p impl=uram
            #pragma HLS ARRAY_PARTITION variable=qh_buf0 dim=1 cyclic factor=8
            #pragma HLS BIND_STORAGE    variable=qh_buf0 type=ram_1p impl=uram
            #pragma HLS ARRAY_PARTITION variable=sc_buf0 complete
            #pragma HLS ARRAY_PARTITION variable=d_buf0  complete
            #pragma HLS ARRAY_PARTITION variable=ql_buf1 dim=1 cyclic factor=8
            #pragma HLS BIND_STORAGE    variable=ql_buf1 type=ram_1p impl=uram
            #pragma HLS ARRAY_PARTITION variable=qh_buf1 dim=1 cyclic factor=8
            #pragma HLS BIND_STORAGE    variable=qh_buf1 type=ram_1p impl=uram
            #pragma HLS ARRAY_PARTITION variable=sc_buf1 complete
            #pragma HLS ARRAY_PARTITION variable=d_buf1  complete
            // Parallel loads on HP2 + HP3: no shared data between the two tasks.
            load_pair_q6k(W_down_wide,  out_i,
                          W_down2_wide, out_i + 1,
                          ql_buf0, qh_buf0, sc_buf0, d_buf0,
                          ql_buf1, qh_buf1, sc_buf1, d_buf1);
            mac_blocks_down_q6k(ql_buf0, qh_buf0, sc_buf0, d_buf0,
                                 gate_cache[0], gate_scale, &out_local[out_i]);
            mac_blocks_down_q6k(ql_buf1, qh_buf1, sc_buf1, d_buf1,
                                 gate_cache[0], gate_scale, &out_local[out_i + 1]);
        }
        memcpy(out_batch, out_local, VECTOR_DIM * sizeof(float));
    }
}

// ─── Phase 1: Load x_batch into dual x_local BRAMs ───────────────────────────
// int8_t* input passed directly from DATAFLOW call site (no cast at call site).
// Cast to ap_uint<128>* here for 128-bit burst reads; byte-slicing distributes
// all 16 bytes per word into the partitioned BRAMs.
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
// All five m_axi ports are declared here. DATAFLOW is applied at this level
// so HLS sees all pointer accesses at the top-level scope and correctly
// generates all AXI master ports. No wrapper sub-function is used.
// ============================================================================
void swiglu(
    const uint8_t *W,
    const uint8_t *V,
    const uint8_t *W_down,
    const uint8_t *W_down2,
    const int8_t  *x_batch,
    float         *out_batch,
    uint32_t       down_quant_mode,
    float          x_scale)
{
    #pragma HLS INTERFACE mode=m_axi port=W         bundle=gmem_W    offset=slave depth=9437184  max_read_burst_length=256  latency=64 num_read_outstanding=2 max_widen_bitwidth=128
    #pragma HLS INTERFACE mode=m_axi port=V         bundle=gmem_V    offset=slave depth=9437184  max_read_burst_length=256  latency=64 num_read_outstanding=2 max_widen_bitwidth=128
    #pragma HLS INTERFACE mode=m_axi port=W_down    bundle=gmem_Wd   offset=slave depth=13762560 max_read_burst_length=256  latency=64 num_read_outstanding=2 max_widen_bitwidth=128
    #pragma HLS INTERFACE mode=m_axi port=W_down2   bundle=gmem_Wd2  offset=slave depth=13762560 max_read_burst_length=256  latency=64 num_read_outstanding=2 max_widen_bitwidth=128
    #pragma HLS INTERFACE mode=m_axi port=x_batch   bundle=gmem_x    offset=slave depth=8192     max_read_burst_length=256  latency=64 num_read_outstanding=2 max_widen_bitwidth=128
    #pragma HLS INTERFACE mode=m_axi port=out_batch bundle=gmem_out  offset=slave depth=8192     max_write_burst_length=256 latency=64 num_write_outstanding=2

    #pragma HLS INTERFACE mode=s_axilite port=W               bundle=CTRL
    #pragma HLS INTERFACE mode=s_axilite port=V               bundle=CTRL
    #pragma HLS INTERFACE mode=s_axilite port=W_down          bundle=CTRL
    #pragma HLS INTERFACE mode=s_axilite port=W_down2         bundle=CTRL
    #pragma HLS INTERFACE mode=s_axilite port=x_batch         bundle=CTRL
    #pragma HLS INTERFACE mode=s_axilite port=out_batch       bundle=CTRL
    #pragma HLS INTERFACE mode=s_axilite port=down_quant_mode bundle=CTRL
    #pragma HLS INTERFACE mode=s_axilite port=x_scale         bundle=CTRL
    #pragma HLS INTERFACE mode=s_axilite port=return          bundle=CTRL

    // x_local: INT8 [1][8][256], 8-bank partition. Written by load_x_local,
    // read by compute_X1 / compute_X2 (separate copies to avoid DATAFLOW serializer).
    int8_t x_local_1[MAX_BATCH][WV_BLOCKS_PER_ROW][256];
    #pragma HLS BIND_STORAGE variable=x_local_1 type=ram_1p impl=lutram
    #pragma HLS ARRAY_PARTITION variable=x_local_1 dim=2 complete

    int8_t x_local_2[MAX_BATCH][WV_BLOCKS_PER_ROW][256];
    #pragma HLS BIND_STORAGE variable=x_local_2 type=ram_1p impl=lutram
    #pragma HLS ARRAY_PARTITION variable=x_local_2 dim=2 complete

    // DATAFLOW channels: declared here so HLS infers them as FIFOs/ping-pong
    // buffers between tasks, not as external memory ports.
    int8_t X1_cache[MAX_BATCH][FFN_DIM];
    int8_t X2_cache[MAX_BATCH][FFN_DIM];
    #pragma HLS BIND_STORAGE variable=X1_cache type=ram_2p impl=bram
    #pragma HLS BIND_STORAGE variable=X2_cache type=ram_2p impl=bram

    // gate_cache: compute_gate writes then compute_output reads — sequential in DATAFLOW,
    // so ram_1p (not ram_2p) is sufficient. 8 banks × 1 URAM tile each = 8 URAM total
    // (vs previous ram_2p which used 16 URAM tiles for 2 ports per bank).
    // cyclic factor=8: 8 URAM banks. Q6K reads 4 blocks/cycle (bsg UNROLL), Q4K reads
    // 8 blocks/cycle (bs UNROLL). Both access {g*4%8..} or {g*8%8..} distinct banks.
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
    compute_output(W_down, W_down2, gate_cache, gate_scale, out_batch, down_quant_mode);
}
