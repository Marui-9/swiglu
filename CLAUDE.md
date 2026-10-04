# CLAUDE.md — SwiGLU Accelerator Project Notes

## Project Overview

Hardware offload of the SwiGLU FFN block of LFM2.5-1.2B (Liquid AI) onto a Kria KV260
(Zynq UltraScale+ ZU5EV). The IP is written in Vitis HLS 2025.1 (`swiglu.cpp`), integrated
in Vivado, and invoked from llama.cpp through a fused ggml op (`llama-mods/`).
README.md is the entry point for humans; this file is the working summary.

**Numbers rule:** every figure in a doc must come from a report, log or commit in this
repo. Cite the source and label derived arithmetic as derived. Do not carry numbers
forward from older docs without re-checking them. Sources of truth:
- csynth: `swiglu/reports/hls_compile.rpt` (rebuild), `hls_experiments/q4k_final/csynth.rpt`
- implementation: `hls_experiments/q4k_final/{utilization,timing}.txt`
- board: `scripts/results/latest_benchmarks/*_q4k.log`, `thesis/latest_findings.md`
- history: `hls_experiments/testblock/changelog.txt` (entries 1-68)

## Current Status (2026-10-03)

### Shipped: q4k_final (`hls_experiments/q4k_final/`)

- **Board, 250 MHz, interrupt build:** **2.21 t/s at T2**, 452 ms/token, 5.15 W.
  - T1 1.63 / T3 2.05 / T4 1.46 t/s.
  - CPU-only: 0.88 / 1.66 / **2.36** / 2.31 t/s at T1-T4. The best CPU-only configuration
    (T3) beats every FPGA+CPU one.
  - The CPU runs used the stock Q4_K_M GGUF (694.76 MiB); the accelerator runs used the
    all-Q4_K one (628.25 MiB).
- **T2 split:** 224 ms FPGA (14.0 ms/call) + 227 ms non-FFN CPU + 1.3 ms handoff.
- **csynth:** latency 3,175,430 cy (12.70 ms @ 250 MHz); interval 1,622,603.
  - Board/latency = 1.10. Comparing against the interval (2.16×) is what produced the old
    "1.5-2× HLS-vs-board gap" story.
- **Routed:** LUT 101,639 (86.78%), FF 116,975, BRAM36 46.5, URAM 8, DSP 254.
- **Timing:** WNS −0.023 ns, TNS −1.699 ns, WHS +0.010 ns. Runs at 250 MHz with that slack.

### In flight: load/compute overlap on branch `rebuild` (csynth only)

Commits 6c27523, d4942c8, 4493272; c35a36d removes the vestigial Q6_K path. C-sim PASS and
csynth at each step. **Not yet through Vivado, no board number.**

| csynth (Vitis 2025.1)  | q4k_final | rebuild |
|------------------------|-----------|---------|
| compute_X1 ∥ X2        | 1,536,001 cy (6.14 ms @ 250 MHz) | **713,107 cy (2.85 ms)** |
| compute_output         | 1,622,602 cy (6.49 ms) | **1,282,062 cy (5.13 ms)** |
| Full call latency      | 3,175,430 cy (12.70 ms) | **2,011,996 cy (8.05 ms)** |
| LUT estimate / DSP     | 148,042 / 286 | **145,719 / 238** |

**How it works:**
- Each MAC stage has loop-body `DATAFLOW`: the producer (load) and the consumer (MAC) run
  concurrently on HLS-generated PIPO buffers, so an iteration costs the larger of the two
  process intervals instead of the sum of their latencies.
- Stage 5 dropped to **K=2** (16 lanes): load 960 vs MAC 1,248 → 1,249 cy/iteration,
  MAC-bound (hls_compile.rpt). At K=4 the 4-row load (4 × 477 = 1,908 cy, q4k_final
  csynth) is longer than the 1,243-cy MAC, so the array would idle even overlapped
  (d4942c8's message says ~46%). Halving it funded the buffers (DSP 286 → 238).
- Stages 2a/2b keep **K=4**: load interval 320 vs MAC 347 → 348 cy/iteration, MAC-bound
  and balanced (4493272).

**Projection (derived, unproven):**
- 16 × 8.05 ms ≈ 129 ms of csynth latency per token, ≈ 142 ms at q4k_final's 1.10
  board/csynth ratio.
- Adding 227 + 1.3 ms of CPU and handoff gives ~2.6 t/s at T2.
- At 200 MHz (16 × 10.06 ms, ×1.10 ≈ 177 ms): ~2.5 t/s.

**Vivado plan:**
- Run implementation with `set_clock_uncertainty -setup 0.300` on the PL clock, to buy real
  margin over q4k_final's −0.023 ns.
- Do not re-run HLS at a relaxed clock: `hls_config.cfg` already targets 3.33 ns / 300 MHz
  with 0.90 ns uncertainty, stricter than the 250 MHz board clock.

### Driver bugs, fixed 2026-10-04 (details and evidence: README.md, "Driver bugs")

Both fixes are in `llama-mods/ggml-cpu.c` only, so no re-synthesis is needed and they also
work with the q4k_final bitstream. **The fixed driver has not been run on the board.** All
board numbers in this file were measured with the old driver: valid timing, wrong values.

1. **Header layout mismatch.** The old `transpose_q4k_to_urm()` wrote sc6[0..7] at header
   bytes 4-11 and mn6[0..7] at 12-19.
   - `swiglu.cpp` reads sc6[0..3] at 4-7, mn6[0..3] at 8-11, sc6[4..7] at 16-19 and mn6[4..7]
     at 20-23. The host now writes exactly that layout.
   - The testbench's own transposer matches the IP, so C-sim could not see the bug.
   - Both layouts date from 3727506 (2026-05-19), and q4k_final reads the same bytes.
   - C model check (scratch harness): output cosine vs a float reference went −0.196 → 0.996,
     and the host buffers are byte-identical to the testbench's.
2. **x/out overlapped layer 3.** `SWG_VEC_OFF` 0x06C50000 and `SWG_OUT_OFF` 0x06C60000 lay
   inside layer 3's W slot (0x06A00000-0x073FFFFF), corrupting 9 of its 8,192 W_gate rows
   on every call.
   - They are now at 0x00000000 and 0x00010000, below `SWG_LAYER_BASE`.
   - `_Static_assert`s check the whole udmabuf map for overlaps.

### Open items

- Run the fixed driver on the board and compare the fused op with `build_ffn()`. No
  on-board output comparison exists yet.
- Run Vivado implementation and take a board measurement of the rebuild.
- Measure the X1/X2 range: the fixed ±10 INT8 scale (`X12_SCALE_RANGE`) has never been
  checked against real activations.
- Measure perplexity of the all-Q4_K GGUF against the stock Q4_K_M (CPU only). No accuracy
  figure exists beyond the C-sim tolerance.

### Two HLS lessons from the overlap work (each cost ~+70K LUT before being caught)
1. **Complete-partitioned arrays as DATAFLOW channels explode.** An `int8 sc6[32][8]`
   crossing a dataflow boundary becomes ~1,150 per-element channels (+77K LUT / +114K FF
   of handshake). Fix: pack the sub-scales 8 per `ap_uint<64>` word (~40 channels).
2. **Variable shifts synthesize a barrel shifter per site.** `x >> (sub*8)` cost ~160 LUT ×
   96 sites (+16K). Fix: a fully unrolled compile-time `.range()` unpack into partitioned
   locals (pure wiring); the indexed reads become 8:1 byte muxes.

---

## Model

| Symbol | Value | Meaning |
|---|---|---|
| embedding_dim | 2048 | input/output of the FFN |
| ffn_dim | 8192 | intermediate dimension |
| num_layers | 16 | one IP call per layer per token |

**All-Q4_K by design.**
- The stock Q4_K_M keeps `ffn_down` in Q6_K on layers 0, 1, 4, 7, 10, 13, 14, 15.
- The GGUF used with the accelerator was requantized from Q8_0 with
  `llama-quantize --allow-requantize --pure ... Q4_K` (changelog entry 65;
  `docs/quantization_info.txt`).
- On the board, all 10,432 observed W_down tensors were `type=12` (c35a36d).

**Q4_K only, at three levels:**
- `lfm2.cpp` emits the fused op only when gate/up/down are all Q4_K.
- `ggml-cpu.c` asserts on any other type and pins `mode = 0`.
- `swiglu.cpp` has no Q6_K logic.

---

## Architecture (rebuild; detail in docs/swiglu_description.md)

### Datapath (W4A8)

- x is INT8, quantized by the host with max|x|/127; the scale goes to the XSCALE register.
- The MACs use INT32 accumulators, 4 slots per block (`n & 3`).
- The per-block reduce `d·Σw − dmin·Σm` runs in float, with `ap_fixed<48,38>` accumulation.
- X1/X2 are stored as INT8 with a fixed ±10 range.
- The gate is SiLU via a 4096-entry LUT over [-8, 8), requantized to INT8 with a per-token
  scale in two passes.
- out is FP32.

### Top-level DATAFLOW

```
load_x_local → compute_X1 ∥ compute_X2 → compute_gate → compute_output
```

### URM weight layout (host-converted once per layer)

- **WV row:** 80 × 128-bit words.
  - 16 header words: 8 blocks × 32 B.
  - 64 nibble words. Each holds 4 elements; each element is a 32-bit slice of 8 blocks'
    nibbles.
- **Down row:** 320 words.
  - 64 header words.
  - 256 nibble words, one element each, with 4 group slices.
- Each matrix is 10,485,760 B, which is also the m_axi `depth`.

### Interfaces

**m_axi** (all widened to 128-bit, `swiglu.cpp:850-854`):
- W (gmem_W → HP2) and V (gmem_V → HP0): burst 128, outstanding 4.
- W_down (gmem_Wd → HP1): burst 256, outstanding 4.
- x (gmem_x) and out (gmem_out) → HP0, outstanding 1.

**AXI-Lite CTRL at 0xA0000000.** It is the only PL peripheral.

| Offset | Register |
|---|---|
| 0x00 | AP_CTRL |
| 0x04 | GIE |
| 0x08 | IER |
| 0x0C | ISR |
| 0x10 | W |
| 0x1C | V |
| 0x28 | W_down |
| 0x34 | x |
| 0x40 | out |
| 0x4C | MODE (always 0) |
| 0x54 | XSCALE |

- **`down_quant_mode` and its `if (mode == 0)` guard must stay.** The guard is the only
  reference to the argument. An unreferenced scalar port is optimized away, which shifts
  `x_scale` off 0x54 and breaks the driver's register map.

**Interrupt:**
```
swiglu_0 → xlconcat In0 → GIC SPI 121 → interrupts = <0 89 4> (pl.dtsi)
```
The driver finds its UIO device by physical address (`open_uio_by_addr`).

### Driver (`llama-mods/ggml-cpu.c`, see docs/code_stages.txt)

- `UDMABUF_SIZE` is 512 MiB, which fits the board's effective `cma=600M` without boot
  edits (docs/udmabuf_info.txt).
- **Activation buffers:** x at `SWG_VEC_OFF` 0x00000000, out at `SWG_OUT_OFF` 0x00010000.
- **Layer slots:** `SWG_LAYER_BASE` 0x01000000 + layer × 0x01E00000 (30 MiB each).
  - W at +0, V at +0xA00000, W_down at +0x1400000.
  - Each slot is converted and synced once on its layer's first call (`swg_layer_cached[]`).
- **Per call:**
  1. Quantize x.
  2. Write the W/V/Wd addresses (only when the layer changes), plus x/out/MODE/XSCALE.
  3. Sync x to the device and set ap_start.
  4. Block in UIO `read()` (no timeout).
  5. Clear ISR and re-arm.
  6. Sync out to the CPU and memcpy it.
- **Multiple tokens:** prefill and batches are looped one token per IP call
  (`SWG_MAX_TOKENS = 64`). There is no CPU fallback inside the op.
- **Layer index:** comes from `op_params[0]`, set by `ggml_swiglu_fused_hw(..., il)`.
- **Environment variables:**
  - `LLAMA_SWIHW=1` enables the offload (`lfm2.cpp`).
  - `SWIGLU_DEBUG=1` prints a per-token time breakdown.

### llama.cpp wiring (line numbers in llama-mods/, docs/offload.txt)

- **ggml.h:** enum at :474; `ggml_swiglu_fused_hw(ctx, x, w_gate, w_up, w_down, layer_id)`
  declared at :808.
- **ggml.c:** op name at :957; builder at :2925.
- **ggml-cpu.c:** `n_tasks = 1` at :2711; dispatch at :2216; kernel at :2001; transposer
  at :182.
- **lfm2.cpp:** emits the op inside `build_dense_feed_forward`, LFM2-only on purpose.

### Board flow

1. `scripts/deploy/deploy-fabric.sh`: bitstream + DT overlay, `xmutil loadapp`, udmabuf.
2. `scripts/deploy/reload-full-llama.sh`: copy llama-mods into the llama.cpp tree, then
   rebuild.
3. `scripts/profiling/run_profile_{accel,cpu}.sh <threads> [repeat]`: benchmark + power log.

---

## Critical Lessons (do not repeat these bugs)

HLS:
1. **DAZ:** never use `hls_half` or `ap_fixed<16,5>` for fp16 d/dmin. Real LFM2 values
   include subnormals. Use `fp16_to_fp32()` (uint32_t bit manipulation).
2. **8-bit AXI default:** `uint8_t*` ports get an 8-bit bus. Widen to 128 bits. Evidence:
   pipeline intervals once matched byte counts exactly (1153 cy for 1152 B).
3. **Interface `depth`** must cover the full matrix. A row-sized depth split a burst into
   two non-burst transactions with a 3,600-cycle gap (entry 16).
4. **DATAFLOW shared array → serializer.** Two processes reading one local array made HLS
   insert `Block_entry_*_rd_proc` (= 2× compute_X1). Give each reader its own copy
   (`x_local_1`/`x_local_2`, ram_1p).
5. **MAX_BATCH multiplies partitioned BRAM.** `gate_cache[8][8192]` partitioned 32 ways
   needed 256 BRAM_18K. Hence MAX_BATCH = 1.
6. **UNROLL alone does not create parallel hardware.** Unrolled calls become sequential FSM
   states sharing `grp_fu_*` units.
   - Loop inversion fixes it: the 256-element loop goes outermost with `PIPELINE II=1`,
     and the block/row loops are UNROLLed inside it.
   - Result: ~270 vs 2611 cy/row for 8 blocks.
7. **1D arrays with block partition fail alias analysis.** HLS assumes port contention and
   serializes the MACs. Use explicit 2D/3D arrays with `dim=1 complete` (or cyclic where
   the access pattern guarantees distinct banks: `gate_cache` is dim=2 cyclic factor=8).
8. **Partial UNROLL inside PIPELINE II=1 is invalid.** Use an explicit sequential group loop
   around a fully unrolled inner loop (the 4 groups × 8 blocks of the down MAC).
9. **Non-power-of-2 strides need nested loops.** `i/9` in a pipelined loop instantiates
   dividers.
10. **Accumulator slots ≥ adder latency for II=1.** Use 4 slots for INT32 (`n & 3`) and 8
    for FP32. Partition them completely.
11. **4 memory writes per pipeline stage don't reach II=1** in Vitis HLS 2025.1. Store each
    128-bit word verbatim in one wide BRAM and slice on read (67 vs 256 cy, entry 62).
12. **One long burst beats several short ones.** Merging four per-row W/V loads into one
    320-word burst took X1/X2 from 2.60M to 1.54M cycles and shipped on ZU5EV. Every
    split-burst variant was slower.
13. **Wide-BRAM fan-out to 32 output blocks did not route** (74K overlaps, entry 63). The
    output path keeps 32-bit tiles.
14. **csynth LUT estimates over-predict:** q4k_final was 148,042 in csynth vs 101,639
    routed.
15. **Compare board time with the csynth latency, not the DATAFLOW interval.** Each call
    fills and drains the pipeline. The polling fix (entry 67) chased a gap that this
    explains: +0.01 t/s for +0.70 W.
16. **Timing at ~87% LUT:** keep DSP-feeding memories in BRAM, not URAM.
    - Choose the accumulator-slot pattern by which net fans out. The two MACs went
      opposite ways:
      - **Down MAC:** direct clock-enable writes `acc[b][k[r]] += c`. The mux version
        `(ki == k[r]) ? c : 0` put k[r] on 64 data-path comparators (entry 61).
      - **WV MAC:** the data mux. CE-gated writes put the iteration counter on 1024 CE
        pins (swiglu.cpp comment in `mac_blocks_wv_k4_urm`).
    - `phys_opt_design -hold_fix` handles hold.

Driver / integration:
17. **Never hardcode `/dev/uio0`;** use `open_uio_by_addr()`.
18. **AP_CTRL is not RAM.** Reads return live state; do not write test patterns to it.
19. **UIO init order:** drain the count, arm GIE/IER, clear ISR, drain again, re-arm.
    Arming with ISR set fires a stale interrupt and returns call #0 early.
20. **llama.cpp uses fused `GGML_OP_GLU`** (silu×up), not separate SILU and MUL. Log the
    real op names before walking a graph (the fused op now avoids the walk).
21. **The fused op also runs for prefill** (ne[1] > 1). A MAX_BATCH = 1 IP needs a
    per-token loop or a guard.
22. **Take the layer index from `op_params`,** not from a call counter mod 16.
23. **Test the host transposer against the HLS reader end to end** (bug 1). Two matching
    pairs, testbench↔IP and host↔host-model, prove nothing about host↔IP.
24. **Lay out udmabuf regions in one table and assert no overlap** (bug 2).

AXI DMA lessons from the earlier linear_projection design (SG mode, ap_start before
TAILDESC, descriptor STATUS clear, IRQThreshold ≥ 1, TAILDESC off-by-one) are in
`docs/inheritance.txt`. The SwiGLU IP uses no DMA.

---

## File Map

```
swiglu.cpp, swiglu.h     HLS IP (rebuild design)
swiglu_tb.cpp            C-sim testbench (mock token + 4 Q4_K tests; own transposer)
sigmoid_lut.h            sigmoid LUT (runtime init in C-sim, ROM in synthesis)
hls_config.cfg           HLS config (xck26, 3.33 ns, 0.90 ns uncertainty)
swiglu/                  Vitis component; reports/hls_compile.rpt is the rebuild csynth
pl.dtsi                  DT overlay (generic-uio node, interrupt, config-afi)
llama-mods/              ggml.h, ggml.c, ggml-cpu.c (driver), lfm2.cpp
docs/                    see the table in README.md
hls_experiments/         q4k_final/ (shipped), testblock/changelog.txt, experiments.txt,
                         earlier designs
scripts/                 deploy/, profiling/, plotting/, analysis/, results/latest_benchmarks/
cpu_profiling/           per-op CPU profile (FFN = 68.08% of decode node time)
thesis/, latex/          thesis material — edit only when asked
```
