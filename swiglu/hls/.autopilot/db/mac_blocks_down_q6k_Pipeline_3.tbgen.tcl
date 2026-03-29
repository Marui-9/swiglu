set moduleName mac_blocks_down_q6k_Pipeline_3
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
set C_modelName {mac_blocks_down_q6k_Pipeline_3}
set C_modelType { void 0 }
set ap_memory_interface_dict [dict create]
set C_modelArgList {
	{ acc float 32 regular {pointer 1}  }
	{ acc_1 float 32 regular {pointer 1}  }
	{ acc_2 float 32 regular {pointer 1}  }
	{ acc_3 float 32 regular {pointer 1}  }
	{ acc_4 float 32 regular {pointer 1}  }
	{ acc_5 float 32 regular {pointer 1}  }
	{ acc_6 float 32 regular {pointer 1}  }
	{ acc_7 float 32 regular {pointer 1}  }
}
set hasAXIMCache 0
set l_AXIML2Cache [list]
set AXIMCacheInstDict [dict create]
set C_modelArgMapList {[ 
	{ "Name" : "acc", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "acc_1", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "acc_2", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "acc_3", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "acc_4", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "acc_5", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "acc_6", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "acc_7", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 22
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ acc sc_out sc_lv 32 signal 0 } 
	{ acc_ap_vld sc_out sc_logic 1 outvld 0 } 
	{ acc_1 sc_out sc_lv 32 signal 1 } 
	{ acc_1_ap_vld sc_out sc_logic 1 outvld 1 } 
	{ acc_2 sc_out sc_lv 32 signal 2 } 
	{ acc_2_ap_vld sc_out sc_logic 1 outvld 2 } 
	{ acc_3 sc_out sc_lv 32 signal 3 } 
	{ acc_3_ap_vld sc_out sc_logic 1 outvld 3 } 
	{ acc_4 sc_out sc_lv 32 signal 4 } 
	{ acc_4_ap_vld sc_out sc_logic 1 outvld 4 } 
	{ acc_5 sc_out sc_lv 32 signal 5 } 
	{ acc_5_ap_vld sc_out sc_logic 1 outvld 5 } 
	{ acc_6 sc_out sc_lv 32 signal 6 } 
	{ acc_6_ap_vld sc_out sc_logic 1 outvld 6 } 
	{ acc_7 sc_out sc_lv 32 signal 7 } 
	{ acc_7_ap_vld sc_out sc_logic 1 outvld 7 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "acc", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc", "role": "default" }} , 
 	{ "name": "acc_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "acc", "role": "ap_vld" }} , 
 	{ "name": "acc_1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_1", "role": "default" }} , 
 	{ "name": "acc_1_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "acc_1", "role": "ap_vld" }} , 
 	{ "name": "acc_2", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_2", "role": "default" }} , 
 	{ "name": "acc_2_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "acc_2", "role": "ap_vld" }} , 
 	{ "name": "acc_3", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_3", "role": "default" }} , 
 	{ "name": "acc_3_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "acc_3", "role": "ap_vld" }} , 
 	{ "name": "acc_4", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_4", "role": "default" }} , 
 	{ "name": "acc_4_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "acc_4", "role": "ap_vld" }} , 
 	{ "name": "acc_5", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_5", "role": "default" }} , 
 	{ "name": "acc_5_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "acc_5", "role": "ap_vld" }} , 
 	{ "name": "acc_6", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_6", "role": "default" }} , 
 	{ "name": "acc_6_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "acc_6", "role": "ap_vld" }} , 
 	{ "name": "acc_7", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_7", "role": "default" }} , 
 	{ "name": "acc_7_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "acc_7", "role": "ap_vld" }}  ]}

set ArgLastReadFirstWriteLatency {
	mac_blocks_down_q6k_Pipeline_3 {
		acc {Type O LastRead -1 FirstWrite 0}
		acc_1 {Type O LastRead -1 FirstWrite 0}
		acc_2 {Type O LastRead -1 FirstWrite 0}
		acc_3 {Type O LastRead -1 FirstWrite 0}
		acc_4 {Type O LastRead -1 FirstWrite 0}
		acc_5 {Type O LastRead -1 FirstWrite 0}
		acc_6 {Type O LastRead -1 FirstWrite 0}
		acc_7 {Type O LastRead -1 FirstWrite 0}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "10", "Max" : "10"}
	, {"Name" : "Interval", "Min" : "10", "Max" : "10"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	acc { ap_vld {  { acc out_data 1 32 }  { acc_ap_vld out_vld 1 1 } } }
	acc_1 { ap_vld {  { acc_1 out_data 1 32 }  { acc_1_ap_vld out_vld 1 1 } } }
	acc_2 { ap_vld {  { acc_2 out_data 1 32 }  { acc_2_ap_vld out_vld 1 1 } } }
	acc_3 { ap_vld {  { acc_3 out_data 1 32 }  { acc_3_ap_vld out_vld 1 1 } } }
	acc_4 { ap_vld {  { acc_4 out_data 1 32 }  { acc_4_ap_vld out_vld 1 1 } } }
	acc_5 { ap_vld {  { acc_5 out_data 1 32 }  { acc_5_ap_vld out_vld 1 1 } } }
	acc_6 { ap_vld {  { acc_6 out_data 1 32 }  { acc_6_ap_vld out_vld 1 1 } } }
	acc_7 { ap_vld {  { acc_7 out_data 1 32 }  { acc_7_ap_vld out_vld 1 1 } } }
}
