#ifndef SWIGLU_H
#define SWIGLU_H

#include <stdint.h>

#define MAX_BATCH 1   // enable small prefill batches (prefill and decode up to 4 tokens)

// Full pre-decode block format: nibbles flat INT8 (256 B), sc6/mn6 flat INT8 (16 B),
// d/dmin fp16 (4 B).  288 bytes = 18 x 128-bit words per DDR block.
// On-chip split into two arrays to stay under HLS BRAM inference threshold (≤16 words):
//   rb_hdr[N][2] — header words (d/dmin+sc6+mn6)
//   rb_nib[N][16] — nibble words (256 INT8 values, 16 words)
#define UNPACKED_BLOCK_BYTES    288
#define UNPACKED_BLOCK_WORDS     18   // 288/16
#define UNPACKED_WV_ROW_WORDS   144   // 8 blocks x 18 words
#define UNPACKED_DOWN_ROW_WORDS 576   // 32 blocks x 18 words
#define UNPACKED_NIB_WORDS       16   // nibble array depth
#define UNPACKED_HDR_WORDS        2   // header array depth

void swiglu(
    const uint8_t *W,            // ffn_gate  full-predecode [8192 rows × 8 blocks × 288 B]
    const uint8_t *V,            // ffn_up    full-predecode [8192 rows × 8 blocks × 288 B]
    const uint8_t *W_down,       // ffn_down  full-predecode [2048 rows × 32 blocks × 288 B]
    const int8_t  *x_batch,      // INT8 quantized input [2048]
    float         *out_batch,    // F32 output [2048]
    uint32_t       down_quant_mode,  // 0=Q4_K (Q6_K requires ENABLE_Q6K)
    float          x_scale       // dequantization scale: x_fp32 = x_int8 * x_scale
);

#endif
