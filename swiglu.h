#ifndef SWIGLU_H
#define SWIGLU_H

#include <stdint.h>

#define MAX_BATCH 1

// ─── Q4_0 block constants ───────────────────────────────────────────────────
// Q4_0 block: 2B fp16 d + 16B nibbles (32 values, lower nibble = even index).
// CPU pre-decodes fp16 d → fp32 and transposes nibbles to element-major.
// FPGA MAC extracts nibbles at compile-time .range() — zero LUT.
#define Q40_VALS_PER_BLOCK    32
#define Q40_BLK_BYTES         18

// ─── WV path (gate/up): 2048 vals → 64 blocks → 8 groups × 8 blocks ────────
#define Q40_WV_BLOCKS         64
#define Q40_WV_GROUPS         8

// ─── Output path (down): 8192 vals → 256 blocks → 32 groups → 8 meta-groups ─
#define Q40_DOWN_BLOCKS       256
#define Q40_DOWN_GROUPS       32
#define Q40_DOWN_MG           8        // 32 groups / 4 per meta-group

// ─── DDR row layout (matched with ggml-cpu.c transpose_q40_to_urm) ──────────
// WV:  16 header + 64 nibble = 80 DDR words (1280 B) per row
// Out: 64 header + 256 nibble = 320 DDR words (5120 B) per row
#define Q40_WV_HDR_WORDS      16       // 64 fp32 d / 4 per DDR word
#define Q40_WV_NIB_WORDS      64       // 8 groups × 8 DDR words (4 elem-slices each)
#define Q40_WV_ROW_WORDS      80

#define Q40_DOWN_HDR_WORDS    64       // 256 fp32 d / 4 per DDR word
#define Q40_DOWN_NIB_WORDS    256      // 8 MG × 32 DDR words
#define Q40_DOWN_ROW_WORDS    320

// ─── MAC parallelism ─────────────────────────────────────────────────────────
#define K_WV                   8       // 8 WV rows per iteration (64 MAC chains)
#define K_DOWN                 4       // 4 output rows per iteration

// ─── Nibble tile dimensions ──────────────────────────────────────────────────
#define Q40_NIB_ELEMS         32       // elements per Q4_0 block (within a group)
#define Q40_NIB_TILE_DEPTH    256

// ─── INT8 quantisation for X1/X2 intermediate caches ────────────────────────
#define X12_SCALE_RANGE  10.0f
#define X12_INV_SCALE    (127.0f / X12_SCALE_RANGE)
#define X12_QUANT_SCALE  (X12_SCALE_RANGE / 127.0f)

// ─── Dimensions ──────────────────────────────────────────────────────────────
#define VECTOR_DIM            2048
#define FFN_DIM               8192

void swiglu(
    const uint8_t *W,            // Q4_0 pre-decoded [8192 rows × 1280 B]
    const uint8_t *V,            // Q4_0 pre-decoded [8192 rows × 1280 B]
    const uint8_t *W_down,       // Q4_0 pre-decoded [2048 rows × 5120 B]
    const int8_t  *x_batch,      // INT8 quantized input [2048]
    float         *out_batch,    // F32 output [2048]
    uint32_t       down_quant_mode,  // 0=Q4_0
    float          x_scale       // dequantization scale
);

#endif
