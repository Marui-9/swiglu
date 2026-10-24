# rebuild + INT16 X1/X2: Vivado implementation (2026-10-23)

Source: `swiglu.cpp` on branch `rebuild`, with X1/X2 widened to INT16 over a fixed ±32 range
(uncommitted when this was built). Tools: Vitis HLS and Vivado **2025.2**. q4k_final and
the rebuild csynth in `swiglu/reports/` were built with 2025.1.

## Files

| File | What |
|---|---|
| `csim.log` | C-sim of the INT16 version: mock token and T1-T4 PASS |
| `csynth.rpt` | csynth of the INT16 version |
| `csynth_base_2025.2.rpt` | csynth of the INT8 sources at HEAD, rebuilt with 2025.2. Latency 2,011,996 and LUT 145,719 match the 2025.1 `hls_compile.rpt` |
| `utilization.txt`, `utilization_hier.txt` | routed utilization (post-route phys_opt) |
| `timing_impl_4.04ns_margin0.3.txt` | timing as implemented: the clock was 4.04 ns plus 0.300 ns setup uncertainty (see below) |
| `timing_4.000ns.txt` | the same routed netlist re-timed at 4.000 ns (250 MHz) with no extra uncertainty |
| `timing_4.000ns_margin0.3.txt` | the same netlist at 4.000 ns plus 0.300 ns setup uncertainty |
| `build_bd.tcl`, `ps_params.tcl` | build script: block design, synthesis, implementation. Wiring follows `docs/connections.txt`. The PS parameters come from the April `design_1_wrapper.xsa` (`design_1.hwh`), with PL0 set to 250 MHz |
| `resume_impl.tcl` | the implementation run actually used, restarted after a host reboot |
| `retime.tcl` | the re-timing script |
| `timing_margin.xdc` | implementation-only constraints (fixed version, see below) |
| `design_1_wrapper.bit` | bitstream, md5 c755873da83305d7574c778d623a8db7 |
| `design_1_wrapper.bit.bin`, `bit.bif` | the bitstream for `xmutil`, from `bootgen -image bit.bif -arch zynqmp -process_bitstream bin` (2025.2); md5 f5bdf653b9861b0c79298613330a0fe7. On the board it is installed as the app `swiglu-x16` (`/lib/firmware/xilinx/swiglu-x16/`, with kria-accel's `design_1_wrapper.dtbo` and `shell.json`) |

## Clock

- The PS8 derives PL0 from IOPLL and reaches 247.5 MHz, not 250. Its IP XDC therefore
  creates `clk_pl_0` at 4.04 ns. The board sets 250 MHz through `pl.dtsi`.
- The 4.000 ns `create_clock` override in `timing_margin.xdc` matched no pin in the run
  (`get_pins -hierarchical {*/PS8_i/PLCLK[0]}`, Vivado 12-508). Implementation therefore
  ran at 4.04 ns plus 0.300 ns of setup uncertainty. The file has since been fixed to use
  the full pin path.
- `retime.tcl` applies the 4.000 ns clock to the routed checkpoint
  (`design_1_wrapper_postroute_physopt.dcp`).

## Results

| Analysis | WNS | TNS | WHS | Failing endpoints |
|---|---|---|---|---|
| 4.000 ns, no extra uncertainty | **+0.248 ns** | 0.000 | +0.003 ns | 0 |
| 4.000 ns + 0.300 ns setup uncertainty | −0.052 ns | −10.930 ns | +0.003 ns | 423 |
| 4.04 ns + 0.300 ns (as implemented) | −0.012 ns | −0.480 ns | +0.003 ns | |

- The worst setup path at 4.000 ns is inside the down MAC (`mac_muladd_12s_8s_32s_32_4_1`
  DSP, `MAC_GRP`). It has 4 logic levels and a 3.622 ns data path.
- **Routed utilization:**
  - Total: LUT 99,151 (84.66 %), FF 139,945 (59.74 %), BRAM tile 52.5, URAM 8, DSP 238.
  - swiglu_0 alone: LUT 94,798.
- **Comparison with q4k_final** (`hls_experiments/q4k_final/`):
  - q4k_final: LUT 101,639 (86.78 %), BRAM36 46.5, DSP 254.
  - q4k_final timing: WNS −0.023 ns at 4.000 ns.

## On the board

Measured 2026-10-23: `scripts/results/rebuild_x16_20261023/` (accuracy) and its `bench/`
(throughput).
- Mean KLD vs CPU is 0.030154; it was 0.384800 with q4k_final.
- PPL(HW)/PPL(CPU) is 1.034376 ± 0.011605.
- Decode is 2.98 t/s at T3. The best CPU-only run on the same GGUF is 2.65 t/s (T4).
- FPGA time is 11.34 ms per call (derived from 181.5 ms per 16 calls), 1.41× csynth.
- **Superseded by `../rebuild_s2fix/`** (2026-10-24). The 1.41× came from HLS serializing
  load and MAC in compute_X1/X2; the STABLE fix there runs at 8.09 ms per call and 3.53 t/s
  at T3, with the same KLD (`scripts/results/rebuild_s2fix_final_20261024/`).

## Build notes

- **Broken generated Verilog headers.** In the Docker image, the generated Verilog header
  line `//Host : ...` spans three lines (the OS name contains newlines). That broke
  `design_1.v` and `design_1_wrapper.v` (HDL 9-1206). The stray lines were commented out
  after `generate_target` and before synth_1 ran.
- **Host reboot.** The first implementation was interrupted by a host reboot during
  placement. `resume_impl.tcl` reran impl_1 from the same synth_1 checkpoint, with the
  `Performance_ExplorePostRoutePhysOpt` strategy.
