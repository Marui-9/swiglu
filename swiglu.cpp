#include "swiglu.h"
#include "sigmoid_lut.h"
#include <stdint.h>
#include <string.h>
#include <ap_int.h>
#include <ap_fixed.h>
// fxd_accum_t: 48-bit fixed-point accumulator fits exactly in one DSP48E2 P register
typedef ap_fixed<48,38> fxd_accum_t;

// ─── Dimensions ──────────────────────────────────────────────────────────────
#define VECTOR_DIM           2048
#define FFN_DIM              8192

// ─── Quantisation block sizes ─────────────────────────────────────────────────
#define Q4_K_BYTES           144

// ─── Derived constants ────────────────────────────────────────────────────────
#define WV_BLOCKS_PER_ROW    8      // VECTOR_DIM / 256
#define DOWN_BLOCKS_PER_ROW  32     // FFN_DIM    / 256
#define WV_ROW_BYTES         (WV_BLOCKS_PER_ROW   * Q4_K_BYTES)   // 1152
#define DOWN_ROW_Q4K_BYTES   (DOWN_BLOCKS_PER_ROW * Q4_K_BYTES)   // 4608

// ─── URAM-transposed layout constants ─────────────────────────────────────────
// CPU pre-decodes Q4_K headers to flat sc6/mn6 and transposes nibbles:
//   a 32-bit slice holds the nibbles of all 8 blocks of one group at element n,
//   so the MAC extracts each with a compile-time .range() — 0 LUT. (On chip the
//   tiles are BRAM: 128-bit x 64 for W/V, 32-bit x 256 per group for W_down.)
// DDR row format (same total byte count as 160-byte/block hybrid):
//   Headers: blocks_per_row * 32 B  — block-major, as read by the load functions:
//            bytes 0-1 d, 2-3 dmin, 4-7 sc6[0..3], 8-11 mn6[0..3],
//            16-19 sc6[4..7], 20-23 mn6[4..7]
//            KNOWN BUG: the host transposer (ggml-cpu.c) writes sc6[0..7] at 4-11 and
//            mn6[0..7] at 12-19 instead — see README.md, "Known bugs".
//   Nibbles: 256 * groups * 4 B     — element-major, 4 element-slices per DDR word

#define URM_HDR_BYTES        32     // 2 DDR words per block header
#define URM_WV_GROUPS        (WV_BLOCKS_PER_ROW   / 8)   // 1
#define URM_DOWN_GROUPS      (DOWN_BLOCKS_PER_ROW / 8)   // 4

// DDR words per row (totals match hybrid: 80 WV, 320 down)
#define URM_WV_HDR_WORDS     ((WV_BLOCKS_PER_ROW   * URM_HDR_BYTES) / 16)  // 16
#define URM_DOWN_HDR_WORDS   ((DOWN_BLOCKS_PER_ROW * URM_HDR_BYTES) / 16)  // 64
#define URM_WV_NIB_WORDS     (URM_NIB_ELEMS / 4)                            // 64  (4 elem-slices/DDR word)
#define URM_DOWN_NIB_WORDS   (URM_NIB_ELEMS * URM_DOWN_GROUPS / 4)          // 256 (4 group-slices/DDR word)

// Per-row DDR word totals (WV: 16 hdr + 64 nib = 80. Down: 64 hdr + 256 nib = 320.)
#define WV_ROW_WORDS         (URM_WV_HDR_WORDS   + URM_WV_NIB_WORDS)        // 80
#define DOWN_Q4K_WORDS       (URM_DOWN_HDR_WORDS + URM_DOWN_NIB_WORDS)      // 320
// ─── INT8 quantisation scale for X1/X2 intermediate caches ───────────────────
#define X12_SCALE_RANGE  10.0f
#define X12_INV_SCALE    (127.0f / X12_SCALE_RANGE)   // 12.7f
#define X12_QUANT_SCALE  (X12_SCALE_RANGE / 127.0f)   // ~0.0787f

// ─── URAM nibble tile dimensions ──────────────────────────────────────────────
#define URM_NIB_ELEMS        256
#define URM_NIB_TILE_DEPTH   256
// ─── fp16_to_fp32 ─────────────────────────────────────────────────────────────
static float fp16_to_fp32(uint16_t h) {
#pragma HLS INLINE off
    uint32_t sign = ((uint32_t)(h >> 15)) << 31;
    uint32_t exp  = (h >> 10) & 0x1F;
    uint32_t mant = (uint32_t)(h & 0x3FF);
    uint32_t f32;
    if (exp == 0 && mant == 0) {
        f32 = sign;
    } else if (exp == 0) {
        uint32_t m = mant, e = 112;
        for (int i = 0; i < 10; i++) {
            #pragma HLS UNROLL
            if (!(m & 0x200)) { m <<= 1; e--; }
        }
        f32 = sign | (e << 23) | ((m & 0x1FF) << 14);
    } else if (exp == 31) {
        f32 = sign | 0x7F800000 | (mant << 13);
    } else {
        f32 = sign | ((exp + 112) << 23) | (mant << 13);
    }
    union { uint32_t u; float f; } c; c.u = f32; return c.f;
}

// ============================================================================
// URAM-transposed load functions
// ============================================================================
// Q4_K only.  The Q6_K datapath (and its get_byte() 9:1 multiplexer tree) was
// removed: the model is quantized all-Q4_K by design, and Q6_K's 210-byte
// block (13.125 x 128-bit words) does not admit the clean 2D tile layout that
// makes compile-time .range() nibble extraction free.  The single-row WV loader
// was likewise dropped when load_4rows_wv_urm subsumed it (merged 320-word
// burst).  Software mirrors this: the graph builder and driver both accept
// Q4_K W_down only.

// load_row_down_urm: load one output row into headers + nibble BRAM tiles.
// 32 blocks = 4 groups. Headers: 64 DDR words. Nibbles: 256 DDR words.
// Each nibble DDR word = all 4 groups for one element → 4 BRAM writes at II=1.
// Sub-scales are packed 8-per-word (ap_uint<64>, byte i = sub-block i): a
// PIPO channel of 32 words is ~40 dataflow channels instead of ~1150
// element-channels (complete-partitioned int8 arrays exploded to ~77K LUT /
// ~114K FF of handshake logic as dataflow channels).  The MAC un-packs with
// a byte mux; banking by block (cyclic 8) keeps 8 reads/cycle conflict-free.
static void load_row_down_urm(const ap_uint<128> *Wd_wide, int out_i,
                               ap_uint<32> nib_g0[URM_NIB_TILE_DEPTH],
                               ap_uint<32> nib_g1[URM_NIB_TILE_DEPTH],
                               ap_uint<32> nib_g2[URM_NIB_TILE_DEPTH],
                               ap_uint<32> nib_g3[URM_NIB_TILE_DEPTH],
                               float      d[DOWN_BLOCKS_PER_ROW],
                               float      dmin[DOWN_BLOCKS_PER_ROW],
                               ap_uint<64> sc6w[DOWN_BLOCKS_PER_ROW],
                               ap_uint<64> mn6w[DOWN_BLOCKS_PER_ROW]) {
#pragma HLS INLINE off

    // ── Load headers: 32 blocks × 2 DDR words = 64 DDR words ────────────────
    LOAD_HDR_DOWN: for (int b = 0; b < DOWN_BLOCKS_PER_ROW; b++) {
        #pragma HLS PIPELINE II=1
        ap_uint<128> w0 = Wd_wide[(ap_uint<64>)out_i * DOWN_Q4K_WORDS + b * 2];
        ap_uint<128> w1 = Wd_wide[(ap_uint<64>)out_i * DOWN_Q4K_WORDS + b * 2 + 1];

        uint16_t d_raw    = (uint16_t)w0.range(15, 0);
        uint16_t dmin_raw = (uint16_t)w0.range(31, 16);
        d[b]    = fp16_to_fp32(d_raw);
        dmin[b] = fp16_to_fp32(dmin_raw);
        // byte i of sc6w = sub-scale i: lo 4 from w0[63:32], hi 4 from w1[31:0]
        sc6w[b] = (w1.range(31, 0),  w0.range(63, 32));
        mn6w[b] = (w1.range(63, 32), w0.range(95, 64));
    }

    // ── Load nibbles: 256 DDR words → 4 BRAM tiles, one element per word ────
    LOAD_NIB_DOWN: for (int e = 0; e < URM_NIB_ELEMS; e++) {
        #pragma HLS PIPELINE II=1
        ap_uint<128> ddr = Wd_wide[(ap_uint<64>)out_i * DOWN_Q4K_WORDS + URM_DOWN_HDR_WORDS + e];
        nib_g0[e] = ddr.range(31,  0);
        nib_g1[e] = ddr.range(63,  32);
        nib_g2[e] = ddr.range(95,  64);
        nib_g3[e] = ddr.range(127, 96);
    }
}

// load_4rows_wv_urm: load 4 consecutive WV rows in a single AXI burst.
// Replaces 4 × load_row_wv_urm calls → reduces 8 burst setups to 1 per outer iter.
// Address is linear: base_row*WV_ROW_WORDS + i, i in [0,319] → HLS infers 1 burst.
static void load_4rows_wv_urm(
    const ap_uint<128> *W_wide, int base_row,
    ap_uint<128> nib_r0[64], ap_uint<128> nib_r1[64],
    ap_uint<128> nib_r2[64], ap_uint<128> nib_r3[64],
    float   d0[WV_BLOCKS_PER_ROW], float   dmin0[WV_BLOCKS_PER_ROW],
    float   d1[WV_BLOCKS_PER_ROW], float   dmin1[WV_BLOCKS_PER_ROW],
    float   d2[WV_BLOCKS_PER_ROW], float   dmin2[WV_BLOCKS_PER_ROW],
    float   d3[WV_BLOCKS_PER_ROW], float   dmin3[WV_BLOCKS_PER_ROW],
    ap_uint<64> sc6w0[WV_BLOCKS_PER_ROW], ap_uint<64> mn6w0[WV_BLOCKS_PER_ROW],
    ap_uint<64> sc6w1[WV_BLOCKS_PER_ROW], ap_uint<64> mn6w1[WV_BLOCKS_PER_ROW],
    ap_uint<64> sc6w2[WV_BLOCKS_PER_ROW], ap_uint<64> mn6w2[WV_BLOCKS_PER_ROW],
    ap_uint<64> sc6w3[WV_BLOCKS_PER_ROW], ap_uint<64> mn6w3[WV_BLOCKS_PER_ROW])
{
#pragma HLS INLINE off
    // Row r: words [r*80, r*80+79] — headers [0..15], nibbles [16..79].
    // Comparison-based row decode (no division by 80).
    LOAD_4R: for (int i = 0; i < 4 * WV_ROW_WORDS; i++) {
        #pragma HLS PIPELINE II=1
        ap_uint<128> w = W_wide[(ap_uint<64>)base_row * WV_ROW_WORDS + i];

        int r   = (i >= 3 * WV_ROW_WORDS) ? 3 :
                  (i >= 2 * WV_ROW_WORDS) ? 2 :
                  (i >=     WV_ROW_WORDS) ? 1 : 0;
        int off = (r == 3) ? 3 * WV_ROW_WORDS :
                  (r == 2) ? 2 * WV_ROW_WORDS :
                  (r == 1) ?     WV_ROW_WORDS : 0;
        int pos = i - off;

        if (pos < URM_WV_HDR_WORDS) {
            int b  = pos >> 1;
            int hw = pos & 1;
            if (hw == 0) {
                // hdr word 0: d, dmin, sc6/mn6 sub-blocks 0-3 (packed lo half)
                float df    = fp16_to_fp32((uint16_t)w.range(15, 0));
                float dminf = fp16_to_fp32((uint16_t)w.range(31, 16));
                ap_uint<32> sc_lo = w.range(63, 32);
                ap_uint<32> mn_lo = w.range(95, 64);
                if      (r == 0) { d0[b]=df; dmin0[b]=dminf; sc6w0[b].range(31,0)=sc_lo; mn6w0[b].range(31,0)=mn_lo; }
                else if (r == 1) { d1[b]=df; dmin1[b]=dminf; sc6w1[b].range(31,0)=sc_lo; mn6w1[b].range(31,0)=mn_lo; }
                else if (r == 2) { d2[b]=df; dmin2[b]=dminf; sc6w2[b].range(31,0)=sc_lo; mn6w2[b].range(31,0)=mn_lo; }
                else             { d3[b]=df; dmin3[b]=dminf; sc6w3[b].range(31,0)=sc_lo; mn6w3[b].range(31,0)=mn_lo; }
            } else {
                // hdr word 1: sc6/mn6 sub-blocks 4-7 (packed hi half)
                ap_uint<32> sc_hi = w.range(31, 0);
                ap_uint<32> mn_hi = w.range(63, 32);
                if      (r == 0) { sc6w0[b].range(63,32)=sc_hi; mn6w0[b].range(63,32)=mn_hi; }
                else if (r == 1) { sc6w1[b].range(63,32)=sc_hi; mn6w1[b].range(63,32)=mn_hi; }
                else if (r == 2) { sc6w2[b].range(63,32)=sc_hi; mn6w2[b].range(63,32)=mn_hi; }
                else             { sc6w3[b].range(63,32)=sc_hi; mn6w3[b].range(63,32)=mn_hi; }
            }
        } else {
            int nidx = pos - URM_WV_HDR_WORDS;
            if      (r == 0) nib_r0[nidx] = w;
            else if (r == 1) nib_r1[nidx] = w;
            else if (r == 2) nib_r2[nidx] = w;
            else             nib_r3[nidx] = w;
        }
    }
}

// ============================================================================
// MAC functions — URAM-transposed nibble access, K=4 parallelism
// ============================================================================

// mac_blocks_wv_k4_urm: 4 rows × 8 blocks, 32 parallel MACs.  K=4.
// nib_bram[idx] = 128-bit word = 4 element-slices (same as DDR word).
// Read nib_bram[n>>2], slice the (n&3)-th 32-bit slot → 4:1 mux (~32 LUT/row).
// Inner .range(b*4+3, b*4) is compile-time → 0 LUT.
static void mac_blocks_wv_k4_urm(
    const ap_uint<128> nib_r0[64],
    const ap_uint<128> nib_r1[64],
    const ap_uint<128> nib_r2[64],
    const ap_uint<128> nib_r3[64],
    const float   d0[WV_BLOCKS_PER_ROW], const float dmin0[WV_BLOCKS_PER_ROW],
    const float   d1[WV_BLOCKS_PER_ROW], const float dmin1[WV_BLOCKS_PER_ROW],
    const float   d2[WV_BLOCKS_PER_ROW], const float dmin2[WV_BLOCKS_PER_ROW],
    const float   d3[WV_BLOCKS_PER_ROW], const float dmin3[WV_BLOCKS_PER_ROW],
    const ap_uint<64> sc6w0[WV_BLOCKS_PER_ROW], const ap_uint<64> mn6w0[WV_BLOCKS_PER_ROW],
    const ap_uint<64> sc6w1[WV_BLOCKS_PER_ROW], const ap_uint<64> mn6w1[WV_BLOCKS_PER_ROW],
    const ap_uint<64> sc6w2[WV_BLOCKS_PER_ROW], const ap_uint<64> mn6w2[WV_BLOCKS_PER_ROW],
    const ap_uint<64> sc6w3[WV_BLOCKS_PER_ROW], const ap_uint<64> mn6w3[WV_BLOCKS_PER_ROW],
    const int8_t  x[WV_BLOCKS_PER_ROW][256],
    float  x_scale,
    float *result0, float *result1, float *result2, float *result3)
{
#pragma HLS INLINE off
#pragma HLS ARRAY_PARTITION variable=x dim=1 complete

    // Un-pack the sub-scale words once into fully partitioned locals with
    // compile-time .range() (pure wiring).  Indexed reads below then cost an
    // 8:1 byte mux each; a variable shift on the 64-bit word would synthesize
    // a barrel shifter per site (~160 LUT x 64 sites ~ +10K LUT measured).
    int8_t sc0[WV_BLOCKS_PER_ROW][8], mn0[WV_BLOCKS_PER_ROW][8];
    int8_t sc1[WV_BLOCKS_PER_ROW][8], mn1[WV_BLOCKS_PER_ROW][8];
    int8_t sc2[WV_BLOCKS_PER_ROW][8], mn2[WV_BLOCKS_PER_ROW][8];
    int8_t sc3[WV_BLOCKS_PER_ROW][8], mn3[WV_BLOCKS_PER_ROW][8];
    #pragma HLS ARRAY_PARTITION variable=sc0 dim=0 complete
    #pragma HLS ARRAY_PARTITION variable=mn0 dim=0 complete
    #pragma HLS ARRAY_PARTITION variable=sc1 dim=0 complete
    #pragma HLS ARRAY_PARTITION variable=mn1 dim=0 complete
    #pragma HLS ARRAY_PARTITION variable=sc2 dim=0 complete
    #pragma HLS ARRAY_PARTITION variable=mn2 dim=0 complete
    #pragma HLS ARRAY_PARTITION variable=sc3 dim=0 complete
    #pragma HLS ARRAY_PARTITION variable=mn3 dim=0 complete
    UNPACK_SC: for (int b = 0; b < WV_BLOCKS_PER_ROW; b++) {
        #pragma HLS UNROLL
        for (int i = 0; i < 8; i++) {
            #pragma HLS UNROLL
            sc0[b][i] = (int8_t)(uint8_t)sc6w0[b].range(i*8+7, i*8);
            mn0[b][i] = (int8_t)(uint8_t)mn6w0[b].range(i*8+7, i*8);
            sc1[b][i] = (int8_t)(uint8_t)sc6w1[b].range(i*8+7, i*8);
            mn1[b][i] = (int8_t)(uint8_t)mn6w1[b].range(i*8+7, i*8);
            sc2[b][i] = (int8_t)(uint8_t)sc6w2[b].range(i*8+7, i*8);
            mn2[b][i] = (int8_t)(uint8_t)mn6w2[b].range(i*8+7, i*8);
            sc3[b][i] = (int8_t)(uint8_t)sc6w3[b].range(i*8+7, i*8);
            mn3[b][i] = (int8_t)(uint8_t)mn6w3[b].range(i*8+7, i*8);
        }
    }

    int32_t acc_w0[WV_BLOCKS_PER_ROW][4], acc_m0[WV_BLOCKS_PER_ROW][4];
    int32_t acc_w1[WV_BLOCKS_PER_ROW][4], acc_m1[WV_BLOCKS_PER_ROW][4];
    int32_t acc_w2[WV_BLOCKS_PER_ROW][4], acc_m2[WV_BLOCKS_PER_ROW][4];
    int32_t acc_w3[WV_BLOCKS_PER_ROW][4], acc_m3[WV_BLOCKS_PER_ROW][4];
    #pragma HLS ARRAY_PARTITION variable=acc_w0 dim=0 complete
    #pragma HLS ARRAY_PARTITION variable=acc_m0 dim=0 complete
    #pragma HLS ARRAY_PARTITION variable=acc_w1 dim=0 complete
    #pragma HLS ARRAY_PARTITION variable=acc_m1 dim=0 complete
    #pragma HLS ARRAY_PARTITION variable=acc_w2 dim=0 complete
    #pragma HLS ARRAY_PARTITION variable=acc_m2 dim=0 complete
    #pragma HLS ARRAY_PARTITION variable=acc_w3 dim=0 complete
    #pragma HLS ARRAY_PARTITION variable=acc_m3 dim=0 complete

    INIT: for (int b = 0; b < WV_BLOCKS_PER_ROW; b++) {
        #pragma HLS UNROLL
        for (int k = 0; k < 4; k++) {
            #pragma HLS UNROLL
            acc_w0[b][k] = 0; acc_m0[b][k] = 0;
            acc_w1[b][k] = 0; acc_m1[b][k] = 0;
            acc_w2[b][k] = 0; acc_m2[b][k] = 0;
            acc_w3[b][k] = 0; acc_m3[b][k] = 0;
        }
    }

    MAC_ALL: for (int n = 0; n < 256; n++) {
        #pragma HLS PIPELINE II=1
        int idx = n >> 2;          // BRAM index (same for 4 consecutive n)
        int s   = n & 3;           // slice selector (0..3)
        int sub = n >> 5;
        int k   = n & 3;

        // Read 128-bit word, slice the correct 32-bit slot — 4:1 mux
        ap_uint<128> w0 = nib_r0[idx];
        ap_uint<128> w1 = nib_r1[idx];
        ap_uint<128> w2 = nib_r2[idx];
        ap_uint<128> w3 = nib_r3[idx];

        ap_uint<32> wr0, wr1, wr2, wr3;
        if      (s == 0) { wr0 = w0.range(31,  0);  wr1 = w1.range(31,  0);  wr2 = w2.range(31,  0);  wr3 = w3.range(31,  0);  }
        else if (s == 1) { wr0 = w0.range(63,  32); wr1 = w1.range(63,  32); wr2 = w2.range(63,  32); wr3 = w3.range(63,  32); }
        else if (s == 2) { wr0 = w0.range(95,  64); wr1 = w1.range(95,  64); wr2 = w2.range(95,  64); wr3 = w3.range(95,  64); }
        else             { wr0 = w0.range(127, 96); wr1 = w1.range(127, 96); wr2 = w2.range(127, 96); wr3 = w3.range(127, 96); }

        for (int b = 0; b < WV_BLOCKS_PER_ROW; b++) {
            #pragma HLS UNROLL
            ap_int<8>  xi8 = (ap_int<8>)  x[b][n];
            ap_uint<4> nb0 = (ap_uint<4>) wr0.range(b*4+3, b*4);
            ap_uint<4> nb1 = (ap_uint<4>) wr1.range(b*4+3, b*4);
            ap_uint<4> nb2 = (ap_uint<4>) wr2.range(b*4+3, b*4);
            ap_uint<4> nb3 = (ap_uint<4>) wr3.range(b*4+3, b*4);
            // this sub-block's scale/min byte (8:1 byte mux on partitioned regs)
            int8_t s0 = sc0[b][sub];
            int8_t m0 = mn0[b][sub];
            int8_t s1 = sc1[b][sub];
            int8_t m1 = mn1[b][sub];
            int8_t s2 = sc2[b][sub];
            int8_t m2 = mn2[b][sub];
            int8_t s3 = sc3[b][sub];
            int8_t m3 = mn3[b][sub];

            // Compute contributions once, then distribute via data mux across all
            // 4 k-slots.  Replaces CE-gated writes (high-fanout iter counter → 1024
            // CE pins) with local 2:1 muxes before each adder — eliminates the
            // iter6_reg fanout that prevented timing closure.
            int32_t cw0 = (int32_t)(xi8 * (ap_int<5>)nb0 * s0);
            int32_t cm0 = (int32_t)(xi8 * m0);
            int32_t cw1 = (int32_t)(xi8 * (ap_int<5>)nb1 * s1);
            int32_t cm1 = (int32_t)(xi8 * m1);
            int32_t cw2 = (int32_t)(xi8 * (ap_int<5>)nb2 * s2);
            int32_t cm2 = (int32_t)(xi8 * m2);
            int32_t cw3 = (int32_t)(xi8 * (ap_int<5>)nb3 * s3);
            int32_t cm3 = (int32_t)(xi8 * m3);
            for (int ki = 0; ki < 4; ki++) {
                #pragma HLS UNROLL
                acc_w0[b][ki] += (ki == k) ? cw0 : 0;
                acc_m0[b][ki] += (ki == k) ? cm0 : 0;
                acc_w1[b][ki] += (ki == k) ? cw1 : 0;
                acc_m1[b][ki] += (ki == k) ? cm1 : 0;
                acc_w2[b][ki] += (ki == k) ? cw2 : 0;
                acc_m2[b][ki] += (ki == k) ? cm2 : 0;
                acc_w3[b][ki] += (ki == k) ? cw3 : 0;
                acc_m3[b][ki] += (ki == k) ? cm3 : 0;
            }
        }
    }

    fxd_accum_t total0 = 0, total1 = 0, total2 = 0, total3 = 0;
    REDUCE: for (int b = 0; b < WV_BLOCKS_PER_ROW; b++) {
        int32_t sw0 = 0, sm0 = 0, sw1 = 0, sm1 = 0;
        int32_t sw2 = 0, sm2 = 0, sw3 = 0, sm3 = 0;
        for (int k = 0; k < 4; k++) {
            #pragma HLS UNROLL
            sw0 += acc_w0[b][k]; sm0 += acc_m0[b][k];
            sw1 += acc_w1[b][k]; sm1 += acc_m1[b][k];
            sw2 += acc_w2[b][k]; sm2 += acc_m2[b][k];
            sw3 += acc_w3[b][k]; sm3 += acc_m3[b][k];
        }
        total0 += (fxd_accum_t)(d0[b]    * (float)sw0 - dmin0[b] * (float)sm0);
        total1 += (fxd_accum_t)(d1[b]    * (float)sw1 - dmin1[b] * (float)sm1);
        total2 += (fxd_accum_t)(d2[b]    * (float)sw2 - dmin2[b] * (float)sm2);
        total3 += (fxd_accum_t)(d3[b]    * (float)sw3 - dmin3[b] * (float)sm3);
    }
    *result0 = (float)total0 * x_scale;
    *result1 = (float)total1 * x_scale;
    *result2 = (float)total2 * x_scale;
    *result3 = (float)total3 * x_scale;
}



// mac_blocks_down_q4k_k2_urm: 32 blocks, 4-groups × 2-rows K=2.
// 8 nibble tiles (4 groups × 2 rows).  Within each group, 2 rows are
// UNROLL'd → 16 parallel MACs (8 blocks × 2 rows).  4 groups sequential →
// 1245 cy per 2-row iteration (csynth).  Derived from the K=4 version (rows
// 2/3 deleted): K=4's 4-row load (~1908 cy) is longer than its MAC (1243 cy),
// so the wider array would idle even when overlapped — K=2 frees its LUTs.
// Direct CE accumulation idiom preserved (exists for timing closure).
static void mac_blocks_down_q4k_k2_urm(
    const ap_uint<32> g0r0[URM_NIB_TILE_DEPTH], const ap_uint<32> g0r1[URM_NIB_TILE_DEPTH],
    const ap_uint<32> g1r0[URM_NIB_TILE_DEPTH], const ap_uint<32> g1r1[URM_NIB_TILE_DEPTH],
    const ap_uint<32> g2r0[URM_NIB_TILE_DEPTH], const ap_uint<32> g2r1[URM_NIB_TILE_DEPTH],
    const ap_uint<32> g3r0[URM_NIB_TILE_DEPTH], const ap_uint<32> g3r1[URM_NIB_TILE_DEPTH],
    // Headers: 2 rows × 32 blocks (sub-scales packed 8-per-word)
    const float  d0[DOWN_BLOCKS_PER_ROW], const float  dmin0[DOWN_BLOCKS_PER_ROW],
    const float  d1[DOWN_BLOCKS_PER_ROW], const float  dmin1[DOWN_BLOCKS_PER_ROW],
    const ap_uint<64> sc6w0[DOWN_BLOCKS_PER_ROW], const ap_uint<64> mn6w0[DOWN_BLOCKS_PER_ROW],
    const ap_uint<64> sc6w1[DOWN_BLOCKS_PER_ROW], const ap_uint<64> mn6w1[DOWN_BLOCKS_PER_ROW],
    const int8_t gate[DOWN_BLOCKS_PER_ROW][256],
    float  gate_scale,
    float *result0, float *result1)
{
#pragma HLS INLINE off
#pragma HLS ARRAY_PARTITION variable=gate dim=1 complete

    // Un-pack sub-scale words once (compile-time .range(), pure wiring) —
    // variable shifts would build a barrel shifter per site; see WV MAC note.
    int8_t sc0[DOWN_BLOCKS_PER_ROW][8], mn0[DOWN_BLOCKS_PER_ROW][8];
    int8_t sc1[DOWN_BLOCKS_PER_ROW][8], mn1[DOWN_BLOCKS_PER_ROW][8];
    #pragma HLS ARRAY_PARTITION variable=sc0 dim=0 complete
    #pragma HLS ARRAY_PARTITION variable=mn0 dim=0 complete
    #pragma HLS ARRAY_PARTITION variable=sc1 dim=0 complete
    #pragma HLS ARRAY_PARTITION variable=mn1 dim=0 complete
    UNPACK_SC: for (int b = 0; b < DOWN_BLOCKS_PER_ROW; b++) {
        #pragma HLS UNROLL
        for (int i = 0; i < 8; i++) {
            #pragma HLS UNROLL
            sc0[b][i] = (int8_t)(uint8_t)sc6w0[b].range(i*8+7, i*8);
            mn0[b][i] = (int8_t)(uint8_t)mn6w0[b].range(i*8+7, i*8);
            sc1[b][i] = (int8_t)(uint8_t)sc6w1[b].range(i*8+7, i*8);
            mn1[b][i] = (int8_t)(uint8_t)mn6w1[b].range(i*8+7, i*8);
        }
    }

    fxd_accum_t total0 = 0, total1 = 0;

    // 4 groups sequential (share DSPs), 2 rows UNROLL'd per group
    DOWN_GROUPS: for (int grp = 0; grp < 4; grp++) {
        int32_t acc_w0[8][4], acc_m0[8][4];
        int32_t acc_w1[8][4], acc_m1[8][4];
        #pragma HLS ARRAY_PARTITION variable=acc_w0 dim=0 complete
        #pragma HLS ARRAY_PARTITION variable=acc_m0 dim=0 complete
        #pragma HLS ARRAY_PARTITION variable=acc_w1 dim=0 complete
        #pragma HLS ARRAY_PARTITION variable=acc_m1 dim=0 complete

        INIT_GRP: for (int b = 0; b < 8; b++) {
            #pragma HLS UNROLL
            for (int k = 0; k < 4; k++) {
                #pragma HLS UNROLL
                acc_w0[b][k] = 0; acc_m0[b][k] = 0;
                acc_w1[b][k] = 0; acc_m1[b][k] = 0;
            }
        }

        MAC_GRP: for (int n = 0; n < 256; n++) {
            #pragma HLS PIPELINE II=1
            // Per-row copies of index regs to limit fanout across 2 row paths
            int sub[2], k[2];
            #pragma HLS ARRAY_PARTITION variable=sub complete
            #pragma HLS ARRAY_PARTITION variable=k complete
            for (int r = 0; r < 2; r++) {
                #pragma HLS UNROLL
                sub[r] = n >> 5;
                k[r]   = n & 3;
            }

            ap_uint<32> w0, w1;
            if      (grp == 0) { w0 = g0r0[n]; w1 = g0r1[n]; }
            else if (grp == 1) { w0 = g1r0[n]; w1 = g1r1[n]; }
            else if (grp == 2) { w0 = g2r0[n]; w1 = g2r1[n]; }
            else               { w0 = g3r0[n]; w1 = g3r1[n]; }

            for (int b = 0; b < 8; b++) {
                #pragma HLS UNROLL
                int babs = grp * 8 + b;
                ap_int<8>  gi8  = (ap_int<8>)  gate[babs][n];
                ap_uint<4> nb0  = (ap_uint<4>) w0.range(b*4+3, b*4);
                ap_uint<4> nb1  = (ap_uint<4>) w1.range(b*4+3, b*4);
                // this sub-block's scale/min byte (8:1 byte mux on partitioned regs)
                int8_t s0 = sc0[babs][sub[0]];
                int8_t m0 = mn0[babs][sub[0]];
                int8_t s1 = sc1[babs][sub[1]];
                int8_t m1 = mn1[babs][sub[1]];

                int32_t cw0 = (int32_t)(gi8 * (ap_int<5>)nb0 * s0);
                int32_t cm0 = (int32_t)(gi8 * m0);
                int32_t cw1 = (int32_t)(gi8 * (ap_int<5>)nb1 * s1);
                int32_t cm1 = (int32_t)(gi8 * m1);
                acc_w0[b][k[0]] += cw0;  acc_m0[b][k[0]] += cm0;
                acc_w1[b][k[1]] += cw1;  acc_m1[b][k[1]] += cm1;
            }
        }

        REDUCE_GRP: for (int b = 0; b < 8; b++) {
            int babs = grp * 8 + b;
            int32_t sw0 = 0, sm0 = 0, sw1 = 0, sm1 = 0;
            for (int k = 0; k < 4; k++) {
                #pragma HLS UNROLL
                sw0 += acc_w0[b][k]; sm0 += acc_m0[b][k];
                sw1 += acc_w1[b][k]; sm1 += acc_m1[b][k];
            }
            total0 += (fxd_accum_t)(d0[babs] * (float)sw0 - dmin0[babs] * (float)sm0);
            total1 += (fxd_accum_t)(d1[babs] * (float)sw1 - dmin1[babs] * (float)sm1);
        }
    }
    *result0 = (float)total0 * gate_scale;
    *result1 = (float)total1 * gate_scale;
}

// load_2rows_down: DATAFLOW producer — fills 2 rows' nibble tiles + headers.
// Two sequential per-row bursts (the 4-way group split of the down layout
// precludes a merged multi-row burst; see load_row_down_urm).
static void load_2rows_down(
    const ap_uint<128> *Wd_wide, int out_i,
    ap_uint<32> g0r0[URM_NIB_TILE_DEPTH], ap_uint<32> g1r0[URM_NIB_TILE_DEPTH],
    ap_uint<32> g2r0[URM_NIB_TILE_DEPTH], ap_uint<32> g3r0[URM_NIB_TILE_DEPTH],
    ap_uint<32> g0r1[URM_NIB_TILE_DEPTH], ap_uint<32> g1r1[URM_NIB_TILE_DEPTH],
    ap_uint<32> g2r1[URM_NIB_TILE_DEPTH], ap_uint<32> g3r1[URM_NIB_TILE_DEPTH],
    float d0[DOWN_BLOCKS_PER_ROW], float dmin0[DOWN_BLOCKS_PER_ROW],
    float d1[DOWN_BLOCKS_PER_ROW], float dmin1[DOWN_BLOCKS_PER_ROW],
    ap_uint<64> sc6w0[DOWN_BLOCKS_PER_ROW], ap_uint<64> mn6w0[DOWN_BLOCKS_PER_ROW],
    ap_uint<64> sc6w1[DOWN_BLOCKS_PER_ROW], ap_uint<64> mn6w1[DOWN_BLOCKS_PER_ROW])
{
#pragma HLS INLINE off
    load_row_down_urm(Wd_wide, out_i,     g0r0, g1r0, g2r0, g3r0, d0, dmin0, sc6w0, mn6w0);
    load_row_down_urm(Wd_wide, out_i + 1, g0r1, g1r1, g2r1, g3r1, d1, dmin1, sc6w1, mn6w1);
}

// mac_write_down: DATAFLOW consumer — K=2 MAC + write 2 results to out_local.
static void mac_write_down(
    const ap_uint<32> g0r0[URM_NIB_TILE_DEPTH], const ap_uint<32> g0r1[URM_NIB_TILE_DEPTH],
    const ap_uint<32> g1r0[URM_NIB_TILE_DEPTH], const ap_uint<32> g1r1[URM_NIB_TILE_DEPTH],
    const ap_uint<32> g2r0[URM_NIB_TILE_DEPTH], const ap_uint<32> g2r1[URM_NIB_TILE_DEPTH],
    const ap_uint<32> g3r0[URM_NIB_TILE_DEPTH], const ap_uint<32> g3r1[URM_NIB_TILE_DEPTH],
    const float  d0[DOWN_BLOCKS_PER_ROW], const float  dmin0[DOWN_BLOCKS_PER_ROW],
    const float  d1[DOWN_BLOCKS_PER_ROW], const float  dmin1[DOWN_BLOCKS_PER_ROW],
    const ap_uint<64> sc6w0[DOWN_BLOCKS_PER_ROW], const ap_uint<64> mn6w0[DOWN_BLOCKS_PER_ROW],
    const ap_uint<64> sc6w1[DOWN_BLOCKS_PER_ROW], const ap_uint<64> mn6w1[DOWN_BLOCKS_PER_ROW],
    const int8_t gate[DOWN_BLOCKS_PER_ROW][256],
    float gate_scale,
    float out_local[VECTOR_DIM], int out_i)
{
#pragma HLS INLINE off
    float r0, r1;
    mac_blocks_down_q4k_k2_urm(g0r0, g0r1, g1r0, g1r1, g2r0, g2r1, g3r0, g3r1,
                               d0, dmin0, d1, dmin1, sc6w0, mn6w0, sc6w1, mn6w1,
                               gate, gate_scale, &r0, &r1);
    out_local[out_i]     = r0;
    out_local[out_i + 1] = r1;
}

// ============================================================================
// Phase 2 & 3: X1 = x @ W.T  and  X2 = x @ V.T  (Q4_K, K=4, URAM)
// ============================================================================

// mac_quant_wv: DATAFLOW consumer — K=4 MAC + quantize 4 results to INT8.
static void mac_quant_wv(
    const ap_uint<128> nib_r0[64], const ap_uint<128> nib_r1[64],
    const ap_uint<128> nib_r2[64], const ap_uint<128> nib_r3[64],
    const float d0[WV_BLOCKS_PER_ROW], const float dmin0[WV_BLOCKS_PER_ROW],
    const float d1[WV_BLOCKS_PER_ROW], const float dmin1[WV_BLOCKS_PER_ROW],
    const float d2[WV_BLOCKS_PER_ROW], const float dmin2[WV_BLOCKS_PER_ROW],
    const float d3[WV_BLOCKS_PER_ROW], const float dmin3[WV_BLOCKS_PER_ROW],
    const ap_uint<64> sc6w0[WV_BLOCKS_PER_ROW], const ap_uint<64> mn6w0[WV_BLOCKS_PER_ROW],
    const ap_uint<64> sc6w1[WV_BLOCKS_PER_ROW], const ap_uint<64> mn6w1[WV_BLOCKS_PER_ROW],
    const ap_uint<64> sc6w2[WV_BLOCKS_PER_ROW], const ap_uint<64> mn6w2[WV_BLOCKS_PER_ROW],
    const ap_uint<64> sc6w3[WV_BLOCKS_PER_ROW], const ap_uint<64> mn6w3[WV_BLOCKS_PER_ROW],
    const int8_t x[WV_BLOCKS_PER_ROW][256],
    float x_scale,
    int8_t Xc[FFN_DIM], int row)
{
#pragma HLS INLINE off
    float r0, r1, r2, r3;
    mac_blocks_wv_k4_urm(
        nib_r0, nib_r1, nib_r2, nib_r3,
        d0, dmin0, d1, dmin1, d2, dmin2, d3, dmin3,
        sc6w0, mn6w0, sc6w1, mn6w1, sc6w2, mn6w2, sc6w3, mn6w3,
        x, x_scale, &r0, &r1, &r2, &r3);

    // Quantize 4 results to INT8
    float fq0 = r0 * X12_INV_SCALE;
    int   iq0 = (int)(fq0 + (fq0 >= 0.f ? 0.5f : -0.5f));
    if (iq0 >  127) iq0 =  127; if (iq0 < -128) iq0 = -128;
    Xc[row]     = (int8_t)iq0;

    float fq1 = r1 * X12_INV_SCALE;
    int   iq1 = (int)(fq1 + (fq1 >= 0.f ? 0.5f : -0.5f));
    if (iq1 >  127) iq1 =  127; if (iq1 < -128) iq1 = -128;
    Xc[row + 1] = (int8_t)iq1;

    float fq2 = r2 * X12_INV_SCALE;
    int   iq2 = (int)(fq2 + (fq2 >= 0.f ? 0.5f : -0.5f));
    if (iq2 >  127) iq2 =  127; if (iq2 < -128) iq2 = -128;
    Xc[row + 2] = (int8_t)iq2;

    float fq3 = r3 * X12_INV_SCALE;
    int   iq3 = (int)(fq3 + (fq3 >= 0.f ? 0.5f : -0.5f));
    if (iq3 >  127) iq3 =  127; if (iq3 < -128) iq3 = -128;
    Xc[row + 3] = (int8_t)iq3;
}

static void compute_X1(
    const uint8_t  *W,
    const int8_t   x_local_1[MAX_BATCH][WV_BLOCKS_PER_ROW][256],
    float          x_scale,
    int8_t         X1_cache[MAX_BATCH][FFN_DIM])
{
#pragma HLS INLINE off
#pragma HLS ARRAY_PARTITION variable=x_local_1 dim=2 complete
    const ap_uint<128> *W_wide = (const ap_uint<128>*)W;

    // Loop-body DATAFLOW: the tile/header buffers declared in the body become
    // PIPO channels between load_4rows_wv_urm (producer) and mac_quant_wv
    // (consumer), so iteration N's 320-word burst overlaps iteration N-1's
    // MAC: per-iteration time -> max(load II 320, MAC 347) = 348 cy (csynth)
    // instead of the sum.
    COMPUTE_X1: for (int row = 0; row < FFN_DIM; row += 4) {
        #pragma HLS DATAFLOW
        // 4 rows × 1 wide BRAM each = 4 × 128-bit × 64 deep (PIPO-doubled)
        ap_uint<128> nib_r0[64], nib_r1[64], nib_r2[64], nib_r3[64];
        #pragma HLS BIND_STORAGE variable=nib_r0 type=ram_1p impl=bram
        #pragma HLS BIND_STORAGE variable=nib_r1 type=ram_1p impl=bram
        #pragma HLS BIND_STORAGE variable=nib_r2 type=ram_1p impl=bram
        #pragma HLS BIND_STORAGE variable=nib_r3 type=ram_1p impl=bram

        // Headers: sub-scales packed 8-per-word (see load_row_down_urm note);
        // banked per block for the MAC's 8 reads/cycle.  d/dmin are read
        // sequentially in the reduce, so they need no partitioning.
        float  d0[WV_BLOCKS_PER_ROW], dmin0[WV_BLOCKS_PER_ROW];
        float  d1[WV_BLOCKS_PER_ROW], dmin1[WV_BLOCKS_PER_ROW];
        float  d2[WV_BLOCKS_PER_ROW], dmin2[WV_BLOCKS_PER_ROW];
        float  d3[WV_BLOCKS_PER_ROW], dmin3[WV_BLOCKS_PER_ROW];
        ap_uint<64> sc6w0[WV_BLOCKS_PER_ROW], mn6w0[WV_BLOCKS_PER_ROW];
        ap_uint<64> sc6w1[WV_BLOCKS_PER_ROW], mn6w1[WV_BLOCKS_PER_ROW];
        ap_uint<64> sc6w2[WV_BLOCKS_PER_ROW], mn6w2[WV_BLOCKS_PER_ROW];
        ap_uint<64> sc6w3[WV_BLOCKS_PER_ROW], mn6w3[WV_BLOCKS_PER_ROW];
        #pragma HLS ARRAY_PARTITION variable=sc6w0 dim=1 complete
        #pragma HLS ARRAY_PARTITION variable=mn6w0 dim=1 complete
        #pragma HLS ARRAY_PARTITION variable=sc6w1 dim=1 complete
        #pragma HLS ARRAY_PARTITION variable=mn6w1 dim=1 complete
        #pragma HLS ARRAY_PARTITION variable=sc6w2 dim=1 complete
        #pragma HLS ARRAY_PARTITION variable=mn6w2 dim=1 complete
        #pragma HLS ARRAY_PARTITION variable=sc6w3 dim=1 complete
        #pragma HLS ARRAY_PARTITION variable=mn6w3 dim=1 complete

        load_4rows_wv_urm(W_wide, row,
                          nib_r0, nib_r1, nib_r2, nib_r3,
                          d0, dmin0, d1, dmin1, d2, dmin2, d3, dmin3,
                          sc6w0, mn6w0, sc6w1, mn6w1, sc6w2, mn6w2, sc6w3, mn6w3);
        mac_quant_wv(nib_r0, nib_r1, nib_r2, nib_r3,
                     d0, dmin0, d1, dmin1, d2, dmin2, d3, dmin3,
                     sc6w0, mn6w0, sc6w1, mn6w1, sc6w2, mn6w2, sc6w3, mn6w3,
                     x_local_1[0], x_scale, X1_cache[0], row);
    }
}

static void compute_X2(
    const uint8_t  *V,
    const int8_t   x_local_2[MAX_BATCH][WV_BLOCKS_PER_ROW][256],
    float          x_scale,
    int8_t         X2_cache[MAX_BATCH][FFN_DIM])
{
#pragma HLS INLINE off
#pragma HLS ARRAY_PARTITION variable=x_local_2 dim=2 complete
    const ap_uint<128> *V_wide = (const ap_uint<128>*)V;

    // Loop-body DATAFLOW — see COMPUTE_X1.
    COMPUTE_X2: for (int row = 0; row < FFN_DIM; row += 4) {
        #pragma HLS DATAFLOW
        ap_uint<128> nib_r0[64], nib_r1[64], nib_r2[64], nib_r3[64];
        #pragma HLS BIND_STORAGE variable=nib_r0 type=ram_1p impl=bram
        #pragma HLS BIND_STORAGE variable=nib_r1 type=ram_1p impl=bram
        #pragma HLS BIND_STORAGE variable=nib_r2 type=ram_1p impl=bram
        #pragma HLS BIND_STORAGE variable=nib_r3 type=ram_1p impl=bram

        float  d0[WV_BLOCKS_PER_ROW], dmin0[WV_BLOCKS_PER_ROW];
        float  d1[WV_BLOCKS_PER_ROW], dmin1[WV_BLOCKS_PER_ROW];
        float  d2[WV_BLOCKS_PER_ROW], dmin2[WV_BLOCKS_PER_ROW];
        float  d3[WV_BLOCKS_PER_ROW], dmin3[WV_BLOCKS_PER_ROW];
        ap_uint<64> sc6w0[WV_BLOCKS_PER_ROW], mn6w0[WV_BLOCKS_PER_ROW];
        ap_uint<64> sc6w1[WV_BLOCKS_PER_ROW], mn6w1[WV_BLOCKS_PER_ROW];
        ap_uint<64> sc6w2[WV_BLOCKS_PER_ROW], mn6w2[WV_BLOCKS_PER_ROW];
        ap_uint<64> sc6w3[WV_BLOCKS_PER_ROW], mn6w3[WV_BLOCKS_PER_ROW];
        #pragma HLS ARRAY_PARTITION variable=sc6w0 dim=1 complete
        #pragma HLS ARRAY_PARTITION variable=mn6w0 dim=1 complete
        #pragma HLS ARRAY_PARTITION variable=sc6w1 dim=1 complete
        #pragma HLS ARRAY_PARTITION variable=mn6w1 dim=1 complete
        #pragma HLS ARRAY_PARTITION variable=sc6w2 dim=1 complete
        #pragma HLS ARRAY_PARTITION variable=mn6w2 dim=1 complete
        #pragma HLS ARRAY_PARTITION variable=sc6w3 dim=1 complete
        #pragma HLS ARRAY_PARTITION variable=mn6w3 dim=1 complete

        load_4rows_wv_urm(V_wide, row,
                          nib_r0, nib_r1, nib_r2, nib_r3,
                          d0, dmin0, d1, dmin1, d2, dmin2, d3, dmin3,
                          sc6w0, mn6w0, sc6w1, mn6w1, sc6w2, mn6w2, sc6w3, mn6w3);
        mac_quant_wv(nib_r0, nib_r1, nib_r2, nib_r3,
                     d0, dmin0, d1, dmin1, d2, dmin2, d3, dmin3,
                     sc6w0, mn6w0, sc6w1, mn6w1, sc6w2, mn6w2, sc6w3, mn6w3,
                     x_local_2[0], x_scale, X2_cache[0], row);
    }
}

// ─── Phase 4: gate[n][b][elem] = SiLU(X1[n][j]) × X2[n][j], quantized to INT8 ──
// (unchanged from hybrid K=2)
static void compute_gate(
    const int8_t X1_cache[MAX_BATCH][FFN_DIM],
    const int8_t X2_cache[MAX_BATCH][FFN_DIM],
    int8_t       gate_cache[MAX_BATCH][DOWN_BLOCKS_PER_ROW][256],
    float        gate_scale_out[MAX_BATCH])
{
#pragma HLS INLINE off
    SWISH_GATE: for (int n = 0; n < MAX_BATCH; n++) {
        #pragma HLS UNROLL
        float pmax[8] = {0.f,0.f,0.f,0.f,0.f,0.f,0.f,0.f};
        #pragma HLS ARRAY_PARTITION variable=pmax complete

        GATE_PASS1: for (int j = 0; j < FFN_DIM; j++) {
            #pragma HLS PIPELINE II=1
            float z      = (float)X1_cache[n][j] * X12_QUANT_SCALE;
            float x2     = (float)X2_cache[n][j] * X12_QUANT_SCALE;
            float scaled = (z + 8.0f) * 256.0f;
            int   idx    = (int)scaled;
            if (idx < 0)    idx = 0;
            if (idx > 4095) idx = 4095;
            float g      = z * sigmoid_lut[idx] * x2;
            float abs_g  = g < 0.f ? -g : g;
            if (abs_g > pmax[j & 7]) pmax[j & 7] = abs_g;
        }

        float max_abs = 0.f;
        for (int k = 0; k < 8; k++) {
            #pragma HLS UNROLL
            if (pmax[k] > max_abs) max_abs = pmax[k];
        }
        float gs     = (max_abs > 0.f) ? (max_abs / 127.0f) : 1.0f;
        float inv_gs = 1.0f / gs;
        gate_scale_out[n] = gs;

        GATE_PASS2: for (int j = 0; j < FFN_DIM; j++) {
            #pragma HLS PIPELINE II=1
            float z      = (float)X1_cache[n][j] * X12_QUANT_SCALE;
            float x2     = (float)X2_cache[n][j] * X12_QUANT_SCALE;
            float scaled = (z + 8.0f) * 256.0f;
            int   idx    = (int)scaled;
            if (idx < 0)    idx = 0;
            if (idx > 4095) idx = 4095;
            float g      = z * sigmoid_lut[idx] * x2;
            float fq     = g * inv_gs;
            int   iq     = (int)(fq + (fq >= 0.f ? 0.5f : -0.5f));
            if (iq >  127) iq =  127;
            if (iq < -128) iq = -128;
            gate_cache[n][j >> 8][j & 255] = (int8_t)iq;
        }
    }
}

// ============================================================================
// Phase 5: output = gate @ W_down.T  (Q4_K, K=2, 8 BRAM tiles, overlapped)
// ============================================================================
// 2 rows per iteration, loop-body DATAFLOW: load_2rows_down (producer) and
// mac_write_down (consumer) run concurrently on PIPO-doubled tiles, so
// iteration N's load hides behind iteration N-1's MAC.
// csynth: load 960 cy/2 rows.  MAC: 4 groups sequential × 2 rows UNROLL'd =
// 1248 cy.  Overlapped: 1249 cy/2-rows × 1024 iters, plus the 2051-cy
// output write → 1,282,062 cy total.
static void compute_output(
    const uint8_t  *W_down,
    const int8_t   gate_cache[MAX_BATCH][DOWN_BLOCKS_PER_ROW][256],
    const float    gate_scale_array[MAX_BATCH],
    float         *out_batch,
    uint32_t       down_quant_mode)
{
#pragma HLS INLINE off
#pragma HLS ARRAY_PARTITION variable=gate_cache dim=2 cyclic factor=8

    const ap_uint<128> *W_down_wide = (const ap_uint<128>*)W_down;
    float gate_scale_buf[1];
    #pragma HLS BIND_STORAGE variable=gate_scale_buf type=ram_1p impl=lutram
    gate_scale_buf[0] = gate_scale_array[0];
    float gate_scale = gate_scale_buf[0];

    // Guard retained deliberately, though mode is always 0: it is the only
    // remaining use of down_quant_mode, and an unreferenced scalar argument
    // would be optimized away — shifting x_scale's AXI-Lite offset (0x54) and
    // silently breaking the driver's register map.  The driver rejects any
    // non-Q4_K W_down, so the false branch is unreachable.
    if (down_quant_mode == 0) {
        float out_local[VECTOR_DIM];
        #pragma HLS BIND_STORAGE variable=out_local type=ram_1p impl=bram

        // K=2 rows/iteration + loop-body DATAFLOW.  The tile/header arrays
        // declared inside the body become ping-pong (PIPO) channels between
        // load_2rows_down (producer) and mac_write_down (consumer), so
        // iteration N's DDR load overlaps iteration N-1's MAC:
        // per-iteration time -> max(load 960, MAC 1248) instead of the sum.
        DOWN_Q4K: for (int out_i = 0; out_i < VECTOR_DIM; out_i += 2) {
            #pragma HLS DATAFLOW
            // 4 groups × 2 rows = 8 BRAM nibble tiles (PIPO-doubled by HLS)
            ap_uint<32> g0r0[URM_NIB_TILE_DEPTH], g0r1[URM_NIB_TILE_DEPTH];
            ap_uint<32> g1r0[URM_NIB_TILE_DEPTH], g1r1[URM_NIB_TILE_DEPTH];
            ap_uint<32> g2r0[URM_NIB_TILE_DEPTH], g2r1[URM_NIB_TILE_DEPTH];
            ap_uint<32> g3r0[URM_NIB_TILE_DEPTH], g3r1[URM_NIB_TILE_DEPTH];
            #pragma HLS BIND_STORAGE variable=g0r0 type=ram_1p impl=bram
            #pragma HLS BIND_STORAGE variable=g0r1 type=ram_1p impl=bram
            #pragma HLS BIND_STORAGE variable=g1r0 type=ram_1p impl=bram
            #pragma HLS BIND_STORAGE variable=g1r1 type=ram_1p impl=bram
            #pragma HLS BIND_STORAGE variable=g2r0 type=ram_1p impl=bram
            #pragma HLS BIND_STORAGE variable=g2r1 type=ram_1p impl=bram
            #pragma HLS BIND_STORAGE variable=g3r0 type=ram_1p impl=bram
            #pragma HLS BIND_STORAGE variable=g3r1 type=ram_1p impl=bram

            // Headers: 2 rows × 32 blocks.  Sub-scales packed 8-per-word so
            // each array is ~8 PIPO channels (banked by block for the MAC's
            // 8 reads/cycle), not 256 element-channels.  d/dmin are read
            // sequentially in the reduce, so they need no partitioning.
            float  d0[DOWN_BLOCKS_PER_ROW], dmin0[DOWN_BLOCKS_PER_ROW];
            float  d1[DOWN_BLOCKS_PER_ROW], dmin1[DOWN_BLOCKS_PER_ROW];
            ap_uint<64> sc6w0[DOWN_BLOCKS_PER_ROW], mn6w0[DOWN_BLOCKS_PER_ROW];
            ap_uint<64> sc6w1[DOWN_BLOCKS_PER_ROW], mn6w1[DOWN_BLOCKS_PER_ROW];
            #pragma HLS ARRAY_PARTITION variable=sc6w0 dim=1 cyclic factor=8
            #pragma HLS ARRAY_PARTITION variable=mn6w0 dim=1 cyclic factor=8
            #pragma HLS ARRAY_PARTITION variable=sc6w1 dim=1 cyclic factor=8
            #pragma HLS ARRAY_PARTITION variable=mn6w1 dim=1 cyclic factor=8

            load_2rows_down(W_down_wide, out_i,
                            g0r0, g1r0, g2r0, g3r0,
                            g0r1, g1r1, g2r1, g3r1,
                            d0, dmin0, d1, dmin1,
                            sc6w0, mn6w0, sc6w1, mn6w1);
            mac_write_down(g0r0, g0r1, g1r0, g1r1, g2r0, g2r1, g3r0, g3r1,
                           d0, dmin0, d1, dmin1, sc6w0, mn6w0, sc6w1, mn6w1,
                           gate_cache[0], gate_scale,
                           out_local, out_i);
        }
        memcpy(out_batch, out_local, VECTOR_DIM * sizeof(float));
    }
}

// ─── Phase 1: Load x_batch into dual x_local BRAMs ───────────────────────────
static void load_x_local(
    const int8_t  *x_batch,
    int8_t        x_local_1[MAX_BATCH][WV_BLOCKS_PER_ROW][256],
    int8_t        x_local_2[MAX_BATCH][WV_BLOCKS_PER_ROW][256])
{
#pragma HLS INLINE off
#pragma HLS ARRAY_PARTITION variable=x_local_1 dim=2 complete
#pragma HLS ARRAY_PARTITION variable=x_local_2 dim=2 complete
    const ap_uint<128> *x_wide = (const ap_uint<128>*)x_batch;
    LOAD_X_BATCH: for (int n = 0; n < MAX_BATCH; n++) {
        LOAD_X_VEC: for (int i = 0; i < VECTOR_DIM / 16; i++) {
            #pragma HLS PIPELINE II=1
            ap_uint<128> wide_val = x_wide[n * (VECTOR_DIM / 16) + i];
            for (int j = 0; j < 16; j++) {
                #pragma HLS UNROLL
                int8_t val = (int8_t)wide_val.range(j*8+7, j*8);
                int elem = i * 16 + j;
                x_local_1[n][elem >> 8][elem & 255] = val;
                x_local_2[n][elem >> 8][elem & 255] = val;
            }
        }
    }
}

// ============================================================================
// swiglu — top-level AXI4 IP entry point
// ============================================================================
void swiglu(
    const uint8_t *W,
    const uint8_t *V,
    const uint8_t *W_down,
    const int8_t  *x_batch,
    float         *out_batch,
    uint32_t       down_quant_mode,
    float          x_scale)
{
    // URM DDR layout: WV=80 words/row (1280 B), Down=320 words/row (5120 B)
    // W/V: 8192 rows × 1280 = 10,485,760 B   W_down: 2048 rows × 5120 = 10,485,760 B
    #pragma HLS INTERFACE mode=m_axi port=W         bundle=gmem_W    offset=slave depth=10485760 max_read_burst_length=128  latency=64 num_read_outstanding=4 max_widen_bitwidth=128
    #pragma HLS INTERFACE mode=m_axi port=V         bundle=gmem_V    offset=slave depth=10485760 max_read_burst_length=128  latency=64 num_read_outstanding=4 max_widen_bitwidth=128
    #pragma HLS INTERFACE mode=m_axi port=W_down    bundle=gmem_Wd   offset=slave depth=10485760 max_read_burst_length=256  latency=64 num_read_outstanding=4 max_widen_bitwidth=128
    #pragma HLS INTERFACE mode=m_axi port=x_batch   bundle=gmem_x    offset=slave depth=8192     max_read_burst_length=128  latency=64 num_read_outstanding=1 max_widen_bitwidth=128
    #pragma HLS INTERFACE mode=m_axi port=out_batch bundle=gmem_out  offset=slave depth=8192     max_write_burst_length=256 latency=64 num_write_outstanding=1

    #pragma HLS INTERFACE mode=s_axilite port=W               bundle=CTRL
    #pragma HLS INTERFACE mode=s_axilite port=V               bundle=CTRL
    #pragma HLS INTERFACE mode=s_axilite port=W_down          bundle=CTRL
    #pragma HLS INTERFACE mode=s_axilite port=x_batch         bundle=CTRL
    #pragma HLS INTERFACE mode=s_axilite port=out_batch       bundle=CTRL
    #pragma HLS INTERFACE mode=s_axilite port=down_quant_mode bundle=CTRL
    #pragma HLS INTERFACE mode=s_axilite port=x_scale         bundle=CTRL
    #pragma HLS INTERFACE mode=s_axilite port=return          bundle=CTRL

    int8_t x_local_1[MAX_BATCH][WV_BLOCKS_PER_ROW][256];
    #pragma HLS BIND_STORAGE variable=x_local_1 type=ram_1p impl=lutram
    #pragma HLS ARRAY_PARTITION variable=x_local_1 dim=2 complete

    int8_t x_local_2[MAX_BATCH][WV_BLOCKS_PER_ROW][256];
    #pragma HLS BIND_STORAGE variable=x_local_2 type=ram_1p impl=lutram
    #pragma HLS ARRAY_PARTITION variable=x_local_2 dim=2 complete

    int8_t X1_cache[MAX_BATCH][FFN_DIM];
    int8_t X2_cache[MAX_BATCH][FFN_DIM];
    #pragma HLS BIND_STORAGE variable=X1_cache type=ram_2p impl=bram
    #pragma HLS BIND_STORAGE variable=X2_cache type=ram_2p impl=bram

    int8_t gate_cache[MAX_BATCH][DOWN_BLOCKS_PER_ROW][256];
    #pragma HLS BIND_STORAGE variable=gate_cache type=ram_1p impl=uram
    #pragma HLS ARRAY_PARTITION variable=gate_cache dim=2 cyclic factor=8

    float gate_scale[MAX_BATCH];

    #pragma HLS BIND_STORAGE variable=sigmoid_lut type=rom_1p impl=bram

#ifndef __SYNTHESIS__
    init_sigmoid_lut_csim();
#endif

#pragma HLS DATAFLOW
    load_x_local(x_batch, x_local_1, x_local_2);
    compute_X1(W, x_local_1, x_scale, X1_cache);
    compute_X2(V, x_local_2, x_scale, X2_cache);
    compute_gate(X1_cache, X2_cache, gate_cache, gate_scale);
    compute_output(W_down, gate_cache, gate_scale, out_batch, down_quant_mode);
}
