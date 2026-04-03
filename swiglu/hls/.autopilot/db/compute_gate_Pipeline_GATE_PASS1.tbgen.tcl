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
set cdfgNum 42
set C_modelName {compute_gate_Pipeline_GATE_PASS1}
set C_modelType { void 0 }
set ap_memory_interface_dict [dict create]
dict set ap_memory_interface_dict X1_cache { MEM_WIDTH 8 MEM_SIZE 32768 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict X2_cache { MEM_WIDTH 8 MEM_SIZE 32768 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict sigmoid_lut { MEM_WIDTH 32 MEM_SIZE 16384 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
set C_modelArgList {
	{ X1_cache int 8 regular {array 32768 { 1 3 } 1 1 }  }
	{ X2_cache int 8 regular {array 32768 { 1 3 } 1 1 }  }
	{ pmax_7 float 32 regular {pointer 2}  }
	{ pmax_6 float 32 regular {pointer 2}  }
	{ pmax_5 float 32 regular {pointer 2}  }
	{ pmax_4 float 32 regular {pointer 2}  }
	{ pmax_3 float 32 regular {pointer 2}  }
	{ pmax_2 float 32 regular {pointer 2}  }
	{ pmax_1 float 32 regular {pointer 2}  }
	{ pmax float 32 regular {pointer 2}  }
	{ sigmoid_lut float 32 regular {array 4096 { 1 } 1 1 } {global 0}  }
}
set hasAXIMCache 0
set l_AXIML2Cache [list]
set AXIMCacheInstDict [dict create]
set C_modelArgMapList {[ 
	{ "Name" : "X1_cache", "interface" : "memory", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "X2_cache", "interface" : "memory", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "pmax_7", "interface" : "wire", "bitwidth" : 32, "direction" : "READWRITE"} , 
 	{ "Name" : "pmax_6", "interface" : "wire", "bitwidth" : 32, "direction" : "READWRITE"} , 
 	{ "Name" : "pmax_5", "interface" : "wire", "bitwidth" : 32, "direction" : "READWRITE"} , 
 	{ "Name" : "pmax_4", "interface" : "wire", "bitwidth" : 32, "direction" : "READWRITE"} , 
 	{ "Name" : "pmax_3", "interface" : "wire", "bitwidth" : 32, "direction" : "READWRITE"} , 
 	{ "Name" : "pmax_2", "interface" : "wire", "bitwidth" : 32, "direction" : "READWRITE"} , 
 	{ "Name" : "pmax_1", "interface" : "wire", "bitwidth" : 32, "direction" : "READWRITE"} , 
 	{ "Name" : "pmax", "interface" : "wire", "bitwidth" : 32, "direction" : "READWRITE"} , 
 	{ "Name" : "sigmoid_lut", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY", "extern" : 0} ]}
# RTL Port declarations: 
set portNum 86
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ X1_cache_address0 sc_out sc_lv 15 signal 0 } 
	{ X1_cache_ce0 sc_out sc_logic 1 signal 0 } 
	{ X1_cache_q0 sc_in sc_lv 8 signal 0 } 
	{ X2_cache_address0 sc_out sc_lv 15 signal 1 } 
	{ X2_cache_ce0 sc_out sc_logic 1 signal 1 } 
	{ X2_cache_q0 sc_in sc_lv 8 signal 1 } 
	{ pmax_7_i sc_in sc_lv 32 signal 2 } 
	{ pmax_7_o sc_out sc_lv 32 signal 2 } 
	{ pmax_7_o_ap_vld sc_out sc_logic 1 outvld 2 } 
	{ pmax_6_i sc_in sc_lv 32 signal 3 } 
	{ pmax_6_o sc_out sc_lv 32 signal 3 } 
	{ pmax_6_o_ap_vld sc_out sc_logic 1 outvld 3 } 
	{ pmax_5_i sc_in sc_lv 32 signal 4 } 
	{ pmax_5_o sc_out sc_lv 32 signal 4 } 
	{ pmax_5_o_ap_vld sc_out sc_logic 1 outvld 4 } 
	{ pmax_4_i sc_in sc_lv 32 signal 5 } 
	{ pmax_4_o sc_out sc_lv 32 signal 5 } 
	{ pmax_4_o_ap_vld sc_out sc_logic 1 outvld 5 } 
	{ pmax_3_i sc_in sc_lv 32 signal 6 } 
	{ pmax_3_o sc_out sc_lv 32 signal 6 } 
	{ pmax_3_o_ap_vld sc_out sc_logic 1 outvld 6 } 
	{ pmax_2_i sc_in sc_lv 32 signal 7 } 
	{ pmax_2_o sc_out sc_lv 32 signal 7 } 
	{ pmax_2_o_ap_vld sc_out sc_logic 1 outvld 7 } 
	{ pmax_1_i sc_in sc_lv 32 signal 8 } 
	{ pmax_1_o sc_out sc_lv 32 signal 8 } 
	{ pmax_1_o_ap_vld sc_out sc_logic 1 outvld 8 } 
	{ pmax_i sc_in sc_lv 32 signal 9 } 
	{ pmax_o sc_out sc_lv 32 signal 9 } 
	{ pmax_o_ap_vld sc_out sc_logic 1 outvld 9 } 
	{ sigmoid_lut_address0 sc_out sc_lv 12 signal 10 } 
	{ sigmoid_lut_ce0 sc_out sc_logic 1 signal 10 } 
	{ sigmoid_lut_q0 sc_in sc_lv 32 signal 10 } 
	{ grp_fu_3871_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_3871_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_3871_p_opcode sc_out sc_lv 2 signal -1 } 
	{ grp_fu_3871_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_3871_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_3875_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_3875_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_3875_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_3875_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_3879_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_3879_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_3879_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_3879_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_3883_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_3883_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_3883_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_3883_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_3887_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_3887_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_3887_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_3887_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_3891_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_3891_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_3891_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_3891_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_3895_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_3895_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_3895_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_3898_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_3898_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_3898_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_346_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_346_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_346_p_opcode sc_out sc_lv 5 signal -1 } 
	{ grp_fu_346_p_dout0 sc_in sc_lv 1 signal -1 } 
	{ grp_fu_346_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_3901_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_3901_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_3901_p_opcode sc_out sc_lv 5 signal -1 } 
	{ grp_fu_3901_p_dout0 sc_in sc_lv 1 signal -1 } 
	{ grp_fu_3901_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_p_hls_fptosi_float_i32_fu_3905_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_p_hls_fptosi_float_i32_fu_3905_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_p_hls_fptosi_float_i32_fu_3905_p_start sc_out sc_logic 1 signal -1 } 
	{ grp_p_hls_fptosi_float_i32_fu_3905_p_ready sc_in sc_logic 1 signal -1 } 
	{ grp_p_hls_fptosi_float_i32_fu_3905_p_done sc_in sc_logic 1 signal -1 } 
	{ grp_p_hls_fptosi_float_i32_fu_3905_p_idle sc_in sc_logic 1 signal -1 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "X1_cache_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":15, "type": "signal", "bundle":{"name": "X1_cache", "role": "address0" }} , 
 	{ "name": "X1_cache_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "X1_cache", "role": "ce0" }} , 
 	{ "name": "X1_cache_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "X1_cache", "role": "q0" }} , 
 	{ "name": "X2_cache_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":15, "type": "signal", "bundle":{"name": "X2_cache", "role": "address0" }} , 
 	{ "name": "X2_cache_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "X2_cache", "role": "ce0" }} , 
 	{ "name": "X2_cache_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "X2_cache", "role": "q0" }} , 
 	{ "name": "pmax_7_i", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "pmax_7", "role": "i" }} , 
 	{ "name": "pmax_7_o", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "pmax_7", "role": "o" }} , 
 	{ "name": "pmax_7_o_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "pmax_7", "role": "o_ap_vld" }} , 
 	{ "name": "pmax_6_i", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "pmax_6", "role": "i" }} , 
 	{ "name": "pmax_6_o", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "pmax_6", "role": "o" }} , 
 	{ "name": "pmax_6_o_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "pmax_6", "role": "o_ap_vld" }} , 
 	{ "name": "pmax_5_i", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "pmax_5", "role": "i" }} , 
 	{ "name": "pmax_5_o", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "pmax_5", "role": "o" }} , 
 	{ "name": "pmax_5_o_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "pmax_5", "role": "o_ap_vld" }} , 
 	{ "name": "pmax_4_i", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "pmax_4", "role": "i" }} , 
 	{ "name": "pmax_4_o", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "pmax_4", "role": "o" }} , 
 	{ "name": "pmax_4_o_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "pmax_4", "role": "o_ap_vld" }} , 
 	{ "name": "pmax_3_i", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "pmax_3", "role": "i" }} , 
 	{ "name": "pmax_3_o", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "pmax_3", "role": "o" }} , 
 	{ "name": "pmax_3_o_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "pmax_3", "role": "o_ap_vld" }} , 
 	{ "name": "pmax_2_i", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "pmax_2", "role": "i" }} , 
 	{ "name": "pmax_2_o", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "pmax_2", "role": "o" }} , 
 	{ "name": "pmax_2_o_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "pmax_2", "role": "o_ap_vld" }} , 
 	{ "name": "pmax_1_i", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "pmax_1", "role": "i" }} , 
 	{ "name": "pmax_1_o", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "pmax_1", "role": "o" }} , 
 	{ "name": "pmax_1_o_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "pmax_1", "role": "o_ap_vld" }} , 
 	{ "name": "pmax_i", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "pmax", "role": "i" }} , 
 	{ "name": "pmax_o", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "pmax", "role": "o" }} , 
 	{ "name": "pmax_o_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "pmax", "role": "o_ap_vld" }} , 
 	{ "name": "sigmoid_lut_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":12, "type": "signal", "bundle":{"name": "sigmoid_lut", "role": "address0" }} , 
 	{ "name": "sigmoid_lut_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "sigmoid_lut", "role": "ce0" }} , 
 	{ "name": "sigmoid_lut_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "sigmoid_lut", "role": "q0" }} , 
 	{ "name": "grp_fu_3871_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_3871_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_3871_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_3871_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_3871_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "grp_fu_3871_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_3871_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_3871_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_3871_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_3871_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_3875_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_3875_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_3875_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_3875_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_3875_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_3875_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_3875_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_3875_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_3879_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_3879_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_3879_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_3879_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_3879_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_3879_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_3879_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_3879_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_3883_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_3883_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_3883_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_3883_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_3883_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_3883_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_3883_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_3883_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_3887_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_3887_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_3887_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_3887_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_3887_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_3887_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_3887_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_3887_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_3891_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_3891_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_3891_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_3891_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_3891_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_3891_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_3891_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_3891_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_3895_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_3895_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_3895_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_3895_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_3895_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_3895_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_3898_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_3898_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_3898_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_3898_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_3898_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_3898_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_346_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_346_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_346_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_346_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_346_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "grp_fu_346_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_346_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_346_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_346_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_346_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_3901_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_3901_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_3901_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_3901_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_3901_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "grp_fu_3901_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_3901_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_3901_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_3901_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_3901_p_ce", "role": "default" }} , 
 	{ "name": "grp_p_hls_fptosi_float_i32_fu_3905_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_p_hls_fptosi_float_i32_fu_3905_p_din1", "role": "default" }} , 
 	{ "name": "grp_p_hls_fptosi_float_i32_fu_3905_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_p_hls_fptosi_float_i32_fu_3905_p_dout0", "role": "default" }} , 
 	{ "name": "grp_p_hls_fptosi_float_i32_fu_3905_p_start", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_p_hls_fptosi_float_i32_fu_3905_p_start", "role": "default" }} , 
 	{ "name": "grp_p_hls_fptosi_float_i32_fu_3905_p_ready", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_p_hls_fptosi_float_i32_fu_3905_p_ready", "role": "default" }} , 
 	{ "name": "grp_p_hls_fptosi_float_i32_fu_3905_p_done", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_p_hls_fptosi_float_i32_fu_3905_p_done", "role": "default" }} , 
 	{ "name": "grp_p_hls_fptosi_float_i32_fu_3905_p_idle", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_p_hls_fptosi_float_i32_fu_3905_p_idle", "role": "default" }}  ]}

set ArgLastReadFirstWriteLatency {
	compute_gate_Pipeline_GATE_PASS1 {
		X1_cache {Type I LastRead 0 FirstWrite -1}
		X2_cache {Type I LastRead 26 FirstWrite -1}
		pmax_7 {Type IO LastRead 49 FirstWrite 52}
		pmax_6 {Type IO LastRead 49 FirstWrite 52}
		pmax_5 {Type IO LastRead 49 FirstWrite 52}
		pmax_4 {Type IO LastRead 49 FirstWrite 52}
		pmax_3 {Type IO LastRead 49 FirstWrite 52}
		pmax_2 {Type IO LastRead 49 FirstWrite 52}
		pmax_1 {Type IO LastRead 49 FirstWrite 52}
		pmax {Type IO LastRead 49 FirstWrite 52}
		sigmoid_lut {Type I LastRead 33 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "8245", "Max" : "8245"}
	, {"Name" : "Interval", "Min" : "8245", "Max" : "8245"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	X1_cache { ap_memory {  { X1_cache_address0 mem_address 1 15 }  { X1_cache_ce0 mem_ce 1 1 }  { X1_cache_q0 mem_dout 0 8 } } }
	X2_cache { ap_memory {  { X2_cache_address0 mem_address 1 15 }  { X2_cache_ce0 mem_ce 1 1 }  { X2_cache_q0 mem_dout 0 8 } } }
	pmax_7 { ap_ovld {  { pmax_7_i in_data 0 32 }  { pmax_7_o out_data 1 32 }  { pmax_7_o_ap_vld out_vld 1 1 } } }
	pmax_6 { ap_ovld {  { pmax_6_i in_data 0 32 }  { pmax_6_o out_data 1 32 }  { pmax_6_o_ap_vld out_vld 1 1 } } }
	pmax_5 { ap_ovld {  { pmax_5_i in_data 0 32 }  { pmax_5_o out_data 1 32 }  { pmax_5_o_ap_vld out_vld 1 1 } } }
	pmax_4 { ap_ovld {  { pmax_4_i in_data 0 32 }  { pmax_4_o out_data 1 32 }  { pmax_4_o_ap_vld out_vld 1 1 } } }
	pmax_3 { ap_ovld {  { pmax_3_i in_data 0 32 }  { pmax_3_o out_data 1 32 }  { pmax_3_o_ap_vld out_vld 1 1 } } }
	pmax_2 { ap_ovld {  { pmax_2_i in_data 0 32 }  { pmax_2_o out_data 1 32 }  { pmax_2_o_ap_vld out_vld 1 1 } } }
	pmax_1 { ap_ovld {  { pmax_1_i in_data 0 32 }  { pmax_1_o out_data 1 32 }  { pmax_1_o_ap_vld out_vld 1 1 } } }
	pmax { ap_ovld {  { pmax_i in_data 0 32 }  { pmax_o out_data 1 32 }  { pmax_o_ap_vld out_vld 1 1 } } }
	sigmoid_lut { ap_memory {  { sigmoid_lut_address0 mem_address 1 12 }  { sigmoid_lut_ce0 mem_ce 1 1 }  { sigmoid_lut_q0 mem_dout 0 32 } } }
}
