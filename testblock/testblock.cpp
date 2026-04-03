#include "testblock.h"
#include <string.h>

#define VECTOR_DIM 2048

// Pass-through kernel: ignores weights and simply copies x_batch (int8) to out_batch as floats.
// Interfaces mirror swiglu.cpp so it can be dropped into the same IP shell.
void testblock(
    const uint8_t *W,
    const uint8_t *V,
    const uint8_t *W_down,
    const int8_t  *x_batch,
    float         *out_batch,
    uint32_t       down_quant_mode,
    float          x_scale)
{
#pragma HLS INTERFACE mode=m_axi port=W         bundle=gmem_W   offset=slave depth=1    max_read_burst_length=16  max_widen_bitwidth=128
#pragma HLS INTERFACE mode=m_axi port=V         bundle=gmem_V   offset=slave depth=1    max_read_burst_length=16  max_widen_bitwidth=128
#pragma HLS INTERFACE mode=m_axi port=W_down    bundle=gmem_Wd  offset=slave depth=1    max_read_burst_length=16  max_widen_bitwidth=128
#pragma HLS INTERFACE mode=m_axi port=x_batch   bundle=gmem_x   offset=slave depth=8192 max_read_burst_length=256 max_widen_bitwidth=128
#pragma HLS INTERFACE mode=m_axi port=out_batch bundle=gmem_out offset=slave depth=8192 max_write_burst_length=256 max_widen_bitwidth=128

#pragma HLS INTERFACE mode=s_axilite port=W               bundle=CTRL
#pragma HLS INTERFACE mode=s_axilite port=V               bundle=CTRL
#pragma HLS INTERFACE mode=s_axilite port=W_down          bundle=CTRL
#pragma HLS INTERFACE mode=s_axilite port=x_batch         bundle=CTRL
#pragma HLS INTERFACE mode=s_axilite port=out_batch       bundle=CTRL
#pragma HLS INTERFACE mode=s_axilite port=down_quant_mode bundle=CTRL
#pragma HLS INTERFACE mode=s_axilite port=x_scale         bundle=CTRL
#pragma HLS INTERFACE mode=s_axilite port=return          bundle=CTRL

    // Simple pass-through: copy 2048 int8 values to float output (widening cast).
    // If you need strict FP32 input, adjust x_batch type and interface accordingly.
    COPY: for (int i = 0; i < VECTOR_DIM; ++i) {
#pragma HLS PIPELINE II=1
        out_batch[i] = (float)x_batch[i];
    }
}
