# rebuild_x16 + Stage 2 overlap fix (2026-10-24)

Source: `swiglu.cpp` on branch `rebuild` (uncommitted when this was built, md5
afd20e8c52fcd338cb53d754b2951b0b): rebuild_x16 (INT16 ±32 X1/X2) plus the Stage 2 fix
below. Tools: Vitis HLS and Vivado **2025.2** (Docker), as for `../rebuild_x16/`.

## What was wrong

The board ran each IP call 1.41× slower than the csynth latency (rebuild_x16: 11.34 ms
vs 8.05 ms). q4k_final's ratio was 1.10.

The board's APM traces put all of the excess in Stage 2:
- Stage 2 (compute_X1 ∥ X2) took 6.102 ms, which is 745 cy/iteration over 2,048
  iterations (derived). csynth's interval is 348.
- Stage 5 took 5.064 ms, 1,236 cy/iteration, matching csynth's 1,249.

The cosim harness (`cosim_harness/`) reproduces this:
- **Before the fix** (`profile_base.txt`): in each loop-body DATAFLOW iteration of
  COMPUTE_X1, the load (`load_4rows_wv_urm`) runs at cy 236-637, then the MAC
  (`mac_quant_wv`) at 638-981, and only then does the next load start, at 982.
  - The iteration interval is 746 cy: load 401 cy plus MAC 343 cy, not overlapped.
  - csynth of the same code still reports an interval of 348.
- **Cause:** HLS synchronizes each body instance on the caller variables it touches: W,
  x_local_1, x_scale and X1_cache.
  - Stage 5's DOWN_Q4K has the same structure, and there HLS infers `stable` for its
    inputs.
  - DOWN_Q4K also writes a local `out_local`, not a caller array.

## The fix (`swiglu.cpp`, compute_X1 and compute_X2)

- `#pragma HLS STABLE` on W (V in compute_X2), x_local_1 (x_local_2) and x_scale, inside
  the loop body.
- The MAC writes a local `int16_t X1_loc[FFN_DIM]` (`X2_loc`; `ram_1p` BRAM).
  - After the loop, COPY_X1 / COPY_X2 (II=1, 8,192 cy) copy it to X1_cache / X2_cache.
- STABLE on X1_cache itself is wrong. It overlaps, but in cosim 16 of 256 outputs mismatch
  (stale values). That variant was not kept.

**Cosim after the fix** (`profile_fix.txt`):
- The loads start every 327-345 cy and overlap the previous MAC.
- The MACs run back to back (642-985, 986-1329, ...), so the interval is 344.
- compute_X1 goes from 23,871 to 11,545 cy for 32 iterations.
- Both versions match the same golden output (0 mismatches of 256).

## Files

| File | What |
|---|---|
| `csim.log` | full-design C-sim: mock token max abs err 0, T1-T4 PASS |
| `csynth.rpt` | csynth of the fixed source |
| `synth_util.txt` | post-synthesis utilization |
| `utilization.txt`, `utilization_hier.txt` | routed utilization (post-route phys_opt) |
| `clocks.txt` | clocks of the routed design: clk_pl_0 is 4.000 ns |
| `timing_impl_4.000ns_margin0.3.txt` | timing as implemented: 4.000 ns plus 0.300 ns setup uncertainty |
| `timing_4.000ns.txt`, `timing_4.000ns_margin0.3.txt` | `retime.tcl` on the routed checkpoint, without and with the 0.300 ns |
| `build_bd.tcl`, `ps_params.tcl`, `timing_margin.xdc` | build script, from `../rebuild_x16/` with two changes, below |
| `retime.tcl` | the re-timing script |
| `design_1_wrapper.bit` | bitstream, md5 4d1c97092552bbeeaf24c819df11055d |
| `design_1_wrapper.bit.bin`, `bit.bif` | the bitstream for `xmutil` (`bootgen ... -process_bitstream bin`); md5 c0ba663515b206bb29b32c9c116f96a8. On the board it is the app `swiglu-s2fix` (`/lib/firmware/xilinx/swiglu-s2fix/`, with the dtbo and `shell.json` of `swiglu-x16`) |
| `cosim_harness/` | Stage 2 cosim harness, see below |

**Changes to `build_bd.tcl` from rebuild_x16:**
- It comments out the broken Docker `//Host :` header lines itself, after
  `generate_target`. rebuild_x16 did this by hand.
- It writes the 4.000 ns `create_clock`, with the full PLCLK[0] pin path, into
  `timing_margin.xdc`. So implementation ran at 4.000 ns plus 0.300 ns. rebuild_x16 ran
  at 4.04 ns plus 0.300 ns, because its override matched no pin.

## csynth (`csynth.rpt` vs `../rebuild_x16/csynth.rpt`)

| | rebuild_x16 | s2fix |
|---|---|---|
| Latency | 2,011,996 cy | 2,020,192 cy (8.08 ms @ 250 MHz) |
| Interval | 1,282,063 | 1,282,063 |
| compute_X1 / X2 | 713,107 | 721,303 (713,107 loop + 8,193 copy) |
| BRAM_18K | 166 | 182 |
| DSP | 238 | 238 |
| LUT estimate | 145,719 | 146,123 |

csynth's latency barely changes: it already assumed the overlap that the hardware was not
doing.

## Implementation

| Routed | rebuild_x16 | s2fix |
|---|---|---|
| LUT | 99,151 (84.66 %) | 101,522 (86.68 %) |
| FF | 139,945 | 140,950 |
| BRAM tile | 52.5 | 60.5 |
| URAM / DSP | 8 / 238 | 8 / 238 |
| swiglu_0 LUT (`utilization_hier.txt`) | 94,798 | 97,172 |

| Timing, routed checkpoint | WNS | TNS | WHS |
|---|---|---|---|
| 4.000 ns, no extra uncertainty | **+0.145 ns** | 0.000 | +0.010 ns |
| 4.000 ns + 0.300 ns (as implemented) | −0.155 ns | −28.913 ns (408 endpoints) | +0.010 ns |

- The worst setup path at 4.000 ns is still in the Stage 5 down MAC
  (`mac_muladd_8s_8s_32s_32_4_1`, `MAC_GRP`). It has 5 logic levels and a 3.724 ns data
  path.
- rebuild_x16 closed at +0.248 ns at 4.000 ns, but it was implemented against a different
  clock constraint (above), so the two WNS values do not isolate the cost of the fix.

## Cosim harness (`cosim_harness/`)

- **Design:** `x1top.cpp` runs load_x_local → compute_X1 → compute_X2 → store_X, with the
  2,048-iteration loops cut to 32 (`X12_ROWS` 128).
- **Stage 2 sources:** `swiglu_cut_base.cpp` and `swiglu_cut_fix.cpp` are `swiglu.cpp`
  before and after the fix, with `FFN_DIM` replaced by `X12_ROWS` in the Stage 2 loop
  bounds. The fix version lacks the long STABLE comment; otherwise it is the shipped
  code.
  - Copy one of them to `swiglu_cut.cpp` to build.
- **Testbench:** `x1tb.cpp` uses random W/V/x with d = dmin = 2^-12. It writes
  `golden.bin` on the first run and compares against it on later runs.
- **Config and profiling:**
  - `hls_config.cfg` enables `cosim.enable_dataflow_profiling` and
    `cosim.trace_level=port`.
  - `df_profile.py <comp>/hls/sim/verilog` prints per-process start/end times.
    `profile_*.txt` is its output.
- **Totals:** `cosim_base.rpt` 43,540 cy, `cosim_fix.rpt` 31,214 cy.
  - store_X takes 19,462 cy in both. That is an artifact of the harness's
    single-outstanding write port.
- **Run** in the `vivado-2025.2-hls` image:
  ```
  v++ -c --mode hls --config ./hls_config.cfg --work_dir comp
  vitis-run --mode hls --cosim --config ./hls_config.cfg --work_dir comp
  ```

## On the board

See `scripts/results/rebuild_s2fix_final_20261024/`.
