# SwiGLU FPGA Accelerator

Offloads the SwiGLU feed-forward block of [LFM2.5-1.2B](https://www.liquid.ai/) (Liquid AI)
from the ARM cores of a Kria KV260 (Zynq UltraScale+ ZU5EV) to the programmable logic.
The IP is written in Vitis HLS 2025.1, integrated in Vivado, and called from llama.cpp
through a custom fused ggml op.

```
out[2048] = W_down · ( SiLU(W_gate · x) ⊙ (W_up · x) )     x: 2048, hidden: 8192
```

One call computes one layer's FFN for one token. LFM2.5-1.2B has 16 layers, so a decode
token makes 16 calls.

> **Read [Driver bugs](#driver-bugs-fixed-2026-10-04) first.** Until 2026-10-04 the host
> wrote the weight headers in a layout the IP does not read, and the x/out buffers overlapped
> a weight slot. Both are fixed in `llama-mods/ggml-cpu.c`; the fixed driver first ran on the
> board on 2026-10-23. **`swiglu.cpp` now stores X1/X2 as INT16 over a fixed ±32 range**
> (2026-10-23) **and really overlaps Stage 2's load with its MAC** (`STABLE` fix,
> 2026-10-24). Both changes are uncommitted on `rebuild` and routed at 250 MHz as
> `hls_experiments/rebuild_s2fix/`. On the board a call takes 8.09 ms, the csynth latency,
> and decode runs at **3.53 t/s** (3 threads), against 2.69 t/s for the best CPU-only run on
> the same GGUF. Its mean KLD vs the CPU path is 0.030154: see
> [Board results](#board-results--rebuild_s2fix-250-mhz-2026-10-24) and [Accuracy](#accuracy-on-the-board-2026-10-23).

---

## Status

| Design | Where | Status |
|---|---|---|
| **q4k_final** | `hls_experiments/q4k_final/` | Routed and run on the board; superseded by rebuild_x16. |
| **rebuild** (load/compute overlap, INT8 X1/X2) | commits 6c27523…c35a36d on `rebuild` | C-sim PASS, csynth only. Superseded by rebuild_x16. |
| **rebuild_x16** (rebuild + INT16 ±32 X1/X2) | `hls_experiments/rebuild_x16/` | Routed with Vivado 2025.2, meets 250 MHz. On the board 2026-10-23 (accuracy and t/s); board time 1.41× csynth. Superseded by rebuild_s2fix. |
| **rebuild_s2fix** (rebuild_x16 + Stage 2 `STABLE` fix) | `swiglu.cpp` (uncommitted), `hls_experiments/rebuild_s2fix/` | C-sim PASS, routed with Vivado 2025.2, meets 250 MHz. On the board 2026-10-24: accuracy identical to rebuild_x16, board time = csynth. |

### Board results — rebuild_s2fix, 250 MHz (2026-10-24)

- **Setup:** as for rebuild_x16 below: llama-bench `-p 12 -n 64 -r 10`, the same GGUF on
  both paths, the same driver source (md5 411bda21…), `ollama` stopped.
- **Logs** in `scripts/results/rebuild_s2fix_final_20261024/` (README.md there).
- **Accuracy at these speeds:** every value of the KLD run equals rebuild_x16's: mean KLD
  0.030154, PPL(HW)/PPL(CPU) 1.034376 ± 0.011605.
- **CPU-only:** T3 and T4 were rerun in the same session as a control and match
  2026-10-23 to within 0.04 t/s. T1 and T2 are the 2026-10-23 values (`rebuild_x16_20261023/bench/`).
- Power is the run average of the SOM total power.

| Threads | FPGA + CPU pp12 | tg64 | Power | CPU only tg64 | Power | Decode speedup (derived) |
|---|---|---|---|---|---|---|
| 1 | 2.88 t/s | 1.94 t/s | 4.48 W | 0.93 t/s (10-23) | 4.28 W | 2.09× |
| 2 | 4.20 t/s | 2.92 t/s | 4.78 W | 1.76 t/s (10-23) | 4.60 W | 1.66× |
| 3 | 4.92 t/s | **3.53 t/s** | 4.92 W | 2.54 t/s | 4.86 W | 1.39× |
| 4 | 5.11 t/s | 3.24 t/s | 4.71 W | **2.69 t/s** | 4.76 W | 1.20× |

All figures below marked "derived" are computed from this table and the logs.

- **Best against best:** 3.53 vs 2.69 t/s, 1.31× (derived). Against rebuild_x16 the
  FPGA + CPU decode rate is 1.10-1.19× higher at T1-T4 (derived).
- **Energy per decoded token:** 1.39 J (FPGA + CPU, T3) against 1.77 J (CPU-only, T4),
  derived from run-average power ÷ tg64 t/s.
- **FPGA time:** 129.45-129.63 ms per 16 calls at every thread count (driver
  `SWIGLU_DEBUG` lines), i.e. 8.09 ms per call (derived): 1.00× the csynth latency of
  8.08 ms. A standalone call (APM, no llama.cpp) takes 8.017 ms.
- **Per-token split at 2 threads:** 342.5 ms per token, of which 131.2 ms is the FFN path
  and ~211 ms the rest of the graph on the CPU (derived). The handoff (FFN path − FPGA) is
  1.62-1.67 ms per token.
- **T4 is slower than T3** on the FPGA + CPU path (rest of the graph 177.6 vs 152.1 ms,
  derived), as it was with rebuild_x16.
- **Peak RSS** (VmHWM): 694 MiB on both paths, plus the 512 MiB udmabuf for FPGA + CPU.

### Board results — rebuild_x16, 250 MHz (2026-10-23)

Superseded by rebuild_s2fix above; kept as the record of the 1.41× board/csynth gap.

- **Setup:** llama-bench `-p 12 -n 64`, interrupt driver. Both paths ran the same GGUF,
  `LFM2.5-1.2B-Thinking-Q4_K_M-allQ4Kffn.gguf` (661.76 MiB). The board's `ollama` service
  was stopped.
- **Logs** in `scripts/results/rebuild_x16_20261023/`:
  - `bench/`: pass 1, `-r 10`.
  - `bench_pass2/`: pass 2. FPGA + CPU ran only at T3 with `-r 3`; CPU-only ran with
    `-r 10` and the xmutil app unloaded.
- **Accuracy at these speeds:** mean KLD 0.030154 and PPL(HW)/PPL(CPU)
  1.034376 ± 0.011605 (see [Accuracy](#accuracy-on-the-board-2026-10-23)).
- Power is the run average of the SOM total power.

| Threads | FPGA + CPU | Power | CPU only, pass 1 | Power | CPU only, pass 2 | Power |
|---|---|---|---|---|---|---|
| 1 | 1.76 t/s | 4.43 W | 0.93 t/s | 4.28 W | 0.93 t/s | 4.26 W |
| 2 | 2.53 t/s | 4.66 W | 1.76 t/s | 4.60 W | 1.77 t/s | 4.58 W |
| 3 | **2.98 t/s** (pass 2: 3.01) | 4.78 W (4.75) | 2.54 t/s | 4.89 W | 2.55 t/s | 4.88 W |
| 4 | 2.73 t/s | 4.67 W | 2.65 t/s | 4.79 W | **2.70 t/s** | 4.78 W |

All figures below marked "derived" are computed from this table and the logs.

- **Speed and energy:**
  - FPGA + CPU is faster than CPU-only at every thread count.
  - Best against best: 2.98 vs 2.65-2.70 t/s, 1.10-1.12× (derived).
  - Energy per decoded token is ~1.60 J (FPGA + CPU, T3) against ~1.77-1.81 J (CPU-only,
    T4). This is derived from run-average power ÷ tg64 t/s.
- **Threads:** the fused op runs on one thread (`n_tasks = 1`). The other threads wait at the
  ggml barrier while the FPGA works, so extra threads only speed up the non-FFN part.
- **FPGA time:** 181.4-181.5 ms per 16 calls at every thread count (driver `SWIGLU_DEBUG`
  lines), i.e. 11.34 ms per call (derived).
  - That is 1.41× the csynth latency of 8.05 ms (derived). The cause was the serialized
    Stage 2 loop-body DATAFLOW, fixed in [rebuild_s2fix](#rebuild_s2fix--stage-2-overlap-fix-routed-vitis-hls--vivado-20252).
- **Per-token split at 2 threads:** 395.3 ms per token, of which 183.2 ms is the FFN path
  (quantize, syncs, FPGA, copy-out) and ~212 ms is the rest of the graph on the CPU (derived).
- **Peak RSS** (pass 2, VmHWM):
  - 694 MiB for both FPGA + CPU and CPU-only.
  - FPGA + CPU also holds the 512 MiB udmabuf, which RSS does not count. The GGUF stays
    mapped while the driver keeps converted copies of the FFN weights in the udmabuf layer
    slots.
- **PL unloaded (pass 2 CPU-only):** pass 2 matches pass 1 to within 0.05 t/s and 0.03 W.
  - However, `xmutil unloadapp` leaves the fabric configured and the PL clock enabled
    (`bench_pass2/pl_state_check.txt`), so pass 2 is not a blank-PL measurement.
  - Idle SOM power was 3.91 W with the app loaded and 3.92 W unloaded.

### q4k_final — routed (previous design)

Implementation (`hls_experiments/q4k_final/utilization.txt`, `timing.txt`):

| LUT | FF | BRAM36 | URAM | DSP | WNS / TNS / WHS |
|---|---|---|---|---|---|
| 101,639 (86.78%) | 116,975 | 46.5 | 8 | 254 | −0.023 / −1.699 / +0.010 ns |

The bitstream runs at 250 MHz with that small negative setup slack.

### Rebuild design — csynth (Vitis HLS 2025.1, 3.33 ns target)

Each MAC stage overlaps its weight load with the MACs (loop-body `DATAFLOW` with ping-pong
buffers), so an iteration costs max(load, MAC) instead of their sum. The down stage
drops to K=2 rows per pass to pay for the buffers.

| | q4k_final | rebuild |
|---|---|---|
| compute_X1 ∥ compute_X2 | 1,536,001 cy | **713,107 cy** |
| compute_output | 1,622,602 cy | **1,282,062 cy** |
| Full call latency | 3,175,430 cy (12.70 ms @ 250 MHz) | **2,011,996 cy (8.05 ms)** |
| LUT estimate / DSP | 148,042 / 286 | 145,719 / 238 |

Both csynth LUT estimates exceed the device (117,120). q4k_final's still routed at
101,639; the rebuild with INT16 X1/X2 routed at 99,151 (next section). Board throughput:
[Board results](#board-results--rebuild_s2fix-250-mhz-2026-10-24). Stage-by-stage detail:
`docs/swiglu_description.md`.

### rebuild_x16 — INT16 X1/X2, routed (Vitis HLS / Vivado 2025.2)

The per-layer check below traced most of the accuracy loss to the INT8 ±10 X1/X2 caches.
`swiglu.cpp` now stores them as INT16 over a fixed ±32 range (`X12_QMAX` 32767, step
32/32767 ≈ 9.8e-4). The measured |gate·x| ≤ 4.24 and |up·x| ≤ 1.80 sit well inside it.
Files, clock details and build notes: `hls_experiments/rebuild_x16/README.md`.

| | rebuild, INT8 X1/X2 (`csynth_base_2025.2.rpt`) | rebuild_x16 (`csynth.rpt`) |
|---|---|---|
| csynth latency / interval | 2,011,996 / 1,282,063 cy | 2,011,996 / 1,282,063 cy |
| csynth BRAM_18K / DSP / URAM | 150 / 238 / 8 | 166 (57%) / 238 / 8 |

Routed (`utilization.txt`, `timing_4.000ns*.txt`):

| LUT | FF | BRAM36 | URAM | DSP | WNS / TNS / WHS at 4.000 ns |
|---|---|---|---|---|---|
| 99,151 (84.66%) | 139,945 | 52.5 | 8 | 238 | **+0.248** / 0 / +0.003 ns |

- Setup is met at 250 MHz with no failing endpoint. With an extra 0.300 ns of setup
  uncertainty, WNS is −0.052 ns (423 failing endpoints), so the intended guard band was
  not fully reached. Hold slack is thin (+0.003 ns vs q4k_final's +0.010 ns).
- Worst setup path: the down MAC DSP (`MAC_GRP`), 4 logic levels.
- Bitstream: `hls_experiments/rebuild_x16/design_1_wrapper.bit` (and `.bit.bin`). Board
  accuracy: see [Accuracy](#accuracy-on-the-board-2026-10-23).

Board throughput and power: [Board results](#board-results--rebuild_x16-250-mhz-2026-10-23).

### rebuild_s2fix — Stage 2 overlap fix, routed (Vitis HLS / Vivado 2025.2)

On the board, rebuild_x16 ran each call 1.41× slower than its csynth latency. A trace of
the ZynqMP DDR controller's AXI performance monitor (`scripts/analysis/swg_apm.c`) put
the whole excess in Stage 2:
- compute_X1 ∥ X2 took 6.102 ms, which is 745 cy/iteration (derived), against csynth's
  interval of 348.
- Stage 5 took 5.064 ms, 1,236 cy/iteration, in line with csynth.

**Cause.** In compute_X1/X2, HLS synchronized every instance of the loop-body DATAFLOW
region on the caller variables it touches: W/V, x_local, x_scale and X_cache. So the next
load waited for the previous MAC. Cosim of a cut-down harness shows the same thing: 746
cy/iteration, i.e. load 401 + MAC 343. csynth does not show it.

**Fix** (`swiglu.cpp` compute_X1/X2):
- `#pragma HLS STABLE` on W/V, x_local and x_scale.
- The MAC writes a local `X1_loc`/`X2_loc` array, copied into X_cache after the loop
  (COPY_X1/X2, 8,193 cy).
- Result: cosim gives 344 cy/iteration and the board's APM trace 348.

Files, cosim harness and build notes: `hls_experiments/rebuild_s2fix/README.md`.

| | rebuild_x16 | rebuild_s2fix |
|---|---|---|
| csynth latency / interval | 2,011,996 / 1,282,063 cy | 2,020,192 (8.08 ms) / 1,282,063 cy |
| csynth compute_X1 / X2 | 713,107 cy | 721,303 cy (loop 713,106 + copy 8,193) |
| csynth BRAM_18K / DSP / URAM | 166 / 238 / 8 | 182 / 238 / 8 |
| Routed LUT | 99,151 (84.66%) | 101,522 (86.68%) |
| Routed FF / BRAM36 / URAM / DSP | 139,945 / 52.5 / 8 / 238 | 140,950 / 60.5 / 8 / 238 |
| WNS / TNS / WHS at 4.000 ns | +0.248 / 0 / +0.003 ns | **+0.145** / 0 / +0.010 ns |
| Board, standalone call (APM) | 11.26 ms (layer 0 trace) | **8.017 ms** (mean of 49 calls) |
| Board, Stage 2 / Stage 5 (APM trace) | 6.102 / 5.064 ms | 2.847 / 5.065 ms |

- Board/csynth latency is now 0.99 (8.017 / 8.08, derived).
- The two WNS values were implemented against different clock constraints, so they do not
  isolate the cost of the fix (see that README).
- The worst setup path is still the down MAC DSP (`MAC_GRP`).
- Accuracy is unchanged: the KLD run gives the same value as rebuild_x16 in every chunk
  (`scripts/results/rebuild_s2fix_final_20261024/`).

---

## How it works

### Datapath (W4A8)

| Data | Format | Scale |
|---|---|---|
| Weights W_gate, W_up, W_down | Q4_K (4-bit, fp16 d/dmin per 256 elements, 6-bit sub-scales) | per block |
| x | INT8 | host: max\|x\|/127 → `XSCALE` register |
| X1 = W_gate·x, X2 = W_up·x | INT16 on chip (INT8 up to q4k_final and the INT8 rebuild) | fixed ±32 (was ±10; range chosen from board data, see `docs/integer_transition.txt`) |
| gate = SiLU(X1)·X2 | INT8 on chip | per token: max\|gate\|/127, two passes |
| out | FP32 | written to DDR |

The MACs accumulate in INT32. Per block, the reduce `d·Σw − dmin·Σm` runs in float
(`ap_fixed<48,38>` accumulation). `fp16_to_fp32()` decodes d/dmin with integer bit
manipulation because real LFM2 scales include fp16 subnormals. Where float remains and why:
`docs/floats_explanation.txt`.

Top-level DATAFLOW:

```
load_x_local → compute_X1 ∥ compute_X2 → compute_gate → compute_output
   (x → 2 copies)   (W_gate, W_up, 32 MAC lanes each)   (SiLU LUT)   (W_down)
```

### Weight layout ("URM")

On the first call for each layer, the host converts that layer's three Q4_K matrices
(`transpose_q4k_to_urm()`, `llama-mods/ggml-cpu.c`):

- Headers are unpacked: d and dmin, plus sc6/mn6 at one byte each, in 32 bytes per block
  (layout under [Driver bugs](#driver-bugs-fixed-2026-10-04), bug 1).
- Nibbles are transposed to element-major order, so a 32-bit slice holds element n of
  8 blocks and the IP picks each nibble out with a compile-time bit range.

The result is stored once per layer:

| Matrix | Row | Words per row (128-bit) | Size |
|---|---|---|---|
| W_gate, W_up | 8 blocks | 80 (16 header + 64 nibble) | 10,485,760 B each |
| W_down | 32 blocks | 320 (64 header + 256 nibble) | 10,485,760 B |

### Interfaces

| m_axi port | Bundle | HP port | Max burst | Data |
|---|---|---|---|---|
| `W` | gmem_W | HP2 (smartconnect_3) | 128 | W_gate, URM |
| `V` | gmem_V | HP0 (smartconnect_0) | 128 | W_up, URM |
| `W_down` | gmem_Wd | HP1 (smartconnect_1) | 256 | W_down, URM |
| `x_batch` | gmem_x | HP0 | 128 | INT8 x, 2 KB |
| `out_batch` | gmem_out | HP0 | 256 (write) | FP32 out, 8 KB |

All ports are 128 bits wide. W and V are on separate HP ports so X1 and X2 can stream at
the same time (`docs/connections.txt`).

AXI-Lite `CTRL` at **0xA0000000** (the only PL peripheral; `docs/vivado_addresses.txt`):

| Offset | Register | Offset | Register |
|---|---|---|---|
| 0x00 | AP_CTRL (start/done/idle/ready) | 0x28 | W_down address |
| 0x04 | GIE | 0x34 | x address |
| 0x08 | IER | 0x40 | out address |
| 0x0C | ISR | 0x4C | MODE (always 0 = Q4_K) |
| 0x10 | W address | 0x54 | XSCALE (float bits) |
| 0x1C | V address | | |

`down_quant_mode` (MODE) is always 0, but it must stay in the signature and stay
referenced in `swiglu.cpp`. Otherwise HLS drops it and XSCALE moves off 0x54. Full map and
handshake: `docs/code_stages.txt`.

Interrupt: `swiglu_0` → xlconcat In0 → GIC SPI 121 → `interrupts = <0 89 4>` in `pl.dtsi`.
The driver finds its UIO device by physical address, not by number.

### llama.cpp integration

Modified files are in `llama-mods/` (`docs/offload.txt`):

- **`ggml.h`, `ggml.c`:** define `GGML_OP_SWIGLU_FUSED_HW` and its builder
  `ggml_swiglu_fused_hw(ctx, x, w_gate, w_up, w_down, layer_id)`.
- **`lfm2.cpp`:** emits the fused op instead of `build_ffn()` when three conditions hold:
  - `LLAMA_SWIHW=1` is set in the environment;
  - x is F32 with 2048 elements per token;
  - all three FFN weights are Q4_K.
- **`ggml-cpu.c`:** runs the op on one thread. Per call it:
  1. Converts the layer's weights into its permanent udmabuf slot (first call only).
  2. Quantizes x to INT8.
  3. Programs the registers and starts the IP.
  4. Sleeps in a blocking UIO `read()` until the interrupt.
  5. Copies out the result.

  Prefill loops over the tokens one IP call at a time, up to 64 per ubatch.
  `SWIGLU_DEBUG=1` prints a per-token breakdown to stderr (quantize, syncs, FPGA, copy,
  summed over the 16 layers; sample in `docs/output.txt`).

udmabuf: 512 MiB; 16 permanent layer slots of 30 MiB at `0x01000000 + layer × 0x01E00000`
(`docs/udmabuf_info.txt`).

---

## Running it

On the board (paths in the scripts are the board's):

1. **Program the PL and load u-dma-buf:** `scripts/deploy/deploy-fabric.sh`
   - Copies the bitstream and `pl.dtsi` from the mounted transfer drive and builds the
     DT overlay.
   - Loads the overlay with `xmutil loadapp kria-accel`.
   - Inserts `u-dma-buf.ko udmabuf0=536870912`, which needs a CMA pool of at least
     512 MiB. The stock `cma=600M` is enough.
   - Prints the UIO map and the PL clock as a sanity check.
2. **Rebuild llama.cpp with the patches:** `scripts/deploy/reload-full-llama.sh` copies
   `llama-mods/` into `~/llama.cpp` and builds `llama-bench`. `reload-ggmlcpu.sh` rebuilds
   after a driver-only change.
3. **Benchmark with power logging:**
   - `sudo scripts/profiling/run_profile_accel.sh <threads> [repeat]` (sets
     `LLAMA_SWIHW=1 SWIGLU_DEBUG=1`)
   - `scripts/profiling/run_profile_cpu.sh <threads> [repeat]` (CPU baseline)

   See `docs/power_profiling.txt` and `scripts/util/usage.txt`.

HLS: the Vitis component is `swiglu/` (`vitis-comp.json`, `hls_config.cfg`: part
xck26-sfvc784-2LV-c, 3.33 ns clock, 0.90 ns uncertainty). The C-sim testbench is
`swiglu_tb.cpp`, and the latest synthesis report is `swiglu/reports/hls_compile.rpt`.

---

## Driver bugs (fixed 2026-10-04)

All three bugs were in `llama-mods/ggml-cpu.c`. The fixes need no re-synthesis and apply
to the q4k_final bitstream as well as the rebuild. Every board result in this README was
measured with the fixed driver.

### 1. Host and IP disagreed on the 32-byte block header

Before the fix, `transpose_q4k_to_urm()` wrote:

```
bytes 0-1 d | 2-3 dmin | 4-11 sc6[0..7] | 12-19 mn6[0..7] | 20-31 zero
```

`swiglu.cpp` reads this layout (`load_4rows_wv_urm`, `load_row_down_urm`), and the host now
writes it:

```
bytes 0-1 d | 2-3 dmin | 4-7 sc6[0..3] | 8-11 mn6[0..3] | 16-19 sc6[4..7] | 20-23 mn6[4..7]
```

With the old host layout, only d, dmin and sc6[0..3] arrived intact. The IP read three
fields from the wrong bytes:

| IP field | Bytes it reads | What the old host put there |
|---|---|---|
| mn6[0..3] | 8–11 | sc6[4..7] |
| sc6[4..7] | 16–19 | mn6[4..7] |
| mn6[4..7] | 20–23 | zero padding |

This hit every block of every matrix: sub-blocks 0–3 (elements 0–127) used the wrong mins,
and sub-blocks 4–7 (elements 128–255) used the wrong scales and zero mins.

- **Why C-sim passed:** `swiglu_tb.cpp` has its own transposer, which writes the layout
  the IP reads. `test_transposer.c` checks only nibble positions and d.
- **Evidence:** a harness (not in the repository) feeds random real-format Q4_K blocks
  through each transposer into the C model of `swiglu()`, and compares the output with a
  float reference that uses ggml's Q4_K dequantization.

  | Transposer | Cosine similarity |
  |---|---|
  | Testbench | 0.996 |
  | Old host | −0.196 |
  | Fixed host | 0.996 |

  The fixed host transposer's buffers are byte-identical to the testbench's, padding
  included.
- **Since when:** both layouts date from commit 3727506 (2026-05-19). The shipped
  `hls_experiments/q4k_final/swiglu_copy.cpp` reads the same bytes as today's code. The
  board numbers above therefore measure the right amount of work, but the values the
  accelerator produced were wrong.
- **On the board (2026-10-23):** the IP's output now matches a C emulation of its own
  INT8 datapath to cosine ≥ 0.9994 on every layer. See
  [Accuracy](#accuracy-on-the-board-2026-10-23).

### 2. x and out buffers overlapped layer 3's weight slot

`SWG_VEC_OFF` was 0x06C50000 (x, 2 KB) and `SWG_OUT_OFF` was 0x06C60000 (out, 8 KB). Both
lay inside layer 3's W_gate region (0x06A00000–0x073FFFFF). After that layer had been
cached, every call overwrote W_gate rows 1894–1895 and 1945–1951 of layer 3 (9 of 8,192
rows) with x and out data.

- **Fix:** x is now at 0x00000000 and out at 0x00010000, in the 16 MiB below
  `SWG_LAYER_BASE` that nothing else uses.
- `_Static_assert`s next to the layout macros check two things at compile time:
  - x, out and the W/V/W_down regions of the layer slots do not overlap;
  - the 16 slots fit in the 512 MiB pool.
- The old offsets fail the check ("out overlaps layer 0").

### 3. The ISR clear set the interrupt it meant to clear (found on the board 2026-10-23)

The HLS ISR at 0x0C is Read/TOW, toggle-on-write (`hls_experiments/testblock/xtestblock_hw.h:25-27`):
writing 1 to a bit that is 0 sets it. At init the driver wrote `ISR = 1` unconditionally.
On a freshly loaded bitstream ISR is 0, so that write raised a stale ap_done interrupt.
Call #0's UIO `read()` then returned at once and the driver aborted with
`IP completion not signalled ... AP_CTRL=0x00000001`.

- **Fix:** read ISR and write back only the bits that are set, both at init and after each
  call.
- 696d5cb had the same unconditional write. Why the older board runs did not hit it is not
  established.

---

## Accuracy on the board (2026-10-23)

Two IPs were measured on the same day, with the same GGUF, driver source and commands:

- First, the **q4k_final bitstream with INT8 ±10 X1/X2**. Everything below the INT16
  table is from that run.
- Then **rebuild_x16 with INT16 ±32 X1/X2**, the fix chosen from the first run's results.

**INT16 ±32 vs INT8 ±10**. The INT16 logs, verify patch and README are in
`scripts/results/rebuild_x16_20261023/`. Per-layer values are min / mean over the 16 layers
of decode token 2 (derived).

| | INT8 ±10 (q4k_final) | INT16 ±32 (rebuild_x16) |
|---|---|---|
| PPL(HW)/PPL(CPU) | 1.081368 ± 0.041650 | **1.034376 ± 0.011605** |
| Mean KLD | 0.384800 ± 0.013468 | **0.030154 ± 0.001239** |
| Same top token | 63.255 ± 1.748 % | **87.795 ± 1.187 %** |
| RMS Δp | 11.217 ± 0.663 % | **3.056 ± 0.230 %** |
| Per-layer cos(hw, float) | 0.9569 / 0.9765 | **0.9930 / 0.9984** |
| cos(hw, emulation of the IP) | ≥ 0.99946 | ≥ 0.99980 |

- The CPU PPL reproduced exactly (50.0963 ± 6.24113).
- With INT16, the X1/X2 stage alone emulates at cosine 1.0000. What remains comes from the
  INT8 x and h stages.

**Against the unquantized model (2026-10-24, rebuild_s2fix bitstream).** All runs score
wikitext-2, 24 × 256, against the logits of the Thinking f16/q8_0 GGUF
(`scripts/analysis/kld_ref.sh`; logs and README in `scripts/results/kld_ref_20261024/`).
Board runs used `-t 4`.

| vs f16/q8_0 | Q4_K_M, CPU (PC) | allQ4Kffn, CPU | allQ4Kffn, FPGA+CPU |
|---|---|---|---|
| PPL(Q)/PPL(ref) | 1.184104 ± 0.015283 | 1.173772 ± 0.015587 | 1.222886 ± 0.018259 |
| Mean KLD | 0.153433 ± 0.003147 | 0.166073 ± 0.003399 | 0.210197 ± 0.004346 |
| Same top token | 77.264 ± 0.759 % | 75.951 ± 0.774 % | 73.852 ± 0.796 % |

- Q4_K on every down projection costs KLD +0.013 over the default Q4_K_M mix (derived).
- The IP adds KLD +0.044 on top of the CPU path (derived).
- Directly against the CPU over the same 24 chunks, the IP scores KLD 0.034755 ± 0.000749,
  PPL ratio 1.045784 ± 0.006337 and same top token 88.091 ± 0.587 %. At chunk 6 these equal
  the 6-chunk values in the table above.

The rest of this section is the INT8 ±10 run.

Logs, the GGUF recipe and the verification patch are in
`scripts/results/fixed_driver_20261023/` (README.md there). All runs used one all-Q4_K
Thinking GGUF at `-t 2`, comparing the CPU path with `LLAMA_SWIHW=1`.

**Greedy text** (`greedy_*.txt`): both runs start with "red, green, and blue." and then
diverge.

**Perplexity and KLD** (`ppl_*.log`: wikitext-2 test, `-c 256`, 6 chunks):

| | Value |
|---|---|
| PPL, CPU | 50.0963 ± 6.24113 |
| PPL, HW | 54.139570 ± 6.592225 |
| PPL(HW)/PPL(CPU) | 1.081368 ± 0.041650 |
| Mean KLD | 0.384800 ± 0.013468 |
| Same top token | 63.255 ± 1.748 % |
| RMS Δp | 11.217 ± 0.663 % |

**Per-layer check** (`verify_per_layer_variants.log`): for one decode token, each of the
16 calls was compared with a float `build_ffn()` on the same Q4_K weights.

- **The IP is right about its own arithmetic.** It matches a C emulation of its INT8
  stages at cosine 0.99946–0.99998.
- **Its arithmetic is the error.** Against the float reference the cosine is
  0.9569–0.9944, mean 0.9765 (derived over the 16 layers).
- **Most of the error is the fixed ±10 X1/X2 range.** The measured gate·x stays within
  |·| ≤ 4.24 and up·x within |·| ≤ 1.80, with rms 0.11–0.44. In each layer, 801–2,347 of
  the 8,192 gate·x values round to zero.

| Variant (emulated) | Cosine vs float, min / mean over 16 layers (derived) |
|---|---|
| IP as built (X1/X2 fixed ±10) | 0.9569 / 0.9765 |
| X1/X2 ±10 only | 0.9576 / 0.9774 |
| x INT8 only | 0.9996 / 0.9999 |
| h INT8 only | 0.9951 / 0.9988 |
| x + h INT8, X1/X2 unquantized | 0.9950 / 0.9986 |
| IP with X1/X2 fixed ±4 | 0.9919 / 0.9949 |
| IP with X1/X2 per-token max/127 | 0.9948 / 0.9983 |

**What changed in the IP.** Both fixes considered (a per-token X1/X2 scale, or a wider
fixed format) emulate close to the unquantized-X1/X2 ceiling. The wider format was chosen
because it keeps compute_X1/X2 single-pass: X1/X2 are now INT16 over ±32 (`swiglu.cpp`,
`X12_SCALE_RANGE`/`X12_QMAX`). The cost is +16 BRAM_18K in csynth, with latency unchanged
(see [rebuild_x16](#rebuild_x16--int16-x1x2-routed-vitis-hls--vivado-20252)). On the board
it reached per-layer cosine 0.9930 / 0.9984 (table above), close to the ceiling set by the
x and h INT8 stages.

---

## Repository map

```
swiglu.cpp, swiglu.h      HLS IP (rebuild design)
swiglu_tb.cpp             C-sim testbench (mock token + 4 Q4_K tests)
sigmoid_lut.h             SiLU sigmoid LUT (4096 entries over [-8, 8))
hls_config.cfg            HLS solution config
swiglu/                   Vitis HLS component; reports/hls_compile.rpt
pl.dtsi                   device-tree overlay (UIO node, interrupt, HP AFI widths)
llama-mods/               modified llama.cpp files (ggml.h, ggml.c, ggml-cpu.c, lfm2.cpp)
docs/                     detailed documentation (below)
hls_experiments/
  q4k_final/              shipped design: source copy, csynth, utilization, timing
  rebuild_x16/            rebuild + INT16 X1/X2: csynth, routed utilization/timing, bitstream
  rebuild_s2fix/          rebuild_x16 + Stage 2 STABLE fix (current): csynth, routed, bitstream, cosim harness
  testblock/changelog.txt optimization diary, entries 1-72
  experiments.txt         the failed attempts and their root causes
  cpu-predecode/ ...      earlier designs and their notes
scripts/                  deploy, profiling, plotting, analysis (APM tools), results
                          (rebuild_x16_20261023/, rebuild_s2fix_final_20261024/, kld_ref_20261024/)
cpu_profiling/            per-op CPU profile of LFM2.5 decode (FFN share 68%)
lfm2_benchmark/           standalone CPU benchmark package
latest_findings.md        one-page summary of the final results
disi_thesis_template/     thesis source (LaTeX)
latex/                    earlier conference-paper drafts
```

Documents in `docs/`:

| File | Contents |
|---|---|
| `swiglu_description.md` | `swiglu.cpp` stage by stage, with csynth cycles |
| `code_stages.txt` | one call end to end: registers, handshake, driver stages, cache syncs |
| `offload.txt` | how the fused op is wired into llama.cpp |
| `quantization_info.txt` | W4A8, the all-Q4_K model, fp16 subnormals, what accuracy is (not) measured |
| `floats_explanation.txt` | where float remains in the IP and why |
| `integer_transition.txt` | X1/X2 caches: the INT8 ±10 design, its measured failure, and the INT16 ±32 fix |
| `connections.txt`, `vivado_addresses.txt` | block design and address map |
| `udmabuf_info.txt` | buffer size, layout, CMA |
| `power_profiling.txt` | how power was measured and the results |
| `inheritance.txt` | lessons learned, by project phase |
| `output.txt` | board log of the fused op with `SWIGLU_DEBUG=1` |
| `gguf-dump_*.txt` | tensor types of the stock Q4_K_M and the all-Q4_K model |
