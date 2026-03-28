set moduleName entry_proc
set isTopModule 0
set isCombinational 0
set isDatapathOnly 0
set isPipelined 0
set isPipelined_legacy 0
set pipeline_type none
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 1
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set hasInterrupt 0
set DLRegFirstOffset 0
set DLRegItemOffset 0
set svuvm_can_support 1
set cdfgNum 38
set C_modelName {entry_proc}
set C_modelType { void 0 }
set ap_memory_interface_dict [dict create]
set C_modelArgList {
	{ W int 8 regular {pointer 0}  }
	{ W_c int 8 regular {fifo 1}  }
	{ V int 8 regular {pointer 0}  }
	{ V_c int 8 regular {fifo 1}  }
	{ W_down int 8 regular {pointer 0}  }
	{ W_down_c int 8 regular {fifo 1}  }
	{ out_batch int 64 regular  }
	{ out_batch_c int 64 regular {fifo 1}  }
	{ down_quant_mode int 32 regular  }
	{ down_quant_mode_c int 32 regular {fifo 1}  }
	{ x_scale float 32 regular  }
	{ x_scale_c float 32 regular {fifo 1}  }
	{ x_scale_c1 float 32 regular {fifo 1}  }
}
set hasAXIMCache 0
set l_AXIML2Cache [list]
set AXIMCacheInstDict [dict create]
set C_modelArgMapList {[ 
	{ "Name" : "W", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "W_c", "interface" : "fifo", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "V", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "V_c", "interface" : "fifo", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "W_down", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "W_down_c", "interface" : "fifo", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "out_batch", "interface" : "wire", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "out_batch_c", "interface" : "fifo", "bitwidth" : 64, "direction" : "WRITEONLY"} , 
 	{ "Name" : "down_quant_mode", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "down_quant_mode_c", "interface" : "fifo", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "x_scale", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "x_scale_c", "interface" : "fifo", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "x_scale_c1", "interface" : "fifo", "bitwidth" : 32, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 48
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_continue sc_in sc_logic 1 continue -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ W sc_in sc_lv 8 signal 0 } 
	{ W_c_din sc_out sc_lv 8 signal 1 } 
	{ W_c_full_n sc_in sc_logic 1 signal 1 } 
	{ W_c_write sc_out sc_logic 1 signal 1 } 
	{ W_c_num_data_valid sc_in sc_lv 3 signal 1 } 
	{ W_c_fifo_cap sc_in sc_lv 3 signal 1 } 
	{ V sc_in sc_lv 8 signal 2 } 
	{ V_c_din sc_out sc_lv 8 signal 3 } 
	{ V_c_full_n sc_in sc_logic 1 signal 3 } 
	{ V_c_write sc_out sc_logic 1 signal 3 } 
	{ V_c_num_data_valid sc_in sc_lv 3 signal 3 } 
	{ V_c_fifo_cap sc_in sc_lv 3 signal 3 } 
	{ W_down sc_in sc_lv 8 signal 4 } 
	{ W_down_c_din sc_out sc_lv 8 signal 5 } 
	{ W_down_c_full_n sc_in sc_logic 1 signal 5 } 
	{ W_down_c_write sc_out sc_logic 1 signal 5 } 
	{ W_down_c_num_data_valid sc_in sc_lv 4 signal 5 } 
	{ W_down_c_fifo_cap sc_in sc_lv 4 signal 5 } 
	{ out_batch sc_in sc_lv 64 signal 6 } 
	{ out_batch_c_din sc_out sc_lv 64 signal 7 } 
	{ out_batch_c_full_n sc_in sc_logic 1 signal 7 } 
	{ out_batch_c_write sc_out sc_logic 1 signal 7 } 
	{ out_batch_c_num_data_valid sc_in sc_lv 4 signal 7 } 
	{ out_batch_c_fifo_cap sc_in sc_lv 4 signal 7 } 
	{ down_quant_mode sc_in sc_lv 32 signal 8 } 
	{ down_quant_mode_c_din sc_out sc_lv 32 signal 9 } 
	{ down_quant_mode_c_full_n sc_in sc_logic 1 signal 9 } 
	{ down_quant_mode_c_write sc_out sc_logic 1 signal 9 } 
	{ down_quant_mode_c_num_data_valid sc_in sc_lv 4 signal 9 } 
	{ down_quant_mode_c_fifo_cap sc_in sc_lv 4 signal 9 } 
	{ x_scale sc_in sc_lv 32 signal 10 } 
	{ x_scale_c_din sc_out sc_lv 32 signal 11 } 
	{ x_scale_c_full_n sc_in sc_logic 1 signal 11 } 
	{ x_scale_c_write sc_out sc_logic 1 signal 11 } 
	{ x_scale_c_num_data_valid sc_in sc_lv 3 signal 11 } 
	{ x_scale_c_fifo_cap sc_in sc_lv 3 signal 11 } 
	{ x_scale_c1_din sc_out sc_lv 32 signal 12 } 
	{ x_scale_c1_full_n sc_in sc_logic 1 signal 12 } 
	{ x_scale_c1_write sc_out sc_logic 1 signal 12 } 
	{ x_scale_c1_num_data_valid sc_in sc_lv 3 signal 12 } 
	{ x_scale_c1_fifo_cap sc_in sc_lv 3 signal 12 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_continue", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "continue", "bundle":{"name": "ap_continue", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "W", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "W", "role": "default" }} , 
 	{ "name": "W_c_din", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "W_c", "role": "din" }} , 
 	{ "name": "W_c_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "W_c", "role": "full_n" }} , 
 	{ "name": "W_c_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "W_c", "role": "write" }} , 
 	{ "name": "W_c_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "W_c", "role": "num_data_valid" }} , 
 	{ "name": "W_c_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "W_c", "role": "fifo_cap" }} , 
 	{ "name": "V", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "V", "role": "default" }} , 
 	{ "name": "V_c_din", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "V_c", "role": "din" }} , 
 	{ "name": "V_c_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "V_c", "role": "full_n" }} , 
 	{ "name": "V_c_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "V_c", "role": "write" }} , 
 	{ "name": "V_c_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "V_c", "role": "num_data_valid" }} , 
 	{ "name": "V_c_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "V_c", "role": "fifo_cap" }} , 
 	{ "name": "W_down", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "W_down", "role": "default" }} , 
 	{ "name": "W_down_c_din", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "W_down_c", "role": "din" }} , 
 	{ "name": "W_down_c_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "W_down_c", "role": "full_n" }} , 
 	{ "name": "W_down_c_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "W_down_c", "role": "write" }} , 
 	{ "name": "W_down_c_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "W_down_c", "role": "num_data_valid" }} , 
 	{ "name": "W_down_c_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "W_down_c", "role": "fifo_cap" }} , 
 	{ "name": "out_batch", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "out_batch", "role": "default" }} , 
 	{ "name": "out_batch_c_din", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "out_batch_c", "role": "din" }} , 
 	{ "name": "out_batch_c_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "out_batch_c", "role": "full_n" }} , 
 	{ "name": "out_batch_c_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "out_batch_c", "role": "write" }} , 
 	{ "name": "out_batch_c_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "out_batch_c", "role": "num_data_valid" }} , 
 	{ "name": "out_batch_c_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "out_batch_c", "role": "fifo_cap" }} , 
 	{ "name": "down_quant_mode", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "down_quant_mode", "role": "default" }} , 
 	{ "name": "down_quant_mode_c_din", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "down_quant_mode_c", "role": "din" }} , 
 	{ "name": "down_quant_mode_c_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "down_quant_mode_c", "role": "full_n" }} , 
 	{ "name": "down_quant_mode_c_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "down_quant_mode_c", "role": "write" }} , 
 	{ "name": "down_quant_mode_c_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "down_quant_mode_c", "role": "num_data_valid" }} , 
 	{ "name": "down_quant_mode_c_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "down_quant_mode_c", "role": "fifo_cap" }} , 
 	{ "name": "x_scale", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "x_scale", "role": "default" }} , 
 	{ "name": "x_scale_c_din", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "x_scale_c", "role": "din" }} , 
 	{ "name": "x_scale_c_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "x_scale_c", "role": "full_n" }} , 
 	{ "name": "x_scale_c_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "x_scale_c", "role": "write" }} , 
 	{ "name": "x_scale_c_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "x_scale_c", "role": "num_data_valid" }} , 
 	{ "name": "x_scale_c_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "x_scale_c", "role": "fifo_cap" }} , 
 	{ "name": "x_scale_c1_din", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "x_scale_c1", "role": "din" }} , 
 	{ "name": "x_scale_c1_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "x_scale_c1", "role": "full_n" }} , 
 	{ "name": "x_scale_c1_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "x_scale_c1", "role": "write" }} , 
 	{ "name": "x_scale_c1_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "x_scale_c1", "role": "num_data_valid" }} , 
 	{ "name": "x_scale_c1_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "x_scale_c1", "role": "fifo_cap" }}  ]}

set ArgLastReadFirstWriteLatency {
	entry_proc {
		W {Type I LastRead 0 FirstWrite -1}
		W_c {Type O LastRead -1 FirstWrite 0}
		V {Type I LastRead 0 FirstWrite -1}
		V_c {Type O LastRead -1 FirstWrite 0}
		W_down {Type I LastRead 0 FirstWrite -1}
		W_down_c {Type O LastRead -1 FirstWrite 0}
		out_batch {Type I LastRead 0 FirstWrite -1}
		out_batch_c {Type O LastRead -1 FirstWrite 0}
		down_quant_mode {Type I LastRead 0 FirstWrite -1}
		down_quant_mode_c {Type O LastRead -1 FirstWrite 0}
		x_scale {Type I LastRead 0 FirstWrite -1}
		x_scale_c {Type O LastRead -1 FirstWrite 0}
		x_scale_c1 {Type O LastRead -1 FirstWrite 0}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "0", "Max" : "0"}
	, {"Name" : "Interval", "Min" : "0", "Max" : "0"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	W { ap_none {  { W in_data 0 8 } } }
	W_c { ap_fifo {  { W_c_din fifo_data_in 1 8 }  { W_c_full_n fifo_status 0 1 }  { W_c_write fifo_port_we 1 1 }  { W_c_num_data_valid fifo_status_num_data_valid 0 3 }  { W_c_fifo_cap fifo_update 0 3 } } }
	V { ap_none {  { V in_data 0 8 } } }
	V_c { ap_fifo {  { V_c_din fifo_data_in 1 8 }  { V_c_full_n fifo_status 0 1 }  { V_c_write fifo_port_we 1 1 }  { V_c_num_data_valid fifo_status_num_data_valid 0 3 }  { V_c_fifo_cap fifo_update 0 3 } } }
	W_down { ap_none {  { W_down in_data 0 8 } } }
	W_down_c { ap_fifo {  { W_down_c_din fifo_data_in 1 8 }  { W_down_c_full_n fifo_status 0 1 }  { W_down_c_write fifo_port_we 1 1 }  { W_down_c_num_data_valid fifo_status_num_data_valid 0 4 }  { W_down_c_fifo_cap fifo_update 0 4 } } }
	out_batch { ap_none {  { out_batch in_data 0 64 } } }
	out_batch_c { ap_fifo {  { out_batch_c_din fifo_data_in 1 64 }  { out_batch_c_full_n fifo_status 0 1 }  { out_batch_c_write fifo_port_we 1 1 }  { out_batch_c_num_data_valid fifo_status_num_data_valid 0 4 }  { out_batch_c_fifo_cap fifo_update 0 4 } } }
	down_quant_mode { ap_none {  { down_quant_mode in_data 0 32 } } }
	down_quant_mode_c { ap_fifo {  { down_quant_mode_c_din fifo_data_in 1 32 }  { down_quant_mode_c_full_n fifo_status 0 1 }  { down_quant_mode_c_write fifo_port_we 1 1 }  { down_quant_mode_c_num_data_valid fifo_status_num_data_valid 0 4 }  { down_quant_mode_c_fifo_cap fifo_update 0 4 } } }
	x_scale { ap_none {  { x_scale in_data 0 32 } } }
	x_scale_c { ap_fifo {  { x_scale_c_din fifo_data_in 1 32 }  { x_scale_c_full_n fifo_status 0 1 }  { x_scale_c_write fifo_port_we 1 1 }  { x_scale_c_num_data_valid fifo_status_num_data_valid 0 3 }  { x_scale_c_fifo_cap fifo_update 0 3 } } }
	x_scale_c1 { ap_fifo {  { x_scale_c1_din fifo_data_in 1 32 }  { x_scale_c1_full_n fifo_status 0 1 }  { x_scale_c1_write fifo_port_we 1 1 }  { x_scale_c1_num_data_valid fifo_status_num_data_valid 0 3 }  { x_scale_c1_fifo_cap fifo_update 0 3 } } }
}
