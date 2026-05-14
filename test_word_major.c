// Standalone validation of the sequential word-major MAC algorithm.
// Compile: gcc -o test_word_major test_word_major.c -lm
// Run: ./test_word_major
// This validates the two-level word-major structure numerically before
// trusting it in HLS synthesis.

#include <stdio.h>
#include <stdint.h>
#include <math.h>
#include <string.h>

// Full pre-decode block: 288 bytes = 18 words
// Word 0: d(2)+dmin(2)+sc6[0..7](8)+mn6[0..3](4)
// Word 1: mn6[4..7](4)+pad(12)
// Words 2-17: nibbles[256] as flat INT8
#define NIB_WORDS 16
#define BLOCKS_PER_ROW 8

static float fp16_to_f32(uint16_t h) {
    uint32_t sign = ((uint32_t)(h >> 15)) << 31;
    uint32_t exp  = (h >> 10) & 0x1F;
    uint32_t mant = (uint32_t)(h & 0x3FF);
    uint32_t f32;
    if (exp == 0 && mant == 0) { f32 = sign; }
    else if (exp == 0) {
        uint32_t m = mant, e = 112;
        for (int i = 0; i < 10; i++) { if (!(m & 0x200)) { m <<= 1; e--; } }
        f32 = sign | (e << 23) | ((m & 0x1FF) << 14);
    } else if (exp == 31) { f32 = sign | 0x7F800000 | (mant << 13); }
    else { f32 = sign | ((exp + 112) << 23) | (mant << 13); }
    union { uint32_t u; float f; } c; c.u = f32; return c.f;
}

// Fill a test block with known values
static void fill_test_block(uint8_t *block, uint16_t d_raw, uint16_t dmin_raw) {
    memset(block, 0, 288);
    block[0] = d_raw & 0xFF; block[1] = (d_raw >> 8) & 0xFF;
    block[2] = dmin_raw & 0xFF; block[3] = (dmin_raw >> 8) & 0xFF;
    // sc6[0..7] = {5,8,11,14,17,20,23,26}
    // mn6[0..7] = {1,3,5,7,9,11,13,15}
    for (int i = 0; i < 8; i++) {
        block[4 + i] = (uint8_t)(5 + 3 * i);
        block[12 + i] = (uint8_t)(1 + 2 * i);
    }
    // Nibbles: flat INT8, test pattern n%16 at word 2+
    for (int n = 0; n < 256; n++) {
        block[32 + n] = (uint8_t)(n & 0xF);
    }
}

// Reference dot product (element-major, using packed Q4_K-like access)
static float dot_ref(const uint8_t *block, const int8_t *x, float x_scale) {
    float d = fp16_to_f32((uint16_t)(block[0] | ((uint16_t)block[1] << 8)));
    float dmin = fp16_to_f32((uint16_t)(block[2] | ((uint16_t)block[3] << 8)));
    int32_t w_sum = 0, m_sum = 0;
    for (int n = 0; n < 256; n++) {
        int sub = n >> 5;
        int32_t nib = (int32_t)block[32 + n];  // flat INT8
        int32_t xi  = (int32_t)x[n];
        int32_t sc  = (int32_t)block[4 + sub];
        int32_t mn  = (int32_t)block[12 + sub];
        w_sum += xi * nib * sc;
        m_sum += xi * mn;
    }
    return d * x_scale * (float)w_sum - dmin * x_scale * (float)m_sum;
}

// Word-major dot product (matches the HLS sequential word-major MAC)
static float dot_word_major(const uint8_t *block, const int8_t *x, float x_scale) {
    float d = fp16_to_f32((uint16_t)(block[0] | ((uint16_t)block[1] << 8)));
    float dmin = fp16_to_f32((uint16_t)(block[2] | ((uint16_t)block[3] << 8)));

    int32_t w_acc[8][4] = {{0}};  // 4 sub-accumulators for INT32 latency hiding
    int32_t m_acc[8][4] = {{0}};
    // Simulate: w_acc[b][k] where k = n&3

    // Sequential word-major: outer w loop, inner j loop
    for (int w = 0; w < NIB_WORDS; w++) {
        // "Read" nibble word w from the block into registers
        uint8_t nib_reg[16];
        for (int j = 0; j < 16; j++) {
            nib_reg[j] = block[32 + w*16 + j];
        }
        // "Read" sc6/mn6 for this word's sub-block
        int sub_w = w >> 1;
        int32_t sc = (int32_t)block[4 + sub_w];
        int32_t mn = (int32_t)block[12 + sub_w];

        // Inner pipelined loop: extract 16 nibbles from registers
        for (int j = 0; j < 16; j++) {
            int n = w * 16 + j;
            int k = n & 3;
            int32_t nib = (int32_t)nib_reg[j];
            int32_t xi  = (int32_t)x[n];
            w_acc[0][k] += xi * nib * sc;
            m_acc[0][k] += xi * mn;
        }
    }

    int32_t sw = 0, sm = 0;
    for (int k = 0; k < 4; k++) { sw += w_acc[0][k]; sm += m_acc[0][k]; }
    return d * x_scale * (float)sw - dmin * x_scale * (float)sm;
}

int main() {
    uint8_t block[288];
    int8_t x[256];

    // Test 1: Normal fp16, simple x pattern
    fill_test_block(block, 0x0800, 0x0000);
    for (int i = 0; i < 256; i++) x[i] = (int8_t)((i % 17) - 8);

    float ref1 = dot_ref(block, x, 1.0f);
    float wm1  = dot_word_major(block, x, 1.0f);
    printf("Test 1 (normal, x_scale=1): ref=%f  wm=%f  diff=%e  %s\n",
           ref1, wm1, fabsf(ref1-wm1), fabsf(ref1-wm1) < 1e-6f ? "PASS" : "FAIL");

    // Test 2: Subnormal d
    fill_test_block(block, 0x00A4, 0x0000);
    float ref2 = dot_ref(block, x, 0.00315f);
    float wm2  = dot_word_major(block, x, 0.00315f);
    printf("Test 2 (subnorm d, x_scale~0.003): ref=%f  wm=%f  diff=%e  %s\n",
           ref2, wm2, fabsf(ref2-wm2), fabsf(ref2-wm2) < 1e-6f ? "PASS" : "FAIL");

    // Test 3: Verify all 8 blocks (simulating compute_X1 row 0)
    uint8_t blocks[8 * 288];
    for (int b = 0; b < 8; b++) fill_test_block(blocks + b*288, 0x0800, 0x0000);

    float row_ref = 0, row_wm = 0;
    for (int b = 0; b < 8; b++) {
        row_ref += dot_ref(blocks + b*288, x + b*256, 1.0f);
        row_wm  += dot_word_major(blocks + b*288, x + b*256, 1.0f);
    }
    printf("Test 3 (8 blocks, full row): ref=%f  wm=%f  diff=%e  %s\n",
           row_ref, row_wm, fabsf(row_ref-row_wm), fabsf(row_ref-row_wm) < 1e-5f ? "PASS" : "FAIL");

    return (fabsf(ref1-wm1) > 1e-6f || fabsf(ref2-wm2) > 1e-6f || fabsf(row_ref-row_wm) > 1e-5f) ? 1 : 0;
}
