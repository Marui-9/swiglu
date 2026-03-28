set moduleName compute_gate_Pipeline_GATE_PASS1
set isTopModule 0
set isCombinational 0
set isDatapathOnly 0
set isPipelined 1
set isPipelined_legacy 1
set pipeline_type loop_auto_rewind
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set hasInterrupt 0
set DLRegFirstOffset 0
set DLRegItemOffset 0
set svuvm_can_support 1
set cdfgNum 38
set C_modelName {compute_gate_Pipeline_GATE_PASS1}
set C_modelType { void 0 }
set ap_memory_interface_dict [dict create]
dict set ap_memory_interface_dict gate_fp { MEM_WIDTH 32 MEM_SIZE 32768 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 0 }
set C_modelArgList {
	{ X1_cache int 32 regular {fifo 0 volatile }  }
	{ X2_cache int 32 regular {fifo 0 volatile }  }
	{ gate_fp float 32 regular {array 8192 { 0 } 0 1 }  }
	{ max_abs_out float 32 regular {pointer 1}  }
	{ max_abs_2_out float 32 regular {pointer 1}  }
	{ max_abs_4_out float 32 regular {pointer 1}  }
	{ max_abs_6_out float 32 regular {pointer 1}  }
	{ max_abs_8_out float 32 regular {pointer 1}  }
	{ max_abs_10_out float 32 regular {pointer 1}  }
	{ max_abs_12_out float 32 regular {pointer 1}  }
	{ max_abs_14_out float 32 regular {pointer 1}  }
}
set hasAXIMCache 0
set l_AXIML2Cache [list]
set AXIMCacheInstDict [dict create]
set C_modelArgMapList {[ 
	{ "Name" : "X1_cache", "interface" : "fifo", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "X2_cache", "interface" : "fifo", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "gate_fp", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "max_abs_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "max_abs_2_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "max_abs_4_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "max_abs_6_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "max_abs_8_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "max_abs_10_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "max_abs_12_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "max_abs_14_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 45
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ X1_cache_dout sc_in sc_lv 32 signal 0 } 
	{ X1_cache_empty_n sc_in sc_logic 1 signal 0 } 
	{ X1_cache_read sc_out sc_logic 1 signal 0 } 
	{ X1_cache_num_data_valid sc_in sc_lv 5 signal 0 } 
	{ X1_cache_fifo_cap sc_in sc_lv 5 signal 0 } 
	{ X2_cache_dout sc_in sc_lv 32 signal 1 } 
	{ X2_cache_empty_n sc_in sc_logic 1 signal 1 } 
	{ X2_cache_read sc_out sc_logic 1 signal 1 } 
	{ X2_cache_num_data_valid sc_in sc_lv 5 signal 1 } 
	{ X2_cache_fifo_cap sc_in sc_lv 5 signal 1 } 
	{ gate_fp_address0 sc_out sc_lv 13 signal 2 } 
	{ gate_fp_ce0 sc_out sc_logic 1 signal 2 } 
	{ gate_fp_we0 sc_out sc_logic 1 signal 2 } 
	{ gate_fp_d0 sc_out sc_lv 32 signal 2 } 
	{ max_abs_out sc_out sc_lv 32 signal 3 } 
	{ max_abs_out_ap_vld sc_out sc_logic 1 outvld 3 } 
	{ max_abs_2_out sc_out sc_lv 32 signal 4 } 
	{ max_abs_2_out_ap_vld sc_out sc_logic 1 outvld 4 } 
	{ max_abs_4_out sc_out sc_lv 32 signal 5 } 
	{ max_abs_4_out_ap_vld sc_out sc_logic 1 outvld 5 } 
	{ max_abs_6_out sc_out sc_lv 32 signal 6 } 
	{ max_abs_6_out_ap_vld sc_out sc_logic 1 outvld 6 } 
	{ max_abs_8_out sc_out sc_lv 32 signal 7 } 
	{ max_abs_8_out_ap_vld sc_out sc_logic 1 outvld 7 } 
	{ max_abs_10_out sc_out sc_lv 32 signal 8 } 
	{ max_abs_10_out_ap_vld sc_out sc_logic 1 outvld 8 } 
	{ max_abs_12_out sc_out sc_lv 32 signal 9 } 
	{ max_abs_12_out_ap_vld sc_out sc_logic 1 outvld 9 } 
	{ max_abs_14_out sc_out sc_lv 32 signal 10 } 
	{ max_abs_14_out_ap_vld sc_out sc_logic 1 outvld 10 } 
	{ grp_fu_1179_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_1179_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_1179_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_1179_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_247_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_247_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_247_p_opcode sc_out sc_lv 5 signal -1 } 
	{ grp_fu_247_p_dout0 sc_in sc_lv 1 signal -1 } 
	{ grp_fu_247_p_ce sc_out sc_logic 1 signal -1 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "X1_cache_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "X1_cache", "role": "dout" }} , 
 	{ "name": "X1_cache_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "X1_cache", "role": "empty_n" }} , 
 	{ "name": "X1_cache_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "X1_cache", "role": "read" }} , 
 	{ "name": "X1_cache_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "X1_cache", "role": "num_data_valid" }} , 
 	{ "name": "X1_cache_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "X1_cache", "role": "fifo_cap" }} , 
 	{ "name": "X2_cache_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "X2_cache", "role": "dout" }} , 
 	{ "name": "X2_cache_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "X2_cache", "role": "empty_n" }} , 
 	{ "name": "X2_cache_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "X2_cache", "role": "read" }} , 
 	{ "name": "X2_cache_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "X2_cache", "role": "num_data_valid" }} , 
 	{ "name": "X2_cache_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "X2_cache", "role": "fifo_cap" }} , 
 	{ "name": "gate_fp_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "gate_fp", "role": "address0" }} , 
 	{ "name": "gate_fp_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gate_fp", "role": "ce0" }} , 
 	{ "name": "gate_fp_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gate_fp", "role": "we0" }} , 
 	{ "name": "gate_fp_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "gate_fp", "role": "d0" }} , 
 	{ "name": "max_abs_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "max_abs_out", "role": "default" }} , 
 	{ "name": "max_abs_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "max_abs_out", "role": "ap_vld" }} , 
 	{ "name": "max_abs_2_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "max_abs_2_out", "role": "default" }} , 
 	{ "name": "max_abs_2_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "max_abs_2_out", "role": "ap_vld" }} , 
 	{ "name": "max_abs_4_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "max_abs_4_out", "role": "default" }} , 
 	{ "name": "max_abs_4_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "max_abs_4_out", "role": "ap_vld" }} , 
 	{ "name": "max_abs_6_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "max_abs_6_out", "role": "default" }} , 
 	{ "name": "max_abs_6_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "max_abs_6_out", "role": "ap_vld" }} , 
 	{ "name": "max_abs_8_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "max_abs_8_out", "role": "default" }} , 
 	{ "name": "max_abs_8_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "max_abs_8_out", "role": "ap_vld" }} , 
 	{ "name": "max_abs_10_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "max_abs_10_out", "role": "default" }} , 
 	{ "name": "max_abs_10_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "max_abs_10_out", "role": "ap_vld" }} , 
 	{ "name": "max_abs_12_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "max_abs_12_out", "role": "default" }} , 
 	{ "name": "max_abs_12_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "max_abs_12_out", "role": "ap_vld" }} , 
 	{ "name": "max_abs_14_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "max_abs_14_out", "role": "default" }} , 
 	{ "name": "max_abs_14_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "max_abs_14_out", "role": "ap_vld" }} , 
 	{ "name": "grp_fu_1179_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1179_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_1179_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1179_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_1179_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1179_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_1179_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_1179_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_247_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_247_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_247_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_247_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_247_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "grp_fu_247_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_247_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_247_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_247_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_247_p_ce", "role": "default" }}  ]}

set ArgLastReadFirstWriteLatency {
	compute_gate_Pipeline_GATE_PASS1 {
		X1_cache {Type I LastRead 1 FirstWrite -1}
		X2_cache {Type I LastRead 1 FirstWrite -1}
		gate_fp {Type O LastRead -1 FirstWrite 40}
		max_abs_out {Type O LastRead -1 FirstWrite 46}
		max_abs_2_out {Type O LastRead -1 FirstWrite 46}
		max_abs_4_out {Type O LastRead -1 FirstWrite 46}
		max_abs_6_out {Type O LastRead -1 FirstWrite 46}
		max_abs_8_out {Type O LastRead -1 FirstWrite 46}
		max_abs_10_out {Type O LastRead -1 FirstWrite 46}
		max_abs_12_out {Type O LastRead -1 FirstWrite 46}
		max_abs_14_out {Type O LastRead -1 FirstWrite 46}
		sigmoid_lut {Type I LastRead -1 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "8240", "Max" : "8240"}
	, {"Name" : "Interval", "Min" : "8240", "Max" : "8240"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	X1_cache { ap_fifo {  { X1_cache_dout fifo_data_in 0 32 }  { X1_cache_empty_n fifo_status 0 1 }  { X1_cache_read fifo_port_we 1 1 }  { X1_cache_num_data_valid fifo_status_num_data_valid 0 5 }  { X1_cache_fifo_cap fifo_update 0 5 } } }
	X2_cache { ap_fifo {  { X2_cache_dout fifo_data_in 0 32 }  { X2_cache_empty_n fifo_status 0 1 }  { X2_cache_read fifo_port_we 1 1 }  { X2_cache_num_data_valid fifo_status_num_data_valid 0 5 }  { X2_cache_fifo_cap fifo_update 0 5 } } }
	gate_fp { ap_memory {  { gate_fp_address0 mem_address 1 13 }  { gate_fp_ce0 mem_ce 1 1 }  { gate_fp_we0 mem_we 1 1 }  { gate_fp_d0 mem_din 1 32 } } }
	max_abs_out { ap_vld {  { max_abs_out out_data 1 32 }  { max_abs_out_ap_vld out_vld 1 1 } } }
	max_abs_2_out { ap_vld {  { max_abs_2_out out_data 1 32 }  { max_abs_2_out_ap_vld out_vld 1 1 } } }
	max_abs_4_out { ap_vld {  { max_abs_4_out out_data 1 32 }  { max_abs_4_out_ap_vld out_vld 1 1 } } }
	max_abs_6_out { ap_vld {  { max_abs_6_out out_data 1 32 }  { max_abs_6_out_ap_vld out_vld 1 1 } } }
	max_abs_8_out { ap_vld {  { max_abs_8_out out_data 1 32 }  { max_abs_8_out_ap_vld out_vld 1 1 } } }
	max_abs_10_out { ap_vld {  { max_abs_10_out out_data 1 32 }  { max_abs_10_out_ap_vld out_vld 1 1 } } }
	max_abs_12_out { ap_vld {  { max_abs_12_out out_data 1 32 }  { max_abs_12_out_ap_vld out_vld 1 1 } } }
	max_abs_14_out { ap_vld {  { max_abs_14_out out_data 1 32 }  { max_abs_14_out_ap_vld out_vld 1 1 } } }
}
