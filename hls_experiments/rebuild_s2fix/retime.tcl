open_checkpoint ./proj/swg.runs/impl_1/design_1_wrapper_postroute_physopt.dcp
create_clock -name clk_pl_0 -period 4.000 [get_pins {design_1_i/zynq_ultra_ps_e_0/inst/PS8_i/PLCLK[0]}]
report_clocks -file retime_clocks.txt
set_clock_uncertainty -setup 0.300 [get_clocks clk_pl_0]
report_timing_summary -max_paths 10 -file s2fix_timing_4ns_margin.txt
puts "4NS_MARGIN WNS=[get_property SLACK [get_timing_paths -setup -max_paths 1]]"
set_clock_uncertainty -setup 0.0 [get_clocks clk_pl_0]
report_timing_summary -max_paths 10 -file s2fix_timing_4ns.txt
puts "4NS WNS=[get_property SLACK [get_timing_paths -setup -max_paths 1]] WHS=[get_property SLACK [get_timing_paths -hold -max_paths 1]]"
