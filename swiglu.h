#ifndef SWIGLU_H
#define SWIGLU_H

#include <stdint.h>

#define MAX_BATCH 1

// URAM-transposed DDR layout (matches swiglu.cpp)
// Headers: blocks_per_row * 32 B — block-major (d+dmin+sc6[8]+mn6[8]+pad)
// Nibbles: 256 * groups * 4 B — element-major, packed 4 elem-slices per 128-bit DDR word
#define URM_HDR_BYTES 32
#define URM_WV_GROUPS   1
#define URM_DOWN_GROUPS 4

void swiglu(
    const uint8_t *W,            // URM-transposed [8192 rows × 1280 B]
    const uint8_t *V,            // URM-transposed [8192 rows × 1280 B]
    const uint8_t *W_down,       // URM-transposed [2048 rows × 5120 B]
    const int8_t  *x_batch,      // INT8 quantized input [2048]
    float         *out_batch,    // F32 output [2048]
    uint32_t       down_quant_mode,  // 0=Q4_K
    float          x_scale       // dequantization scale: x_fp32 = x_int8 * x_scale
);

#endif
