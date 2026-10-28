# CPU-only baseline with the PL as booted (2026-10-25)

The earlier CPU-only runs (`../rebuild_x16_20261023/bench/`, `bench_pass2/` and the control
in `../rebuild_s2fix_final_20261024/bench/`) ran with a swiglu design configured in the PL:
loaded, or loaded and then `xmutil unloadapp`ed, which does not blank the fabric. These runs
repeat CPU-only T1-T4 in a boot where `xmutil loadapp` was never run.

## Setup

- **Fresh boot**, 07:37 UTC. dfx-mgr loads its default firmware at boot
  (`/etc/dfx-mgrd/default_firmware` = `k26-starter-kits`), so the PL is **not blank**:
  `k26-starter-kits` is active, fpga0 is `operating`, and pl0_ref runs at 99,999,999 Hz.
  No `loadapp` was run before or during the benchmarks.
- **Services as in the 2026-10-24 bench:** only `ollama` stopped (`snap stop ollama`). Four
  others (unattended-upgrades, packagekit, cups, cups-browsed) were stopped by mistake for a
  few minutes and started again before `run.sh` began, before any sample was taken.
- **u-dma-buf** was inserted right after boot (512 MiB), as for the FPGA+CPU runs. It does
  not touch the PL.
- **GGUF:** `LFM2.5-1.2B-Thinking-Q4_K_M-allQ4Kffn.gguf`, md5
  2e1c6368a0e5ed7ce6cfe2006cdd9d6b (the same file as 2026-10-23/24).
- **Script:** `run.sh` calls `~/s2fix/run_profile_cpu.sh <T> 10`, md5
  2b74172c83b04ccf6eea7b73740ebd22, identical to `scripts/profiling/run_profile_cpu.sh`
  (llama-bench `-p 12 -n 64 -r 10`).
- **Order:** idle sample → CPU-only T1-T4 → idle sample → `unloadapp` + `loadapp
  swiglu-s2fix` → idle sample.
- **Idle samples:** 60 × 1 s of `xmutil xlnx_platformstats -p` "SOM total power", taken once
  the 1-minute load average was below 0.30.

## Idle SOM power, same boot

| PL state | Mean | Min / max | File |
|---|---|---|---|
| k26-starter-kits (boot default), before the bench | 3,270.2 mW | 3,240 / 3,330 | `idle_boot_default.txt` |
| k26-starter-kits, after the bench | 3,285.2 mW | 3,250 / 3,610 | `idle_boot_default_after.txt` |
| swiglu-s2fix loaded, IP idle, pl0 249,999,998 Hz | 3,942.2 mW | 3,900 / 4,260 | `idle_s2fix_loaded.txt` |

- **Having swiglu-s2fix configured costs 657-672 mW at idle** (derived), with no IP call
  running.
- That matches the 2026-10-23 check (`../rebuild_x16_20261023/bench_pass2/pl_state_check.txt`):
  3,910 mW with swiglu-x16 loaded and 3,920 mW after `unloadapp`. Both readings had the
  swiglu fabric configured.

## CPU-only decode

| T | pp12 | tg64 | Power | J/token (derived) | t/s/W (derived) | Earlier power (swiglu in the PL) |
|---|---|---|---|---|---|---|
| 1 | 1.15 | 0.93 ± 0.00 | 3.62 W | 3.89 | 0.257 | 4.28 W (10-23) |
| 2 | 2.28 | 1.77 ± 0.00 | 3.96 W | 2.24 | 0.447 | 4.60 W (10-23) |
| 3 | 3.38 | 2.56 ± 0.03 | 4.27 W | 1.67 | 0.600 | 4.86 W (10-24) |
| 4 | 3.98 | 2.68 ± 0.05 | 4.17 W | 1.56 | 0.643 | 4.76 W (10-24) |

- **Throughput is unchanged:** within 0.02 t/s of the earlier runs (0.93 / 1.76 / 2.54 /
  2.69).
- **Power is 0.59-0.66 W lower** at every T (derived), which is the idle difference above.
- Peak RSS (VmHWM) 694-695 MiB. Temperatures LPD 29-31 °C, PL 28-29 °C.

## Against FPGA+CPU (`../rebuild_s2fix_final_20261024/bench/`), all derived

| T | Decode speedup | J/token, FPGA+CPU / CPU-only | Energy per token |
|---|---|---|---|
| 1 | 2.09× | 2.31 / 3.89 | −41% |
| 2 | 1.65× | 1.64 / 2.24 | −27% |
| 3 | 1.38× | 1.39 / 1.67 | −16% |
| 4 | 1.21× | 1.45 / 1.56 | −7% |

- **Best against best:** FPGA+CPU T3 (3.53 t/s, 1.39 J/token) against CPU-only T4 (2.68 t/s,
  1.56 J/token, its fastest and its most efficient): 1.32× faster, 11% less energy per token.
  With the earlier CPU-only power the energy figure was 22%.
- **FPGA+CPU is still faster and more efficient at every T,** but the energy margin at T4 is
  now 7%.
- **The FPGA+CPU path pays the ~0.66 W of the configured fabric on every token,** including
  while the IP is idle. At T3 the IP is busy for 129.5 of 283.3 ms per token (46%, derived).

## Not measured

- A blank PL. The stock boot always configures `k26-starter-kits`, so this is the baseline a
  CPU-only user of the stock image gets, not a fabric-free one.

## Files

| File | What |
|---|---|
| `run.sh`, `run.out` | the run and its full output (PL state, idle summaries, bench summaries) |
| `cpu_t{1..4}_*.log` | llama-bench output, power samples and RSS log per thread count |
| `idle_*.txt` | the 60 idle SOM power samples per state, in mW |
