set moduleName mac_blocks_wv_k2_Pipeline_REDUCE_K2
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
set cdfgNum 30
set C_modelName {mac_blocks_wv_k2_Pipeline_REDUCE_K2}
set C_modelType { void 0 }
set ap_memory_interface_dict [dict create]
set C_modelArgList {
	{ int_acc_w0_load_reload int 32 regular  }
	{ int_acc_w0_4_load_reload int 32 regular  }
	{ int_acc_w0_8_load_reload int 32 regular  }
	{ int_acc_w0_12_load_reload int 32 regular  }
	{ int_acc_w0_16_load_reload int 32 regular  }
	{ int_acc_w0_20_load_reload int 32 regular  }
	{ int_acc_w0_24_load_reload int 32 regular  }
	{ int_acc_w0_28_load_reload int 32 regular  }
	{ int_acc_m0_load_reload int 32 regular  }
	{ int_acc_m0_4_load_reload int 32 regular  }
	{ int_acc_m0_8_load_reload int 32 regular  }
	{ int_acc_m0_12_load_reload int 32 regular  }
	{ int_acc_m0_16_load_reload int 32 regular  }
	{ int_acc_m0_20_load_reload int 32 regular  }
	{ int_acc_m0_24_load_reload int 32 regular  }
	{ int_acc_m0_28_load_reload int 32 regular  }
	{ int_acc_w1_load_reload int 32 regular  }
	{ int_acc_w1_4_load_reload int 32 regular  }
	{ int_acc_w1_8_load_reload int 32 regular  }
	{ int_acc_w1_12_load_reload int 32 regular  }
	{ int_acc_w1_16_load_reload int 32 regular  }
	{ int_acc_w1_20_load_reload int 32 regular  }
	{ int_acc_w1_24_load_reload int 32 regular  }
	{ int_acc_w1_28_load_reload int 32 regular  }
	{ int_acc_m1_load_reload int 32 regular  }
	{ int_acc_m1_4_load_reload int 32 regular  }
	{ int_acc_m1_8_load_reload int 32 regular  }
	{ int_acc_m1_12_load_reload int 32 regular  }
	{ int_acc_m1_16_load_reload int 32 regular  }
	{ int_acc_m1_20_load_reload int 32 regular  }
	{ int_acc_m1_24_load_reload int 32 regular  }
	{ int_acc_m1_28_load_reload int 32 regular  }
	{ int_acc_w0_1_load_reload int 32 regular  }
	{ int_acc_w0_5_load_reload int 32 regular  }
	{ int_acc_w0_9_load_reload int 32 regular  }
	{ int_acc_w0_13_load_reload int 32 regular  }
	{ int_acc_w0_17_load_reload int 32 regular  }
	{ int_acc_w0_21_load_reload int 32 regular  }
	{ int_acc_w0_25_load_reload int 32 regular  }
	{ int_acc_w0_29_load_reload int 32 regular  }
	{ int_acc_m0_1_load_reload int 32 regular  }
	{ int_acc_m0_5_load_reload int 32 regular  }
	{ int_acc_m0_9_load_reload int 32 regular  }
	{ int_acc_m0_13_load_reload int 32 regular  }
	{ int_acc_m0_17_load_reload int 32 regular  }
	{ int_acc_m0_21_load_reload int 32 regular  }
	{ int_acc_m0_25_load_reload int 32 regular  }
	{ int_acc_m0_29_load_reload int 32 regular  }
	{ int_acc_w1_1_load_reload int 32 regular  }
	{ int_acc_w1_5_load_reload int 32 regular  }
	{ int_acc_w1_9_load_reload int 32 regular  }
	{ int_acc_w1_13_load_reload int 32 regular  }
	{ int_acc_w1_17_load_reload int 32 regular  }
	{ int_acc_w1_21_load_reload int 32 regular  }
	{ int_acc_w1_25_load_reload int 32 regular  }
	{ int_acc_w1_29_load_reload int 32 regular  }
	{ int_acc_m1_1_load_reload int 32 regular  }
	{ int_acc_m1_5_load_reload int 32 regular  }
	{ int_acc_m1_9_load_reload int 32 regular  }
	{ int_acc_m1_13_load_reload int 32 regular  }
	{ int_acc_m1_17_load_reload int 32 regular  }
	{ int_acc_m1_21_load_reload int 32 regular  }
	{ int_acc_m1_25_load_reload int 32 regular  }
	{ int_acc_m1_29_load_reload int 32 regular  }
	{ int_acc_w0_2_load_reload int 32 regular  }
	{ int_acc_w0_6_load_reload int 32 regular  }
	{ int_acc_w0_10_load_reload int 32 regular  }
	{ int_acc_w0_14_load_reload int 32 regular  }
	{ int_acc_w0_18_load_reload int 32 regular  }
	{ int_acc_w0_22_load_reload int 32 regular  }
	{ int_acc_w0_26_load_reload int 32 regular  }
	{ int_acc_w0_30_load_reload int 32 regular  }
	{ int_acc_m0_2_load_reload int 32 regular  }
	{ int_acc_m0_6_load_reload int 32 regular  }
	{ int_acc_m0_10_load_reload int 32 regular  }
	{ int_acc_m0_14_load_reload int 32 regular  }
	{ int_acc_m0_18_load_reload int 32 regular  }
	{ int_acc_m0_22_load_reload int 32 regular  }
	{ int_acc_m0_26_load_reload int 32 regular  }
	{ int_acc_m0_30_load_reload int 32 regular  }
	{ int_acc_w1_2_load_reload int 32 regular  }
	{ int_acc_w1_6_load_reload int 32 regular  }
	{ int_acc_w1_10_load_reload int 32 regular  }
	{ int_acc_w1_14_load_reload int 32 regular  }
	{ int_acc_w1_18_load_reload int 32 regular  }
	{ int_acc_w1_22_load_reload int 32 regular  }
	{ int_acc_w1_26_load_reload int 32 regular  }
	{ int_acc_w1_30_load_reload int 32 regular  }
	{ int_acc_m1_2_load_reload int 32 regular  }
	{ int_acc_m1_6_load_reload int 32 regular  }
	{ int_acc_m1_10_load_reload int 32 regular  }
	{ int_acc_m1_14_load_reload int 32 regular  }
	{ int_acc_m1_18_load_reload int 32 regular  }
	{ int_acc_m1_22_load_reload int 32 regular  }
	{ int_acc_m1_26_load_reload int 32 regular  }
	{ int_acc_m1_30_load_reload int 32 regular  }
	{ int_acc_w0_3_load_reload int 32 regular  }
	{ int_acc_w0_7_load_reload int 32 regular  }
	{ int_acc_w0_11_load_reload int 32 regular  }
	{ int_acc_w0_15_load_reload int 32 regular  }
	{ int_acc_w0_19_load_reload int 32 regular  }
	{ int_acc_w0_23_load_reload int 32 regular  }
	{ int_acc_w0_27_load_reload int 32 regular  }
	{ int_acc_w0_31_load_reload int 32 regular  }
	{ int_acc_m0_3_load_reload int 32 regular  }
	{ int_acc_m0_7_load_reload int 32 regular  }
	{ int_acc_m0_11_load_reload int 32 regular  }
	{ int_acc_m0_15_load_reload int 32 regular  }
	{ int_acc_m0_19_load_reload int 32 regular  }
	{ int_acc_m0_23_load_reload int 32 regular  }
	{ int_acc_m0_27_load_reload int 32 regular  }
	{ int_acc_m0_31_load_reload int 32 regular  }
	{ int_acc_w1_3_load_reload int 32 regular  }
	{ int_acc_w1_7_load_reload int 32 regular  }
	{ int_acc_w1_11_load_reload int 32 regular  }
	{ int_acc_w1_15_load_reload int 32 regular  }
	{ int_acc_w1_19_load_reload int 32 regular  }
	{ int_acc_w1_23_load_reload int 32 regular  }
	{ int_acc_w1_27_load_reload int 32 regular  }
	{ int_acc_w1_31_load_reload int 32 regular  }
	{ int_acc_m1_3_load_reload int 32 regular  }
	{ int_acc_m1_7_load_reload int 32 regular  }
	{ int_acc_m1_11_load_reload int 32 regular  }
	{ int_acc_m1_15_load_reload int 32 regular  }
	{ int_acc_m1_19_load_reload int 32 regular  }
	{ int_acc_m1_23_load_reload int 32 regular  }
	{ int_acc_m1_27_load_reload int 32 regular  }
	{ int_acc_m1_31_load_reload int 32 regular  }
	{ mux_case_09851_reload float 32 regular  }
	{ mux_case_19864_reload float 32 regular  }
	{ mux_case_29877_reload float 32 regular  }
	{ mux_case_398810_reload float 32 regular  }
	{ mux_case_498913_reload float 32 regular  }
	{ mux_case_599016_reload float 32 regular  }
	{ mux_case_699119_reload float 32 regular  }
	{ mux_case_799222_reload float 32 regular  }
	{ mux_case_099326_reload float 32 regular  }
	{ mux_case_199429_reload float 32 regular  }
	{ mux_case_299532_reload float 32 regular  }
	{ mux_case_399635_reload float 32 regular  }
	{ mux_case_499738_reload float 32 regular  }
	{ mux_case_599841_reload float 32 regular  }
	{ mux_case_699944_reload float 32 regular  }
	{ mux_case_7100047_reload float 32 regular  }
	{ mux_case_0100150_reload float 32 regular  }
	{ mux_case_1100253_reload float 32 regular  }
	{ mux_case_2100356_reload float 32 regular  }
	{ mux_case_3100459_reload float 32 regular  }
	{ mux_case_4100562_reload float 32 regular  }
	{ mux_case_5100665_reload float 32 regular  }
	{ mux_case_6100768_reload float 32 regular  }
	{ mux_case_7100871_reload float 32 regular  }
	{ mux_case_0100974_reload float 32 regular  }
	{ mux_case_1101077_reload float 32 regular  }
	{ mux_case_2101180_reload float 32 regular  }
	{ mux_case_3101283_reload float 32 regular  }
	{ mux_case_4101386_reload float 32 regular  }
	{ mux_case_5101489_reload float 32 regular  }
	{ mux_case_6101592_reload float 32 regular  }
	{ mux_case_7101695_reload float 32 regular  }
	{ total1_out int 56 regular {pointer 1}  }
	{ total0_out int 56 regular {pointer 1}  }
}
set hasAXIMCache 0
set l_AXIML2Cache [list]
set AXIMCacheInstDict [dict create]
set C_modelArgMapList {[ 
	{ "Name" : "int_acc_w0_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_w0_4_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_w0_8_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_w0_12_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_w0_16_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_w0_20_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_w0_24_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_w0_28_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_m0_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_m0_4_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_m0_8_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_m0_12_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_m0_16_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_m0_20_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_m0_24_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_m0_28_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_w1_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_w1_4_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_w1_8_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_w1_12_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_w1_16_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_w1_20_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_w1_24_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_w1_28_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_m1_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_m1_4_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_m1_8_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_m1_12_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_m1_16_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_m1_20_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_m1_24_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_m1_28_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_w0_1_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_w0_5_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_w0_9_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_w0_13_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_w0_17_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_w0_21_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_w0_25_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_w0_29_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_m0_1_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_m0_5_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_m0_9_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_m0_13_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_m0_17_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_m0_21_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_m0_25_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_m0_29_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_w1_1_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_w1_5_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_w1_9_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_w1_13_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_w1_17_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_w1_21_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_w1_25_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_w1_29_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_m1_1_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_m1_5_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_m1_9_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_m1_13_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_m1_17_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_m1_21_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_m1_25_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_m1_29_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_w0_2_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_w0_6_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_w0_10_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_w0_14_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_w0_18_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_w0_22_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_w0_26_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_w0_30_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_m0_2_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_m0_6_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_m0_10_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_m0_14_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_m0_18_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_m0_22_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_m0_26_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_m0_30_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_w1_2_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_w1_6_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_w1_10_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_w1_14_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_w1_18_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_w1_22_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_w1_26_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_w1_30_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_m1_2_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_m1_6_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_m1_10_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_m1_14_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_m1_18_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_m1_22_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_m1_26_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_m1_30_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_w0_3_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_w0_7_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_w0_11_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_w0_15_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_w0_19_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_w0_23_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_w0_27_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_w0_31_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_m0_3_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_m0_7_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_m0_11_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_m0_15_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_m0_19_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_m0_23_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_m0_27_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_m0_31_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_w1_3_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_w1_7_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_w1_11_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_w1_15_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_w1_19_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_w1_23_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_w1_27_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_w1_31_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_m1_3_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_m1_7_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_m1_11_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_m1_15_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_m1_19_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_m1_23_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_m1_27_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_m1_31_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "mux_case_09851_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "mux_case_19864_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "mux_case_29877_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "mux_case_398810_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "mux_case_498913_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "mux_case_599016_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "mux_case_699119_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "mux_case_799222_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "mux_case_099326_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "mux_case_199429_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "mux_case_299532_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "mux_case_399635_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "mux_case_499738_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "mux_case_599841_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "mux_case_699944_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "mux_case_7100047_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "mux_case_0100150_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "mux_case_1100253_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "mux_case_2100356_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "mux_case_3100459_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "mux_case_4100562_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "mux_case_5100665_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "mux_case_6100768_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "mux_case_7100871_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "mux_case_0100974_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "mux_case_1101077_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "mux_case_2101180_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "mux_case_3101283_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "mux_case_4101386_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "mux_case_5101489_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "mux_case_6101592_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "mux_case_7101695_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "total1_out", "interface" : "wire", "bitwidth" : 56, "direction" : "WRITEONLY"} , 
 	{ "Name" : "total0_out", "interface" : "wire", "bitwidth" : 56, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 170
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ int_acc_w0_load_reload sc_in sc_lv 32 signal 0 } 
	{ int_acc_w0_4_load_reload sc_in sc_lv 32 signal 1 } 
	{ int_acc_w0_8_load_reload sc_in sc_lv 32 signal 2 } 
	{ int_acc_w0_12_load_reload sc_in sc_lv 32 signal 3 } 
	{ int_acc_w0_16_load_reload sc_in sc_lv 32 signal 4 } 
	{ int_acc_w0_20_load_reload sc_in sc_lv 32 signal 5 } 
	{ int_acc_w0_24_load_reload sc_in sc_lv 32 signal 6 } 
	{ int_acc_w0_28_load_reload sc_in sc_lv 32 signal 7 } 
	{ int_acc_m0_load_reload sc_in sc_lv 32 signal 8 } 
	{ int_acc_m0_4_load_reload sc_in sc_lv 32 signal 9 } 
	{ int_acc_m0_8_load_reload sc_in sc_lv 32 signal 10 } 
	{ int_acc_m0_12_load_reload sc_in sc_lv 32 signal 11 } 
	{ int_acc_m0_16_load_reload sc_in sc_lv 32 signal 12 } 
	{ int_acc_m0_20_load_reload sc_in sc_lv 32 signal 13 } 
	{ int_acc_m0_24_load_reload sc_in sc_lv 32 signal 14 } 
	{ int_acc_m0_28_load_reload sc_in sc_lv 32 signal 15 } 
	{ int_acc_w1_load_reload sc_in sc_lv 32 signal 16 } 
	{ int_acc_w1_4_load_reload sc_in sc_lv 32 signal 17 } 
	{ int_acc_w1_8_load_reload sc_in sc_lv 32 signal 18 } 
	{ int_acc_w1_12_load_reload sc_in sc_lv 32 signal 19 } 
	{ int_acc_w1_16_load_reload sc_in sc_lv 32 signal 20 } 
	{ int_acc_w1_20_load_reload sc_in sc_lv 32 signal 21 } 
	{ int_acc_w1_24_load_reload sc_in sc_lv 32 signal 22 } 
	{ int_acc_w1_28_load_reload sc_in sc_lv 32 signal 23 } 
	{ int_acc_m1_load_reload sc_in sc_lv 32 signal 24 } 
	{ int_acc_m1_4_load_reload sc_in sc_lv 32 signal 25 } 
	{ int_acc_m1_8_load_reload sc_in sc_lv 32 signal 26 } 
	{ int_acc_m1_12_load_reload sc_in sc_lv 32 signal 27 } 
	{ int_acc_m1_16_load_reload sc_in sc_lv 32 signal 28 } 
	{ int_acc_m1_20_load_reload sc_in sc_lv 32 signal 29 } 
	{ int_acc_m1_24_load_reload sc_in sc_lv 32 signal 30 } 
	{ int_acc_m1_28_load_reload sc_in sc_lv 32 signal 31 } 
	{ int_acc_w0_1_load_reload sc_in sc_lv 32 signal 32 } 
	{ int_acc_w0_5_load_reload sc_in sc_lv 32 signal 33 } 
	{ int_acc_w0_9_load_reload sc_in sc_lv 32 signal 34 } 
	{ int_acc_w0_13_load_reload sc_in sc_lv 32 signal 35 } 
	{ int_acc_w0_17_load_reload sc_in sc_lv 32 signal 36 } 
	{ int_acc_w0_21_load_reload sc_in sc_lv 32 signal 37 } 
	{ int_acc_w0_25_load_reload sc_in sc_lv 32 signal 38 } 
	{ int_acc_w0_29_load_reload sc_in sc_lv 32 signal 39 } 
	{ int_acc_m0_1_load_reload sc_in sc_lv 32 signal 40 } 
	{ int_acc_m0_5_load_reload sc_in sc_lv 32 signal 41 } 
	{ int_acc_m0_9_load_reload sc_in sc_lv 32 signal 42 } 
	{ int_acc_m0_13_load_reload sc_in sc_lv 32 signal 43 } 
	{ int_acc_m0_17_load_reload sc_in sc_lv 32 signal 44 } 
	{ int_acc_m0_21_load_reload sc_in sc_lv 32 signal 45 } 
	{ int_acc_m0_25_load_reload sc_in sc_lv 32 signal 46 } 
	{ int_acc_m0_29_load_reload sc_in sc_lv 32 signal 47 } 
	{ int_acc_w1_1_load_reload sc_in sc_lv 32 signal 48 } 
	{ int_acc_w1_5_load_reload sc_in sc_lv 32 signal 49 } 
	{ int_acc_w1_9_load_reload sc_in sc_lv 32 signal 50 } 
	{ int_acc_w1_13_load_reload sc_in sc_lv 32 signal 51 } 
	{ int_acc_w1_17_load_reload sc_in sc_lv 32 signal 52 } 
	{ int_acc_w1_21_load_reload sc_in sc_lv 32 signal 53 } 
	{ int_acc_w1_25_load_reload sc_in sc_lv 32 signal 54 } 
	{ int_acc_w1_29_load_reload sc_in sc_lv 32 signal 55 } 
	{ int_acc_m1_1_load_reload sc_in sc_lv 32 signal 56 } 
	{ int_acc_m1_5_load_reload sc_in sc_lv 32 signal 57 } 
	{ int_acc_m1_9_load_reload sc_in sc_lv 32 signal 58 } 
	{ int_acc_m1_13_load_reload sc_in sc_lv 32 signal 59 } 
	{ int_acc_m1_17_load_reload sc_in sc_lv 32 signal 60 } 
	{ int_acc_m1_21_load_reload sc_in sc_lv 32 signal 61 } 
	{ int_acc_m1_25_load_reload sc_in sc_lv 32 signal 62 } 
	{ int_acc_m1_29_load_reload sc_in sc_lv 32 signal 63 } 
	{ int_acc_w0_2_load_reload sc_in sc_lv 32 signal 64 } 
	{ int_acc_w0_6_load_reload sc_in sc_lv 32 signal 65 } 
	{ int_acc_w0_10_load_reload sc_in sc_lv 32 signal 66 } 
	{ int_acc_w0_14_load_reload sc_in sc_lv 32 signal 67 } 
	{ int_acc_w0_18_load_reload sc_in sc_lv 32 signal 68 } 
	{ int_acc_w0_22_load_reload sc_in sc_lv 32 signal 69 } 
	{ int_acc_w0_26_load_reload sc_in sc_lv 32 signal 70 } 
	{ int_acc_w0_30_load_reload sc_in sc_lv 32 signal 71 } 
	{ int_acc_m0_2_load_reload sc_in sc_lv 32 signal 72 } 
	{ int_acc_m0_6_load_reload sc_in sc_lv 32 signal 73 } 
	{ int_acc_m0_10_load_reload sc_in sc_lv 32 signal 74 } 
	{ int_acc_m0_14_load_reload sc_in sc_lv 32 signal 75 } 
	{ int_acc_m0_18_load_reload sc_in sc_lv 32 signal 76 } 
	{ int_acc_m0_22_load_reload sc_in sc_lv 32 signal 77 } 
	{ int_acc_m0_26_load_reload sc_in sc_lv 32 signal 78 } 
	{ int_acc_m0_30_load_reload sc_in sc_lv 32 signal 79 } 
	{ int_acc_w1_2_load_reload sc_in sc_lv 32 signal 80 } 
	{ int_acc_w1_6_load_reload sc_in sc_lv 32 signal 81 } 
	{ int_acc_w1_10_load_reload sc_in sc_lv 32 signal 82 } 
	{ int_acc_w1_14_load_reload sc_in sc_lv 32 signal 83 } 
	{ int_acc_w1_18_load_reload sc_in sc_lv 32 signal 84 } 
	{ int_acc_w1_22_load_reload sc_in sc_lv 32 signal 85 } 
	{ int_acc_w1_26_load_reload sc_in sc_lv 32 signal 86 } 
	{ int_acc_w1_30_load_reload sc_in sc_lv 32 signal 87 } 
	{ int_acc_m1_2_load_reload sc_in sc_lv 32 signal 88 } 
	{ int_acc_m1_6_load_reload sc_in sc_lv 32 signal 89 } 
	{ int_acc_m1_10_load_reload sc_in sc_lv 32 signal 90 } 
	{ int_acc_m1_14_load_reload sc_in sc_lv 32 signal 91 } 
	{ int_acc_m1_18_load_reload sc_in sc_lv 32 signal 92 } 
	{ int_acc_m1_22_load_reload sc_in sc_lv 32 signal 93 } 
	{ int_acc_m1_26_load_reload sc_in sc_lv 32 signal 94 } 
	{ int_acc_m1_30_load_reload sc_in sc_lv 32 signal 95 } 
	{ int_acc_w0_3_load_reload sc_in sc_lv 32 signal 96 } 
	{ int_acc_w0_7_load_reload sc_in sc_lv 32 signal 97 } 
	{ int_acc_w0_11_load_reload sc_in sc_lv 32 signal 98 } 
	{ int_acc_w0_15_load_reload sc_in sc_lv 32 signal 99 } 
	{ int_acc_w0_19_load_reload sc_in sc_lv 32 signal 100 } 
	{ int_acc_w0_23_load_reload sc_in sc_lv 32 signal 101 } 
	{ int_acc_w0_27_load_reload sc_in sc_lv 32 signal 102 } 
	{ int_acc_w0_31_load_reload sc_in sc_lv 32 signal 103 } 
	{ int_acc_m0_3_load_reload sc_in sc_lv 32 signal 104 } 
	{ int_acc_m0_7_load_reload sc_in sc_lv 32 signal 105 } 
	{ int_acc_m0_11_load_reload sc_in sc_lv 32 signal 106 } 
	{ int_acc_m0_15_load_reload sc_in sc_lv 32 signal 107 } 
	{ int_acc_m0_19_load_reload sc_in sc_lv 32 signal 108 } 
	{ int_acc_m0_23_load_reload sc_in sc_lv 32 signal 109 } 
	{ int_acc_m0_27_load_reload sc_in sc_lv 32 signal 110 } 
	{ int_acc_m0_31_load_reload sc_in sc_lv 32 signal 111 } 
	{ int_acc_w1_3_load_reload sc_in sc_lv 32 signal 112 } 
	{ int_acc_w1_7_load_reload sc_in sc_lv 32 signal 113 } 
	{ int_acc_w1_11_load_reload sc_in sc_lv 32 signal 114 } 
	{ int_acc_w1_15_load_reload sc_in sc_lv 32 signal 115 } 
	{ int_acc_w1_19_load_reload sc_in sc_lv 32 signal 116 } 
	{ int_acc_w1_23_load_reload sc_in sc_lv 32 signal 117 } 
	{ int_acc_w1_27_load_reload sc_in sc_lv 32 signal 118 } 
	{ int_acc_w1_31_load_reload sc_in sc_lv 32 signal 119 } 
	{ int_acc_m1_3_load_reload sc_in sc_lv 32 signal 120 } 
	{ int_acc_m1_7_load_reload sc_in sc_lv 32 signal 121 } 
	{ int_acc_m1_11_load_reload sc_in sc_lv 32 signal 122 } 
	{ int_acc_m1_15_load_reload sc_in sc_lv 32 signal 123 } 
	{ int_acc_m1_19_load_reload sc_in sc_lv 32 signal 124 } 
	{ int_acc_m1_23_load_reload sc_in sc_lv 32 signal 125 } 
	{ int_acc_m1_27_load_reload sc_in sc_lv 32 signal 126 } 
	{ int_acc_m1_31_load_reload sc_in sc_lv 32 signal 127 } 
	{ mux_case_09851_reload sc_in sc_lv 32 signal 128 } 
	{ mux_case_19864_reload sc_in sc_lv 32 signal 129 } 
	{ mux_case_29877_reload sc_in sc_lv 32 signal 130 } 
	{ mux_case_398810_reload sc_in sc_lv 32 signal 131 } 
	{ mux_case_498913_reload sc_in sc_lv 32 signal 132 } 
	{ mux_case_599016_reload sc_in sc_lv 32 signal 133 } 
	{ mux_case_699119_reload sc_in sc_lv 32 signal 134 } 
	{ mux_case_799222_reload sc_in sc_lv 32 signal 135 } 
	{ mux_case_099326_reload sc_in sc_lv 32 signal 136 } 
	{ mux_case_199429_reload sc_in sc_lv 32 signal 137 } 
	{ mux_case_299532_reload sc_in sc_lv 32 signal 138 } 
	{ mux_case_399635_reload sc_in sc_lv 32 signal 139 } 
	{ mux_case_499738_reload sc_in sc_lv 32 signal 140 } 
	{ mux_case_599841_reload sc_in sc_lv 32 signal 141 } 
	{ mux_case_699944_reload sc_in sc_lv 32 signal 142 } 
	{ mux_case_7100047_reload sc_in sc_lv 32 signal 143 } 
	{ mux_case_0100150_reload sc_in sc_lv 32 signal 144 } 
	{ mux_case_1100253_reload sc_in sc_lv 32 signal 145 } 
	{ mux_case_2100356_reload sc_in sc_lv 32 signal 146 } 
	{ mux_case_3100459_reload sc_in sc_lv 32 signal 147 } 
	{ mux_case_4100562_reload sc_in sc_lv 32 signal 148 } 
	{ mux_case_5100665_reload sc_in sc_lv 32 signal 149 } 
	{ mux_case_6100768_reload sc_in sc_lv 32 signal 150 } 
	{ mux_case_7100871_reload sc_in sc_lv 32 signal 151 } 
	{ mux_case_0100974_reload sc_in sc_lv 32 signal 152 } 
	{ mux_case_1101077_reload sc_in sc_lv 32 signal 153 } 
	{ mux_case_2101180_reload sc_in sc_lv 32 signal 154 } 
	{ mux_case_3101283_reload sc_in sc_lv 32 signal 155 } 
	{ mux_case_4101386_reload sc_in sc_lv 32 signal 156 } 
	{ mux_case_5101489_reload sc_in sc_lv 32 signal 157 } 
	{ mux_case_6101592_reload sc_in sc_lv 32 signal 158 } 
	{ mux_case_7101695_reload sc_in sc_lv 32 signal 159 } 
	{ total1_out sc_out sc_lv 56 signal 160 } 
	{ total1_out_ap_vld sc_out sc_logic 1 outvld 160 } 
	{ total0_out sc_out sc_lv 56 signal 161 } 
	{ total0_out_ap_vld sc_out sc_logic 1 outvld 161 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "int_acc_w0_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_w0_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_w0_4_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_w0_4_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_w0_8_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_w0_8_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_w0_12_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_w0_12_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_w0_16_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_w0_16_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_w0_20_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_w0_20_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_w0_24_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_w0_24_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_w0_28_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_w0_28_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_m0_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_m0_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_m0_4_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_m0_4_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_m0_8_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_m0_8_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_m0_12_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_m0_12_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_m0_16_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_m0_16_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_m0_20_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_m0_20_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_m0_24_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_m0_24_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_m0_28_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_m0_28_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_w1_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_w1_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_w1_4_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_w1_4_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_w1_8_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_w1_8_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_w1_12_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_w1_12_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_w1_16_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_w1_16_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_w1_20_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_w1_20_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_w1_24_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_w1_24_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_w1_28_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_w1_28_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_m1_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_m1_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_m1_4_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_m1_4_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_m1_8_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_m1_8_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_m1_12_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_m1_12_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_m1_16_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_m1_16_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_m1_20_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_m1_20_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_m1_24_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_m1_24_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_m1_28_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_m1_28_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_w0_1_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_w0_1_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_w0_5_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_w0_5_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_w0_9_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_w0_9_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_w0_13_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_w0_13_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_w0_17_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_w0_17_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_w0_21_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_w0_21_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_w0_25_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_w0_25_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_w0_29_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_w0_29_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_m0_1_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_m0_1_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_m0_5_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_m0_5_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_m0_9_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_m0_9_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_m0_13_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_m0_13_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_m0_17_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_m0_17_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_m0_21_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_m0_21_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_m0_25_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_m0_25_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_m0_29_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_m0_29_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_w1_1_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_w1_1_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_w1_5_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_w1_5_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_w1_9_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_w1_9_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_w1_13_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_w1_13_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_w1_17_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_w1_17_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_w1_21_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_w1_21_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_w1_25_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_w1_25_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_w1_29_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_w1_29_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_m1_1_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_m1_1_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_m1_5_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_m1_5_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_m1_9_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_m1_9_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_m1_13_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_m1_13_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_m1_17_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_m1_17_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_m1_21_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_m1_21_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_m1_25_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_m1_25_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_m1_29_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_m1_29_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_w0_2_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_w0_2_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_w0_6_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_w0_6_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_w0_10_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_w0_10_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_w0_14_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_w0_14_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_w0_18_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_w0_18_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_w0_22_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_w0_22_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_w0_26_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_w0_26_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_w0_30_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_w0_30_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_m0_2_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_m0_2_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_m0_6_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_m0_6_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_m0_10_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_m0_10_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_m0_14_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_m0_14_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_m0_18_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_m0_18_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_m0_22_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_m0_22_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_m0_26_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_m0_26_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_m0_30_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_m0_30_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_w1_2_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_w1_2_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_w1_6_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_w1_6_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_w1_10_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_w1_10_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_w1_14_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_w1_14_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_w1_18_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_w1_18_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_w1_22_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_w1_22_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_w1_26_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_w1_26_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_w1_30_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_w1_30_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_m1_2_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_m1_2_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_m1_6_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_m1_6_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_m1_10_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_m1_10_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_m1_14_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_m1_14_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_m1_18_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_m1_18_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_m1_22_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_m1_22_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_m1_26_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_m1_26_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_m1_30_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_m1_30_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_w0_3_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_w0_3_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_w0_7_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_w0_7_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_w0_11_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_w0_11_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_w0_15_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_w0_15_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_w0_19_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_w0_19_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_w0_23_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_w0_23_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_w0_27_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_w0_27_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_w0_31_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_w0_31_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_m0_3_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_m0_3_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_m0_7_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_m0_7_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_m0_11_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_m0_11_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_m0_15_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_m0_15_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_m0_19_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_m0_19_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_m0_23_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_m0_23_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_m0_27_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_m0_27_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_m0_31_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_m0_31_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_w1_3_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_w1_3_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_w1_7_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_w1_7_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_w1_11_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_w1_11_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_w1_15_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_w1_15_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_w1_19_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_w1_19_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_w1_23_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_w1_23_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_w1_27_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_w1_27_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_w1_31_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_w1_31_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_m1_3_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_m1_3_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_m1_7_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_m1_7_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_m1_11_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_m1_11_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_m1_15_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_m1_15_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_m1_19_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_m1_19_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_m1_23_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_m1_23_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_m1_27_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_m1_27_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_m1_31_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_m1_31_load_reload", "role": "default" }} , 
 	{ "name": "mux_case_09851_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "mux_case_09851_reload", "role": "default" }} , 
 	{ "name": "mux_case_19864_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "mux_case_19864_reload", "role": "default" }} , 
 	{ "name": "mux_case_29877_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "mux_case_29877_reload", "role": "default" }} , 
 	{ "name": "mux_case_398810_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "mux_case_398810_reload", "role": "default" }} , 
 	{ "name": "mux_case_498913_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "mux_case_498913_reload", "role": "default" }} , 
 	{ "name": "mux_case_599016_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "mux_case_599016_reload", "role": "default" }} , 
 	{ "name": "mux_case_699119_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "mux_case_699119_reload", "role": "default" }} , 
 	{ "name": "mux_case_799222_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "mux_case_799222_reload", "role": "default" }} , 
 	{ "name": "mux_case_099326_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "mux_case_099326_reload", "role": "default" }} , 
 	{ "name": "mux_case_199429_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "mux_case_199429_reload", "role": "default" }} , 
 	{ "name": "mux_case_299532_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "mux_case_299532_reload", "role": "default" }} , 
 	{ "name": "mux_case_399635_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "mux_case_399635_reload", "role": "default" }} , 
 	{ "name": "mux_case_499738_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "mux_case_499738_reload", "role": "default" }} , 
 	{ "name": "mux_case_599841_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "mux_case_599841_reload", "role": "default" }} , 
 	{ "name": "mux_case_699944_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "mux_case_699944_reload", "role": "default" }} , 
 	{ "name": "mux_case_7100047_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "mux_case_7100047_reload", "role": "default" }} , 
 	{ "name": "mux_case_0100150_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "mux_case_0100150_reload", "role": "default" }} , 
 	{ "name": "mux_case_1100253_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "mux_case_1100253_reload", "role": "default" }} , 
 	{ "name": "mux_case_2100356_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "mux_case_2100356_reload", "role": "default" }} , 
 	{ "name": "mux_case_3100459_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "mux_case_3100459_reload", "role": "default" }} , 
 	{ "name": "mux_case_4100562_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "mux_case_4100562_reload", "role": "default" }} , 
 	{ "name": "mux_case_5100665_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "mux_case_5100665_reload", "role": "default" }} , 
 	{ "name": "mux_case_6100768_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "mux_case_6100768_reload", "role": "default" }} , 
 	{ "name": "mux_case_7100871_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "mux_case_7100871_reload", "role": "default" }} , 
 	{ "name": "mux_case_0100974_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "mux_case_0100974_reload", "role": "default" }} , 
 	{ "name": "mux_case_1101077_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "mux_case_1101077_reload", "role": "default" }} , 
 	{ "name": "mux_case_2101180_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "mux_case_2101180_reload", "role": "default" }} , 
 	{ "name": "mux_case_3101283_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "mux_case_3101283_reload", "role": "default" }} , 
 	{ "name": "mux_case_4101386_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "mux_case_4101386_reload", "role": "default" }} , 
 	{ "name": "mux_case_5101489_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "mux_case_5101489_reload", "role": "default" }} , 
 	{ "name": "mux_case_6101592_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "mux_case_6101592_reload", "role": "default" }} , 
 	{ "name": "mux_case_7101695_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "mux_case_7101695_reload", "role": "default" }} , 
 	{ "name": "total1_out", "direction": "out", "datatype": "sc_lv", "bitwidth":56, "type": "signal", "bundle":{"name": "total1_out", "role": "default" }} , 
 	{ "name": "total1_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "total1_out", "role": "ap_vld" }} , 
 	{ "name": "total0_out", "direction": "out", "datatype": "sc_lv", "bitwidth":56, "type": "signal", "bundle":{"name": "total0_out", "role": "default" }} , 
 	{ "name": "total0_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "total0_out", "role": "ap_vld" }}  ]}

set ArgLastReadFirstWriteLatency {
	mac_blocks_wv_k2_Pipeline_REDUCE_K2 {
		int_acc_w0_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_w0_4_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_w0_8_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_w0_12_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_w0_16_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_w0_20_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_w0_24_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_w0_28_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_m0_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_m0_4_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_m0_8_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_m0_12_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_m0_16_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_m0_20_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_m0_24_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_m0_28_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_w1_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_w1_4_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_w1_8_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_w1_12_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_w1_16_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_w1_20_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_w1_24_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_w1_28_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_m1_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_m1_4_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_m1_8_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_m1_12_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_m1_16_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_m1_20_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_m1_24_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_m1_28_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_w0_1_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_w0_5_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_w0_9_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_w0_13_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_w0_17_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_w0_21_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_w0_25_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_w0_29_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_m0_1_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_m0_5_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_m0_9_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_m0_13_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_m0_17_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_m0_21_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_m0_25_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_m0_29_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_w1_1_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_w1_5_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_w1_9_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_w1_13_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_w1_17_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_w1_21_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_w1_25_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_w1_29_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_m1_1_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_m1_5_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_m1_9_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_m1_13_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_m1_17_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_m1_21_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_m1_25_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_m1_29_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_w0_2_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_w0_6_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_w0_10_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_w0_14_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_w0_18_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_w0_22_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_w0_26_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_w0_30_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_m0_2_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_m0_6_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_m0_10_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_m0_14_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_m0_18_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_m0_22_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_m0_26_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_m0_30_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_w1_2_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_w1_6_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_w1_10_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_w1_14_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_w1_18_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_w1_22_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_w1_26_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_w1_30_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_m1_2_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_m1_6_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_m1_10_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_m1_14_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_m1_18_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_m1_22_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_m1_26_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_m1_30_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_w0_3_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_w0_7_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_w0_11_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_w0_15_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_w0_19_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_w0_23_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_w0_27_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_w0_31_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_m0_3_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_m0_7_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_m0_11_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_m0_15_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_m0_19_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_m0_23_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_m0_27_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_m0_31_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_w1_3_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_w1_7_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_w1_11_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_w1_15_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_w1_19_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_w1_23_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_w1_27_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_w1_31_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_m1_3_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_m1_7_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_m1_11_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_m1_15_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_m1_19_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_m1_23_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_m1_27_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_m1_31_load_reload {Type I LastRead 0 FirstWrite -1}
		mux_case_09851_reload {Type I LastRead 0 FirstWrite -1}
		mux_case_19864_reload {Type I LastRead 0 FirstWrite -1}
		mux_case_29877_reload {Type I LastRead 0 FirstWrite -1}
		mux_case_398810_reload {Type I LastRead 0 FirstWrite -1}
		mux_case_498913_reload {Type I LastRead 0 FirstWrite -1}
		mux_case_599016_reload {Type I LastRead 0 FirstWrite -1}
		mux_case_699119_reload {Type I LastRead 0 FirstWrite -1}
		mux_case_799222_reload {Type I LastRead 0 FirstWrite -1}
		mux_case_099326_reload {Type I LastRead 0 FirstWrite -1}
		mux_case_199429_reload {Type I LastRead 0 FirstWrite -1}
		mux_case_299532_reload {Type I LastRead 0 FirstWrite -1}
		mux_case_399635_reload {Type I LastRead 0 FirstWrite -1}
		mux_case_499738_reload {Type I LastRead 0 FirstWrite -1}
		mux_case_599841_reload {Type I LastRead 0 FirstWrite -1}
		mux_case_699944_reload {Type I LastRead 0 FirstWrite -1}
		mux_case_7100047_reload {Type I LastRead 0 FirstWrite -1}
		mux_case_0100150_reload {Type I LastRead 0 FirstWrite -1}
		mux_case_1100253_reload {Type I LastRead 0 FirstWrite -1}
		mux_case_2100356_reload {Type I LastRead 0 FirstWrite -1}
		mux_case_3100459_reload {Type I LastRead 0 FirstWrite -1}
		mux_case_4100562_reload {Type I LastRead 0 FirstWrite -1}
		mux_case_5100665_reload {Type I LastRead 0 FirstWrite -1}
		mux_case_6100768_reload {Type I LastRead 0 FirstWrite -1}
		mux_case_7100871_reload {Type I LastRead 0 FirstWrite -1}
		mux_case_0100974_reload {Type I LastRead 0 FirstWrite -1}
		mux_case_1101077_reload {Type I LastRead 0 FirstWrite -1}
		mux_case_2101180_reload {Type I LastRead 0 FirstWrite -1}
		mux_case_3101283_reload {Type I LastRead 0 FirstWrite -1}
		mux_case_4101386_reload {Type I LastRead 0 FirstWrite -1}
		mux_case_5101489_reload {Type I LastRead 0 FirstWrite -1}
		mux_case_6101592_reload {Type I LastRead 0 FirstWrite -1}
		mux_case_7101695_reload {Type I LastRead 0 FirstWrite -1}
		total1_out {Type O LastRead -1 FirstWrite 10}
		total0_out {Type O LastRead -1 FirstWrite 10}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "20", "Max" : "20"}
	, {"Name" : "Interval", "Min" : "20", "Max" : "20"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	int_acc_w0_load_reload { ap_none {  { int_acc_w0_load_reload in_data 0 32 } } }
	int_acc_w0_4_load_reload { ap_none {  { int_acc_w0_4_load_reload in_data 0 32 } } }
	int_acc_w0_8_load_reload { ap_none {  { int_acc_w0_8_load_reload in_data 0 32 } } }
	int_acc_w0_12_load_reload { ap_none {  { int_acc_w0_12_load_reload in_data 0 32 } } }
	int_acc_w0_16_load_reload { ap_none {  { int_acc_w0_16_load_reload in_data 0 32 } } }
	int_acc_w0_20_load_reload { ap_none {  { int_acc_w0_20_load_reload in_data 0 32 } } }
	int_acc_w0_24_load_reload { ap_none {  { int_acc_w0_24_load_reload in_data 0 32 } } }
	int_acc_w0_28_load_reload { ap_none {  { int_acc_w0_28_load_reload in_data 0 32 } } }
	int_acc_m0_load_reload { ap_none {  { int_acc_m0_load_reload in_data 0 32 } } }
	int_acc_m0_4_load_reload { ap_none {  { int_acc_m0_4_load_reload in_data 0 32 } } }
	int_acc_m0_8_load_reload { ap_none {  { int_acc_m0_8_load_reload in_data 0 32 } } }
	int_acc_m0_12_load_reload { ap_none {  { int_acc_m0_12_load_reload in_data 0 32 } } }
	int_acc_m0_16_load_reload { ap_none {  { int_acc_m0_16_load_reload in_data 0 32 } } }
	int_acc_m0_20_load_reload { ap_none {  { int_acc_m0_20_load_reload in_data 0 32 } } }
	int_acc_m0_24_load_reload { ap_none {  { int_acc_m0_24_load_reload in_data 0 32 } } }
	int_acc_m0_28_load_reload { ap_none {  { int_acc_m0_28_load_reload in_data 0 32 } } }
	int_acc_w1_load_reload { ap_none {  { int_acc_w1_load_reload in_data 0 32 } } }
	int_acc_w1_4_load_reload { ap_none {  { int_acc_w1_4_load_reload in_data 0 32 } } }
	int_acc_w1_8_load_reload { ap_none {  { int_acc_w1_8_load_reload in_data 0 32 } } }
	int_acc_w1_12_load_reload { ap_none {  { int_acc_w1_12_load_reload in_data 0 32 } } }
	int_acc_w1_16_load_reload { ap_none {  { int_acc_w1_16_load_reload in_data 0 32 } } }
	int_acc_w1_20_load_reload { ap_none {  { int_acc_w1_20_load_reload in_data 0 32 } } }
	int_acc_w1_24_load_reload { ap_none {  { int_acc_w1_24_load_reload in_data 0 32 } } }
	int_acc_w1_28_load_reload { ap_none {  { int_acc_w1_28_load_reload in_data 0 32 } } }
	int_acc_m1_load_reload { ap_none {  { int_acc_m1_load_reload in_data 0 32 } } }
	int_acc_m1_4_load_reload { ap_none {  { int_acc_m1_4_load_reload in_data 0 32 } } }
	int_acc_m1_8_load_reload { ap_none {  { int_acc_m1_8_load_reload in_data 0 32 } } }
	int_acc_m1_12_load_reload { ap_none {  { int_acc_m1_12_load_reload in_data 0 32 } } }
	int_acc_m1_16_load_reload { ap_none {  { int_acc_m1_16_load_reload in_data 0 32 } } }
	int_acc_m1_20_load_reload { ap_none {  { int_acc_m1_20_load_reload in_data 0 32 } } }
	int_acc_m1_24_load_reload { ap_none {  { int_acc_m1_24_load_reload in_data 0 32 } } }
	int_acc_m1_28_load_reload { ap_none {  { int_acc_m1_28_load_reload in_data 0 32 } } }
	int_acc_w0_1_load_reload { ap_none {  { int_acc_w0_1_load_reload in_data 0 32 } } }
	int_acc_w0_5_load_reload { ap_none {  { int_acc_w0_5_load_reload in_data 0 32 } } }
	int_acc_w0_9_load_reload { ap_none {  { int_acc_w0_9_load_reload in_data 0 32 } } }
	int_acc_w0_13_load_reload { ap_none {  { int_acc_w0_13_load_reload in_data 0 32 } } }
	int_acc_w0_17_load_reload { ap_none {  { int_acc_w0_17_load_reload in_data 0 32 } } }
	int_acc_w0_21_load_reload { ap_none {  { int_acc_w0_21_load_reload in_data 0 32 } } }
	int_acc_w0_25_load_reload { ap_none {  { int_acc_w0_25_load_reload in_data 0 32 } } }
	int_acc_w0_29_load_reload { ap_none {  { int_acc_w0_29_load_reload in_data 0 32 } } }
	int_acc_m0_1_load_reload { ap_none {  { int_acc_m0_1_load_reload in_data 0 32 } } }
	int_acc_m0_5_load_reload { ap_none {  { int_acc_m0_5_load_reload in_data 0 32 } } }
	int_acc_m0_9_load_reload { ap_none {  { int_acc_m0_9_load_reload in_data 0 32 } } }
	int_acc_m0_13_load_reload { ap_none {  { int_acc_m0_13_load_reload in_data 0 32 } } }
	int_acc_m0_17_load_reload { ap_none {  { int_acc_m0_17_load_reload in_data 0 32 } } }
	int_acc_m0_21_load_reload { ap_none {  { int_acc_m0_21_load_reload in_data 0 32 } } }
	int_acc_m0_25_load_reload { ap_none {  { int_acc_m0_25_load_reload in_data 0 32 } } }
	int_acc_m0_29_load_reload { ap_none {  { int_acc_m0_29_load_reload in_data 0 32 } } }
	int_acc_w1_1_load_reload { ap_none {  { int_acc_w1_1_load_reload in_data 0 32 } } }
	int_acc_w1_5_load_reload { ap_none {  { int_acc_w1_5_load_reload in_data 0 32 } } }
	int_acc_w1_9_load_reload { ap_none {  { int_acc_w1_9_load_reload in_data 0 32 } } }
	int_acc_w1_13_load_reload { ap_none {  { int_acc_w1_13_load_reload in_data 0 32 } } }
	int_acc_w1_17_load_reload { ap_none {  { int_acc_w1_17_load_reload in_data 0 32 } } }
	int_acc_w1_21_load_reload { ap_none {  { int_acc_w1_21_load_reload in_data 0 32 } } }
	int_acc_w1_25_load_reload { ap_none {  { int_acc_w1_25_load_reload in_data 0 32 } } }
	int_acc_w1_29_load_reload { ap_none {  { int_acc_w1_29_load_reload in_data 0 32 } } }
	int_acc_m1_1_load_reload { ap_none {  { int_acc_m1_1_load_reload in_data 0 32 } } }
	int_acc_m1_5_load_reload { ap_none {  { int_acc_m1_5_load_reload in_data 0 32 } } }
	int_acc_m1_9_load_reload { ap_none {  { int_acc_m1_9_load_reload in_data 0 32 } } }
	int_acc_m1_13_load_reload { ap_none {  { int_acc_m1_13_load_reload in_data 0 32 } } }
	int_acc_m1_17_load_reload { ap_none {  { int_acc_m1_17_load_reload in_data 0 32 } } }
	int_acc_m1_21_load_reload { ap_none {  { int_acc_m1_21_load_reload in_data 0 32 } } }
	int_acc_m1_25_load_reload { ap_none {  { int_acc_m1_25_load_reload in_data 0 32 } } }
	int_acc_m1_29_load_reload { ap_none {  { int_acc_m1_29_load_reload in_data 0 32 } } }
	int_acc_w0_2_load_reload { ap_none {  { int_acc_w0_2_load_reload in_data 0 32 } } }
	int_acc_w0_6_load_reload { ap_none {  { int_acc_w0_6_load_reload in_data 0 32 } } }
	int_acc_w0_10_load_reload { ap_none {  { int_acc_w0_10_load_reload in_data 0 32 } } }
	int_acc_w0_14_load_reload { ap_none {  { int_acc_w0_14_load_reload in_data 0 32 } } }
	int_acc_w0_18_load_reload { ap_none {  { int_acc_w0_18_load_reload in_data 0 32 } } }
	int_acc_w0_22_load_reload { ap_none {  { int_acc_w0_22_load_reload in_data 0 32 } } }
	int_acc_w0_26_load_reload { ap_none {  { int_acc_w0_26_load_reload in_data 0 32 } } }
	int_acc_w0_30_load_reload { ap_none {  { int_acc_w0_30_load_reload in_data 0 32 } } }
	int_acc_m0_2_load_reload { ap_none {  { int_acc_m0_2_load_reload in_data 0 32 } } }
	int_acc_m0_6_load_reload { ap_none {  { int_acc_m0_6_load_reload in_data 0 32 } } }
	int_acc_m0_10_load_reload { ap_none {  { int_acc_m0_10_load_reload in_data 0 32 } } }
	int_acc_m0_14_load_reload { ap_none {  { int_acc_m0_14_load_reload in_data 0 32 } } }
	int_acc_m0_18_load_reload { ap_none {  { int_acc_m0_18_load_reload in_data 0 32 } } }
	int_acc_m0_22_load_reload { ap_none {  { int_acc_m0_22_load_reload in_data 0 32 } } }
	int_acc_m0_26_load_reload { ap_none {  { int_acc_m0_26_load_reload in_data 0 32 } } }
	int_acc_m0_30_load_reload { ap_none {  { int_acc_m0_30_load_reload in_data 0 32 } } }
	int_acc_w1_2_load_reload { ap_none {  { int_acc_w1_2_load_reload in_data 0 32 } } }
	int_acc_w1_6_load_reload { ap_none {  { int_acc_w1_6_load_reload in_data 0 32 } } }
	int_acc_w1_10_load_reload { ap_none {  { int_acc_w1_10_load_reload in_data 0 32 } } }
	int_acc_w1_14_load_reload { ap_none {  { int_acc_w1_14_load_reload in_data 0 32 } } }
	int_acc_w1_18_load_reload { ap_none {  { int_acc_w1_18_load_reload in_data 0 32 } } }
	int_acc_w1_22_load_reload { ap_none {  { int_acc_w1_22_load_reload in_data 0 32 } } }
	int_acc_w1_26_load_reload { ap_none {  { int_acc_w1_26_load_reload in_data 0 32 } } }
	int_acc_w1_30_load_reload { ap_none {  { int_acc_w1_30_load_reload in_data 0 32 } } }
	int_acc_m1_2_load_reload { ap_none {  { int_acc_m1_2_load_reload in_data 0 32 } } }
	int_acc_m1_6_load_reload { ap_none {  { int_acc_m1_6_load_reload in_data 0 32 } } }
	int_acc_m1_10_load_reload { ap_none {  { int_acc_m1_10_load_reload in_data 0 32 } } }
	int_acc_m1_14_load_reload { ap_none {  { int_acc_m1_14_load_reload in_data 0 32 } } }
	int_acc_m1_18_load_reload { ap_none {  { int_acc_m1_18_load_reload in_data 0 32 } } }
	int_acc_m1_22_load_reload { ap_none {  { int_acc_m1_22_load_reload in_data 0 32 } } }
	int_acc_m1_26_load_reload { ap_none {  { int_acc_m1_26_load_reload in_data 0 32 } } }
	int_acc_m1_30_load_reload { ap_none {  { int_acc_m1_30_load_reload in_data 0 32 } } }
	int_acc_w0_3_load_reload { ap_none {  { int_acc_w0_3_load_reload in_data 0 32 } } }
	int_acc_w0_7_load_reload { ap_none {  { int_acc_w0_7_load_reload in_data 0 32 } } }
	int_acc_w0_11_load_reload { ap_none {  { int_acc_w0_11_load_reload in_data 0 32 } } }
	int_acc_w0_15_load_reload { ap_none {  { int_acc_w0_15_load_reload in_data 0 32 } } }
	int_acc_w0_19_load_reload { ap_none {  { int_acc_w0_19_load_reload in_data 0 32 } } }
	int_acc_w0_23_load_reload { ap_none {  { int_acc_w0_23_load_reload in_data 0 32 } } }
	int_acc_w0_27_load_reload { ap_none {  { int_acc_w0_27_load_reload in_data 0 32 } } }
	int_acc_w0_31_load_reload { ap_none {  { int_acc_w0_31_load_reload in_data 0 32 } } }
	int_acc_m0_3_load_reload { ap_none {  { int_acc_m0_3_load_reload in_data 0 32 } } }
	int_acc_m0_7_load_reload { ap_none {  { int_acc_m0_7_load_reload in_data 0 32 } } }
	int_acc_m0_11_load_reload { ap_none {  { int_acc_m0_11_load_reload in_data 0 32 } } }
	int_acc_m0_15_load_reload { ap_none {  { int_acc_m0_15_load_reload in_data 0 32 } } }
	int_acc_m0_19_load_reload { ap_none {  { int_acc_m0_19_load_reload in_data 0 32 } } }
	int_acc_m0_23_load_reload { ap_none {  { int_acc_m0_23_load_reload in_data 0 32 } } }
	int_acc_m0_27_load_reload { ap_none {  { int_acc_m0_27_load_reload in_data 0 32 } } }
	int_acc_m0_31_load_reload { ap_none {  { int_acc_m0_31_load_reload in_data 0 32 } } }
	int_acc_w1_3_load_reload { ap_none {  { int_acc_w1_3_load_reload in_data 0 32 } } }
	int_acc_w1_7_load_reload { ap_none {  { int_acc_w1_7_load_reload in_data 0 32 } } }
	int_acc_w1_11_load_reload { ap_none {  { int_acc_w1_11_load_reload in_data 0 32 } } }
	int_acc_w1_15_load_reload { ap_none {  { int_acc_w1_15_load_reload in_data 0 32 } } }
	int_acc_w1_19_load_reload { ap_none {  { int_acc_w1_19_load_reload in_data 0 32 } } }
	int_acc_w1_23_load_reload { ap_none {  { int_acc_w1_23_load_reload in_data 0 32 } } }
	int_acc_w1_27_load_reload { ap_none {  { int_acc_w1_27_load_reload in_data 0 32 } } }
	int_acc_w1_31_load_reload { ap_none {  { int_acc_w1_31_load_reload in_data 0 32 } } }
	int_acc_m1_3_load_reload { ap_none {  { int_acc_m1_3_load_reload in_data 0 32 } } }
	int_acc_m1_7_load_reload { ap_none {  { int_acc_m1_7_load_reload in_data 0 32 } } }
	int_acc_m1_11_load_reload { ap_none {  { int_acc_m1_11_load_reload in_data 0 32 } } }
	int_acc_m1_15_load_reload { ap_none {  { int_acc_m1_15_load_reload in_data 0 32 } } }
	int_acc_m1_19_load_reload { ap_none {  { int_acc_m1_19_load_reload in_data 0 32 } } }
	int_acc_m1_23_load_reload { ap_none {  { int_acc_m1_23_load_reload in_data 0 32 } } }
	int_acc_m1_27_load_reload { ap_none {  { int_acc_m1_27_load_reload in_data 0 32 } } }
	int_acc_m1_31_load_reload { ap_none {  { int_acc_m1_31_load_reload in_data 0 32 } } }
	mux_case_09851_reload { ap_none {  { mux_case_09851_reload in_data 0 32 } } }
	mux_case_19864_reload { ap_none {  { mux_case_19864_reload in_data 0 32 } } }
	mux_case_29877_reload { ap_none {  { mux_case_29877_reload in_data 0 32 } } }
	mux_case_398810_reload { ap_none {  { mux_case_398810_reload in_data 0 32 } } }
	mux_case_498913_reload { ap_none {  { mux_case_498913_reload in_data 0 32 } } }
	mux_case_599016_reload { ap_none {  { mux_case_599016_reload in_data 0 32 } } }
	mux_case_699119_reload { ap_none {  { mux_case_699119_reload in_data 0 32 } } }
	mux_case_799222_reload { ap_none {  { mux_case_799222_reload in_data 0 32 } } }
	mux_case_099326_reload { ap_none {  { mux_case_099326_reload in_data 0 32 } } }
	mux_case_199429_reload { ap_none {  { mux_case_199429_reload in_data 0 32 } } }
	mux_case_299532_reload { ap_none {  { mux_case_299532_reload in_data 0 32 } } }
	mux_case_399635_reload { ap_none {  { mux_case_399635_reload in_data 0 32 } } }
	mux_case_499738_reload { ap_none {  { mux_case_499738_reload in_data 0 32 } } }
	mux_case_599841_reload { ap_none {  { mux_case_599841_reload in_data 0 32 } } }
	mux_case_699944_reload { ap_none {  { mux_case_699944_reload in_data 0 32 } } }
	mux_case_7100047_reload { ap_none {  { mux_case_7100047_reload in_data 0 32 } } }
	mux_case_0100150_reload { ap_none {  { mux_case_0100150_reload in_data 0 32 } } }
	mux_case_1100253_reload { ap_none {  { mux_case_1100253_reload in_data 0 32 } } }
	mux_case_2100356_reload { ap_none {  { mux_case_2100356_reload in_data 0 32 } } }
	mux_case_3100459_reload { ap_none {  { mux_case_3100459_reload in_data 0 32 } } }
	mux_case_4100562_reload { ap_none {  { mux_case_4100562_reload in_data 0 32 } } }
	mux_case_5100665_reload { ap_none {  { mux_case_5100665_reload in_data 0 32 } } }
	mux_case_6100768_reload { ap_none {  { mux_case_6100768_reload in_data 0 32 } } }
	mux_case_7100871_reload { ap_none {  { mux_case_7100871_reload in_data 0 32 } } }
	mux_case_0100974_reload { ap_none {  { mux_case_0100974_reload in_data 0 32 } } }
	mux_case_1101077_reload { ap_none {  { mux_case_1101077_reload in_data 0 32 } } }
	mux_case_2101180_reload { ap_none {  { mux_case_2101180_reload in_data 0 32 } } }
	mux_case_3101283_reload { ap_none {  { mux_case_3101283_reload in_data 0 32 } } }
	mux_case_4101386_reload { ap_none {  { mux_case_4101386_reload in_data 0 32 } } }
	mux_case_5101489_reload { ap_none {  { mux_case_5101489_reload in_data 0 32 } } }
	mux_case_6101592_reload { ap_none {  { mux_case_6101592_reload in_data 0 32 } } }
	mux_case_7101695_reload { ap_none {  { mux_case_7101695_reload in_data 0 32 } } }
	total1_out { ap_vld {  { total1_out out_data 1 56 }  { total1_out_ap_vld out_vld 1 1 } } }
	total0_out { ap_vld {  { total0_out out_data 1 56 }  { total0_out_ap_vld out_vld 1 1 } } }
}
