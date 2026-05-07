#include "linear_projection.h"
#include <stdint.h>

#define VECTOR_DIM 2048
#define VOCAB_SIZE 65536
#define BLOCKS_PER_ROW (VECTOR_DIM / 256) // 8 blocks per row
#define Q6_K_BYTES 210

typedef ap_axiu<32, 0, 0, 0> stream_pkt;

// Manual IEEE 754 fp16 -> fp32 conversion.
// The hls_half type flushes subnormal fp16 values to zero in synthesis
// (Denormals-As-Zero), which makes all Q6_K weights zero for this model.
// This implementation correctly handles subnormals via bit manipulation only.
static float fp16_to_fp32(uint16_t h) {
    #pragma HLS INLINE
    uint32_t sign = ((uint32_t)(h >> 15)) << 31;
    uint32_t exp  = (h >> 10) & 0x1F;
    uint32_t mant = (uint32_t)(h & 0x3FF);

    uint32_t f32;
    if (exp == 0 && mant == 0) {
        // Positive or negative zero
        f32 = sign;
    } else if (exp == 0) {
        // Subnormal fp16: value = sign * 2^(-14) * (mant / 1024)
        // Normalize by shifting mant left until bit 9 is set.
        // 10 unrolled iterations cover all possible leading-zero counts (0-9).
        uint32_t m = mant;
        uint32_t e = 112; // fp32 biased exponent start = 127 - 15
        NORM: for (int i = 0; i < 10; i++) {
            #pragma HLS UNROLL
            if (!(m & 0x200)) { m <<= 1; e--; }
        }
        // m[9] is now the implicit leading 1; bits [8:0] are the mantissa fraction.
        // Scale the 9-bit mantissa to the 23-bit fp32 field (left-shift by 14).
        f32 = sign | (e << 23) | ((m & 0x1FF) << 14);
    } else if (exp == 31) {
        // Infinity or NaN
        f32 = sign | 0x7F800000 | (mant << 13);
    } else {
        // Normal fp16: rebias exponent from 15 to 127 (add 112), expand mantissa
        f32 = sign | ((exp + 112) << 23) | (mant << 13);
    }

    union { uint32_t u; float f; } conv;
    conv.u = f32;
    return conv.f;
}

void linear_projection(hls::stream<stream_pkt>& in_stream, hls::stream<stream_pkt>& out_stream) {
    #pragma HLS INTERFACE mode=axis port=in_stream
    #pragma HLS INTERFACE mode=axis port=out_stream
    #pragma HLS INTERFACE mode=s_axilite port=return bundle=CTRL

    // Local cache for the F32 input vector (8 KB)
    float vector_cache[VECTOR_DIM];
    #pragma HLS BIND_STORAGE variable=vector_cache type=ram_1p impl=bram

    // Phase 1: Load the 2048-dimensional F32 vector into BRAM
    LOAD_VECTOR: for (int i = 0; i < VECTOR_DIM; i++) {
        #pragma HLS PIPELINE II=1
        stream_pkt pkt_in = in_stream.read();
        union { uint32_t i; float f; } converter;
        converter.i = pkt_in.data;
        vector_cache[i] = converter.f;
    }

    // Phase 2: Stream Q6_K blocks, dequantize, and compute logits.
    //
    // Blocks are processed in PAIRS (2 x 210 = 420 bytes = 105 words exactly).
    // This eliminates the conditional stream read from the old per-block approach
    // (which created a loop-carried dependency on bytes_in_word, preventing II=1).
    // Each pair uses 8 independent partial accumulators per block so that the
    // FP adder recurrence latency (~5 cycles) does not limit DECODE_MAC to II>1.
    COMPUTE_LOGITS: for (int token = 0; token < VOCAB_SIZE; token++) {
        float logit_acc = 0.0f;

        PROCESS_ROW_PAIRS: for (int b = 0; b < BLOCKS_PER_ROW; b += 2) {
            uint8_t block_buf_a[Q6_K_BYTES];
            uint8_t block_buf_b[Q6_K_BYTES];
            #pragma HLS ARRAY_PARTITION variable=block_buf_a cyclic factor=4
            #pragma HLS ARRAY_PARTITION variable=block_buf_b cyclic factor=4

            // Read exactly 105 words (420 bytes) covering two consecutive blocks.
            // The 4-iteration UNPACK loop is fully unrolled, writing each byte
            // directly to the correct buffer position with no conditional branches
            // on loop-carried state.
            //   words  0-51: all 4 bytes -> block_buf_a[0..207]
            //   word  52:    bytes 0-1   -> block_buf_a[208..209]
            //                bytes 2-3   -> block_buf_b[0..1]
            //   words 53-104: all 4 bytes -> block_buf_b[2..209]
            READ_PAIR: for (int w = 0; w < 105; w++) {
                #pragma HLS PIPELINE II=1
                uint32_t word = in_stream.read().data;
                UNPACK: for (int byte_off = 0; byte_off < 4; byte_off++) {
                    #pragma HLS UNROLL
                    int abs_byte = w * 4 + byte_off;
                    uint8_t bval = (uint8_t)((word >> (byte_off * 8)) & 0xFF);
                    if      (abs_byte < 210) block_buf_a[abs_byte]       = bval;
                    else if (abs_byte < 420) block_buf_b[abs_byte - 210] = bval;
                }
            }

            // ---- Block A (index b) ----
            uint16_t d_i_a = (uint16_t)block_buf_a[208] | ((uint16_t)block_buf_a[209] << 8);
            float d_a = fp16_to_fp32(d_i_a);
            int v_idx_a = b * 256;

            // 8 partial accumulators break the FP adder recurrence, enabling II=1.
            // acc[k] accumulates weights at n = k, k+8, k+16, ... (every 8th element).
            // Each accumulator is accessed every 8 cycles, well beyond the ~5-cycle
            // FP adder latency, so no recurrence hazard.
            float acc_a[8] = {0.f, 0.f, 0.f, 0.f, 0.f, 0.f, 0.f, 0.f};
            #pragma HLS ARRAY_PARTITION variable=acc_a complete

            DECODE_MAC_A: for (int n = 0; n < 256; n++) {
                #pragma HLS PIPELINE II=1
                int ql_idx = n / 2;
                int qh_idx = n / 4;
                int sc_idx = n / 16;
                uint8_t ql_val = (n % 2 == 0) ? (block_buf_a[ql_idx] & 0x0F)
                                               : (block_buf_a[ql_idx] >> 4);
                uint8_t qh_shift = (n % 4) * 2;
                uint8_t qh_val = (block_buf_a[128 + qh_idx] >> qh_shift) & 0x03;
                int8_t q = (int8_t)((uint8_t)((qh_val << 4) | ql_val)) - 32;
                int8_t scale = (int8_t)block_buf_a[192 + sc_idx];
                float weight = (float)q * (float)scale * d_a;
                acc_a[n & 7] += vector_cache[v_idx_a + n] * weight;
            }
            // Binary-tree reduction minimises reduction latency (3 adder levels)
            logit_acc += ((acc_a[0] + acc_a[1]) + (acc_a[2] + acc_a[3])) +
                         ((acc_a[4] + acc_a[5]) + (acc_a[6] + acc_a[7]));

            // ---- Block B (index b+1) ----
            uint16_t d_i_b = (uint16_t)block_buf_b[208] | ((uint16_t)block_buf_b[209] << 8);
            float d_b = fp16_to_fp32(d_i_b);
            int v_idx_b = (b + 1) * 256;

            float acc_b[8] = {0.f, 0.f, 0.f, 0.f, 0.f, 0.f, 0.f, 0.f};
            #pragma HLS ARRAY_PARTITION variable=acc_b complete

            DECODE_MAC_B: for (int n = 0; n < 256; n++) {
                #pragma HLS PIPELINE II=1
                int ql_idx = n / 2;
                int qh_idx = n / 4;
                int sc_idx = n / 16;
                uint8_t ql_val = (n % 2 == 0) ? (block_buf_b[ql_idx] & 0x0F)
                                               : (block_buf_b[ql_idx] >> 4);
                uint8_t qh_shift = (n % 4) * 2;
                uint8_t qh_val = (block_buf_b[128 + qh_idx] >> qh_shift) & 0x03;
                int8_t q = (int8_t)((uint8_t)((qh_val << 4) | ql_val)) - 32;
                int8_t scale = (int8_t)block_buf_b[192 + sc_idx];
                float weight = (float)q * (float)scale * d_b;
                acc_b[n & 7] += vector_cache[v_idx_b + n] * weight;
            }
            logit_acc += ((acc_b[0] + acc_b[1]) + (acc_b[2] + acc_b[3])) +
                         ((acc_b[4] + acc_b[5]) + (acc_b[6] + acc_b[7]));
        }

        // Output final F32 logit for this token
        union { float f; uint32_t i; } out_conv;
        out_conv.f = logit_acc;

        stream_pkt pkt_out;
        pkt_out.data = out_conv.i;
        pkt_out.keep = -1;
        pkt_out.strb = -1;
        pkt_out.last = (token == (VOCAB_SIZE - 1)) ? 1 : 0;

        out_stream.write(pkt_out);
    }
}
