# rebuild_x16 on the board (2026-10-23)

First board run of the rebuild with X1/X2 widened to INT16 over a fixed ±32 range
(`hls_experiments/rebuild_x16/`). The setup is the same as `../fixed_driver_20261023/`,
the INT8 ±10 q4k_final run of the same day, so the two can be compared directly.

Setup:
- **Board:** KV260, PL0 at 249,999,998 Hz (`/sys/kernel/debug/clk/pl0_ref/clk_rate`).
- **Bitstream:** `hls_experiments/rebuild_x16/design_1_wrapper.bit.bin` (md5
  f5bdf653b9861b0c79298613330a0fe7).
  - It is installed as the xmutil app `swiglu-x16` in `/lib/firmware/xilinx/swiglu-x16/`,
    with kria-accel's dtbo and `shell.json`.
  - kria-accel (q4k_final) is left untouched.
  - UIO `swiglu` at 0xA0000000; udmabuf0 is 512 MiB.
- **Driver:** `llama-mods/ggml-cpu.c` as in the working tree (md5
  411bda217443954ec412ddb82f08502c), with no change for INT16. The register map is
  unchanged (x_scale at 0x54, from the generated `xswiglu_hw.h`).
- **GGUF and threads:** `LFM2.5-1.2B-Thinking-Q4_K_M-allQ4Kffn.gguf`, `-t 2`. These are
  the same as the INT8 run.

| File | What |
|---|---|
| `swiglu_verify_x16.patch` | scratch `SWIGLU_VERIFY` hook against `llama-mods/ggml-cpu.c`. It emulates INT16 ±32 X1/X2 (`ip16(+-32)`) and keeps the old INT8 ±10 as `ip8(+-10)` |
| `verify_per_layer_x16.log`, `verify_per_layer_x16_full.log` | `SWIGLU_VERIFY=3`: tokens 0 and 1 (the layer-15 call only) and token 2 (all 16 layers). `-n 3 --temp 0`, prompt "The three primary colors of light are" |
| `ppl_cmp.sh` | the perplexity/KLD commands: wikitext-2 test, `-c 256 --chunks 6` |
| `ppl_cpu.log`, `ppl_hw.log` | CPU is the KLD base; HW is scored against it |
| `greedy_hw.txt` | `-n 32 --temp 0` completion with `LLAMA_SWIHW=1` |
| `bench/`, `bench_pass2/` | llama-bench throughput, power and memory: see "Throughput and power" below |

## Per-layer check (token 2, 16 layers)

Values are min / mean over the 16 layers (derived from the logs):

| | INT8 ±10 IP (`../fixed_driver_20261023/verify_per_layer_variants.log`) | INT16 ±32 IP (`verify_per_layer_x16.log`) |
|---|---|---|
| cos(hw, float `build_ffn()`) | 0.9569 / 0.9765 | **0.9930 / 0.9984** |
| cos(hw, emulation of the IP) | ≥ 0.99946 | ≥ 0.99980 |
| gate·x values below half a step, per layer | 801–2,347 | 10–38 |

- The IP matches the C emulation of its own INT16 stages, so the hardware does what the
  INT16 design says.
- In the emulation, INT16 X1/X2 alone (`X12_16-only`) prints cosine 1.0000 in every layer.
  The remaining error comes from the x and h INT8 stages (`x+h`: 0.9930 min).
- Measured magnitudes (all logged calls): max |gate·x| 4.27, max |up·x| 2.17. Both are
  well inside ±32.
- The token-2 inputs are not identical to the INT8 run's: tokens 0-1 went through a
  different IP. So the two columns compare the IPs on near-identical activations, not
  identical ones.

## Perplexity and KLD

| | INT8 ±10 (`../fixed_driver_20261023/ppl_hw.log`) | INT16 ±32 (`ppl_hw.log`) |
|---|---|---|
| PPL, CPU | 50.0963 ± 6.24113 | 50.0963 ± 6.24113 (reproduced exactly) |
| PPL, HW | 54.139570 ± 6.592225 | **51.786869 ± 6.449970** |
| PPL(HW)/PPL(CPU) | 1.081368 ± 0.041650 | **1.034376 ± 0.011605** |
| Mean KLD | 0.384800 ± 0.013468 | **0.030154 ± 0.001239** |
| Same top token | 63.255 ± 1.748 % | **87.795 ± 1.187 %** |
| RMS Δp | 11.217 ± 0.663 % | **3.056 ± 0.230 %** |

- Mean KLD is 12.8× lower (derived: 0.384800 / 0.030154).
- PPL(HW)/PPL(CPU) still differs from 1 (0.034 ± 0.011 in ln). That is the expected cost
  of INT8 x and h, which the per-layer check isolates.

## Greedy text

"The three primary colors of light are red, green, and blue. These colors form the basis
of all color mixing in the visible spectrum. ..." It is correct, and diverges from the CPU
text (`../fixed_driver_20261023/greedy_cpu.txt`) after "These colors".

## Throughput and power (llama-bench)

Both passes ran on 2026-10-23 (board time is UTC), with the same bitstream, driver and GGUF
as above.

Common setup:
- `ollama` (another project's snap service, idle) was stopped first with
  `sudo snap stop ollama`. It stays enabled and comes back on reboot.
- Settings: `-p 12 -n 64`. FPGA+CPU used `LLAMA_SWIHW=1 SWIGLU_DEBUG=1`.
- llama.cpp on the board has no git metadata (it was copied from the USB key), so
  llama-bench prints `build: unknown (0)`. The driver is the repo one (md5
  411bda217443954ec412ddb82f08502c).

The passes:
- **Pass 1, `bench/`** (14:09-15:03), T1-T4, `-r 10`.
  - `run_all.sh` ran FPGA+CPU then CPU-only at each thread count, with a 20 s pause between
    runs.
  - The scripts are `scripts/profiling/run_profile_*.sh` before the memory-logger fix, with
    the model path and log directory changed.
  - Their peak-RSS line is not valid for FPGA+CPU: `pgrep -f llama-bench` matched the
    `sudo` wrapper and reported 4 MB.
- **Pass 2, `bench_pass2/`** (15:14-15:47), with the fixed `scripts/profiling/run_profile_*.sh`:
  - The memory logger now uses `pgrep -x` and records VmHWM.
  - The run order was: FPGA+CPU at T3 with `-r 3`; then `xmutil unloadapp`; then CPU-only
    T1-T4 with `-r 10`; then `xmutil loadapp swiglu-x16`. `run_all.out` has the
    before/after `listapps` and UIO checks.

| Threads | FPGA+CPU tg64 | FPGA+CPU pp12 | Power | CPU-only tg64, pass 1 / pass 2 | CPU-only pp12, pass 1 / pass 2 | Power, pass 1 / pass 2 |
|---|---|---|---|---|---|---|
| 1 | 1.76 ± 0.00 | 2.52 ± 0.00 | 4.43 W | 0.93 ± 0.00 / 0.93 ± 0.00 | 1.15 / 1.15 | 4.28 / 4.26 W |
| 2 | 2.53 ± 0.00 | 3.49 ± 0.01 | 4.66 W | 1.76 ± 0.00 / 1.77 ± 0.00 | 2.28 / 2.28 | 4.60 / 4.58 W |
| 3 | **2.98 ± 0.02** (pass 2: 3.01 ± 0.01) | 3.98 ± 0.03 (pass 2: 4.00) | 4.78 W (pass 2: 4.75) | 2.54 ± 0.03 / 2.55 ± 0.03 | 3.37 / 3.38 | 4.89 / 4.88 W |
| 4 | 2.73 ± 0.05 | 3.97 ± 0.20 | 4.67 W | 2.65 ± 0.05 / **2.70 ± 0.06** | 3.94 / 3.96 | 4.79 / 4.78 W |

Power is the run average of `xmutil xlnx_platformstats -p` "SOM total power". It is sampled
about every second, over prefill and decode together (the scripts' summary lines).

Derived from the table:
- FPGA+CPU over CPU-only, tg64 (pass 1): 1.89× / 1.44× / 1.17× / 1.03× at T1-T4.
- Best against best: 2.98 t/s vs 2.65 t/s (pass 1) or 2.70 t/s (pass 2), i.e. 1.10-1.12×.
- Energy per decoded token, using run-average power over tg64 t/s (approximate):
  - FPGA+CPU: 2.52 / 1.84 / 1.60 / 1.71 J at T1-T4 (T3, pass 2: 1.58 J).
  - CPU-only: 4.60 / 2.61 / 1.92 / 1.81 J (pass 1); 4.58 / 2.59 / 1.91 / 1.77 J (pass 2).
- These t/s come with the accuracy above (mean KLD 0.030154, PPL ratio 1.034376 at T2).

**FPGA time** (from the driver's `[SWG] ==== TOKEN` lines, one per 16 IP calls):
- `fpga=` averages 181.4-181.5 ms per 16 calls at every thread count, in both passes.
- That is **11.34 ms per call** (derived: 181.5 / 16).
- The whole FFN path (quantize, sync, FPGA, memcpy) averages 183.0-183.2 ms per 16 calls.
- Against csynth: the latency is 2,011,996 cy = 8.05 ms at 250 MHz
  (`hls_experiments/rebuild_x16/csynth.rpt`), so board/csynth is 1.41 (derived). The cause,
  found 2026-10-24, is that HLS serialized load and MAC in compute_X1/X2 (745 cy/iter
  instead of 348). The fix is `../rebuild_s2fix_final_20261024/`: 8.09 ms per call, 1.00× csynth.
- At T2 a decoded token takes 395.3 ms (derived: 1000 / 2.53). Of that, 183.2 ms is the
  FFN path and ~212 ms is the rest of the graph on the CPU (derived).

**Peak RSS** (pass 2, VmHWM):
- FPGA+CPU at T3: 711,000 kB. CPU-only: 711,392-711,644 kB. Both are 694 MiB.
- FPGA+CPU also uses the 512 MiB udmabuf, which RSS does not count.

**PL state during pass 2's CPU-only runs** (`bench_pass2/pl_state_check.txt`, checked
afterwards):
- `xmutil unloadapp` removes the overlay and the `swiglu` UIO device.
- However, the FPGA manager still reports `operating`, and `pl0_ref` stays enabled at
  249,999,998 Hz (enable count 2 → 1).
- So pass 2 is not a blank-PL measurement. Idle SOM power was 3.91 W loaded and 3.92 W
  unloaded.
