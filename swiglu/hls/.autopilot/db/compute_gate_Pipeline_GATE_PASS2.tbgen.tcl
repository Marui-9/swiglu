set moduleName compute_gate_Pipeline_GATE_PASS2
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
set cdfgNum 36
set C_modelName {compute_gate_Pipeline_GATE_PASS2}
set C_modelType { void 0 }
set ap_memory_interface_dict [dict create]
dict set ap_memory_interface_dict gate_cache_7 { MEM_WIDTH 8 MEM_SIZE 1024 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 0 }
dict set ap_memory_interface_dict gate_cache_6 { MEM_WIDTH 8 MEM_SIZE 1024 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 0 }
dict set ap_memory_interface_dict gate_cache_5 { MEM_WIDTH 8 MEM_SIZE 1024 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 0 }
dict set ap_memory_interface_dict gate_cache_4 { MEM_WIDTH 8 MEM_SIZE 1024 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 0 }
dict set ap_memory_interface_dict gate_cache_3 { MEM_WIDTH 8 MEM_SIZE 1024 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 0 }
dict set ap_memory_interface_dict gate_cache_2 { MEM_WIDTH 8 MEM_SIZE 1024 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 0 }
dict set ap_memory_interface_dict gate_cache_1 { MEM_WIDTH 8 MEM_SIZE 1024 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 0 }
dict set ap_memory_interface_dict gate_cache_0 { MEM_WIDTH 8 MEM_SIZE 1024 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 0 }
dict set ap_memory_interface_dict gate_fp { MEM_WIDTH 32 MEM_SIZE 32768 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
set C_modelArgList {
	{ gate_cache_7 int 8 regular {array 1024 { 3 0 } 0 1 }  }
	{ gate_cache_6 int 8 regular {array 1024 { 3 0 } 0 1 }  }
	{ gate_cache_5 int 8 regular {array 1024 { 3 0 } 0 1 }  }
	{ gate_cache_4 int 8 regular {array 1024 { 3 0 } 0 1 }  }
	{ gate_cache_3 int 8 regular {array 1024 { 3 0 } 0 1 }  }
	{ gate_cache_2 int 8 regular {array 1024 { 3 0 } 0 1 }  }
	{ gate_cache_1 int 8 regular {array 1024 { 3 0 } 0 1 }  }
	{ gate_cache_0 int 8 regular {array 1024 { 3 0 } 0 1 }  }
	{ gate_fp float 32 regular {array 8192 { 1 3 } 1 1 }  }
	{ inv_gs float 32 regular  }
}
set hasAXIMCache 0
set l_AXIML2Cache [list]
set AXIMCacheInstDict [dict create]
set C_modelArgMapList {[ 
	{ "Name" : "gate_cache_7", "interface" : "memory", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "gate_cache_6", "interface" : "memory", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "gate_cache_5", "interface" : "memory", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "gate_cache_4", "interface" : "memory", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "gate_cache_3", "interface" : "memory", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "gate_cache_2", "interface" : "memory", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "gate_cache_1", "interface" : "memory", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "gate_cache_0", "interface" : "memory", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "gate_fp", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "inv_gs", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} ]}
# RTL Port declarations: 
set portNum 46
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ gate_cache_7_address1 sc_out sc_lv 10 signal 0 } 
	{ gate_cache_7_ce1 sc_out sc_logic 1 signal 0 } 
	{ gate_cache_7_we1 sc_out sc_logic 1 signal 0 } 
	{ gate_cache_7_d1 sc_out sc_lv 8 signal 0 } 
	{ gate_cache_6_address1 sc_out sc_lv 10 signal 1 } 
	{ gate_cache_6_ce1 sc_out sc_logic 1 signal 1 } 
	{ gate_cache_6_we1 sc_out sc_logic 1 signal 1 } 
	{ gate_cache_6_d1 sc_out sc_lv 8 signal 1 } 
	{ gate_cache_5_address1 sc_out sc_lv 10 signal 2 } 
	{ gate_cache_5_ce1 sc_out sc_logic 1 signal 2 } 
	{ gate_cache_5_we1 sc_out sc_logic 1 signal 2 } 
	{ gate_cache_5_d1 sc_out sc_lv 8 signal 2 } 
	{ gate_cache_4_address1 sc_out sc_lv 10 signal 3 } 
	{ gate_cache_4_ce1 sc_out sc_logic 1 signal 3 } 
	{ gate_cache_4_we1 sc_out sc_logic 1 signal 3 } 
	{ gate_cache_4_d1 sc_out sc_lv 8 signal 3 } 
	{ gate_cache_3_address1 sc_out sc_lv 10 signal 4 } 
	{ gate_cache_3_ce1 sc_out sc_logic 1 signal 4 } 
	{ gate_cache_3_we1 sc_out sc_logic 1 signal 4 } 
	{ gate_cache_3_d1 sc_out sc_lv 8 signal 4 } 
	{ gate_cache_2_address1 sc_out sc_lv 10 signal 5 } 
	{ gate_cache_2_ce1 sc_out sc_logic 1 signal 5 } 
	{ gate_cache_2_we1 sc_out sc_logic 1 signal 5 } 
	{ gate_cache_2_d1 sc_out sc_lv 8 signal 5 } 
	{ gate_cache_1_address1 sc_out sc_lv 10 signal 6 } 
	{ gate_cache_1_ce1 sc_out sc_logic 1 signal 6 } 
	{ gate_cache_1_we1 sc_out sc_logic 1 signal 6 } 
	{ gate_cache_1_d1 sc_out sc_lv 8 signal 6 } 
	{ gate_cache_0_address1 sc_out sc_lv 10 signal 7 } 
	{ gate_cache_0_ce1 sc_out sc_logic 1 signal 7 } 
	{ gate_cache_0_we1 sc_out sc_logic 1 signal 7 } 
	{ gate_cache_0_d1 sc_out sc_lv 8 signal 7 } 
	{ gate_fp_address0 sc_out sc_lv 13 signal 8 } 
	{ gate_fp_ce0 sc_out sc_logic 1 signal 8 } 
	{ gate_fp_q0 sc_in sc_lv 32 signal 8 } 
	{ inv_gs sc_in sc_lv 32 signal 9 } 
	{ grp_fu_1073_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_1073_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_1073_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_1073_p_ce sc_out sc_logic 1 signal -1 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "gate_cache_7_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "gate_cache_7", "role": "address1" }} , 
 	{ "name": "gate_cache_7_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gate_cache_7", "role": "ce1" }} , 
 	{ "name": "gate_cache_7_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gate_cache_7", "role": "we1" }} , 
 	{ "name": "gate_cache_7_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "gate_cache_7", "role": "d1" }} , 
 	{ "name": "gate_cache_6_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "gate_cache_6", "role": "address1" }} , 
 	{ "name": "gate_cache_6_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gate_cache_6", "role": "ce1" }} , 
 	{ "name": "gate_cache_6_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gate_cache_6", "role": "we1" }} , 
 	{ "name": "gate_cache_6_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "gate_cache_6", "role": "d1" }} , 
 	{ "name": "gate_cache_5_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "gate_cache_5", "role": "address1" }} , 
 	{ "name": "gate_cache_5_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gate_cache_5", "role": "ce1" }} , 
 	{ "name": "gate_cache_5_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gate_cache_5", "role": "we1" }} , 
 	{ "name": "gate_cache_5_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "gate_cache_5", "role": "d1" }} , 
 	{ "name": "gate_cache_4_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "gate_cache_4", "role": "address1" }} , 
 	{ "name": "gate_cache_4_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gate_cache_4", "role": "ce1" }} , 
 	{ "name": "gate_cache_4_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gate_cache_4", "role": "we1" }} , 
 	{ "name": "gate_cache_4_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "gate_cache_4", "role": "d1" }} , 
 	{ "name": "gate_cache_3_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "gate_cache_3", "role": "address1" }} , 
 	{ "name": "gate_cache_3_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gate_cache_3", "role": "ce1" }} , 
 	{ "name": "gate_cache_3_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gate_cache_3", "role": "we1" }} , 
 	{ "name": "gate_cache_3_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "gate_cache_3", "role": "d1" }} , 
 	{ "name": "gate_cache_2_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "gate_cache_2", "role": "address1" }} , 
 	{ "name": "gate_cache_2_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gate_cache_2", "role": "ce1" }} , 
 	{ "name": "gate_cache_2_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gate_cache_2", "role": "we1" }} , 
 	{ "name": "gate_cache_2_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "gate_cache_2", "role": "d1" }} , 
 	{ "name": "gate_cache_1_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "gate_cache_1", "role": "address1" }} , 
 	{ "name": "gate_cache_1_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gate_cache_1", "role": "ce1" }} , 
 	{ "name": "gate_cache_1_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gate_cache_1", "role": "we1" }} , 
 	{ "name": "gate_cache_1_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "gate_cache_1", "role": "d1" }} , 
 	{ "name": "gate_cache_0_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "gate_cache_0", "role": "address1" }} , 
 	{ "name": "gate_cache_0_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gate_cache_0", "role": "ce1" }} , 
 	{ "name": "gate_cache_0_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gate_cache_0", "role": "we1" }} , 
 	{ "name": "gate_cache_0_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "gate_cache_0", "role": "d1" }} , 
 	{ "name": "gate_fp_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "gate_fp", "role": "address0" }} , 
 	{ "name": "gate_fp_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gate_fp", "role": "ce0" }} , 
 	{ "name": "gate_fp_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "gate_fp", "role": "q0" }} , 
 	{ "name": "inv_gs", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "inv_gs", "role": "default" }} , 
 	{ "name": "grp_fu_1073_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1073_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_1073_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1073_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_1073_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1073_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_1073_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_1073_p_ce", "role": "default" }}  ]}

set ArgLastReadFirstWriteLatency {
	compute_gate_Pipeline_GATE_PASS2 {
		gate_cache_7 {Type O LastRead -1 FirstWrite 13}
		gate_cache_6 {Type O LastRead -1 FirstWrite 13}
		gate_cache_5 {Type O LastRead -1 FirstWrite 13}
		gate_cache_4 {Type O LastRead -1 FirstWrite 13}
		gate_cache_3 {Type O LastRead -1 FirstWrite 13}
		gate_cache_2 {Type O LastRead -1 FirstWrite 13}
		gate_cache_1 {Type O LastRead -1 FirstWrite 13}
		gate_cache_0 {Type O LastRead -1 FirstWrite 13}
		gate_fp {Type I LastRead 0 FirstWrite -1}
		inv_gs {Type I LastRead 0 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "8206", "Max" : "8206"}
	, {"Name" : "Interval", "Min" : "8206", "Max" : "8206"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	gate_cache_7 { ap_memory {  { gate_cache_7_address1 MemPortADDR2 1 10 }  { gate_cache_7_ce1 MemPortCE2 1 1 }  { gate_cache_7_we1 MemPortWE2 1 1 }  { gate_cache_7_d1 MemPortDIN2 1 8 } } }
	gate_cache_6 { ap_memory {  { gate_cache_6_address1 MemPortADDR2 1 10 }  { gate_cache_6_ce1 MemPortCE2 1 1 }  { gate_cache_6_we1 MemPortWE2 1 1 }  { gate_cache_6_d1 MemPortDIN2 1 8 } } }
	gate_cache_5 { ap_memory {  { gate_cache_5_address1 MemPortADDR2 1 10 }  { gate_cache_5_ce1 MemPortCE2 1 1 }  { gate_cache_5_we1 MemPortWE2 1 1 }  { gate_cache_5_d1 MemPortDIN2 1 8 } } }
	gate_cache_4 { ap_memory {  { gate_cache_4_address1 MemPortADDR2 1 10 }  { gate_cache_4_ce1 MemPortCE2 1 1 }  { gate_cache_4_we1 MemPortWE2 1 1 }  { gate_cache_4_d1 MemPortDIN2 1 8 } } }
	gate_cache_3 { ap_memory {  { gate_cache_3_address1 MemPortADDR2 1 10 }  { gate_cache_3_ce1 MemPortCE2 1 1 }  { gate_cache_3_we1 MemPortWE2 1 1 }  { gate_cache_3_d1 MemPortDIN2 1 8 } } }
	gate_cache_2 { ap_memory {  { gate_cache_2_address1 MemPortADDR2 1 10 }  { gate_cache_2_ce1 MemPortCE2 1 1 }  { gate_cache_2_we1 MemPortWE2 1 1 }  { gate_cache_2_d1 MemPortDIN2 1 8 } } }
	gate_cache_1 { ap_memory {  { gate_cache_1_address1 MemPortADDR2 1 10 }  { gate_cache_1_ce1 MemPortCE2 1 1 }  { gate_cache_1_we1 MemPortWE2 1 1 }  { gate_cache_1_d1 MemPortDIN2 1 8 } } }
	gate_cache_0 { ap_memory {  { gate_cache_0_address1 MemPortADDR2 1 10 }  { gate_cache_0_ce1 MemPortCE2 1 1 }  { gate_cache_0_we1 MemPortWE2 1 1 }  { gate_cache_0_d1 MemPortDIN2 1 8 } } }
	gate_fp { ap_memory {  { gate_fp_address0 mem_address 1 13 }  { gate_fp_ce0 mem_ce 1 1 }  { gate_fp_q0 mem_dout 0 32 } } }
	inv_gs { ap_none {  { inv_gs in_data 0 32 } } }
}
