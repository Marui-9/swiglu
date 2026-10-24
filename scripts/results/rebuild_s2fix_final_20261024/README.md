# rebuild_s2fix on the board (2026-10-24)

The bitstream is `hls_experiments/rebuild_s2fix/`: rebuild_x16 (INT16 ±32 X1/X2) plus the
Stage 2 STABLE fix. Its README explains the cause and the fix.

## Setup

- **Bitstream:** `design_1_wrapper.bit.bin`, md5 c0ba663515b206bb29b32c9c116f96a8.
  - xmutil app `swiglu-s2fix`, in `/lib/firmware/xilinx/swiglu-s2fix/`.
  - The dtbo (md5 ffdfe9edbf7eecfa9f95d5cd8136042b) and `shell.json` are copied from
    `swiglu-x16`.
- **Clock:** pl0 reads 249,999,998 Hz.
- **Driver:** `llama-mods/ggml-cpu.c`, md5 411bda217443954ec412ddb82f08502c. This is the
  same driver as `../rebuild_x16_20261023/`.
- **GGUF:** `LFM2.5-1.2B-Thinking-Q4_K_M-allQ4Kffn.gguf`, md5
  2e1c6368a0e5ed7ce6cfe2006cdd9d6b, on both paths. llama-bench reports it as 661.76 MiB.
- The board's `ollama` service was stopped.

## IP time, standalone (APM)

`scripts/analysis/swg_apm.c` runs the IP on its own, with no llama.cpp. It times
`ap_start` → `ap_idle` and reads the ZynqMP DDR controller's AXI performance monitor.
`scripts/analysis/apm_stages.py` finds the stage boundaries in the trace. Each matrix read
through slot S4 (W, then W_down) marks the end of a stage.

| Layer 0 | q4k_final | rebuild_x16 | **rebuild_s2fix** |
|---|---|---|---|
| Call, trace end | 13.810 ms | 11.258 ms | **8.018 ms** |
| Stage 2a/2b | 6.836 ms, 835 cy/iter | 6.102 ms, 745 cy/iter | **2.847 ms, 348 cy/iter** |
| compute_gate gap | 0.300 ms | 0.089 ms | 0.103 ms |
| Stage 5 | 6.671 ms, 3,258 cy/iter (K=4) | 5.064 ms, 1,236 cy/iter | 5.065 ms, 1,237 cy/iter |
| csynth latency | 12.70 ms | 8.05 ms | 8.08 ms |

- Sources: `apm_stages.txt` (s2fix) and `apm_before/stages.txt` (the other two). The
  traces are `apm_trace.csv` and `apm_before/*_trace_l0.csv`. Cycles per iteration are
  derived (stage time × 250 MHz ÷ trip count).
- **49 timed calls** (`apm_50.txt`): mean 8017.4 µs, min 8014.7, max 8019.5.
  - Board/csynth = 8.017 / 8.08 ≈ 0.99 (derived). Before the fix it was 1.41 (rebuild_x16)
    and 1.10 (q4k_final).
- During Stage 2, slot S4 (W, through HP2) reads at 3.68 GB/s. Before the fix it read at
  1.72 GB/s.

## Accuracy (`ppl_hw.sh`, `ppl_hw.log`)

- The run used the same GGUF, arguments and CPU KLD base as rebuild_x16
  (`~/ppl16_cpu.kld`, md5 203497f05eeaf7aa0959a4a57e24c922): wikitext-2, `-c 256
  --chunks 6`, T2.
- Every per-chunk and summary value equals rebuild_x16's:

| | rebuild_s2fix |
|---|---|
| PPL(HW) | 51.786869 ± 6.449970 |
| PPL(HW)/PPL(CPU) | 1.034376 ± 0.011605 |
| Mean KLD | 0.030154 ± 0.001239 |
| Same top token | 87.795 ± 1.187 % |
| RMS Δp | 3.056 ± 0.230 % |

## Throughput (`bench/`)

- **Command:** `run_all.sh` → `run_profile_{accel,cpu}.sh <T> 10`. These are the repo's
  `scripts/profiling/` scripts, unchanged. Each runs llama-bench `-p 12 -n 64 -r 10`.
- **Order:** FPGA+CPU at T1-T4, then CPU-only at T3 and T4 as a same-session control.
- **Power** is the run average of the SOM total power.
- **fpga** is the mean of the driver's per-token `fpga=` over the 765 `[SWG] TOKEN` lines
  of each log, i.e. the 16 calls of one token. **FFN path** is the mean of `FFN-path
  total=`.

| T | FPGA+CPU pp12 | tg64 | Power | fpga / FFN path (ms/token) | rebuild_x16 tg64 |
|---|---|---|---|---|---|
| 1 | 2.88 | 1.94 ± 0.00 | 4.48 W | 129.63 / 131.26 | 1.76 |
| 2 | 4.20 | 2.92 ± 0.01 | 4.78 W | 129.50 / 131.17 | 2.53 |
| 3 | 4.92 | **3.53 ± 0.04** | 4.92 W | 129.49 / 131.16 | 2.98 |
| 4 | 5.11 | 3.24 ± 0.12 | 4.71 W | 129.45 / 131.08 | 2.73 |

| T | CPU-only pp12 | tg64 | Power | rebuild_x16 day, pass 1 / pass 2 tg64 |
|---|---|---|---|---|
| 3 | 3.36 | 2.54 ± 0.03 | 4.86 W | 2.54 / 2.55 |
| 4 | 4.00 | **2.69 ± 0.06** | 4.76 W | 2.65 / 2.70 |

- **Peak RSS (VmHWM):** 694 MiB on both paths. FPGA+CPU also holds the 512 MiB udmabuf,
  which RSS does not count.
- **The CPU-only control** matches the 2026-10-23 runs to within 0.04 t/s. So the
  2026-10-23 CPU-only T1/T2 values (0.93 and 1.76 t/s, at 4.28 and 4.60 W,
  `../rebuild_x16_20261023/bench/`) are used for comparison below.

### Derived

| T | FPGA+CPU ms/token | − FFN path = rest of graph | CPU-only ms/token | Decode speedup | J/token, FPGA+CPU / CPU |
|---|---|---|---|---|---|
| 1 | 515.5 | 384.2 | 1075.3 | 2.09× | 2.31 / 4.60 |
| 2 | 342.5 | 211.3 | 568.2 | 1.66× | 1.64 / 2.61 |
| 3 | 283.3 | 152.1 | 393.7 | 1.39× | 1.39 / 1.91 |
| 4 | 308.6 | 177.6 | 371.7 | 1.20× | 1.45 / 1.77 |

- **Best against best:** 3.53 t/s (FPGA+CPU, T3) vs 2.69 t/s (CPU-only, T4), 1.31×.
- **Against rebuild_x16:** tg64 is 1.10× / 1.15× / 1.18× / 1.19× at T1-T4.
- **Per call in llama.cpp:** 129.5 ms ÷ 16 ≈ 8.09 ms. That is 1.00× the csynth latency;
  the standalone APM call takes 8.017 ms.
- **Handoff** (FFN path − fpga): 1.62-1.67 ms per token.
- **Rest of the graph:** it does not change with the bitstream. At T2 it is 211.3 ms,
  against ~212 ms for rebuild_x16. At T4 it is slower than at T3, on both bitstreams.
- **Decode t/s/W:** 0.433 / 0.611 / 0.717 / 0.688 for FPGA+CPU at T1-T4, against 0.217 /
  0.383 / 0.523 / 0.565 for CPU-only.

## Files

| File | What |
|---|---|
| `apm_50.txt` | 49 timed standalone calls with per-port byte and latency counters |
| `apm_trace.csv`, `apm_trace.txt`, `apm_stages.txt` | layer-0 APM trace and its stage split |
| `apm_before/` | the same trace for rebuild_x16 and q4k_final, recovered from the 2026-10-24 session |
| `ppl_hw.sh`, `ppl_hw.log`, `ppl_hw.out` | the KLD run |
| `run_all.sh`, `run_profile_{accel,cpu}.sh` | the benchmark scripts as run |
| `bench/` | the six benchmark logs and `run_all.out` |
