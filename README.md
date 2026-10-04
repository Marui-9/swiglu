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
> a weight slot. Both are now fixed in `llama-mods/ggml-cpu.c`, but every board result below
> was measured with the old driver. Its timing is valid; its numerical output was wrong.
> The fixed driver has not yet run on the board.

---

## Status

| Design | Where | Status |
|---|---|---|
| **q4k_final** | `hls_experiments/q4k_final/` | Routed, on the board, measured. Source of every board number below. |
| **rebuild** (load/compute overlap) | `swiglu.cpp` on branch `rebuild` | C-sim PASS, csynth only. Not through Vivado, no board number. |

### Board results — q4k_final, 250 MHz

Decode throughput and average SOM power, llama-bench `-p 12 -n 64 -r 10`, interrupt build
(`scripts/results/latest_benchmarks/{accel,cpu}_t<N>_q4k.log`):

| Threads | FPGA + CPU | Power | CPU only | Power |
|---|---|---|---|---|
| 1 | 1.63 t/s | 5.10 W | 0.88 t/s | 3.96 W |
| 2 | **2.21 t/s** | 5.15 W | 1.66 t/s | 4.25 W |
| 3 | 2.05 t/s | 5.14 W | **2.36 t/s** | 4.41 W |
| 4 | 1.46 t/s | 5.13 W | 2.31 t/s | 4.28 W |

- The best CPU-only configuration (3 threads) is faster than the best FPGA + CPU one
  (2 threads). The fused op runs on one thread (`n_tasks = 1`). The other threads wait at
  the ggml barrier while the FPGA works, so extra threads only speed up the non-FFN part.
- The two columns ran different GGUFs: the accelerator needs the all-Q4_K requantization
  (628.25 MiB), while the CPU runs used the stock Q4_K_M (694.76 MiB). See
  `docs/quantization_info.txt`.
- At 2 threads a token takes 452 ms: ~224 ms FPGA (14.0 ms per call), ~227 ms non-FFN CPU
  work, ~1.3 ms host↔device handoff (`thesis/latest_findings.md`, from `SWIGLU_DEBUG`
  timings).
- A polling build (`*_pollfix.log`) reaches 2.22 t/s at 2 threads but draws 5.85 W.

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
101,639, but whether the rebuild fits is open until Vivado runs. `CLAUDE.md` projects
~2.6 t/s at 2 threads; this is unproven. Stage-by-stage detail:
`docs/swiglu_description.md`.

---

## How it works

### Datapath (W4A8)

| Data | Format | Scale |
|---|---|---|
| Weights W_gate, W_up, W_down | Q4_K (4-bit, fp16 d/dmin per 256 elements, 6-bit sub-scales) | per block |
| x | INT8 | host: max\|x\|/127 → `XSCALE` register |
| X1 = W_gate·x, X2 = W_up·x | INT8 on chip | fixed ±10 (unverified, see `docs/integer_transition.txt`) |
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

Both bugs were in `llama-mods/ggml-cpu.c`. The fixes need no re-synthesis and apply to the
q4k_final bitstream as well as the rebuild. **The fixed driver has not been run on the
board yet.** Every board result in this README was measured with the old driver.

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
- **Still to do:** no board run has compared the accelerator's output with the CPU path.
  Compare the fused op's output with `build_ffn()` on the board for at least one layer.

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
  testblock/changelog.txt optimization diary, entries 1-68
  experiments.txt         the failed attempts and their root causes
  cpu-predecode/ ...      earlier designs and their notes
scripts/                  deploy, profiling, plotting, results (latest_benchmarks/)
cpu_profiling/            per-op CPU profile of LFM2.5 decode (FFN share 68%)
lfm2_benchmark/           standalone CPU benchmark package
thesis/, latex/           thesis material
```

Documents in `docs/`:

| File | Contents |
|---|---|
| `swiglu_description.md` | `swiglu.cpp` stage by stage, with csynth cycles |
| `code_stages.txt` | one call end to end: registers, handshake, driver stages, cache syncs |
| `offload.txt` | how the fused op is wired into llama.cpp |
| `quantization_info.txt` | W4A8, the all-Q4_K model, fp16 subnormals, what accuracy is (not) measured |
| `floats_explanation.txt` | where float remains in the IP and why |
| `integer_transition.txt` | INT8 X1/X2 caches and the unverified ±10 range |
| `connections.txt`, `vivado_addresses.txt` | block design and address map |
| `udmabuf_info.txt` | buffer size, layout, CMA |
| `power_profiling.txt` | how power was measured and the results |
| `inheritance.txt` | lessons learned, by project phase |
| `output.txt` | board log of the fused op with `SWIGLU_DEBUG=1` |
| `gguf-dump_*.txt` | tensor types of the stock Q4_K_M and the all-Q4_K model |
