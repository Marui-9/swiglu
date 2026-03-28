# swiglu.cpp — Detailed Implementation Description

## 1. Purpose and Context

`swiglu.cpp` is a Vitis HLS kernel that implements the SwiGLU feed-forward network (FFN)
block from the LFM2-1.2B transformer model on a Kria KV260 (Zynq UltraScale+ ZU5EV) FPGA.
It is invoked as a hardware accelerator from `llama.cpp` via a patched `ggml-cpu.c` driver.

The mathematical operation is:

```
X1     = x  @ W_gate.T          (gate projection,   2048 → 8192)
X2     = x  @ W_up.T            (up   projection,   2048 → 8192)
gate   = SiLU(X1) × X2          (element-wise gated activation)
output = gate @ W_down.T        (down projection,   8192 → 2048)
```

All three weight matrices are stored in GGML quantized format (Q4_K or Q6_K) in DDR
memory and streamed in over AXI4 burst transfers. The input vector `x` is INT8-quantized
on the PS side before being passed to the accelerator.

---

## 2. Dimensions and Constants

| Symbol                | Value | Meaning                                          |
|-----------------------|-------|--------------------------------------------------|
| `VECTOR_DIM`          | 2048  | Input/output vector length                       |
| `FFN_DIM`             | 8192  | Intermediate (gate/up) vector length             |
| `MAX_BATCH`           | 1     | Single-token decode only                         |
| `WV_BLOCKS_PER_ROW`   | 8     | Q4_K blocks per row of W_gate or W_up (2048/256) |
| `DOWN_BLOCKS_PER_ROW` | 32    | Q4_K or Q6_K blocks per row of W_down (8192/256) |
| `Q4_K_BYTES`          | 144   | Bytes per Q4_K quantization block                |
| `Q4_K_WORDS`          | 9     | 128-bit words per Q4_K block (144/16)            |
| `Q6_K_BYTES`          | 210   | Bytes per Q6_K quantization block                |
| `DOWN_Q6K_WORDS`      | 420   | 128-bit words per Q6_K row (6720/16)             |

---

## 3. AXI Interface

The top-level `swiglu()` function exposes the following hardware interfaces:

### AXI4 Master Ports (memory-mapped, 128-bit bus width)

| Port        | Bundle     | Direction | Purpose                               |
|-------------|------------|-----------|---------------------------------------|
| `W`         | `gmem_W`   | Read      | W_gate weight matrix (Q4_K, ~9 MB)   |
| `V`         | `gmem_V`   | Read      | W_up weight matrix (Q4_K, ~9 MB)     |
| `W_down`    | `gmem_Wd`  | Read      | W_down weight matrix (Q4_K or Q6_K)  |
| `x_batch`   | `gmem_x`   | Read      | INT8 input vector (2048 bytes)        |
| `out_batch` | `gmem_out` | Write     | FP32 output vector (2048 × 4 bytes)  |

All weight ports use `DATA_WIDTH=128`, giving a 16-byte-wide AXI bus. Without this
pragma, HLS would infer an 8-bit bus from the `uint8_t*` pointer type, limiting
bandwidth to ~100 MB/s at 100 MHz. With 128-bit width the effective bandwidth is ~1.6 GB/s.

### AXI4-Lite Slave (control registers, `CTRL` bundle at 0xA0020000)

All pointer arguments and scalar configuration values are mapped to the AXI-Lite CTRL
register bank. The PS writes:
- Base addresses of W, V, W_down, x_batch, out_batch (DDR physical addresses)
- `batch_size` (always 1 in current use)
- `down_quant_mode` (0 = Q4_K, 1 = Q6_K for the down projection)
- `x_scale` (FP32 dequantization scale: `x_fp32 = x_int8 × x_scale`)

---

## 4. W4A8 Quantization Strategy

The accelerator uses a **W4A8** (4-bit weights, 8-bit activations) mixed-precision scheme.

### Input quantization (PS side, before DMA transfer)
The driver in `ggml-cpu.c` quantizes the FP32 input vector `x` to INT8:
```
x_scale  = max(|x[i]|) / 127.0
x_int8[i] = clamp(round(x[i] / x_scale), -128, 127)
```
`x_scale` is written to the `CTRL` register so the accelerator recovers FP32 magnitudes
at the reduction step.

### Gate quantization (PL side, Phase 4)
After Phase 4 computes `gate = SiLU(X1) × X2` in FP32, `compute_gate` immediately
requantizes the 8192-element gate vector to INT8 using a dynamically computed scale:
```
gate_scale  = max(|gate[j]|) / 127.0
gate_int8[j] = clamp(round(gate[j] / gate_scale), -128, 127)
```
This eliminates the need to hold 8192 FP32 values (32 KB) in BRAM for Phase 5.
Instead only 8192 INT8 bytes (8 KB) are held in `gate_cache`.

### Why integer accumulators?
FP32 adders have ~5 cycle pipeline latency. A single FP32 accumulator gives II≈5.
INT32 adders have 1 cycle latency, so INT32 accumulators always achieve II=1. This also
reduces LUT cost per MAC pipeline by approximately 16×, enabling the full 32-block unroll
in Phase 5 that would otherwise exceed the ZU5EV's 117,120 LUT budget.

---

## 5. Five Execution Phases

### Phase 1 — Load x (`LOAD_X_BATCH` loop in `swiglu()`)

The INT8 input vector is read from DDR via the `x_batch` AXI master port and stored
into two BRAM arrays: `x_local_1[1][8][256]` and `x_local_2[1][8][256]`.

The dual-copy exists to avoid a DATAFLOW serialization hazard: if a single `x_local`
were shared between `compute_X1` and `compute_X2`, HLS would insert a
`Block_entry_x_local_rd_proc` broadcast module that serializes the two consumers.
With separate copies (`ram_1p` each), both downstream processes can read concurrently.

The 3D layout `[batch][block][element]` with `dim=2 complete` partitions the array into
8 independent BRAM banks. The mapping is: `x_local[n][i >> 8][i & 255]` — element `i`
goes to bank `i/256` (block index), lane `i%256`.

---

### Phase 2 — X1 = x @ W_gate.T (`compute_X1`)
### Phase 3 — X2 = x @ W_up.T (`compute_X2`)

Phases 2 and 3 execute **in parallel** within the `#pragma HLS DATAFLOW` region.
Each iterates over all 8192 rows of its respective weight matrix.

For each row:
1. `load_row_wv()` reads one Q4_K row (8 blocks × 144 bytes = 1152 bytes = 72 × 128-bit
   words) from DDR into the local buffer `rb[8][9]`.
2. `mac_blocks_wv()` computes the dot product of that row against `x_local` and returns
   a single FP32 scalar.
3. The scalar is stored into `X1_cache[0][row]` or `X2_cache[0][row]`.

`X1_cache` and `X2_cache` are `#pragma HLS STREAM depth=16` channels — HLS synthesizes
them as ping-pong FIFOs so `compute_gate` can begin processing before all 8192 rows
have been produced.

#### `load_row_wv` — Q4_K row fetch
The synthesis path uses a nested `b × w` loop (`b` = block 0..7, `w` = word 0..8) with
`PIPELINE II=1` on the inner loop. The flat AXI word address `row × 72 + b × 9 + w`
involves only constant-multiplied linear expressions — HLS computes this without integer
dividers. The C-sim path manually constructs `ap_uint<128>` words from individual bytes.

#### `mac_blocks_wv` — W4A8 Q4_K dot product (8 blocks)

**Header unpack** (`UNPACK_HDR_WV`, fully UNROLLed):

Each Q4_K block's 16-byte header is unpacked to extract:
- `d[b]` — FP16 scale factor at bytes 0–1, converted via `fp16_to_fp32()`
- `dmin[b]` — FP16 minimum-subtraction factor at bytes 2–3
- `sc6[b][0..7]` — 6-bit per-subblock scale factors (8 subblocks × 32 elements each)
- `mn6[b][0..7]` — 6-bit per-subblock minimum factors

The sc6/mn6 packing is non-trivial: bytes 4–11 hold the low 6 bits of sc6[0..3] and
mn6[0..3]; the upper 2 bits are packed into bits [7:6] of those same bytes. Bytes 12–15
provide additional nibbles that form sc6[4..7] (low nibble) and mn6[4..7] (high nibble),
combined with the upper bits extracted from bytes 4–11.

**MAC loop** (`MAC_ALL_BLOCKS`, `PIPELINE II=1`, inner loop `UNROLL`):

This is the **loop-inversion** pattern. The 256-element dimension is the outer pipelined
loop; the 8-block dimension is the inner fully-unrolled loop. All 8 blocks' integer MAC
operations fire in the same pipeline stage each clock cycle.

For element `n` of block `b`:
```
q_byte = 16 + (n & 31) + ((n & 0xC0) >> 1)   // GGML Q4_K planar nibble address
shift  = (n & 32) ? 4 : 0                      // selects high or low nibble
nib    = (rb[b][q_byte] >> shift) & 0xF        // 4-bit unsigned weight value
sub    = n >> 5                                 // subblock index (0..7)
k      = n & 7                                  // accumulator bank index

int_acc_w[b][k] += x[b][n] * nib * sc6[b][sub]
int_acc_m[b][k] += x[b][n]       * mn6[b][sub]
```

The products INT8 × INT4 × UINT6 (scale path) and INT8 × UINT6 (min path) have maximum
magnitudes of ~22 bits. After 256 accumulations the partial sums are at most ~30 bits —
well within INT32 range.

**FP32 reduction** (`REDUCE_WV`, fully UNROLLed):
```
result += d[b] * (x_scale * (float)sw) - dmin[b] * (x_scale * (float)sm)
```
The 8 partial INT32 accumulators per block are summed, converted to FP32, then multiplied
by `x_scale` to recover the original FP32 activation magnitude.

---

### Phase 4 — gate = SiLU(X1) × X2, quantized to INT8 (`compute_gate`)

This phase computes the SwiGLU nonlinearity in two sequential pipelined passes.

**Pass 1 — FP32 gate computation** (`GATE_PASS1`, `PIPELINE II=1`):

```
z     = X1_cache[0][j]
x2    = X2_cache[0][j]
idx   = clamp((int)((z + 8.0) * 256.0), 0, 4095)
g     = z * sigmoid_lut[idx] * x2      // SiLU(z) * x2
```

`sigmoid_lut` is a 4096-entry FP32 ROM covering σ(x) over [-8, +8] with step ≈ 0.0039.
At synthesis it is a `rom_1p` BRAM; at C-sim it is computed at runtime via `expf()`.
The LUT lookup replaces a transcendental hardware unit, saving DSPs at the cost of
a small quantization error in the sigmoid value.

The loop also tracks absolute maximum gate magnitude using **8 partial max accumulators**
`pmax[j & 7]`. Each is visited every 8 cycles, exceeding the ~5-cycle FP comparison
latency, so the loop-carried dependency does not prevent II=1. Computed gate values are
written to `gate_fp[8192]`, a local `ram_1p` BRAM.

**Between passes:**
```
max_abs    = max(pmax[0..7])
gate_scale = (max_abs > 0) ? max_abs / 127.0 : 1.0
inv_gs     = 1.0 / gate_scale
gate_scale_out[0] = gate_scale          // written to DATAFLOW channel
```

**Pass 2 — INT8 quantization** (`GATE_PASS2`, `PIPELINE II=1`):
```
gate_cache[0][j >> 8][j & 255] = clamp((int)(gate_fp[j] * inv_gs), -128, 127)
```
The 3D indexing maps FFN element `j` to block `j/256` and lane `j%256`, matching the
32-bank partitioned layout of `gate_cache` (one BRAM bank per W_down block).

---

### Phase 5 — output = gate @ W_down.T (`compute_output`)

Phase 5 iterates over all 2048 output rows and produces the FP32 result vector.
Two completely separate loop bodies handle Q4_K and Q6_K, selected by `down_quant_mode`.
This avoids runtime branching inside a pipelined stream-read loop where word counts
differ (288 vs 420 words per row).

At the start of `compute_output`, `gate_scale` is read from the DATAFLOW channel array
inside the function boundary (canonical DATAFLOW rule — the index must be resolved after
the task fires, not in the calling wrapper).

#### Q4_K output path

`load_row_down_q4k()` reads one 32-block Q4_K row (4608 bytes = 288 × 128-bit words)
into `rb[32][9]` using the same nested-loop pattern as `load_row_wv`, scaled to 32 blocks.

`mac_blocks_down_q4k()` uses the **full 32-block unroll**. Structure is identical to
`mac_blocks_wv` but with 32 blocks and `gate_int8` as the activation:

```
int_acc_w[b][k] += gate[b][n] * nib * sc6[b][sub]
int_acc_m[b][k] += gate[b][n]       * mn6[b][sub]
```

At reduction, `gate_scale` replaces `x_scale`:
```
result += d[b] * (gate_scale * (float)sw) - dmin[b] * (gate_scale * (float)sm)
```

#### Q6_K output path

Q6_K blocks are 210 bytes = 13.125 × 128-bit words — a non-integer stride. A clean 2D
`rb[32][14]` layout is not possible without padding that would break byte offsets in the
decoder. The Q6_K path uses a 1D `rb[420]` with `ARRAY_PARTITION complete` (full
register mapping for unlimited parallel read ports).

`load_row_down_q6k()` copies the 6720-byte row via `memcpy` at synthesis.

`mac_blocks_down_q6k()` calls `decode_mac_q6k()` for each of the 32 blocks with
`UNROLL factor=8` — four sequential groups of 8 parallel blocks.

`decode_mac_q6k()` decodes one 256-element Q6_K block and computes its dot product
with the INT8 gate vector:
- **Low 4 bits** (`ql`): bytes `[0..127]`, two elements per byte (even=low nibble, odd=high nibble)
- **High 2 bits** (`qh`): bytes `[128..191]`, four elements per byte as 2-bit fields
- **6-bit signed value**: `q = ((qh << 4) | ql) - 32` (range -32..31)
- **Per-element scale**: byte `[192 + n/16]` — one INT8 scale per 16 consecutive elements
- **Block scale**: FP16 `d` at bytes 208–209
- **Gate dequantization**: `v = (float)gate_int8[n] * gate_scale` (inside the inner loop)
- Accumulation: `acc[n & 7] += v * (float)q * (float)scale` using 8 partial FP32 accumulators

---

## 6. DATAFLOW Execution Model

The four compute functions are connected as a producer-consumer pipeline:

```
compute_X1(W)  ──────────────────────────────┐
                                              ├──► compute_gate ──► compute_output(W_down)
compute_X2(V)  ──────────────────────────────┘
```

`X1_cache` and `X2_cache` are FIFO streams (`depth=16`). `compute_gate` can begin
consuming the first elements of X1/X2 before Phases 2/3 have finished all 8192 rows,
enabling pipeline overlap. `gate_cache` and `gate_scale` flow from `compute_gate` to
`compute_output` as DATAFLOW channels (Ping-Pong buffer and scalar respectively).

---

## 7. `fp16_to_fp32` — Safe FP16 Conversion

Weight scale factors `d` and `dmin` in Q4_K/Q6_K blocks are stored as FP16. The
conversion uses manual bit manipulation rather than `hls_half` or `ap_fixed<16,5>`.
Both HLS types silently flush subnormal FP16 values to zero at synthesis (DAZ —
Denormals Are Zero). Real LFM2-1.2B weights contain subnormal scale fields; using
`hls_half` would zero those blocks' contributions and corrupt outputs.

The manual conversion handles all IEEE 754 FP16 cases:
- **±0**: sign bit only, no exponent or mantissa
- **Subnormal** (exp=0, mant≠0): iterative left-shift normalization, bias set to 112
- **Inf/NaN** (exp=31): passthrough with mantissa preserved, exponent set to 255
- **Normal**: exponent bias remap (FP16 bias 15 → FP32 bias 127, delta = 112)

---

## 8. Memory Architecture Summary

| Variable        | Type         | Shape            | HLS Storage    | Size      | Purpose                                      |
|-----------------|--------------|------------------|----------------|-----------|----------------------------------------------|
| `x_local_1`     | INT8         | `[1][8][256]`    | BRAM ram_1p    | 2 KB      | x copy for compute_X1; 8-bank partition      |
| `x_local_2`     | INT8         | `[1][8][256]`    | BRAM ram_1p    | 2 KB      | x copy for compute_X2; 8-bank partition      |
| `X1_cache`      | FP32         | `[1][8192]`      | FIFO stream    | ~32 KB    | DATAFLOW channel; depth=16                   |
| `X2_cache`      | FP32         | `[1][8192]`      | FIFO stream    | ~32 KB    | DATAFLOW channel; depth=16                   |
| `gate_fp`       | FP32         | `[8192]`         | BRAM ram_1p    | 32 KB     | Temporary FP32 gate; local to compute_gate   |
| `gate_cache`    | INT8         | `[1][32][256]`   | BRAM ram_2p    | 8 KB      | Quantized gate; 32-bank partition            |
| `gate_scale`    | FP32         | `[1]`            | Register       | 4 B       | DATAFLOW channel scalar                      |
| `sigmoid_lut`   | FP32 (const) | `[4096]`         | BRAM rom_1p    | 16 KB     | σ(x) over [-8,+8]; runtime init at C-sim    |
| `row_buf` (WV)  | ap_uint<128> | `[8][9]`         | Registers      | 1152 B    | Per-row Q4_K weight buffer (gate/up)         |
| `row_buf` (Q4K) | ap_uint<128> | `[32][9]`        | Registers      | 4608 B    | Per-row Q4_K weight buffer (down)            |
| `row_buf` (Q6K) | ap_uint<128> | `[420]`          | Registers      | 6720 B    | Per-row Q6_K weight buffer (down)            |

---

## 9. Key HLS Optimization Techniques

### Loop Inversion (Phases 2, 3, 5-Q4K)
The block dimension (N blocks) is moved **inside** a `PIPELINE II=1` element loop (256
elements) with `UNROLL`. This requires HLS to synthesize N independent MAC pipelines in
parallel. The alternative — unrolling the block loop over function calls — produces N
sequential FSM states sharing a common functional unit pool, executing one block at a time.

### INT32 Accumulators (Phases 2, 3, 5-Q4K)
Integer adders have 1-cycle latency, so a single INT32 accumulator achieves II=1 without
partial-accumulator workarounds. The 8 partial accumulators per block (`k = n & 7`) are
retained to match the inner-loop structure but are not required for II.

### 2D Array Layout for BRAM Bank Isolation
`rb[b][w]` with `dim=1 complete` makes each block's BRAM bank trivially unambiguous.
A 1D flat `rb[b * Q4_K_WORDS + w]` with block partitioning requires HLS alias analysis
to prove distinct bank assignments for the stride-9 addressing — which may fail and cause
assumed port contention, serializing MAC instances.

### 8 Partial FP32 Accumulators (Q6K decoder, Phase 4 pass 1)
FP32 adders have ~5 cycle latency. With 8 partial accumulators (`acc[n & 7]`), each
accumulator is revisited every 8 cycles — exceeding the 5-cycle latency — allowing all
8 to be active simultaneously at II=1.

### Sigmoid LUT for SiLU
Computing `σ(z) = 1/(1+exp(-z))` in hardware requires transcendental logic costing many
DSPs and cycles. The 4096-entry LUT covers [-8, +8] with step ≈ 0.0039, sufficient for
INT8-accuracy gate computation. LUT lookup is a single BRAM read — 1 cycle latency.

### Separate Q4K / Q6K Phase 5 Loops
Two completely separate output loops avoid runtime branching on `down_quant_mode` inside
a pipelined stream-read loop. Q4K reads 288 words/row; Q6K reads 420 words/row. A
combined conditional loop would prevent II=1 due to variable-length dependencies.
