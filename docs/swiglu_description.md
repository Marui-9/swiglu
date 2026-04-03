# swiglu.cpp: Stage-by-Stage Description (Vitis HLS)

This summarizes the fused SwiGLU IP implementation, mapping each algorithm step (see `docs/swiglu_algorythm.txt`) to the code in `swiglu.cpp` and the key HLS pragmas.

## Stage 0 — Interfaces & Top-Level DATAFLOW
- File: `swiglu.cpp`, function `swiglu` (bottom of file).
- Purpose: Declare AXI ports, set up local buffers, and launch DATAFLOW tasks.
- Key pragmas:
  - `#pragma HLS INTERFACE mode=m_axi` on W, V, W_down, x_batch, out_batch (bundles gmem_W/V/Wd/x/out). Depths set for MAX_BATCH=4 (8192 elems for x/out).
  - `#pragma HLS INTERFACE mode=s_axilite` for control args and return.
  - `#pragma HLS DATAFLOW` to overlap sub-functions.
  - Local buffers: `x_local_1/2` (LUTRAM, dim2 partition complete), `X1_cache/X2_cache` (BRAM 2-port), `gate_cache` (URAM 2-port, dim2 cyclic factor=8), `gate_scale` (small array), `sigmoid_lut` (ROM LUTRAM).

## Stage 1 — Load x (INT8) into on-chip banks
- Function: `load_x_local`
- Purpose: Burst-read x_batch (INT8) and distribute into two banked copies for parallel W/V projections.
- Key pragmas: `INLINE off`; `ARRAY_PARTITION dim=2 complete` on x_local; inner loop `PIPELINE II=1`; 128-bit wide reads via `ap_uint<128>` casting.

## Stage 2 — Linear projections A = x·W_gate, B = x·V (INT8×Q4_K)
- Functions: `compute_X1`, `compute_X2` using `load_row_wv` + `mac_blocks_wv_k2`.
- load_row_wv: `ARRAY_PARTITION rb dim=1 complete`, `PIPELINE II=1` to stream one Q4_K row (8 blocks) per cycle.
- mac_blocks_wv_k2: processes 2 rows at a time (K=2) to fit LUT budget; DSP-bound multiplies (`BIND_OP op=mul impl=dsp`); unroll factors: b-loop complete, kr-loop complete; inner MAC loop `PIPELINE II=1`, `LATENCY min=2`; reduction balanced with `BALANCE` and small unroll.
- Outputs: X1_cache, X2_cache as INT8 with fixed scale (X12_QUANT_SCALE) applied at reduction.

## Stage 3 — Swish + gate (SiLU(A) * B), quantize gate to INT8
- Function: `compute_gate`
- Two-pass per token (n): pass1 finds max |SiLU(A)*B| (pipeline II=1); pass2 recomputes and quantizes to INT8 with per-token `gate_scale`. Arrays are partitioned for bandwidth; gate_cache stored in URAM (dim=2 cyclic factor=8).

## Stage 4 — Down projection: gate @ W_down.T (Q4_K or Q6_K)
- Function: `compute_output`
- Q4_K path: `load_row_down_q4k` (cyclic factor=4) + `mac_blocks_down_q4k` (UNROLL factor=6, PIPELINE II=1, LATENCY min=2, DSP multiplies). Reduction balanced with `BALANCE` and unroll factor=6.
- Q6_K path: uses decoded nibble/scale buffers, similar pipeline with balanced reduction.
- `out_batch` written as VECTOR_DIM floats; top-level DATAFLOW handles copying to the m_axi port.

## Stage 5 — Top-level swiglu DATAFLOW schedule
- In `swiglu`: the DATAFLOW region calls, in order: `load_x_local` → `compute_X1` → `compute_X2` → `compute_gate` → `compute_output`. Buffers are sized for `MAX_BATCH` (currently 4); control still passes a single `x_scale` scalar—future batch-aware support would pass per-token scales.

## Batch and scaling notes
- MAX_BATCH is set to 4 (see `swiglu.h`); m_axi depths updated accordingly. Kernel currently uses a single x_scale scalar and processes tokens sequentially inside the DATAFLOW; driver guards keep batch=1 until HLS is updated for per-token scales.
- Weight formats: W_gate/W_up are Q4_K; W_down is Q4_K or Q6_K. Activations and outputs are FP32; scales (d, dmin) are fp16 decoded to FP32.

## Resource/throughput highlights
- X1/X2: K=2 row parallelism reduces LUT use while keeping II=1 on MACs.
- Down Q4_K: block UNROLL=6 to balance timing/resource vs throughput; Q6_K reduction unroll=2.
- Gate/output buffers in URAM/BRAM to fit ZU5EV limits; partitioning aligns with unroll factors.


# HLS Implementation and Parallel Computation (summary-style)
- **Data reuse & local buffering:** Two banked copies of x (`x_local_1/2`) sit in LUTRAM; weight rows are streamed a row at a time into small on-chip row buffers (`row_buf`) for W/V and Q4/Q6 down paths. Gate/X1/X2 caches live in URAM/BRAM for reuse across MAC/reduction stages.
- **Parallel MACs:** W/V projections use K=2 row parallelism with full block unroll (8 blocks) and `PIPELINE II=1`; down-projection Q4_K uses block `UNROLL factor=6`, Q6_K uses factor=2 on reductions to meet timing. Multipliers are bound to DSPs; adders are balanced with `BALANCE` pragmas.
- **Pipelining:** All inner MAC loops are `PIPELINE II=1` with `LATENCY min=2` to allow a decode→MAC register stage. Top-level `DATAFLOW` overlaps load_x → X1 → X2 → gate → output.
- **Memory partitioning:** Extensive `ARRAY_PARTITION` (complete or cyclic) matches unroll factors, eliminating banking conflicts; caches are explicitly bound (`BIND_STORAGE`) to URAM/BRAM/LUTRAM to stay within ZU5EV resource limits.

# AXI Interface and Integration
- Five AXI4 m_axi ports: W, V, W_down (all read), x_batch (read), out_batch (write), each on its own bundle; burst length up to 256 beats, widened to 128 bits. Depths sized for MAX_BATCH=4 (8192 elements for x/out).
- AXI4-Lite CTRL registers: pointers for W/V/Wd/x/out, mode (Q4_K/Q6_K), x_scale, ap_start/done/irq. Global interrupt enable supports UIO-driven completion on the PS.
- The IP is integrated via SmartConnect to HP ports; host programs phys addresses and starts the core. Weight reuse is host-managed: weights are copied once per layer into fixed udmabuf slots; subsequent calls re-use cached weights.
