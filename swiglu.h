#ifndef SWIGLU_H
#define SWIGLU_H

#include <stdint.h>

#define MAX_BATCH 1   // enable small prefill batches (prefill and decode up to 4 tokens)

// Hybrid Q4_K block format: nibbles packed 4-bit (128 B, same GGML planar layout),
// sc6/mn6 flat INT8 (16 B), d/dmin fp16 (4 B).  160 bytes = 10 x 128-bit words.
// Fits under HLS BRAM inference threshold (tested: 10 works, 18 fails).
#define UNPACKED_BLOCK_BYTES    160
#define UNPACKED_BLOCK_WORDS     10   // 160/16
#define UNPACKED_WV_ROW_WORDS    80   // 8 blocks x 10 words
#define UNPACKED_DOWN_ROW_WORDS 320   // 32 blocks x 10 words

void swiglu(
    const uint8_t *W,            // ffn_gate  hybrid [8192 rows × 8 blocks × 160 B]
    const uint8_t *V,            // ffn_up    hybrid [8192 rows × 8 blocks × 160 B]
    const uint8_t *W_down,       // ffn_down  hybrid [2048 rows × 32 blocks × 160 B]
    const int8_t  *x_batch,      // INT8 quantized input [2048]
    float         *out_batch,    // F32 output [2048]
    uint32_t       down_quant_mode,  // 0=Q4_K (Q6_K requires ENABLE_Q6K)
    float          x_scale       // dequantization scale: x_fp32 = x_int8 * x_scale
);

#endif
