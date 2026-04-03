set moduleName mac_blocks_wv_k1_Pipeline_REDUCE_WV_K1
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
set C_modelName {mac_blocks_wv_k1_Pipeline_REDUCE_WV_K1}
set C_modelType { void 0 }
set ap_memory_interface_dict [dict create]
set C_modelArgList {
	{ int_acc_w_load_reload int 32 regular  }
	{ int_acc_w_16_load_reload int 32 regular  }
	{ int_acc_w_32_load_reload int 32 regular  }
	{ int_acc_w_48_load_reload int 32 regular  }
	{ int_acc_m_load_reload int 32 regular  }
	{ int_acc_m_16_load_reload int 32 regular  }
	{ int_acc_m_32_load_reload int 32 regular  }
	{ int_acc_m_48_load_reload int 32 regular  }
	{ int_acc_w_1_load_reload int 32 regular  }
	{ int_acc_w_17_load_reload int 32 regular  }
	{ int_acc_w_33_load_reload int 32 regular  }
	{ int_acc_w_49_load_reload int 32 regular  }
	{ int_acc_m_1_load_reload int 32 regular  }
	{ int_acc_m_17_load_reload int 32 regular  }
	{ int_acc_m_33_load_reload int 32 regular  }
	{ int_acc_m_49_load_reload int 32 regular  }
	{ int_acc_w_2_load_reload int 32 regular  }
	{ int_acc_w_18_load_reload int 32 regular  }
	{ int_acc_w_34_load_reload int 32 regular  }
	{ int_acc_w_50_load_reload int 32 regular  }
	{ int_acc_m_2_load_reload int 32 regular  }
	{ int_acc_m_18_load_reload int 32 regular  }
	{ int_acc_m_34_load_reload int 32 regular  }
	{ int_acc_m_50_load_reload int 32 regular  }
	{ int_acc_w_3_load_reload int 32 regular  }
	{ int_acc_w_19_load_reload int 32 regular  }
	{ int_acc_w_35_load_reload int 32 regular  }
	{ int_acc_w_51_load_reload int 32 regular  }
	{ int_acc_m_3_load_reload int 32 regular  }
	{ int_acc_m_19_load_reload int 32 regular  }
	{ int_acc_m_35_load_reload int 32 regular  }
	{ int_acc_m_51_load_reload int 32 regular  }
	{ int_acc_w_4_load_reload int 32 regular  }
	{ int_acc_w_20_load_reload int 32 regular  }
	{ int_acc_w_36_load_reload int 32 regular  }
	{ int_acc_w_52_load_reload int 32 regular  }
	{ int_acc_m_4_load_reload int 32 regular  }
	{ int_acc_m_20_load_reload int 32 regular  }
	{ int_acc_m_36_load_reload int 32 regular  }
	{ int_acc_m_52_load_reload int 32 regular  }
	{ int_acc_w_5_load_reload int 32 regular  }
	{ int_acc_w_21_load_reload int 32 regular  }
	{ int_acc_w_37_load_reload int 32 regular  }
	{ int_acc_w_53_load_reload int 32 regular  }
	{ int_acc_m_5_load_reload int 32 regular  }
	{ int_acc_m_21_load_reload int 32 regular  }
	{ int_acc_m_37_load_reload int 32 regular  }
	{ int_acc_m_53_load_reload int 32 regular  }
	{ int_acc_w_6_load_reload int 32 regular  }
	{ int_acc_w_22_load_reload int 32 regular  }
	{ int_acc_w_38_load_reload int 32 regular  }
	{ int_acc_w_54_load_reload int 32 regular  }
	{ int_acc_m_6_load_reload int 32 regular  }
	{ int_acc_m_22_load_reload int 32 regular  }
	{ int_acc_m_38_load_reload int 32 regular  }
	{ int_acc_m_54_load_reload int 32 regular  }
	{ int_acc_w_7_load_reload int 32 regular  }
	{ int_acc_w_23_load_reload int 32 regular  }
	{ int_acc_w_39_load_reload int 32 regular  }
	{ int_acc_w_55_load_reload int 32 regular  }
	{ int_acc_m_7_load_reload int 32 regular  }
	{ int_acc_m_23_load_reload int 32 regular  }
	{ int_acc_m_39_load_reload int 32 regular  }
	{ int_acc_m_55_load_reload int 32 regular  }
	{ d float 32 regular  }
	{ d_2 float 32 regular  }
	{ d_4 float 32 regular  }
	{ d_6 float 32 regular  }
	{ x_scale float 32 regular  }
	{ dmin float 32 regular  }
	{ dmin_2 float 32 regular  }
	{ dmin_4 float 32 regular  }
	{ dmin_6 float 32 regular  }
	{ int_acc_w_8_load_reload int 32 regular  }
	{ int_acc_w_24_load_reload int 32 regular  }
	{ int_acc_w_40_load_reload int 32 regular  }
	{ int_acc_w_56_load_reload int 32 regular  }
	{ int_acc_m_8_load_reload int 32 regular  }
	{ int_acc_m_24_load_reload int 32 regular  }
	{ int_acc_m_40_load_reload int 32 regular  }
	{ int_acc_m_56_load_reload int 32 regular  }
	{ int_acc_w_9_load_reload int 32 regular  }
	{ int_acc_w_25_load_reload int 32 regular  }
	{ int_acc_w_41_load_reload int 32 regular  }
	{ int_acc_w_57_load_reload int 32 regular  }
	{ int_acc_m_9_load_reload int 32 regular  }
	{ int_acc_m_25_load_reload int 32 regular  }
	{ int_acc_m_41_load_reload int 32 regular  }
	{ int_acc_m_57_load_reload int 32 regular  }
	{ int_acc_w_10_load_reload int 32 regular  }
	{ int_acc_w_26_load_reload int 32 regular  }
	{ int_acc_w_42_load_reload int 32 regular  }
	{ int_acc_w_58_load_reload int 32 regular  }
	{ int_acc_m_10_load_reload int 32 regular  }
	{ int_acc_m_26_load_reload int 32 regular  }
	{ int_acc_m_42_load_reload int 32 regular  }
	{ int_acc_m_58_load_reload int 32 regular  }
	{ int_acc_w_11_load_reload int 32 regular  }
	{ int_acc_w_27_load_reload int 32 regular  }
	{ int_acc_w_43_load_reload int 32 regular  }
	{ int_acc_w_59_load_reload int 32 regular  }
	{ int_acc_m_11_load_reload int 32 regular  }
	{ int_acc_m_27_load_reload int 32 regular  }
	{ int_acc_m_43_load_reload int 32 regular  }
	{ int_acc_m_59_load_reload int 32 regular  }
	{ int_acc_w_12_load_reload int 32 regular  }
	{ int_acc_w_28_load_reload int 32 regular  }
	{ int_acc_w_44_load_reload int 32 regular  }
	{ int_acc_w_60_load_reload int 32 regular  }
	{ int_acc_m_12_load_reload int 32 regular  }
	{ int_acc_m_28_load_reload int 32 regular  }
	{ int_acc_m_44_load_reload int 32 regular  }
	{ int_acc_m_60_load_reload int 32 regular  }
	{ int_acc_w_13_load_reload int 32 regular  }
	{ int_acc_w_29_load_reload int 32 regular  }
	{ int_acc_w_45_load_reload int 32 regular  }
	{ int_acc_w_61_load_reload int 32 regular  }
	{ int_acc_m_13_load_reload int 32 regular  }
	{ int_acc_m_29_load_reload int 32 regular  }
	{ int_acc_m_45_load_reload int 32 regular  }
	{ int_acc_m_61_load_reload int 32 regular  }
	{ int_acc_w_14_load_reload int 32 regular  }
	{ int_acc_w_30_load_reload int 32 regular  }
	{ int_acc_w_46_load_reload int 32 regular  }
	{ int_acc_w_62_load_reload int 32 regular  }
	{ int_acc_m_14_load_reload int 32 regular  }
	{ int_acc_m_30_load_reload int 32 regular  }
	{ int_acc_m_46_load_reload int 32 regular  }
	{ int_acc_m_62_load_reload int 32 regular  }
	{ int_acc_w_15_load_reload int 32 regular  }
	{ int_acc_w_31_load_reload int 32 regular  }
	{ int_acc_w_47_load_reload int 32 regular  }
	{ int_acc_w_63_load_reload int 32 regular  }
	{ int_acc_m_15_load_reload int 32 regular  }
	{ int_acc_m_31_load_reload int 32 regular  }
	{ int_acc_m_47_load_reload int 32 regular  }
	{ int_acc_m_63_load_reload int 32 regular  }
	{ d_1 float 32 regular  }
	{ d_3 float 32 regular  }
	{ d_5 float 32 regular  }
	{ d_7 float 32 regular  }
	{ dmin_1 float 32 regular  }
	{ dmin_3 float 32 regular  }
	{ dmin_5 float 32 regular  }
	{ dmin_7 float 32 regular  }
	{ total_out float 32 regular {pointer 1}  }
}
set hasAXIMCache 0
set l_AXIML2Cache [list]
set AXIMCacheInstDict [dict create]
set C_modelArgMapList {[ 
	{ "Name" : "int_acc_w_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_w_16_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_w_32_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_w_48_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_m_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_m_16_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_m_32_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_m_48_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_w_1_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_w_17_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_w_33_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_w_49_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_m_1_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_m_17_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_m_33_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_m_49_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_w_2_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_w_18_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_w_34_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_w_50_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_m_2_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_m_18_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_m_34_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_m_50_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_w_3_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_w_19_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_w_35_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_w_51_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_m_3_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_m_19_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_m_35_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_m_51_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_w_4_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_w_20_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_w_36_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_w_52_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_m_4_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_m_20_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_m_36_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_m_52_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_w_5_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_w_21_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_w_37_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_w_53_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_m_5_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_m_21_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_m_37_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_m_53_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_w_6_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_w_22_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_w_38_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_w_54_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_m_6_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_m_22_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_m_38_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_m_54_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_w_7_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_w_23_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_w_39_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_w_55_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_m_7_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_m_23_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_m_39_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_m_55_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "d", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "d_2", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "d_4", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "d_6", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "x_scale", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "dmin", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "dmin_2", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "dmin_4", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "dmin_6", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_w_8_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_w_24_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_w_40_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_w_56_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_m_8_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_m_24_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_m_40_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_m_56_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_w_9_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_w_25_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_w_41_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_w_57_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_m_9_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_m_25_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_m_41_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_m_57_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_w_10_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_w_26_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_w_42_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_w_58_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_m_10_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_m_26_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_m_42_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_m_58_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_w_11_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_w_27_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_w_43_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_w_59_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_m_11_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_m_27_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_m_43_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_m_59_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_w_12_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_w_28_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_w_44_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_w_60_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_m_12_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_m_28_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_m_44_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_m_60_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_w_13_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_w_29_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_w_45_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_w_61_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_m_13_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_m_29_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_m_45_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_m_61_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_w_14_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_w_30_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_w_46_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_w_62_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_m_14_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_m_30_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_m_46_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_m_62_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_w_15_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_w_31_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_w_47_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_w_63_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_m_15_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_m_31_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_m_47_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_m_63_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "d_1", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "d_3", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "d_5", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "d_7", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "dmin_1", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "dmin_3", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "dmin_5", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "dmin_7", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "total_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 153
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ int_acc_w_load_reload sc_in sc_lv 32 signal 0 } 
	{ int_acc_w_16_load_reload sc_in sc_lv 32 signal 1 } 
	{ int_acc_w_32_load_reload sc_in sc_lv 32 signal 2 } 
	{ int_acc_w_48_load_reload sc_in sc_lv 32 signal 3 } 
	{ int_acc_m_load_reload sc_in sc_lv 32 signal 4 } 
	{ int_acc_m_16_load_reload sc_in sc_lv 32 signal 5 } 
	{ int_acc_m_32_load_reload sc_in sc_lv 32 signal 6 } 
	{ int_acc_m_48_load_reload sc_in sc_lv 32 signal 7 } 
	{ int_acc_w_1_load_reload sc_in sc_lv 32 signal 8 } 
	{ int_acc_w_17_load_reload sc_in sc_lv 32 signal 9 } 
	{ int_acc_w_33_load_reload sc_in sc_lv 32 signal 10 } 
	{ int_acc_w_49_load_reload sc_in sc_lv 32 signal 11 } 
	{ int_acc_m_1_load_reload sc_in sc_lv 32 signal 12 } 
	{ int_acc_m_17_load_reload sc_in sc_lv 32 signal 13 } 
	{ int_acc_m_33_load_reload sc_in sc_lv 32 signal 14 } 
	{ int_acc_m_49_load_reload sc_in sc_lv 32 signal 15 } 
	{ int_acc_w_2_load_reload sc_in sc_lv 32 signal 16 } 
	{ int_acc_w_18_load_reload sc_in sc_lv 32 signal 17 } 
	{ int_acc_w_34_load_reload sc_in sc_lv 32 signal 18 } 
	{ int_acc_w_50_load_reload sc_in sc_lv 32 signal 19 } 
	{ int_acc_m_2_load_reload sc_in sc_lv 32 signal 20 } 
	{ int_acc_m_18_load_reload sc_in sc_lv 32 signal 21 } 
	{ int_acc_m_34_load_reload sc_in sc_lv 32 signal 22 } 
	{ int_acc_m_50_load_reload sc_in sc_lv 32 signal 23 } 
	{ int_acc_w_3_load_reload sc_in sc_lv 32 signal 24 } 
	{ int_acc_w_19_load_reload sc_in sc_lv 32 signal 25 } 
	{ int_acc_w_35_load_reload sc_in sc_lv 32 signal 26 } 
	{ int_acc_w_51_load_reload sc_in sc_lv 32 signal 27 } 
	{ int_acc_m_3_load_reload sc_in sc_lv 32 signal 28 } 
	{ int_acc_m_19_load_reload sc_in sc_lv 32 signal 29 } 
	{ int_acc_m_35_load_reload sc_in sc_lv 32 signal 30 } 
	{ int_acc_m_51_load_reload sc_in sc_lv 32 signal 31 } 
	{ int_acc_w_4_load_reload sc_in sc_lv 32 signal 32 } 
	{ int_acc_w_20_load_reload sc_in sc_lv 32 signal 33 } 
	{ int_acc_w_36_load_reload sc_in sc_lv 32 signal 34 } 
	{ int_acc_w_52_load_reload sc_in sc_lv 32 signal 35 } 
	{ int_acc_m_4_load_reload sc_in sc_lv 32 signal 36 } 
	{ int_acc_m_20_load_reload sc_in sc_lv 32 signal 37 } 
	{ int_acc_m_36_load_reload sc_in sc_lv 32 signal 38 } 
	{ int_acc_m_52_load_reload sc_in sc_lv 32 signal 39 } 
	{ int_acc_w_5_load_reload sc_in sc_lv 32 signal 40 } 
	{ int_acc_w_21_load_reload sc_in sc_lv 32 signal 41 } 
	{ int_acc_w_37_load_reload sc_in sc_lv 32 signal 42 } 
	{ int_acc_w_53_load_reload sc_in sc_lv 32 signal 43 } 
	{ int_acc_m_5_load_reload sc_in sc_lv 32 signal 44 } 
	{ int_acc_m_21_load_reload sc_in sc_lv 32 signal 45 } 
	{ int_acc_m_37_load_reload sc_in sc_lv 32 signal 46 } 
	{ int_acc_m_53_load_reload sc_in sc_lv 32 signal 47 } 
	{ int_acc_w_6_load_reload sc_in sc_lv 32 signal 48 } 
	{ int_acc_w_22_load_reload sc_in sc_lv 32 signal 49 } 
	{ int_acc_w_38_load_reload sc_in sc_lv 32 signal 50 } 
	{ int_acc_w_54_load_reload sc_in sc_lv 32 signal 51 } 
	{ int_acc_m_6_load_reload sc_in sc_lv 32 signal 52 } 
	{ int_acc_m_22_load_reload sc_in sc_lv 32 signal 53 } 
	{ int_acc_m_38_load_reload sc_in sc_lv 32 signal 54 } 
	{ int_acc_m_54_load_reload sc_in sc_lv 32 signal 55 } 
	{ int_acc_w_7_load_reload sc_in sc_lv 32 signal 56 } 
	{ int_acc_w_23_load_reload sc_in sc_lv 32 signal 57 } 
	{ int_acc_w_39_load_reload sc_in sc_lv 32 signal 58 } 
	{ int_acc_w_55_load_reload sc_in sc_lv 32 signal 59 } 
	{ int_acc_m_7_load_reload sc_in sc_lv 32 signal 60 } 
	{ int_acc_m_23_load_reload sc_in sc_lv 32 signal 61 } 
	{ int_acc_m_39_load_reload sc_in sc_lv 32 signal 62 } 
	{ int_acc_m_55_load_reload sc_in sc_lv 32 signal 63 } 
	{ d sc_in sc_lv 32 signal 64 } 
	{ d_2 sc_in sc_lv 32 signal 65 } 
	{ d_4 sc_in sc_lv 32 signal 66 } 
	{ d_6 sc_in sc_lv 32 signal 67 } 
	{ x_scale sc_in sc_lv 32 signal 68 } 
	{ dmin sc_in sc_lv 32 signal 69 } 
	{ dmin_2 sc_in sc_lv 32 signal 70 } 
	{ dmin_4 sc_in sc_lv 32 signal 71 } 
	{ dmin_6 sc_in sc_lv 32 signal 72 } 
	{ int_acc_w_8_load_reload sc_in sc_lv 32 signal 73 } 
	{ int_acc_w_24_load_reload sc_in sc_lv 32 signal 74 } 
	{ int_acc_w_40_load_reload sc_in sc_lv 32 signal 75 } 
	{ int_acc_w_56_load_reload sc_in sc_lv 32 signal 76 } 
	{ int_acc_m_8_load_reload sc_in sc_lv 32 signal 77 } 
	{ int_acc_m_24_load_reload sc_in sc_lv 32 signal 78 } 
	{ int_acc_m_40_load_reload sc_in sc_lv 32 signal 79 } 
	{ int_acc_m_56_load_reload sc_in sc_lv 32 signal 80 } 
	{ int_acc_w_9_load_reload sc_in sc_lv 32 signal 81 } 
	{ int_acc_w_25_load_reload sc_in sc_lv 32 signal 82 } 
	{ int_acc_w_41_load_reload sc_in sc_lv 32 signal 83 } 
	{ int_acc_w_57_load_reload sc_in sc_lv 32 signal 84 } 
	{ int_acc_m_9_load_reload sc_in sc_lv 32 signal 85 } 
	{ int_acc_m_25_load_reload sc_in sc_lv 32 signal 86 } 
	{ int_acc_m_41_load_reload sc_in sc_lv 32 signal 87 } 
	{ int_acc_m_57_load_reload sc_in sc_lv 32 signal 88 } 
	{ int_acc_w_10_load_reload sc_in sc_lv 32 signal 89 } 
	{ int_acc_w_26_load_reload sc_in sc_lv 32 signal 90 } 
	{ int_acc_w_42_load_reload sc_in sc_lv 32 signal 91 } 
	{ int_acc_w_58_load_reload sc_in sc_lv 32 signal 92 } 
	{ int_acc_m_10_load_reload sc_in sc_lv 32 signal 93 } 
	{ int_acc_m_26_load_reload sc_in sc_lv 32 signal 94 } 
	{ int_acc_m_42_load_reload sc_in sc_lv 32 signal 95 } 
	{ int_acc_m_58_load_reload sc_in sc_lv 32 signal 96 } 
	{ int_acc_w_11_load_reload sc_in sc_lv 32 signal 97 } 
	{ int_acc_w_27_load_reload sc_in sc_lv 32 signal 98 } 
	{ int_acc_w_43_load_reload sc_in sc_lv 32 signal 99 } 
	{ int_acc_w_59_load_reload sc_in sc_lv 32 signal 100 } 
	{ int_acc_m_11_load_reload sc_in sc_lv 32 signal 101 } 
	{ int_acc_m_27_load_reload sc_in sc_lv 32 signal 102 } 
	{ int_acc_m_43_load_reload sc_in sc_lv 32 signal 103 } 
	{ int_acc_m_59_load_reload sc_in sc_lv 32 signal 104 } 
	{ int_acc_w_12_load_reload sc_in sc_lv 32 signal 105 } 
	{ int_acc_w_28_load_reload sc_in sc_lv 32 signal 106 } 
	{ int_acc_w_44_load_reload sc_in sc_lv 32 signal 107 } 
	{ int_acc_w_60_load_reload sc_in sc_lv 32 signal 108 } 
	{ int_acc_m_12_load_reload sc_in sc_lv 32 signal 109 } 
	{ int_acc_m_28_load_reload sc_in sc_lv 32 signal 110 } 
	{ int_acc_m_44_load_reload sc_in sc_lv 32 signal 111 } 
	{ int_acc_m_60_load_reload sc_in sc_lv 32 signal 112 } 
	{ int_acc_w_13_load_reload sc_in sc_lv 32 signal 113 } 
	{ int_acc_w_29_load_reload sc_in sc_lv 32 signal 114 } 
	{ int_acc_w_45_load_reload sc_in sc_lv 32 signal 115 } 
	{ int_acc_w_61_load_reload sc_in sc_lv 32 signal 116 } 
	{ int_acc_m_13_load_reload sc_in sc_lv 32 signal 117 } 
	{ int_acc_m_29_load_reload sc_in sc_lv 32 signal 118 } 
	{ int_acc_m_45_load_reload sc_in sc_lv 32 signal 119 } 
	{ int_acc_m_61_load_reload sc_in sc_lv 32 signal 120 } 
	{ int_acc_w_14_load_reload sc_in sc_lv 32 signal 121 } 
	{ int_acc_w_30_load_reload sc_in sc_lv 32 signal 122 } 
	{ int_acc_w_46_load_reload sc_in sc_lv 32 signal 123 } 
	{ int_acc_w_62_load_reload sc_in sc_lv 32 signal 124 } 
	{ int_acc_m_14_load_reload sc_in sc_lv 32 signal 125 } 
	{ int_acc_m_30_load_reload sc_in sc_lv 32 signal 126 } 
	{ int_acc_m_46_load_reload sc_in sc_lv 32 signal 127 } 
	{ int_acc_m_62_load_reload sc_in sc_lv 32 signal 128 } 
	{ int_acc_w_15_load_reload sc_in sc_lv 32 signal 129 } 
	{ int_acc_w_31_load_reload sc_in sc_lv 32 signal 130 } 
	{ int_acc_w_47_load_reload sc_in sc_lv 32 signal 131 } 
	{ int_acc_w_63_load_reload sc_in sc_lv 32 signal 132 } 
	{ int_acc_m_15_load_reload sc_in sc_lv 32 signal 133 } 
	{ int_acc_m_31_load_reload sc_in sc_lv 32 signal 134 } 
	{ int_acc_m_47_load_reload sc_in sc_lv 32 signal 135 } 
	{ int_acc_m_63_load_reload sc_in sc_lv 32 signal 136 } 
	{ d_1 sc_in sc_lv 32 signal 137 } 
	{ d_3 sc_in sc_lv 32 signal 138 } 
	{ d_5 sc_in sc_lv 32 signal 139 } 
	{ d_7 sc_in sc_lv 32 signal 140 } 
	{ dmin_1 sc_in sc_lv 32 signal 141 } 
	{ dmin_3 sc_in sc_lv 32 signal 142 } 
	{ dmin_5 sc_in sc_lv 32 signal 143 } 
	{ dmin_7 sc_in sc_lv 32 signal 144 } 
	{ total_out sc_out sc_lv 32 signal 145 } 
	{ total_out_ap_vld sc_out sc_logic 1 outvld 145 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "int_acc_w_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_w_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_w_16_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_w_16_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_w_32_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_w_32_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_w_48_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_w_48_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_m_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_m_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_m_16_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_m_16_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_m_32_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_m_32_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_m_48_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_m_48_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_w_1_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_w_1_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_w_17_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_w_17_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_w_33_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_w_33_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_w_49_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_w_49_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_m_1_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_m_1_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_m_17_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_m_17_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_m_33_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_m_33_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_m_49_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_m_49_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_w_2_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_w_2_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_w_18_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_w_18_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_w_34_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_w_34_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_w_50_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_w_50_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_m_2_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_m_2_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_m_18_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_m_18_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_m_34_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_m_34_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_m_50_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_m_50_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_w_3_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_w_3_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_w_19_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_w_19_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_w_35_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_w_35_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_w_51_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_w_51_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_m_3_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_m_3_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_m_19_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_m_19_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_m_35_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_m_35_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_m_51_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_m_51_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_w_4_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_w_4_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_w_20_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_w_20_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_w_36_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_w_36_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_w_52_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_w_52_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_m_4_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_m_4_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_m_20_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_m_20_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_m_36_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_m_36_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_m_52_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_m_52_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_w_5_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_w_5_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_w_21_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_w_21_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_w_37_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_w_37_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_w_53_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_w_53_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_m_5_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_m_5_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_m_21_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_m_21_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_m_37_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_m_37_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_m_53_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_m_53_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_w_6_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_w_6_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_w_22_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_w_22_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_w_38_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_w_38_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_w_54_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_w_54_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_m_6_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_m_6_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_m_22_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_m_22_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_m_38_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_m_38_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_m_54_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_m_54_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_w_7_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_w_7_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_w_23_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_w_23_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_w_39_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_w_39_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_w_55_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_w_55_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_m_7_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_m_7_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_m_23_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_m_23_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_m_39_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_m_39_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_m_55_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_m_55_load_reload", "role": "default" }} , 
 	{ "name": "d", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "d", "role": "default" }} , 
 	{ "name": "d_2", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "d_2", "role": "default" }} , 
 	{ "name": "d_4", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "d_4", "role": "default" }} , 
 	{ "name": "d_6", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "d_6", "role": "default" }} , 
 	{ "name": "x_scale", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "x_scale", "role": "default" }} , 
 	{ "name": "dmin", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "dmin", "role": "default" }} , 
 	{ "name": "dmin_2", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "dmin_2", "role": "default" }} , 
 	{ "name": "dmin_4", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "dmin_4", "role": "default" }} , 
 	{ "name": "dmin_6", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "dmin_6", "role": "default" }} , 
 	{ "name": "int_acc_w_8_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_w_8_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_w_24_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_w_24_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_w_40_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_w_40_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_w_56_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_w_56_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_m_8_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_m_8_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_m_24_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_m_24_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_m_40_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_m_40_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_m_56_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_m_56_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_w_9_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_w_9_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_w_25_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_w_25_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_w_41_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_w_41_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_w_57_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_w_57_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_m_9_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_m_9_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_m_25_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_m_25_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_m_41_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_m_41_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_m_57_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_m_57_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_w_10_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_w_10_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_w_26_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_w_26_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_w_42_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_w_42_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_w_58_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_w_58_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_m_10_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_m_10_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_m_26_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_m_26_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_m_42_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_m_42_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_m_58_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_m_58_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_w_11_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_w_11_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_w_27_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_w_27_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_w_43_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_w_43_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_w_59_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_w_59_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_m_11_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_m_11_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_m_27_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_m_27_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_m_43_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_m_43_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_m_59_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_m_59_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_w_12_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_w_12_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_w_28_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_w_28_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_w_44_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_w_44_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_w_60_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_w_60_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_m_12_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_m_12_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_m_28_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_m_28_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_m_44_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_m_44_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_m_60_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_m_60_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_w_13_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_w_13_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_w_29_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_w_29_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_w_45_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_w_45_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_w_61_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_w_61_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_m_13_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_m_13_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_m_29_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_m_29_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_m_45_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_m_45_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_m_61_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_m_61_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_w_14_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_w_14_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_w_30_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_w_30_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_w_46_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_w_46_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_w_62_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_w_62_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_m_14_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_m_14_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_m_30_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_m_30_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_m_46_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_m_46_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_m_62_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_m_62_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_w_15_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_w_15_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_w_31_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_w_31_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_w_47_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_w_47_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_w_63_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_w_63_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_m_15_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_m_15_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_m_31_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_m_31_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_m_47_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_m_47_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_m_63_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_m_63_load_reload", "role": "default" }} , 
 	{ "name": "d_1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "d_1", "role": "default" }} , 
 	{ "name": "d_3", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "d_3", "role": "default" }} , 
 	{ "name": "d_5", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "d_5", "role": "default" }} , 
 	{ "name": "d_7", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "d_7", "role": "default" }} , 
 	{ "name": "dmin_1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "dmin_1", "role": "default" }} , 
 	{ "name": "dmin_3", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "dmin_3", "role": "default" }} , 
 	{ "name": "dmin_5", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "dmin_5", "role": "default" }} , 
 	{ "name": "dmin_7", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "dmin_7", "role": "default" }} , 
 	{ "name": "total_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "total_out", "role": "default" }} , 
 	{ "name": "total_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "total_out", "role": "ap_vld" }}  ]}

set ArgLastReadFirstWriteLatency {
	mac_blocks_wv_k1_Pipeline_REDUCE_WV_K1 {
		int_acc_w_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_w_16_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_w_32_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_w_48_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_m_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_m_16_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_m_32_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_m_48_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_w_1_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_w_17_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_w_33_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_w_49_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_m_1_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_m_17_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_m_33_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_m_49_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_w_2_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_w_18_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_w_34_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_w_50_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_m_2_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_m_18_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_m_34_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_m_50_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_w_3_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_w_19_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_w_35_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_w_51_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_m_3_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_m_19_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_m_35_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_m_51_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_w_4_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_w_20_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_w_36_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_w_52_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_m_4_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_m_20_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_m_36_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_m_52_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_w_5_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_w_21_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_w_37_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_w_53_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_m_5_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_m_21_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_m_37_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_m_53_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_w_6_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_w_22_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_w_38_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_w_54_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_m_6_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_m_22_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_m_38_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_m_54_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_w_7_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_w_23_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_w_39_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_w_55_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_m_7_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_m_23_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_m_39_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_m_55_load_reload {Type I LastRead 0 FirstWrite -1}
		d {Type I LastRead 0 FirstWrite -1}
		d_2 {Type I LastRead 0 FirstWrite -1}
		d_4 {Type I LastRead 0 FirstWrite -1}
		d_6 {Type I LastRead 0 FirstWrite -1}
		x_scale {Type I LastRead 0 FirstWrite -1}
		dmin {Type I LastRead 0 FirstWrite -1}
		dmin_2 {Type I LastRead 0 FirstWrite -1}
		dmin_4 {Type I LastRead 0 FirstWrite -1}
		dmin_6 {Type I LastRead 0 FirstWrite -1}
		int_acc_w_8_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_w_24_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_w_40_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_w_56_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_m_8_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_m_24_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_m_40_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_m_56_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_w_9_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_w_25_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_w_41_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_w_57_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_m_9_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_m_25_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_m_41_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_m_57_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_w_10_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_w_26_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_w_42_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_w_58_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_m_10_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_m_26_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_m_42_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_m_58_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_w_11_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_w_27_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_w_43_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_w_59_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_m_11_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_m_27_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_m_43_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_m_59_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_w_12_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_w_28_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_w_44_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_w_60_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_m_12_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_m_28_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_m_44_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_m_60_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_w_13_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_w_29_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_w_45_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_w_61_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_m_13_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_m_29_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_m_45_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_m_61_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_w_14_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_w_30_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_w_46_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_w_62_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_m_14_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_m_30_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_m_46_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_m_62_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_w_15_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_w_31_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_w_47_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_w_63_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_m_15_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_m_31_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_m_47_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_m_63_load_reload {Type I LastRead 0 FirstWrite -1}
		d_1 {Type I LastRead 0 FirstWrite -1}
		d_3 {Type I LastRead 0 FirstWrite -1}
		d_5 {Type I LastRead 0 FirstWrite -1}
		d_7 {Type I LastRead 0 FirstWrite -1}
		dmin_1 {Type I LastRead 0 FirstWrite -1}
		dmin_3 {Type I LastRead 0 FirstWrite -1}
		dmin_5 {Type I LastRead 0 FirstWrite -1}
		dmin_7 {Type I LastRead 0 FirstWrite -1}
		total_out {Type O LastRead -1 FirstWrite 31}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "113", "Max" : "113"}
	, {"Name" : "Interval", "Min" : "113", "Max" : "113"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	int_acc_w_load_reload { ap_none {  { int_acc_w_load_reload in_data 0 32 } } }
	int_acc_w_16_load_reload { ap_none {  { int_acc_w_16_load_reload in_data 0 32 } } }
	int_acc_w_32_load_reload { ap_none {  { int_acc_w_32_load_reload in_data 0 32 } } }
	int_acc_w_48_load_reload { ap_none {  { int_acc_w_48_load_reload in_data 0 32 } } }
	int_acc_m_load_reload { ap_none {  { int_acc_m_load_reload in_data 0 32 } } }
	int_acc_m_16_load_reload { ap_none {  { int_acc_m_16_load_reload in_data 0 32 } } }
	int_acc_m_32_load_reload { ap_none {  { int_acc_m_32_load_reload in_data 0 32 } } }
	int_acc_m_48_load_reload { ap_none {  { int_acc_m_48_load_reload in_data 0 32 } } }
	int_acc_w_1_load_reload { ap_none {  { int_acc_w_1_load_reload in_data 0 32 } } }
	int_acc_w_17_load_reload { ap_none {  { int_acc_w_17_load_reload in_data 0 32 } } }
	int_acc_w_33_load_reload { ap_none {  { int_acc_w_33_load_reload in_data 0 32 } } }
	int_acc_w_49_load_reload { ap_none {  { int_acc_w_49_load_reload in_data 0 32 } } }
	int_acc_m_1_load_reload { ap_none {  { int_acc_m_1_load_reload in_data 0 32 } } }
	int_acc_m_17_load_reload { ap_none {  { int_acc_m_17_load_reload in_data 0 32 } } }
	int_acc_m_33_load_reload { ap_none {  { int_acc_m_33_load_reload in_data 0 32 } } }
	int_acc_m_49_load_reload { ap_none {  { int_acc_m_49_load_reload in_data 0 32 } } }
	int_acc_w_2_load_reload { ap_none {  { int_acc_w_2_load_reload in_data 0 32 } } }
	int_acc_w_18_load_reload { ap_none {  { int_acc_w_18_load_reload in_data 0 32 } } }
	int_acc_w_34_load_reload { ap_none {  { int_acc_w_34_load_reload in_data 0 32 } } }
	int_acc_w_50_load_reload { ap_none {  { int_acc_w_50_load_reload in_data 0 32 } } }
	int_acc_m_2_load_reload { ap_none {  { int_acc_m_2_load_reload in_data 0 32 } } }
	int_acc_m_18_load_reload { ap_none {  { int_acc_m_18_load_reload in_data 0 32 } } }
	int_acc_m_34_load_reload { ap_none {  { int_acc_m_34_load_reload in_data 0 32 } } }
	int_acc_m_50_load_reload { ap_none {  { int_acc_m_50_load_reload in_data 0 32 } } }
	int_acc_w_3_load_reload { ap_none {  { int_acc_w_3_load_reload in_data 0 32 } } }
	int_acc_w_19_load_reload { ap_none {  { int_acc_w_19_load_reload in_data 0 32 } } }
	int_acc_w_35_load_reload { ap_none {  { int_acc_w_35_load_reload in_data 0 32 } } }
	int_acc_w_51_load_reload { ap_none {  { int_acc_w_51_load_reload in_data 0 32 } } }
	int_acc_m_3_load_reload { ap_none {  { int_acc_m_3_load_reload in_data 0 32 } } }
	int_acc_m_19_load_reload { ap_none {  { int_acc_m_19_load_reload in_data 0 32 } } }
	int_acc_m_35_load_reload { ap_none {  { int_acc_m_35_load_reload in_data 0 32 } } }
	int_acc_m_51_load_reload { ap_none {  { int_acc_m_51_load_reload in_data 0 32 } } }
	int_acc_w_4_load_reload { ap_none {  { int_acc_w_4_load_reload in_data 0 32 } } }
	int_acc_w_20_load_reload { ap_none {  { int_acc_w_20_load_reload in_data 0 32 } } }
	int_acc_w_36_load_reload { ap_none {  { int_acc_w_36_load_reload in_data 0 32 } } }
	int_acc_w_52_load_reload { ap_none {  { int_acc_w_52_load_reload in_data 0 32 } } }
	int_acc_m_4_load_reload { ap_none {  { int_acc_m_4_load_reload in_data 0 32 } } }
	int_acc_m_20_load_reload { ap_none {  { int_acc_m_20_load_reload in_data 0 32 } } }
	int_acc_m_36_load_reload { ap_none {  { int_acc_m_36_load_reload in_data 0 32 } } }
	int_acc_m_52_load_reload { ap_none {  { int_acc_m_52_load_reload in_data 0 32 } } }
	int_acc_w_5_load_reload { ap_none {  { int_acc_w_5_load_reload in_data 0 32 } } }
	int_acc_w_21_load_reload { ap_none {  { int_acc_w_21_load_reload in_data 0 32 } } }
	int_acc_w_37_load_reload { ap_none {  { int_acc_w_37_load_reload in_data 0 32 } } }
	int_acc_w_53_load_reload { ap_none {  { int_acc_w_53_load_reload in_data 0 32 } } }
	int_acc_m_5_load_reload { ap_none {  { int_acc_m_5_load_reload in_data 0 32 } } }
	int_acc_m_21_load_reload { ap_none {  { int_acc_m_21_load_reload in_data 0 32 } } }
	int_acc_m_37_load_reload { ap_none {  { int_acc_m_37_load_reload in_data 0 32 } } }
	int_acc_m_53_load_reload { ap_none {  { int_acc_m_53_load_reload in_data 0 32 } } }
	int_acc_w_6_load_reload { ap_none {  { int_acc_w_6_load_reload in_data 0 32 } } }
	int_acc_w_22_load_reload { ap_none {  { int_acc_w_22_load_reload in_data 0 32 } } }
	int_acc_w_38_load_reload { ap_none {  { int_acc_w_38_load_reload in_data 0 32 } } }
	int_acc_w_54_load_reload { ap_none {  { int_acc_w_54_load_reload in_data 0 32 } } }
	int_acc_m_6_load_reload { ap_none {  { int_acc_m_6_load_reload in_data 0 32 } } }
	int_acc_m_22_load_reload { ap_none {  { int_acc_m_22_load_reload in_data 0 32 } } }
	int_acc_m_38_load_reload { ap_none {  { int_acc_m_38_load_reload in_data 0 32 } } }
	int_acc_m_54_load_reload { ap_none {  { int_acc_m_54_load_reload in_data 0 32 } } }
	int_acc_w_7_load_reload { ap_none {  { int_acc_w_7_load_reload in_data 0 32 } } }
	int_acc_w_23_load_reload { ap_none {  { int_acc_w_23_load_reload in_data 0 32 } } }
	int_acc_w_39_load_reload { ap_none {  { int_acc_w_39_load_reload in_data 0 32 } } }
	int_acc_w_55_load_reload { ap_none {  { int_acc_w_55_load_reload in_data 0 32 } } }
	int_acc_m_7_load_reload { ap_none {  { int_acc_m_7_load_reload in_data 0 32 } } }
	int_acc_m_23_load_reload { ap_none {  { int_acc_m_23_load_reload in_data 0 32 } } }
	int_acc_m_39_load_reload { ap_none {  { int_acc_m_39_load_reload in_data 0 32 } } }
	int_acc_m_55_load_reload { ap_none {  { int_acc_m_55_load_reload in_data 0 32 } } }
	d { ap_none {  { d in_data 0 32 } } }
	d_2 { ap_none {  { d_2 in_data 0 32 } } }
	d_4 { ap_none {  { d_4 in_data 0 32 } } }
	d_6 { ap_none {  { d_6 in_data 0 32 } } }
	x_scale { ap_none {  { x_scale in_data 0 32 } } }
	dmin { ap_none {  { dmin in_data 0 32 } } }
	dmin_2 { ap_none {  { dmin_2 in_data 0 32 } } }
	dmin_4 { ap_none {  { dmin_4 in_data 0 32 } } }
	dmin_6 { ap_none {  { dmin_6 in_data 0 32 } } }
	int_acc_w_8_load_reload { ap_none {  { int_acc_w_8_load_reload in_data 0 32 } } }
	int_acc_w_24_load_reload { ap_none {  { int_acc_w_24_load_reload in_data 0 32 } } }
	int_acc_w_40_load_reload { ap_none {  { int_acc_w_40_load_reload in_data 0 32 } } }
	int_acc_w_56_load_reload { ap_none {  { int_acc_w_56_load_reload in_data 0 32 } } }
	int_acc_m_8_load_reload { ap_none {  { int_acc_m_8_load_reload in_data 0 32 } } }
	int_acc_m_24_load_reload { ap_none {  { int_acc_m_24_load_reload in_data 0 32 } } }
	int_acc_m_40_load_reload { ap_none {  { int_acc_m_40_load_reload in_data 0 32 } } }
	int_acc_m_56_load_reload { ap_none {  { int_acc_m_56_load_reload in_data 0 32 } } }
	int_acc_w_9_load_reload { ap_none {  { int_acc_w_9_load_reload in_data 0 32 } } }
	int_acc_w_25_load_reload { ap_none {  { int_acc_w_25_load_reload in_data 0 32 } } }
	int_acc_w_41_load_reload { ap_none {  { int_acc_w_41_load_reload in_data 0 32 } } }
	int_acc_w_57_load_reload { ap_none {  { int_acc_w_57_load_reload in_data 0 32 } } }
	int_acc_m_9_load_reload { ap_none {  { int_acc_m_9_load_reload in_data 0 32 } } }
	int_acc_m_25_load_reload { ap_none {  { int_acc_m_25_load_reload in_data 0 32 } } }
	int_acc_m_41_load_reload { ap_none {  { int_acc_m_41_load_reload in_data 0 32 } } }
	int_acc_m_57_load_reload { ap_none {  { int_acc_m_57_load_reload in_data 0 32 } } }
	int_acc_w_10_load_reload { ap_none {  { int_acc_w_10_load_reload in_data 0 32 } } }
	int_acc_w_26_load_reload { ap_none {  { int_acc_w_26_load_reload in_data 0 32 } } }
	int_acc_w_42_load_reload { ap_none {  { int_acc_w_42_load_reload in_data 0 32 } } }
	int_acc_w_58_load_reload { ap_none {  { int_acc_w_58_load_reload in_data 0 32 } } }
	int_acc_m_10_load_reload { ap_none {  { int_acc_m_10_load_reload in_data 0 32 } } }
	int_acc_m_26_load_reload { ap_none {  { int_acc_m_26_load_reload in_data 0 32 } } }
	int_acc_m_42_load_reload { ap_none {  { int_acc_m_42_load_reload in_data 0 32 } } }
	int_acc_m_58_load_reload { ap_none {  { int_acc_m_58_load_reload in_data 0 32 } } }
	int_acc_w_11_load_reload { ap_none {  { int_acc_w_11_load_reload in_data 0 32 } } }
	int_acc_w_27_load_reload { ap_none {  { int_acc_w_27_load_reload in_data 0 32 } } }
	int_acc_w_43_load_reload { ap_none {  { int_acc_w_43_load_reload in_data 0 32 } } }
	int_acc_w_59_load_reload { ap_none {  { int_acc_w_59_load_reload in_data 0 32 } } }
	int_acc_m_11_load_reload { ap_none {  { int_acc_m_11_load_reload in_data 0 32 } } }
	int_acc_m_27_load_reload { ap_none {  { int_acc_m_27_load_reload in_data 0 32 } } }
	int_acc_m_43_load_reload { ap_none {  { int_acc_m_43_load_reload in_data 0 32 } } }
	int_acc_m_59_load_reload { ap_none {  { int_acc_m_59_load_reload in_data 0 32 } } }
	int_acc_w_12_load_reload { ap_none {  { int_acc_w_12_load_reload in_data 0 32 } } }
	int_acc_w_28_load_reload { ap_none {  { int_acc_w_28_load_reload in_data 0 32 } } }
	int_acc_w_44_load_reload { ap_none {  { int_acc_w_44_load_reload in_data 0 32 } } }
	int_acc_w_60_load_reload { ap_none {  { int_acc_w_60_load_reload in_data 0 32 } } }
	int_acc_m_12_load_reload { ap_none {  { int_acc_m_12_load_reload in_data 0 32 } } }
	int_acc_m_28_load_reload { ap_none {  { int_acc_m_28_load_reload in_data 0 32 } } }
	int_acc_m_44_load_reload { ap_none {  { int_acc_m_44_load_reload in_data 0 32 } } }
	int_acc_m_60_load_reload { ap_none {  { int_acc_m_60_load_reload in_data 0 32 } } }
	int_acc_w_13_load_reload { ap_none {  { int_acc_w_13_load_reload in_data 0 32 } } }
	int_acc_w_29_load_reload { ap_none {  { int_acc_w_29_load_reload in_data 0 32 } } }
	int_acc_w_45_load_reload { ap_none {  { int_acc_w_45_load_reload in_data 0 32 } } }
	int_acc_w_61_load_reload { ap_none {  { int_acc_w_61_load_reload in_data 0 32 } } }
	int_acc_m_13_load_reload { ap_none {  { int_acc_m_13_load_reload in_data 0 32 } } }
	int_acc_m_29_load_reload { ap_none {  { int_acc_m_29_load_reload in_data 0 32 } } }
	int_acc_m_45_load_reload { ap_none {  { int_acc_m_45_load_reload in_data 0 32 } } }
	int_acc_m_61_load_reload { ap_none {  { int_acc_m_61_load_reload in_data 0 32 } } }
	int_acc_w_14_load_reload { ap_none {  { int_acc_w_14_load_reload in_data 0 32 } } }
	int_acc_w_30_load_reload { ap_none {  { int_acc_w_30_load_reload in_data 0 32 } } }
	int_acc_w_46_load_reload { ap_none {  { int_acc_w_46_load_reload in_data 0 32 } } }
	int_acc_w_62_load_reload { ap_none {  { int_acc_w_62_load_reload in_data 0 32 } } }
	int_acc_m_14_load_reload { ap_none {  { int_acc_m_14_load_reload in_data 0 32 } } }
	int_acc_m_30_load_reload { ap_none {  { int_acc_m_30_load_reload in_data 0 32 } } }
	int_acc_m_46_load_reload { ap_none {  { int_acc_m_46_load_reload in_data 0 32 } } }
	int_acc_m_62_load_reload { ap_none {  { int_acc_m_62_load_reload in_data 0 32 } } }
	int_acc_w_15_load_reload { ap_none {  { int_acc_w_15_load_reload in_data 0 32 } } }
	int_acc_w_31_load_reload { ap_none {  { int_acc_w_31_load_reload in_data 0 32 } } }
	int_acc_w_47_load_reload { ap_none {  { int_acc_w_47_load_reload in_data 0 32 } } }
	int_acc_w_63_load_reload { ap_none {  { int_acc_w_63_load_reload in_data 0 32 } } }
	int_acc_m_15_load_reload { ap_none {  { int_acc_m_15_load_reload in_data 0 32 } } }
	int_acc_m_31_load_reload { ap_none {  { int_acc_m_31_load_reload in_data 0 32 } } }
	int_acc_m_47_load_reload { ap_none {  { int_acc_m_47_load_reload in_data 0 32 } } }
	int_acc_m_63_load_reload { ap_none {  { int_acc_m_63_load_reload in_data 0 32 } } }
	d_1 { ap_none {  { d_1 in_data 0 32 } } }
	d_3 { ap_none {  { d_3 in_data 0 32 } } }
	d_5 { ap_none {  { d_5 in_data 0 32 } } }
	d_7 { ap_none {  { d_7 in_data 0 32 } } }
	dmin_1 { ap_none {  { dmin_1 in_data 0 32 } } }
	dmin_3 { ap_none {  { dmin_3 in_data 0 32 } } }
	dmin_5 { ap_none {  { dmin_5 in_data 0 32 } } }
	dmin_7 { ap_none {  { dmin_7 in_data 0 32 } } }
	total_out { ap_vld {  { total_out out_data 1 32 }  { total_out_ap_vld out_vld 1 1 } } }
}
