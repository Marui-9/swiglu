# Latest Findings (2026-10-24)

Current design: **rebuild_s2fix**. It is the load/compute-overlap rebuild with INT16 ±32
X1/X2 and the Stage 2 `STABLE` fix (Vitis HLS / Vivado 2025.2), on the board on 2026-10-24.
This file collects what the board measurements established and what is still open. The
history section at the end keeps the q4k_final diagnosis that motivated the rebuild.

Sources (every number below comes from one of these; "derived" marks arithmetic on them):
- board: `scripts/results/rebuild_s2fix_final_20261024/README.md`, `bench/`, `apm_*.txt`,
  `ppl_hw.log`
- build: `hls_experiments/rebuild_s2fix/{README.md, csynth.rpt, utilization.txt,
  utilization_hier.txt, timing_4.000ns.txt, timing_4.000ns_margin0.3.txt}`
- before the fix: `scripts/results/rebuild_x16_20261023/`, `hls_experiments/rebuild_x16/`
- accuracy history: `scripts/results/fixed_driver_20261023/` (INT8 ±10 X1/X2)
- quantization reference: `scripts/results/kld_ref_20261024/`
- q4k_final: `scripts/results/latest_benchmarks/*_q4k.log`, `docs/output.txt`,
  `hls_experiments/q4k_final/`

## Headline

All runs: `LFM2.5-1.2B-Thinking-Q4_K_M-allQ4Kffn.gguf` (661.76 MiB per llama-bench) on
**both** paths, llama-bench `-p 12 -n 64 -r 10`, ollama stopped, 250 MHz.

| T | FPGA+CPU tg64 | CPU-only tg64 | Speedup (derived) | Power FPGA+CPU / CPU | J/token (derived) |
|---|---|---|---|---|---|
| 1 | 1.94 | 0.93¹ | 2.09× | 4.48 / 4.28 W | 2.31 / 4.60 |
| 2 | 2.92 | 1.76¹ | 1.66× | 4.78 / 4.60 W | 1.64 / 2.61 |
| 3 | **3.53** | 2.54 | 1.39× | 4.92 / 4.86 W | 1.39 / 1.91 |
| 4 | 3.24 | **2.69** | 1.20× | 4.71 / 4.76 W | 1.45 / 1.77 |

¹ The CPU-only T1/T2 values were measured on 2026-10-23 (`rebuild_x16_20261023/bench/`).
The same-session control at T3/T4 is within 0.04 t/s of that day.

- Best against best: 3.53 vs 2.69 t/s, **1.31×** (derived).
- Accuracy at that speed, FPGA+CPU vs CPU-only on the same GGUF (wikitext-2, 6 × 256, T2):
  mean KLD **0.030154**, PPL ratio **1.034376 ± 0.011605**, same top token 87.795 %.
  These values are identical to rebuild_x16's in every chunk.
- Prefill pp12: 2.88 / 4.20 / 4.92 / 5.11 t/s for FPGA+CPU; 1.15 / 2.28 / 3.36 / 4.00 for
  CPU-only.
- Peak RSS (VmHWM): 694 MiB on both paths. FPGA+CPU also holds the 512 MiB udmabuf, which
  RSS does not count.

## Finding 1: board time equals the csynth latency

| | q4k_final | rebuild_x16 | **rebuild_s2fix** |
|---|---|---|---|
| csynth latency | 12.70 ms | 8.05 ms | **8.08 ms** (2,020,192 cy) |
| standalone call (APM) | 13.810 ms² | 11.258 ms² | **8.017 ms** (mean of 49) |
| in llama.cpp, per call (derived) | 14.0 ms | 11.34 ms | **8.09 ms** |
| board / csynth (derived) | 1.10 | 1.41 | **1.00** |

² Trace end of the layer-0 APM trace (`apm_before/stages.txt`).

- Per token, the driver's `fpga=` reads 129.45-129.63 ms over 16 calls at every thread
  count.
- Compare board time with the csynth **latency**, not the DATAFLOW interval (1,282,063 cy).
  A single-token call fills and drains the pipeline, and the next layer's input depends on
  this layer's output. The old "1.5-2× HLS-vs-board gap" came from comparing against the
  interval.

## Finding 2: loop-body DATAFLOW serialized while csynth reported it overlapped

This caused the 1.41 ratio of the first overlapped build.

- **Located on the board.** The DDR controller's AXI performance monitor (`swg_apm.c`,
  `apm_stages.py`) split one call by stage. Stage 2 took 6.102 ms, 745 cy/iteration;
  csynth said 348. Stage 5 took 5.064 ms, 1,236 cy/iteration, against csynth's 1,249.
- **Reproduced in cosim.** A reduced design (32 iterations) with
  `cosim.enable_dataflow_profiling` gave 746 cy/iteration: a 401-cy load plus a 343-cy
  MAC, back to back.
- **Cause.** HLS synchronizes successive instances of a loop-body dataflow region on the
  caller variables the body touches: W, x_local, x_scale and X_cache.
- **Fix.** `#pragma HLS STABLE` on W/V, x_local and x_scale inside the body. The MAC writes a
  local `X1_loc`/`X2_loc`, which `COPY_X1`/`COPY_X2` copy out after the loop (8,193 cy).
  - Cosim then gives 344 cy/iteration and the board 348.
  - `STABLE` on X_cache itself also overlaps, but 16 of 256 cosim outputs read stale
    values, so that variant was discarded.
  - Stage 5 (DOWN_Q4K) had inferred-stable inputs and a local `out_local` from the start.
- **Effect.**
  - Stage 2: 6.102 → 2.847 ms.
  - The W port (S4) reads 3.68 GB/s during Stage 2 (1.72 before), 92 % of the 4.0 GB/s
    peak of a 128-bit port at 250 MHz (derived).
  - Decode: 1.10 / 1.15 / 1.18 / 1.19× over rebuild_x16 at T1-T4 (derived).
- **Rule:** check every loop-body DATAFLOW with a cosim dataflow profile. The csynth
  interval cannot show this.

## Finding 3: where a T2 token goes

From the mean of 765 `[SWG] TOKEN` lines in `bench/accel_t2_*.log` (derived):

| Component | ms/token |
|---|---|
| `fpga` (16 calls, including the interrupt wake) | 129.50 |
| `quant` (x → INT8) | 0.41 |
| `sync_dev` + `sync_cpu` | 0.76 + 0.42 |
| `memcpy` | 0.08 |
| `program` | 0.00 |
| **FFN-path total** | **131.17** |
| rest of the graph (342.5 − 131.2) | 211.3 |
| **token** (1 / 2.92 t/s) | **342.5** |

- **Handoff is small:** FFN path − fpga = 1.62-1.67 ms per token at T1-T4.
- **The CPU part now dominates.** The rest of the graph is 384.2 / 211.3 / 152.1 / 177.6 ms
  at T1-T4 (derived). At T2 it is 1.6× the FFN path. It does not depend on the bitstream:
  rebuild_x16 gave ~212 ms at T2.
- **Amdahl bound with a zero-time FFN** (derived): 1 / 211.3 ms = 4.7 t/s at T2, and
  1 / 152.1 ms = 6.6 t/s at T3.
- **T4 is slower than T3** (3.53 → 3.24 t/s) while `fpga` is unchanged. The loss is in the
  CPU part: 152.1 → 177.6 ms. CPU-only gains only 2.54 → 2.69 t/s over the same step. The
  cause has not been measured.
  - The old "interrupt contention" explanation is not established. Both bitstreams show
    it, and so does CPU-only, as diminishing returns.

## Finding 4: accuracy needed the driver fixes and INT16 X1/X2

- **Three driver bugs** made the q4k_final throughput runs compute wrong values. All fixes
  are in `llama-mods/ggml-cpu.c`.
  1. The host header layout did not match what the IP reads.
  2. The x/out buffers overlapped layer 3's W slot.
  3. ISR is toggle-on-write: an unconditional `ISR = 1` at init set it on a fresh
     bitstream.
- **INT8 ±10 X1/X2 lost accuracy.**
  - With the fixed driver, the IP matched a C emulation of itself (cos ≥ 0.99946). Against
    float `build_ffn()` the cosine was only 0.9569-0.9944.
  - Real |gate·x| ≤ 4.24 and |up·x| ≤ 1.80, so 801-2,347 of 8,192 gate·x values per layer
    rounded to 0.
  - Board accuracy: KLD 0.384800, PPL ratio 1.081368, same top token 63.255 %.
- **INT16 ±32** (rebuild_x16, kept in s2fix):
  - 10-38 values per layer below half a step.
  - Per-layer cos 0.9930 / 0.9984 min / mean. The IP vs its INT16 emulation gives
    ≥ 0.99980.
  - KLD 0.030154, i.e. 12.8× lower (derived).
  - Cost: BRAM_18K 150 → 166 in csynth; latency unchanged.
- **The remaining error** comes from the INT8 x and h stages. INT16 X1/X2 alone emulates at
  cos 1.0000. A per-token X1/X2 scale emulated as well as no X1/X2 quantization, but it
  needs a second pass, so it was not taken.

## Finding 5: quantization cost against f16/q8_0 (`kld_ref_20261024/`)

Reference logits: the Thinking f16/q8_0 GGUF on the PC, 24 × 256 chunks of wikitext-2,
reference PPL 47.1429. The KV260 runs use `kld_ref.sh`.

| Model / path | Mean KLD vs ref | PPL ratio | Same top |
|---|---|---|---|
| Q4_K_M-fromf16q8, CPU (PC) | 0.153433 | 1.184104 | 77.264 % |
| allQ4Kffn, CPU (KV260, run 2) | 0.166073 | 1.173772 | 75.951 % |
| allQ4Kffn, FPGA+CPU (KV260, run 3) | 0.210197 | 1.222886 | 73.852 % |
| allQ4Kffn, FPGA+CPU vs CPU (24 chunks, run 5) | 0.034755 | 1.045784 | 88.091 % |

- The KV260 runs used `-t 4` and the rebuild_s2fix bitstream (2026-10-24). PPL(base) is
  47.009676 in all three ref rows, recomputed from the stored logits.
- **Q4_K on every down projection** costs KLD +0.013 over the default Q4_K_M mix on the
  CPU (derived); the PPL ratios overlap within their errors (1.174 ± 0.016 vs
  1.184 ± 0.015).
- **The FPGA path adds KLD +0.044** to the CPU's 0.166 against f16/q8_0 (derived): about a
  quarter of what the 4-bit weights cost.
- **Directly against the CPU**, 24 chunks give KLD 0.035 and a PPL ratio of 1.046. At chunk
  6 the running values equal the 6-chunk run of Finding 4 exactly (KLD 0.03015, same top
  87.795 %), so the rise comes from chunks 7-24, not from `-t 4`.

- The stock `LFM2.5-1.2B-Thinking-Q4_K_M.gguf` (md5 d3cbb0bc…) is corrupt from blk.4 on:
  NaN / ±3e38 norms, PPL 65536. The q4k_final CPU-only runs very likely used it, so their
  timing is valid but their output is unchecked.

## Implementation

- **Routed:** LUT 101,522 (86.68 %), FF 140,950 (60.17 %), BRAM36 60.5 (42.01 %),
  URAM 8 (12.50 %), DSP 238 (19.07 %). swiglu_0 alone uses 97,172 LUTs.
- **Timing at 4.000 ns:** WNS +0.145 ns, TNS 0, WHS +0.010 ns.
  - Implemented with +0.300 ns of setup uncertainty: against that, WNS −0.155 ns over 408
    endpoints.
  - Worst path: a down-MAC DSP (`MAC_GRP`).
- **Cost of the fix vs rebuild_x16:** +2,371 LUT and +8 BRAM36 (derived). rebuild_x16 ran
  at 4.04 ns, so the WNS change does not isolate the fix.
- **csynth stage latencies:**

  | Stage | Cycles |
  |---|---|
  | load_x_local | 202 |
  | compute_X1 ∥ X2 | 721,303 each (loop 713,106 + copy 8,193) |
  | compute_gate | 16,622 (pass 1 8,254, pass 2 8,273) |
  | compute_output | 1,282,062 (1,024 × 1,249 + 2,051-cy output write + fill) |

- **Every MAC stage is MAC-bound.**
  - Stage 2: load 320 / MAC 347 → 348 cy/iteration, K = 4.
  - Stage 5: load 960 / MAC 1,248 → 1,249 cy/iteration, K = 2.

## Register map (AXI-Lite CTRL at 0xA0000000)

From `xswiglu_hw.h` of the s2fix IP (`~/Desktop/Vivado_proj/swiglu_s2fix/ip/drivers/`).
64-bit pointers take three words (lo, hi, pad).

| Offset | Register | Notes |
|---|---|---|
| 0x00 | AP_CTRL | bit0 ap_start (COH), bit1 ap_done (COR), bit2 ap_idle, bit3 ap_ready (COR). Live state, not RAM |
| 0x04 | GIE | armed once at init |
| 0x08 | IER | bit0 ap_done |
| 0x0C | ISR | **toggle-on-write**: write back only the bits read as set |
| 0x10 | W | gate weights, written when the layer changes |
| 0x1C | V | up weights, written when the layer changes |
| 0x28 | W_down | down weights, written when the layer changes |
| 0x34 | x | INT8 activation, `SWG_VEC_OFF` 0x00000000 |
| 0x40 | out | FP32 output, `SWG_OUT_OFF` 0x00010000 |
| 0x4C | MODE | always 0. The IP has no Q6_K path, but the port must stay referenced, or `x_scale` moves off 0x54 |
| 0x54 | XSCALE | float bits of max\|x\|/127 |

UIO init order: open, drain the count, arm GIE/IER, clear ISR, drain again, re-arm.

## What is left

1. **The CPU part of the graph.** At T2 it takes 211 ms against the 131-ms FFN path. The
   two run back to back: the driver blocks the graph until the UIO interrupt arrives.
   - Within one token this cannot overlap, because each layer feeds the next. Overlap
     would need independent work, such as several concurrent sequences.
2. **The T4 regression of the CPU part** (152 → 178 ms). It is unmeasured. Candidates are
   thread placement or the ggml barrier during the FPGA wait, or memory bandwidth. None
   is tested. A pinned offload thread would be a host-only experiment.
3. **Stage 2 is at its port bandwidth** (92 % of 4.0 GB/s). A faster Stage 2 needs more or
   wider HP ports.
4. **Stage 5 is MAC-bound at 16 lanes.** A wider output array did not route on the ZU5EV
   (74K overlaps, changelog entry 63). Going back to K = 4 needs a four-row load shorter
   than the MAC; at present it is 1,908 vs 1,243 cy (q4k_final csynth).
5. **Little area headroom:** 86.68 % LUT and +0.145 ns WNS. The ZU7EV (~230K LUT) would
   give room for a wider Stage 5 or more kernels. Not tried.
6. **Numerical:** the IP's INT8 x and h stages cost KLD +0.044 against f16/q8_0 (Finding 5). Widening them is the next accuracy step.
7. **Commit** the INT16 change, the STABLE fix and the results.

## History: the q4k_final diagnosis (2026-07)

This is what the July version of this file established; it motivated the rebuild.

- **Per call:** q4k_final ran 14.0 ms in llama.cpp (224 ms per 16 calls at T2, interrupt
  build), which is its csynth latency of 12.70 ms × 1.10. It was not the 6.49 ms interval.
- **Per T2 token:** 452 ms = 224.0 ms fpga + 1.3 ms handoff + ~227 ms rest of the graph.
  - quant 0.44, syncs 0.82, memcpy 0.09 and program 0.00 ms per token (`docs/output.txt`).
  - The cache syncs were not the overhead.
- **Polling vs interrupt:** polling was 2-38 ms/token faster at T1-T3 (`_pollfix` logs) at
  higher power, so the interrupt build was kept.
- **Both MAC stages were load-bound:** loads took ~53-60 % of each iteration and did not
  overlap the MAC. This was "Lever 1".
  - Implemented as 6c27523, d4942c8 and 4493272: Stage 5 at K = 2 to fund the PIPO
    buffers, Stages 2a/2b at K = 4.
  - The INT8 sources reached 2,011,996 cy in csynth (Vitis 2025.1).
  - Two HLS idioms each inflated the LUT estimate by tens of thousands before they were
    fixed:
    - complete-partitioned arrays as DATAFLOW channels: +77K LUT / +114K FF;
    - variable shifts: +16K LUT.
- **Projection vs measurement:** the pre-board projection was ~2.6 t/s at T2. rebuild_x16
  measured 2.53 at a 1.41 board/csynth ratio; s2fix measured 2.92 at 1.00.
- **"Lever 2", a host-side fix for the high-thread regression, was never tried.** The T4
  slowdown is still present (What is left, item 2).
- **The DSP-packing idea is moot.** In the current design each MAC lane already binds one
  DSP48E2 (the 8-bit sub-block scale multiply), and the stages are MAC- or port-bound,
  not LUT-blocked.
- **q4k_final throughput:** 1.63 / 2.21 / 2.05 / 1.46 t/s at T1-T4. Those runs used the
  buggy driver (wrong values) and, for CPU-only, very likely the corrupt stock GGUF. Do
  not compare them with the numbers above as like for like.
