set moduleName load_row_wv
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
set C_modelName {load_row_wv}
set C_modelType { void 0 }
set ap_memory_interface_dict [dict create]
dict set ap_memory_interface_dict rb_0 { MEM_WIDTH 8 MEM_SIZE 9 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 0 }
dict set ap_memory_interface_dict rb_1 { MEM_WIDTH 8 MEM_SIZE 9 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 0 }
dict set ap_memory_interface_dict rb_2 { MEM_WIDTH 8 MEM_SIZE 9 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 0 }
dict set ap_memory_interface_dict rb_3 { MEM_WIDTH 8 MEM_SIZE 9 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 0 }
dict set ap_memory_interface_dict rb_4 { MEM_WIDTH 8 MEM_SIZE 9 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 0 }
dict set ap_memory_interface_dict rb_5 { MEM_WIDTH 8 MEM_SIZE 9 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 0 }
dict set ap_memory_interface_dict rb_6 { MEM_WIDTH 8 MEM_SIZE 9 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 0 }
dict set ap_memory_interface_dict rb_7 { MEM_WIDTH 8 MEM_SIZE 9 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 0 }
set C_modelArgList {
	{ W_wide_read int 8 regular  }
	{ rb_0 int 8 regular {array 9 { 0 3 } 0 1 }  }
	{ rb_1 int 8 regular {array 9 { 0 3 } 0 1 }  }
	{ rb_2 int 8 regular {array 9 { 0 3 } 0 1 }  }
	{ rb_3 int 8 regular {array 9 { 0 3 } 0 1 }  }
	{ rb_4 int 8 regular {array 9 { 0 3 } 0 1 }  }
	{ rb_5 int 8 regular {array 9 { 0 3 } 0 1 }  }
	{ rb_6 int 8 regular {array 9 { 0 3 } 0 1 }  }
	{ rb_7 int 8 regular {array 9 { 0 3 } 0 1 }  }
}
set hasAXIMCache 0
set l_AXIML2Cache [list]
set AXIMCacheInstDict [dict create]
set C_modelArgMapList {[ 
	{ "Name" : "W_wide_read", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "rb_0", "interface" : "memory", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "rb_1", "interface" : "memory", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "rb_2", "interface" : "memory", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "rb_3", "interface" : "memory", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "rb_4", "interface" : "memory", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "rb_5", "interface" : "memory", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "rb_6", "interface" : "memory", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "rb_7", "interface" : "memory", "bitwidth" : 8, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 39
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ W_wide_read sc_in sc_lv 8 signal 0 } 
	{ rb_0_address0 sc_out sc_lv 4 signal 1 } 
	{ rb_0_ce0 sc_out sc_logic 1 signal 1 } 
	{ rb_0_we0 sc_out sc_logic 1 signal 1 } 
	{ rb_0_d0 sc_out sc_lv 8 signal 1 } 
	{ rb_1_address0 sc_out sc_lv 4 signal 2 } 
	{ rb_1_ce0 sc_out sc_logic 1 signal 2 } 
	{ rb_1_we0 sc_out sc_logic 1 signal 2 } 
	{ rb_1_d0 sc_out sc_lv 8 signal 2 } 
	{ rb_2_address0 sc_out sc_lv 4 signal 3 } 
	{ rb_2_ce0 sc_out sc_logic 1 signal 3 } 
	{ rb_2_we0 sc_out sc_logic 1 signal 3 } 
	{ rb_2_d0 sc_out sc_lv 8 signal 3 } 
	{ rb_3_address0 sc_out sc_lv 4 signal 4 } 
	{ rb_3_ce0 sc_out sc_logic 1 signal 4 } 
	{ rb_3_we0 sc_out sc_logic 1 signal 4 } 
	{ rb_3_d0 sc_out sc_lv 8 signal 4 } 
	{ rb_4_address0 sc_out sc_lv 4 signal 5 } 
	{ rb_4_ce0 sc_out sc_logic 1 signal 5 } 
	{ rb_4_we0 sc_out sc_logic 1 signal 5 } 
	{ rb_4_d0 sc_out sc_lv 8 signal 5 } 
	{ rb_5_address0 sc_out sc_lv 4 signal 6 } 
	{ rb_5_ce0 sc_out sc_logic 1 signal 6 } 
	{ rb_5_we0 sc_out sc_logic 1 signal 6 } 
	{ rb_5_d0 sc_out sc_lv 8 signal 6 } 
	{ rb_6_address0 sc_out sc_lv 4 signal 7 } 
	{ rb_6_ce0 sc_out sc_logic 1 signal 7 } 
	{ rb_6_we0 sc_out sc_logic 1 signal 7 } 
	{ rb_6_d0 sc_out sc_lv 8 signal 7 } 
	{ rb_7_address0 sc_out sc_lv 4 signal 8 } 
	{ rb_7_ce0 sc_out sc_logic 1 signal 8 } 
	{ rb_7_we0 sc_out sc_logic 1 signal 8 } 
	{ rb_7_d0 sc_out sc_lv 8 signal 8 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "W_wide_read", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "W_wide_read", "role": "default" }} , 
 	{ "name": "rb_0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "rb_0", "role": "address0" }} , 
 	{ "name": "rb_0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rb_0", "role": "ce0" }} , 
 	{ "name": "rb_0_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rb_0", "role": "we0" }} , 
 	{ "name": "rb_0_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "rb_0", "role": "d0" }} , 
 	{ "name": "rb_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "rb_1", "role": "address0" }} , 
 	{ "name": "rb_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rb_1", "role": "ce0" }} , 
 	{ "name": "rb_1_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rb_1", "role": "we0" }} , 
 	{ "name": "rb_1_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "rb_1", "role": "d0" }} , 
 	{ "name": "rb_2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "rb_2", "role": "address0" }} , 
 	{ "name": "rb_2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rb_2", "role": "ce0" }} , 
 	{ "name": "rb_2_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rb_2", "role": "we0" }} , 
 	{ "name": "rb_2_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "rb_2", "role": "d0" }} , 
 	{ "name": "rb_3_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "rb_3", "role": "address0" }} , 
 	{ "name": "rb_3_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rb_3", "role": "ce0" }} , 
 	{ "name": "rb_3_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rb_3", "role": "we0" }} , 
 	{ "name": "rb_3_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "rb_3", "role": "d0" }} , 
 	{ "name": "rb_4_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "rb_4", "role": "address0" }} , 
 	{ "name": "rb_4_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rb_4", "role": "ce0" }} , 
 	{ "name": "rb_4_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rb_4", "role": "we0" }} , 
 	{ "name": "rb_4_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "rb_4", "role": "d0" }} , 
 	{ "name": "rb_5_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "rb_5", "role": "address0" }} , 
 	{ "name": "rb_5_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rb_5", "role": "ce0" }} , 
 	{ "name": "rb_5_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rb_5", "role": "we0" }} , 
 	{ "name": "rb_5_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "rb_5", "role": "d0" }} , 
 	{ "name": "rb_6_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "rb_6", "role": "address0" }} , 
 	{ "name": "rb_6_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rb_6", "role": "ce0" }} , 
 	{ "name": "rb_6_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rb_6", "role": "we0" }} , 
 	{ "name": "rb_6_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "rb_6", "role": "d0" }} , 
 	{ "name": "rb_7_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "rb_7", "role": "address0" }} , 
 	{ "name": "rb_7_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rb_7", "role": "ce0" }} , 
 	{ "name": "rb_7_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rb_7", "role": "we0" }} , 
 	{ "name": "rb_7_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "rb_7", "role": "d0" }}  ]}

set ArgLastReadFirstWriteLatency {
	load_row_wv {
		W_wide_read {Type I LastRead 0 FirstWrite -1}
		rb_0 {Type O LastRead -1 FirstWrite 2}
		rb_1 {Type O LastRead -1 FirstWrite 2}
		rb_2 {Type O LastRead -1 FirstWrite 2}
		rb_3 {Type O LastRead -1 FirstWrite 2}
		rb_4 {Type O LastRead -1 FirstWrite 2}
		rb_5 {Type O LastRead -1 FirstWrite 2}
		rb_6 {Type O LastRead -1 FirstWrite 2}
		rb_7 {Type O LastRead -1 FirstWrite 2}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "75", "Max" : "75"}
	, {"Name" : "Interval", "Min" : "75", "Max" : "75"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	W_wide_read { ap_none {  { W_wide_read in_data 0 8 } } }
	rb_0 { ap_memory {  { rb_0_address0 mem_address 1 4 }  { rb_0_ce0 mem_ce 1 1 }  { rb_0_we0 mem_we 1 1 }  { rb_0_d0 mem_din 1 8 } } }
	rb_1 { ap_memory {  { rb_1_address0 mem_address 1 4 }  { rb_1_ce0 mem_ce 1 1 }  { rb_1_we0 mem_we 1 1 }  { rb_1_d0 mem_din 1 8 } } }
	rb_2 { ap_memory {  { rb_2_address0 mem_address 1 4 }  { rb_2_ce0 mem_ce 1 1 }  { rb_2_we0 mem_we 1 1 }  { rb_2_d0 mem_din 1 8 } } }
	rb_3 { ap_memory {  { rb_3_address0 mem_address 1 4 }  { rb_3_ce0 mem_ce 1 1 }  { rb_3_we0 mem_we 1 1 }  { rb_3_d0 mem_din 1 8 } } }
	rb_4 { ap_memory {  { rb_4_address0 mem_address 1 4 }  { rb_4_ce0 mem_ce 1 1 }  { rb_4_we0 mem_we 1 1 }  { rb_4_d0 mem_din 1 8 } } }
	rb_5 { ap_memory {  { rb_5_address0 mem_address 1 4 }  { rb_5_ce0 mem_ce 1 1 }  { rb_5_we0 mem_we 1 1 }  { rb_5_d0 mem_din 1 8 } } }
	rb_6 { ap_memory {  { rb_6_address0 mem_address 1 4 }  { rb_6_ce0 mem_ce 1 1 }  { rb_6_we0 mem_we 1 1 }  { rb_6_d0 mem_din 1 8 } } }
	rb_7 { ap_memory {  { rb_7_address0 mem_address 1 4 }  { rb_7_ce0 mem_ce 1 1 }  { rb_7_we0 mem_we 1 1 }  { rb_7_d0 mem_din 1 8 } } }
}
