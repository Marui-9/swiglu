#include "testblock.h"
#include <string.h>
#include <ap_int.h>


#define VECTOR_DIM 2048

// Pass-through kernel: ignores weights and simply copies x_batch (int8) to out_batch as floats.
// Interfaces mirror swiglu.cpp so it can be dropped into the same IP shell.
void testblock(
    uint8_t *W,
    uint8_t *V,
    uint8_t *W_down,
    const int8_t  *x_batch,
    float         *out_batch,
    uint32_t       down_quant_mode,
    float          x_scale)
{
#pragma HLS INTERFACE mode=m_axi port=W         bundle=gmem_W   offset=slave depth=9437184  max_read_burst_length=256 max_widen_bitwidth=128
#pragma HLS INTERFACE mode=m_axi port=V         bundle=gmem_V   offset=slave depth=9437184  max_read_burst_length=256 max_widen_bitwidth=128
#pragma HLS INTERFACE mode=m_axi port=W_down    bundle=gmem_Wd  offset=slave depth=13762560 max_read_burst_length=256 max_widen_bitwidth=128
#pragma HLS INTERFACE mode=m_axi port=x_batch   bundle=gmem_x   offset=slave depth=2048     max_read_burst_length=256 max_widen_bitwidth=128
#pragma HLS INTERFACE mode=m_axi port=out_batch bundle=gmem_out offset=slave depth=2048     max_write_burst_length=256 max_widen_bitwidth=128

#pragma HLS INTERFACE mode=s_axilite port=W               bundle=CTRL
#pragma HLS INTERFACE mode=s_axilite port=V               bundle=CTRL
#pragma HLS INTERFACE mode=s_axilite port=W_down          bundle=CTRL
#pragma HLS INTERFACE mode=s_axilite port=x_batch         bundle=CTRL
#pragma HLS INTERFACE mode=s_axilite port=out_batch       bundle=CTRL
#pragma HLS INTERFACE mode=s_axilite port=down_quant_mode bundle=CTRL
#pragma HLS INTERFACE mode=s_axilite port=x_scale         bundle=CTRL
#pragma HLS INTERFACE mode=s_axilite port=return          bundle=CTRL

    // Force 128-bit read AND write AXI channels for W/V/W_down.
    // HLS derives WDATA width from actual write operations — without a write
    // of ap_uint<128> type, WDATA defaults to 32 bits causing a block design
    // width mismatch. x_scale is a runtime AXI-Lite value so HLS cannot
    // constant-fold the branch away; the write is never executed at runtime
    // (x_scale is always positive in normal operation).
    ap_uint<128> *W_wide  = (ap_uint<128>*)W;
    ap_uint<128> *V_wide  = (ap_uint<128>*)V;
    ap_uint<128> *Wd_wide = (ap_uint<128>*)W_down;
    ap_uint<128> dummy    = W_wide[0] ^ V_wide[0] ^ Wd_wide[0];
    if (x_scale < 0.f) {
        W_wide[0]  = dummy;
        V_wide[0]  = dummy;
        Wd_wide[0] = dummy;
    }

    // Pass-through: copy 2048 int8 values to float output.
    COPY: for (int i = 0; i < VECTOR_DIM; ++i) {
        #pragma HLS PIPELINE II=1
        out_batch[i] = (float)x_batch[i];
    }
}
