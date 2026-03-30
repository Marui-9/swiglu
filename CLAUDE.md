# CLAUDE.md — SwiGLU Accelerator Project Notes

## Project Overview

Hardware offload of the SwiGLU FFN block from LFM2-1.2B (Liquid AI) onto a Kria KV260
(Zynq UltraScale+ ZU5EV). The accelerator is built with Vitis HLS and integrated into
Vivado, then invoked from llama.cpp by patching `ggml-cpu.c`.

A working predecessor IP (`linear_projection`) is already deployed on the board and serves
as the reference for all HLS and software driver patterns.

---

## Recent changes (2026-03-30)

- HLS: moved all hot scratch buffers to BRAM (row_buf in X1/X2/output, out_local, x_local_1/2, sigmoid_lut ROM) and kept cache arrays in URAM; Q4 down-path inner unroll restored to 2; DSP binding applied to hot muls; AXI outstanding depth reduced to 2 to curb LUTRAM FIFO growth.
- Runtime (ggml-cpu.c): cached W/V/Wd base-address programming to the swiglu IP; only re-write when layer or quant mode changes, while still updating x/out/mode/scale per token. Preserves functionality, lowers per-token register traffic.

---

## Model Dimensions (confirmed from GGUF metadata)

| Symbol        | Value  | Meaning                          |
|---------------|--------|----------------------------------|
| embedding_dim | 2048   | Input/output size of SwiGLU      |
| ffn_dim       | 8192   | FFN intermediate dimension       |
| num_layers    | 16     | Transformer blocks                |

Weight quantization per layer (all 16 blocks):
- `ffn_gate.weight` (W): Q4_K — all 16 layers
- `ffn_up.weight`   (V): Q4_K — all 16 layers
- `ffn_down.weight` (W_down): Q6_K on layers 0,1,4,7,10,13,14,15; Q4_K on 2,3,5,6,8,9,11,12

---

## HLS Implementation Status

All five source files are complete. **C-simulation must be re-run** after the loop-inversion rewrite:

| File              | Status              | Notes                                                       |
|-------------------|---------------------|-------------------------------------------------------------|
| `swiglu.h`        | Done                | Interface declaration, stream_pkt typedef                   |
| `swiglu.cpp`      | Rewritten (2026-03-27) | Loop-inversion MAC parallelization; needs C-sim re-run   |
| `swiglu_tb.cpp`   | Done                | 5 tests PASS (pre-rewrite); re-run required                 |
| `sigmoid_lut.h`   | Done                | Runtime init for C-sim, precomputed ROM for synthesis       |
| `sigmoid_lut_gen.py` | Done             | Python script that generates the LUT                        |

### Five-Phase Structure

| Phase | Operation                         | Memory          | Stream reads |
|-------|-----------------------------------|-----------------|--------------|
| 1     | Load x (2048 F32)                 | BRAM            | 2048 words   |
| 2     | X1 = x @ W.T (Q4_K, 8192 rows)   | URAM (X1_cache) | 9.0 MB       |
| 3     | X2 = x @ V.T (Q4_K, 8192 rows)   | URAM (X2_cache) | 9.0 MB       |
| 4     | gate = SiLU(X1) * X2 (LUT)       | URAM (gate_cache)| none        |
| 5     | output = gate @ W_down.T (2048)  | out_stream      | 9.0–13.1 MB  |

### Key HLS Design Decisions

- **fp16_to_fp32()**: Manual bit-manipulation only — never hls_half or ap_fixed<16,5>.
  Both flush subnormal fp16 to zero at synthesis (DAZ bug). Q4_K d and dmin fields in
  real LFM2 weights are often subnormal, which would make all outputs zero.

- **8 partial accumulators (acc_w, acc_m)**: FP adder has ~5 cycle latency. A single
  accumulator gives II≈5. Eight accumulators (each visited every 8 cycles > 5) → II=1.
  Q4_K needs TWO such arrays (acc_w for nibble path, acc_m for min-subtraction path).

- **Pair-processing**: Each READ_PAIR reads exactly N words for 2 blocks (72 for Q4_K,
  105 for Q6_K) with no loop-carried state. Conditional stream reads create dependencies
  that prevent II=1.

- **Phase 5 branching**: Two completely separate loops (Q4K and Q6K) selected by
  `down_quant_mode` AXI-Lite register. This avoids runtime branching inside a pipelined
  stream-read loop where the word count differs (72 vs 105).

- **Three separate URAM arrays**: X1, X2, gate must be separate to avoid read/write port
  conflicts during Phase 4 (X1 and X2 read simultaneously while gate is written).

- **MAX_BATCH=1**: Changed from 8 to fix BRAM over-utilization. gate_cache [8][8192]
  with ram_2p → 256 BRAM_18K; gate_cache [1][8192] → 32 BRAM_18K. x_local [8][2048] →
  64 BRAM_18K → 8 BRAM_18K. Total memory ~40 BRAM_18K → estimated design total ~194
  BRAM_18K (under ZU5EV's 288 limit). Driver batch guard (ne[1]==1) already enforces
  single-token decode.

- **DATA_WIDTH=128 on W, V, W_down**: These are uint8_t* ports — default HLS AXI bus
  is 8-bit = 100 MB/s at 100 MHz. DATA_WIDTH=128 gives 128-bit bus = 1.6 GB/s (16×).
  Evidence from synthesis: Pipeline intervals matched byte counts exactly (1153 cycles =
  1152 bytes, 4609 = 4608, 6721 = 6720) confirming 1 byte/cycle without this pragma.

- **Loop inversion for parallel MACs**: UNROLL alone on outer loop doesn't create parallel
  hardware — HLS allocates a shared pool of FP units (`grp_fu_*`) since unrolled instances'
  FSM lifetimes don't overlap (they execute sequentially). Fix: invert loops so the
  256-element dimension is outermost with `PIPELINE II=1`, and the N-block dimension is
  innermost with `UNROLL`. All N blocks' MACs now exist in the same pipeline stage → HLS
  must synthesize N independent FP pipelines (sharing is physically impossible).

- **2D/3D arrays for BRAM bank isolation**: 1D arrays with `block factor=K` rely on HLS
  alias analysis to prove `array[b*stride + n]` maps to distinct banks. If HLS can't prove
  this (e.g., non-power-of-2 stride), it assumes port contention → MAC instances serialized.
  Fix: explicit 2D layout `rb[N_blocks][Q4_K_WORDS]` with `dim=1 complete` (each block's
  bank assignment is trivially unambiguous). gate_cache uses 3D `[MAX_BATCH][DOWN_BLOCKS][256]`
  with `dim=2 complete` for the same reason.

- **4-group structure for mac_blocks_down_q4k (32 blocks)**: Full UNROLL of 32 blocks
  inside `PIPELINE II=1` synthesizes 32 parallel FP pipelines — may exceed DSP budget.
  Use explicit group loop: `PROCESS_GROUPS (4 groups) → MAC_8_BLOCKS PIPELINE II=1 (256
  elements) → b_sub UNROLL (8 blocks)`. Time-multiplexes 8 DSP pipelines over 4 sequential
  groups. Cost: 4× cycle count vs full unroll, but 4× fewer DSPs.

- **Q4_K_WORDS=9**: Q4_K block = 144 bytes = 9 × 128-bit words. NOT a power of 2. Using
  `rb[b * Q4_K_WORDS + w]` with flat indexing in a pipelined loop requires hardware dividers
  (for `i/9`) → kills II=1. Use nested loop `rb[b][w]` (b=0..N_blocks, w=0..8) instead.

- **Q6K non-integer stride**: Q6K blocks = 210 bytes = 13.125 × 128-bit words. Cannot form
  a clean 2D `rb[32][14]` without breaking byte offsets in decode_mac_q6k. Q6K path keeps
  1D rb with `block factor=32` and sequential UNROLL (still correct, just not loop-inverted).

- **x_local duplicated (DATAFLOW fix)**: x_local split into x_local_1 (for compute_X1) and
  x_local_2 (for compute_X2). LOAD_X writes both. Pragma changed from `ram_t2p` to `ram_1p`
  on each (single reader per variable). Eliminates `Block_entry_x_local_0_rd_proc` serializer.
  Both arrays shaped as `[MAX_BATCH][WV_BLOCKS_PER_ROW][256]` with `dim=2 complete`.

- **gate_cache is 3D**: Reshaped from `[MAX_BATCH][FFN_DIM]` to `[MAX_BATCH][DOWN_BLOCKS_PER_ROW][256]`
  with `dim=2 complete` everywhere. compute_gate writes `gate_cache[n][j>>8][j&255]`.
  mac_blocks_down_q4k and mac_blocks_down_q6k both take `const float gate[DOWN_BLOCKS_PER_ROW][256]`.

- **decode_mac_q4k eliminated**: Its logic is inlined directly into mac_blocks_wv (UNPACK_HEADERS
  + MAC_ALL_BLOCKS loops). decode_mac_q6k is retained for the Q6K path.

---

## Vivado Block Design (completed, bitstream generated)

### Confirmed Addresses (from Vivado Address Editor)

| Peripheral            | Base Address  |
|-----------------------|---------------|
| axi_dma_0 S_AXI_LITE  | 0xA0000000    |
| linear_projection_0   | 0xA0010000    |
| swiglu_0 s_axi_CTRL   | 0xA0020000    |
| axi_dma_1 S_AXI_LITE  | 0xA0030000    |

Note: SWIGLU_DMA_BASE = 0xA0030000 (axi_dma_1), SWIGLU_IP_BASE = 0xA0020000 (swiglu_0).
The placeholders in earlier notes had these swapped.

### Confirmed Block Design Connections

```
zynq_ultra_ps_e_0
  M_AXI_HPM0_FPD → axi_smc S00_AXI
  S_AXI_HP0_FPD  → smartconnect_0 M00_AXI
  pl_ps_irq      → xlconcat_0 dout

axi_smc (AXI-Lite control SmartConnect)
  M00_AXI → linear_projection_0 s_axi_CTRL
  M01_AXI → axi_dma_0 S_AXI_LITE
  M02_AXI → swiglu_0 s_axi_CTRL
  M03_AXI → axi_dma_1 S_AXI_LITE

axi_dma_1 (SwiGLU DMA)
  M_AXI_SG    → smartconnect_0 S05_AXI
  M_AXI_MM2S  → smartconnect_0 S03_AXI
  M_AXI_S2MM  → smartconnect_0 S04_AXI
  M_AXIS_MM2S → swiglu_0 in_stream
  s2mm_introut → xlconcat_0 In3

swiglu_0
  out_stream  → axi_dma_1 S_AXIS_S2MM
  interrupt   → xlconcat_0 In4

axi_dma_0 (linear_projection DMA)
  M_AXI_SG/MM2S/S2MM → smartconnect_0 S00/S01/S02_AXI
  S_AXIS_S2MM ← linear_projection_0 out_stream
  mm2s_introut → xlconcat_0 In0
  s2mm_introut → xlconcat_0 In1

linear_projection_0
  in_stream  → axi_dma_0 M_AXIS_MM2S
  interrupt  → xlconcat_0 In2
```

### xlconcat Interrupt Mapping (5 inputs)

| xlconcat | Signal                        | pl_ps_irq0 | GIC SPI | DT offset |
|----------|-------------------------------|------------|---------|-----------|
| In0      | axi_dma_0 mm2s_introut        | [0]        | 121     | 89        |
| In1      | axi_dma_0 s2mm_introut        | [1]        | 122     | 90        |
| In2      | linear_projection_0 interrupt | [2]        | 123     | 91        |
| In3      | axi_dma_1 s2mm_introut        | [3]        | 124     | 92        |
| In4      | swiglu_0 interrupt            | [4]        | 125     | 93        |

The `[0:0]` annotation on each xlconcat input in Vivado is just port-width notation (1-bit wide). Normal.

### CRITICAL: axi_dma_1 Must Be Configured for Scatter-Gather Mode

When adding axi_dma_1 to the block design, its IP customization **must have
Scatter-Gather (SG) mode enabled**. The default is Direct Register mode.

Symptom of wrong configuration: S2MM_DMASR bit 2 (SGIncld) = 0.
Observed during board testing: S2MM_DMASR = 0x00010008 (SGIncld=0, DMAIntErr).
Fix: double-click axi_dma_1 in Vivado → enable "Enable Scatter Gather Engine" →
regenerate bitstream.

Match axi_dma_0 configuration exactly: SG mode, 26-bit buffer length register,
64-bit AXI address, 32-bit AXI stream width.

---

## Software Driver (ggml-cpu.c) — Completed

### Constants (confirmed addresses)

```c
#define UDMABUF_SIZE     671088640U     // 640 MB — Phase B per-layer weight cache (614 MB used)
#define SWIGLU_DMA_BASE  0xA0030000UL  // axi_dma_1 S_AXI_LITE
#define SWIGLU_IP_BASE   0xA0020000UL  // swiglu_0 s_axi_CTRL

// udmabuf layout — LP SG descriptor area reused (first 1 MB), SwiGLU regions follow
#define SWG_VEC_OFF      0x06C50000U   // x batch: up to MAX_BATCH × 2048 × F32
#define SWG_OUT_OFF      0x06C60000U   // output batch
// Phase B: per-layer weight cache — 16 permanent slots, never overwritten
#define SWG_LAYER_W_BASE      0x06D00000U   // layers 0-15, stride 0x900000 (9 MB each)
#define SWG_LAYER_V_BASE      0x0FD00000U   // layers 0-15, stride 0x900000
#define SWG_LAYER_WD_BASE     0x18D00000U   // layers 0-15, stride 0xE00000 (14 MB each)
// High-water mark ≈ 614 MB, within 640 MB UDMABUF_SIZE
```

Why 640 MB: All 16 layers' W (9 MB each = 144 MB) + V (144 MB) + W_down (14 MB each =
224 MB) are cached permanently in fixed udmabuf slots. Total: ~512 MB weights + overhead.
Once loaded on first use, weights are never re-copied — only the 8 KB x vector changes.

### Trigger Condition and Batch Guard

```c
// Outer condition — matches ffn_down MUL_MAT only
if (src0->ne[0] == 8192 && src0->ne[1] == 2048 &&
    (src0->type == GGML_TYPE_Q4_K || src0->type == GGML_TYPE_Q6_K) &&
    src1->type == GGML_TYPE_F32) {

    if (ith == 0) {
        // Batch guard: accelerator handles single-token decode only (ne[1]==1)
        // Prefill (ne[1] > 1) falls back to CPU silently — call counter NOT incremented
        if (src1->ne[1] != 1) {
            goto cpu_compute_fallback;
        }
        // ... hardware offload ...
    }
    ggml_barrier(params->threadpool);
    return;
}
```

### Actual Graph Walk (confirmed from board execution)

llama.cpp uses a **fused GGML_OP_GLU** for the gate×up operation — NOT separate SILU+MUL.
The graph is one level shallower than the original plan assumed:

```c
// ACTUAL graph structure (confirmed from ggml op names on board):
// dst        op=MUL_MAT  type=f32    [2048, 1]   ← ffn_down (intercepted here)
// dst->src[1] op=GLU     type=f32    [8192, 1]   ← fused silu(gate)*up
// gated->src[0] op=MUL_MAT type=f32 [8192, 1]   ← gate = W_gate @ x
// gate_mm->src[0] op=NONE type=q4_K [2048,8192]  ← W_gate (leaf)
// gate_mm->src[1] op=NONE type=f32  [2048, 1]    ← x (leaf)
// gated->src[1] op=MUL_MAT type=f32 [8192, 1]   ← up = W_up @ x
// up_mm->src[0] op=NONE type=q4_K  [2048,8192]  ← W_up (leaf)

struct ggml_tensor *gated   = dst->src[1];           // GLU op
struct ggml_tensor *gate_mm = gated->src[0];          // MUL_MAT(W_gate, x)
struct ggml_tensor *up_mm   = gated->src[1];          // MUL_MAT(W_up,   x)

const void  *W_data      = gate_mm->src[0]->data;    // W_gate (Q4_K leaf)
const float *x_data      = (const float *)gate_mm->src[1]->data;  // x (F32 leaf)
const void  *V_data      = up_mm->src[0]->data;      // W_up   (Q4_K leaf)
const void  *W_down_data = src0->data;               // W_down
```

**OLD (wrong) walk assumed**: `gated->src[0]` = SILU → `gate_act->src[0]` = MUL_MAT.
**ACTUAL**: `gated` is the GLU op itself; `gated->src[0]` is already the gate MUL_MAT.

---

## Current Status (as of 2026-03-27)

**Board is running and functionally correct** (baseline). Per-call time: ~1000–1050ms.
CPU baseline: ~4 t/s. **Performance goal: beat 4 t/s. Current baseline: ~0.06 t/s.**

`swiglu.cpp` has been fully rewritten with RC5, RC6, RC7 fixes applied. **C-simulation
must be re-run** to confirm numerical correctness before synthesis.

### Synthesis Performance Data (baseline, from swiglu_csynth.rpt)

| Module                              | Min cycles | Max cycles | Notes                          |
|-------------------------------------|------------|------------|--------------------------------|
| compute_X1_U0                       | 9.5M       | 34.3M      | outer loop NOT pipelined       |
| Block_entry_x_local_0_rd_proc_U0    | 18.99M     | 68.5M      | = 2× compute_X1 → serialized! |
| compute_output_U0 (DOWN_Q4K)        | 9.4M       | 36M        | outer loop NOT pipelined       |
| swiglu (top DATAFLOW)               | 28.4M      | 105.8M     | matches observed 1000ms        |

### Root Causes and Fix Status

| # | Root Cause                              | Status          | Fix                                           |
|---|-----------------------------------------|-----------------|-----------------------------------------------|
| 5 | 8-bit AXI bus for W/V/W_down            | FIXED (code)    | DATA_WIDTH=128 in pragmas                     |
| 6 | DATAFLOW serialization via x_local      | FIXED (code)    | x_local_1 + x_local_2, each ram_1p            |
| 7 | Sequential MACs (one block at a time)   | FIXED (code)    | Loop inversion; 3D gate_cache; PROCESS_GROUPS |
| 8 | 100 MHz clock                           | NOT FIXED       | Set PL CLK0 to 300 MHz in Vivado              |

**Root Cause 6**: `x_local` BRAM shared between compute_X1 and compute_X2 in DATAFLOW
caused HLS to generate `Block_entry_x_local_0_rd_proc` (18.99M = 2× compute_X1).
Fixed: LOAD_X writes both x_local_1 and x_local_2; each process reads its own `ram_1p` copy.

**Root Cause 7**: Sequential MAC calls per row (~350 cycles/block × 8 blocks = 2800 cycles/row).
Fixed via loop inversion: 256-element loop is `PIPELINE II=1` with block dimension `UNROLL`ed
inside → N parallel FP pipelines. mac_blocks_wv (8 blocks): ~270 cycles/row. mac_blocks_down_q4k
(32 blocks, 4-group × 8 structure): 4 × 256 = 1024 cycles/row.

**Root Cause 8**: 100 MHz → ~3.2 GMAC/s. CPU (4× A53 + NEON): ~3–7 GMAC/s.
Need 300 MHz for ~9.6 GMAC/s with unrolled MACs.

### Estimated Performance After All Fixes (at 300 MHz)

| Module                    | Cycles/row | Rows  | Total cycles | Time @ 300 MHz |
|---------------------------|------------|-------|--------------|----------------|
| mac_blocks_wv (X1 or X2)  | ~270       | 8192  | ~2.2M        | ~7.3ms         |
| mac_blocks_down_q4k       | ~1024      | 2048  | ~2.1M        | ~7ms           |
| mac_blocks_down_q6k       | ~350×8seq  | 2048  | ~5.7M        | ~19ms          |

Full decode call (Q4K layers): compute_X1 ∥ compute_X2 (~7.3ms) + gate (~1ms) + output
(~7ms) ≈ **~15ms → ~4.1 t/s at 300 MHz**.

| Step                                        | Time/call | t/s   |
|---------------------------------------------|-----------|-------|
| Baseline (all bugs)                         | ~1000ms   | 0.06  |
| RC5 only (DATA_WIDTH=128)                   | ~238ms    | 0.26  |
| + RC6 (x_local dup)                         | ~119ms    | 0.5   |
| + RC7 (loop inversion)                      | ~38ms     | 1.6   |
| + RC8 (300 MHz clock)                       | ~12–15ms  | ~4.1  | ← target

## What Remains To Be Done

### 1. Run C-Simulation (HIGH PRIORITY)

The loop-inversion rewrite changed all MAC functions significantly. Re-run the 5-test
C-simulation in Vitis HLS to confirm numerical correctness before synthesis:
- Q4K path (compute_X1, compute_X2, mac_blocks_wv) with normal and subnormal fp16
- Q6K path (mac_blocks_down_q6k)
- gate/SiLU path (compute_gate with 3D gate_cache indexing)

### 2. Increase PL Clock to 300 MHz (can be done in parallel with C-sim)

In Vivado: double-click zynq_ultra_ps_e_0 → Clock Configuration → PL Fabric Clocks
→ set PL CLK0 to 300 MHz. Re-run HLS synthesis with 3.33ns target period.

### 3. Re-synthesize HLS and Export IP

After C-sim passes and clock is set, re-synthesize and confirm:
- `Block_entry_x_local_0_rd_proc` absent (eliminated by x_local_1/x_local_2 fix)
- 8 parallel FP pipelines in mac_blocks_wv (loop inversion confirmed)
- 8 parallel FP pipelines in mac_blocks_down_q4k per group
- m_axi_gmem_W RDATA = 128 bits (DATA_WIDTH=128 confirmed)
- BRAM_18K total well under 288 (ZU5EV limit); DSP48E2 < 1248

Export IP → Upgrade swiglu_0 in Vivado → validate design → generate bitstream → deploy.

### 4. Optional: Disable linear_projection Block (Already Done)

The LP block (src0->ne[1]==65536) is disabled with `if (0 && ...)` in ggml-cpu.c.
The lm_head projection falls back to CPU. The udmabuf is 640 MB with per-layer weight
caching already implemented (`swg_layer_W/V/Wd_loaded[16]` flags).

---

## Critical Lessons (do not repeat these bugs)

From linear_projection:
1. **DAZ bug**: Never use hls_half or ap_fixed for fp16 fields. Use fp16_to_fp32() via uint32_t bit manipulation.
2. **DMA deadlock**: Write ap_start BEFORE MM2S TAILDESC. If IP TREADY=0 when TAILDESC is written, MM2S stalls permanently.
3. **SGSlvErr on reuse**: Clear STATUS field of every descriptor before each call.
4. **S2MM DMAIntErr on second call**: Soft-reset both DMA channels before programming CURDESC each call.
5. **TAILDESC off-by-one**: TAILDESC = phys_base + (last_idx × 64), NOT (last_idx+1) × 64.
6. **Wrong addresses**: DMA=0xA0000000, IP=0xA0010000 for linear_projection. XSCT had them swapped.
7. **IRQThreshold=0 invalid**: S2MM_DMACR must have IRQThreshold≥1 in bits[23:16]. Use 0x00011001.
8. **UIO device index**: Never hardcode /dev/uio0. Use open_uio_by_addr() to find by physical address.
9. **ap_ctrl is not RAM**: Do not write test patterns to AP_CTRL; reads return live hardware state.
10. **II=1 for MACs**: Use 8 partial accumulators with ARRAY_PARTITION complete. Single accumulator → II≈5.
11. **II=1 for stream reads**: Use pair-processing (fixed word count per loop). Conditional reads → II>1.

Discovered during SwiGLU bringup:
12. **SG mode not default**: AXI DMA IP defaults to Direct Register mode. Must explicitly enable Scatter-Gather in IP customization. Symptom: S2MM_DMASR bit 2 (SGIncld) = 0; MM2S appears to "complete" instantly (length=0), S2MM gets DMAIntErr.
13. **Fused GLU op**: llama.cpp uses GGML_OP_GLU (fused silu×up), NOT separate SILU+MUL nodes. Graph walk is one level shallower than expected — `dst->src[1]` is the GLU op; its `src[0]` and `src[1]` are the gate and up MUL_MAT ops directly.
14. **Batch guard required**: The trigger condition matches during prefill (src1->ne[1] > 1) as well as decode. The accelerator handles only single-token decode (ne[1]==1). Add guard before hardware path; prefill falls back to CPU silently.
15. **udmabuf must be 160 MB**: LP matrix occupies 110 MB at offset 0x300000, ending at 0x6C00000 (108 MB). SwiGLU needs 32 MB after that, requiring ~140 MB total. Use UDMABUF_SIZE = 167,772,160 and update the udmabuf DTS node accordingly.
16. **Address swap**: swiglu_0 is at 0xA0020000 and axi_dma_1 is at 0xA0030000 — opposite of the placeholder values in the original plan.
17. **MM2S_DMACR IRQThreshold**: Use 0x00011001 for MM2S_DMACR too (not 0x1001). IRQThreshold=0 in bits[23:16] is invalid for both channels.

Discovered from synthesis report analysis (performance optimization):
18. **uint8_t* → 8-bit AXI bus**: HLS infers AXI bus width from the pointer type. `uint8_t*` gives 8-bit bus = 100 MB/s at 100 MHz. Always add `DATA_WIDTH=128` (or 256/512) to m_axi pragmas for byte-array ports. Evidence: Pipeline_1 interval exactly matched byte count (1153 cycles = 1152 bytes).
19. **DATAFLOW shared BRAM creates serializer**: If two DATAFLOW processes both read the same local BRAM array (e.g., x_local), HLS inserts a `Block_entry_*_rd_proc` module that broadcasts the array sequentially — defeating parallel execution. Confirmed: Block_entry = 2× compute_X1. Fix: duplicate the shared array so each process has its own copy.
20. **BRAM over-utilization from MAX_BATCH**: ram_2p (True Dual Port) BRAM at 32-bit width holds 256 words/BRAM_18K. A cache [MAX_BATCH][8192] with ARRAY_PARTITION factor=32 creates 32 banks each [MAX_BATCH][256] → MAX_BATCH BRAM_18K per bank. With MAX_BATCH=8: 8 × 32 = 256 BRAM_18K for gate_cache alone, exceeding ZU5EV's 288 total. Fix: MAX_BATCH=1.
21. **Sequential inner MACs kill throughput**: Even with II=1 inner loops, the outer row loop is not pipelined if it contains multiple function calls in sequence. 4 decode_mac calls/row × 350 cycles = 1400 cycles/row. Fix: UNROLL the call loop so 4 decode_mac instances run in parallel. Use local accumulator array with ARRAY_PARTITION complete.
22. **100 MHz is not enough to beat CPU**: ZU5EV PL default clock gives ~3.2 GMAC/s with 4× parallel MACs. Cortex-A53 with NEON does ~3–7 GMAC/s for Q4_K. Must run at 300+ MHz to achieve ~4 t/s. Set PL CLK0 in Zynq PS Clock Configuration.

Discovered during MAC parallelization (loop inversion):
23. **UNROLL alone on outer loop does NOT create parallel hardware**: `#pragma HLS UNROLL` on a loop wrapping function calls creates N sequential FSM states (the unrolled instances' lifetimes don't overlap). HLS allocates a shared pool of FP functional units (`grp_fu_*`) → only one MAC instance runs at a time. Observed: mac_blocks_wv at 2611 cycles with 8 "parallel" decode_mac instances still sequential.
24. **Loop inversion forces parallel FP pipelines**: Move the element-dimension loop (256 elements) to outermost with `PIPELINE II=1`, and UNROLL the block-dimension loop (N blocks) inside. All N blocks' MACs now exist in the same pipeline stage → HLS must allocate N independent FP pipelines. Sharing is physically impossible. Result: ~270 cycles/row for 8 blocks vs 2611 cycles sequential.
25. **1D array with block partition fails alias analysis for MAC parallelism**: `array[b*stride + n]` with `#pragma HLS ARRAY_PARTITION block factor=K` relies on HLS proving distinct bank assignments. Non-power-of-2 strides (e.g., b*256) or complex indexing → alias analysis failure → assumed port contention → MAC instances serialized. Fix: explicit 2D/3D layout `array[N_blocks][stride]` with `dim=1 complete`. Each block's bank is trivially distinct.
26. **Partial UNROLL inside PIPELINE II=1 is invalid**: `UNROLL factor=K` on a loop with N iterations (K < N) leaves N/K residual sequential iterations. A loop body with multiple sequential steps cannot achieve II=1. HLS either errors or silently degrades. Fix: explicit outer group loop (N/K groups, sequential) wrapping a fresh `PIPELINE II=1` loop with a fully `UNROLL`ed K-iteration inner loop.
27. **Q4_K_WORDS=9 requires nested loops**: Q4_K block = 144 bytes = 9 × 128-bit words. Using `i/9` or `i%9` in a pipelined flat loop requires hardware integer dividers → II >> 1. Use nested `rb[b][w]` indexing (b=0..N_blocks, w=0..8) with flat AXI address `b * Q4_K_WORDS + w`. HLS handles constant-multiplied linear expressions cleanly without dividers.
28. **Q6K cannot use loop inversion**: Q6K block = 210 bytes = 13.125 × 128-bit words — non-integer stride. Cannot form a clean 2D `rb[32][14]` without padding that breaks byte offsets in decode_mac_q6k. Q6K path retains 1D rb with sequential UNROLL factor=8 (correct, but not loop-inverted; still benefits from DATA_WIDTH=128).

---

## File Map

```
swiglu/
├── swiglu.h                  HLS top-level interface (MAX_BATCH=1)
├── swiglu.cpp                HLS implementation (W4A8 integer datapath; C-sim re-run needed)
├── swiglu_tb.cpp             HLS C-simulation testbench (updated for INT8 x interface)
├── sigmoid_lut.h             LUT header (csim init + synthesis ROM)
├── sigmoid_lut_gen.py        Python script to regenerate sigmoid_lut.h
├── ggml-cpu.c                llama.cpp backend (SwiGLU driver implemented, board validated)
├── pl.dtsi                   Device tree overlay (confirmed correct, no changes needed)
└── docs/
    ├── swiglu_description.md     Detailed implementation description of swiglu.cpp
    ├── swiglu_plan.txt           Complete specification (authoritative)
    ├── parallelization_plan.txt  Performance optimization plan (RC5–RC8 documented)
    ├── swiglu_considerations.txt High-level design rationale
    ├── swiglu_parallelization.txt Parallelization notes
    ├── notes.txt                 linear_projection lessons learned (reference)
    ├── connections&addresses.txt Confirmed Vivado block design connection list + addresses
    ├── quantization.txt          GGUF quantization format details
    ├── quantization_fp32toin8.txt FP32→INT8 quantization notes
    ├── ggml_nibble_fix.txt       GGML Q4_K nibble layout fix notes
    ├── optimization_plan.txt     Optimization plan notes
    ├── beta.txt                  GGUF metadata dump
    ├── output.txt                Board execution log (functional, ~1000ms/layer baseline)
    ├── block_diagram.png         Vivado block design screenshot
    └── LFM2_technical_report.pdf Model architecture reference
```
  
