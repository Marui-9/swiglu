// swiglu_tb.cpp — C-simulation testbench for the URAM-transposed K=4 Q4_K swiglu().
//
// Interface:
//   swiglu(W_urm, V_urm, Wd_urm, x_batch [INT8], out_batch [F32],
//          down_quant_mode, x_scale)
//   MAX_BATCH=1.  Only Q4_K down path (down_quant_mode=0).
//
// URM DDR layout produced by transpose_q4k_to_urm_csim() and consumed by HLS:
//   Headers: blocks_per_row × 32 B each, block-major.
//     Word 0 (bytes 0-15): d(fp16), dmin(fp16), sc6[0..3], mn6[0..3], pad
//     Word 1 (bytes 16-31): sc6[4..7], mn6[4..7], pad
//   Nibbles (WV):  element-major, 4 consecutive elements per 128-bit DDR word.
//     DDR[e] = { slice3, slice2, slice1, slice0 } where slice_s = nibbles for
//     element 4e+s across all 8 blocks packed 4-bits each.
//   Nibbles (Down): element-major, all 4 groups per 128-bit DDR word.
//     DDR[n] = { g3_nibbles, g2_nibbles, g1_nibbles, g0_nibbles } where
//     g_k_nibbles = 32-bit word with nibbles for element n across 8 blocks of group k.

#include "swiglu.h"
#include "sigmoid_lut.h"
#include <iostream>
#include <cmath>
#include <cstdint>
#include <cstring>

#define VECTOR_DIM          2048
#define FFN_DIM             8192
#define Q4_K_BYTES          144
#define WV_BLOCKS_PER_ROW   8       // VECTOR_DIM / 256
#define DOWN_BLOCKS_PER_ROW 32      // FFN_DIM / 256

#define X12_INV_SCALE   (127.0f / 10.0f)   // 12.7f  — quantize to INT8
#define X12_QUANT_SCALE (10.0f  / 127.0f)  // ~0.0787f — dequantize

using namespace std;

// ─── Global weight buffers ────────────────────────────────────────────────────
static uint8_t W_buf  [FFN_DIM    * WV_BLOCKS_PER_ROW  * Q4_K_BYTES]; // 9.0 MB
static uint8_t V_buf  [FFN_DIM    * WV_BLOCKS_PER_ROW  * Q4_K_BYTES]; // 9.0 MB
static uint8_t Wd_q4k [VECTOR_DIM * DOWN_BLOCKS_PER_ROW * Q4_K_BYTES]; // 9.0 MB

// URM-transposed layout: WV 1280 B/row, Down 5120 B/row
#define URM_WV_ROW_BYTES   1280
#define URM_DOWN_ROW_BYTES 5120
static uint8_t W_urm  [FFN_DIM    * URM_WV_ROW_BYTES];
static uint8_t V_urm  [FFN_DIM    * URM_WV_ROW_BYTES];
static uint8_t Wd_urm [VECTOR_DIM * URM_DOWN_ROW_BYTES];

static int8_t x_batch_buf [MAX_BATCH * VECTOR_DIM];
static float  out_batch_buf[MAX_BATCH * VECTOR_DIM];

// ─── Reference arrays ─────────────────────────────────────────────────────────
static float X1_ref  [MAX_BATCH][FFN_DIM];
static float X2_ref  [MAX_BATCH][FFN_DIM];
static float expected[MAX_BATCH][VECTOR_DIM];

// ============================================================================
// fp16_ref — mirrors fp16_to_fp32() in swiglu.cpp exactly (no DAZ).
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
// silu_ref_lut — uses the same LUT the IP uses so Phase 4 errors are
// isolated to MAC/decode logic rather than sigmoid approximation.
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
// Q4_K block filler.
//
// Block layout (144 bytes):
//   [0..1]    d       fp16 LE
//   [2..3]    dmin    fp16 LE
//   [4..15]   scales  6-bit sc6/mn6 packed per GGML convention
//   [16..143] qs      256 nibbles in GGML planar layout
//
// Test pattern: sc6[i]=5+3i, mn6[i]=1+2i, nibble[n]=n%16.
// ============================================================================
static void fill_q4k_block(uint8_t *block, uint16_t d_raw, uint16_t dmin_raw) {
    block[0] =  d_raw         & 0xFF;
    block[1] = (d_raw  >>  8) & 0xFF;
    block[2] =  dmin_raw      & 0xFF;
    block[3] = (dmin_raw >> 8) & 0xFF;

    uint8_t sc6[8], mn6[8];
    for (int i = 0; i < 8; i++) {
        sc6[i] = (uint8_t)(5 + 3 * i);  // 5,8,11,14,17,20,23,26 — all <64
        mn6[i] = (uint8_t)(1 + 2 * i);  // 1,3,5,7,9,11,13,15 — all <64
    }
    // GGML sc6/mn6 packing into bytes 4-15
    for (int i = 0; i < 4; i++) {
        block[4  + i] = (uint8_t)((sc6[i] & 0x3F) | ((sc6[i + 4] >> 4) << 6));
        block[8  + i] = (uint8_t)((mn6[i] & 0x3F) | ((mn6[i + 4] >> 4) << 6));
        block[12 + i] = (uint8_t)((sc6[i + 4] & 0x0F) | ((mn6[i + 4] & 0x0F) << 4));
    }
    // Nibbles: GGML planar layout
    for (int i = 16; i < Q4_K_BYTES; i++) block[i] = 0;
    for (int n = 0; n < 256; n++) {
        uint8_t nib    = (uint8_t)(n & 0xF);
        int     q_byte = 16 + (n & 31) + ((n & 0xC0) >> 1);
        int     shift  = (n & 32) ? 4 : 0;
        block[q_byte] |= (uint8_t)(nib << shift);
    }
}

// ============================================================================
// transpose_q4k_to_urm_csim — convert Q4_K → URAM-transposed DDR layout.
//
// Header format (32 bytes = 2 × 128-bit DDR words per block):
//   Word 0 (bytes  0-15): d[1:0], dmin[1:0], sc6[0..3], mn6[0..3], pad[3:0]
//   Word 1 (bytes 16-31): sc6[4..7], mn6[4..7], pad[7:0]
// This exactly matches what load_row_wv_urm / load_row_down_urm read.
//
// Nibble format (WV, groups=1, 64 × 128-bit words):
//   DDR word e holds nibbles for elements {4e, 4e+1, 4e+2, 4e+3}:
//     bits[31:0]   = element 4e   — nibbles for all 8 blocks packed 4 bits each
//     bits[63:32]  = element 4e+1
//     bits[95:64]  = element 4e+2
//     bits[127:96] = element 4e+3
//
// Nibble format (Down, groups=4, 256 × 128-bit words):
//   DDR word n holds all 4 groups for element n:
//     bits[31:0]   = group 0 nibbles (blocks 0-7)
//     bits[63:32]  = group 1 nibbles (blocks 8-15)
//     bits[95:64]  = group 2 nibbles (blocks 16-23)
//     bits[127:96] = group 3 nibbles (blocks 24-31)
// ============================================================================
static void transpose_q4k_to_urm_csim(const uint8_t *src, uint8_t *dst,
                                       int n_rows, int blocks_per_row) {
    const int groups       = blocks_per_row / 8;
    const int row_hdr      = blocks_per_row * URM_HDR_BYTES;
    const int row_nib      = (groups == 1) ? (64 * 16) : (256 * 16);
    const int row_stride   = row_hdr + row_nib;

    for (int row = 0; row < n_rows; row++) {
        // ── Headers ──────────────────────────────────────────────────────────
        for (int b = 0; b < blocks_per_row; b++) {
            const uint8_t *blk = src + ((size_t)row * blocks_per_row + b) * Q4_K_BYTES;
            uint8_t *hdr = dst + (size_t)row * row_stride + (size_t)b * URM_HDR_BYTES;

            // Reconstruct 6-bit sc6/mn6 from GGML packed format
            uint8_t sc6[8], mn6[8];
            for (int i = 0; i < 4; i++) {
                sc6[i] = blk[4  + i] & 0x3F;
                mn6[i] = blk[8  + i] & 0x3F;
            }
            for (int i = 4; i < 8; i++) {
                int j  = i - 4;
                sc6[i] = (blk[12 + j] & 0x0F) | (uint8_t)((blk[4 + j] >> 6) << 4);
                mn6[i] = (blk[12 + j] >> 4)   | (uint8_t)((blk[8 + j] >> 6) << 4);
            }

            // Word 0 (bytes 0-15): d, dmin, sc6[0..3], mn6[0..3], pad
            hdr[0] = blk[0]; hdr[1] = blk[1];  // d fp16 LE
            hdr[2] = blk[2]; hdr[3] = blk[3];  // dmin fp16 LE
            for (int i = 0; i < 4; i++) hdr[4 + i] = sc6[i];
            for (int i = 0; i < 4; i++) hdr[8 + i] = mn6[i];
            memset(hdr + 12, 0, 4);

            // Word 1 (bytes 16-31): sc6[4..7], mn6[4..7], pad
            for (int i = 0; i < 4; i++) hdr[16 + i] = sc6[4 + i];
            for (int i = 0; i < 4; i++) hdr[20 + i] = mn6[4 + i];
            memset(hdr + 24, 0, 8);
        }

        // ── Nibbles ──────────────────────────────────────────────────────────
        uint8_t *nib_base = dst + (size_t)row * row_stride + (size_t)row_hdr;

        if (groups == 1) {
            // WV: 4 consecutive elements packed per 128-bit DDR word
            for (int n = 0; n < 256; n++) {
                uint32_t nib32 = 0;
                for (int b = 0; b < 8; b++) {
                    const uint8_t *blk = src + ((size_t)row * blocks_per_row + b) * Q4_K_BYTES;
                    int q_byte = 16 + (n & 31) + ((n & 0xC0) >> 1);
                    int shift  = (n & 32) ? 4 : 0;
                    uint32_t nib = (blk[q_byte] >> shift) & 0xF;
                    nib32 |= (nib << (b * 4));
                }
                // e = n>>2, s = n&3: store into slot s of 128-bit word e
                int      e     = n >> 2;
                int      s     = n & 3;
                uint32_t *w128 = (uint32_t *)(nib_base + (size_t)e * 16);
                w128[s] = nib32;
            }
        } else {
            // Down: all 4 groups for one element packed per 128-bit DDR word
            for (int n = 0; n < 256; n++) {
                uint32_t *w128 = (uint32_t *)(nib_base + (size_t)n * 16);
                for (int g = 0; g < groups; g++) {
                    uint32_t nib32 = 0;
                    for (int b = 0; b < 8; b++) {
                        const uint8_t *blk = src + ((size_t)row * blocks_per_row
                                             + (size_t)g * 8 + b) * Q4_K_BYTES;
                        int q_byte = 16 + (n & 31) + ((n & 0xC0) >> 1);
                        int shift  = (n & 32) ? 4 : 0;
                        uint32_t nib = (blk[q_byte] >> shift) & 0xF;
                        nib32 |= (nib << (b * 4));
                    }
                    w128[g] = nib32;  // group g → slot g
                }
            }
        }
    }
}

// ============================================================================
// dot_q4k_int32_ref — exact INT32 accumulation matching mac_blocks_wv hardware.
// x_int is INT8; scale (x_scale or gate_scale) is applied at the final reduce.
// ============================================================================
static float dot_q4k_int32_ref(const uint8_t *block, const int8_t *x_int,
                                int v_base, float scale) {
    float d_val    = fp16_ref((uint16_t)(block[0] | ((uint16_t)block[1] << 8)));
    float dmin_val = fp16_ref((uint16_t)(block[2] | ((uint16_t)block[3] << 8)));

    uint8_t sc6[8], mn6[8];
    sc6[0] = block[4]  & 0x3F; sc6[1] = block[5]  & 0x3F;
    sc6[2] = block[6]  & 0x3F; sc6[3] = block[7]  & 0x3F;
    mn6[0] = block[8]  & 0x3F; mn6[1] = block[9]  & 0x3F;
    mn6[2] = block[10] & 0x3F; mn6[3] = block[11] & 0x3F;
    sc6[4] = (block[12] & 0x0F) | (uint8_t)((block[4]  >> 6) << 4);
    sc6[5] = (block[13] & 0x0F) | (uint8_t)((block[5]  >> 6) << 4);
    sc6[6] = (block[14] & 0x0F) | (uint8_t)((block[6]  >> 6) << 4);
    sc6[7] = (block[15] & 0x0F) | (uint8_t)((block[7]  >> 6) << 4);
    mn6[4] = (block[12] >> 4)   | (uint8_t)((block[8]  >> 6) << 4);
    mn6[5] = (block[13] >> 4)   | (uint8_t)((block[9]  >> 6) << 4);
    mn6[6] = (block[14] >> 4)   | (uint8_t)((block[10] >> 6) << 4);
    mn6[7] = (block[15] >> 4)   | (uint8_t)((block[11] >> 6) << 4);

    // 8-lane accumulators (lane = n & 7) — same total as hardware's 4-lane
    int32_t acc_w[8] = {0}, acc_m[8] = {0};
    for (int n = 0; n < 256; n++) {
        int sub = n >> 5;
        int k   = n & 7;
        int q_byte = 16 + (n & 31) + ((n & 0xC0) >> 1);
        int shift  = (n & 32) ? 4 : 0;
        int32_t nib = (int32_t)((block[q_byte] >> shift) & 0xF);
        int32_t xi  = (int32_t)x_int[v_base + n];
        acc_w[k] += xi * nib * (int32_t)sc6[sub];
        acc_m[k] += xi       * (int32_t)mn6[sub];
    }
    int32_t sw = 0, sm = 0;
    for (int k = 0; k < 8; k++) { sw += acc_w[k]; sm += acc_m[k]; }
    return d_val * (scale * (float)sw) - dmin_val * (scale * (float)sm);
}

// ============================================================================
// run_mock_token_test — sanity check with a trivial input, no float x_scale
// conversion (x already INT8 with x_scale=1.0f).  Lets you verify the
// URM header layout independently before the full run_test path.
// ============================================================================
static int run_mock_token_test() {
    for (int row = 0; row < FFN_DIM; ++row) {
        fill_q4k_block(W_buf + row * WV_BLOCKS_PER_ROW * Q4_K_BYTES, 0x0800, 0x0000);
        fill_q4k_block(V_buf + row * WV_BLOCKS_PER_ROW * Q4_K_BYTES, 0x0800, 0x0000);
    }
    for (int out = 0; out < VECTOR_DIM; ++out)
        fill_q4k_block(Wd_q4k + out * DOWN_BLOCKS_PER_ROW * Q4_K_BYTES, 0x0800, 0x0000);

    for (int i = 0; i < VECTOR_DIM; ++i)
        x_batch_buf[i] = (int8_t)((i % 17) - 8);

    transpose_q4k_to_urm_csim(W_buf,  W_urm,  FFN_DIM,    WV_BLOCKS_PER_ROW);
    transpose_q4k_to_urm_csim(V_buf,  V_urm,  FFN_DIM,    WV_BLOCKS_PER_ROW);
    transpose_q4k_to_urm_csim(Wd_q4k, Wd_urm, VECTOR_DIM, DOWN_BLOCKS_PER_ROW);

    cout << "[DEBUG] Header bytes 0-23: ";
    for (int i = 0; i < 24; i++) cout << hex << (int)W_urm[i] << " ";
    cout << dec << endl;
    cout << "[DEBUG] sc6[0..3]=" << (int)W_urm[4] << "," << (int)W_urm[5]
         << "," << (int)W_urm[6] << "," << (int)W_urm[7]
         << "  mn6[0..3]=" << (int)W_urm[8] << "," << (int)W_urm[9]
         << "," << (int)W_urm[10] << "," << (int)W_urm[11] << endl;
    cout << "[DEBUG] sc6[4..7]=" << (int)W_urm[16] << "," << (int)W_urm[17]
         << "," << (int)W_urm[18] << "," << (int)W_urm[19]
         << "  mn6[4..7]=" << (int)W_urm[20] << "," << (int)W_urm[21]
         << "," << (int)W_urm[22] << "," << (int)W_urm[23] << endl;

    swiglu(W_urm, V_urm, Wd_urm, x_batch_buf, out_batch_buf, 0u, 1.0f);

    // Reference: compute X1/X2 with x_scale=1.0f, apply X12 quantization,
    // then gate, then down projection.
    for (int j = 0; j < FFN_DIM; ++j) {
        float accA = 0.f, accB = 0.f;
        for (int b = 0; b < WV_BLOCKS_PER_ROW; ++b) {
            accA += dot_q4k_int32_ref(W_buf + (j * WV_BLOCKS_PER_ROW + b) * Q4_K_BYTES,
                                      x_batch_buf, b * 256, 1.0f);
            accB += dot_q4k_int32_ref(V_buf + (j * WV_BLOCKS_PER_ROW + b) * Q4_K_BYTES,
                                      x_batch_buf, b * 256, 1.0f);
        }
        float fq1 = accA * X12_INV_SCALE;
        int   iq1 = (int)(fq1 + (fq1 >= 0.f ? 0.5f : -0.5f));
        if (iq1 >  127) iq1 =  127; if (iq1 < -128) iq1 = -128;
        X1_ref[0][j] = (float)(int8_t)iq1 * X12_QUANT_SCALE;

        float fq2 = accB * X12_INV_SCALE;
        int   iq2 = (int)(fq2 + (fq2 >= 0.f ? 0.5f : -0.5f));
        if (iq2 >  127) iq2 =  127; if (iq2 < -128) iq2 = -128;
        X2_ref[0][j] = (float)(int8_t)iq2 * X12_QUANT_SCALE;
    }

    float gate_fp[FFN_DIM]; float gate_max = 0.f;
    for (int j = 0; j < FFN_DIM; ++j) {
        gate_fp[j] = silu_ref_lut(X1_ref[0][j]) * X2_ref[0][j];
        float a = gate_fp[j] < 0.f ? -gate_fp[j] : gate_fp[j];
        if (a > gate_max) gate_max = a;
    }
    float gs     = (gate_max > 0.f) ? (gate_max / 127.0f) : 1.0f;
    float inv_gs = 1.0f / gs;

    int8_t gate_q[DOWN_BLOCKS_PER_ROW][256];
    for (int j = 0; j < FFN_DIM; ++j) {
        float fq = gate_fp[j] * inv_gs;
        int   iq = (int)(fq + (fq >= 0.f ? 0.5f : -0.5f));
        if (iq >  127) iq =  127; if (iq < -128) iq = -128;
        gate_q[j >> 8][j & 255] = (int8_t)iq;
    }

    for (int o = 0; o < VECTOR_DIM; ++o) {
        float sum = 0.f;
        for (int b = 0; b < DOWN_BLOCKS_PER_ROW; ++b)
            sum += dot_q4k_int32_ref(
                Wd_q4k + (o * DOWN_BLOCKS_PER_ROW + b) * Q4_K_BYTES,
                (const int8_t *)gate_q[b], 0, gs);
        expected[0][o] = sum;
    }

    float max_err = 0.f;
    for (int i = 0; i < VECTOR_DIM; ++i) {
        float e = fabsf(out_batch_buf[i] - expected[0][i]);
        if (e > max_err) max_err = e;
    }
    cout << "Mock token max abs err: " << max_err << endl;
    return (max_err > 1e-3f) ? 1 : 0;
}

// ============================================================================
// run_test — fills weights, quantizes x to INT8, computes reference, calls IP.
// ============================================================================
static int run_test(const char  *label,
                    const float *x_vec,
                    uint16_t d_W,    uint16_t dmin_W,
                    uint16_t d_V,    uint16_t dmin_V,
                    uint16_t d_down, uint16_t dmin_down)
{
    // ── 1. Fill packed Q4_K weight buffers ───────────────────────────────────
    for (int row = 0; row < FFN_DIM; row++)
        for (int b = 0; b < WV_BLOCKS_PER_ROW; b++)
            fill_q4k_block(W_buf + (row * WV_BLOCKS_PER_ROW + b) * Q4_K_BYTES, d_W, dmin_W);

    for (int row = 0; row < FFN_DIM; row++)
        for (int b = 0; b < WV_BLOCKS_PER_ROW; b++)
            fill_q4k_block(V_buf + (row * WV_BLOCKS_PER_ROW + b) * Q4_K_BYTES, d_V, dmin_V);

    for (int out = 0; out < VECTOR_DIM; out++)
        for (int b = 0; b < DOWN_BLOCKS_PER_ROW; b++)
            fill_q4k_block(Wd_q4k + (out * DOWN_BLOCKS_PER_ROW + b) * Q4_K_BYTES,
                           d_down, dmin_down);

    // ── 2. Convert to URM-transposed format ──────────────────────────────────
    transpose_q4k_to_urm_csim(W_buf,  W_urm,  FFN_DIM,    WV_BLOCKS_PER_ROW);
    transpose_q4k_to_urm_csim(V_buf,  V_urm,  FFN_DIM,    WV_BLOCKS_PER_ROW);
    transpose_q4k_to_urm_csim(Wd_q4k, Wd_urm, VECTOR_DIM, DOWN_BLOCKS_PER_ROW);

    // ── 3. Quantize x to INT8 ─────────────────────────────────────────────────
    float x_max = 0.f;
    for (int i = 0; i < VECTOR_DIM; i++) {
        float a = x_vec[i] < 0.f ? -x_vec[i] : x_vec[i];
        if (a > x_max) x_max = a;
    }
    float x_scale = (x_max > 0.f) ? (x_max / 127.0f) : 1.0f;
    float x_inv   = 1.0f / x_scale;
    for (int i = 0; i < VECTOR_DIM; i++) {
        float fq = x_vec[i] * x_inv;
        int   iq = (int)fq;  // truncate (matches typical quantization)
        if (iq >  127) iq =  127;
        if (iq < -128) iq = -128;
        x_batch_buf[i] = (int8_t)iq;
    }

    // ── 4. Reference computation ─────────────────────────────────────────────
    const int8_t *x_int = x_batch_buf;

    for (int row = 0; row < FFN_DIM; row++) {
        float accA = 0.f, accB = 0.f;
        for (int b = 0; b < WV_BLOCKS_PER_ROW; b++) {
            accA += dot_q4k_int32_ref(W_buf + (row * WV_BLOCKS_PER_ROW + b) * Q4_K_BYTES,
                                      x_int, b * 256, x_scale);
            accB += dot_q4k_int32_ref(V_buf + (row * WV_BLOCKS_PER_ROW + b) * Q4_K_BYTES,
                                      x_int, b * 256, x_scale);
        }
        // Apply hardware X12 quantize → dequantize (mirrors compute_X1/X2)
        float fq1 = accA * X12_INV_SCALE;
        int   iq1 = (int)(fq1 + (fq1 >= 0.f ? 0.5f : -0.5f));
        if (iq1 >  127) iq1 =  127; if (iq1 < -128) iq1 = -128;
        X1_ref[0][row] = (float)(int8_t)iq1 * X12_QUANT_SCALE;

        float fq2 = accB * X12_INV_SCALE;
        int   iq2 = (int)(fq2 + (fq2 >= 0.f ? 0.5f : -0.5f));
        if (iq2 >  127) iq2 =  127; if (iq2 < -128) iq2 = -128;
        X2_ref[0][row] = (float)(int8_t)iq2 * X12_QUANT_SCALE;
    }

    // Gate: two-pass (mirrors compute_gate)
    float gate_fp[FFN_DIM]; float gate_max = 0.f;
    for (int j = 0; j < FFN_DIM; j++) {
        gate_fp[j] = silu_ref_lut(X1_ref[0][j]) * X2_ref[0][j];
        float a = gate_fp[j] < 0.f ? -gate_fp[j] : gate_fp[j];
        if (a > gate_max) gate_max = a;
    }
    float gs     = (gate_max > 0.f) ? (gate_max / 127.0f) : 1.0f;
    float inv_gs = 1.0f / gs;

    int8_t gate_q[DOWN_BLOCKS_PER_ROW][256];
    for (int j = 0; j < FFN_DIM; j++) {
        float fq = gate_fp[j] * inv_gs;
        int   iq = (int)(fq + (fq >= 0.f ? 0.5f : -0.5f));
        if (iq >  127) iq =  127; if (iq < -128) iq = -128;
        gate_q[j >> 8][j & 255] = (int8_t)iq;
    }

    // Output projection
    for (int o = 0; o < VECTOR_DIM; o++) {
        float sum = 0.f;
        for (int b = 0; b < DOWN_BLOCKS_PER_ROW; b++)
            sum += dot_q4k_int32_ref(
                Wd_q4k + (o * DOWN_BLOCKS_PER_ROW + b) * Q4_K_BYTES,
                (const int8_t *)gate_q[b], 0, gs);
        expected[0][o] = sum;
    }

    // ── 5. Run IP ─────────────────────────────────────────────────────────────
    memset(out_batch_buf, 0, sizeof(out_batch_buf));
    swiglu(W_urm, V_urm, Wd_urm, x_batch_buf, out_batch_buf, 0u, x_scale);

    // ── 6. Verify ─────────────────────────────────────────────────────────────
    // Tolerance: 0.1% relative + absolute floor 1.0.  Accounts for 4-vs-8-lane
    // accumulator order differences and fixed-point REDUCE rounding.
    int err_cnt = 0;
    for (int i = 0; i < VECTOR_DIM; i++) {
        float diff = fabsf(out_batch_buf[i] - expected[0][i]);
        float tol  = 1e-3f * (fabsf(expected[0][i]) + 1.0f);
        if (diff > tol) {
            cout << label << " out[" << i << "] exp=" << expected[0][i]
                 << " got=" << out_batch_buf[i] << " diff=" << diff << "\n";
            if (++err_cnt >= 10) { cout << "  (truncated)\n"; break; }
        }
    }

    if (err_cnt == 0)
        cout << label << ": PASSED\n";
    else
        cout << label << ": FAILED (" << err_cnt << " error(s))\n";
    return err_cnt;
}

// ============================================================================
int main() {
    init_sigmoid_lut_csim();
    static float all_vecs[VECTOR_DIM];
    for (int i = 0; i < VECTOR_DIM; i++)
        all_vecs[i] = (float)((i % 4) + 1) * 0.1f;

    cout << "=== Mock token sanity ===\n";
    int total = run_mock_token_test();

    // T1: all-normal fp16, dmin=0 — baseline Q4_K decode path
    cout << "=== T1: Q4_K, normal fp16, dmin=0 ===\n";
    total += run_test("T1", all_vecs,
        0x0800, 0x0000, 0x0800, 0x0000, 0x0800, 0x0000);

    // T2: subnormal d in W — catches DAZ bug (hls_half/ap_fixed would flush to 0)
    cout << "=== T2: Q4_K, subnormal d in W (0x00A4 ~9.8e-6) ===\n";
    total += run_test("T2", all_vecs,
        0x00A4, 0x0000, 0x0800, 0x0000, 0x0800, 0x0000);

    // T3: subnormal dmin in V — verifies dmin fp16_to_fp32 path
    cout << "=== T3: Q4_K, subnormal dmin in V (0x817E) ===\n";
    total += run_test("T3", all_vecs,
        0x0800, 0x0000, 0x0800, 0x817E, 0x0800, 0x0000);

    // T4: non-zero dmin in W and V — exercises both d and dmin subtraction paths
    cout << "=== T4: Q4_K, non-zero dmin in W and V ===\n";
    total += run_test("T4", all_vecs,
        0x3800, 0x2000, 0x3800, 0x2000, 0x3800, 0x2000);

    cout << "\n";
    if (total == 0) { cout << "All tests PASSED.\n"; return 0; }
    else            { cout << "FAILED: " << total << " error(s).\n"; return 1; }
}
