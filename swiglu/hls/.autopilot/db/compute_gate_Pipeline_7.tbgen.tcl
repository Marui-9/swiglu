set moduleName compute_gate_Pipeline_7
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
set cdfgNum 40
set C_modelName {compute_gate_Pipeline_7}
set C_modelType { void 0 }
set ap_memory_interface_dict [dict create]
set C_modelArgList {
	{ pmax float 32 regular {pointer 1}  }
	{ pmax_1 float 32 regular {pointer 1}  }
	{ pmax_2 float 32 regular {pointer 1}  }
	{ pmax_3 float 32 regular {pointer 1}  }
	{ pmax_4 float 32 regular {pointer 1}  }
	{ pmax_5 float 32 regular {pointer 1}  }
	{ pmax_6 float 32 regular {pointer 1}  }
	{ pmax_7 float 32 regular {pointer 1}  }
}
set hasAXIMCache 0
set l_AXIML2Cache [list]
set AXIMCacheInstDict [dict create]
set C_modelArgMapList {[ 
	{ "Name" : "pmax", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "pmax_1", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "pmax_2", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "pmax_3", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "pmax_4", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "pmax_5", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "pmax_6", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "pmax_7", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 22
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ pmax sc_out sc_lv 32 signal 0 } 
	{ pmax_ap_vld sc_out sc_logic 1 outvld 0 } 
	{ pmax_1 sc_out sc_lv 32 signal 1 } 
	{ pmax_1_ap_vld sc_out sc_logic 1 outvld 1 } 
	{ pmax_2 sc_out sc_lv 32 signal 2 } 
	{ pmax_2_ap_vld sc_out sc_logic 1 outvld 2 } 
	{ pmax_3 sc_out sc_lv 32 signal 3 } 
	{ pmax_3_ap_vld sc_out sc_logic 1 outvld 3 } 
	{ pmax_4 sc_out sc_lv 32 signal 4 } 
	{ pmax_4_ap_vld sc_out sc_logic 1 outvld 4 } 
	{ pmax_5 sc_out sc_lv 32 signal 5 } 
	{ pmax_5_ap_vld sc_out sc_logic 1 outvld 5 } 
	{ pmax_6 sc_out sc_lv 32 signal 6 } 
	{ pmax_6_ap_vld sc_out sc_logic 1 outvld 6 } 
	{ pmax_7 sc_out sc_lv 32 signal 7 } 
	{ pmax_7_ap_vld sc_out sc_logic 1 outvld 7 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "pmax", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "pmax", "role": "default" }} , 
 	{ "name": "pmax_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "pmax", "role": "ap_vld" }} , 
 	{ "name": "pmax_1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "pmax_1", "role": "default" }} , 
 	{ "name": "pmax_1_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "pmax_1", "role": "ap_vld" }} , 
 	{ "name": "pmax_2", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "pmax_2", "role": "default" }} , 
 	{ "name": "pmax_2_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "pmax_2", "role": "ap_vld" }} , 
 	{ "name": "pmax_3", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "pmax_3", "role": "default" }} , 
 	{ "name": "pmax_3_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "pmax_3", "role": "ap_vld" }} , 
 	{ "name": "pmax_4", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "pmax_4", "role": "default" }} , 
 	{ "name": "pmax_4_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "pmax_4", "role": "ap_vld" }} , 
 	{ "name": "pmax_5", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "pmax_5", "role": "default" }} , 
 	{ "name": "pmax_5_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "pmax_5", "role": "ap_vld" }} , 
 	{ "name": "pmax_6", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "pmax_6", "role": "default" }} , 
 	{ "name": "pmax_6_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "pmax_6", "role": "ap_vld" }} , 
 	{ "name": "pmax_7", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "pmax_7", "role": "default" }} , 
 	{ "name": "pmax_7_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "pmax_7", "role": "ap_vld" }}  ]}

set ArgLastReadFirstWriteLatency {
	compute_gate_Pipeline_7 {
		pmax {Type O LastRead -1 FirstWrite 0}
		pmax_1 {Type O LastRead -1 FirstWrite 0}
		pmax_2 {Type O LastRead -1 FirstWrite 0}
		pmax_3 {Type O LastRead -1 FirstWrite 0}
		pmax_4 {Type O LastRead -1 FirstWrite 0}
		pmax_5 {Type O LastRead -1 FirstWrite 0}
		pmax_6 {Type O LastRead -1 FirstWrite 0}
		pmax_7 {Type O LastRead -1 FirstWrite 0}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "10", "Max" : "10"}
	, {"Name" : "Interval", "Min" : "10", "Max" : "10"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	pmax { ap_vld {  { pmax out_data 1 32 }  { pmax_ap_vld out_vld 1 1 } } }
	pmax_1 { ap_vld {  { pmax_1 out_data 1 32 }  { pmax_1_ap_vld out_vld 1 1 } } }
	pmax_2 { ap_vld {  { pmax_2 out_data 1 32 }  { pmax_2_ap_vld out_vld 1 1 } } }
	pmax_3 { ap_vld {  { pmax_3 out_data 1 32 }  { pmax_3_ap_vld out_vld 1 1 } } }
	pmax_4 { ap_vld {  { pmax_4 out_data 1 32 }  { pmax_4_ap_vld out_vld 1 1 } } }
	pmax_5 { ap_vld {  { pmax_5 out_data 1 32 }  { pmax_5_ap_vld out_vld 1 1 } } }
	pmax_6 { ap_vld {  { pmax_6 out_data 1 32 }  { pmax_6_ap_vld out_vld 1 1 } } }
	pmax_7 { ap_vld {  { pmax_7 out_data 1 32 }  { pmax_7_ap_vld out_vld 1 1 } } }
}
