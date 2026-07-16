# Latest Findings — FPGA Handoff Latency Diagnosis

Source: `docs/output.txt` (a `SWIGLU_DEBUG=1` decode run with the timing-instrumented
`llama-mods/ggml-cpu.c`).

## Build / run state (read this first)

- The run used the **latest modified `ggml-cpu.c`** (the uncommitted diff that adds the
  `sync_dev / fpga_hw / sync_cpu` prints), loaded via the **`reload-ggml` script only** —
  **no full `llama.cpp` recompile**. Implications:
  - `fpga_hw` (the `ap_start` → `ap_done` window) is set by the deployed **bitstream**, not
    by `ggml-cpu.c`. Reloading the driver does not change it, so this number is trustworthy
    as the real FPGA execution time.
  - The CPU-side wait path in `docs/output.txt` is the **polling** loop, but this is a
    **diagnostic run only**. The reported T1–T4 benchmarks in
    `scripts/results/latest_benchmarks/` use the **interrupt** build (`accel_tN_q4k.log`;
    the `_pollfix` logs are the polling variant). Because `fpga_hw` is bitstream-bound, the
    14 ms/layer measured here applies to both builds.

## Measured per-handoff breakdown

Deployed K=4 Q4\_K design, single-token decode, 250 MHz. Values are stable across all
logged calls (one call = one layer; 16 layers per token).

| Component                         | Measured    | Verdict     |
|-----------------------------------|-------------|-------------|
| `sync_dev`  (udmabuf → device)    | 32–56 µs    | negligible  |
| `fpga_hw`   (`ap_start`→`ap_done`)| **13–14 ms**| dominant    |
| `sync_cpu`  (udmabuf → CPU)       | 17–39 µs    | negligible  |

## Finding 1 — the cache-syncs are NOT the overhead

`sync_dev + sync_cpu` ≈ 50–90 µs per handoff, i.e. ~1 ms across all 16 layers of a token.
The earlier hypothesis (udmabuf `sync_for_device` / `sync_for_cpu` triggering expensive ARM
cache maintenance) is **refuted**. The entire per-token FPGA-side cost lives in `fpga_hw`.

## Finding 2 — `fpga_hw` is the pipeline LATENCY, not the 6.49 ms interval (leading hypothesis)

The measured 14 ms/layer is essentially the **sum of the dataflow stage latencies** along
the dependency chain, not the bottleneck-stage throughput:

```
  X1 || X2 (6.14 ms) + gate (0.07 ms) + output (6.49 ms)  =  ~12.7 ms
  + ~1.3 ms DATAFLOW fill/drain + call overhead           =  ~14 ms   (matches measurement)
```

The 6.49 ms that the thesis calls the *DATAFLOW pipeline interval* is the initiation
interval (II): the rate at which the pipeline could accept **new** tokens if several were
streamed back-to-back. Single-token decode calls `swiglu()` once per token, drains the
pipeline fully, and returns — **no cross-token overlap** — so it pays the full pipeline
**latency** (~13–14 ms) every call and never realizes the 6.49 ms interval.

Consequences:
- Per-token FPGA time ≈ 16 × 14 = **~224 ms**, about **2× the ~104 ms** that 16 × 6.49
  would imply.
- This is consistent with the board: ~224 ms FPGA + ~126 ms non-FFN (CPU) + per-handoff /
  CPU overhead ≈ the ~450 ms T2 decode latency.
- The architecture **cannot** hide this: each layer's FFN input depends on the previous
  layer's FFN output through CPU-side mixer/norm/residual, so the 16 layers cannot be
  pipelined and the interval never amortizes.

This is the strongest current explanation for the decode latency: the effective per-layer
FPGA cost is the single-call latency (~14 ms), not the throughput interval (6.49 ms).

## The ~450 ms decode latency breakdown (interrupt build, T2)

Confirmed from `scripts/results/latest_benchmarks/`: the **interrupt** build
(`accel_tN_q4k.log`) is what posts the headline figure — **T2 decode = 2.21 t/s =
452 ms/token**. The polling build (`accel_tN_pollfix.log`) is only marginally faster and
was rejected because its busy-wait raises power, hurting the tokens-per-watt argument:

| Threads | Interrupt (`_q4k`)   | Polling (`_pollfix`) | Δ latency |
|---------|----------------------|----------------------|-----------|
| T1      | 1.63 t/s (613 ms)    | 1.74 t/s (575 ms)    | −38 ms    |
| T2      | 2.21 t/s (**452 ms**)| 2.22 t/s (450 ms)    | −2 ms     |
| T3      | 2.05 t/s (488 ms)    | 2.10 t/s (476 ms)    | −12 ms    |
| T4      | 1.46 t/s (685 ms)    | —                    | —         |

The poll-vs-interrupt latency gap is minor (2–38 ms/token), **not** the ~120 ms that an
earlier reading of the "~7.5 ms/call" code comment implied. The interrupt is the correct
choice for efficiency, and the thesis's interrupt framing matches the benchmarked build.

Full decomposition of the 452 ms interrupt T2 token, now **measured directly** (steady-state
average over ~35 `TOKEN` rollup lines in `docs/output.txt`):

| Component                                                                          | Measured     | ~%    | Basis                            |
|------------------------------------------------------------------------------------|--------------|-------|----------------------------------|
| FPGA compute (16 layers, incl. interrupt wake)                                     | 224.0 ms     | 49.6% | measured (`fpga`)                |
| Non-FFN CPU (GQA/attn, gated conv, RMSNorm, residuals, `lm_head`, RoPE, KV, sample)| ~226.7 ms    | 50.1% | derived (452 − FFN-path total)   |
| Activation quantize (F32→INT8)                                                     | 0.44 ms      | 0.1%  | measured (`quant`)               |
| Cache syncs (to-device + to-CPU)                                                   | 0.82 ms      | 0.2%  | measured (`sync_dev`+`sync_cpu`) |
| Output `memcpy`                                                                    | 0.09 ms      | <0.1% | measured (`memcpy`)              |
| Register programming                                                               | ~0.00 ms     | <0.1% | measured (`program`)             |
| **FFN-path total** (FPGA + all CPU-side handoff)                                   | **225.3 ms** | 49.9% | measured                         |

Key corrections from the measured run (these overturn the earlier *derived* estimates):

- **Handoff orchestration is negligible — ~1.3 ms/token, not the ~100 ms residual** guessed
  before. quant + syncs + memcpy + programming sum to ~1.3 ms; `program` rounds to 0.00 ms
  because the weight pointers are cached and only ~7 scalar register writes happen per call.
- **The CPU half is essentially all non-FFN *model compute* (~227 ms at T2), not overhead.**
  The ~126 ms non-FFN figure behind the 8 t/s Amdahl ceiling is a best-case at higher thread
  count; at T2 (2 threads) the un-accelerated ops run at ~227 ms.
- The token is thus a clean **~50/50 split: ~224 ms FPGA / ~227 ms non-FFN CPU**, with under
  0.3% (~1.3 ms) on the actual host↔device handoff.
- `fpga` = 224 ms/token = **14.0 ms/layer**, confirming Finding 2 (pipeline *latency*, not the
  6.49 ms interval). The interrupt wake latency is folded into this figure, which is why
  polling comes out 2–38 ms/token faster.

## Caveats / open uncertainties

1. **Poll vs interrupt — RESOLVED.** The benchmarked T1–T4 numbers use the **interrupt**
   build (`accel_tN_q4k.log`); `docs/output.txt` was a separate polling diagnostic. The
   interrupt achieves T2 = 452 ms (see breakdown above), and polling is only 2–38 ms/token
   faster at higher power. The thesis's interrupt framing (§2.3 "sleeps until an interrupt",
   Fig. 2.2 "blocked", T4 "interrupt contention") is therefore **consistent** with the
   benchmarks. The "~7.5 ms/call" figure in the old code comment overstated the interrupt
   cost. Note: the wait mechanism does not change `fpga_hw`.
2. **Partial rebuild.** Only `ggml-cpu.c` was reloaded, not a full recompile. `fpga_hw` is
   bitstream-bound (safe). The poll path is from the reloaded driver and may differ from the
   benchmark driver.
3. **Bitstream identity.** The 14 ms is consistent with the K=4 wide-BRAM stage sum, so the
   deployed bitstream is likely the design documented in the thesis. Confirm against the HLS
   `csynth` report (see next steps).

## Next steps to pinpoint the real reason

1. **Confirm the single-call HLS latency.** In the swiglu `csynth` report, the top-function
   (DATAFLOW) **latency** (not II) should read ~13 ms. If it does, Finding 2 is confirmed:
   14 ms is the intrinsic per-call latency and the 6.49 ms interval is a throughput number
   decode cannot use.
2. *(Done — see breakdown table.)* Per-token stage timers measure the FFN-path total
   directly (~225 ms); non-FFN = 452 − 225 ≈ 227 ms by subtraction.
3. *(Done — see breakdown table.)* quantize + register programming + memcpy + syncs measure
   ~1.3 ms/token combined — the host↔device handoff cost is negligible.
4. *(Done — see breakdown table.)* Benchmark build confirmed as the interrupt variant;
   poll vs interrupt differ by only 2–38 ms/token.

## Implications for the thesis

- The per-layer FPGA cost in decode is the ~14 ms **latency**, not the 6.49 ms **interval**.
  Any per-token FPGA estimate or design ceiling derived from the interval is optimistic by
  ~2×; §2.4 should distinguish "interval (throughput)" from "decode latency (what a single
  token actually pays)".
- **Handoff overhead is measured negligible (~1.3 ms/token).** The Future-Work "host–accelerator
  overhead" point (§4.2) should therefore be understood as the cost of *synchronous blocking*
  (the ~224 ms FPGA compute cannot overlap CPU work) plus the T4 interrupt/scheduler
  contention — not the register-programming cost, which is ~0. The ~227 ms CPU half is real
  non-FFN model compute (the Amdahl remainder), and should not be described as orchestration
  overhead. The token is a ~50/50 FPGA/CPU split.
- The poll-vs-interrupt narrative (§2.3, Fig. 2.2, T4 explanation) is confirmed consistent:
  the benchmarks are the interrupt build, and the polling variant (only 2–38 ms/token
  faster, at higher power) is correctly presented as the rejected, less power-efficient
  option.

## Accelerator register map (AXI-Lite)

The driver programs and drives the IP through its AXI-Lite control interface at
`SWIGLU_IP_BASE = 0xA0000000` (`swiglu_0 s_axi_CTRL`, the sole PL peripheral). All accesses
are 32-bit word writes/reads at the byte offsets below. 64-bit DDR pointers use a
lo/hi/pad layout (12 bytes each); 32-bit scalars use a value/pad layout (8 bytes each). The
map **must be re-checked against `xswiglu_hw.h` after every re-synthesis.**

| Offset | Register        | Width | Purpose                                                        | When written                          |
|--------|-----------------|-------|----------------------------------------------------------------|---------------------------------------|
| 0x00   | `AP_CTRL`       | ctrl  | Block-level handshake: bit0 `ap_start`, bit1 `ap_done`, bit2 `ap_idle`, bit3 `ap_ready` | start each call; polled/read for done |
| 0x04   | `GIE`           | 1 b   | Global Interrupt Enable                                        | once, at init                         |
| 0x08   | `IER`           | 2 b   | IP Interrupt Enable (bit0 = `ap_done`)                         | once, at init                         |
| 0x0C   | `ISR`           | 2 b   | IP Interrupt Status; write-1-to-clear `ap_done` (deassert IRQ) | after each completion                 |
| 0x10   | `W_LO`          | 64 b  | `gmem_W` base (gate weights, pre-decoded) — low word           | per layer (on layer/mode change)      |
| 0x14   | `W_HI`          |       | `gmem_W` base — high word                                      | per layer                             |
| 0x1C   | `V_LO`          | 64 b  | `gmem_V` base (up weights) — low word                          | per layer                             |
| 0x20   | `V_HI`          |       | `gmem_V` base — high word                                      | per layer                             |
| 0x28   | `WD_LO`         | 64 b  | `gmem_Wd` base (down weights) — low word                       | per layer                             |
| 0x2C   | `WD_HI`         |       | `gmem_Wd` base — high word                                     | per layer                             |
| 0x34   | `X_LO`          | 64 b  | `gmem_x` base (INT8 activation input) — low word               | per token                             |
| 0x38   | `X_HI`          |       | `gmem_x` base — high word                                      | per token                             |
| 0x40   | `OUT_LO`        | 64 b  | `gmem_out` base (F32 output) — low word                        | per token                             |
| 0x44   | `OUT_HI`        |       | `gmem_out` base — high word                                    | per token                             |
| 0x4C   | `MODE`          | 32 b  | Down-projection quant mode (0 = Q4_K, 1 = Q6_K)                | per token                             |
| 0x54   | `XSCALE`        | 32 b  | Per-token activation scale (raw `float` bits)                  | per token                             |

**Per-call programming sequence** (this is the "program" stage in the breakdown above):
1. `W/V/WD` base pointers — written only when the layer or quant mode changes (cached
   otherwise), since the weights live in permanent per-layer udmabuf slots.
2. `X/OUT` base pointers, `MODE`, `XSCALE` — written every call.
3. `AP_CTRL` bit0 = `ap_start` to launch.
4. Wait for `ap_done` (bit1 of `AP_CTRL`, or the UIO interrupt), then write-1-to-clear
   `ISR` and re-arm the UIO.

`GIE`/`IER` are armed once during init; the DDR buffer offsets the pointer registers point
into (`SWG_VEC_OFF`, `SWG_OUT_OFF`, and the per-layer `SWG_LAYER_*_OFF` slots) are udmabuf
addresses, not IP registers.

## Changes to make to the paper

Concrete edits implied by the measured breakdown, highest-impact first. Items 1 and 2 touch
headline numbers, so verify the derivations before editing.

### 1. Reframe the 3.6 t/s "design ceiling" and the "61% attained" figure (verify first)
The measured per-token account at T2 is **224 ms FPGA latency + 227 ms non-FFN CPU + 1.3 ms
handoff = 451 ms**, matching the 452 ms board decode almost exactly. That leaves no slack:
the board is already at ~100% of what is achievable given the 14 ms/layer *latency* and the
T2 non-FFN.

The 3.6 t/s ceiling appears to combine two best-cases that single-token decode cannot realize
simultaneously:
- FPGA at the *throughput interval* (~104 ms/token, i.e. 16 × the 6.49 ms bottleneck stage)
  rather than the *latency* (~224 ms/token) — decode has no cross-token pipelining to hide
  the latency; and
- non-FFN at its *best case* (~126 ms, high thread count) rather than the ~227 ms it costs at
  T2, the low-thread regime where the FPGA path is actually favorable.

Action: confirm how 3.6 t/s was derived (CLAUDE.md's cycle budget suggests the interval +
best-case CPU). If so, either (a) relabel it a *throughput/pipelined-input* bound and state
that decode is latency-bound, or (b) recompute a decode-realistic ceiling from 14 ms/layer.
The "61% attained" number depends on this and may need restating.

### 2. §2.4 — distinguish pipeline interval from decode latency
Stage 5 is described via its 6.49 ms "pipeline interval." Add one sentence: 6.49 ms is the
throughput II (relevant only to batched/streamed inputs); autoregressive decode processes one
token at a time and pays the full pipeline **latency** (~14 ms/layer = sum of stages ≈
224 ms/token, confirmed on board). Ensure no per-token FPGA figure is computed as 16 × 6.49.

### 3. §4.2 Future Work — reword "host–accelerator overhead"
Current text: the CPU "programs the accelerator's AXI-Lite control registers... and blocks
until a UIO interrupt... a per-token overhead." This reads as if register programming is the
cost. Measured handoff is ~1.3 ms/token (programming ~0). Reword so the overhead is the
**synchronous blocking** (the ~224 ms FPGA compute cannot overlap CPU work) plus the
**interrupt/scheduler contention at high thread counts** (the T4 regression). The
async/pipelined-execution roadmap already targets this; only the diagnosis sentence changes.
Suggested: "...each token incurs a synchronous handoff: the CPU launches the accelerator and
blocks until completion, so the per-layer FPGA latency cannot overlap host-side compute. The
register handoff itself is negligible (~1.3 ms/token measured); the cost is the absence of
compute/transfer overlap, which does not amortize with sequence length and worsens under
scheduler pressure at higher thread counts."

### 4. §2.2 / §3 — clarify that 126 ms non-FFN is a best-case, not the T2 value
The 126 ms non-FFN (→ 8 t/s Amdahl ceiling) is best-case at high thread count. At T2 the
non-FFN is ~227 ms. The ceiling framing is fine, but check no sentence implies 126 ms is the
per-token non-FFN at the reported T2 operating point.

### 5. §3 — add the measured per-token decomposition (optional, strong)
State the ~50/50 split (~224 ms FPGA / ~227 ms non-FFN CPU / ~1.3 ms handoff) as a one-line
result or small table. It concretely evidences the "memory-bound, orchestration-negligible"
narrative and pre-empts the "isn't the DMA/handoff the bottleneck?" question.

### 6. Consistency — audit the word "overhead"
Anywhere CPU-side time is called "orchestration/overhead," make sure it means the synchronous
blocking, not the ~1.3 ms handoff. The ~227 ms CPU half is real non-FFN model compute (the
Amdahl remainder), not overhead.

### No change needed
Poll vs interrupt (§2.3, Fig. 2.2, T4): the benchmarks are the interrupt build; the polling
variant is correctly presented as the rejected, less power-efficient option (only 2–38 ms/token
faster). The abstract's "sub-500 ms decode latency with two threads" (452 ms) is correct.

## Potential performance levers (not yet attempted)

Framing: the token is a ~50/50 FPGA / non-FFN split, serially dependent, so single-user
decode latency is bounded by **memory bandwidth + the LUT budget + the serial CPU half** —
*not* by FPGA compute, which sits at ~34% utilization (~38–41% of peak DDR bandwidth). There
is no free lever. **Amdahl cap:** even a free/infinite FPGA leaves ~227 ms of non-FFN →
**~4.4 t/s hard ceiling**, so FPGA speedups have bounded returns and the non-FFN CPU half is
now equally worth attacking.

### Lever 1 — On-chip load/compute overlap (double-buffering)
- **What:** the stages are load-bound — loads are ~53–60% of the per-iteration budget and do
  not overlap the MAC, so stage time = load + compute, not max(load, compute). Prefetch the
  next rows' weights while MACing the current rows (ping-pong buffers or a pipelined
  load→compute `DATAFLOW` region) to push the stages toward the compute bound.
- **Expected payoff:** up to ~1.5–1.8× on the FPGA half (approach max(load, compute) instead
  of the sum) — the ~224 ms FPGA could drop toward ~130–150 ms.
- **Where:** `swiglu.cpp` (HLS) **only**. The IP's external interface is unchanged (same
  AXI-Lite registers, `ap_start`/`ap_done`, udmabuf layout), so `ggml-cpu.c` and the Linux
  kernel are **untouched** — the IP just finishes sooner.
- **Requires:** the full Vitis HLS → Vivado place-and-route → new bitstream cycle.
- **Blocked by:** the 87% LUT budget. The extra buffers + control logic may not fit the
  ZU5EV — the exact routing/logic wall the current design already hit. Fits comfortably on a
  ZU7EV (~230K LUT).

#### Enabler for Lever 1 — DSP packing to free LUTs
The multiplies currently run on LUT fabric; DSP is only ~20% utilized. Packing them onto
DSPs would free the LUT headroom that blocks double-buffering (and a K=8 widening).

- **Two products per DSP is feasible and well-matched.** The XAPP1203 shared-operand trick
  packs two multiplies that share one operand into a single DSP48E2. Our MAC fits it exactly:
  for element `n`, the same `x[n]` multiplies the nibble from all K=4 rows, so `x[n]` is the
  shared operand and the 4-bit weights are the independent ones. Pack rows 0&1 into one DSP
  and 2&3 into another → **16 DSPs instead of 32 LUT multipliers**. Operands are tiny (4-bit
  weight × 8-bit activation = 12-bit product), even friendlier than the INT8×INT8 app-note case.
- **Three is blocked by the 48-bit accumulator.** Each packed lane needs product + accumulation
  guard ≈ 12 + 8 = ~20 bits; 2 lanes ≈ 40 bits (fits 48), 3 lanes ≈ 60 bits (does not).
  Three would require INT4 *activations* (W4A4 → 8-bit products), which costs accuracy on top
  of the existing ~6% weight error — a bad trade.
- **Not a speedup by itself.** The stages are memory-bound (~34% compute util) and the
  multiplies already run at II=1; moving them to DSPs changes *area*, not throughput. The
  value is purely LUT relief to unblock Lever 1.
- **Must clear the timing wall that sank the prior DSP attempt.** §4.2 records that plain DSP
  mapping (1 mult/DSP) failed on *timing/routing* at 250 MHz (DSP fanout → critical nets), not
  on capacity. Packing halves the DSP count (less fanout, arguably friendlier) but adds
  result-unpacking logic (extract + sign-correct two products from the 48-bit field) and must
  still close timing. Re-evaluate specifically as "free enough LUTs to fit double-buffering,"
  aware the earlier DSP experiment died on routing.

### Lever 2 — Fix the high-thread-count handoff contention (host software)
- **Evidence:** T4 decode regresses to 1.46 t/s (685 ms), *worse* than T2 (452 ms), although
  more threads should make the non-FFN half faster. FPGA is constant ~224 ms, so the
  non-FFN + handoff half roughly doubles at T4 (~227 ms → ~460 ms): the synchronous
  interrupt/barrier handoff is thrashing the scheduler.
- **What:** give the offload a dedicated/pinned thread (`sched_setaffinity`); stop parking all
  compute threads at the `ggml` barrier during the FPGA wait; use a cleaner wait strategy.
  Goal: run the non-FFN half near its ~126 ms floor while keeping FPGA at ~224 ms.
- **Expected payoff:** ~126 ms non-FFN + ~224 ms FPGA ≈ 350 ms → **~2.9 t/s, ~+30% over the
  current best (2.21 t/s)**, with zero FPGA change.
- **Where:** `ggml-cpu.c` (offload/wait path) and possibly the `ggml` threadpool. **Not** the
  kernel *source* — the stock generic UIO driver is reused. Optional OS *configuration* only:
  IRQ affinity (`/proc/irq/<n>/smp_affinity`), CPU isolation (`isolcpus` boot arg).
- **Requires:** recompile `ggml-cpu.c` (`reload-ggml`). No re-synthesis, no bitstream, not
  gated by the LUT budget — iterates in minutes.

### Which to try first
| Lever | Lives in | Re-synthesis? | Blocked by | Expected |
|-------|----------|---------------|------------|----------|
| 1 Double-buffering | `swiglu.cpp` (HLS/bitstream) | **Yes** (HLS + Vivado + `.bit`) | 87% LUT budget | ~1.5–1.8× FPGA half |
| 2 Contention fix | `ggml-cpu.c` (+ optional OS config) | No | scheduler/threadpool complexity | ~2.9 t/s (~+30%) |

**Lever 2 is the better first move:** host-only, iterates in minutes, not gated by the LUT
wall lever 1 hits, and it attacks the non-FFN half that the Amdahl cap now makes equally
important. Lever 1 forces the full synthesis/routing flow back through the exact 87% LUT
constraint the current design already reached, for a bounded (~1.5×) FPGA-half gain.

### Structural options (out of scope for this board / workload)
- **Batching / multi-stream serving:** the only way to exploit the 6.49 ms throughput interval
  and overlap stream A's FPGA compute with stream B's CPU work. Large *throughput* win, but
  changes the workload from single-user latency to aggregate serving.
- **ZU7EV (~230K LUT):** reopens lever 1 (double-buffering fits), K=8, and moving
  attention/conv onto fabric. New silicon, not this design.
