# swiglu.cpp — stage-by-stage description

Revised 2026-10-03 against `swiglu.cpp` on branch `rebuild` (load/compute overlap design,
commits 6c27523 → c35a36d). Cycle counts come from `swiglu/reports/hls_compile.rpt`
(Vitis HLS 2025.1, xck26, 3.33 ns target, 0.90 ns uncertainty). That report was generated on
2026-07-16 15:09, *before* c35a36d removed the dead Q6_K helpers. Those functions had no
callers, so the numbers should be unchanged, but csynth has not been re-run since.

This design has **not been through Vivado or measured on the board**. The board-measured
design is `hls_experiments/q4k_final/` (see README.md).

## What the IP computes

One decode token of the LFM2.5-1.2B FFN, all weights Q4_K:

    out[2048] = W_down · ( SiLU(W_gate · x) ⊙ (W_up · x) )

using a W4A8 integer datapath (Q4_K weights × INT8 activations, INT32 accumulation).

| Data | Format | Where the scale comes from |
|---|---|---|
| x (input) | INT8 | `x_scale` register; host computes max\|x\|/127 |
| X1 = W_gate·x, X2 = W_up·x | INT8 | fixed: ±10.0 → ±127 (`X12_SCALE_RANGE`). Values outside ±10 clip |
| gate = SiLU(X1)·X2 | INT8 | per token: max\|gate\|/127, computed on chip in two passes |
| out | FP32 | written straight to `out_batch` |

Q4_K `d`/`dmin` are fp16 and are widened with `fp16_to_fp32()`, a bit-manipulation function
that keeps subnormals. `hls_half` and `ap_fixed<16,..>` flush subnormals to zero, and real
LFM2 `d`/`dmin` values are often subnormal.

## DDR weight layout ("URM"), produced by the host

The host (`transpose_q4k_to_urm()` in `llama-mods/ggml-cpu.c`) converts every GGML Q4_K row
into this layout once per layer.

- **WV row** (W_gate / W_up, 8 blocks): 80 × 128-bit words = 1280 B.
  - Words 0-15: 8 block headers of 2 words each.
  - Words 16-79: 64 nibble words. Each word holds 4 consecutive elements, one 32-bit
    slice per element. Each slice holds 8 nibbles, one per block (block b in bits
    [4b+3:4b]).
- **Down row** (W_down, 32 blocks = 4 groups of 8): 320 words = 5120 B.
  - Words 0-63: 32 headers.
  - Words 64-319: 256 nibble words. Each word is one element, with 32-bit slice g holding
    group g's 8 nibbles.
- Each matrix totals 10,485,760 B, which is also the m_axi `depth`.

**Header as `swiglu.cpp` reads it** (`load_4rows_wv_urm`, `load_row_down_urm`):

| Word | Bits | Field |
|---|---|---|
| word 0 | [15:0] | d (fp16) |
| word 0 | [31:16] | dmin (fp16) |
| word 0 | [63:32] | sc6[0..3] (one byte each) |
| word 0 | [95:64] | mn6[0..3] |
| word 1 | [31:0] | sc6[4..7] |
| word 1 | [63:32] | mn6[4..7] |

sc6/mn6 are the 6-bit sub-block scales and mins, already unpacked from Q4_K's 12-byte
packed form.

> **Fixed 2026-10-04:** until then the host wrote sc6[0..7] contiguously at bytes 4-11 and
> mn6[0..7] at bytes 12-19, which does not match the table above. The host now writes the
> table's layout. See README.md, "Driver bugs".

## Top level (`swiglu`)

- **Interfaces:** five m_axi masters, each in its own bundle:
  - `gmem_W`, `gmem_V` (max burst 128) and `gmem_Wd` (max burst 256), all with
    `num_read_outstanding=4`.
  - `gmem_x` and `gmem_out` (outstanding 1).
  - All are widened to 128 bits.
  - Every argument plus `return` is on the `CTRL` AXI-Lite bundle. The register map is in
    docs/code_stages.txt.
- **Top-level DATAFLOW:** `load_x_local → compute_X1 ∥ compute_X2 → compute_gate →
  compute_output`. X1 and X2 overlap because each has its own copy of x (`x_local_1`,
  `x_local_2`). One shared copy made HLS insert a serializing broadcast process.
- **On-chip buffers:**

| Buffer | Shape | Storage |
|---|---|---|
| `x_local_1`, `x_local_2` | [1][8][256] INT8, dim 2 complete | LUTRAM |
| `X1_cache`, `X2_cache` | [1][8192] INT8 | BRAM ram_2p |
| `gate_cache` | [1][32][256] INT8, dim 2 cyclic 8 | URAM (the design's 8 URAM) |
| `sigmoid_lut` | 4096 floats | BRAM ROM |

## Stage 1 — `load_x_local` (202 cycles)

Reads 128 × 128-bit words (2048 INT8) and writes every byte into both `x_local` copies.

## Stages 2a/2b — `compute_X1` / `compute_X2` (713,107 cycles each, run in parallel)

`COMPUTE_X1: for row += 4` with **loop-body `#pragma HLS DATAFLOW`**. The tile and header
arrays declared inside the loop body become ping-pong (PIPO) buffers between two processes:

- **Producer `load_4rows_wv_urm`** (latency 400, interval 320 cycles): one linear 320-word
  burst for 4 rows. The
  row is decoded by comparison, not division by 80. Headers go into `d`, `dmin`, and the
  packed `sc6w`/`mn6w` (`ap_uint<64>`, 8 sub-scales per word). Nibble words are stored
  verbatim into four 128-bit × 64 BRAM tiles.
- **Consumer `mac_quant_wv`** (347 cycles) → `mac_blocks_wv_k4_urm`:
  - Unpacks the sub-scale words with compile-time `.range()` into fully partitioned int8
    arrays.
  - Then `MAC_ALL: n = 0..255, PIPELINE II=1`, with 8 blocks × 4 rows unrolled, giving
    **32 parallel MAC lanes**.
  - Per element: `acc_w += x·nibble·sc6`, `acc_m += x·mn6`, in INT32.
  - Each accumulator is split into 4 slots indexed by `n & 3`, so each slot is updated
    every 4 cycles. The contribution is muxed into the selected slot rather than using a
    clock-enabled write, because that cut the fan-out of the iteration counter.
  - **Reduce:** for each block, `d·Σw − dmin·Σm` in float, accumulated in
    `ap_fixed<48,38>`, then multiplied by `x_scale`.
  - Finally, `mac_quant_wv` quantizes the 4 results to INT8 with the fixed ±10 scale.
- Per iteration: the larger of the two process intervals, max(320, 347) → 348 cycles
  (MAC-bound), instead of the sum. Over 2048 iterations this gives 713,107 cycles
  (2.85 ms @ 250 MHz).

## Stage 3 — `compute_gate` (16,622 cycles)

Two pipelined passes over 8192 elements:

- **PASS1:** dequantize X1/X2. Compute `SiLU(z)·x2` as `z · sigmoid_lut[(z+8)·256] · x2`,
  where the LUT covers [-8, 8) and the index is clamped. Track max|g| in 8 partial maxima.
- **PASS2:** recompute g and quantize with `gate_scale = max/127`. Write to
  `gate_cache[j>>8][j&255]`.

## Stage 4 — `compute_output` (1,282,062 cycles)

`DOWN_Q4K: for out_i += 2` (K=2), also with loop-body DATAFLOW:

- **Producer `load_2rows_down`** (960 cycles): two `load_row_down_urm` calls. Each is 64
  header words followed by 256 nibble words, and each nibble word is split into the 4
  group tiles (32-bit × 256 BRAM).
  - The rows are not merged into one burst. The source comment says the 4-way group split
    precludes it; the one merged attempt (128-bit tiles) failed C-sim and did not route
    (changelog.txt, second entries 62-63).
- **Consumer `mac_write_down`** (1248 cycles) → `mac_blocks_down_q4k_k2_urm`:
  - `DOWN_GROUPS: grp 0..3` runs sequentially. Each group is `MAC_GRP: n = 0..255,
    PIPELINE II=1` with 8 blocks × 2 rows unrolled, giving **16 parallel MAC lanes**.
  - Same INT32 accumulate / float reduce scheme as stage 2, scaled by `gate_scale`.
  - Results go to `out_local[2048]` (BRAM), which is `memcpy`'d to `out_batch` at the end.
- Per iteration: max(960, 1248) → 1,249 cycles (MAC-bound). 1024 iterations plus the
  2,051-cycle output write give 1,282,062 cycles (5.13 ms @ 250 MHz).
- `if (down_quant_mode == 0)` wraps the whole stage. Mode is always 0, but the guard is the
  only reference to the argument and must stay. Otherwise HLS drops the port and
  `x_scale` moves off 0x54.

## Totals (csynth)

| | Cycles | @ 250 MHz |
|---|---|---|
| Full call | 2,011,996 | 8.05 ms |
| Resources | LUT 145,719 (124%), FF 143,249, DSP 238, BRAM 150, URAM 8 | |

The LUT estimate is over 100% of the device. The shipped q4k_final design was estimated at
about 148K by csynth and routed at 101,639 (86.8%), so this level of csynth overestimate
has been seen before. Whether this design fits is still an open question until Vivado
runs.

## Why the code looks the way it does

- **Loop inversion:** the 256-element loop is outermost with II=1, and blocks/rows are
  unrolled inside it. Only this structure makes HLS build independent MAC pipelines.
  Unrolling an outer loop around function calls just time-shares one pool of operators.
- **2D arrays `[blocks][…]` with dim-1 partition:** gives each block its own bank without
  relying on HLS alias analysis.
- **Sub-scales packed 8 per `ap_uint<64>`:** a complete-partitioned `int8[32][8]` that
  crosses a DATAFLOW boundary turns into roughly 1,150 handshake channels (about +77K LUT).
- **Compile-time `.range()` unpacking:** a variable shift (`>> (sub*8)`) builds one barrel
  shifter per site.
- **Stage 5 at K=2, stages 2a/2b at K=4:** with overlap, a K=4 down array would sit idle
  about half the time waiting on its 4-group load. The WV load (400) and MAC (347) are
  balanced at K=4.
