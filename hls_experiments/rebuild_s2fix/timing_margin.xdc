create_clock -name clk_pl_0 -period 4.000 [get_pins {design_1_i/zynq_ultra_ps_e_0/inst/PS8_i/PLCLK[0]}]
set_clock_uncertainty -setup 0.300 [get_clocks clk_pl_0]
