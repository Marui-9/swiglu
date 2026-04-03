// Minimal pass-through test block with the same external interface as swiglu.cpp
#pragma once

#include <stdint.h>

// Signature mirrors swiglu.cpp: weights are unused; x_batch INT8; out_batch FP32 (2048 elems)
void testblock(
    const uint8_t *W,
    const uint8_t *V,
    const uint8_t *W_down,
    const int8_t  *x_batch,
    float         *out_batch,
    uint32_t       down_quant_mode,
    float          x_scale);
