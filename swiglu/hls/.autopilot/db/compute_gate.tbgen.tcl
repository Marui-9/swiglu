set moduleName compute_gate
set isTopModule 0
set isCombinational 0
set isDatapathOnly 0
set isPipelined 0
set isPipelined_legacy 0
set pipeline_type none
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set hasInterrupt 0
set DLRegFirstOffset 0
set DLRegItemOffset 0
set svuvm_can_support 1
set cdfgNum 39
set C_modelName {compute_gate}
set C_modelType { float 32 }
set ap_memory_interface_dict [dict create]
dict set ap_memory_interface_dict X1_cache { MEM_WIDTH 8 MEM_SIZE 8192 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict X2_cache { MEM_WIDTH 8 MEM_SIZE 8192 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict gate_cache_0 { MEM_WIDTH 8 MEM_SIZE 1024 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict gate_cache_1 { MEM_WIDTH 8 MEM_SIZE 1024 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict gate_cache_2 { MEM_WIDTH 8 MEM_SIZE 1024 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict gate_cache_3 { MEM_WIDTH 8 MEM_SIZE 1024 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict gate_cache_4 { MEM_WIDTH 8 MEM_SIZE 1024 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict gate_cache_5 { MEM_WIDTH 8 MEM_SIZE 1024 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict gate_cache_6 { MEM_WIDTH 8 MEM_SIZE 1024 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict gate_cache_7 { MEM_WIDTH 8 MEM_SIZE 1024 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
set C_modelArgList {
	{ X1_cache int 8 regular {array 8192 { 1 3 } 1 1 }  }
	{ X2_cache int 8 regular {array 8192 { 1 3 } 1 1 }  }
	{ gate_cache_0 int 8 regular {array 1024 { 0 } 0 1 }  }
	{ gate_cache_1 int 8 regular {array 1024 { 0 } 0 1 }  }
	{ gate_cache_2 int 8 regular {array 1024 { 0 } 0 1 }  }
	{ gate_cache_3 int 8 regular {array 1024 { 0 } 0 1 }  }
	{ gate_cache_4 int 8 regular {array 1024 { 0 } 0 1 }  }
	{ gate_cache_5 int 8 regular {array 1024 { 0 } 0 1 }  }
	{ gate_cache_6 int 8 regular {array 1024 { 0 } 0 1 }  }
	{ gate_cache_7 int 8 regular {array 1024 { 0 } 0 1 }  }
}
set hasAXIMCache 0
set l_AXIML2Cache [list]
set AXIMCacheInstDict [dict create]
set C_modelArgMapList {[ 
	{ "Name" : "X1_cache", "interface" : "memory", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "X2_cache", "interface" : "memory", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "gate_cache_0", "interface" : "memory", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "gate_cache_1", "interface" : "memory", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "gate_cache_2", "interface" : "memory", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "gate_cache_3", "interface" : "memory", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "gate_cache_4", "interface" : "memory", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "gate_cache_5", "interface" : "memory", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "gate_cache_6", "interface" : "memory", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "gate_cache_7", "interface" : "memory", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "ap_return", "interface" : "wire", "bitwidth" : 32} ]}
# RTL Port declarations: 
set portNum 46
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_continue sc_in sc_logic 1 continue -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ X1_cache_address0 sc_out sc_lv 13 signal 0 } 
	{ X1_cache_ce0 sc_out sc_logic 1 signal 0 } 
	{ X1_cache_q0 sc_in sc_lv 8 signal 0 } 
	{ X2_cache_address0 sc_out sc_lv 13 signal 1 } 
	{ X2_cache_ce0 sc_out sc_logic 1 signal 1 } 
	{ X2_cache_q0 sc_in sc_lv 8 signal 1 } 
	{ gate_cache_0_address0 sc_out sc_lv 10 signal 2 } 
	{ gate_cache_0_ce0 sc_out sc_logic 1 signal 2 } 
	{ gate_cache_0_we0 sc_out sc_logic 1 signal 2 } 
	{ gate_cache_0_d0 sc_out sc_lv 8 signal 2 } 
	{ gate_cache_1_address0 sc_out sc_lv 10 signal 3 } 
	{ gate_cache_1_ce0 sc_out sc_logic 1 signal 3 } 
	{ gate_cache_1_we0 sc_out sc_logic 1 signal 3 } 
	{ gate_cache_1_d0 sc_out sc_lv 8 signal 3 } 
	{ gate_cache_2_address0 sc_out sc_lv 10 signal 4 } 
	{ gate_cache_2_ce0 sc_out sc_logic 1 signal 4 } 
	{ gate_cache_2_we0 sc_out sc_logic 1 signal 4 } 
	{ gate_cache_2_d0 sc_out sc_lv 8 signal 4 } 
	{ gate_cache_3_address0 sc_out sc_lv 10 signal 5 } 
	{ gate_cache_3_ce0 sc_out sc_logic 1 signal 5 } 
	{ gate_cache_3_we0 sc_out sc_logic 1 signal 5 } 
	{ gate_cache_3_d0 sc_out sc_lv 8 signal 5 } 
	{ gate_cache_4_address0 sc_out sc_lv 10 signal 6 } 
	{ gate_cache_4_ce0 sc_out sc_logic 1 signal 6 } 
	{ gate_cache_4_we0 sc_out sc_logic 1 signal 6 } 
	{ gate_cache_4_d0 sc_out sc_lv 8 signal 6 } 
	{ gate_cache_5_address0 sc_out sc_lv 10 signal 7 } 
	{ gate_cache_5_ce0 sc_out sc_logic 1 signal 7 } 
	{ gate_cache_5_we0 sc_out sc_logic 1 signal 7 } 
	{ gate_cache_5_d0 sc_out sc_lv 8 signal 7 } 
	{ gate_cache_6_address0 sc_out sc_lv 10 signal 8 } 
	{ gate_cache_6_ce0 sc_out sc_logic 1 signal 8 } 
	{ gate_cache_6_we0 sc_out sc_logic 1 signal 8 } 
	{ gate_cache_6_d0 sc_out sc_lv 8 signal 8 } 
	{ gate_cache_7_address0 sc_out sc_lv 10 signal 9 } 
	{ gate_cache_7_ce0 sc_out sc_logic 1 signal 9 } 
	{ gate_cache_7_we0 sc_out sc_logic 1 signal 9 } 
	{ gate_cache_7_d0 sc_out sc_lv 8 signal 9 } 
	{ ap_return sc_out sc_lv 32 signal -1 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_continue", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "continue", "bundle":{"name": "ap_continue", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "X1_cache_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "X1_cache", "role": "address0" }} , 
 	{ "name": "X1_cache_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "X1_cache", "role": "ce0" }} , 
 	{ "name": "X1_cache_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "X1_cache", "role": "q0" }} , 
 	{ "name": "X2_cache_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "X2_cache", "role": "address0" }} , 
 	{ "name": "X2_cache_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "X2_cache", "role": "ce0" }} , 
 	{ "name": "X2_cache_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "X2_cache", "role": "q0" }} , 
 	{ "name": "gate_cache_0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "gate_cache_0", "role": "address0" }} , 
 	{ "name": "gate_cache_0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gate_cache_0", "role": "ce0" }} , 
 	{ "name": "gate_cache_0_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gate_cache_0", "role": "we0" }} , 
 	{ "name": "gate_cache_0_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "gate_cache_0", "role": "d0" }} , 
 	{ "name": "gate_cache_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "gate_cache_1", "role": "address0" }} , 
 	{ "name": "gate_cache_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gate_cache_1", "role": "ce0" }} , 
 	{ "name": "gate_cache_1_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gate_cache_1", "role": "we0" }} , 
 	{ "name": "gate_cache_1_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "gate_cache_1", "role": "d0" }} , 
 	{ "name": "gate_cache_2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "gate_cache_2", "role": "address0" }} , 
 	{ "name": "gate_cache_2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gate_cache_2", "role": "ce0" }} , 
 	{ "name": "gate_cache_2_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gate_cache_2", "role": "we0" }} , 
 	{ "name": "gate_cache_2_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "gate_cache_2", "role": "d0" }} , 
 	{ "name": "gate_cache_3_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "gate_cache_3", "role": "address0" }} , 
 	{ "name": "gate_cache_3_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gate_cache_3", "role": "ce0" }} , 
 	{ "name": "gate_cache_3_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gate_cache_3", "role": "we0" }} , 
 	{ "name": "gate_cache_3_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "gate_cache_3", "role": "d0" }} , 
 	{ "name": "gate_cache_4_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "gate_cache_4", "role": "address0" }} , 
 	{ "name": "gate_cache_4_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gate_cache_4", "role": "ce0" }} , 
 	{ "name": "gate_cache_4_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gate_cache_4", "role": "we0" }} , 
 	{ "name": "gate_cache_4_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "gate_cache_4", "role": "d0" }} , 
 	{ "name": "gate_cache_5_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "gate_cache_5", "role": "address0" }} , 
 	{ "name": "gate_cache_5_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gate_cache_5", "role": "ce0" }} , 
 	{ "name": "gate_cache_5_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gate_cache_5", "role": "we0" }} , 
 	{ "name": "gate_cache_5_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "gate_cache_5", "role": "d0" }} , 
 	{ "name": "gate_cache_6_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "gate_cache_6", "role": "address0" }} , 
 	{ "name": "gate_cache_6_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gate_cache_6", "role": "ce0" }} , 
 	{ "name": "gate_cache_6_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gate_cache_6", "role": "we0" }} , 
 	{ "name": "gate_cache_6_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "gate_cache_6", "role": "d0" }} , 
 	{ "name": "gate_cache_7_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "gate_cache_7", "role": "address0" }} , 
 	{ "name": "gate_cache_7_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gate_cache_7", "role": "ce0" }} , 
 	{ "name": "gate_cache_7_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gate_cache_7", "role": "we0" }} , 
 	{ "name": "gate_cache_7_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "gate_cache_7", "role": "d0" }} , 
 	{ "name": "ap_return", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ap_return", "role": "default" }}  ]}

set ArgLastReadFirstWriteLatency {
	compute_gate {
		X1_cache {Type I LastRead 0 FirstWrite -1}
		X2_cache {Type I LastRead 31 FirstWrite -1}
		gate_cache_0 {Type O LastRead -1 FirstWrite 80}
		gate_cache_1 {Type O LastRead -1 FirstWrite 80}
		gate_cache_2 {Type O LastRead -1 FirstWrite 80}
		gate_cache_3 {Type O LastRead -1 FirstWrite 80}
		gate_cache_4 {Type O LastRead -1 FirstWrite 80}
		gate_cache_5 {Type O LastRead -1 FirstWrite 80}
		gate_cache_6 {Type O LastRead -1 FirstWrite 80}
		gate_cache_7 {Type O LastRead -1 FirstWrite 80}
		sigmoid_lut {Type I LastRead -1 FirstWrite -1}}
	compute_gate_Pipeline_GATE_PASS1 {
		X1_cache {Type I LastRead 0 FirstWrite -1}
		X2_cache {Type I LastRead 31 FirstWrite -1}
		max_abs_out {Type O LastRead -1 FirstWrite 60}
		max_abs_2_out {Type O LastRead -1 FirstWrite 60}
		max_abs_4_out {Type O LastRead -1 FirstWrite 60}
		max_abs_6_out {Type O LastRead -1 FirstWrite 60}
		max_abs_8_out {Type O LastRead -1 FirstWrite 60}
		max_abs_10_out {Type O LastRead -1 FirstWrite 60}
		max_abs_12_out {Type O LastRead -1 FirstWrite 60}
		max_abs_14_out {Type O LastRead -1 FirstWrite 60}
		sigmoid_lut {Type I LastRead 38 FirstWrite -1}}
	compute_gate_Pipeline_GATE_PASS2 {
		X1_cache {Type I LastRead 0 FirstWrite -1}
		X2_cache {Type I LastRead 31 FirstWrite -1}
		gate_cache_7 {Type O LastRead -1 FirstWrite 80}
		gate_cache_6 {Type O LastRead -1 FirstWrite 80}
		gate_cache_5 {Type O LastRead -1 FirstWrite 80}
		gate_cache_4 {Type O LastRead -1 FirstWrite 80}
		gate_cache_3 {Type O LastRead -1 FirstWrite 80}
		gate_cache_2 {Type O LastRead -1 FirstWrite 80}
		gate_cache_1 {Type O LastRead -1 FirstWrite 80}
		gate_cache_0 {Type O LastRead -1 FirstWrite 80}
		inv_gs {Type I LastRead 0 FirstWrite -1}
		sigmoid_lut {Type I LastRead 38 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "16622", "Max" : "16622"}
	, {"Name" : "Interval", "Min" : "16622", "Max" : "16622"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	X1_cache { ap_memory {  { X1_cache_address0 mem_address 1 13 }  { X1_cache_ce0 mem_ce 1 1 }  { X1_cache_q0 mem_dout 0 8 } } }
	X2_cache { ap_memory {  { X2_cache_address0 mem_address 1 13 }  { X2_cache_ce0 mem_ce 1 1 }  { X2_cache_q0 mem_dout 0 8 } } }
	gate_cache_0 { ap_memory {  { gate_cache_0_address0 mem_address 1 10 }  { gate_cache_0_ce0 mem_ce 1 1 }  { gate_cache_0_we0 mem_we 1 1 }  { gate_cache_0_d0 mem_din 1 8 } } }
	gate_cache_1 { ap_memory {  { gate_cache_1_address0 mem_address 1 10 }  { gate_cache_1_ce0 mem_ce 1 1 }  { gate_cache_1_we0 mem_we 1 1 }  { gate_cache_1_d0 mem_din 1 8 } } }
	gate_cache_2 { ap_memory {  { gate_cache_2_address0 mem_address 1 10 }  { gate_cache_2_ce0 mem_ce 1 1 }  { gate_cache_2_we0 mem_we 1 1 }  { gate_cache_2_d0 mem_din 1 8 } } }
	gate_cache_3 { ap_memory {  { gate_cache_3_address0 mem_address 1 10 }  { gate_cache_3_ce0 mem_ce 1 1 }  { gate_cache_3_we0 mem_we 1 1 }  { gate_cache_3_d0 mem_din 1 8 } } }
	gate_cache_4 { ap_memory {  { gate_cache_4_address0 mem_address 1 10 }  { gate_cache_4_ce0 mem_ce 1 1 }  { gate_cache_4_we0 mem_we 1 1 }  { gate_cache_4_d0 mem_din 1 8 } } }
	gate_cache_5 { ap_memory {  { gate_cache_5_address0 mem_address 1 10 }  { gate_cache_5_ce0 mem_ce 1 1 }  { gate_cache_5_we0 mem_we 1 1 }  { gate_cache_5_d0 mem_din 1 8 } } }
	gate_cache_6 { ap_memory {  { gate_cache_6_address0 mem_address 1 10 }  { gate_cache_6_ce0 mem_ce 1 1 }  { gate_cache_6_we0 mem_we 1 1 }  { gate_cache_6_d0 mem_din 1 8 } } }
	gate_cache_7 { ap_memory {  { gate_cache_7_address0 mem_address 1 10 }  { gate_cache_7_ce0 mem_ce 1 1 }  { gate_cache_7_we0 mem_we 1 1 }  { gate_cache_7_d0 mem_din 1 8 } } }
}
