// test_transposer.c — Validate transpose_q4k_to_urm DDR layout
// Compile: gcc -O2 -o test_transposer test_transposer.c -lm
#include <stdio.h>
#include <stdint.h>
#include <string.h>
#include <stdlib.h>

#define URM_HDR_BYTES 32
#define Q4_K_BYTES 144

// Copy of the transposer from ggml-cpu.c (standalone test version)
static void transpose_q4k_to_urm(const uint8_t *src, uint8_t *dst,
                                  int n_rows, int blocks_per_row) {
    const int src_block_bytes = 144;
    const int groups = blocks_per_row / 8;
    const int row_hdr   = blocks_per_row * URM_HDR_BYTES;
    const int row_nib   = 256 * groups * 4;
    const int row_stride = row_hdr + row_nib;

    for (int row = 0; row < n_rows; row++) {
        // Headers: same as hybrid
        for (int b = 0; b < blocks_per_row; b++) {
            const uint8_t *blk = src + ((size_t)row * blocks_per_row + b) * src_block_bytes;
            uint8_t *hdr = dst + (size_t)row * row_stride + (size_t)b * URM_HDR_BYTES;
            hdr[0] = blk[0]; hdr[1] = blk[1];
            hdr[2] = blk[2]; hdr[3] = blk[3];
            for (int i = 0; i < 4; i++) {
                hdr[4 + i]  = blk[4 + i] & 0x3F;
                hdr[12 + i] = blk[8 + i] & 0x3F;
            }
            for (int i = 4; i < 8; i++) {
                int j = i - 4;
                hdr[4 + i]  = (blk[12 + j] & 0x0F) | (uint8_t)((blk[4 + j] >> 6) << 4);
                hdr[12 + i] = (blk[12 + j] >> 4)   | (uint8_t)((blk[8 + j] >> 6) << 4);
            }
            memset(hdr + 20, 0, 12);
        }

        for (int g = 0; g < groups; g++) {
            for (int n = 0; n < 256; n++) {
                uint32_t nib32 = 0;
                for (int b = 0; b < 8; b++) {
                    const uint8_t *blk = src + ((size_t)row * blocks_per_row
                                                + (size_t)g * 8 + (size_t)b) * src_block_bytes;
                    int q_byte = 16 + (n & 31) + ((n & 0xC0) >> 1);
                    int shift  = (n & 32) ? 4 : 0;
                    uint32_t nib = (blk[q_byte] >> shift) & 0xF;
                    nib32 |= (nib << (b * 4));
                }
                if (groups == 1) {
                    int e = n >> 2, s = n & 3;
                    uint8_t *nib_base = dst + (size_t)row * row_stride + (size_t)row_hdr;
                    uint32_t *ddr32 = (uint32_t *)(nib_base + (size_t)e * 16);
                    ddr32[s] = nib32;
                } else {
                    int slot = g;
                    uint8_t *nib_base = dst + (size_t)row * row_stride + (size_t)row_hdr;
                    uint32_t *ddr32 = (uint32_t *)(nib_base + (size_t)n * 16);
                    ddr32[slot] = nib32;
                }
            }
        }
    }
}

// Reference: extract nibble from Q4_K block
static uint8_t q4k_nibble(const uint8_t *block, int n) {
    int q_byte = 16 + (n & 31) + ((n & 0xC0) >> 1);
    int shift  = (n & 32) ? 4 : 0;
    return (block[q_byte] >> shift) & 0xF;
}

int main(void) {
    int passed = 0, tests = 0;

    // Test 1: WV path (8 blocks) — verify nibble DDR layout
    printf("T1: WV transposer — nibble DDR layout correct ... ");
    {
        uint8_t src[8 * 144];  // 8 blocks
        uint8_t dst[1280];     // 8*32 + 256*4 = 1280 bytes = 80 DDR words
        memset(src, 0, sizeof(src));
        memset(dst, 0xFF, sizeof(dst));  // init to poison

        // Set specific nibble values: block 3, element 137 = 0xA
        int b_test = 3, n_test = 137;
        int q_byte = 16 + (n_test & 31) + ((n_test & 0xC0) >> 1);
        int shift  = (n_test & 32) ? 4 : 0;
        src[b_test * 144 + q_byte] |= (0xA << shift);

        transpose_q4k_to_urm(src, dst, 1, 8);

        // Verify header section exists
        uint8_t *hdr0 = dst;
        if (hdr0[0] != 0 || hdr0[1] != 0) { printf("FAIL (header mismatch)\n"); tests++; goto next1; }

        // Verify nibble at correct DDR position
        // WV: groups=1, e = n>>2 = 137>>2 = 34, s = n&3 = 1
        int hdr_bytes = 8 * 32;  // 256
        uint32_t *nib_ddr = (uint32_t *)(dst + hdr_bytes);
        // DDR word 34, slot 1
        uint32_t val = nib_ddr[34 * 4 + 1];
        uint8_t nib_read = (val >> (3 * 4)) & 0xF;  // block 3 → bits 15:12

        if (nib_read == 0xA) {
            printf("PASS\n"); passed++;
        } else {
            printf("FAIL (expected 0xA, got 0x%X at ddr[%d])\n", nib_read, 34*4+1);
        }
        tests++;
    }
    next1:

    // Test 2: Output path (32 blocks, 4 groups) — nibble DDR layout
    printf("T2: Output transposer — nibble DDR layout correct ... ");
    {
        uint8_t src[32 * 144];
        uint8_t dst[5120];     // 32*32 + 256*16 = 5120 bytes = 320 DDR words
        memset(src, 0, sizeof(src));
        memset(dst, 0xFF, sizeof(dst));

        // Set nibble in group 2 (blocks 16-23), block 18, element 200 = 0xB
        int g_test = 2, b_in_g = 2, b_abs = g_test * 8 + b_in_g;  // absolute block 18
        int n_test = 200;
        int q_byte = 16 + (n_test & 31) + ((n_test & 0xC0) >> 1);
        int shift  = (n_test & 32) ? 4 : 0;
        src[b_abs * 144 + q_byte] |= (0xB << shift);

        transpose_q4k_to_urm(src, dst, 1, 32);

        int hdr_bytes = 32 * 32;  // 1024
        uint32_t *nib_ddr = (uint32_t *)(dst + hdr_bytes);
        // Output: DDR word = element n_test = 200, slot = g_test = 2
        uint32_t val = nib_ddr[200 * 4 + 2];  // DDR word 200, group slot 2
        uint8_t nib_read = (val >> (b_in_g * 4)) & 0xF;

        if (nib_read == 0xB) {
            printf("PASS\n"); passed++;
        } else {
            printf("FAIL (expected 0xB, got 0x%X)\n", nib_read);
        }
        tests++;
    }

    // Test 3: Round-trip — transposer output read back matches direct extraction
    printf("T3: 100 random rows, all nibbles match direct extraction ... ");
    {
        int mismatches = 0;
        for (int r = 0; r < 100 && mismatches < 5; r++) {
            srand(r * 1000 + 1);
            int bpr = (r < 50) ? 8 : 32;  // alternate WV and output
            int groups = bpr / 8;
            int row_stride = bpr * URM_HDR_BYTES + 256 * groups * 4;

            uint8_t *src = (uint8_t *)calloc(bpr * 144, 1);
            uint8_t *dst = (uint8_t *)calloc(row_stride, 1);
            for (int i = 0; i < bpr * 144; i++) src[i] = rand() & 0xFF;
            transpose_q4k_to_urm(src, dst, 1, bpr);

            int hdr_bytes = bpr * URM_HDR_BYTES;
            uint32_t *nib_ddr = (uint32_t *)(dst + hdr_bytes);

            for (int g = 0; g < groups; g++) {
                for (int n = 0; n < 256; n++) {
                    uint32_t val;
                    if (groups == 1) {
                        int e = n >> 2, s = n & 3;
                        val = nib_ddr[e * 4 + s];
                    } else {
                        val = nib_ddr[n * 4 + g];
                    }
                    for (int b = 0; b < 8; b++) {
                        uint8_t got   = (val >> (b * 4)) & 0xF;
                        uint8_t expected = q4k_nibble(src + (g * 8 + b) * 144, n);
                        if (got != expected) { mismatches++; goto next_row; }
                    }
                }
            }
            next_row:
            free(src); free(dst);
        }
        if (mismatches == 0) {
            printf("PASS (100/100)\n"); passed++;
        } else {
            printf("FAIL (%d mismatches)\n", mismatches);
        }
        tests++;
    }

    printf("\n=== Results: %d/%d tests passed ===\n", passed, tests);
    return (passed == tests) ? 0 : 1;
}
