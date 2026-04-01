#include "swiglu.h"
#include "sigmoid_lut.h"
#include <stdint.h>
#include <string.h>
#include <ap_int.h>

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

// ─── Q6_K block decode + dot product ──────────────────────────────────────────
// gate is INT8; gate_scale converts back to FP32 in the inner loop.
static float decode_mac_q6k(const ap_uint<128>* row_wide, int byte_offset,
                             const int8_t* vec, float gate_scale, int v_base) {
#pragma HLS INLINE
#pragma HLS BIND_OP op=mul impl=dsp
    float d = fp16_to_fp32((uint16_t)get_byte(row_wide, byte_offset+208) |
                            ((uint16_t)get_byte(row_wide, byte_offset+209) << 8));

    float acc[8] = {0,0,0,0,0,0,0,0};
    #pragma HLS ARRAY_PARTITION variable=acc complete

    MAC_Q6K: for (int n = 0; n < 256; n++) {
        #pragma HLS PIPELINE II=1
        uint8_t ql    = (n & 1) ? (get_byte(row_wide, byte_offset + (n >> 1)) >> 4)
                                 : (get_byte(row_wide, byte_offset + (n >> 1)) & 0x0F);
        uint8_t qh    = (get_byte(row_wide, byte_offset + 128 + (n >> 2))
                         >> ((n & 3) << 1)) & 0x03;
        int8_t  q     = (int8_t)((uint8_t)((qh << 4) | ql)) - 32;
        int8_t  scale = (int8_t)get_byte(row_wide, byte_offset + 192 + (n >> 4));
        float   v     = (float)vec[v_base + n] * gate_scale;  // dequantize INT8 gate
        acc[n & 7]   += v * (float)q * (float)scale;
    }

    float sum = 0.f;
    REDUCE_Q6K: for (int k = 0; k < 8; k++) {
        #pragma HLS UNROLL
        sum += acc[k];
    }
    return d * sum;
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

// mac_blocks_wv: Loop Inversion for 8 Q4_K blocks — W4A8 integer datapath.
// x is INT8 (quantized activation); x_scale converts integer sums to FP32 at reduction.
// Inner loop uses INT32 accumulators: INT8 × INT4 × UINT6 ≤ 22-bit per step.
// 8 partial accumulators per block (k = n & 7) satisfy the revisit period constraint.
static void mac_blocks_wv(const ap_uint<128> rb[WV_BLOCKS_PER_ROW][Q4_K_WORDS],
                            const int8_t x[WV_BLOCKS_PER_ROW][256],
                            float x_scale,
                            float *result) {
#pragma HLS INLINE off
#pragma HLS BIND_OP op=mul impl=dsp
#pragma HLS ARRAY_PARTITION variable=rb dim=1 complete
#pragma HLS ARRAY_PARTITION variable=x  dim=1 complete

    float   d   [WV_BLOCKS_PER_ROW];
    float   dmin[WV_BLOCKS_PER_ROW];
    uint8_t sc6 [WV_BLOCKS_PER_ROW][8];
    uint8_t mn6 [WV_BLOCKS_PER_ROW][8];
    #pragma HLS ARRAY_PARTITION variable=d    complete
    #pragma HLS ARRAY_PARTITION variable=dmin complete
    #pragma HLS ARRAY_PARTITION variable=sc6  dim=0 complete
    #pragma HLS ARRAY_PARTITION variable=mn6  dim=0 complete

    UNPACK_HDR_WV: for (int b = 0; b < WV_BLOCKS_PER_ROW; b++) {
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

    // INT32 partial accumulators — no FP add latency constraint; revisit period ≥ 1.
    int32_t int_acc_w[WV_BLOCKS_PER_ROW][8];
    int32_t int_acc_m[WV_BLOCKS_PER_ROW][8];
    #pragma HLS ARRAY_PARTITION variable=int_acc_w dim=0 complete
    #pragma HLS ARRAY_PARTITION variable=int_acc_m dim=0 complete
    INIT_ACC_WV: for (int b = 0; b < WV_BLOCKS_PER_ROW; b++) {
        #pragma HLS UNROLL
        for (int k = 0; k < 8; k++) {
            #pragma HLS UNROLL
            int_acc_w[b][k] = 0;
            int_acc_m[b][k] = 0;
        }
    }

    // Loop Inversion: single pipeline, 8 blocks fully unrolled inside.
    // All 8 blocks' integer MAC operations fire in the same clock cycle.
    //
    // Nibble extraction — GGML Q4_K planar layout:
    //   qs[0..127] stored at block bytes [16..143].
    //   Within each 64-element chunk (n/64), the first 32 elements use low
    //   nibbles of qs[chunk*32 .. chunk*32+31] and the next 32 use high nibbles
    //   of the same bytes.  Formula (all power-of-2):
    //     q_byte = 16 + (n & 31) + ((n & 0xC0) >> 1)
    //     shift  = (n & 32) ? 4 : 0
    MAC_ALL_BLOCKS: for (int n = 0; n < 256; n++) {
        #pragma HLS PIPELINE II=1
        #pragma HLS LATENCY min=2
        for (int b = 0; b < WV_BLOCKS_PER_ROW; b++) {
            #pragma HLS UNROLL
            // Stage 1: nibble/scalar decode
            ap_int<8>  xi8   = (ap_int<8>) x[b][n];
            ap_uint<4> nib4  = (ap_uint<4>)((get_byte(rb[b], 16 + (n & 31) + ((n & 0xC0) >> 1))
                                              >> ((n & 32) ? 4 : 0)) & 0xF);
            int        sub   = n >> 5;
            int        k     = n & 7;
            ap_uint<6> sc6u  = (ap_uint<6>) sc6[b][sub];
            ap_uint<6> mn6u  = (ap_uint<6>) mn6[b][sub];
            // Stage 2: multiply-accumulate (registered by LATENCY pragma)
            int_acc_w[b][k] += (int32_t)(xi8 * (ap_int<5>)nib4 * (ap_int<7>)sc6u);
            int_acc_m[b][k] += (int32_t)(xi8 * (ap_int<7>)mn6u);
        }
    }

    // FP32 reduction: INT32 sums → float, then scale by x_scale × d/dmin.
    float total = 0.f;
    #pragma HLS BALANCE variable=total
    REDUCE_WV: for (int b = 0; b < WV_BLOCKS_PER_ROW; b++) {
        #pragma HLS UNROLL
        int32_t sw = 0, sm = 0;
        for (int k = 0; k < 8; k++) {
            #pragma HLS UNROLL
            sw += int_acc_w[b][k];
            sm += int_acc_m[b][k];
        }
        total += d[b] * (x_scale * (float)sw) - dmin[b] * (x_scale * (float)sm);
    }
    *result = total;
}

// ─── Phase 2: X1 = x @ W.T  (Q4_K) ──────────────────────────────────────────
static void compute_X1(
    const uint8_t  *W,
    const int8_t   x_local_1[MAX_BATCH][WV_BLOCKS_PER_ROW][256],
    float          x_scale,
    float          X1_cache[MAX_BATCH][FFN_DIM])
{
#pragma HLS INLINE off
#pragma HLS ARRAY_PARTITION variable=x_local_1 dim=2 complete
    const ap_uint<128> *W_wide = (const ap_uint<128>*)W;
    COMPUTE_X1: for (int row = 0; row < FFN_DIM; row++) {
        ap_uint<128> row_buf[WV_BLOCKS_PER_ROW][Q4_K_WORDS];
        #pragma HLS ARRAY_PARTITION variable=row_buf dim=1 complete
        #pragma HLS BIND_STORAGE variable=row_buf type=ram_1p impl=lutram
        load_row_wv(W_wide, row, row_buf);
        float row_result;
        mac_blocks_wv(row_buf, x_local_1[0], x_scale, &row_result);
        X1_cache[0][row] = row_result;
    }
}

// ─── Phase 3: X2 = x @ V.T  (Q4_K) ──────────────────────────────────────────
static void compute_X2(
    const uint8_t  *V,
    const int8_t   x_local_2[MAX_BATCH][WV_BLOCKS_PER_ROW][256],
    float          x_scale,
    float          X2_cache[MAX_BATCH][FFN_DIM])
{
#pragma HLS INLINE off
#pragma HLS ARRAY_PARTITION variable=x_local_2 dim=2 complete
    const ap_uint<128> *V_wide = (const ap_uint<128>*)V;
    COMPUTE_X2: for (int row = 0; row < FFN_DIM; row++) {
        ap_uint<128> row_buf[WV_BLOCKS_PER_ROW][Q4_K_WORDS];
        #pragma HLS ARRAY_PARTITION variable=row_buf dim=1 complete
        #pragma HLS BIND_STORAGE variable=row_buf type=ram_1p impl=lutram
        load_row_wv(V_wide, row, row_buf);
        float row_result;
        mac_blocks_wv(row_buf, x_local_2[0], x_scale, &row_result);
        X2_cache[0][row] = row_result;
    }
}

// ─── Phase 4: gate[n][b][elem] = SiLU(X1[n][j]) × X2[n][j], quantized to INT8 ──
// Two-pass without a full FP32 gate buffer: pass 1 tracks abs-max with
// 8 partial accumulators (same revisit-period trick as MAC loops) for II=1;
// pass 2 recomputes and quantizes to INT8.
// gate_scale_out[n] = max_abs / 127.0f, passed to Phase 5 for dequantization.
static void compute_gate(
    const float X1_cache[MAX_BATCH][FFN_DIM],
    const float X2_cache[MAX_BATCH][FFN_DIM],
    int8_t      gate_cache[MAX_BATCH][DOWN_BLOCKS_PER_ROW][256],
    float       gate_scale_out[MAX_BATCH])
{
#pragma HLS INLINE off
    SWISH_GATE: for (int n = 0; n < MAX_BATCH; n++) {
        #pragma HLS UNROLL
        float pmax[8] = {0.f,0.f,0.f,0.f,0.f,0.f,0.f,0.f};
        #pragma HLS ARRAY_PARTITION variable=pmax complete

        // Pass 1: compute max(|SiLU(X1)*X2|) with 8-lane partial maxima.
        // This avoids buffering the full gate vector (saves BRAM tiles).
        GATE_PASS1: for (int j = 0; j < FFN_DIM; j++) {
            #pragma HLS PIPELINE II=1
            float z      = X1_cache[n][j];
            float x2     = X2_cache[n][j];
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
            float z      = X1_cache[n][j];
            float x2     = X2_cache[n][j];
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
// dim=1 cyclic factor=8 → 8 banks (lower BRAM pressure while matching 8-lane fold).
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

// mac_blocks_down_q4k: 32 Q4_K blocks, W4A8 integer datapath, full 32-block UNROLL.
// gate is INT8 (quantized from FP32 in compute_gate); gate_scale dequantizes at reduction.
// INT32 accumulators: INT8 × INT4 × UINT6 ≤ 22 bits/step, 32 accumulations → safe.
// Full unroll (vs prior 4-group) enabled by integer inner loop — ~16× fewer LUTs/pipeline.
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

    UNPACK_HDR_DOWN: for (int b = 0; b < DOWN_BLOCKS_PER_ROW; b++) {
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

    int32_t int_acc_w[DOWN_BLOCKS_PER_ROW][8];
    int32_t int_acc_m[DOWN_BLOCKS_PER_ROW][8];
    #pragma HLS ARRAY_PARTITION variable=int_acc_w dim=0 complete
    #pragma HLS ARRAY_PARTITION variable=int_acc_m dim=0 complete

    INIT_ACC_DOWN: for (int b = 0; b < DOWN_BLOCKS_PER_ROW; b++) {
        #pragma HLS UNROLL
        for (int k = 0; k < 8; k++) {
            #pragma HLS UNROLL
            int_acc_w[b][k] = 0;
            int_acc_m[b][k] = 0;
        }
    }

    // 4-group × 8-block fold: g-loop is sequential; MAC_GROUP is PIPELINE II=1 with
    // 8 fully-unrolled blocks inside. g is loop-invariant within MAC_GROUP so HLS
    // hoists g*8 and treats each bs-unrolled access as a constant bank offset.
    // rb and gate use cyclic factor=8: bs=0..7 maps to banks 0..7, no port conflicts.
    // Cost: 4 × 256 = 1024 cycles/row with 8 parallel INT32 pipelines per group.
    for (int g = 0; g < 4; g++) {
        MAC_GROUP: for (int n = 0; n < 256; n++) {
            #pragma HLS PIPELINE II=1
            #pragma HLS LATENCY min=2
            for (int bs = 0; bs < 8; bs++) {
                #pragma HLS UNROLL
                int b = g * 8 + bs;
                ap_int<8>  gi8  = (ap_int<8>) gate[b][n];
                ap_uint<4> nib4 = (ap_uint<4>)((get_byte(rb[b], 16 + (n & 31) + ((n & 0xC0) >> 1))
                                                 >> ((n & 32) ? 4 : 0)) & 0xF);
                int sub = n >> 5; int k = n & 7;
                ap_uint<6> sc6u = (ap_uint<6>) sc6[b][sub];
                ap_uint<6> mn6u = (ap_uint<6>) mn6[b][sub];
                int_acc_w[b][k] += (int32_t)(gi8 * (ap_int<5>)nib4 * (ap_int<7>)sc6u);
                int_acc_m[b][k] += (int32_t)(gi8 * (ap_int<7>)mn6u);
            }
        }
    }

    // FP32 reduction: INT32 sums → float, then scale by gate_scale × d/dmin.
    float total = 0.f;
    #pragma HLS BALANCE variable=total
    REDUCE_DOWN_Q4K: for (int b = 0; b < DOWN_BLOCKS_PER_ROW; b++) {
        #pragma HLS UNROLL factor=8
        int32_t sw = 0, sm = 0;
        for (int k = 0; k < 8; k++) {
            #pragma HLS UNROLL
            sw += int_acc_w[b][k];
            sm += int_acc_m[b][k];
        }
        total += d[b] * (gate_scale * (float)sw) - dmin[b] * (gate_scale * (float)sm);
    }
    *result = total;
}
// ─── Phase 5 sub-functions: Q6K output path ──────────────────────────────────
// Q6K blocks are 210 bytes = 13.125 × 128-bit words (non-integer stride).
// Cannot use clean 2D rb layout. Keep 1D rb + sequential block loop.
// gate is 2D [32][256]: pass gate[b] pointer to decode_mac_q6k with v_base=0.
static void load_row_down_q6k(const ap_uint<128> *W_down_wide, int out_i,
                                ap_uint<128> rb[DOWN_Q6K_WORDS]) {
#pragma HLS INLINE off
#pragma HLS ARRAY_PARTITION variable=rb cyclic factor=16
    LOAD_DOWN_Q6K: for (int i = 0; i < DOWN_Q6K_WORDS; i++) {
        #pragma HLS PIPELINE II=1
        rb[i] = W_down_wide[(ap_uint<64>)out_i * DOWN_Q6K_WORDS + i];
    }
}

static void mac_blocks_down_q6k(const ap_uint<128> rb[DOWN_Q6K_WORDS],
                                  const int8_t gate[DOWN_BLOCKS_PER_ROW][256],
                                  float gate_scale,
                                  float *result) {
#pragma HLS INLINE off
#pragma HLS ARRAY_PARTITION variable=rb cyclic factor=16
#pragma HLS ARRAY_PARTITION variable=gate dim=1 complete
    float block_sums[DOWN_BLOCKS_PER_ROW];
    #pragma HLS ARRAY_PARTITION variable=block_sums complete
    for (int b = 0; b < DOWN_BLOCKS_PER_ROW; b++) {
        #pragma HLS UNROLL factor=2
        // gate[b] is INT8; decode_mac_q6k dequantizes each element by gate_scale.
        block_sums[b] = decode_mac_q6k(rb, b * Q6_K_BYTES, gate[b], gate_scale, 0);
    }
    float acc = 0.0f;
    for (int b = 0; b < DOWN_BLOCKS_PER_ROW; b++) {
        #pragma HLS UNROLL
        acc += block_sums[b];
    }
    *result = acc;
}

// ─── Phase 5: output = gate @ W_down.T  (Q4_K or Q6_K) ──────────────────────
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
    float out_local[VECTOR_DIM];
    #pragma HLS BIND_STORAGE variable=out_local type=ram_1p impl=lutram
    float gate_scale = gate_scale_array[0];

    if (down_quant_mode == 0) {
        DOWN_Q4K: for (int out_i = 0; out_i < VECTOR_DIM; out_i++) {
            ap_uint<128> row_buf[DOWN_BLOCKS_PER_ROW][Q4_K_WORDS];
            #pragma HLS ARRAY_PARTITION variable=row_buf dim=1 cyclic factor=8
            #pragma HLS BIND_STORAGE variable=row_buf type=ram_1p impl=lutram
            load_row_down_q4k(W_down_wide, out_i, row_buf);
            mac_blocks_down_q4k(row_buf, gate_cache[0], gate_scale, &out_local[out_i]);
        }
    } else {
        DOWN_Q6K: for (int out_i = 0; out_i < VECTOR_DIM; out_i++) {
            ap_uint<128> row_buf[DOWN_Q6K_WORDS];
            #pragma HLS ARRAY_PARTITION variable=row_buf cyclic factor=16
            #pragma HLS BIND_STORAGE variable=row_buf type=ram_1p impl=lutram
            load_row_down_q6k(W_down_wide, out_i, row_buf);
            mac_blocks_down_q6k(row_buf, gate_cache[0], gate_scale, &out_local[out_i]);
        }
    }

    memcpy(out_batch, out_local, VECTOR_DIM * sizeof(float));
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
    const int8_t  *x_batch,
    float         *out_batch,
    uint32_t       down_quant_mode,
    float          x_scale)
{
    #pragma HLS INTERFACE mode=m_axi port=W         bundle=gmem_W   offset=slave depth=9437184  max_read_burst_length=256  latency=64 num_read_outstanding=2 max_widen_bitwidth=128
    #pragma HLS INTERFACE mode=m_axi port=V         bundle=gmem_V   offset=slave depth=9437184  max_read_burst_length=256  latency=64 num_read_outstanding=2 max_widen_bitwidth=128
    #pragma HLS INTERFACE mode=m_axi port=W_down    bundle=gmem_Wd  offset=slave depth=13762560 max_read_burst_length=256  latency=64 num_read_outstanding=2 max_widen_bitwidth=128
    #pragma HLS INTERFACE mode=m_axi port=x_batch   bundle=gmem_x   offset=slave depth=2048     max_read_burst_length=256  latency=64 num_read_outstanding=2 max_widen_bitwidth=128
    #pragma HLS INTERFACE mode=m_axi port=out_batch bundle=gmem_out offset=slave depth=2048     max_write_burst_length=256 latency=64 num_write_outstanding=2

    #pragma HLS INTERFACE mode=s_axilite port=W               bundle=CTRL
    #pragma HLS INTERFACE mode=s_axilite port=V               bundle=CTRL
    #pragma HLS INTERFACE mode=s_axilite port=W_down          bundle=CTRL
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
    float X1_cache[MAX_BATCH][FFN_DIM];
    float X2_cache[MAX_BATCH][FFN_DIM];
    #pragma HLS BIND_STORAGE variable=X1_cache type=ram_2p impl=uram
    #pragma HLS BIND_STORAGE variable=X2_cache type=ram_2p impl=uram

    int8_t gate_cache[MAX_BATCH][DOWN_BLOCKS_PER_ROW][256];
    #pragma HLS BIND_STORAGE variable=gate_cache type=ram_2p impl=uram
    #pragma HLS ARRAY_PARTITION variable=gate_cache dim=2 cyclic factor=8

    float gate_scale[MAX_BATCH];

    #pragma HLS BIND_STORAGE variable=sigmoid_lut type=rom_1p impl=lutram

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
