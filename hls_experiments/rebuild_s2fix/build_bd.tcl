# Recreate the q4k_final block design around the packaged swiglu IP and run
# synthesis + implementation at 250 MHz.
# Wiring: docs/connections.txt. PS settings: April design_1_wrapper.xsa (design_1.hwh),
# with PL0 raised to 250 MHz (pl.dtsi assigned-clock-rates).
# Usage: vivado -mode batch -source build_bd.tcl -tclargs <strategy> <run_name>

set strategy [lindex $argv 0]
set run      [lindex $argv 1]
set part xck26-sfvc784-2LV-c

create_project swg ./proj -part $part -force
catch {set_property board_part [lindex [get_board_parts -quiet *kv260_som*] end] [current_project]}
file mkdir ./ip
if {![file exists ./ip/component.xml]} {
    exec unzip -o xilinx_com_hls_swiglu_164_1.zip -d ./ip
}
set_property ip_repo_paths ./ip [current_project]
update_ip_catalog

create_bd_design design_1

# ── PS ──────────────────────────────────────────────────────────────────────
set ps [create_bd_cell -type ip -vlnv xilinx.com:ip:zynq_ultra_ps_e zynq_ultra_ps_e_0]
source ./ps_params.tcl
if {[catch {set_property -dict $PS_PARAMS $ps} e]} {
    puts "PS dict failed ($e), falling back to per-parameter"
    set nfail 0
    foreach {k v} $PS_PARAMS { if {[catch {set_property $k $v $ps}]} {incr nfail} }
    puts "PS params not applied: $nfail"
}
set_property -dict [list \
    CONFIG.PSU__CRL_APB__PL0_REF_CTRL__SRCSEL {IOPLL} \
    CONFIG.PSU__CRL_APB__PL0_REF_CTRL__FREQMHZ {250} \
    CONFIG.PSU__CRL_APB__PL1_REF_CTRL__FREQMHZ {100} \
    CONFIG.PSU__FPGA_PL0_ENABLE {1} \
    CONFIG.PSU__USE__M_AXI_GP0 {1} CONFIG.PSU__MAXIGP0__DATA_WIDTH {128} \
    CONFIG.PSU__USE__M_AXI_GP1 {0} CONFIG.PSU__USE__M_AXI_GP2 {0} \
    CONFIG.PSU__USE__S_AXI_GP2 {1} CONFIG.PSU__SAXIGP2__DATA_WIDTH {128} \
    CONFIG.PSU__USE__S_AXI_GP3 {1} CONFIG.PSU__SAXIGP3__DATA_WIDTH {128} \
    CONFIG.PSU__USE__S_AXI_GP4 {1} CONFIG.PSU__SAXIGP4__DATA_WIDTH {128} \
    CONFIG.PSU__USE__IRQ0 {1} \
] $ps
puts "PL0 actual MHz: [get_property CONFIG.PSU__CRL_APB__PL0_REF_CTRL__ACT_FREQMHZ $ps]"

# ── IP and interconnect ─────────────────────────────────────────────────────
set swg [create_bd_cell -type ip -vlnv [lindex [get_ipdefs *:hls:swiglu:*] end] swiglu_0]
set rst [create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset rst_ps8_0_250M]
set smc [create_bd_cell -type ip -vlnv xilinx.com:ip:smartconnect axi_smc]
set_property -dict [list CONFIG.NUM_SI {1} CONFIG.NUM_MI {1}] $smc
set sc0 [create_bd_cell -type ip -vlnv xilinx.com:ip:smartconnect smartconnect_0]
set_property -dict [list CONFIG.NUM_SI {3} CONFIG.NUM_MI {1}] $sc0
set sc1 [create_bd_cell -type ip -vlnv xilinx.com:ip:smartconnect smartconnect_1]
set_property -dict [list CONFIG.NUM_SI {1} CONFIG.NUM_MI {1}] $sc1
set sc3 [create_bd_cell -type ip -vlnv xilinx.com:ip:smartconnect smartconnect_3]
set_property -dict [list CONFIG.NUM_SI {1} CONFIG.NUM_MI {1}] $sc3
set cat [create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat xlconcat_0]
set_property -dict [list CONFIG.NUM_PORTS {2}] $cat

connect_bd_intf_net [get_bd_intf_pins zynq_ultra_ps_e_0/M_AXI_HPM0_FPD] [get_bd_intf_pins axi_smc/S00_AXI]
connect_bd_intf_net [get_bd_intf_pins axi_smc/M00_AXI] [get_bd_intf_pins swiglu_0/s_axi_CTRL]
connect_bd_intf_net [get_bd_intf_pins swiglu_0/m_axi_gmem_W]   [get_bd_intf_pins smartconnect_3/S00_AXI]
connect_bd_intf_net [get_bd_intf_pins smartconnect_3/M00_AXI]  [get_bd_intf_pins zynq_ultra_ps_e_0/S_AXI_HP2_FPD]
connect_bd_intf_net [get_bd_intf_pins swiglu_0/m_axi_gmem_Wd]  [get_bd_intf_pins smartconnect_1/S00_AXI]
connect_bd_intf_net [get_bd_intf_pins smartconnect_1/M00_AXI]  [get_bd_intf_pins zynq_ultra_ps_e_0/S_AXI_HP1_FPD]
connect_bd_intf_net [get_bd_intf_pins swiglu_0/m_axi_gmem_V]   [get_bd_intf_pins smartconnect_0/S00_AXI]
connect_bd_intf_net [get_bd_intf_pins swiglu_0/m_axi_gmem_out] [get_bd_intf_pins smartconnect_0/S01_AXI]
connect_bd_intf_net [get_bd_intf_pins swiglu_0/m_axi_gmem_x]   [get_bd_intf_pins smartconnect_0/S02_AXI]
connect_bd_intf_net [get_bd_intf_pins smartconnect_0/M00_AXI]  [get_bd_intf_pins zynq_ultra_ps_e_0/S_AXI_HP0_FPD]

connect_bd_net [get_bd_pins swiglu_0/interrupt] [get_bd_pins xlconcat_0/In0]
connect_bd_net [get_bd_pins xlconcat_0/dout] [get_bd_pins zynq_ultra_ps_e_0/pl_ps_irq0]

set clk [get_bd_pins zynq_ultra_ps_e_0/pl_clk0]
connect_bd_net $clk [get_bd_pins zynq_ultra_ps_e_0/maxihpm0_fpd_aclk] \
    [get_bd_pins zynq_ultra_ps_e_0/saxihp0_fpd_aclk] [get_bd_pins zynq_ultra_ps_e_0/saxihp1_fpd_aclk] \
    [get_bd_pins zynq_ultra_ps_e_0/saxihp2_fpd_aclk] [get_bd_pins rst_ps8_0_250M/slowest_sync_clk] \
    [get_bd_pins swiglu_0/ap_clk] [get_bd_pins axi_smc/aclk] [get_bd_pins smartconnect_0/aclk] \
    [get_bd_pins smartconnect_1/aclk] [get_bd_pins smartconnect_3/aclk]
connect_bd_net [get_bd_pins zynq_ultra_ps_e_0/pl_resetn0] [get_bd_pins rst_ps8_0_250M/ext_reset_in]
connect_bd_net [get_bd_pins rst_ps8_0_250M/peripheral_aresetn] [get_bd_pins swiglu_0/ap_rst_n] \
    [get_bd_pins axi_smc/aresetn] [get_bd_pins smartconnect_0/aresetn] \
    [get_bd_pins smartconnect_1/aresetn] [get_bd_pins smartconnect_3/aresetn]

assign_bd_address
set ctrl [get_bd_addr_segs -of_objects [get_bd_addr_spaces zynq_ultra_ps_e_0/Data] -filter {NAME =~ *swiglu*}]
set_property offset 0xA0000000 $ctrl
set_property range 64K $ctrl
foreach s [get_bd_addr_segs -of_objects [get_bd_addr_spaces swiglu_0/*]] {
    if {[string match *LPS_OCM* $s]} { exclude_bd_addr_seg $s }
}
foreach s [get_bd_addr_segs -excluded -quiet] { puts "excluded: $s" }
foreach s [get_bd_addr_segs] { catch {puts "addr: $s [get_property offset $s] [get_property range $s]"} }

validate_bd_design
save_bd_design
set bd [get_files design_1.bd]
make_wrapper -files $bd -top
add_files -norecurse [glob ./proj/swg.gen/sources_1/bd/design_1/hdl/design_1_wrapper.v]
set_property top design_1_wrapper [current_fileset]

# Docker image: the generated '//Host : ...' header line spans several lines (the OS
# name contains newlines), which breaks design_1.v / design_1_wrapper.v (HDL 9-1206).
# Comment out every header line before `timescale that is not already a comment.
generate_target all $bd
foreach v [split [exec sh -c {grep -rl --include=*.v '^//Host' ./proj/swg.gen/sources_1/bd/design_1 || true}] "\n"] {
    if {$v eq ""} continue
    set f [open $v r]; set lines [split [read $f] "\n"]; close $f
    set out {}; set hdr 1; set n 0
    foreach l $lines {
        if {$hdr && [string match "`timescale*" $l]} { set hdr 0 }
        if {$hdr && $l ne "" && ![string match "//*" $l]} { set l "// $l"; incr n }
        lappend out $l
    }
    set f [open $v w]; puts -nonewline $f [join $out "\n"]; close $f
    puts "header fix: $v ($n lines)"
}

# CLAUDE.md Vivado plan: 0.300 ns setup uncertainty on the PL clock, implementation only.
set xdc ./timing_margin.xdc
set f [open $xdc w]
# The PS8 XDC constrains clk_pl_0 at its IOPLL-derived 4.04 ns; the board runs 250 MHz.
puts $f {create_clock -name clk_pl_0 -period 4.000 [get_pins {design_1_i/zynq_ultra_ps_e_0/inst/PS8_i/PLCLK[0]}]}
puts $f {set_clock_uncertainty -setup 0.300 [get_clocks clk_pl_0]}
close $f
add_files -fileset constrs_1 $xdc
set_property used_in_synthesis false [get_files $xdc]

launch_runs synth_1 -jobs 8
wait_on_run synth_1
if {[get_property PROGRESS [get_runs synth_1]] ne "100%"} { error "synth_1 failed" }
open_run synth_1
report_utilization -file synth_util.txt
close_design

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
