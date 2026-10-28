// Cosim harness: Stage 2 (load_x_local -> compute_X1 || compute_X2 -> store) with
// the 2048-iteration loops cut to X12_ROWS/4 iterations.
#define X12_ROWS 128
#include "swiglu_cut.cpp"

static void store_X(const int16_t X1[MAX_BATCH][FFN_DIM], const int16_t X2[MAX_BATCH][FFN_DIM],
                    int16_t *out)
{
#pragma HLS INLINE off
    ST: for (int i = 0; i < X12_ROWS; i++) {
        #pragma HLS PIPELINE II=1
        out[i] = X1[0][i];
        out[X12_ROWS + i] = X2[0][i];
    }
}

void x1top(const uint8_t *W, const uint8_t *V, const int8_t *x_batch, int16_t *out, float x_scale)
{
    #pragma HLS INTERFACE mode=m_axi port=W       bundle=gmem_W offset=slave depth=163840 max_read_burst_length=128 latency=64 num_read_outstanding=4 max_widen_bitwidth=128
    #pragma HLS INTERFACE mode=m_axi port=V       bundle=gmem_V offset=slave depth=163840 max_read_burst_length=128 latency=64 num_read_outstanding=4 max_widen_bitwidth=128
    #pragma HLS INTERFACE mode=m_axi port=x_batch bundle=gmem_x offset=slave depth=2048 max_read_burst_length=128 latency=64 num_read_outstanding=1 max_widen_bitwidth=128
    #pragma HLS INTERFACE mode=m_axi port=out     bundle=gmem_out offset=slave depth=256 latency=64 num_write_outstanding=1
    #pragma HLS INTERFACE mode=s_axilite port=W bundle=CTRL
    #pragma HLS INTERFACE mode=s_axilite port=V bundle=CTRL
    #pragma HLS INTERFACE mode=s_axilite port=x_batch bundle=CTRL
    #pragma HLS INTERFACE mode=s_axilite port=out bundle=CTRL
    #pragma HLS INTERFACE mode=s_axilite port=x_scale bundle=CTRL
    #pragma HLS INTERFACE mode=s_axilite port=return bundle=CTRL

    int8_t x_local_1[MAX_BATCH][WV_BLOCKS_PER_ROW][256];
    #pragma HLS BIND_STORAGE variable=x_local_1 type=ram_1p impl=lutram
    #pragma HLS ARRAY_PARTITION variable=x_local_1 dim=2 complete
    int8_t x_local_2[MAX_BATCH][WV_BLOCKS_PER_ROW][256];
    #pragma HLS BIND_STORAGE variable=x_local_2 type=ram_1p impl=lutram
    #pragma HLS ARRAY_PARTITION variable=x_local_2 dim=2 complete
    int16_t X1_cache[MAX_BATCH][FFN_DIM];
    int16_t X2_cache[MAX_BATCH][FFN_DIM];
    #pragma HLS BIND_STORAGE variable=X1_cache type=ram_2p impl=bram
    #pragma HLS BIND_STORAGE variable=X2_cache type=ram_2p impl=bram

#pragma HLS DATAFLOW
    load_x_local(x_batch, x_local_1, x_local_2);
    compute_X1(W, x_local_1, x_scale, X1_cache);
    compute_X2(V, x_local_2, x_scale, X2_cache);
    store_X(X1_cache, X2_cache, out);
}
