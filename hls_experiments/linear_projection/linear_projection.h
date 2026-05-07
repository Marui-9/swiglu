#ifndef LINEAR_PROJECTION_H
#define LINEAR_PROJECTION_H

#include "ap_axi_sdata.h"
#include "hls_stream.h"

// Simulation dimensions. Restore to 2048 and 65536 for C Synthesis.
#define VECTOR_DIM 2048
#define VOCAB_SIZE 65536  

typedef ap_axiu<32, 0, 0, 0> stream_pkt;

void linear_projection(hls::stream<stream_pkt>& in_stream, hls::stream<stream_pkt>& out_stream);

#endif