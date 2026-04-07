set moduleName mac_blocks_down_q4k_k2_Pipeline_REDUCE_GRP11
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
set C_modelName {mac_blocks_down_q4k_k2_Pipeline_REDUCE_GRP11}
set C_modelType { void 0 }
set ap_memory_interface_dict [dict create]
set C_modelArgList {
	{ phi_ln510_1_reload int 56 regular  }
	{ phi_ln508_1_reload int 56 regular  }
	{ acc_w0_load_6 int 32 regular  }
	{ acc_w0_4_load_6 int 32 regular  }
	{ acc_w0_8_load_6 int 32 regular  }
	{ acc_w0_12_load_6 int 32 regular  }
	{ acc_w0_16_load_6 int 32 regular  }
	{ acc_w0_20_load_6 int 32 regular  }
	{ acc_w0_24_load_6 int 32 regular  }
	{ acc_w0_28_load_6 int 32 regular  }
	{ acc_m0_load_6 int 32 regular  }
	{ acc_m0_4_load_6 int 32 regular  }
	{ acc_m0_8_load_6 int 32 regular  }
	{ acc_m0_12_load_6 int 32 regular  }
	{ acc_m0_16_load_6 int 32 regular  }
	{ acc_m0_20_load_6 int 32 regular  }
	{ acc_m0_24_load_6 int 32 regular  }
	{ acc_m0_28_load_6 int 32 regular  }
	{ acc_w1_load_6 int 32 regular  }
	{ acc_w1_4_load_6 int 32 regular  }
	{ acc_w1_8_load_6 int 32 regular  }
	{ acc_w1_12_load_6 int 32 regular  }
	{ acc_w1_16_load_6 int 32 regular  }
	{ acc_w1_20_load_6 int 32 regular  }
	{ acc_w1_24_load_6 int 32 regular  }
	{ acc_w1_28_load_6 int 32 regular  }
	{ acc_m1_load_6 int 32 regular  }
	{ acc_m1_4_load_6 int 32 regular  }
	{ acc_m1_8_load_6 int 32 regular  }
	{ acc_m1_12_load_6 int 32 regular  }
	{ acc_m1_16_load_6 int 32 regular  }
	{ acc_m1_20_load_6 int 32 regular  }
	{ acc_m1_24_load_6 int 32 regular  }
	{ acc_m1_28_load_6 int 32 regular  }
	{ acc_w0_1_load_6 int 32 regular  }
	{ acc_w0_5_load_6 int 32 regular  }
	{ acc_w0_9_load_6 int 32 regular  }
	{ acc_w0_13_load_6 int 32 regular  }
	{ acc_w0_17_load_6 int 32 regular  }
	{ acc_w0_21_load_6 int 32 regular  }
	{ acc_w0_25_load_6 int 32 regular  }
	{ acc_w0_29_load_6 int 32 regular  }
	{ acc_m0_1_load_6 int 32 regular  }
	{ acc_m0_5_load_6 int 32 regular  }
	{ acc_m0_9_load_6 int 32 regular  }
	{ acc_m0_13_load_6 int 32 regular  }
	{ acc_m0_17_load_6 int 32 regular  }
	{ acc_m0_21_load_6 int 32 regular  }
	{ acc_m0_25_load_6 int 32 regular  }
	{ acc_m0_29_load_6 int 32 regular  }
	{ acc_w1_1_load_6 int 32 regular  }
	{ acc_w1_5_load_6 int 32 regular  }
	{ acc_w1_9_load_6 int 32 regular  }
	{ acc_w1_13_load_6 int 32 regular  }
	{ acc_w1_17_load_6 int 32 regular  }
	{ acc_w1_21_load_6 int 32 regular  }
	{ acc_w1_25_load_6 int 32 regular  }
	{ acc_w1_29_load_6 int 32 regular  }
	{ acc_m1_1_load_6 int 32 regular  }
	{ acc_m1_5_load_6 int 32 regular  }
	{ acc_m1_9_load_6 int 32 regular  }
	{ acc_m1_13_load_6 int 32 regular  }
	{ acc_m1_17_load_6 int 32 regular  }
	{ acc_m1_21_load_6 int 32 regular  }
	{ acc_m1_25_load_6 int 32 regular  }
	{ acc_m1_29_load_6 int 32 regular  }
	{ acc_w0_2_load_6 int 32 regular  }
	{ acc_w0_6_load_6 int 32 regular  }
	{ acc_w0_10_load_6 int 32 regular  }
	{ acc_w0_14_load_6 int 32 regular  }
	{ acc_w0_18_load_6 int 32 regular  }
	{ acc_w0_22_load_6 int 32 regular  }
	{ acc_w0_26_load_6 int 32 regular  }
	{ acc_w0_30_load_6 int 32 regular  }
	{ acc_m0_2_load_6 int 32 regular  }
	{ acc_m0_6_load_6 int 32 regular  }
	{ acc_m0_10_load_6 int 32 regular  }
	{ acc_m0_14_load_6 int 32 regular  }
	{ acc_m0_18_load_6 int 32 regular  }
	{ acc_m0_22_load_6 int 32 regular  }
	{ acc_m0_26_load_6 int 32 regular  }
	{ acc_m0_30_load_6 int 32 regular  }
	{ acc_w1_2_load_6 int 32 regular  }
	{ acc_w1_6_load_6 int 32 regular  }
	{ acc_w1_10_load_6 int 32 regular  }
	{ acc_w1_14_load_6 int 32 regular  }
	{ acc_w1_18_load_6 int 32 regular  }
	{ acc_w1_22_load_6 int 32 regular  }
	{ acc_w1_26_load_6 int 32 regular  }
	{ acc_w1_30_load_6 int 32 regular  }
	{ acc_m1_2_load_6 int 32 regular  }
	{ acc_m1_6_load_6 int 32 regular  }
	{ acc_m1_10_load_6 int 32 regular  }
	{ acc_m1_14_load_6 int 32 regular  }
	{ acc_m1_18_load_6 int 32 regular  }
	{ acc_m1_22_load_6 int 32 regular  }
	{ acc_m1_26_load_6 int 32 regular  }
	{ acc_m1_30_load_6 int 32 regular  }
	{ acc_w0_3_load_6 int 32 regular  }
	{ acc_w0_7_load_6 int 32 regular  }
	{ acc_w0_11_load_6 int 32 regular  }
	{ acc_w0_15_load_6 int 32 regular  }
	{ acc_w0_19_load_6 int 32 regular  }
	{ acc_w0_23_load_6 int 32 regular  }
	{ acc_w0_27_load_6 int 32 regular  }
	{ acc_w0_31_load_6 int 32 regular  }
	{ acc_m0_3_load_6 int 32 regular  }
	{ acc_m0_7_load_6 int 32 regular  }
	{ acc_m0_11_load_6 int 32 regular  }
	{ acc_m0_15_load_6 int 32 regular  }
	{ acc_m0_19_load_6 int 32 regular  }
	{ acc_m0_23_load_6 int 32 regular  }
	{ acc_m0_27_load_6 int 32 regular  }
	{ acc_m0_31_load_6 int 32 regular  }
	{ acc_w1_3_load_6 int 32 regular  }
	{ acc_w1_7_load_6 int 32 regular  }
	{ acc_w1_11_load_6 int 32 regular  }
	{ acc_w1_15_load_6 int 32 regular  }
	{ acc_w1_19_load_6 int 32 regular  }
	{ acc_w1_23_load_6 int 32 regular  }
	{ acc_w1_27_load_6 int 32 regular  }
	{ acc_w1_31_load_6 int 32 regular  }
	{ acc_m1_3_load_6 int 32 regular  }
	{ acc_m1_7_load_6 int 32 regular  }
	{ acc_m1_11_load_6 int 32 regular  }
	{ acc_m1_15_load_6 int 32 regular  }
	{ acc_m1_19_load_6 int 32 regular  }
	{ acc_m1_23_load_6 int 32 regular  }
	{ acc_m1_27_load_6 int 32 regular  }
	{ acc_m1_31_load_6 int 32 regular  }
	{ d0_24_reload float 32 regular  }
	{ d0_25_reload float 32 regular  }
	{ d0_26_reload float 32 regular  }
	{ d0_27_reload float 32 regular  }
	{ d0_28_reload float 32 regular  }
	{ d0_29_reload float 32 regular  }
	{ d0_30_reload float 32 regular  }
	{ d0_31_reload float 32 regular  }
	{ dmin0_24_reload float 32 regular  }
	{ dmin0_25_reload float 32 regular  }
	{ dmin0_26_reload float 32 regular  }
	{ dmin0_27_reload float 32 regular  }
	{ dmin0_28_reload float 32 regular  }
	{ dmin0_29_reload float 32 regular  }
	{ dmin0_30_reload float 32 regular  }
	{ dmin0_31_reload float 32 regular  }
	{ d1_24_reload float 32 regular  }
	{ d1_25_reload float 32 regular  }
	{ d1_26_reload float 32 regular  }
	{ d1_27_reload float 32 regular  }
	{ d1_28_reload float 32 regular  }
	{ d1_29_reload float 32 regular  }
	{ d1_30_reload float 32 regular  }
	{ d1_31_reload float 32 regular  }
	{ dmin1_24_reload float 32 regular  }
	{ dmin1_25_reload float 32 regular  }
	{ dmin1_26_reload float 32 regular  }
	{ dmin1_27_reload float 32 regular  }
	{ dmin1_28_reload float 32 regular  }
	{ dmin1_29_reload float 32 regular  }
	{ dmin1_30_reload float 32 regular  }
	{ dmin1_31_reload float 32 regular  }
	{ phi_ln508_2_out int 56 regular {pointer 1}  }
	{ phi_ln510_2_out int 56 regular {pointer 1}  }
}
set hasAXIMCache 0
set l_AXIML2Cache [list]
set AXIMCacheInstDict [dict create]
set C_modelArgMapList {[ 
	{ "Name" : "phi_ln510_1_reload", "interface" : "wire", "bitwidth" : 56, "direction" : "READONLY"} , 
 	{ "Name" : "phi_ln508_1_reload", "interface" : "wire", "bitwidth" : 56, "direction" : "READONLY"} , 
 	{ "Name" : "acc_w0_load_6", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_w0_4_load_6", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_w0_8_load_6", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_w0_12_load_6", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_w0_16_load_6", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_w0_20_load_6", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_w0_24_load_6", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_w0_28_load_6", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_m0_load_6", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_m0_4_load_6", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_m0_8_load_6", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_m0_12_load_6", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_m0_16_load_6", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_m0_20_load_6", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_m0_24_load_6", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_m0_28_load_6", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_w1_load_6", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_w1_4_load_6", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_w1_8_load_6", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_w1_12_load_6", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_w1_16_load_6", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_w1_20_load_6", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_w1_24_load_6", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_w1_28_load_6", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_m1_load_6", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_m1_4_load_6", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_m1_8_load_6", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_m1_12_load_6", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_m1_16_load_6", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_m1_20_load_6", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_m1_24_load_6", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_m1_28_load_6", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_w0_1_load_6", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_w0_5_load_6", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_w0_9_load_6", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_w0_13_load_6", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_w0_17_load_6", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_w0_21_load_6", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_w0_25_load_6", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_w0_29_load_6", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_m0_1_load_6", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_m0_5_load_6", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_m0_9_load_6", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_m0_13_load_6", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_m0_17_load_6", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_m0_21_load_6", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_m0_25_load_6", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_m0_29_load_6", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_w1_1_load_6", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_w1_5_load_6", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_w1_9_load_6", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_w1_13_load_6", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_w1_17_load_6", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_w1_21_load_6", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_w1_25_load_6", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_w1_29_load_6", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_m1_1_load_6", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_m1_5_load_6", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_m1_9_load_6", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_m1_13_load_6", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_m1_17_load_6", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_m1_21_load_6", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_m1_25_load_6", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_m1_29_load_6", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_w0_2_load_6", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_w0_6_load_6", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_w0_10_load_6", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_w0_14_load_6", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_w0_18_load_6", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_w0_22_load_6", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_w0_26_load_6", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_w0_30_load_6", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_m0_2_load_6", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_m0_6_load_6", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_m0_10_load_6", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_m0_14_load_6", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_m0_18_load_6", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_m0_22_load_6", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_m0_26_load_6", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_m0_30_load_6", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_w1_2_load_6", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_w1_6_load_6", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_w1_10_load_6", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_w1_14_load_6", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_w1_18_load_6", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_w1_22_load_6", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_w1_26_load_6", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_w1_30_load_6", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_m1_2_load_6", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_m1_6_load_6", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_m1_10_load_6", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_m1_14_load_6", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_m1_18_load_6", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_m1_22_load_6", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_m1_26_load_6", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_m1_30_load_6", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_w0_3_load_6", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_w0_7_load_6", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_w0_11_load_6", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_w0_15_load_6", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_w0_19_load_6", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_w0_23_load_6", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_w0_27_load_6", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_w0_31_load_6", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_m0_3_load_6", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_m0_7_load_6", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_m0_11_load_6", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_m0_15_load_6", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_m0_19_load_6", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_m0_23_load_6", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_m0_27_load_6", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_m0_31_load_6", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_w1_3_load_6", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_w1_7_load_6", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_w1_11_load_6", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_w1_15_load_6", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_w1_19_load_6", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_w1_23_load_6", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_w1_27_load_6", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_w1_31_load_6", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_m1_3_load_6", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_m1_7_load_6", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_m1_11_load_6", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_m1_15_load_6", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_m1_19_load_6", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_m1_23_load_6", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_m1_27_load_6", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_m1_31_load_6", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "d0_24_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "d0_25_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "d0_26_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "d0_27_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "d0_28_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "d0_29_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "d0_30_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "d0_31_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "dmin0_24_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "dmin0_25_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "dmin0_26_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "dmin0_27_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "dmin0_28_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "dmin0_29_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "dmin0_30_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "dmin0_31_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "d1_24_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "d1_25_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "d1_26_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "d1_27_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "d1_28_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "d1_29_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "d1_30_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "d1_31_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "dmin1_24_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "dmin1_25_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "dmin1_26_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "dmin1_27_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "dmin1_28_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "dmin1_29_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "dmin1_30_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "dmin1_31_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "phi_ln508_2_out", "interface" : "wire", "bitwidth" : 56, "direction" : "WRITEONLY"} , 
 	{ "Name" : "phi_ln510_2_out", "interface" : "wire", "bitwidth" : 56, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 200
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ phi_ln510_1_reload sc_in sc_lv 56 signal 0 } 
	{ phi_ln508_1_reload sc_in sc_lv 56 signal 1 } 
	{ acc_w0_load_6 sc_in sc_lv 32 signal 2 } 
	{ acc_w0_4_load_6 sc_in sc_lv 32 signal 3 } 
	{ acc_w0_8_load_6 sc_in sc_lv 32 signal 4 } 
	{ acc_w0_12_load_6 sc_in sc_lv 32 signal 5 } 
	{ acc_w0_16_load_6 sc_in sc_lv 32 signal 6 } 
	{ acc_w0_20_load_6 sc_in sc_lv 32 signal 7 } 
	{ acc_w0_24_load_6 sc_in sc_lv 32 signal 8 } 
	{ acc_w0_28_load_6 sc_in sc_lv 32 signal 9 } 
	{ acc_m0_load_6 sc_in sc_lv 32 signal 10 } 
	{ acc_m0_4_load_6 sc_in sc_lv 32 signal 11 } 
	{ acc_m0_8_load_6 sc_in sc_lv 32 signal 12 } 
	{ acc_m0_12_load_6 sc_in sc_lv 32 signal 13 } 
	{ acc_m0_16_load_6 sc_in sc_lv 32 signal 14 } 
	{ acc_m0_20_load_6 sc_in sc_lv 32 signal 15 } 
	{ acc_m0_24_load_6 sc_in sc_lv 32 signal 16 } 
	{ acc_m0_28_load_6 sc_in sc_lv 32 signal 17 } 
	{ acc_w1_load_6 sc_in sc_lv 32 signal 18 } 
	{ acc_w1_4_load_6 sc_in sc_lv 32 signal 19 } 
	{ acc_w1_8_load_6 sc_in sc_lv 32 signal 20 } 
	{ acc_w1_12_load_6 sc_in sc_lv 32 signal 21 } 
	{ acc_w1_16_load_6 sc_in sc_lv 32 signal 22 } 
	{ acc_w1_20_load_6 sc_in sc_lv 32 signal 23 } 
	{ acc_w1_24_load_6 sc_in sc_lv 32 signal 24 } 
	{ acc_w1_28_load_6 sc_in sc_lv 32 signal 25 } 
	{ acc_m1_load_6 sc_in sc_lv 32 signal 26 } 
	{ acc_m1_4_load_6 sc_in sc_lv 32 signal 27 } 
	{ acc_m1_8_load_6 sc_in sc_lv 32 signal 28 } 
	{ acc_m1_12_load_6 sc_in sc_lv 32 signal 29 } 
	{ acc_m1_16_load_6 sc_in sc_lv 32 signal 30 } 
	{ acc_m1_20_load_6 sc_in sc_lv 32 signal 31 } 
	{ acc_m1_24_load_6 sc_in sc_lv 32 signal 32 } 
	{ acc_m1_28_load_6 sc_in sc_lv 32 signal 33 } 
	{ acc_w0_1_load_6 sc_in sc_lv 32 signal 34 } 
	{ acc_w0_5_load_6 sc_in sc_lv 32 signal 35 } 
	{ acc_w0_9_load_6 sc_in sc_lv 32 signal 36 } 
	{ acc_w0_13_load_6 sc_in sc_lv 32 signal 37 } 
	{ acc_w0_17_load_6 sc_in sc_lv 32 signal 38 } 
	{ acc_w0_21_load_6 sc_in sc_lv 32 signal 39 } 
	{ acc_w0_25_load_6 sc_in sc_lv 32 signal 40 } 
	{ acc_w0_29_load_6 sc_in sc_lv 32 signal 41 } 
	{ acc_m0_1_load_6 sc_in sc_lv 32 signal 42 } 
	{ acc_m0_5_load_6 sc_in sc_lv 32 signal 43 } 
	{ acc_m0_9_load_6 sc_in sc_lv 32 signal 44 } 
	{ acc_m0_13_load_6 sc_in sc_lv 32 signal 45 } 
	{ acc_m0_17_load_6 sc_in sc_lv 32 signal 46 } 
	{ acc_m0_21_load_6 sc_in sc_lv 32 signal 47 } 
	{ acc_m0_25_load_6 sc_in sc_lv 32 signal 48 } 
	{ acc_m0_29_load_6 sc_in sc_lv 32 signal 49 } 
	{ acc_w1_1_load_6 sc_in sc_lv 32 signal 50 } 
	{ acc_w1_5_load_6 sc_in sc_lv 32 signal 51 } 
	{ acc_w1_9_load_6 sc_in sc_lv 32 signal 52 } 
	{ acc_w1_13_load_6 sc_in sc_lv 32 signal 53 } 
	{ acc_w1_17_load_6 sc_in sc_lv 32 signal 54 } 
	{ acc_w1_21_load_6 sc_in sc_lv 32 signal 55 } 
	{ acc_w1_25_load_6 sc_in sc_lv 32 signal 56 } 
	{ acc_w1_29_load_6 sc_in sc_lv 32 signal 57 } 
	{ acc_m1_1_load_6 sc_in sc_lv 32 signal 58 } 
	{ acc_m1_5_load_6 sc_in sc_lv 32 signal 59 } 
	{ acc_m1_9_load_6 sc_in sc_lv 32 signal 60 } 
	{ acc_m1_13_load_6 sc_in sc_lv 32 signal 61 } 
	{ acc_m1_17_load_6 sc_in sc_lv 32 signal 62 } 
	{ acc_m1_21_load_6 sc_in sc_lv 32 signal 63 } 
	{ acc_m1_25_load_6 sc_in sc_lv 32 signal 64 } 
	{ acc_m1_29_load_6 sc_in sc_lv 32 signal 65 } 
	{ acc_w0_2_load_6 sc_in sc_lv 32 signal 66 } 
	{ acc_w0_6_load_6 sc_in sc_lv 32 signal 67 } 
	{ acc_w0_10_load_6 sc_in sc_lv 32 signal 68 } 
	{ acc_w0_14_load_6 sc_in sc_lv 32 signal 69 } 
	{ acc_w0_18_load_6 sc_in sc_lv 32 signal 70 } 
	{ acc_w0_22_load_6 sc_in sc_lv 32 signal 71 } 
	{ acc_w0_26_load_6 sc_in sc_lv 32 signal 72 } 
	{ acc_w0_30_load_6 sc_in sc_lv 32 signal 73 } 
	{ acc_m0_2_load_6 sc_in sc_lv 32 signal 74 } 
	{ acc_m0_6_load_6 sc_in sc_lv 32 signal 75 } 
	{ acc_m0_10_load_6 sc_in sc_lv 32 signal 76 } 
	{ acc_m0_14_load_6 sc_in sc_lv 32 signal 77 } 
	{ acc_m0_18_load_6 sc_in sc_lv 32 signal 78 } 
	{ acc_m0_22_load_6 sc_in sc_lv 32 signal 79 } 
	{ acc_m0_26_load_6 sc_in sc_lv 32 signal 80 } 
	{ acc_m0_30_load_6 sc_in sc_lv 32 signal 81 } 
	{ acc_w1_2_load_6 sc_in sc_lv 32 signal 82 } 
	{ acc_w1_6_load_6 sc_in sc_lv 32 signal 83 } 
	{ acc_w1_10_load_6 sc_in sc_lv 32 signal 84 } 
	{ acc_w1_14_load_6 sc_in sc_lv 32 signal 85 } 
	{ acc_w1_18_load_6 sc_in sc_lv 32 signal 86 } 
	{ acc_w1_22_load_6 sc_in sc_lv 32 signal 87 } 
	{ acc_w1_26_load_6 sc_in sc_lv 32 signal 88 } 
	{ acc_w1_30_load_6 sc_in sc_lv 32 signal 89 } 
	{ acc_m1_2_load_6 sc_in sc_lv 32 signal 90 } 
	{ acc_m1_6_load_6 sc_in sc_lv 32 signal 91 } 
	{ acc_m1_10_load_6 sc_in sc_lv 32 signal 92 } 
	{ acc_m1_14_load_6 sc_in sc_lv 32 signal 93 } 
	{ acc_m1_18_load_6 sc_in sc_lv 32 signal 94 } 
	{ acc_m1_22_load_6 sc_in sc_lv 32 signal 95 } 
	{ acc_m1_26_load_6 sc_in sc_lv 32 signal 96 } 
	{ acc_m1_30_load_6 sc_in sc_lv 32 signal 97 } 
	{ acc_w0_3_load_6 sc_in sc_lv 32 signal 98 } 
	{ acc_w0_7_load_6 sc_in sc_lv 32 signal 99 } 
	{ acc_w0_11_load_6 sc_in sc_lv 32 signal 100 } 
	{ acc_w0_15_load_6 sc_in sc_lv 32 signal 101 } 
	{ acc_w0_19_load_6 sc_in sc_lv 32 signal 102 } 
	{ acc_w0_23_load_6 sc_in sc_lv 32 signal 103 } 
	{ acc_w0_27_load_6 sc_in sc_lv 32 signal 104 } 
	{ acc_w0_31_load_6 sc_in sc_lv 32 signal 105 } 
	{ acc_m0_3_load_6 sc_in sc_lv 32 signal 106 } 
	{ acc_m0_7_load_6 sc_in sc_lv 32 signal 107 } 
	{ acc_m0_11_load_6 sc_in sc_lv 32 signal 108 } 
	{ acc_m0_15_load_6 sc_in sc_lv 32 signal 109 } 
	{ acc_m0_19_load_6 sc_in sc_lv 32 signal 110 } 
	{ acc_m0_23_load_6 sc_in sc_lv 32 signal 111 } 
	{ acc_m0_27_load_6 sc_in sc_lv 32 signal 112 } 
	{ acc_m0_31_load_6 sc_in sc_lv 32 signal 113 } 
	{ acc_w1_3_load_6 sc_in sc_lv 32 signal 114 } 
	{ acc_w1_7_load_6 sc_in sc_lv 32 signal 115 } 
	{ acc_w1_11_load_6 sc_in sc_lv 32 signal 116 } 
	{ acc_w1_15_load_6 sc_in sc_lv 32 signal 117 } 
	{ acc_w1_19_load_6 sc_in sc_lv 32 signal 118 } 
	{ acc_w1_23_load_6 sc_in sc_lv 32 signal 119 } 
	{ acc_w1_27_load_6 sc_in sc_lv 32 signal 120 } 
	{ acc_w1_31_load_6 sc_in sc_lv 32 signal 121 } 
	{ acc_m1_3_load_6 sc_in sc_lv 32 signal 122 } 
	{ acc_m1_7_load_6 sc_in sc_lv 32 signal 123 } 
	{ acc_m1_11_load_6 sc_in sc_lv 32 signal 124 } 
	{ acc_m1_15_load_6 sc_in sc_lv 32 signal 125 } 
	{ acc_m1_19_load_6 sc_in sc_lv 32 signal 126 } 
	{ acc_m1_23_load_6 sc_in sc_lv 32 signal 127 } 
	{ acc_m1_27_load_6 sc_in sc_lv 32 signal 128 } 
	{ acc_m1_31_load_6 sc_in sc_lv 32 signal 129 } 
	{ d0_24_reload sc_in sc_lv 32 signal 130 } 
	{ d0_25_reload sc_in sc_lv 32 signal 131 } 
	{ d0_26_reload sc_in sc_lv 32 signal 132 } 
	{ d0_27_reload sc_in sc_lv 32 signal 133 } 
	{ d0_28_reload sc_in sc_lv 32 signal 134 } 
	{ d0_29_reload sc_in sc_lv 32 signal 135 } 
	{ d0_30_reload sc_in sc_lv 32 signal 136 } 
	{ d0_31_reload sc_in sc_lv 32 signal 137 } 
	{ dmin0_24_reload sc_in sc_lv 32 signal 138 } 
	{ dmin0_25_reload sc_in sc_lv 32 signal 139 } 
	{ dmin0_26_reload sc_in sc_lv 32 signal 140 } 
	{ dmin0_27_reload sc_in sc_lv 32 signal 141 } 
	{ dmin0_28_reload sc_in sc_lv 32 signal 142 } 
	{ dmin0_29_reload sc_in sc_lv 32 signal 143 } 
	{ dmin0_30_reload sc_in sc_lv 32 signal 144 } 
	{ dmin0_31_reload sc_in sc_lv 32 signal 145 } 
	{ d1_24_reload sc_in sc_lv 32 signal 146 } 
	{ d1_25_reload sc_in sc_lv 32 signal 147 } 
	{ d1_26_reload sc_in sc_lv 32 signal 148 } 
	{ d1_27_reload sc_in sc_lv 32 signal 149 } 
	{ d1_28_reload sc_in sc_lv 32 signal 150 } 
	{ d1_29_reload sc_in sc_lv 32 signal 151 } 
	{ d1_30_reload sc_in sc_lv 32 signal 152 } 
	{ d1_31_reload sc_in sc_lv 32 signal 153 } 
	{ dmin1_24_reload sc_in sc_lv 32 signal 154 } 
	{ dmin1_25_reload sc_in sc_lv 32 signal 155 } 
	{ dmin1_26_reload sc_in sc_lv 32 signal 156 } 
	{ dmin1_27_reload sc_in sc_lv 32 signal 157 } 
	{ dmin1_28_reload sc_in sc_lv 32 signal 158 } 
	{ dmin1_29_reload sc_in sc_lv 32 signal 159 } 
	{ dmin1_30_reload sc_in sc_lv 32 signal 160 } 
	{ dmin1_31_reload sc_in sc_lv 32 signal 161 } 
	{ phi_ln508_2_out sc_out sc_lv 56 signal 162 } 
	{ phi_ln508_2_out_ap_vld sc_out sc_logic 1 outvld 162 } 
	{ phi_ln510_2_out sc_out sc_lv 56 signal 163 } 
	{ phi_ln510_2_out_ap_vld sc_out sc_logic 1 outvld 163 } 
	{ grp_fu_32184_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_32184_p_dout0 sc_in sc_lv 64 signal -1 } 
	{ grp_fu_32184_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_32187_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_32187_p_dout0 sc_in sc_lv 64 signal -1 } 
	{ grp_fu_32187_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_32190_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_32190_p_dout0 sc_in sc_lv 64 signal -1 } 
	{ grp_fu_32190_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_32193_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_32193_p_dout0 sc_in sc_lv 64 signal -1 } 
	{ grp_fu_32193_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_32196_p_din0 sc_out sc_lv 50 signal -1 } 
	{ grp_fu_32196_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_32196_p_dout0 sc_in sc_lv 80 signal -1 } 
	{ grp_fu_32196_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_32200_p_din0 sc_out sc_lv 50 signal -1 } 
	{ grp_fu_32200_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_32200_p_dout0 sc_in sc_lv 80 signal -1 } 
	{ grp_fu_32200_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_32204_p_din0 sc_out sc_lv 50 signal -1 } 
	{ grp_fu_32204_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_32204_p_dout0 sc_in sc_lv 80 signal -1 } 
	{ grp_fu_32204_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_32208_p_din0 sc_out sc_lv 50 signal -1 } 
	{ grp_fu_32208_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_32208_p_dout0 sc_in sc_lv 80 signal -1 } 
	{ grp_fu_32208_p_ce sc_out sc_logic 1 signal -1 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "phi_ln510_1_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":56, "type": "signal", "bundle":{"name": "phi_ln510_1_reload", "role": "default" }} , 
 	{ "name": "phi_ln508_1_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":56, "type": "signal", "bundle":{"name": "phi_ln508_1_reload", "role": "default" }} , 
 	{ "name": "acc_w0_load_6", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_w0_load_6", "role": "default" }} , 
 	{ "name": "acc_w0_4_load_6", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_w0_4_load_6", "role": "default" }} , 
 	{ "name": "acc_w0_8_load_6", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_w0_8_load_6", "role": "default" }} , 
 	{ "name": "acc_w0_12_load_6", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_w0_12_load_6", "role": "default" }} , 
 	{ "name": "acc_w0_16_load_6", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_w0_16_load_6", "role": "default" }} , 
 	{ "name": "acc_w0_20_load_6", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_w0_20_load_6", "role": "default" }} , 
 	{ "name": "acc_w0_24_load_6", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_w0_24_load_6", "role": "default" }} , 
 	{ "name": "acc_w0_28_load_6", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_w0_28_load_6", "role": "default" }} , 
 	{ "name": "acc_m0_load_6", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_m0_load_6", "role": "default" }} , 
 	{ "name": "acc_m0_4_load_6", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_m0_4_load_6", "role": "default" }} , 
 	{ "name": "acc_m0_8_load_6", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_m0_8_load_6", "role": "default" }} , 
 	{ "name": "acc_m0_12_load_6", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_m0_12_load_6", "role": "default" }} , 
 	{ "name": "acc_m0_16_load_6", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_m0_16_load_6", "role": "default" }} , 
 	{ "name": "acc_m0_20_load_6", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_m0_20_load_6", "role": "default" }} , 
 	{ "name": "acc_m0_24_load_6", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_m0_24_load_6", "role": "default" }} , 
 	{ "name": "acc_m0_28_load_6", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_m0_28_load_6", "role": "default" }} , 
 	{ "name": "acc_w1_load_6", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_w1_load_6", "role": "default" }} , 
 	{ "name": "acc_w1_4_load_6", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_w1_4_load_6", "role": "default" }} , 
 	{ "name": "acc_w1_8_load_6", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_w1_8_load_6", "role": "default" }} , 
 	{ "name": "acc_w1_12_load_6", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_w1_12_load_6", "role": "default" }} , 
 	{ "name": "acc_w1_16_load_6", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_w1_16_load_6", "role": "default" }} , 
 	{ "name": "acc_w1_20_load_6", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_w1_20_load_6", "role": "default" }} , 
 	{ "name": "acc_w1_24_load_6", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_w1_24_load_6", "role": "default" }} , 
 	{ "name": "acc_w1_28_load_6", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_w1_28_load_6", "role": "default" }} , 
 	{ "name": "acc_m1_load_6", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_m1_load_6", "role": "default" }} , 
 	{ "name": "acc_m1_4_load_6", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_m1_4_load_6", "role": "default" }} , 
 	{ "name": "acc_m1_8_load_6", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_m1_8_load_6", "role": "default" }} , 
 	{ "name": "acc_m1_12_load_6", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_m1_12_load_6", "role": "default" }} , 
 	{ "name": "acc_m1_16_load_6", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_m1_16_load_6", "role": "default" }} , 
 	{ "name": "acc_m1_20_load_6", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_m1_20_load_6", "role": "default" }} , 
 	{ "name": "acc_m1_24_load_6", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_m1_24_load_6", "role": "default" }} , 
 	{ "name": "acc_m1_28_load_6", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_m1_28_load_6", "role": "default" }} , 
 	{ "name": "acc_w0_1_load_6", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_w0_1_load_6", "role": "default" }} , 
 	{ "name": "acc_w0_5_load_6", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_w0_5_load_6", "role": "default" }} , 
 	{ "name": "acc_w0_9_load_6", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_w0_9_load_6", "role": "default" }} , 
 	{ "name": "acc_w0_13_load_6", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_w0_13_load_6", "role": "default" }} , 
 	{ "name": "acc_w0_17_load_6", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_w0_17_load_6", "role": "default" }} , 
 	{ "name": "acc_w0_21_load_6", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_w0_21_load_6", "role": "default" }} , 
 	{ "name": "acc_w0_25_load_6", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_w0_25_load_6", "role": "default" }} , 
 	{ "name": "acc_w0_29_load_6", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_w0_29_load_6", "role": "default" }} , 
 	{ "name": "acc_m0_1_load_6", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_m0_1_load_6", "role": "default" }} , 
 	{ "name": "acc_m0_5_load_6", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_m0_5_load_6", "role": "default" }} , 
 	{ "name": "acc_m0_9_load_6", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_m0_9_load_6", "role": "default" }} , 
 	{ "name": "acc_m0_13_load_6", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_m0_13_load_6", "role": "default" }} , 
 	{ "name": "acc_m0_17_load_6", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_m0_17_load_6", "role": "default" }} , 
 	{ "name": "acc_m0_21_load_6", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_m0_21_load_6", "role": "default" }} , 
 	{ "name": "acc_m0_25_load_6", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_m0_25_load_6", "role": "default" }} , 
 	{ "name": "acc_m0_29_load_6", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_m0_29_load_6", "role": "default" }} , 
 	{ "name": "acc_w1_1_load_6", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_w1_1_load_6", "role": "default" }} , 
 	{ "name": "acc_w1_5_load_6", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_w1_5_load_6", "role": "default" }} , 
 	{ "name": "acc_w1_9_load_6", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_w1_9_load_6", "role": "default" }} , 
 	{ "name": "acc_w1_13_load_6", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_w1_13_load_6", "role": "default" }} , 
 	{ "name": "acc_w1_17_load_6", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_w1_17_load_6", "role": "default" }} , 
 	{ "name": "acc_w1_21_load_6", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_w1_21_load_6", "role": "default" }} , 
 	{ "name": "acc_w1_25_load_6", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_w1_25_load_6", "role": "default" }} , 
 	{ "name": "acc_w1_29_load_6", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_w1_29_load_6", "role": "default" }} , 
 	{ "name": "acc_m1_1_load_6", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_m1_1_load_6", "role": "default" }} , 
 	{ "name": "acc_m1_5_load_6", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_m1_5_load_6", "role": "default" }} , 
 	{ "name": "acc_m1_9_load_6", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_m1_9_load_6", "role": "default" }} , 
 	{ "name": "acc_m1_13_load_6", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_m1_13_load_6", "role": "default" }} , 
 	{ "name": "acc_m1_17_load_6", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_m1_17_load_6", "role": "default" }} , 
 	{ "name": "acc_m1_21_load_6", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_m1_21_load_6", "role": "default" }} , 
 	{ "name": "acc_m1_25_load_6", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_m1_25_load_6", "role": "default" }} , 
 	{ "name": "acc_m1_29_load_6", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_m1_29_load_6", "role": "default" }} , 
 	{ "name": "acc_w0_2_load_6", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_w0_2_load_6", "role": "default" }} , 
 	{ "name": "acc_w0_6_load_6", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_w0_6_load_6", "role": "default" }} , 
 	{ "name": "acc_w0_10_load_6", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_w0_10_load_6", "role": "default" }} , 
 	{ "name": "acc_w0_14_load_6", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_w0_14_load_6", "role": "default" }} , 
 	{ "name": "acc_w0_18_load_6", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_w0_18_load_6", "role": "default" }} , 
 	{ "name": "acc_w0_22_load_6", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_w0_22_load_6", "role": "default" }} , 
 	{ "name": "acc_w0_26_load_6", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_w0_26_load_6", "role": "default" }} , 
 	{ "name": "acc_w0_30_load_6", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_w0_30_load_6", "role": "default" }} , 
 	{ "name": "acc_m0_2_load_6", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_m0_2_load_6", "role": "default" }} , 
 	{ "name": "acc_m0_6_load_6", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_m0_6_load_6", "role": "default" }} , 
 	{ "name": "acc_m0_10_load_6", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_m0_10_load_6", "role": "default" }} , 
 	{ "name": "acc_m0_14_load_6", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_m0_14_load_6", "role": "default" }} , 
 	{ "name": "acc_m0_18_load_6", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_m0_18_load_6", "role": "default" }} , 
 	{ "name": "acc_m0_22_load_6", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_m0_22_load_6", "role": "default" }} , 
 	{ "name": "acc_m0_26_load_6", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_m0_26_load_6", "role": "default" }} , 
 	{ "name": "acc_m0_30_load_6", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_m0_30_load_6", "role": "default" }} , 
 	{ "name": "acc_w1_2_load_6", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_w1_2_load_6", "role": "default" }} , 
 	{ "name": "acc_w1_6_load_6", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_w1_6_load_6", "role": "default" }} , 
 	{ "name": "acc_w1_10_load_6", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_w1_10_load_6", "role": "default" }} , 
 	{ "name": "acc_w1_14_load_6", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_w1_14_load_6", "role": "default" }} , 
 	{ "name": "acc_w1_18_load_6", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_w1_18_load_6", "role": "default" }} , 
 	{ "name": "acc_w1_22_load_6", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_w1_22_load_6", "role": "default" }} , 
 	{ "name": "acc_w1_26_load_6", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_w1_26_load_6", "role": "default" }} , 
 	{ "name": "acc_w1_30_load_6", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_w1_30_load_6", "role": "default" }} , 
 	{ "name": "acc_m1_2_load_6", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_m1_2_load_6", "role": "default" }} , 
 	{ "name": "acc_m1_6_load_6", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_m1_6_load_6", "role": "default" }} , 
 	{ "name": "acc_m1_10_load_6", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_m1_10_load_6", "role": "default" }} , 
 	{ "name": "acc_m1_14_load_6", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_m1_14_load_6", "role": "default" }} , 
 	{ "name": "acc_m1_18_load_6", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_m1_18_load_6", "role": "default" }} , 
 	{ "name": "acc_m1_22_load_6", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_m1_22_load_6", "role": "default" }} , 
 	{ "name": "acc_m1_26_load_6", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_m1_26_load_6", "role": "default" }} , 
 	{ "name": "acc_m1_30_load_6", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_m1_30_load_6", "role": "default" }} , 
 	{ "name": "acc_w0_3_load_6", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_w0_3_load_6", "role": "default" }} , 
 	{ "name": "acc_w0_7_load_6", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_w0_7_load_6", "role": "default" }} , 
 	{ "name": "acc_w0_11_load_6", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_w0_11_load_6", "role": "default" }} , 
 	{ "name": "acc_w0_15_load_6", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_w0_15_load_6", "role": "default" }} , 
 	{ "name": "acc_w0_19_load_6", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_w0_19_load_6", "role": "default" }} , 
 	{ "name": "acc_w0_23_load_6", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_w0_23_load_6", "role": "default" }} , 
 	{ "name": "acc_w0_27_load_6", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_w0_27_load_6", "role": "default" }} , 
 	{ "name": "acc_w0_31_load_6", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_w0_31_load_6", "role": "default" }} , 
 	{ "name": "acc_m0_3_load_6", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_m0_3_load_6", "role": "default" }} , 
 	{ "name": "acc_m0_7_load_6", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_m0_7_load_6", "role": "default" }} , 
 	{ "name": "acc_m0_11_load_6", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_m0_11_load_6", "role": "default" }} , 
 	{ "name": "acc_m0_15_load_6", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_m0_15_load_6", "role": "default" }} , 
 	{ "name": "acc_m0_19_load_6", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_m0_19_load_6", "role": "default" }} , 
 	{ "name": "acc_m0_23_load_6", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_m0_23_load_6", "role": "default" }} , 
 	{ "name": "acc_m0_27_load_6", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_m0_27_load_6", "role": "default" }} , 
 	{ "name": "acc_m0_31_load_6", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_m0_31_load_6", "role": "default" }} , 
 	{ "name": "acc_w1_3_load_6", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_w1_3_load_6", "role": "default" }} , 
 	{ "name": "acc_w1_7_load_6", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_w1_7_load_6", "role": "default" }} , 
 	{ "name": "acc_w1_11_load_6", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_w1_11_load_6", "role": "default" }} , 
 	{ "name": "acc_w1_15_load_6", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_w1_15_load_6", "role": "default" }} , 
 	{ "name": "acc_w1_19_load_6", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_w1_19_load_6", "role": "default" }} , 
 	{ "name": "acc_w1_23_load_6", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_w1_23_load_6", "role": "default" }} , 
 	{ "name": "acc_w1_27_load_6", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_w1_27_load_6", "role": "default" }} , 
 	{ "name": "acc_w1_31_load_6", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_w1_31_load_6", "role": "default" }} , 
 	{ "name": "acc_m1_3_load_6", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_m1_3_load_6", "role": "default" }} , 
 	{ "name": "acc_m1_7_load_6", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_m1_7_load_6", "role": "default" }} , 
 	{ "name": "acc_m1_11_load_6", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_m1_11_load_6", "role": "default" }} , 
 	{ "name": "acc_m1_15_load_6", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_m1_15_load_6", "role": "default" }} , 
 	{ "name": "acc_m1_19_load_6", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_m1_19_load_6", "role": "default" }} , 
 	{ "name": "acc_m1_23_load_6", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_m1_23_load_6", "role": "default" }} , 
 	{ "name": "acc_m1_27_load_6", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_m1_27_load_6", "role": "default" }} , 
 	{ "name": "acc_m1_31_load_6", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_m1_31_load_6", "role": "default" }} , 
 	{ "name": "d0_24_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "d0_24_reload", "role": "default" }} , 
 	{ "name": "d0_25_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "d0_25_reload", "role": "default" }} , 
 	{ "name": "d0_26_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "d0_26_reload", "role": "default" }} , 
 	{ "name": "d0_27_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "d0_27_reload", "role": "default" }} , 
 	{ "name": "d0_28_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "d0_28_reload", "role": "default" }} , 
 	{ "name": "d0_29_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "d0_29_reload", "role": "default" }} , 
 	{ "name": "d0_30_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "d0_30_reload", "role": "default" }} , 
 	{ "name": "d0_31_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "d0_31_reload", "role": "default" }} , 
 	{ "name": "dmin0_24_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "dmin0_24_reload", "role": "default" }} , 
 	{ "name": "dmin0_25_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "dmin0_25_reload", "role": "default" }} , 
 	{ "name": "dmin0_26_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "dmin0_26_reload", "role": "default" }} , 
 	{ "name": "dmin0_27_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "dmin0_27_reload", "role": "default" }} , 
 	{ "name": "dmin0_28_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "dmin0_28_reload", "role": "default" }} , 
 	{ "name": "dmin0_29_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "dmin0_29_reload", "role": "default" }} , 
 	{ "name": "dmin0_30_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "dmin0_30_reload", "role": "default" }} , 
 	{ "name": "dmin0_31_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "dmin0_31_reload", "role": "default" }} , 
 	{ "name": "d1_24_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "d1_24_reload", "role": "default" }} , 
 	{ "name": "d1_25_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "d1_25_reload", "role": "default" }} , 
 	{ "name": "d1_26_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "d1_26_reload", "role": "default" }} , 
 	{ "name": "d1_27_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "d1_27_reload", "role": "default" }} , 
 	{ "name": "d1_28_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "d1_28_reload", "role": "default" }} , 
 	{ "name": "d1_29_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "d1_29_reload", "role": "default" }} , 
 	{ "name": "d1_30_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "d1_30_reload", "role": "default" }} , 
 	{ "name": "d1_31_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "d1_31_reload", "role": "default" }} , 
 	{ "name": "dmin1_24_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "dmin1_24_reload", "role": "default" }} , 
 	{ "name": "dmin1_25_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "dmin1_25_reload", "role": "default" }} , 
 	{ "name": "dmin1_26_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "dmin1_26_reload", "role": "default" }} , 
 	{ "name": "dmin1_27_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "dmin1_27_reload", "role": "default" }} , 
 	{ "name": "dmin1_28_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "dmin1_28_reload", "role": "default" }} , 
 	{ "name": "dmin1_29_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "dmin1_29_reload", "role": "default" }} , 
 	{ "name": "dmin1_30_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "dmin1_30_reload", "role": "default" }} , 
 	{ "name": "dmin1_31_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "dmin1_31_reload", "role": "default" }} , 
 	{ "name": "phi_ln508_2_out", "direction": "out", "datatype": "sc_lv", "bitwidth":56, "type": "signal", "bundle":{"name": "phi_ln508_2_out", "role": "default" }} , 
 	{ "name": "phi_ln508_2_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "phi_ln508_2_out", "role": "ap_vld" }} , 
 	{ "name": "phi_ln510_2_out", "direction": "out", "datatype": "sc_lv", "bitwidth":56, "type": "signal", "bundle":{"name": "phi_ln510_2_out", "role": "default" }} , 
 	{ "name": "phi_ln510_2_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "phi_ln510_2_out", "role": "ap_vld" }} , 
 	{ "name": "grp_fu_32184_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_32184_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_32184_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "grp_fu_32184_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_32184_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_32184_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_32187_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_32187_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_32187_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "grp_fu_32187_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_32187_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_32187_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_32190_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_32190_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_32190_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "grp_fu_32190_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_32190_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_32190_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_32193_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_32193_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_32193_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "grp_fu_32193_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_32193_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_32193_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_32196_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":50, "type": "signal", "bundle":{"name": "grp_fu_32196_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_32196_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_32196_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_32196_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":80, "type": "signal", "bundle":{"name": "grp_fu_32196_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_32196_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_32196_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_32200_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":50, "type": "signal", "bundle":{"name": "grp_fu_32200_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_32200_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_32200_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_32200_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":80, "type": "signal", "bundle":{"name": "grp_fu_32200_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_32200_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_32200_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_32204_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":50, "type": "signal", "bundle":{"name": "grp_fu_32204_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_32204_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_32204_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_32204_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":80, "type": "signal", "bundle":{"name": "grp_fu_32204_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_32204_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_32204_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_32208_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":50, "type": "signal", "bundle":{"name": "grp_fu_32208_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_32208_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_32208_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_32208_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":80, "type": "signal", "bundle":{"name": "grp_fu_32208_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_32208_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_32208_p_ce", "role": "default" }}  ]}

set ArgLastReadFirstWriteLatency {
	mac_blocks_down_q4k_k2_Pipeline_REDUCE_GRP11 {
		phi_ln510_1_reload {Type I LastRead 0 FirstWrite -1}
		phi_ln508_1_reload {Type I LastRead 0 FirstWrite -1}
		acc_w0_load_6 {Type I LastRead 0 FirstWrite -1}
		acc_w0_4_load_6 {Type I LastRead 0 FirstWrite -1}
		acc_w0_8_load_6 {Type I LastRead 0 FirstWrite -1}
		acc_w0_12_load_6 {Type I LastRead 0 FirstWrite -1}
		acc_w0_16_load_6 {Type I LastRead 0 FirstWrite -1}
		acc_w0_20_load_6 {Type I LastRead 0 FirstWrite -1}
		acc_w0_24_load_6 {Type I LastRead 0 FirstWrite -1}
		acc_w0_28_load_6 {Type I LastRead 0 FirstWrite -1}
		acc_m0_load_6 {Type I LastRead 0 FirstWrite -1}
		acc_m0_4_load_6 {Type I LastRead 0 FirstWrite -1}
		acc_m0_8_load_6 {Type I LastRead 0 FirstWrite -1}
		acc_m0_12_load_6 {Type I LastRead 0 FirstWrite -1}
		acc_m0_16_load_6 {Type I LastRead 0 FirstWrite -1}
		acc_m0_20_load_6 {Type I LastRead 0 FirstWrite -1}
		acc_m0_24_load_6 {Type I LastRead 0 FirstWrite -1}
		acc_m0_28_load_6 {Type I LastRead 0 FirstWrite -1}
		acc_w1_load_6 {Type I LastRead 0 FirstWrite -1}
		acc_w1_4_load_6 {Type I LastRead 0 FirstWrite -1}
		acc_w1_8_load_6 {Type I LastRead 0 FirstWrite -1}
		acc_w1_12_load_6 {Type I LastRead 0 FirstWrite -1}
		acc_w1_16_load_6 {Type I LastRead 0 FirstWrite -1}
		acc_w1_20_load_6 {Type I LastRead 0 FirstWrite -1}
		acc_w1_24_load_6 {Type I LastRead 0 FirstWrite -1}
		acc_w1_28_load_6 {Type I LastRead 0 FirstWrite -1}
		acc_m1_load_6 {Type I LastRead 0 FirstWrite -1}
		acc_m1_4_load_6 {Type I LastRead 0 FirstWrite -1}
		acc_m1_8_load_6 {Type I LastRead 0 FirstWrite -1}
		acc_m1_12_load_6 {Type I LastRead 0 FirstWrite -1}
		acc_m1_16_load_6 {Type I LastRead 0 FirstWrite -1}
		acc_m1_20_load_6 {Type I LastRead 0 FirstWrite -1}
		acc_m1_24_load_6 {Type I LastRead 0 FirstWrite -1}
		acc_m1_28_load_6 {Type I LastRead 0 FirstWrite -1}
		acc_w0_1_load_6 {Type I LastRead 0 FirstWrite -1}
		acc_w0_5_load_6 {Type I LastRead 0 FirstWrite -1}
		acc_w0_9_load_6 {Type I LastRead 0 FirstWrite -1}
		acc_w0_13_load_6 {Type I LastRead 0 FirstWrite -1}
		acc_w0_17_load_6 {Type I LastRead 0 FirstWrite -1}
		acc_w0_21_load_6 {Type I LastRead 0 FirstWrite -1}
		acc_w0_25_load_6 {Type I LastRead 0 FirstWrite -1}
		acc_w0_29_load_6 {Type I LastRead 0 FirstWrite -1}
		acc_m0_1_load_6 {Type I LastRead 0 FirstWrite -1}
		acc_m0_5_load_6 {Type I LastRead 0 FirstWrite -1}
		acc_m0_9_load_6 {Type I LastRead 0 FirstWrite -1}
		acc_m0_13_load_6 {Type I LastRead 0 FirstWrite -1}
		acc_m0_17_load_6 {Type I LastRead 0 FirstWrite -1}
		acc_m0_21_load_6 {Type I LastRead 0 FirstWrite -1}
		acc_m0_25_load_6 {Type I LastRead 0 FirstWrite -1}
		acc_m0_29_load_6 {Type I LastRead 0 FirstWrite -1}
		acc_w1_1_load_6 {Type I LastRead 0 FirstWrite -1}
		acc_w1_5_load_6 {Type I LastRead 0 FirstWrite -1}
		acc_w1_9_load_6 {Type I LastRead 0 FirstWrite -1}
		acc_w1_13_load_6 {Type I LastRead 0 FirstWrite -1}
		acc_w1_17_load_6 {Type I LastRead 0 FirstWrite -1}
		acc_w1_21_load_6 {Type I LastRead 0 FirstWrite -1}
		acc_w1_25_load_6 {Type I LastRead 0 FirstWrite -1}
		acc_w1_29_load_6 {Type I LastRead 0 FirstWrite -1}
		acc_m1_1_load_6 {Type I LastRead 0 FirstWrite -1}
		acc_m1_5_load_6 {Type I LastRead 0 FirstWrite -1}
		acc_m1_9_load_6 {Type I LastRead 0 FirstWrite -1}
		acc_m1_13_load_6 {Type I LastRead 0 FirstWrite -1}
		acc_m1_17_load_6 {Type I LastRead 0 FirstWrite -1}
		acc_m1_21_load_6 {Type I LastRead 0 FirstWrite -1}
		acc_m1_25_load_6 {Type I LastRead 0 FirstWrite -1}
		acc_m1_29_load_6 {Type I LastRead 0 FirstWrite -1}
		acc_w0_2_load_6 {Type I LastRead 0 FirstWrite -1}
		acc_w0_6_load_6 {Type I LastRead 0 FirstWrite -1}
		acc_w0_10_load_6 {Type I LastRead 0 FirstWrite -1}
		acc_w0_14_load_6 {Type I LastRead 0 FirstWrite -1}
		acc_w0_18_load_6 {Type I LastRead 0 FirstWrite -1}
		acc_w0_22_load_6 {Type I LastRead 0 FirstWrite -1}
		acc_w0_26_load_6 {Type I LastRead 0 FirstWrite -1}
		acc_w0_30_load_6 {Type I LastRead 0 FirstWrite -1}
		acc_m0_2_load_6 {Type I LastRead 0 FirstWrite -1}
		acc_m0_6_load_6 {Type I LastRead 0 FirstWrite -1}
		acc_m0_10_load_6 {Type I LastRead 0 FirstWrite -1}
		acc_m0_14_load_6 {Type I LastRead 0 FirstWrite -1}
		acc_m0_18_load_6 {Type I LastRead 0 FirstWrite -1}
		acc_m0_22_load_6 {Type I LastRead 0 FirstWrite -1}
		acc_m0_26_load_6 {Type I LastRead 0 FirstWrite -1}
		acc_m0_30_load_6 {Type I LastRead 0 FirstWrite -1}
		acc_w1_2_load_6 {Type I LastRead 0 FirstWrite -1}
		acc_w1_6_load_6 {Type I LastRead 0 FirstWrite -1}
		acc_w1_10_load_6 {Type I LastRead 0 FirstWrite -1}
		acc_w1_14_load_6 {Type I LastRead 0 FirstWrite -1}
		acc_w1_18_load_6 {Type I LastRead 0 FirstWrite -1}
		acc_w1_22_load_6 {Type I LastRead 0 FirstWrite -1}
		acc_w1_26_load_6 {Type I LastRead 0 FirstWrite -1}
		acc_w1_30_load_6 {Type I LastRead 0 FirstWrite -1}
		acc_m1_2_load_6 {Type I LastRead 0 FirstWrite -1}
		acc_m1_6_load_6 {Type I LastRead 0 FirstWrite -1}
		acc_m1_10_load_6 {Type I LastRead 0 FirstWrite -1}
		acc_m1_14_load_6 {Type I LastRead 0 FirstWrite -1}
		acc_m1_18_load_6 {Type I LastRead 0 FirstWrite -1}
		acc_m1_22_load_6 {Type I LastRead 0 FirstWrite -1}
		acc_m1_26_load_6 {Type I LastRead 0 FirstWrite -1}
		acc_m1_30_load_6 {Type I LastRead 0 FirstWrite -1}
		acc_w0_3_load_6 {Type I LastRead 0 FirstWrite -1}
		acc_w0_7_load_6 {Type I LastRead 0 FirstWrite -1}
		acc_w0_11_load_6 {Type I LastRead 0 FirstWrite -1}
		acc_w0_15_load_6 {Type I LastRead 0 FirstWrite -1}
		acc_w0_19_load_6 {Type I LastRead 0 FirstWrite -1}
		acc_w0_23_load_6 {Type I LastRead 0 FirstWrite -1}
		acc_w0_27_load_6 {Type I LastRead 0 FirstWrite -1}
		acc_w0_31_load_6 {Type I LastRead 0 FirstWrite -1}
		acc_m0_3_load_6 {Type I LastRead 0 FirstWrite -1}
		acc_m0_7_load_6 {Type I LastRead 0 FirstWrite -1}
		acc_m0_11_load_6 {Type I LastRead 0 FirstWrite -1}
		acc_m0_15_load_6 {Type I LastRead 0 FirstWrite -1}
		acc_m0_19_load_6 {Type I LastRead 0 FirstWrite -1}
		acc_m0_23_load_6 {Type I LastRead 0 FirstWrite -1}
		acc_m0_27_load_6 {Type I LastRead 0 FirstWrite -1}
		acc_m0_31_load_6 {Type I LastRead 0 FirstWrite -1}
		acc_w1_3_load_6 {Type I LastRead 0 FirstWrite -1}
		acc_w1_7_load_6 {Type I LastRead 0 FirstWrite -1}
		acc_w1_11_load_6 {Type I LastRead 0 FirstWrite -1}
		acc_w1_15_load_6 {Type I LastRead 0 FirstWrite -1}
		acc_w1_19_load_6 {Type I LastRead 0 FirstWrite -1}
		acc_w1_23_load_6 {Type I LastRead 0 FirstWrite -1}
		acc_w1_27_load_6 {Type I LastRead 0 FirstWrite -1}
		acc_w1_31_load_6 {Type I LastRead 0 FirstWrite -1}
		acc_m1_3_load_6 {Type I LastRead 0 FirstWrite -1}
		acc_m1_7_load_6 {Type I LastRead 0 FirstWrite -1}
		acc_m1_11_load_6 {Type I LastRead 0 FirstWrite -1}
		acc_m1_15_load_6 {Type I LastRead 0 FirstWrite -1}
		acc_m1_19_load_6 {Type I LastRead 0 FirstWrite -1}
		acc_m1_23_load_6 {Type I LastRead 0 FirstWrite -1}
		acc_m1_27_load_6 {Type I LastRead 0 FirstWrite -1}
		acc_m1_31_load_6 {Type I LastRead 0 FirstWrite -1}
		d0_24_reload {Type I LastRead 0 FirstWrite -1}
		d0_25_reload {Type I LastRead 0 FirstWrite -1}
		d0_26_reload {Type I LastRead 0 FirstWrite -1}
		d0_27_reload {Type I LastRead 0 FirstWrite -1}
		d0_28_reload {Type I LastRead 0 FirstWrite -1}
		d0_29_reload {Type I LastRead 0 FirstWrite -1}
		d0_30_reload {Type I LastRead 0 FirstWrite -1}
		d0_31_reload {Type I LastRead 0 FirstWrite -1}
		dmin0_24_reload {Type I LastRead 0 FirstWrite -1}
		dmin0_25_reload {Type I LastRead 0 FirstWrite -1}
		dmin0_26_reload {Type I LastRead 0 FirstWrite -1}
		dmin0_27_reload {Type I LastRead 0 FirstWrite -1}
		dmin0_28_reload {Type I LastRead 0 FirstWrite -1}
		dmin0_29_reload {Type I LastRead 0 FirstWrite -1}
		dmin0_30_reload {Type I LastRead 0 FirstWrite -1}
		dmin0_31_reload {Type I LastRead 0 FirstWrite -1}
		d1_24_reload {Type I LastRead 0 FirstWrite -1}
		d1_25_reload {Type I LastRead 0 FirstWrite -1}
		d1_26_reload {Type I LastRead 0 FirstWrite -1}
		d1_27_reload {Type I LastRead 0 FirstWrite -1}
		d1_28_reload {Type I LastRead 0 FirstWrite -1}
		d1_29_reload {Type I LastRead 0 FirstWrite -1}
		d1_30_reload {Type I LastRead 0 FirstWrite -1}
		d1_31_reload {Type I LastRead 0 FirstWrite -1}
		dmin1_24_reload {Type I LastRead 0 FirstWrite -1}
		dmin1_25_reload {Type I LastRead 0 FirstWrite -1}
		dmin1_26_reload {Type I LastRead 0 FirstWrite -1}
		dmin1_27_reload {Type I LastRead 0 FirstWrite -1}
		dmin1_28_reload {Type I LastRead 0 FirstWrite -1}
		dmin1_29_reload {Type I LastRead 0 FirstWrite -1}
		dmin1_30_reload {Type I LastRead 0 FirstWrite -1}
		dmin1_31_reload {Type I LastRead 0 FirstWrite -1}
		phi_ln508_2_out {Type O LastRead -1 FirstWrite 10}
		phi_ln510_2_out {Type O LastRead -1 FirstWrite 10}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "20", "Max" : "20"}
	, {"Name" : "Interval", "Min" : "20", "Max" : "20"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	phi_ln510_1_reload { ap_none {  { phi_ln510_1_reload in_data 0 56 } } }
	phi_ln508_1_reload { ap_none {  { phi_ln508_1_reload in_data 0 56 } } }
	acc_w0_load_6 { ap_none {  { acc_w0_load_6 in_data 0 32 } } }
	acc_w0_4_load_6 { ap_none {  { acc_w0_4_load_6 in_data 0 32 } } }
	acc_w0_8_load_6 { ap_none {  { acc_w0_8_load_6 in_data 0 32 } } }
	acc_w0_12_load_6 { ap_none {  { acc_w0_12_load_6 in_data 0 32 } } }
	acc_w0_16_load_6 { ap_none {  { acc_w0_16_load_6 in_data 0 32 } } }
	acc_w0_20_load_6 { ap_none {  { acc_w0_20_load_6 in_data 0 32 } } }
	acc_w0_24_load_6 { ap_none {  { acc_w0_24_load_6 in_data 0 32 } } }
	acc_w0_28_load_6 { ap_none {  { acc_w0_28_load_6 in_data 0 32 } } }
	acc_m0_load_6 { ap_none {  { acc_m0_load_6 in_data 0 32 } } }
	acc_m0_4_load_6 { ap_none {  { acc_m0_4_load_6 in_data 0 32 } } }
	acc_m0_8_load_6 { ap_none {  { acc_m0_8_load_6 in_data 0 32 } } }
	acc_m0_12_load_6 { ap_none {  { acc_m0_12_load_6 in_data 0 32 } } }
	acc_m0_16_load_6 { ap_none {  { acc_m0_16_load_6 in_data 0 32 } } }
	acc_m0_20_load_6 { ap_none {  { acc_m0_20_load_6 in_data 0 32 } } }
	acc_m0_24_load_6 { ap_none {  { acc_m0_24_load_6 in_data 0 32 } } }
	acc_m0_28_load_6 { ap_none {  { acc_m0_28_load_6 in_data 0 32 } } }
	acc_w1_load_6 { ap_none {  { acc_w1_load_6 in_data 0 32 } } }
	acc_w1_4_load_6 { ap_none {  { acc_w1_4_load_6 in_data 0 32 } } }
	acc_w1_8_load_6 { ap_none {  { acc_w1_8_load_6 in_data 0 32 } } }
	acc_w1_12_load_6 { ap_none {  { acc_w1_12_load_6 in_data 0 32 } } }
	acc_w1_16_load_6 { ap_none {  { acc_w1_16_load_6 in_data 0 32 } } }
	acc_w1_20_load_6 { ap_none {  { acc_w1_20_load_6 in_data 0 32 } } }
	acc_w1_24_load_6 { ap_none {  { acc_w1_24_load_6 in_data 0 32 } } }
	acc_w1_28_load_6 { ap_none {  { acc_w1_28_load_6 in_data 0 32 } } }
	acc_m1_load_6 { ap_none {  { acc_m1_load_6 in_data 0 32 } } }
	acc_m1_4_load_6 { ap_none {  { acc_m1_4_load_6 in_data 0 32 } } }
	acc_m1_8_load_6 { ap_none {  { acc_m1_8_load_6 in_data 0 32 } } }
	acc_m1_12_load_6 { ap_none {  { acc_m1_12_load_6 in_data 0 32 } } }
	acc_m1_16_load_6 { ap_none {  { acc_m1_16_load_6 in_data 0 32 } } }
	acc_m1_20_load_6 { ap_none {  { acc_m1_20_load_6 in_data 0 32 } } }
	acc_m1_24_load_6 { ap_none {  { acc_m1_24_load_6 in_data 0 32 } } }
	acc_m1_28_load_6 { ap_none {  { acc_m1_28_load_6 in_data 0 32 } } }
	acc_w0_1_load_6 { ap_none {  { acc_w0_1_load_6 in_data 0 32 } } }
	acc_w0_5_load_6 { ap_none {  { acc_w0_5_load_6 in_data 0 32 } } }
	acc_w0_9_load_6 { ap_none {  { acc_w0_9_load_6 in_data 0 32 } } }
	acc_w0_13_load_6 { ap_none {  { acc_w0_13_load_6 in_data 0 32 } } }
	acc_w0_17_load_6 { ap_none {  { acc_w0_17_load_6 in_data 0 32 } } }
	acc_w0_21_load_6 { ap_none {  { acc_w0_21_load_6 in_data 0 32 } } }
	acc_w0_25_load_6 { ap_none {  { acc_w0_25_load_6 in_data 0 32 } } }
	acc_w0_29_load_6 { ap_none {  { acc_w0_29_load_6 in_data 0 32 } } }
	acc_m0_1_load_6 { ap_none {  { acc_m0_1_load_6 in_data 0 32 } } }
	acc_m0_5_load_6 { ap_none {  { acc_m0_5_load_6 in_data 0 32 } } }
	acc_m0_9_load_6 { ap_none {  { acc_m0_9_load_6 in_data 0 32 } } }
	acc_m0_13_load_6 { ap_none {  { acc_m0_13_load_6 in_data 0 32 } } }
	acc_m0_17_load_6 { ap_none {  { acc_m0_17_load_6 in_data 0 32 } } }
	acc_m0_21_load_6 { ap_none {  { acc_m0_21_load_6 in_data 0 32 } } }
	acc_m0_25_load_6 { ap_none {  { acc_m0_25_load_6 in_data 0 32 } } }
	acc_m0_29_load_6 { ap_none {  { acc_m0_29_load_6 in_data 0 32 } } }
	acc_w1_1_load_6 { ap_none {  { acc_w1_1_load_6 in_data 0 32 } } }
	acc_w1_5_load_6 { ap_none {  { acc_w1_5_load_6 in_data 0 32 } } }
	acc_w1_9_load_6 { ap_none {  { acc_w1_9_load_6 in_data 0 32 } } }
	acc_w1_13_load_6 { ap_none {  { acc_w1_13_load_6 in_data 0 32 } } }
	acc_w1_17_load_6 { ap_none {  { acc_w1_17_load_6 in_data 0 32 } } }
	acc_w1_21_load_6 { ap_none {  { acc_w1_21_load_6 in_data 0 32 } } }
	acc_w1_25_load_6 { ap_none {  { acc_w1_25_load_6 in_data 0 32 } } }
	acc_w1_29_load_6 { ap_none {  { acc_w1_29_load_6 in_data 0 32 } } }
	acc_m1_1_load_6 { ap_none {  { acc_m1_1_load_6 in_data 0 32 } } }
	acc_m1_5_load_6 { ap_none {  { acc_m1_5_load_6 in_data 0 32 } } }
	acc_m1_9_load_6 { ap_none {  { acc_m1_9_load_6 in_data 0 32 } } }
	acc_m1_13_load_6 { ap_none {  { acc_m1_13_load_6 in_data 0 32 } } }
	acc_m1_17_load_6 { ap_none {  { acc_m1_17_load_6 in_data 0 32 } } }
	acc_m1_21_load_6 { ap_none {  { acc_m1_21_load_6 in_data 0 32 } } }
	acc_m1_25_load_6 { ap_none {  { acc_m1_25_load_6 in_data 0 32 } } }
	acc_m1_29_load_6 { ap_none {  { acc_m1_29_load_6 in_data 0 32 } } }
	acc_w0_2_load_6 { ap_none {  { acc_w0_2_load_6 in_data 0 32 } } }
	acc_w0_6_load_6 { ap_none {  { acc_w0_6_load_6 in_data 0 32 } } }
	acc_w0_10_load_6 { ap_none {  { acc_w0_10_load_6 in_data 0 32 } } }
	acc_w0_14_load_6 { ap_none {  { acc_w0_14_load_6 in_data 0 32 } } }
	acc_w0_18_load_6 { ap_none {  { acc_w0_18_load_6 in_data 0 32 } } }
	acc_w0_22_load_6 { ap_none {  { acc_w0_22_load_6 in_data 0 32 } } }
	acc_w0_26_load_6 { ap_none {  { acc_w0_26_load_6 in_data 0 32 } } }
	acc_w0_30_load_6 { ap_none {  { acc_w0_30_load_6 in_data 0 32 } } }
	acc_m0_2_load_6 { ap_none {  { acc_m0_2_load_6 in_data 0 32 } } }
	acc_m0_6_load_6 { ap_none {  { acc_m0_6_load_6 in_data 0 32 } } }
	acc_m0_10_load_6 { ap_none {  { acc_m0_10_load_6 in_data 0 32 } } }
	acc_m0_14_load_6 { ap_none {  { acc_m0_14_load_6 in_data 0 32 } } }
	acc_m0_18_load_6 { ap_none {  { acc_m0_18_load_6 in_data 0 32 } } }
	acc_m0_22_load_6 { ap_none {  { acc_m0_22_load_6 in_data 0 32 } } }
	acc_m0_26_load_6 { ap_none {  { acc_m0_26_load_6 in_data 0 32 } } }
	acc_m0_30_load_6 { ap_none {  { acc_m0_30_load_6 in_data 0 32 } } }
	acc_w1_2_load_6 { ap_none {  { acc_w1_2_load_6 in_data 0 32 } } }
	acc_w1_6_load_6 { ap_none {  { acc_w1_6_load_6 in_data 0 32 } } }
	acc_w1_10_load_6 { ap_none {  { acc_w1_10_load_6 in_data 0 32 } } }
	acc_w1_14_load_6 { ap_none {  { acc_w1_14_load_6 in_data 0 32 } } }
	acc_w1_18_load_6 { ap_none {  { acc_w1_18_load_6 in_data 0 32 } } }
	acc_w1_22_load_6 { ap_none {  { acc_w1_22_load_6 in_data 0 32 } } }
	acc_w1_26_load_6 { ap_none {  { acc_w1_26_load_6 in_data 0 32 } } }
	acc_w1_30_load_6 { ap_none {  { acc_w1_30_load_6 in_data 0 32 } } }
	acc_m1_2_load_6 { ap_none {  { acc_m1_2_load_6 in_data 0 32 } } }
	acc_m1_6_load_6 { ap_none {  { acc_m1_6_load_6 in_data 0 32 } } }
	acc_m1_10_load_6 { ap_none {  { acc_m1_10_load_6 in_data 0 32 } } }
	acc_m1_14_load_6 { ap_none {  { acc_m1_14_load_6 in_data 0 32 } } }
	acc_m1_18_load_6 { ap_none {  { acc_m1_18_load_6 in_data 0 32 } } }
	acc_m1_22_load_6 { ap_none {  { acc_m1_22_load_6 in_data 0 32 } } }
	acc_m1_26_load_6 { ap_none {  { acc_m1_26_load_6 in_data 0 32 } } }
	acc_m1_30_load_6 { ap_none {  { acc_m1_30_load_6 in_data 0 32 } } }
	acc_w0_3_load_6 { ap_none {  { acc_w0_3_load_6 in_data 0 32 } } }
	acc_w0_7_load_6 { ap_none {  { acc_w0_7_load_6 in_data 0 32 } } }
	acc_w0_11_load_6 { ap_none {  { acc_w0_11_load_6 in_data 0 32 } } }
	acc_w0_15_load_6 { ap_none {  { acc_w0_15_load_6 in_data 0 32 } } }
	acc_w0_19_load_6 { ap_none {  { acc_w0_19_load_6 in_data 0 32 } } }
	acc_w0_23_load_6 { ap_none {  { acc_w0_23_load_6 in_data 0 32 } } }
	acc_w0_27_load_6 { ap_none {  { acc_w0_27_load_6 in_data 0 32 } } }
	acc_w0_31_load_6 { ap_none {  { acc_w0_31_load_6 in_data 0 32 } } }
	acc_m0_3_load_6 { ap_none {  { acc_m0_3_load_6 in_data 0 32 } } }
	acc_m0_7_load_6 { ap_none {  { acc_m0_7_load_6 in_data 0 32 } } }
	acc_m0_11_load_6 { ap_none {  { acc_m0_11_load_6 in_data 0 32 } } }
	acc_m0_15_load_6 { ap_none {  { acc_m0_15_load_6 in_data 0 32 } } }
	acc_m0_19_load_6 { ap_none {  { acc_m0_19_load_6 in_data 0 32 } } }
	acc_m0_23_load_6 { ap_none {  { acc_m0_23_load_6 in_data 0 32 } } }
	acc_m0_27_load_6 { ap_none {  { acc_m0_27_load_6 in_data 0 32 } } }
	acc_m0_31_load_6 { ap_none {  { acc_m0_31_load_6 in_data 0 32 } } }
	acc_w1_3_load_6 { ap_none {  { acc_w1_3_load_6 in_data 0 32 } } }
	acc_w1_7_load_6 { ap_none {  { acc_w1_7_load_6 in_data 0 32 } } }
	acc_w1_11_load_6 { ap_none {  { acc_w1_11_load_6 in_data 0 32 } } }
	acc_w1_15_load_6 { ap_none {  { acc_w1_15_load_6 in_data 0 32 } } }
	acc_w1_19_load_6 { ap_none {  { acc_w1_19_load_6 in_data 0 32 } } }
	acc_w1_23_load_6 { ap_none {  { acc_w1_23_load_6 in_data 0 32 } } }
	acc_w1_27_load_6 { ap_none {  { acc_w1_27_load_6 in_data 0 32 } } }
	acc_w1_31_load_6 { ap_none {  { acc_w1_31_load_6 in_data 0 32 } } }
	acc_m1_3_load_6 { ap_none {  { acc_m1_3_load_6 in_data 0 32 } } }
	acc_m1_7_load_6 { ap_none {  { acc_m1_7_load_6 in_data 0 32 } } }
	acc_m1_11_load_6 { ap_none {  { acc_m1_11_load_6 in_data 0 32 } } }
	acc_m1_15_load_6 { ap_none {  { acc_m1_15_load_6 in_data 0 32 } } }
	acc_m1_19_load_6 { ap_none {  { acc_m1_19_load_6 in_data 0 32 } } }
	acc_m1_23_load_6 { ap_none {  { acc_m1_23_load_6 in_data 0 32 } } }
	acc_m1_27_load_6 { ap_none {  { acc_m1_27_load_6 in_data 0 32 } } }
	acc_m1_31_load_6 { ap_none {  { acc_m1_31_load_6 in_data 0 32 } } }
	d0_24_reload { ap_none {  { d0_24_reload in_data 0 32 } } }
	d0_25_reload { ap_none {  { d0_25_reload in_data 0 32 } } }
	d0_26_reload { ap_none {  { d0_26_reload in_data 0 32 } } }
	d0_27_reload { ap_none {  { d0_27_reload in_data 0 32 } } }
	d0_28_reload { ap_none {  { d0_28_reload in_data 0 32 } } }
	d0_29_reload { ap_none {  { d0_29_reload in_data 0 32 } } }
	d0_30_reload { ap_none {  { d0_30_reload in_data 0 32 } } }
	d0_31_reload { ap_none {  { d0_31_reload in_data 0 32 } } }
	dmin0_24_reload { ap_none {  { dmin0_24_reload in_data 0 32 } } }
	dmin0_25_reload { ap_none {  { dmin0_25_reload in_data 0 32 } } }
	dmin0_26_reload { ap_none {  { dmin0_26_reload in_data 0 32 } } }
	dmin0_27_reload { ap_none {  { dmin0_27_reload in_data 0 32 } } }
	dmin0_28_reload { ap_none {  { dmin0_28_reload in_data 0 32 } } }
	dmin0_29_reload { ap_none {  { dmin0_29_reload in_data 0 32 } } }
	dmin0_30_reload { ap_none {  { dmin0_30_reload in_data 0 32 } } }
	dmin0_31_reload { ap_none {  { dmin0_31_reload in_data 0 32 } } }
	d1_24_reload { ap_none {  { d1_24_reload in_data 0 32 } } }
	d1_25_reload { ap_none {  { d1_25_reload in_data 0 32 } } }
	d1_26_reload { ap_none {  { d1_26_reload in_data 0 32 } } }
	d1_27_reload { ap_none {  { d1_27_reload in_data 0 32 } } }
	d1_28_reload { ap_none {  { d1_28_reload in_data 0 32 } } }
	d1_29_reload { ap_none {  { d1_29_reload in_data 0 32 } } }
	d1_30_reload { ap_none {  { d1_30_reload in_data 0 32 } } }
	d1_31_reload { ap_none {  { d1_31_reload in_data 0 32 } } }
	dmin1_24_reload { ap_none {  { dmin1_24_reload in_data 0 32 } } }
	dmin1_25_reload { ap_none {  { dmin1_25_reload in_data 0 32 } } }
	dmin1_26_reload { ap_none {  { dmin1_26_reload in_data 0 32 } } }
	dmin1_27_reload { ap_none {  { dmin1_27_reload in_data 0 32 } } }
	dmin1_28_reload { ap_none {  { dmin1_28_reload in_data 0 32 } } }
	dmin1_29_reload { ap_none {  { dmin1_29_reload in_data 0 32 } } }
	dmin1_30_reload { ap_none {  { dmin1_30_reload in_data 0 32 } } }
	dmin1_31_reload { ap_none {  { dmin1_31_reload in_data 0 32 } } }
	phi_ln508_2_out { ap_vld {  { phi_ln508_2_out out_data 1 56 }  { phi_ln508_2_out_ap_vld out_vld 1 1 } } }
	phi_ln510_2_out { ap_vld {  { phi_ln510_2_out out_data 1 56 }  { phi_ln510_2_out_ap_vld out_vld 1 1 } } }
}
