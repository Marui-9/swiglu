# Board runs PL0 at 250 MHz (pl.dtsi); the PS8 IP constrains its IOPLL-derived 247.5 MHz
# (4.04 ns). Override to exactly 4.000 ns, plus the CLAUDE.md 0.300 ns setup margin.
create_clock -name clk_pl_0 -period 4.000 [get_pins {design_1_i/zynq_ultra_ps_e_0/inst/PS8_i/PLCLK[0]}]
set_clock_uncertainty -setup 0.300 [get_clocks clk_pl_0]
