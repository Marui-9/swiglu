#ifndef SWIGLU_H
#define SWIGLU_H

#include <stdint.h>

#define MAX_BATCH 1   // enable small prefill batches (prefill and decode up to 4 tokens)

void swiglu(
    const uint8_t *W,            // ffn_gate  Q4_K  [8192 rows × 8 blocks × 144 B]
    const uint8_t *V,            // ffn_up    Q4_K  [8192 rows × 8 blocks × 144 B]
    const uint8_t *W_down,       // ffn_down  Q4_K  [2048 rows × 32 blocks × 144 B]
    const int8_t  *x_batch,      // INT8 quantized input [2048]
    float         *out_batch,    // F32 output [2048]
    uint32_t       down_quant_mode,  // 0=Q4_K (Q6_K requires ENABLE_Q6K)
    float          x_scale       // dequantization scale: x_fp32 = x_int8 * x_scale
);

#endif
