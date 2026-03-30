# SwiGLU FPGA Accelerator

Hardware offload of the SwiGLU feed-forward network (FFN) block from the
[LFM2-1.2B](https://www.liquid.ai/) transformer model onto a Kria KV260
(Zynq UltraScale+ ZU5EV). Built with Vitis HLS, integrated into Vivado, and
invoked from llama.cpp by patching `ggml-cpu.c`.

---

## Operation

```
X1     = x  @ W_gate.T       (gate projection,  2048 → 8192)
X2     = x  @ W_up.T         (up   projection,  2048 → 8192)
gate   = SiLU(X1) × X2       (element-wise gated activation)
output = gate @ W_down.T     (down projection,  8192 → 2048)
```

All three weight matrices are stored in GGML quantized format (Q4\_K or Q6\_K)
in DDR memory and streamed in over 128-bit AXI4 burst transfers. The input
vector `x` is INT8-quantized by the PS driver before each DMA transfer.

---

## Model Dimensions

| Symbol          | Value | Meaning                              |
|-----------------|-------|--------------------------------------|
| `VECTOR_DIM`    | 2048  | Input / output vector length         |
| `FFN_DIM`       | 8192  | Intermediate (gate / up) length      |
| Layers          | 16    | Transformer blocks in LFM2-1.2B      |
| W\_gate, W\_up  | Q4\_K | All 16 layers                        |
| W\_down         | Q6\_K | Layers 0,1,4,7,10,13,14,15           |
| W\_down         | Q4\_K | Layers 2,3,5,6,8,9,11,12             |

---

## W4A8 Quantization

The accelerator uses a **W4A8** (4-bit weights, 8-bit activations)
mixed-precision datapath.

### Input quantization (PS side)

The `ggml-cpu.c` driver dynamically quantizes the FP32 activation vector to
INT8 before each DMA transfer:

```
x_scale   = max(|x[i]|) / 127.0
x_int8[i] = clamp(round(x[i] / x_scale), -128, 127)
```

`x_scale` is written to the `CTRL` register so the accelerator recovers FP32
magnitudes at the final reduction step. Perplexity degradation from this
per-token symmetric quantization is typically less than 0.5%.

### Gate quantization (PL side, Phase 4)

After Phase 4 computes `gate = SiLU(X1) × X2` in FP32, `compute_gate`
immediately requantizes the 8192-element result to INT8:

```
gate_scale   = max(|gate[j]|) / 127.0
gate_int8[j] = clamp(round(gate[j] / gate_scale), -128, 127)
```

This reduces `gate_cache` BRAM from 32 KB (FP32) to 8 KB (INT8) and enables
the Phase 5 MAC loop to use INT32 accumulators — a 16× reduction in LUT cost
per pipeline that makes full 32-block unrolling feasible within the ZU5EV
budget. Model weights in DDR are not altered.

### FP32 dequantization in the MACs (swiglu.cpp)
- **Q4_K (Phases 2/3, gate/up):** each block carries FP16 `d` (scale) and `dmin`
  (offset). Integer sums `sw`/`sm` are scaled as `d * (x_scale * sw) - dmin * (x_scale * sm)`
  to recover FP32.
- **Gate path:** `gate_scale` (Phase 4) rescales INT8 gate back to FP32 during the
  down-projection MACs.
- **Q6_K (Phase 5B):** per-block FP16 `d` plus INT4/INT2 encoded weights and per-nibble
  scales; `decode_mac_q6k` emits FP32 accumulation using `gate_scale` to dequantize
  the INT8 gate vector.

### Why INT32 accumulators?

FP32 adders have ~5 cycle pipeline latency; a single FP32 accumulator gives
II ≈ 5. INT32 adders are 1 cycle, giving II = 1 unconditionally. This is what
enables parallel multi-block unrolling in Phases 2, 3, and 5.

---

## Five Execution Phases

| Phase | Operation                           | Key loop                  | Cycles (est.) |
|-------|-------------------------------------|---------------------------|---------------|
| 1     | Load x into dual BRAMs              | 128 iter, II=1            | ~128          |
| 2     | X1 = x @ W\_gate.T (Q4\_K)         | 8192 rows × 330 cyc/row   | ~2.71 M       |
| 3     | X2 = x @ W\_up.T (Q4\_K)           | 8192 rows × 330 cyc/row   | ~2.71 M ∥ P2 |
| 4     | gate = SiLU(X1)×X2, quantize INT8  | 2× 8192 iter, II=1        | ~16.4 K       |
| 5A    | output = gate @ W\_down.T (Q4\_K)  | 2048 rows × 800 cyc/row   | ~1.64 M       |
| 5B    | output = gate @ W\_down.T (Q6\_K)  | 2048 rows × 1445 cyc/row  | ~2.96 M       |

Phases 2 and 3 run **in parallel** (separate `W`/`V` AXI ports, separate
`x_local` BRAM copies). `compute_gate` begins streaming results before Phases
2/3 complete via `FIFO depth=16` channels.

**Estimated end-to-end latency @ 250 MHz:**

| Down path | Total cycles | Time / token |
|-----------|-------------|--------------|
| Q4\_K     | ~4.37 M     | ~17.5 ms     |
| Q6\_K     | ~5.69 M     | ~22.8 ms     |

The design is compute-limited rather than DDR-bandwidth-limited. Total DDR
reads per token: ~28.3 MB (Q4\_K path) or ~32.6 MB (Q6\_K path).

---

## AXI Interface

### AXI4 Master Ports (`DATA_WIDTH=128`, 16-byte bus)

| Port        | Bundle     | Dir   | Purpose                               |
|-------------|------------|-------|---------------------------------------|
| `W`         | `gmem_W`   | Read  | W\_gate weight matrix (Q4\_K, ~9 MB) |
| `V`         | `gmem_V`   | Read  | W\_up weight matrix   (Q4\_K, ~9 MB) |
| `W_down`    | `gmem_Wd`  | Read  | W\_down matrix (Q4\_K or Q6\_K)      |
| `x_batch`   | `gmem_x`   | Read  | INT8 input vector (2048 bytes)        |
| `out_batch` | `gmem_out` | Write | FP32 output vector (2048 × 4 bytes)  |

Without `DATA_WIDTH=128`, HLS infers an 8-bit bus from `uint8_t*` pointers,
limiting bandwidth to ~100 MB/s at 100 MHz. The 128-bit override gives ~1.6 GB/s.

### AXI4-Lite Slave (`CTRL` bundle, base address `0xA0020000`)

| Register          | Notes                                              |
|-------------------|----------------------------------------------------|
| `W`               | Physical DDR base address of W\_gate               |
| `V`               | Physical DDR base address of W\_up                 |
| `W_down`          | Physical DDR base address of W\_down               |
| `x_batch`         | Physical DDR base address of INT8 input buffer     |
| `out_batch`       | Physical DDR base address of FP32 output buffer    |
| `down_quant_mode` | 0 = Q4\_K, 1 = Q6\_K for the down projection      |
| `x_scale`         | FP32 activation dequantization scale               |

---

## Vivado Block Design

### Confirmed Addresses

| Peripheral                | Base Address  |
|---------------------------|---------------|
| `axi_dma_0` S\_AXI\_LITE  | `0xA0000000`  |
| `linear_projection_0`     | `0xA0010000`  |
| `swiglu_0` s\_axi\_CTRL   | `0xA0020000`  |

### Connections

```
zynq_ultra_ps_e_0
  M_AXI_HPM0_FPD  → axi_smc S00_AXI
  S_AXI_HP0_FPD   → smartconnect_0 M00_AXI
  pl_ps_irq       → xlconcat dout

axi_smc (AXI-Lite control SmartConnect)
  M00_AXI → linear_projection_0 s_axi_CTRL
  M01_AXI → axi_dma_0 S_AXI_LITE
  M02_AXI → swiglu_0 s_axi_CTRL

swiglu_0
  s_axi_CTRL     → axi_smc M02_AXI
  interrupt      → xlconcat In3
  m_axi_gmem_V   → smartconnect_0 S04_AXI
  m_axi_gmem_W   → smartconnect_0 S05_AXI
  m_axi_gmem_Wd  → smartconnect_0 S06_AXI
  m_axi_gmem_out → smartconnect_0 S03_AXI
  m_axi_gmem_x   → smartconnect_0 S07_AXI

smartconnect_0
  S00_AXI → axi_dma_0 M_AXI_SG
  S01_AXI → axi_dma_0 M_AXI_MM2S
  S02_AXI → axi_dma_0 M_AXI_S2MM
  M01_AXI → zynq_ultra_ps_e_0 S_AXI_HP1_FPD
  M02_AXI → zynq_ultra_ps_e_0 S_AXI_HP2_FPD

axi_dma_0 (linear_projection DMA, reused for weight loading)
  S_AXIS_S2MM  ← linear_projection_0 out_stream
  mm2s_introut → xlconcat In0
  s2mm_introut → xlconcat In1

linear_projection_0
  in_stream → axi_dma_0 M_AXIS_MM2S
  interrupt → xlconcat In2
```

HP1 and HP2 carry the memory bandwidth for `swiglu_0`'s five m\_axi ports
through `smartconnect_0`. In the Address Editor, exclude HP1\_DDR\_HIGH and
HP2\_DDR\_HIGH from `axi_dma_0`'s address spaces to prevent overlap errors —
`axi_dma_0` only needs HP0\_DDR\_LOW (`0x0_0000_0000`).

---

## Key HLS Design Decisions

### Loop Inversion (Phases 2, 3, 5-Q4K)

The block dimension (N blocks) is placed **inside** a `PIPELINE II=1` element
loop (256 iterations) with `UNROLL`. This forces HLS to synthesize N
independent MAC pipelines in parallel. The naive alternative — unrolling the
block loop over sequential function calls — produces N FSM states sharing a
common functional unit pool, executing one block at a time.

### 2D Row Buffer Layout (`rb[blocks][words]`)

`rb[b][w]` with `dim=1 complete` gives each block a trivially distinct BRAM
bank. A flat `rb[b × Q4_K_WORDS + w]` with block partitioning requires HLS
alias analysis to prove distinct banks for the stride-9 addressing — which can
fail and serialize MAC instances. `Q4_K_WORDS = 9` (non-power-of-2) makes the
nested layout mandatory; a flat loop using `i/9` requires hardware integer
dividers that destroy II=1.

### Dual `x_local` Copies

`x_local_1` and `x_local_2` are separate `ram_1p` BRAMs written identically
by `load_x_local`. If a single array were shared, HLS inserts a
`Block_entry_x_local_rd_proc` serializer module that broadcasts to both
consumers sequentially, eliminating the Phase 2/3 parallelism.

### No Inner DATAFLOW

`#pragma HLS DATAFLOW` on inner loops (row loops in `compute_X1`, `compute_X2`,
`compute_output`) causes HLS to model all pointer arguments as scalar FIFO
channel values rather than m\_axi bus ports, silently dropping all read m\_axi
ports. Only the single outer `#pragma HLS DATAFLOW` in `swiglu()` is present.

### No Pointer Casts at DATAFLOW Call Sites

Casting pointer arguments at DATAFLOW call sites (e.g.
`compute_X1((const ap_uint<128>*)W, ...)`) breaks HLS's dependency trace
between the top-level m\_axi pragma and the memory burst inferencer inside the
sub-task. This was confirmed by `W_read_ap_vld` handshake signals in synthesis
reports — HLS was treating `W` as a FIFO channel value. Pointers are passed
directly at call sites and cast to `ap_uint<128>*` inside each `INLINE off`
sub-function boundary.

### `fp16_to_fp32` — Manual Bit Manipulation

Weight scale factors `d` and `dmin` in Q4\_K/Q6\_K blocks are stored as FP16.
The conversion uses manual `uint32_t` bit manipulation rather than `hls_half`
or `ap_fixed<16,5>`. Both HLS types silently flush subnormal FP16 values to
zero at synthesis (DAZ — Denormals Are Zero). Real LFM2-1.2B weights contain
subnormal scale fields; using `hls_half` would zero those blocks' contributions
and produce all-zero outputs.

### Sigmoid LUT for SiLU

`σ(z) = 1/(1+exp(-z))` is computed via a 4096-entry FP32 ROM covering
`[-8, +8]` (step ≈ 0.0039). The LUT replaces a transcendental hardware unit,
saving DSPs. At C-simulation it is computed at runtime via `expf()`; at
synthesis it is a `rom_1p` BRAM.

### Separate Q4K / Q6K Phase 5 Loops

Two completely separate output loops avoid a runtime conditional inside a
pipelined stream-read loop. Q4\_K reads 288 words/row; Q6\_K reads 420
words/row. A combined conditional loop would prevent II=1 due to
variable-length loop-carried dependencies.

### Q6\_K Cannot Use Loop Inversion

Q6\_K blocks are 210 bytes = 13.125 × 128-bit words — a non-integer stride.
A clean `rb[32][14]` 2D layout would break byte offsets in the decoder. The
Q6\_K path uses a 1D `rb[420]` with `ARRAY_PARTITION complete` and
`UNROLL factor=8`.

---

## Q4\_K Nibble Layout

GGML's Q4\_K encoder stores 256 weights in four 64-element **planar** chunks —
not byte-interleaved. Within each chunk, the first 32 elements use the **low**
nibbles of 32 bytes; the next 32 elements use the **high** nibbles of those
same bytes.

The correct extraction formula (all power-of-2, no division):

```cpp
int q_byte = 16 + (n & 31) + ((n & 0xC0) >> 1);
int shift   = (n & 32) ? 4 : 0;
int nib     = (qs[q_byte] >> shift) & 0xF;
```

The naive interleaved formula (`byte = 16 + n/2`, `shift = (n&1)*4`) is
accidentally correct only for `n=0`. All other elements read the wrong nibble.
This bug was masked because all 256 nibbles remain in range [0, 15] and produce
activations of plausible magnitude — the model generates incoherent text rather
than NaN or zero. The testbench was also internally inconsistent: both the
fill function and reference decoder used the same wrong formula, so all tests
passed regardless.

---

## Correctness Verification

| Check | Result |
|---|---|
| `fp16_to_fp32`: zero, subnormal, Inf/NaN, normal | ✓ |
| Q4\_K nibble extraction (planar GGML layout) | ✓ |
| Q4\_K scale header unpacking (12-byte, 6-bit fields) | ✓ |
| Q4\_K reduction: `d×x_scale×sw − dmin×x_scale×sm` | ✓ |
| Q6\_K decode: ql/qh/scales/d offsets, no off-by-one at b=31 | ✓ |
| `compute_gate` FIFO sequential access on X1\_cache/X2\_cache | ✓ |
| `gate_cache` 3D indexing `[n][j>>8][j&255]` | ✓ |
| `compute_output` runtime Q4K/Q6K branch, no inner DATAFLOW | ✓ |

---

## Memory Architecture

| Variable      | Shape          | Storage              | Size   | Purpose                              |
|---------------|----------------|----------------------|--------|--------------------------------------|
| `x_local_1`   | `[1][8][256]`  | LUTRAM ram\_1p       | 2 KB   | x copy for compute\_X1 (8-bank)     |
| `x_local_2`   | `[1][8][256]`  | LUTRAM ram\_1p       | 2 KB   | x copy for compute\_X2 (8-bank)     |
| `X1_cache`    | `[1][8192]`    | URAM ram\_2p         | 32 KB  | DATAFLOW channel, depth=16           |
| `X2_cache`    | `[1][8192]`    | URAM ram\_2p         | 32 KB  | DATAFLOW channel, depth=16           |
| `gate_cache`  | `[1][32][256]` | URAM ram\_2p         | 8 KB   | INT8 quantized gate (32-bank)        |
| `gate_scale`  | `[1]`          | Register             | 4 B    | DATAFLOW scalar channel              |
| `sigmoid_lut` | `[4096]`       | LUTRAM rom\_1p       | 16 KB  | σ(x) over [-8, +8]                  |
| `row_buf` WV  | `[8][9]`       | LUTRAM ram\_1p + partition | 1152 B | Per-row Q4\_K buffer (gate/up)      |
| `row_buf` Q4K | `[32][9]`      | LUTRAM ram\_1p + partition | 4608 B | Per-row Q4\_K buffer (down)         |
| `row_buf` Q6K | `[420]`        | LUTRAM ram\_1p (cyclic)    | 6720 B | Per-row Q6\_K buffer (down)         |
| `out_local`   | `[2048]`       | LUTRAM ram\_1p       | 8 KB   | Output staging before memcpy         |

---

## File Map

```
swiglu/
├── swiglu.h               HLS top-level interface
├── swiglu.cpp             HLS implementation (W4A8 integer datapath)
├── swiglu_tb.cpp          HLS C-simulation testbench
├── sigmoid_lut.h          4096-entry σ(x) LUT (csim init + synthesis ROM)
├── sigmoid_lut_gen.py     Python script to regenerate sigmoid_lut.h
├── ggml-cpu.c             llama.cpp backend driver (board-validated)
├── pl.dtsi                Device tree overlay
├── hls_config.cfg         Vitis HLS solution configuration
└── docs/
    ├── swiglu_description.md      Full implementation description
    ├── codex.txt                  Cycle model and performance estimates
    ├── swiglu_correctness.txt     Correctness and optimization checklist
    ├── ggml_nibble_fix.txt        Q4_K planar nibble layout explanation
    ├── quantization_fp32toin8.txt W4A8 quantization accuracy analysis
    ├── connections&addresses.txt  Vivado block design connections + addresses
    ├── quantization.txt           GGUF quantization format reference
    ├── output.txt                 Board execution log
    └── LFM2_technical_report.pdf  Model architecture reference
```

---

## Board Configuration

- **Device**: Kria KV260 (Zynq UltraScale+ ZU5EV)
- **PL clock target**: 250–300 MHz (set PL CLK0 in Zynq PS Clock Configuration)
- **CMA allocation**: `cma=1024M` in `/boot/firmware/boot.scr.uimg`
  (required for the 640 MB udmabuf)
- **udmabuf size**: 671,088,640 bytes (640 MB)
  — permanent per-layer weight cache for all 16 layers (~512 MB weights + overhead)
