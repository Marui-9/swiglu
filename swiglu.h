#ifndef SWIGLU_H
#define SWIGLU_H

#include <stdint.h>

#define MAX_BATCH 1   // single-token decode only; driver batch guard enforces ne[1]==1
                      // (was 8: gate_cache[8][8192]+x_local[8][2048] cost 320 BRAM_18K;
                      //  total 474 vs 288 budget. With MAX_BATCH=1: ~40 BRAM_18K; total ~194)

void swiglu(
    const uint8_t *W,            // ffn_gate  Q4_K  [8192 rows × 8 blocks × 144 B]
    const uint8_t *V,            // ffn_up    Q4_K  [8192 rows × 8 blocks × 144 B]
    const uint8_t *W_down,       // ffn_down  Q4_K or Q6_K [2048 rows]
    const int8_t  *x_batch,      // INT8 quantized input [2048]
    float         *out_batch,    // F32 output [2048]
    uint32_t       down_quant_mode,  // 0=Q4_K, 1=Q6_K
    float          x_scale       // dequantization scale: x_fp32 = x_int8 * x_scale
);

#endif