#include "linear_projection.h"
#include <iostream>
#include <cmath>
#include <cstdint>

// hls_half.h removed: testbench uses fp16_ref() for all fp16->fp32 conversions
// so expected logits are independent of the HLS half type's subnormal handling.

#define SIM_VECTOR_DIM 2048
#define SIM_VOCAB_SIZE 65536
#define SIM_BLOCKS_PER_ROW (SIM_VECTOR_DIM / 256)
#define Q6_K_BYTES 210

using namespace std;

// ---------------------------------------------------------------------------
// Reference fp16->fp32 conversion (mirrors the IP's fp16_to_fp32 function).
// Used for expected-logit computation so the testbench does not depend on
// the HLS half type's subnormal handling (which may also flush to zero).
// ---------------------------------------------------------------------------
static float fp16_ref(uint16_t h) {
    uint32_t sign = ((uint32_t)(h >> 15)) << 31;
    uint32_t exp  = (h >> 10) & 0x1F;
    uint32_t mant = (uint32_t)(h & 0x3FF);
    uint32_t f32;
    if (exp == 0 && mant == 0) {
        f32 = sign;
    } else if (exp == 0) {
        // Subnormal fp16 -> normalized fp32
        uint32_t m = mant;
        uint32_t e = 112; // 127 - 15
        for (int i = 0; i < 10; i++) {
            if (!(m & 0x200)) { m <<= 1; e--; }
        }
        f32 = sign | (e << 23) | ((m & 0x1FF) << 14);
    } else if (exp == 31) {
        f32 = sign | 0x7F800000 | (mant << 13);
    } else {
        f32 = sign | ((exp + 112) << 23) | (mant << 13);
    }
    union { uint32_t u; float f; } conv;
    conv.u = f32;
    return conv.f;
}

// ---------------------------------------------------------------------------
// Helper: pack bytes into 32-bit AXI stream words
// ---------------------------------------------------------------------------
static uint32_t tb_stream_word = 0;
static int      tb_bytes_in_word = 0;

static void write_byte_to_stream(uint8_t b, hls::stream<stream_pkt>& stream) {
    tb_stream_word |= ((uint32_t)b << (tb_bytes_in_word * 8));
    tb_bytes_in_word++;
    if (tb_bytes_in_word == 4) {
        stream_pkt pkt;
        pkt.data = tb_stream_word;
        pkt.keep = -1;
        pkt.strb = -1;
        pkt.last = 0;
        stream.write(pkt);
        tb_stream_word = 0;
        tb_bytes_in_word = 0;
    }
}

// ---------------------------------------------------------------------------
// Build one Q6_K block in block_buf[], return expected logit contribution
// ---------------------------------------------------------------------------
static float build_block(uint8_t* block, const float* vec, int v_base,
                         uint16_t d_raw) {
    // Write d (fp16 LE) into bytes 208-209
    block[208] = (uint8_t)(d_raw & 0xFF);
    block[209] = (uint8_t)((d_raw >> 8) & 0xFF);

    float d_ref_val = fp16_ref(d_raw);
    float contribution = 0.0f;

    for (int n = 0; n < 256; n++) {
        int ql_idx = n / 2;
        int qh_idx = n / 4;
        int sc_idx = n / 16;

        int8_t mock_scale = (sc_idx % 2) ? 2 : -2;
        block[192 + sc_idx] = (uint8_t)(int8_t)mock_scale;

        int8_t mock_q = (int8_t)(n % 5); // 0..4
        uint8_t q_biased = (uint8_t)(mock_q + 32);

        uint8_t ql = q_biased & 0x0F;
        uint8_t qh = (q_biased >> 4) & 0x03;

        if (n % 2 == 0) {
            block[ql_idx] = ql;
        } else {
            block[ql_idx] |= (ql << 4);
        }

        uint8_t qh_shift = (n % 4) * 2;
        if (n % 4 == 0) block[128 + qh_idx] = 0;
        block[128 + qh_idx] |= (qh << qh_shift);

        // Reference uses fp16_ref(), not HLS half, so subnormals are handled
        contribution += vec[v_base + n] * ((float)mock_q * (float)mock_scale * d_ref_val);
    }
    return contribution;
}

// ---------------------------------------------------------------------------
// Run one complete simulation pass and return error count
// ---------------------------------------------------------------------------
static int run_test(const char* label,
                    float* test_vector,
                    uint16_t d_normal,
                    uint16_t d_subnorm) {
    hls::stream<stream_pkt> in_stream("in_stream");
    hls::stream<stream_pkt> out_stream("out_stream");

    // Reset packing state
    tb_stream_word    = 0;
    tb_bytes_in_word  = 0;

    float expected_logits[SIM_VOCAB_SIZE] = {};
    uint8_t block_buf[Q6_K_BYTES];

    // --- Transmit F32 input vector ---
    for (int i = 0; i < SIM_VECTOR_DIM; i++) {
        union { float f; uint32_t u; } c;
        c.f = test_vector[i];
        stream_pkt pkt;
        pkt.data = c.u; pkt.keep = -1; pkt.strb = -1; pkt.last = 0;
        in_stream.write(pkt);
    }

    // --- Build and transmit Q6_K matrix ---
    // Even tokens use d_normal, odd tokens use d_subnorm so both paths
    // are exercised in every simulation run.
    for (int v = 0; v < SIM_VOCAB_SIZE; v++) {
        uint16_t d_raw = (v % 2 == 0) ? d_normal : d_subnorm;
        for (int b = 0; b < SIM_BLOCKS_PER_ROW; b++) {
            expected_logits[v] +=
                build_block(block_buf, test_vector, b * 256, d_raw);
            for (int byte_idx = 0; byte_idx < Q6_K_BYTES; byte_idx++) {
                write_byte_to_stream(block_buf[byte_idx], in_stream);
            }
        }
    }

    // After all tokens: 8 * 210 * SIM_VOCAB_SIZE bytes total.
    // 8 * 210 = 1680, divisible by 4, so tb_bytes_in_word == 0 here.
    // No flush needed.

    // --- Execute IP ---
    linear_projection(in_stream, out_stream);

    // --- Verify outputs ---
    const float EPSILON = 1e-3f;
    int err_cnt = 0;

    for (int v = 0; v < SIM_VOCAB_SIZE; v++) {
        stream_pkt pkt_out = out_stream.read();
        union { uint32_t u; float f; } oc;
        oc.u = pkt_out.data;
        float actual = oc.f;

        int expected_last = (v == SIM_VOCAB_SIZE - 1) ? 1 : 0;

        float diff = actual - expected_logits[v];
        if (diff < 0) diff = -diff;
        if (diff > EPSILON) {
            cout << label << ": math mismatch token " << v
                 << "  expected=" << expected_logits[v]
                 << "  got=" << actual << endl;
            if (++err_cnt >= 10) { cout << "(further errors suppressed)" << endl; break; }
        }

        if ((int)pkt_out.last != expected_last) {
            cout << label << ": TLAST mismatch at token " << v << endl;
            if (++err_cnt >= 10) break;
        }
    }
    return err_cnt;
}

// ---------------------------------------------------------------------------
int main() {
    int total_errors = 0;

    float test_vector[SIM_VECTOR_DIM];
    for (int i = 0; i < SIM_VECTOR_DIM; i++)
        test_vector[i] = (float)((i % 4) + 1) * 0.1f; // 0.1, 0.2, 0.3, 0.4, ...

    // --- Test 1: normal fp16 d value (0x3800 = 0.5f) ---
    // Exercises the standard (non-subnormal) conversion path.
    cout << "=== Test 1: normal fp16 d (0x3800 = 0.5f) ===" << endl;
    total_errors += run_test("T1", test_vector, 0x3800, 0x3800);

    // --- Test 2: subnormal fp16 d values ---
    // d_normal = 0x3800 (0.5f), d_subnorm = 0x00A4 (~9.775e-6, the value
    // seen in the actual LFM2.5-1.2B output projection weights).
    // This test would have caught the original reinterpret_cast<half*> bug
    // because odd tokens would have produced 0.0 instead of the correct logit.
    cout << "=== Test 2: subnormal fp16 d (0x00A4 ~ 9.775e-6) ===" << endl;
    total_errors += run_test("T2", test_vector, 0x3800, 0x00A4);

    // --- Test 3: mixed sign subnormal (0x817E = negative subnormal) ---
    cout << "=== Test 3: negative subnormal fp16 d (0x817E) ===" << endl;
    total_errors += run_test("T3", test_vector, 0x3800, 0x817E);

    if (total_errors == 0) {
        cout << "All tests PASSED." << endl;
        return 0;
    } else {
        cout << "FAILED: " << total_errors << " error(s)." << endl;
        return 1;
    }
}
