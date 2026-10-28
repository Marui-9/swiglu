# Re-run implementation only (synth_1 complete) after the host reboot.
# Usage: vivado -mode batch -source resume_impl.tcl -tclargs <strategy> <run_name>
set strategy [lindex $argv 0]
set run      [lindex $argv 1]
open_project ./proj/swg.xpr
puts "synth_1: [get_property STATUS [get_runs synth_1]] needs_refresh=[get_property NEEDS_REFRESH [get_runs synth_1]]"
catch {set_property NEEDS_REFRESH false [get_runs synth_1]}
reset_run impl_1
set_property strategy $strategy [get_runs impl_1]
set_property STEPS.PHYS_OPT_DESIGN.IS_ENABLED true [get_runs impl_1]
set_property STEPS.POST_ROUTE_PHYS_OPT_DESIGN.IS_ENABLED true [get_runs impl_1]
launch_runs impl_1 -to_step write_bitstream -jobs 8
wait_on_run impl_1
open_run impl_1
report_clocks -file ${run}_clocks.txt
report_timing_summary -max_paths 10 -file ${run}_timing.txt
report_utilization -file ${run}_util.txt
report_utilization -hierarchical -hierarchical_depth 3 -file ${run}_util_hier.txt
puts "DONE WNS=[get_property STATS.WNS [get_runs impl_1]] TNS=[get_property STATS.TNS [get_runs impl_1]] WHS=[get_property STATS.WHS [get_runs impl_1]]"
