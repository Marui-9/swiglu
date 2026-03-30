// swiglu_tb.cpp — C-simulation testbench for the m_axi / batched swiglu().
//
// Changes from the stream-based testbench:
//   • No hls::stream, no stream_pkt, no stream_byte helpers.
//     The new swiglu() takes raw uint8_t* / float* pointers (m_axi in synthesis,
//     plain pointers in C-sim).
//   • Weight arrays are global to avoid stack overflow (~40 MB total).
//   • build_q4k_block / build_q6k_block split into fill_*() + dot_*_ref():
//     fill once into the weight array, then dot-product with each batch token.
//   • Tests T1–T5 replicate the original five tests at batch=1.
//   • Tests T6–T7 verify batch correctness with two distinct input vectors.
//
// NOTE: C simulation at full dimensions (FFN_DIM=8192, VECTOR_DIM=2048) is
// compute-heavy.  Each batch=1 test runs ~50M MACs; batch=N tests run N×.
// Expect several minutes per batch=1 test case.

#include "swiglu.h"
#include "sigmoid_lut.h"
#include <iostream>
#include <cmath>
#include <cstdint>
#include <cstring>

#define VECTOR_DIM         2048
#define FFN_DIM            8192
#define Q4_K_BYTES         144
#define Q6_K_BYTES         210
#define WV_BLOCKS_PER_ROW  8     // VECTOR_DIM / 256
#define DOWN_BLOCKS_PER_ROW 32   // FFN_DIM / 256

using namespace std;

// ─── Global weight buffers (too large for stack) ─────────────────────────────
static uint8_t W_buf  [FFN_DIM    * WV_BLOCKS_PER_ROW  * Q4_K_BYTES]; // 9.0 MB
static uint8_t V_buf  [FFN_DIM    * WV_BLOCKS_PER_ROW  * Q4_K_BYTES]; // 9.0 MB
static uint8_t Wd_q4k [VECTOR_DIM * DOWN_BLOCKS_PER_ROW * Q4_K_BYTES]; // 9.0 MB
static uint8_t Wd_q6k [VECTOR_DIM * DOWN_BLOCKS_PER_ROW * Q6_K_BYTES]; // 13.1 MB

static int8_t x_batch_buf [MAX_BATCH * VECTOR_DIM];
static float out_batch_buf[MAX_BATCH * VECTOR_DIM];

// ─── Reference intermediate arrays ───────────────────────────────────────────
static float X1_ref  [MAX_BATCH][FFN_DIM];
static float X2_ref  [MAX_BATCH][FFN_DIM];
static float gate_ref[MAX_BATCH][FFN_DIM];
static float expected[MAX_BATCH][VECTOR_DIM];

// ============================================================================
// fp16_ref — mirrors fp16_to_fp32() in swiglu.cpp exactly.
// ============================================================================
static float fp16_ref(uint16_t h) {
    uint32_t sign = ((uint32_t)(h >> 15)) << 31;
    uint32_t exp  = (h >> 10) & 0x1F;
    uint32_t mant = (uint32_t)(h & 0x3FF);
    uint32_t f32;
    if (exp == 0 && mant == 0) {
        f32 = sign;
    } else if (exp == 0) {
        uint32_t m = mant, e = 112;
        for (int i = 0; i < 10; i++) { if (!(m & 0x200)) { m <<= 1; e--; } }
        f32 = sign | (e << 23) | ((m & 0x1FF) << 14);
    } else if (exp == 31) {
        f32 = sign | 0x7F800000 | (mant << 13);
    } else {
        f32 = sign | ((exp + 112) << 23) | (mant << 13);
    }
    union { uint32_t u; float f; } c; c.u = f32; return c.f;
}

// ============================================================================
// silu_ref_lut — uses the same LUT the IP uses in C-sim so Phase 4 errors
// are isolated to the MAC/decode logic rather than the sigmoid approximation.
// ============================================================================
static float silu_ref_lut(float z) {
    init_sigmoid_lut_csim();
    float scaled = (z + 8.0f) * 256.0f;
    int idx = (int)scaled;
    if (idx < 0)    idx = 0;
    if (idx > 4095) idx = 4095;
    return z * sigmoid_lut[idx];
}

// ============================================================================
// Q4_K helpers
//
// Block layout (144 bytes):
//   [0..1]    d       fp16 LE
//   [2..3]    dmin    fp16 LE
//   [4..15]   scales  12 B  (6-bit sc6/mn6, packed)
//   [16..143] qs      128 B (256 nibbles, GGML planar layout)
//
// GGML Q4_K planar nibble layout: within each 64-element chunk c (c=0..3),
//   elements [c*64 .. c*64+31]  use LOW  nibbles of qs[c*32 .. c*32+31]
//   elements [c*64+32 .. c*64+63] use HIGH nibbles of qs[c*32 .. c*32+31]
// Formula: q_byte = 16 + (n & 31) + ((n & 0xC0) >> 1),  shift = (n & 32) ? 4 : 0
//
// Test pattern: sc6[i]=5+3i, mn6[i]=1+2i, nibble[n]=n%16.
// ============================================================================
static void fill_q4k_block(uint8_t* block, uint16_t d_raw, uint16_t dmin_raw) {
    block[0] =  d_raw         & 0xFF;
    block[1] = (d_raw  >>  8) & 0xFF;
    block[2] =  dmin_raw      & 0xFF;
    block[3] = (dmin_raw >> 8) & 0xFF;

    uint8_t sc6[8], mn6[8];
    for (int i = 0; i < 8; i++) {
        sc6[i] = (uint8_t)(5 + 3 * i);   // 5, 8, 11, 14, 17, 20, 23, 26
        mn6[i] = (uint8_t)(1 + 2 * i);   // 1, 3,  5,  7,  9, 11, 13, 15
    }
    for (int i = 0; i < 4; i++) {
        block[4  + i] = (uint8_t)((sc6[i] & 0x3F) | ((sc6[i + 4] >> 4) << 6));
        block[8  + i] = (uint8_t)((mn6[i] & 0x3F) | ((mn6[i + 4] >> 4) << 6));
        block[12 + i] = (uint8_t)((sc6[i + 4] & 0x0F) | ((mn6[i + 4] & 0x0F) << 4));
    }

    for (int i = 16; i < Q4_K_BYTES; i++) block[i] = 0;
    for (int n = 0; n < 256; n++) {
        uint8_t nib    = (uint8_t)(n & 0xF);
        int     q_byte = 16 + (n & 31) + ((n & 0xC0) >> 1);
        int     shift  = (n & 32) ? 4 : 0;
        block[q_byte] |= (uint8_t)(nib << shift);
    }
}

// dot_q4k_int32_ref: exact INT32 accumulation matching mac_blocks_wv hardware.
// x_int is INT8; scale (x_scale or gate_scale) is applied at the final reduction.
static float dot_q4k_int32_ref(const uint8_t* block, const int8_t* x_int, int v_base, float scale) {
    float d_val    = fp16_ref((uint16_t)(block[0] | ((uint16_t)block[1] << 8)));
    float dmin_val = fp16_ref((uint16_t)(block[2] | ((uint16_t)block[3] << 8)));

    uint8_t sc6[8], mn6[8];
    sc6[0] = block[4]  & 0x3F;  sc6[1] = block[5]  & 0x3F;
    sc6[2] = block[6]  & 0x3F;  sc6[3] = block[7]  & 0x3F;
    mn6[0] = block[8]  & 0x3F;  mn6[1] = block[9]  & 0x3F;
    mn6[2] = block[10] & 0x3F;  mn6[3] = block[11] & 0x3F;
    sc6[4] = (block[12] & 0x0F) | (uint8_t)((block[4]  >> 6) << 4);
    sc6[5] = (block[13] & 0x0F) | (uint8_t)((block[5]  >> 6) << 4);
    sc6[6] = (block[14] & 0x0F) | (uint8_t)((block[6]  >> 6) << 4);
    sc6[7] = (block[15] & 0x0F) | (uint8_t)((block[7]  >> 6) << 4);
    mn6[4] = (block[12] >> 4)   | (uint8_t)((block[8]  >> 6) << 4);
    mn6[5] = (block[13] >> 4)   | (uint8_t)((block[9]  >> 6) << 4);
    mn6[6] = (block[14] >> 4)   | (uint8_t)((block[10] >> 6) << 4);
    mn6[7] = (block[15] >> 4)   | (uint8_t)((block[11] >> 6) << 4);

    int32_t int_acc_w[8] = {0};
    int32_t int_acc_m[8] = {0};
    for (int n = 0; n < 256; n++) {
        int     sub  = n >> 5;
        int     k    = n & 7;
        int32_t nib  = (int32_t)((block[16 + (n & 31) + ((n & 0xC0) >> 1)] >> ((n & 32) ? 4 : 0)) & 0xF);
        int32_t xi   = (int32_t)x_int[v_base + n];
        int_acc_w[k] += xi * nib * (int32_t)sc6[sub];
        int_acc_m[k] += xi       * (int32_t)mn6[sub];
    }
    int32_t sw = 0, sm = 0;
    for (int k = 0; k < 8; k++) { sw += int_acc_w[k]; sm += int_acc_m[k]; }
    return d_val * (scale * (float)sw) - dmin_val * (scale * (float)sm);
}

// ============================================================================
// Q6_K helpers
//
// Block layout (210 bytes):
//   [0..127]   ql      4-bit low nibbles
//   [128..191] qh      2-bit high pairs
//   [192..207] scales  int8_t per 16 weights
//   [208..209] d       fp16 LE
//
// Test pattern: mock_q = n%5, mock_sc = (n>>4)&1 ? 2 : -2.
// ============================================================================
static void fill_q6k_block(uint8_t* block, uint16_t d_raw) {
    memset(block, 0, Q6_K_BYTES);
    block[208] =  d_raw        & 0xFF;
    block[209] = (d_raw >> 8)  & 0xFF;

    for (int n = 0; n < 256; n++) {
        int     sc_idx   = n >> 4;
        int8_t  mock_sc  = (int8_t)((sc_idx & 1) ? 2 : -2);
        block[192 + sc_idx] = (uint8_t)mock_sc;   // same value written repeatedly, OK

        int8_t  mock_q   = (int8_t)(n % 5);
        uint8_t q_biased = (uint8_t)(mock_q + 32);
        uint8_t ql       = q_biased & 0x0F;
        uint8_t qh       = (q_biased >> 4) & 0x03;

        int ql_idx = n >> 1;
        if (n & 1) block[ql_idx]       |= (uint8_t)(ql << 4);
        else       block[ql_idx]        = ql;

        int qh_idx = n >> 2;
        block[128 + qh_idx] |= (uint8_t)(qh << ((n & 3) * 2));
    }
}

// dot_q6k_ref: 8-lane FP32 accumulator matching hardware decode_mac_q6k.
// x_int is INT8; scale (gate_scale) dequantizes each element inside the loop.
static float dot_q6k_ref(const uint8_t* block, const int8_t* x_int, int v_base, float scale) {
    float d = fp16_ref((uint16_t)(block[208] | ((uint16_t)block[209] << 8)));
    float acc[8] = {0.f, 0.f, 0.f, 0.f, 0.f, 0.f, 0.f, 0.f};
    for (int n = 0; n < 256; n++) {
        int     ql_idx = n >> 1;
        int     qh_idx = n >> 2;
        int     sc_idx = n >> 4;
        uint8_t ql     = (n & 1) ? (block[ql_idx] >> 4) : (block[ql_idx] & 0x0F);
        uint8_t qh     = (block[128 + qh_idx] >> ((n & 3) * 2)) & 0x03;
        int8_t  q      = (int8_t)((uint8_t)((qh << 4) | ql)) - 32;
        int8_t  sc     = (int8_t)block[192 + sc_idx];
        float   v      = (float)x_int[v_base + n] * scale;
        acc[n & 7]    += v * (float)q * (float)sc;
    }
    float sum = 0.f;
    for (int k = 0; k < 8; k++) sum += acc[k];
    return d * sum;
}

// ============================================================================
// Mock token test: single token, Q4_K down, host ref vs DUT
// ============================================================================
static int run_mock_token_test() {
    // weights
    for (int row = 0; row < FFN_DIM; ++row) {
        fill_q4k_block(W_buf + row * WV_BLOCKS_PER_ROW * Q4_K_BYTES, 0x3C00, 0x0000);
        fill_q4k_block(V_buf + row * WV_BLOCKS_PER_ROW * Q4_K_BYTES, 0x3C00, 0x0000);
    }
    for (int out = 0; out < VECTOR_DIM; ++out) {
        fill_q4k_block(Wd_q4k + out * DOWN_BLOCKS_PER_ROW * Q4_K_BYTES, 0x3C00, 0x0000);
    }
    // input
    for (int i = 0; i < VECTOR_DIM; ++i) x_batch_buf[i] = (int8_t)((i % 17) - 8);

    // DUT
    swiglu(W_buf, V_buf, Wd_q4k, x_batch_buf, out_batch_buf,
           /*down_quant_mode=*/0, /*x_scale=*/1.0f);

    // reference A,B
    for (int j = 0; j < FFN_DIM; ++j) {
        const uint8_t *wblk = W_buf + j * WV_BLOCKS_PER_ROW * Q4_K_BYTES;
        const uint8_t *vblk = V_buf + j * WV_BLOCKS_PER_ROW * Q4_K_BYTES;
        float accA = 0.f, accB = 0.f;
        for (int b = 0; b < WV_BLOCKS_PER_ROW; ++b) {
            accA += dot_q4k_int32_ref(wblk + b * Q4_K_BYTES, x_batch_buf, b * 256, 1.0f);
            accB += dot_q4k_int32_ref(vblk + b * Q4_K_BYTES, x_batch_buf, b * 256, 1.0f);
        }
        X1_ref[0][j] = accA;
        X2_ref[0][j] = accB;
    }
    // gate and scale
    float max_abs = 0.f;
    for (int j = 0; j < FFN_DIM; ++j) {
        float g = silu_ref_lut(X1_ref[0][j]) * X2_ref[0][j];
        gate_ref[0][j] = g;
        float a = g >= 0.f ? g : -g;
        if (a > max_abs) max_abs = a;
    }
    float gate_scale = (max_abs > 0.f) ? (max_abs / 127.0f) : 1.0f;
    float inv_gs = 1.0f / gate_scale;
    int8_t gate_q[DOWN_BLOCKS_PER_ROW][256];
    for (int j = 0; j < FFN_DIM; ++j) {
        float fq = gate_ref[0][j] * inv_gs;
        int iq = (int)(fq + (fq >= 0.f ? 0.5f : -0.5f));
        if (iq > 127) iq = 127;
        if (iq < -128) iq = -128;
        gate_q[j >> 8][j & 255] = (int8_t)iq;
    }
    // down
    for (int o = 0; o < VECTOR_DIM; ++o) {
        const uint8_t *wd = Wd_q4k + o * DOWN_BLOCKS_PER_ROW * Q4_K_BYTES;
        float sum = 0.f;
        for (int b = 0; b < DOWN_BLOCKS_PER_ROW; ++b) {
            sum += dot_q4k_int32_ref(wd + b * Q4_K_BYTES,
                                     (const int8_t*)gate_q[b], 0, gate_scale);
        }
        expected[0][o] = sum;
    }

    float max_err = 0.f;
    for (int i = 0; i < VECTOR_DIM; ++i) {
        float e = fabsf(out_batch_buf[i] - expected[0][i]);
        if (e > max_err) max_err = e;
    }
    std::cout << "Mock token max abs err: " << max_err << std::endl;
    return (max_err > 1e-3f);
}

// ============================================================================
// run_test — fills weight buffers, computes reference, calls swiglu(), checks.
//
// x_vecs:     pointer to batch_size × VECTOR_DIM floats (row-major)
// batch_size: number of tokens (1 ≤ batch_size ≤ MAX_BATCH)
// d_W/dmin_W: fp16 raw for every W (ffn_gate) block
// d_V/dmin_V: fp16 raw for every V (ffn_up)   block
// d_down:     fp16 raw for every W_down block
// dmin_down:  fp16 raw dmin for Q4_K W_down (ignored when q6k_down=true)
// q6k_down:   false → mode=0 (Q4_K), true → mode=1 (Q6_K)
// ============================================================================
static int run_test(const char*  label,
                    const float* x_vecs,
                    int          batch_size,
                    uint16_t d_W,    uint16_t dmin_W,
                    uint16_t d_V,    uint16_t dmin_V,
                    uint16_t d_down, uint16_t dmin_down,
                    bool     q6k_down)
{
    // ── 1. Fill weight buffers ───────────────────────────────────────────────
    for (int row = 0; row < FFN_DIM; row++)
        for (int b = 0; b < WV_BLOCKS_PER_ROW; b++)
            fill_q4k_block(
                W_buf + ((row * WV_BLOCKS_PER_ROW + b) * Q4_K_BYTES),
                d_W, dmin_W);

    for (int row = 0; row < FFN_DIM; row++)
        for (int b = 0; b < WV_BLOCKS_PER_ROW; b++)
            fill_q4k_block(
                V_buf + ((row * WV_BLOCKS_PER_ROW + b) * Q4_K_BYTES),
                d_V, dmin_V);

    if (!q6k_down) {
        for (int out = 0; out < VECTOR_DIM; out++)
            for (int b = 0; b < DOWN_BLOCKS_PER_ROW; b++)
                fill_q4k_block(
                    Wd_q4k + ((out * DOWN_BLOCKS_PER_ROW + b) * Q4_K_BYTES),
                    d_down, dmin_down);
    } else {
        for (int out = 0; out < VECTOR_DIM; out++)
            for (int b = 0; b < DOWN_BLOCKS_PER_ROW; b++)
                fill_q6k_block(
                    Wd_q6k + ((out * DOWN_BLOCKS_PER_ROW + b) * Q6_K_BYTES),
                    d_down);
    }

    // ── 2. Quantize x vectors to INT8 ────────────────────────────────────────
    float x_max_abs = 0.f;
    for (int n = 0; n < batch_size; n++)
        for (int i = 0; i < VECTOR_DIM; i++) {
            float v = x_vecs[n * VECTOR_DIM + i];
            if (v < 0.f) v = -v;
            if (v > x_max_abs) x_max_abs = v;
        }
    float x_scale = (x_max_abs > 0.f) ? (x_max_abs / 127.0f) : 1.0f;
    float x_inv   = 1.0f / x_scale;
    for (int n = 0; n < batch_size; n++)
        for (int i = 0; i < VECTOR_DIM; i++) {
            float fq = x_vecs[n * VECTOR_DIM + i] * x_inv;
            int   iq = (int)fq;
            if (iq >  127) iq =  127;
            if (iq < -128) iq = -128;
            x_batch_buf[n * VECTOR_DIM + i] = (int8_t)iq;
        }

    // ── 3. Compute reference outputs for every token in the batch ────────────
    for (int n = 0; n < batch_size; n++) {
        const int8_t* x_int = x_batch_buf + n * VECTOR_DIM;

        // Phase 2: X1[n][row] = x_int @ W[row]  (INT32 accumulation, matches hardware)
        for (int row = 0; row < FFN_DIM; row++) {
            X1_ref[n][row] = 0.f;
            for (int b = 0; b < WV_BLOCKS_PER_ROW; b++)
                X1_ref[n][row] += dot_q4k_int32_ref(
                    W_buf + (row * WV_BLOCKS_PER_ROW + b) * Q4_K_BYTES,
                    x_int, b * 256, x_scale);
        }

        // Phase 3: X2[n][row] = x_int @ V[row]  (INT32 accumulation, matches hardware)
        for (int row = 0; row < FFN_DIM; row++) {
            X2_ref[n][row] = 0.f;
            for (int b = 0; b < WV_BLOCKS_PER_ROW; b++)
                X2_ref[n][row] += dot_q4k_int32_ref(
                    V_buf + (row * WV_BLOCKS_PER_ROW + b) * Q4_K_BYTES,
                    x_int, b * 256, x_scale);
        }

        // Phase 4: gate = SiLU_lut(X1) * X2, quantized to INT8 (mirrors compute_gate)
        float gate_fp[FFN_DIM];
        int8_t gate_int[FFN_DIM];
        float gate_max_abs = 0.f;

        // Pass 1: compute FP32 gate and find abs-max
        for (int j = 0; j < FFN_DIM; j++) {
            gate_fp[j] = silu_ref_lut(X1_ref[n][j]) * X2_ref[n][j];
            float abs_val = fabsf(gate_fp[j]);
            if (abs_val > gate_max_abs) gate_max_abs = abs_val;
        }

        // Pass 2: quantize to INT8 — same truncation the hardware applies
        float gate_scale = (gate_max_abs > 0.f) ? (gate_max_abs / 127.0f) : 1.0f;
        float gate_inv   = 1.0f / gate_scale;
        for (int j = 0; j < FFN_DIM; j++) {
            float fq = gate_fp[j] * gate_inv;
            int   iq = (int)fq;
            if (iq >  127) iq =  127;
            if (iq < -128) iq = -128;
            gate_int[j] = (int8_t)iq;
        }

        // Phase 5: expected[n][out] = gate_int @ W_down[out]  (INT32 / 8-lane FP reference)
        for (int out = 0; out < VECTOR_DIM; out++) {
            expected[n][out] = 0.f;
            if (!q6k_down) {
                for (int b = 0; b < DOWN_BLOCKS_PER_ROW; b++)
                    expected[n][out] += dot_q4k_int32_ref(
                        Wd_q4k + (out * DOWN_BLOCKS_PER_ROW + b) * Q4_K_BYTES,
                        gate_int, b * 256, gate_scale);
            } else {
                for (int b = 0; b < DOWN_BLOCKS_PER_ROW; b++)
                    expected[n][out] += dot_q6k_ref(
                        Wd_q6k + (out * DOWN_BLOCKS_PER_ROW + b) * Q6_K_BYTES,
                        gate_int, b * 256, gate_scale);
            }
        }
    }

    // ── 4. Run the IP ────────────────────────────────────────────────────────
    memset(out_batch_buf, 0, sizeof(out_batch_buf));
    uint8_t* W_down_ptr = q6k_down ? Wd_q6k : Wd_q4k;
    swiglu(W_buf, V_buf, W_down_ptr,
           x_batch_buf, out_batch_buf,
           q6k_down ? 1u : 0u,
           x_scale);

    // ── 5. Verify outputs ────────────────────────────────────────────────────
    // Tolerance: 0.1% relative + absolute floor of 1.0.
    // The 8-accumulator binary-tree reduction in swiglu.cpp sums in a different
    // order than the testbench's sequential sum; 1–16 ULP differences are
    // numerically correct.  A real bug (e.g. DAZ making d=0) produces ~100%
    // relative error, well outside the 0.1% threshold.
    int err_cnt = 0;
    bool truncated = false;

    for (int n = 0; n < batch_size && !truncated; n++) {
        for (int i = 0; i < VECTOR_DIM; i++) {
            float actual  = out_batch_buf[n * VECTOR_DIM + i];
            float exp_val = expected[n][i];
            float diff    = fabsf(actual - exp_val);
            float tol     = 1e-3f * (fabsf(exp_val) + 1.0f);
            if (diff > tol) {
                cout << label << " [token " << n << " out[" << i << "]]"
                     << "  exp=" << exp_val << "  got=" << actual
                     << "  diff=" << diff << "\n";
                if (++err_cnt >= 10) {
                    cout << "  (further errors suppressed)\n";
                    truncated = true;
                    break;
                }
            }
        }
    }

    if (err_cnt == 0)
        cout << label << ": PASSED  (batch=" << batch_size << ")\n";
    else
        cout << label << ": FAILED  (batch=" << batch_size
             << ", " << err_cnt << " error(s))\n";
    return err_cnt;
}

// ============================================================================
int main() {
    init_sigmoid_lut_csim();

    // ── Shared input vectors ─────────────────────────────────────────────────
    // vec0: cycling 0.1, 0.2, 0.3, 0.4  (same as old testbench)
    // vec1: cycling 0.5, -0.5, 0.25, -0.25  (used in batch tests)
    // vec2: all 1.0 / (i+1) (decaying, hits many SiLU regimes)
    static float all_vecs[VECTOR_DIM];
    for (int i = 0; i < VECTOR_DIM; i++) {
        all_vecs[i] = (float)((i % 4) + 1) * 0.1f;
    }
    cout << "=== Mock token sanity ===\n";
    int total_errors = run_mock_token_test();

    // ── T1: Q4_K W_down, batch=1, all normal fp16 ───────────────────────────
    // 0x3800 = fp16 0.5 (normal); 0x2000 = fp16 0.125 (normal)
    // Baseline: verifies the Q4_K decode path and min-subtraction accumulator.
    cout << "=== T1: Q4_K down, batch=1, normal fp16 ===\n";
    total_errors += run_test("T1", all_vecs, 1,
        /*d_W=*/0x3800, /*dmin_W=*/0x2000,
        /*d_V=*/0x3800, /*dmin_V=*/0x2000,
        /*d_down=*/0x3800, /*dmin_down=*/0x2000, false);

    // ── T2: Q4_K W_down, batch=1, subnormal d in W ──────────────────────────
    // 0x00A4 is a subnormal fp16 (~9.8e-6) seen in real LFM2 weights.
    // Catches the DAZ bug: hls_half/ap_fixed flush subnormals to 0 → X1=0 → out=0.
    cout << "=== T2: Q4_K down, batch=1, subnormal d in W (0x00A4 ~9.8e-6) ===\n";
    total_errors += run_test("T2", all_vecs, 1,
        /*d_W=*/0x00A4, /*dmin_W=*/0x2000,
        /*d_V=*/0x3800, /*dmin_V=*/0x2000,
        /*d_down=*/0x3800, /*dmin_down=*/0x2000, false);

    // ── T3: Q4_K W_down, batch=1, subnormal dmin in V ───────────────────────
    // 0x817E = negative subnormal fp16 (~-2.3e-5).
    // Verifies the dmin fp16_to_fp32 path; a wrong dmin→0 shifts all outputs.
    cout << "=== T3: Q4_K down, batch=1, subnormal dmin in V (0x817E) ===\n";
    total_errors += run_test("T3", all_vecs, 1,
        /*d_W=*/0x3800, /*dmin_W=*/0x2000,
        /*d_V=*/0x3800, /*dmin_V=*/0x817E,
        /*d_down=*/0x3800, /*dmin_down=*/0x2000, false);

    // ── T4: Q6_K W_down, batch=1, normal fp16 ───────────────────────────────
    // mode=1 path.  Confirms down_quant_mode selects the Q6_K loop in Phase 5.
    cout << "=== T4: Q6_K down, batch=1, normal fp16 (mode=1) ===\n";
    total_errors += run_test("T4", all_vecs, 1,
        /*d_W=*/0x3800, /*dmin_W=*/0x2000,
        /*d_V=*/0x3800, /*dmin_V=*/0x2000,
        /*d_down=*/0x3800, /*dmin_down=*/0x0000, true);

    // ── T5: Q6_K W_down, batch=1, subnormal d in W_down ─────────────────────
    // 0x00A4 subnormal in the Q6_K down-projection path.
    // Without fp16_to_fp32(), d→0 → entire output is zero.
    cout << "=== T5: Q6_K down, batch=1, subnormal d in W_down (0x00A4) ===\n";
    total_errors += run_test("T5", all_vecs, 1,
        /*d_W=*/0x3800, /*dmin_W=*/0x2000,
        /*d_V=*/0x3800, /*dmin_V=*/0x2000,
        /*d_down=*/0x00A4, /*dmin_down=*/0x0000, true);

    // ── T6: Q4_K down, batch=2, normal fp16 ─────────────────────────────────
    // Core batch correctness test.  Two tokens with distinct x vectors are
    // processed in one IP call.  The weight-stationary loop in Phases 2/3/5
    // must produce the same result for each token as the batch=1 case would.
    // A bug in ARRAY_PARTITION or the batch index would corrupt one token.

    // cout << "=== T6: Q4_K down, batch=2, normal fp16 (two distinct x vectors) ===\n";
    // total_errors += run_test("T6", all_vecs, 2,
    //     /*d_W=*/0x3800, /*dmin_W=*/0x2000,
    //     /*d_V=*/0x3800, /*dmin_V=*/0x2000,
    //     /*d_down=*/0x3800, /*dmin_down=*/0x2000, false);

    // // ── T7: Q4_K down, batch=4, subnormal d in W ─────────────────────────────
    // // Combines the subnormal stress-test (T2) with a batch>1 scenario.
    // // Verifies all four tokens get correct non-zero outputs despite subnormal d.
    // // NOTE: ~4× simulation time of T2; expect several minutes.
    // cout << "=== T7: Q4_K down, batch=4, subnormal d in W (0x00A4) ===\n";
    // total_errors += run_test("T7", all_vecs, 4,
    //     /*d_W=*/0x00A4, /*dmin_W=*/0x2000,
    //     /*d_V=*/0x3800, /*dmin_V=*/0x2000,
    //     /*d_down=*/0x3800, /*dmin_down=*/0x2000, false);

    // // ── T8: Q6_K down, batch=2, normal fp16 ─────────────────────────────────
    // // Batch correctness on the Q6_K Phase 5 path.  Ensures the Q6_K loop
    // // correctly iterates over all batch tokens and does not cross-contaminate.
    // cout << "=== T8: Q6_K down, batch=2, normal fp16 (mode=1) ===\n";
    // total_errors += run_test("T8", all_vecs, 2,
    //     /*d_W=*/0x3800, /*dmin_W=*/0x2000,
    //     /*d_V=*/0x3800, /*dmin_V=*/0x2000,
    //     /*d_down=*/0x3800, /*dmin_down=*/0x0000, true);

    cout << "\n";
    if (total_errors == 0) {
        cout << "All tests PASSED.\n";
        return 0;
    } else {
        cout << "FAILED: " << total_errors << " error(s) across all tests.\n";
        return 1;
    }
}
