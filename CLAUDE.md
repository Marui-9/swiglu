# CLAUDE.md — SwiGLU Accelerator Project Notes

## Project Overview

Hardware offload of the SwiGLU FFN block of LFM2.5-1.2B (Liquid AI) onto a Kria KV260
(Zynq UltraScale+ ZU5EV). The IP is written in Vitis HLS 2025.1 (`swiglu.cpp`), integrated
in Vivado, and invoked from llama.cpp through a fused ggml op (`llama-mods/`).
README.md is the entry point for humans; this file is the working summary.

**Numbers rule:** every figure in a doc must come from a report, log or commit in this
repo. Cite the source and label derived arithmetic as derived. Do not carry numbers
forward from older docs without re-checking them. Sources of truth:
- csynth: `hls_experiments/rebuild_s2fix/csynth.rpt` (current source), `swiglu/reports/hls_compile.rpt` (rebuild, INT8), `hls_experiments/q4k_final/csynth.rpt`
- implementation: `hls_experiments/rebuild_s2fix/` (current), `hls_experiments/rebuild_x16/` (INT16 X1/X2), `hls_experiments/q4k_final/{utilization,timing}.txt`
- board: `scripts/results/rebuild_s2fix_final_20261024/` (current), `scripts/results/rebuild_x16_20261023/`, `scripts/results/latest_benchmarks/*_q4k.log`, `latest_findings.md`
- history: `hls_experiments/testblock/changelog.txt` (entries 1-72)

## Current Status (2026-10-24)

### Shipped: q4k_final (`hls_experiments/q4k_final/`)

- **Board, 250 MHz, interrupt build:** **2.21 t/s at T2**, 452 ms/token, 5.15 W.
  - T1 1.63 / T3 2.05 / T4 1.46 t/s.
  - CPU-only: 0.88 / 1.66 / **2.36** / 2.31 t/s at T1-T4. The best CPU-only configuration
    (T3) beats every FPGA+CPU one.
  - The CPU runs used the stock Q4_K_M GGUF (694.76 MiB); the accelerator runs used the
    all-Q4_K one (628.25 MiB). The stock file on hand is corrupt from blk.4 on, so those CPU
    runs very likely ran a corrupt copy: timing valid, output unchecked
    (scripts/results/kld_ref_20261024/README.md).
- **T2 split:** 224 ms FPGA (14.0 ms/call) + 227 ms non-FFN CPU + 1.3 ms handoff.
- **csynth:** latency 3,175,430 cy (12.70 ms @ 250 MHz); interval 1,622,603.
  - Board/latency = 1.10. Comparing against the interval (2.16×) is what produced the old
    "1.5-2× HLS-vs-board gap" story.
- **Routed:** LUT 101,639 (86.78%), FF 116,975, BRAM36 46.5, URAM 8, DSP 254.
- **Timing:** WNS −0.023 ns, TNS −1.699 ns, WHS +0.010 ns. Runs at 250 MHz with that slack.

### Load/compute overlap on branch `rebuild` (csynth)

Commits 6c27523, d4942c8, 4493272; c35a36d removes the vestigial Q6_K path. C-sim PASS and
csynth at each step. These INT8 sources were never routed. With INT16 X1/X2 added, they went
through Vivado and onto the board as **rebuild_x16** (below).

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

**Projection (derived, made before the board run; measured: 181.5 ms FPGA, 2.53 t/s at T2, see rebuild_x16 below):**
- 16 × 8.05 ms ≈ 129 ms of csynth latency per token, ≈ 142 ms at q4k_final's 1.10
  board/csynth ratio.
- Adding 227 + 1.3 ms of CPU and handoff gives ~2.6 t/s at T2.
- At 200 MHz (16 × 10.06 ms, ×1.10 ≈ 177 ms): ~2.5 t/s.

### rebuild_x16: rebuild + INT16 X1/X2, routed 2026-10-23 (`hls_experiments/rebuild_x16/`)

`swiglu.cpp` (uncommitted on `rebuild`) stores X1/X2 as **INT16 over a fixed ±32 range**
(`X12_SCALE_RANGE` 32, `X12_QMAX` 32767), replacing INT8 ±10. This is the fix for the
accuracy loss below. Built with Vitis HLS / Vivado **2025.2** (Docker).

- **csynth** (`csynth.rpt` vs `csynth_base_2025.2.rpt`, the INT8 sources rebuilt with 2025.2):
  latency 2,011,996 / interval 1,282,063 unchanged; BRAM_18K 150 → 166; DSP 238.
- **Routed:** LUT 99,151 (84.66%), FF 139,945, BRAM36 52.5, URAM 8, DSP 238.
- **Timing at 4.000 ns:** WNS **+0.248 ns**, TNS 0, WHS +0.003 ns (`timing_4.000ns.txt`).
  - With +0.300 ns setup uncertainty: WNS −0.052 ns, 423 failing endpoints
    (`timing_4.000ns_margin0.3.txt`).
  - Worst path: the down MAC DSP (`MAC_GRP`), 4 levels.
- **Clock quirk:** the PS8 makes PL0 = 247.5 MHz from IOPLL, so its XDC sets
  clk_pl_0 = 4.04 ns. A 4.000 ns override needs the full pin path
  `design_1_i/zynq_ultra_ps_e_0/inst/PS8_i/PLCLK[0]`. The run itself used 4.04 ns + 0.3 ns.
  The 4.000 ns numbers come from re-timing the routed checkpoint (`retime.tcl`).
- **Board accuracy, 2026-10-23** (`scripts/results/rebuild_x16_20261023/`): same GGUF, T2
  and commands as the INT8 run below. The xmutil app is `swiglu-x16`; kria-accel still
  holds q4k_final.
  - PPL: CPU 50.0963, HW 51.786869 (ratio 1.034376 ± 0.011605).
  - Mean KLD 0.030154 (INT8: 0.384800); same top token 87.795 % (INT8: 63.255 %).
  - Per-layer cos vs float 0.9930 / 0.9984 min / mean (INT8: 0.9569 / 0.9765).
    cos(hw, INT16 emulation) ≥ 0.99980.
  - The residual error comes from the x and h INT8 stages. X1/X2 INT16 alone emulates at
    1.0000.
- **Board t/s, 2026-10-23** (`scripts/results/rebuild_x16_20261023/bench/`). Same GGUF
  for both paths, llama-bench `-p 12 -n 64 -r 10`, ollama stopped:
  - FPGA+CPU tg64: 1.76 / 2.53 / **2.98** / 2.73 t/s at T1-T4.
  - CPU-only: 0.93 / 1.76 / 2.54 / **2.65**.
  - Best vs best: 1.12× (derived). FPGA+CPU now beats every CPU-only configuration.
  - Power (SOM total, run average): T3 FPGA+CPU 4.78 W; T4 CPU-only 4.79 W.
  - Pass 2 (`bench_pass2/`, fixed RSS logger, CPU-only with the xmutil app unloaded):
    FPGA+CPU T3 3.01 t/s; CPU-only 0.93 / 1.77 / 2.55 / 2.70 t/s. Peak RSS (VmHWM) is
    694 MiB on both paths, plus the 512 MiB udmabuf for FPGA+CPU.
  - `xmutil unloadapp` does not blank the PL: the fabric stays configured and pl0 stays
    clocked (`bench_pass2/pl_state_check.txt`).
  - FPGA 181.5 ms per 16 calls = 11.34 ms/call (derived). Board/csynth latency = 1.41
    (q4k_final: 1.10), so the projection above was optimistic.
  - T2: 395.3 ms/token = 183.2 ms FFN path + ~212 ms rest of the CPU graph (derived).
  - The 1.41 gap was the serialized Stage 2 loop-body DATAFLOW (HLS lesson 3); see
    rebuild_s2fix.

### rebuild_s2fix: rebuild_x16 + Stage 2 STABLE fix, on the board 2026-10-24 (current)

`hls_experiments/rebuild_s2fix/` (build, cosim harness) and
`scripts/results/rebuild_s2fix_final_20261024/` (board). `swiglu.cpp` (uncommitted on `rebuild`)
adds `#pragma HLS STABLE` on W/V, x_local, x_scale inside the COMPUTE_X1/X2 loop body,
plus local `X1_loc`/`X2_loc` copied out by COPY_X1/X2. Vitis HLS / Vivado 2025.2.

- **csynth:** latency 2,020,192 cy (8.08 ms); compute_X1/X2 721,303 (loop 713,106 + copy
  8,193); interval 1,282,063; BRAM_18K 182; DSP 238; LUT estimate 146,123.
- **Routed:** LUT 101,522 (86.68%), FF 140,950, BRAM36 60.5, URAM 8, DSP 238.
  - Timing at 4.000 ns: WNS +0.145 ns, TNS 0, WHS +0.010 ns. As implemented (+0.300 ns
    uncertainty): WNS −0.155 ns, 408 endpoints. Worst path: down MAC DSP (`MAC_GRP`).
  - Implemented at 4.000 ns (rebuild_x16 ran at 4.04 ns), so the WNS change does not
    isolate the cost of the fix.
- **APM** (`scripts/analysis/swg_apm.c`, `apm_stages.py`; standalone, no llama.cpp):
  call 8.017 ms (49 calls); Stage 2 2.847 ms = 348 cy/iter (x16: 6.102 ms, 745);
  Stage 5 5.065 ms (unchanged). W port (S4) 3.68 GB/s during Stage 2 (x16: 1.72).
- **Accuracy:** KLD run identical to rebuild_x16 in every value (KLD 0.030154, PPL ratio
  1.034376 ± 0.011605).
- **Board t/s** (`bench/`, llama-bench `-p 12 -n 64 -r 10`, allQ4Kffn on both paths):
  - FPGA+CPU tg64: 1.94 / 2.92 / **3.53** / 3.24 t/s at T1-T4 (pp12 2.88 / 4.20 / 4.92 /
    5.11); power 4.48 / 4.78 / 4.92 / 4.71 W.
  - CPU-only control T3 2.54, T4 **2.69** t/s (4.86 / 4.76 W), within 0.04 t/s of
    2026-10-23, so T1/T2 reuse 0.93 / 1.76.
  - Decode speedup 2.09 / 1.66 / 1.39 / 1.20×; best vs best 1.31× (derived).
  - FPGA 129.45-129.63 ms per 16 calls = 8.09 ms/call, 1.00× csynth (derived). Handoff
    1.62-1.67 ms per token.
  - T2: 342.5 ms/token = 131.2 FFN path + 211.3 rest of graph (derived).
  - J/token T3 FPGA+CPU 1.39 vs T4 CPU-only 1.77 (derived).

### Driver bugs, fixed 2026-10-04 (details and evidence: README.md, "Driver bugs")

All fixes are in `llama-mods/ggml-cpu.c` only, so no re-synthesis is needed and they also
work with the q4k_final bitstream. The board timing numbers above were measured with the old
driver: valid timing, wrong values. The fixed driver first ran on the board on 2026-10-23
(see "Accuracy" below).

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
3. **ISR toggle-on-write** (found on the board 2026-10-23). An unconditional `ISR = 1` at
   init set the clear ISR of a fresh bitstream, so call #0 returned early and aborted.
   - The driver now writes back only the bits it reads as set.

### Accuracy on the board, 2026-10-23 (README.md, "Accuracy"; logs in scripts/results/fixed_driver_20261023/)

These are for the **q4k_final bitstream (INT8 ±10 X1/X2)**. They motivated rebuild_x16.

- **Setup:** one all-Q4_K Thinking GGUF for both paths, T2.
- **Greedy text:** correct ("red, green, and blue."), then it diverges from the CPU path.
- **wikitext-2, 6 × 256:**
  - PPL: CPU 50.0963, HW 54.139570 (ratio 1.081368 ± 0.041650).
  - Mean KLD 0.384800; same top token 63.255 %.
- **Per-layer verify:**
  - The IP matches a C emulation of its INT8 stages (cos ≥ 0.99946), so no driver or
    layout bug remains.
  - Against float `build_ffn()` the cosine is 0.9569–0.9944.
  - **The cause is the fixed ±10 X1/X2 range:** real gate·x stays within 4.24 and up·x
    within 1.80, and 801–2,347 of 8,192 gate·x values round to 0.
  - A per-token max/127 X1/X2 scale emulates at cos min 0.9948 / mean 0.9983, which is as
    good as leaving X1/X2 unquantized (0.9950 / 0.9986).
  - x INT8 is negligible (≥ 0.9996).

### Open items

- X1/X2 quantization: **fixed in source** (INT16 ±32, routed as rebuild_x16). The
  per-token-scale alternative was not taken because it needs a second pass.
- Board/csynth gap: **solved** (rebuild_s2fix, 1.00×).
- Commit the INT16 change, the STABLE fix and the results (rebuild_x16, rebuild_s2fix,
  kld_ref).
- Quantization cost vs the f16/q8_0 reference: **measured** (scripts/analysis/kld_ref.sh,
  scripts/results/kld_ref_20261024/, 24 × 256, board runs at -t 4 on 2026-10-24):
  - KLD 0.153433 for Q4_K_M rebuilt from f16/q8_0 (PC), 0.166073 for allQ4Kffn on the CPU,
    0.210197 for allQ4Kffn through the IP. The PPL ratios are 1.184104, 1.173772 and
    1.222886.
  - IP vs CPU over 24 chunks: KLD 0.034755, PPL ratio 1.045784, same top 88.091 %.
  - The remaining IP error is the INT8 x/h stages (+0.044 KLD vs ref, derived).

### Three HLS lessons from the overlap work
The first two each cost ~+70K LUT before being caught. The third cost 41% of the call time
on the board.
1. **Complete-partitioned arrays as DATAFLOW channels explode.** An `int8 sc6[32][8]`
   crossing a dataflow boundary becomes ~1,150 per-element channels (+77K LUT / +114K FF
   of handshake). Fix: pack the sub-scales 8 per `ap_uint<64>` word (~40 channels).
2. **Variable shifts synthesize a barrel shifter per site.** `x >> (sub*8)` cost ~160 LUT ×
   96 sites (+16K). Fix: a fully unrolled compile-time `.range()` unpack into partitioned
   locals (pure wiring); the indexed reads become 8:1 byte muxes.
3. **Loop-body DATAFLOW can serialize while csynth reports the overlapped interval.**
   - In compute_X1/X2, HLS synchronized each body instance on the caller variables it
     touched (W, x_local, x_scale, X_cache), so load and MAC ran back to back:
     cosim 746 cy/iter, board 745. csynth still said 348.
   - Fix: `#pragma HLS STABLE` on the read-only inputs inside the body, and write the
     result to a local array that is copied out after the loop (`X1_loc` → `COPY_X1`).
     DOWN_Q4K already had both (inferred stable, `out_local`).
   - STABLE on the output array itself overlaps, but it reads stale data in cosim.
   - **Check any loop-body DATAFLOW with a cosim dataflow profile**
     (`cosim.enable_dataflow_profiling`; `hls_experiments/rebuild_s2fix/cosim_harness/`),
     not with the csynth interval.

---

## Model

| Symbol | Value | Meaning |
|---|---|---|
| embedding_dim | 2048 | input/output of the FFN |
| ffn_dim | 8192 | intermediate dimension |
| num_layers | 16 | one IP call per layer per token |

**All-Q4_K by design.**
- The stock Q4_K_M keeps `ffn_down` in Q6_K on layers 0, 1, 4, 7, 10, 13, 14, 15.
- The GGUF the old accelerator runs used was requantized from Q8_0 with
  `llama-quantize --allow-requantize --pure ... Q4_K` (changelog entry 65;
  `docs/quantization_info.txt`). Its F32 norm weights differ from the stock Thinking Q4_K_M
  because that stock file is corrupt from blk.4 on (NaN / ±3e38 norms, PPL 65536;
  scripts/results/kld_ref_20261024/). The rebuilt replacement is
  `LFM2.5-1.2B-Thinking-Q4_K_M-fromf16q8.gguf` (md5 76ede564…, on the USB key).
- The 2026-10-23 and 2026-10-24 runs use `LFM2.5-1.2B-Thinking-Q4_K_M-allQ4Kffn.gguf`, built from the
  Thinking f16/q8_0 GGUF as Q4_K_M with `--tensor-type ffn_down=q4_k`. That needed a
  local llama-quantize patch, because build 8210 ignores an override equal to the default
  type (scripts/results/fixed_driver_20261023/README.md).
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
- X1/X2 are stored as INT16 with a fixed ±32 range (round-half-away, clamp ±32767).
  q4k_final and the INT8 rebuild used INT8 ±10.
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
  5. Clear ISR (write back only the set bits; it is toggle-on-write) and re-arm.
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
- **ggml-cpu.c:** `n_tasks = 1` at :2715; dispatch at :2220; kernel at :2004; transposer
  at :182.
- **lfm2.cpp:** emits the op inside `build_dense_feed_forward`, LFM2-only on purpose.

### Board flow

1. `scripts/deploy/deploy-fabric.sh`: bitstream + DT overlay, `xmutil loadapp`, udmabuf.
2. `scripts/deploy/reload-full-llama.sh`: copy llama-mods into the llama.cpp tree, then
   rebuild.
3. `scripts/profiling/run_profile_{accel,cpu}.sh <threads> [repeat]`: benchmark, power and
   peak-RSS log. `MODEL` and `LOG_DIR` can be overridden from the environment.

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
    **ISR is toggle-on-write:** clear it by writing back the bits read as set. Writing 1 to
    a clear ISR sets it (bug 3).
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
hls_experiments/         q4k_final/ (shipped), rebuild_x16/ (INT16 X1/X2, routed),
                         rebuild_s2fix/ (current: + Stage 2 STABLE fix, cosim harness),
                         testblock/changelog.txt, experiments.txt,
                         earlier designs
scripts/                 deploy/, profiling/, plotting/, analysis/ (APM tools, kld_ref.sh),
                         results/ (rebuild_s2fix_final_20261024/, rebuild_x16_20261023/, kld_ref_20261024/, ...)
cpu_profiling/           per-op CPU profile (FFN = 68.08% of decode node time)
latest_findings.md       one-page summary of the final results
disi_thesis_template/,   thesis material — edit only when asked
latex/                   (latex/tesi_corrected/ is the untracked Overleaf copy)
```
