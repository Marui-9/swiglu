set moduleName mac_blocks_down_q6k5_Pipeline_VITIS_LOOP_614_4
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
set cdfgNum 39
set C_modelName {mac_blocks_down_q6k5_Pipeline_VITIS_LOOP_614_4}
set C_modelType { void 0 }
set ap_memory_interface_dict [dict create]
set C_modelArgList {
	{ total int 56 regular  }
	{ add_i_i14_lcssa_phi int 89 regular  }
	{ tmp_90 int 5 regular  }
	{ acc_local_load_reload int 32 regular  }
	{ acc_local_8_load_reload int 32 regular  }
	{ acc_local_16_load_reload int 32 regular  }
	{ acc_local_24_load_reload int 32 regular  }
	{ acc_local_1_load_reload int 32 regular  }
	{ acc_local_9_load_reload int 32 regular  }
	{ acc_local_17_load_reload int 32 regular  }
	{ acc_local_25_load_reload int 32 regular  }
	{ acc_local_2_load_reload int 32 regular  }
	{ acc_local_10_load_reload int 32 regular  }
	{ acc_local_18_load_reload int 32 regular  }
	{ acc_local_26_load_reload int 32 regular  }
	{ acc_local_3_load_reload int 32 regular  }
	{ acc_local_11_load_reload int 32 regular  }
	{ acc_local_19_load_reload int 32 regular  }
	{ acc_local_27_load_reload int 32 regular  }
	{ acc_local_4_load_reload int 32 regular  }
	{ acc_local_12_load_reload int 32 regular  }
	{ acc_local_20_load_reload int 32 regular  }
	{ acc_local_28_load_reload int 32 regular  }
	{ acc_local_5_load_reload int 32 regular  }
	{ acc_local_13_load_reload int 32 regular  }
	{ acc_local_21_load_reload int 32 regular  }
	{ acc_local_29_load_reload int 32 regular  }
	{ acc_local_6_load_reload int 32 regular  }
	{ acc_local_14_load_reload int 32 regular  }
	{ acc_local_22_load_reload int 32 regular  }
	{ acc_local_30_load_reload int 32 regular  }
	{ acc_local_7_load_reload int 32 regular  }
	{ acc_local_15_load_reload int 32 regular  }
	{ acc_local_23_load_reload int 32 regular  }
	{ acc_local_31_load_reload int 32 regular  }
	{ d_buf_0_val float 32 regular  }
	{ d_buf_1_val float 32 regular  }
	{ d_buf_2_val float 32 regular  }
	{ d_buf_3_val float 32 regular  }
	{ d_buf_4_val float 32 regular  }
	{ d_buf_5_val float 32 regular  }
	{ d_buf_6_val float 32 regular  }
	{ d_buf_7_val float 32 regular  }
	{ d_buf_8_val float 32 regular  }
	{ d_buf_9_val float 32 regular  }
	{ d_buf_10_val float 32 regular  }
	{ d_buf_11_val float 32 regular  }
	{ d_buf_12_val float 32 regular  }
	{ d_buf_13_val float 32 regular  }
	{ d_buf_14_val float 32 regular  }
	{ d_buf_15_val float 32 regular  }
	{ d_buf_16_val float 32 regular  }
	{ d_buf_17_val float 32 regular  }
	{ d_buf_18_val float 32 regular  }
	{ d_buf_19_val float 32 regular  }
	{ d_buf_20_val float 32 regular  }
	{ d_buf_21_val float 32 regular  }
	{ d_buf_22_val float 32 regular  }
	{ d_buf_23_val float 32 regular  }
	{ d_buf_24_val float 32 regular  }
	{ d_buf_25_val float 32 regular  }
	{ d_buf_26_val float 32 regular  }
	{ d_buf_27_val float 32 regular  }
	{ d_buf_28_val float 32 regular  }
	{ d_buf_29_val float 32 regular  }
	{ d_buf_30_val float 32 regular  }
	{ d_buf_31_val float 32 regular  }
	{ add_i_i14_phi_out int 89 regular {pointer 1}  }
}
set hasAXIMCache 0
set l_AXIML2Cache [list]
set AXIMCacheInstDict [dict create]
set C_modelArgMapList {[ 
	{ "Name" : "total", "interface" : "wire", "bitwidth" : 56, "direction" : "READONLY"} , 
 	{ "Name" : "add_i_i14_lcssa_phi", "interface" : "wire", "bitwidth" : 89, "direction" : "READONLY"} , 
 	{ "Name" : "tmp_90", "interface" : "wire", "bitwidth" : 5, "direction" : "READONLY"} , 
 	{ "Name" : "acc_local_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_local_8_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_local_16_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_local_24_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_local_1_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_local_9_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_local_17_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_local_25_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_local_2_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_local_10_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_local_18_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_local_26_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_local_3_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_local_11_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_local_19_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_local_27_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_local_4_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_local_12_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_local_20_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_local_28_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_local_5_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_local_13_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_local_21_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_local_29_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_local_6_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_local_14_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_local_22_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_local_30_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_local_7_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_local_15_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_local_23_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_local_31_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "d_buf_0_val", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "d_buf_1_val", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "d_buf_2_val", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "d_buf_3_val", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "d_buf_4_val", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "d_buf_5_val", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "d_buf_6_val", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "d_buf_7_val", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "d_buf_8_val", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "d_buf_9_val", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "d_buf_10_val", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "d_buf_11_val", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "d_buf_12_val", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "d_buf_13_val", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "d_buf_14_val", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "d_buf_15_val", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "d_buf_16_val", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "d_buf_17_val", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "d_buf_18_val", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "d_buf_19_val", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "d_buf_20_val", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "d_buf_21_val", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "d_buf_22_val", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "d_buf_23_val", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "d_buf_24_val", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "d_buf_25_val", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "d_buf_26_val", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "d_buf_27_val", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "d_buf_28_val", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "d_buf_29_val", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "d_buf_30_val", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "d_buf_31_val", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "add_i_i14_phi_out", "interface" : "wire", "bitwidth" : 89, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 75
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ total sc_in sc_lv 56 signal 0 } 
	{ add_i_i14_lcssa_phi sc_in sc_lv 89 signal 1 } 
	{ tmp_90 sc_in sc_lv 5 signal 2 } 
	{ acc_local_load_reload sc_in sc_lv 32 signal 3 } 
	{ acc_local_8_load_reload sc_in sc_lv 32 signal 4 } 
	{ acc_local_16_load_reload sc_in sc_lv 32 signal 5 } 
	{ acc_local_24_load_reload sc_in sc_lv 32 signal 6 } 
	{ acc_local_1_load_reload sc_in sc_lv 32 signal 7 } 
	{ acc_local_9_load_reload sc_in sc_lv 32 signal 8 } 
	{ acc_local_17_load_reload sc_in sc_lv 32 signal 9 } 
	{ acc_local_25_load_reload sc_in sc_lv 32 signal 10 } 
	{ acc_local_2_load_reload sc_in sc_lv 32 signal 11 } 
	{ acc_local_10_load_reload sc_in sc_lv 32 signal 12 } 
	{ acc_local_18_load_reload sc_in sc_lv 32 signal 13 } 
	{ acc_local_26_load_reload sc_in sc_lv 32 signal 14 } 
	{ acc_local_3_load_reload sc_in sc_lv 32 signal 15 } 
	{ acc_local_11_load_reload sc_in sc_lv 32 signal 16 } 
	{ acc_local_19_load_reload sc_in sc_lv 32 signal 17 } 
	{ acc_local_27_load_reload sc_in sc_lv 32 signal 18 } 
	{ acc_local_4_load_reload sc_in sc_lv 32 signal 19 } 
	{ acc_local_12_load_reload sc_in sc_lv 32 signal 20 } 
	{ acc_local_20_load_reload sc_in sc_lv 32 signal 21 } 
	{ acc_local_28_load_reload sc_in sc_lv 32 signal 22 } 
	{ acc_local_5_load_reload sc_in sc_lv 32 signal 23 } 
	{ acc_local_13_load_reload sc_in sc_lv 32 signal 24 } 
	{ acc_local_21_load_reload sc_in sc_lv 32 signal 25 } 
	{ acc_local_29_load_reload sc_in sc_lv 32 signal 26 } 
	{ acc_local_6_load_reload sc_in sc_lv 32 signal 27 } 
	{ acc_local_14_load_reload sc_in sc_lv 32 signal 28 } 
	{ acc_local_22_load_reload sc_in sc_lv 32 signal 29 } 
	{ acc_local_30_load_reload sc_in sc_lv 32 signal 30 } 
	{ acc_local_7_load_reload sc_in sc_lv 32 signal 31 } 
	{ acc_local_15_load_reload sc_in sc_lv 32 signal 32 } 
	{ acc_local_23_load_reload sc_in sc_lv 32 signal 33 } 
	{ acc_local_31_load_reload sc_in sc_lv 32 signal 34 } 
	{ d_buf_0_val sc_in sc_lv 32 signal 35 } 
	{ d_buf_1_val sc_in sc_lv 32 signal 36 } 
	{ d_buf_2_val sc_in sc_lv 32 signal 37 } 
	{ d_buf_3_val sc_in sc_lv 32 signal 38 } 
	{ d_buf_4_val sc_in sc_lv 32 signal 39 } 
	{ d_buf_5_val sc_in sc_lv 32 signal 40 } 
	{ d_buf_6_val sc_in sc_lv 32 signal 41 } 
	{ d_buf_7_val sc_in sc_lv 32 signal 42 } 
	{ d_buf_8_val sc_in sc_lv 32 signal 43 } 
	{ d_buf_9_val sc_in sc_lv 32 signal 44 } 
	{ d_buf_10_val sc_in sc_lv 32 signal 45 } 
	{ d_buf_11_val sc_in sc_lv 32 signal 46 } 
	{ d_buf_12_val sc_in sc_lv 32 signal 47 } 
	{ d_buf_13_val sc_in sc_lv 32 signal 48 } 
	{ d_buf_14_val sc_in sc_lv 32 signal 49 } 
	{ d_buf_15_val sc_in sc_lv 32 signal 50 } 
	{ d_buf_16_val sc_in sc_lv 32 signal 51 } 
	{ d_buf_17_val sc_in sc_lv 32 signal 52 } 
	{ d_buf_18_val sc_in sc_lv 32 signal 53 } 
	{ d_buf_19_val sc_in sc_lv 32 signal 54 } 
	{ d_buf_20_val sc_in sc_lv 32 signal 55 } 
	{ d_buf_21_val sc_in sc_lv 32 signal 56 } 
	{ d_buf_22_val sc_in sc_lv 32 signal 57 } 
	{ d_buf_23_val sc_in sc_lv 32 signal 58 } 
	{ d_buf_24_val sc_in sc_lv 32 signal 59 } 
	{ d_buf_25_val sc_in sc_lv 32 signal 60 } 
	{ d_buf_26_val sc_in sc_lv 32 signal 61 } 
	{ d_buf_27_val sc_in sc_lv 32 signal 62 } 
	{ d_buf_28_val sc_in sc_lv 32 signal 63 } 
	{ d_buf_29_val sc_in sc_lv 32 signal 64 } 
	{ d_buf_30_val sc_in sc_lv 32 signal 65 } 
	{ d_buf_31_val sc_in sc_lv 32 signal 66 } 
	{ add_i_i14_phi_out sc_out sc_lv 89 signal 67 } 
	{ add_i_i14_phi_out_ap_vld sc_out sc_logic 1 outvld 67 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "total", "direction": "in", "datatype": "sc_lv", "bitwidth":56, "type": "signal", "bundle":{"name": "total", "role": "default" }} , 
 	{ "name": "add_i_i14_lcssa_phi", "direction": "in", "datatype": "sc_lv", "bitwidth":89, "type": "signal", "bundle":{"name": "add_i_i14_lcssa_phi", "role": "default" }} , 
 	{ "name": "tmp_90", "direction": "in", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "tmp_90", "role": "default" }} , 
 	{ "name": "acc_local_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_local_load_reload", "role": "default" }} , 
 	{ "name": "acc_local_8_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_local_8_load_reload", "role": "default" }} , 
 	{ "name": "acc_local_16_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_local_16_load_reload", "role": "default" }} , 
 	{ "name": "acc_local_24_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_local_24_load_reload", "role": "default" }} , 
 	{ "name": "acc_local_1_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_local_1_load_reload", "role": "default" }} , 
 	{ "name": "acc_local_9_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_local_9_load_reload", "role": "default" }} , 
 	{ "name": "acc_local_17_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_local_17_load_reload", "role": "default" }} , 
 	{ "name": "acc_local_25_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_local_25_load_reload", "role": "default" }} , 
 	{ "name": "acc_local_2_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_local_2_load_reload", "role": "default" }} , 
 	{ "name": "acc_local_10_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_local_10_load_reload", "role": "default" }} , 
 	{ "name": "acc_local_18_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_local_18_load_reload", "role": "default" }} , 
 	{ "name": "acc_local_26_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_local_26_load_reload", "role": "default" }} , 
 	{ "name": "acc_local_3_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_local_3_load_reload", "role": "default" }} , 
 	{ "name": "acc_local_11_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_local_11_load_reload", "role": "default" }} , 
 	{ "name": "acc_local_19_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_local_19_load_reload", "role": "default" }} , 
 	{ "name": "acc_local_27_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_local_27_load_reload", "role": "default" }} , 
 	{ "name": "acc_local_4_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_local_4_load_reload", "role": "default" }} , 
 	{ "name": "acc_local_12_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_local_12_load_reload", "role": "default" }} , 
 	{ "name": "acc_local_20_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_local_20_load_reload", "role": "default" }} , 
 	{ "name": "acc_local_28_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_local_28_load_reload", "role": "default" }} , 
 	{ "name": "acc_local_5_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_local_5_load_reload", "role": "default" }} , 
 	{ "name": "acc_local_13_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_local_13_load_reload", "role": "default" }} , 
 	{ "name": "acc_local_21_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_local_21_load_reload", "role": "default" }} , 
 	{ "name": "acc_local_29_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_local_29_load_reload", "role": "default" }} , 
 	{ "name": "acc_local_6_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_local_6_load_reload", "role": "default" }} , 
 	{ "name": "acc_local_14_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_local_14_load_reload", "role": "default" }} , 
 	{ "name": "acc_local_22_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_local_22_load_reload", "role": "default" }} , 
 	{ "name": "acc_local_30_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_local_30_load_reload", "role": "default" }} , 
 	{ "name": "acc_local_7_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_local_7_load_reload", "role": "default" }} , 
 	{ "name": "acc_local_15_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_local_15_load_reload", "role": "default" }} , 
 	{ "name": "acc_local_23_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_local_23_load_reload", "role": "default" }} , 
 	{ "name": "acc_local_31_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_local_31_load_reload", "role": "default" }} , 
 	{ "name": "d_buf_0_val", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "d_buf_0_val", "role": "default" }} , 
 	{ "name": "d_buf_1_val", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "d_buf_1_val", "role": "default" }} , 
 	{ "name": "d_buf_2_val", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "d_buf_2_val", "role": "default" }} , 
 	{ "name": "d_buf_3_val", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "d_buf_3_val", "role": "default" }} , 
 	{ "name": "d_buf_4_val", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "d_buf_4_val", "role": "default" }} , 
 	{ "name": "d_buf_5_val", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "d_buf_5_val", "role": "default" }} , 
 	{ "name": "d_buf_6_val", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "d_buf_6_val", "role": "default" }} , 
 	{ "name": "d_buf_7_val", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "d_buf_7_val", "role": "default" }} , 
 	{ "name": "d_buf_8_val", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "d_buf_8_val", "role": "default" }} , 
 	{ "name": "d_buf_9_val", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "d_buf_9_val", "role": "default" }} , 
 	{ "name": "d_buf_10_val", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "d_buf_10_val", "role": "default" }} , 
 	{ "name": "d_buf_11_val", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "d_buf_11_val", "role": "default" }} , 
 	{ "name": "d_buf_12_val", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "d_buf_12_val", "role": "default" }} , 
 	{ "name": "d_buf_13_val", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "d_buf_13_val", "role": "default" }} , 
 	{ "name": "d_buf_14_val", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "d_buf_14_val", "role": "default" }} , 
 	{ "name": "d_buf_15_val", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "d_buf_15_val", "role": "default" }} , 
 	{ "name": "d_buf_16_val", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "d_buf_16_val", "role": "default" }} , 
 	{ "name": "d_buf_17_val", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "d_buf_17_val", "role": "default" }} , 
 	{ "name": "d_buf_18_val", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "d_buf_18_val", "role": "default" }} , 
 	{ "name": "d_buf_19_val", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "d_buf_19_val", "role": "default" }} , 
 	{ "name": "d_buf_20_val", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "d_buf_20_val", "role": "default" }} , 
 	{ "name": "d_buf_21_val", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "d_buf_21_val", "role": "default" }} , 
 	{ "name": "d_buf_22_val", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "d_buf_22_val", "role": "default" }} , 
 	{ "name": "d_buf_23_val", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "d_buf_23_val", "role": "default" }} , 
 	{ "name": "d_buf_24_val", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "d_buf_24_val", "role": "default" }} , 
 	{ "name": "d_buf_25_val", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "d_buf_25_val", "role": "default" }} , 
 	{ "name": "d_buf_26_val", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "d_buf_26_val", "role": "default" }} , 
 	{ "name": "d_buf_27_val", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "d_buf_27_val", "role": "default" }} , 
 	{ "name": "d_buf_28_val", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "d_buf_28_val", "role": "default" }} , 
 	{ "name": "d_buf_29_val", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "d_buf_29_val", "role": "default" }} , 
 	{ "name": "d_buf_30_val", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "d_buf_30_val", "role": "default" }} , 
 	{ "name": "d_buf_31_val", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "d_buf_31_val", "role": "default" }} , 
 	{ "name": "add_i_i14_phi_out", "direction": "out", "datatype": "sc_lv", "bitwidth":89, "type": "signal", "bundle":{"name": "add_i_i14_phi_out", "role": "default" }} , 
 	{ "name": "add_i_i14_phi_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "add_i_i14_phi_out", "role": "ap_vld" }}  ]}

set ArgLastReadFirstWriteLatency {
	mac_blocks_down_q6k5_Pipeline_VITIS_LOOP_614_4 {
		total {Type I LastRead 0 FirstWrite -1}
		add_i_i14_lcssa_phi {Type I LastRead 0 FirstWrite -1}
		tmp_90 {Type I LastRead 0 FirstWrite -1}
		acc_local_load_reload {Type I LastRead 0 FirstWrite -1}
		acc_local_8_load_reload {Type I LastRead 0 FirstWrite -1}
		acc_local_16_load_reload {Type I LastRead 0 FirstWrite -1}
		acc_local_24_load_reload {Type I LastRead 0 FirstWrite -1}
		acc_local_1_load_reload {Type I LastRead 0 FirstWrite -1}
		acc_local_9_load_reload {Type I LastRead 0 FirstWrite -1}
		acc_local_17_load_reload {Type I LastRead 0 FirstWrite -1}
		acc_local_25_load_reload {Type I LastRead 0 FirstWrite -1}
		acc_local_2_load_reload {Type I LastRead 0 FirstWrite -1}
		acc_local_10_load_reload {Type I LastRead 0 FirstWrite -1}
		acc_local_18_load_reload {Type I LastRead 0 FirstWrite -1}
		acc_local_26_load_reload {Type I LastRead 0 FirstWrite -1}
		acc_local_3_load_reload {Type I LastRead 0 FirstWrite -1}
		acc_local_11_load_reload {Type I LastRead 0 FirstWrite -1}
		acc_local_19_load_reload {Type I LastRead 0 FirstWrite -1}
		acc_local_27_load_reload {Type I LastRead 0 FirstWrite -1}
		acc_local_4_load_reload {Type I LastRead 0 FirstWrite -1}
		acc_local_12_load_reload {Type I LastRead 0 FirstWrite -1}
		acc_local_20_load_reload {Type I LastRead 0 FirstWrite -1}
		acc_local_28_load_reload {Type I LastRead 0 FirstWrite -1}
		acc_local_5_load_reload {Type I LastRead 0 FirstWrite -1}
		acc_local_13_load_reload {Type I LastRead 0 FirstWrite -1}
		acc_local_21_load_reload {Type I LastRead 0 FirstWrite -1}
		acc_local_29_load_reload {Type I LastRead 0 FirstWrite -1}
		acc_local_6_load_reload {Type I LastRead 0 FirstWrite -1}
		acc_local_14_load_reload {Type I LastRead 0 FirstWrite -1}
		acc_local_22_load_reload {Type I LastRead 0 FirstWrite -1}
		acc_local_30_load_reload {Type I LastRead 0 FirstWrite -1}
		acc_local_7_load_reload {Type I LastRead 0 FirstWrite -1}
		acc_local_15_load_reload {Type I LastRead 0 FirstWrite -1}
		acc_local_23_load_reload {Type I LastRead 0 FirstWrite -1}
		acc_local_31_load_reload {Type I LastRead 0 FirstWrite -1}
		d_buf_0_val {Type I LastRead 0 FirstWrite -1}
		d_buf_1_val {Type I LastRead 0 FirstWrite -1}
		d_buf_2_val {Type I LastRead 0 FirstWrite -1}
		d_buf_3_val {Type I LastRead 0 FirstWrite -1}
		d_buf_4_val {Type I LastRead 0 FirstWrite -1}
		d_buf_5_val {Type I LastRead 0 FirstWrite -1}
		d_buf_6_val {Type I LastRead 0 FirstWrite -1}
		d_buf_7_val {Type I LastRead 0 FirstWrite -1}
		d_buf_8_val {Type I LastRead 0 FirstWrite -1}
		d_buf_9_val {Type I LastRead 0 FirstWrite -1}
		d_buf_10_val {Type I LastRead 0 FirstWrite -1}
		d_buf_11_val {Type I LastRead 0 FirstWrite -1}
		d_buf_12_val {Type I LastRead 0 FirstWrite -1}
		d_buf_13_val {Type I LastRead 0 FirstWrite -1}
		d_buf_14_val {Type I LastRead 0 FirstWrite -1}
		d_buf_15_val {Type I LastRead 0 FirstWrite -1}
		d_buf_16_val {Type I LastRead 0 FirstWrite -1}
		d_buf_17_val {Type I LastRead 0 FirstWrite -1}
		d_buf_18_val {Type I LastRead 0 FirstWrite -1}
		d_buf_19_val {Type I LastRead 0 FirstWrite -1}
		d_buf_20_val {Type I LastRead 0 FirstWrite -1}
		d_buf_21_val {Type I LastRead 0 FirstWrite -1}
		d_buf_22_val {Type I LastRead 0 FirstWrite -1}
		d_buf_23_val {Type I LastRead 0 FirstWrite -1}
		d_buf_24_val {Type I LastRead 0 FirstWrite -1}
		d_buf_25_val {Type I LastRead 0 FirstWrite -1}
		d_buf_26_val {Type I LastRead 0 FirstWrite -1}
		d_buf_27_val {Type I LastRead 0 FirstWrite -1}
		d_buf_28_val {Type I LastRead 0 FirstWrite -1}
		d_buf_29_val {Type I LastRead 0 FirstWrite -1}
		d_buf_30_val {Type I LastRead 0 FirstWrite -1}
		d_buf_31_val {Type I LastRead 0 FirstWrite -1}
		add_i_i14_phi_out {Type O LastRead -1 FirstWrite 9}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "15", "Max" : "15"}
	, {"Name" : "Interval", "Min" : "15", "Max" : "15"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	total { ap_none {  { total in_data 0 56 } } }
	add_i_i14_lcssa_phi { ap_none {  { add_i_i14_lcssa_phi in_data 0 89 } } }
	tmp_90 { ap_none {  { tmp_90 in_data 0 5 } } }
	acc_local_load_reload { ap_none {  { acc_local_load_reload in_data 0 32 } } }
	acc_local_8_load_reload { ap_none {  { acc_local_8_load_reload in_data 0 32 } } }
	acc_local_16_load_reload { ap_none {  { acc_local_16_load_reload in_data 0 32 } } }
	acc_local_24_load_reload { ap_none {  { acc_local_24_load_reload in_data 0 32 } } }
	acc_local_1_load_reload { ap_none {  { acc_local_1_load_reload in_data 0 32 } } }
	acc_local_9_load_reload { ap_none {  { acc_local_9_load_reload in_data 0 32 } } }
	acc_local_17_load_reload { ap_none {  { acc_local_17_load_reload in_data 0 32 } } }
	acc_local_25_load_reload { ap_none {  { acc_local_25_load_reload in_data 0 32 } } }
	acc_local_2_load_reload { ap_none {  { acc_local_2_load_reload in_data 0 32 } } }
	acc_local_10_load_reload { ap_none {  { acc_local_10_load_reload in_data 0 32 } } }
	acc_local_18_load_reload { ap_none {  { acc_local_18_load_reload in_data 0 32 } } }
	acc_local_26_load_reload { ap_none {  { acc_local_26_load_reload in_data 0 32 } } }
	acc_local_3_load_reload { ap_none {  { acc_local_3_load_reload in_data 0 32 } } }
	acc_local_11_load_reload { ap_none {  { acc_local_11_load_reload in_data 0 32 } } }
	acc_local_19_load_reload { ap_none {  { acc_local_19_load_reload in_data 0 32 } } }
	acc_local_27_load_reload { ap_none {  { acc_local_27_load_reload in_data 0 32 } } }
	acc_local_4_load_reload { ap_none {  { acc_local_4_load_reload in_data 0 32 } } }
	acc_local_12_load_reload { ap_none {  { acc_local_12_load_reload in_data 0 32 } } }
	acc_local_20_load_reload { ap_none {  { acc_local_20_load_reload in_data 0 32 } } }
	acc_local_28_load_reload { ap_none {  { acc_local_28_load_reload in_data 0 32 } } }
	acc_local_5_load_reload { ap_none {  { acc_local_5_load_reload in_data 0 32 } } }
	acc_local_13_load_reload { ap_none {  { acc_local_13_load_reload in_data 0 32 } } }
	acc_local_21_load_reload { ap_none {  { acc_local_21_load_reload in_data 0 32 } } }
	acc_local_29_load_reload { ap_none {  { acc_local_29_load_reload in_data 0 32 } } }
	acc_local_6_load_reload { ap_none {  { acc_local_6_load_reload in_data 0 32 } } }
	acc_local_14_load_reload { ap_none {  { acc_local_14_load_reload in_data 0 32 } } }
	acc_local_22_load_reload { ap_none {  { acc_local_22_load_reload in_data 0 32 } } }
	acc_local_30_load_reload { ap_none {  { acc_local_30_load_reload in_data 0 32 } } }
	acc_local_7_load_reload { ap_none {  { acc_local_7_load_reload in_data 0 32 } } }
	acc_local_15_load_reload { ap_none {  { acc_local_15_load_reload in_data 0 32 } } }
	acc_local_23_load_reload { ap_none {  { acc_local_23_load_reload in_data 0 32 } } }
	acc_local_31_load_reload { ap_none {  { acc_local_31_load_reload in_data 0 32 } } }
	d_buf_0_val { ap_none {  { d_buf_0_val in_data 0 32 } } }
	d_buf_1_val { ap_none {  { d_buf_1_val in_data 0 32 } } }
	d_buf_2_val { ap_none {  { d_buf_2_val in_data 0 32 } } }
	d_buf_3_val { ap_none {  { d_buf_3_val in_data 0 32 } } }
	d_buf_4_val { ap_none {  { d_buf_4_val in_data 0 32 } } }
	d_buf_5_val { ap_none {  { d_buf_5_val in_data 0 32 } } }
	d_buf_6_val { ap_none {  { d_buf_6_val in_data 0 32 } } }
	d_buf_7_val { ap_none {  { d_buf_7_val in_data 0 32 } } }
	d_buf_8_val { ap_none {  { d_buf_8_val in_data 0 32 } } }
	d_buf_9_val { ap_none {  { d_buf_9_val in_data 0 32 } } }
	d_buf_10_val { ap_none {  { d_buf_10_val in_data 0 32 } } }
	d_buf_11_val { ap_none {  { d_buf_11_val in_data 0 32 } } }
	d_buf_12_val { ap_none {  { d_buf_12_val in_data 0 32 } } }
	d_buf_13_val { ap_none {  { d_buf_13_val in_data 0 32 } } }
	d_buf_14_val { ap_none {  { d_buf_14_val in_data 0 32 } } }
	d_buf_15_val { ap_none {  { d_buf_15_val in_data 0 32 } } }
	d_buf_16_val { ap_none {  { d_buf_16_val in_data 0 32 } } }
	d_buf_17_val { ap_none {  { d_buf_17_val in_data 0 32 } } }
	d_buf_18_val { ap_none {  { d_buf_18_val in_data 0 32 } } }
	d_buf_19_val { ap_none {  { d_buf_19_val in_data 0 32 } } }
	d_buf_20_val { ap_none {  { d_buf_20_val in_data 0 32 } } }
	d_buf_21_val { ap_none {  { d_buf_21_val in_data 0 32 } } }
	d_buf_22_val { ap_none {  { d_buf_22_val in_data 0 32 } } }
	d_buf_23_val { ap_none {  { d_buf_23_val in_data 0 32 } } }
	d_buf_24_val { ap_none {  { d_buf_24_val in_data 0 32 } } }
	d_buf_25_val { ap_none {  { d_buf_25_val in_data 0 32 } } }
	d_buf_26_val { ap_none {  { d_buf_26_val in_data 0 32 } } }
	d_buf_27_val { ap_none {  { d_buf_27_val in_data 0 32 } } }
	d_buf_28_val { ap_none {  { d_buf_28_val in_data 0 32 } } }
	d_buf_29_val { ap_none {  { d_buf_29_val in_data 0 32 } } }
	d_buf_30_val { ap_none {  { d_buf_30_val in_data 0 32 } } }
	d_buf_31_val { ap_none {  { d_buf_31_val in_data 0 32 } } }
	add_i_i14_phi_out { ap_vld {  { add_i_i14_phi_out out_data 1 89 }  { add_i_i14_phi_out_ap_vld out_vld 1 1 } } }
}
