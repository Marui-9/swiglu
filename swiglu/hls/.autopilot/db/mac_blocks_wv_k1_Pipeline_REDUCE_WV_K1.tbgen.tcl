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
set cdfgNum 39
set C_modelName {mac_blocks_wv_k1_Pipeline_REDUCE_WV_K1}
set C_modelType { void 0 }
set ap_memory_interface_dict [dict create]
set C_modelArgList {
	{ int_acc_w_load_reload int 32 regular  }
	{ int_acc_w_8_load_reload int 32 regular  }
	{ int_acc_w_16_load_reload int 32 regular  }
	{ int_acc_w_24_load_reload int 32 regular  }
	{ int_acc_w_32_load_reload int 32 regular  }
	{ int_acc_w_40_load_reload int 32 regular  }
	{ int_acc_w_48_load_reload int 32 regular  }
	{ int_acc_w_56_load_reload int 32 regular  }
	{ int_acc_m_load_reload int 32 regular  }
	{ int_acc_m_8_load_reload int 32 regular  }
	{ int_acc_m_16_load_reload int 32 regular  }
	{ int_acc_m_24_load_reload int 32 regular  }
	{ int_acc_m_32_load_reload int 32 regular  }
	{ int_acc_m_40_load_reload int 32 regular  }
	{ int_acc_m_48_load_reload int 32 regular  }
	{ int_acc_m_56_load_reload int 32 regular  }
	{ int_acc_w_1_load_reload int 32 regular  }
	{ int_acc_w_9_load_reload int 32 regular  }
	{ int_acc_w_17_load_reload int 32 regular  }
	{ int_acc_w_25_load_reload int 32 regular  }
	{ int_acc_w_33_load_reload int 32 regular  }
	{ int_acc_w_41_load_reload int 32 regular  }
	{ int_acc_w_49_load_reload int 32 regular  }
	{ int_acc_w_57_load_reload int 32 regular  }
	{ int_acc_m_1_load_reload int 32 regular  }
	{ int_acc_m_9_load_reload int 32 regular  }
	{ int_acc_m_17_load_reload int 32 regular  }
	{ int_acc_m_25_load_reload int 32 regular  }
	{ int_acc_m_33_load_reload int 32 regular  }
	{ int_acc_m_41_load_reload int 32 regular  }
	{ int_acc_m_49_load_reload int 32 regular  }
	{ int_acc_m_57_load_reload int 32 regular  }
	{ int_acc_w_2_load_reload int 32 regular  }
	{ int_acc_w_10_load_reload int 32 regular  }
	{ int_acc_w_18_load_reload int 32 regular  }
	{ int_acc_w_26_load_reload int 32 regular  }
	{ int_acc_w_34_load_reload int 32 regular  }
	{ int_acc_w_42_load_reload int 32 regular  }
	{ int_acc_w_50_load_reload int 32 regular  }
	{ int_acc_w_58_load_reload int 32 regular  }
	{ int_acc_m_2_load_reload int 32 regular  }
	{ int_acc_m_10_load_reload int 32 regular  }
	{ int_acc_m_18_load_reload int 32 regular  }
	{ int_acc_m_26_load_reload int 32 regular  }
	{ int_acc_m_34_load_reload int 32 regular  }
	{ int_acc_m_42_load_reload int 32 regular  }
	{ int_acc_m_50_load_reload int 32 regular  }
	{ int_acc_m_58_load_reload int 32 regular  }
	{ int_acc_w_3_load_reload int 32 regular  }
	{ int_acc_w_11_load_reload int 32 regular  }
	{ int_acc_w_19_load_reload int 32 regular  }
	{ int_acc_w_27_load_reload int 32 regular  }
	{ int_acc_w_35_load_reload int 32 regular  }
	{ int_acc_w_43_load_reload int 32 regular  }
	{ int_acc_w_51_load_reload int 32 regular  }
	{ int_acc_w_59_load_reload int 32 regular  }
	{ int_acc_m_3_load_reload int 32 regular  }
	{ int_acc_m_11_load_reload int 32 regular  }
	{ int_acc_m_19_load_reload int 32 regular  }
	{ int_acc_m_27_load_reload int 32 regular  }
	{ int_acc_m_35_load_reload int 32 regular  }
	{ int_acc_m_43_load_reload int 32 regular  }
	{ int_acc_m_51_load_reload int 32 regular  }
	{ int_acc_m_59_load_reload int 32 regular  }
	{ int_acc_w_4_load_reload int 32 regular  }
	{ int_acc_w_12_load_reload int 32 regular  }
	{ int_acc_w_20_load_reload int 32 regular  }
	{ int_acc_w_28_load_reload int 32 regular  }
	{ int_acc_w_36_load_reload int 32 regular  }
	{ int_acc_w_44_load_reload int 32 regular  }
	{ int_acc_w_52_load_reload int 32 regular  }
	{ int_acc_w_60_load_reload int 32 regular  }
	{ int_acc_m_4_load_reload int 32 regular  }
	{ int_acc_m_12_load_reload int 32 regular  }
	{ int_acc_m_20_load_reload int 32 regular  }
	{ int_acc_m_28_load_reload int 32 regular  }
	{ int_acc_m_36_load_reload int 32 regular  }
	{ int_acc_m_44_load_reload int 32 regular  }
	{ int_acc_m_52_load_reload int 32 regular  }
	{ int_acc_m_60_load_reload int 32 regular  }
	{ int_acc_w_5_load_reload int 32 regular  }
	{ int_acc_w_13_load_reload int 32 regular  }
	{ int_acc_w_21_load_reload int 32 regular  }
	{ int_acc_w_29_load_reload int 32 regular  }
	{ int_acc_w_37_load_reload int 32 regular  }
	{ int_acc_w_45_load_reload int 32 regular  }
	{ int_acc_w_53_load_reload int 32 regular  }
	{ int_acc_w_61_load_reload int 32 regular  }
	{ int_acc_m_5_load_reload int 32 regular  }
	{ int_acc_m_13_load_reload int 32 regular  }
	{ int_acc_m_21_load_reload int 32 regular  }
	{ int_acc_m_29_load_reload int 32 regular  }
	{ int_acc_m_37_load_reload int 32 regular  }
	{ int_acc_m_45_load_reload int 32 regular  }
	{ int_acc_m_53_load_reload int 32 regular  }
	{ int_acc_m_61_load_reload int 32 regular  }
	{ int_acc_w_6_load_reload int 32 regular  }
	{ int_acc_w_14_load_reload int 32 regular  }
	{ int_acc_w_22_load_reload int 32 regular  }
	{ int_acc_w_30_load_reload int 32 regular  }
	{ int_acc_w_38_load_reload int 32 regular  }
	{ int_acc_w_46_load_reload int 32 regular  }
	{ int_acc_w_54_load_reload int 32 regular  }
	{ int_acc_w_62_load_reload int 32 regular  }
	{ int_acc_m_6_load_reload int 32 regular  }
	{ int_acc_m_14_load_reload int 32 regular  }
	{ int_acc_m_22_load_reload int 32 regular  }
	{ int_acc_m_30_load_reload int 32 regular  }
	{ int_acc_m_38_load_reload int 32 regular  }
	{ int_acc_m_46_load_reload int 32 regular  }
	{ int_acc_m_54_load_reload int 32 regular  }
	{ int_acc_m_62_load_reload int 32 regular  }
	{ int_acc_w_7_load_reload int 32 regular  }
	{ int_acc_w_15_load_reload int 32 regular  }
	{ int_acc_w_23_load_reload int 32 regular  }
	{ int_acc_w_31_load_reload int 32 regular  }
	{ int_acc_w_39_load_reload int 32 regular  }
	{ int_acc_w_47_load_reload int 32 regular  }
	{ int_acc_w_55_load_reload int 32 regular  }
	{ int_acc_w_63_load_reload int 32 regular  }
	{ int_acc_m_7_load_reload int 32 regular  }
	{ int_acc_m_15_load_reload int 32 regular  }
	{ int_acc_m_23_load_reload int 32 regular  }
	{ int_acc_m_31_load_reload int 32 regular  }
	{ int_acc_m_39_load_reload int 32 regular  }
	{ int_acc_m_47_load_reload int 32 regular  }
	{ int_acc_m_55_load_reload int 32 regular  }
	{ int_acc_m_63_load_reload int 32 regular  }
	{ mux_case_08251_reload float 32 regular  }
	{ mux_case_18264_reload float 32 regular  }
	{ mux_case_28277_reload float 32 regular  }
	{ mux_case_382810_reload float 32 regular  }
	{ mux_case_482913_reload float 32 regular  }
	{ mux_case_583016_reload float 32 regular  }
	{ mux_case_683119_reload float 32 regular  }
	{ mux_case_783222_reload float 32 regular  }
	{ mux_case_083326_reload float 32 regular  }
	{ mux_case_183429_reload float 32 regular  }
	{ mux_case_283532_reload float 32 regular  }
	{ mux_case_383635_reload float 32 regular  }
	{ mux_case_483738_reload float 32 regular  }
	{ mux_case_583841_reload float 32 regular  }
	{ mux_case_683944_reload float 32 regular  }
	{ mux_case_784047_reload float 32 regular  }
	{ total_out int 56 regular {pointer 1}  }
}
set hasAXIMCache 0
set l_AXIML2Cache [list]
set AXIMCacheInstDict [dict create]
set C_modelArgMapList {[ 
	{ "Name" : "int_acc_w_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_w_8_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_w_16_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_w_24_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_w_32_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_w_40_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_w_48_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_w_56_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_m_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_m_8_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_m_16_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_m_24_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_m_32_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_m_40_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_m_48_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_m_56_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_w_1_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_w_9_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_w_17_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_w_25_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_w_33_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_w_41_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_w_49_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_w_57_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_m_1_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_m_9_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_m_17_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_m_25_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_m_33_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_m_41_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_m_49_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_m_57_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_w_2_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_w_10_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_w_18_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_w_26_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_w_34_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_w_42_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_w_50_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_w_58_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_m_2_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_m_10_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_m_18_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_m_26_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_m_34_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_m_42_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_m_50_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_m_58_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_w_3_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_w_11_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_w_19_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_w_27_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_w_35_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_w_43_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_w_51_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_w_59_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_m_3_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_m_11_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_m_19_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_m_27_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_m_35_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_m_43_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_m_51_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_m_59_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_w_4_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_w_12_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_w_20_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_w_28_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_w_36_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_w_44_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_w_52_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_w_60_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_m_4_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_m_12_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_m_20_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_m_28_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_m_36_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_m_44_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_m_52_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_m_60_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_w_5_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_w_13_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_w_21_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_w_29_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_w_37_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_w_45_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_w_53_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_w_61_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_m_5_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_m_13_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_m_21_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_m_29_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_m_37_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_m_45_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_m_53_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_m_61_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_w_6_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_w_14_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_w_22_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_w_30_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_w_38_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_w_46_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_w_54_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_w_62_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_m_6_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_m_14_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_m_22_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_m_30_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_m_38_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_m_46_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_m_54_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_m_62_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_w_7_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_w_15_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_w_23_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_w_31_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_w_39_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_w_47_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_w_55_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_w_63_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_m_7_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_m_15_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_m_23_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_m_31_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_m_39_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_m_47_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_m_55_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "int_acc_m_63_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "mux_case_08251_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "mux_case_18264_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "mux_case_28277_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "mux_case_382810_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "mux_case_482913_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "mux_case_583016_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "mux_case_683119_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "mux_case_783222_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "mux_case_083326_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "mux_case_183429_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "mux_case_283532_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "mux_case_383635_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "mux_case_483738_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "mux_case_583841_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "mux_case_683944_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "mux_case_784047_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "total_out", "interface" : "wire", "bitwidth" : 56, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 152
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ int_acc_w_load_reload sc_in sc_lv 32 signal 0 } 
	{ int_acc_w_8_load_reload sc_in sc_lv 32 signal 1 } 
	{ int_acc_w_16_load_reload sc_in sc_lv 32 signal 2 } 
	{ int_acc_w_24_load_reload sc_in sc_lv 32 signal 3 } 
	{ int_acc_w_32_load_reload sc_in sc_lv 32 signal 4 } 
	{ int_acc_w_40_load_reload sc_in sc_lv 32 signal 5 } 
	{ int_acc_w_48_load_reload sc_in sc_lv 32 signal 6 } 
	{ int_acc_w_56_load_reload sc_in sc_lv 32 signal 7 } 
	{ int_acc_m_load_reload sc_in sc_lv 32 signal 8 } 
	{ int_acc_m_8_load_reload sc_in sc_lv 32 signal 9 } 
	{ int_acc_m_16_load_reload sc_in sc_lv 32 signal 10 } 
	{ int_acc_m_24_load_reload sc_in sc_lv 32 signal 11 } 
	{ int_acc_m_32_load_reload sc_in sc_lv 32 signal 12 } 
	{ int_acc_m_40_load_reload sc_in sc_lv 32 signal 13 } 
	{ int_acc_m_48_load_reload sc_in sc_lv 32 signal 14 } 
	{ int_acc_m_56_load_reload sc_in sc_lv 32 signal 15 } 
	{ int_acc_w_1_load_reload sc_in sc_lv 32 signal 16 } 
	{ int_acc_w_9_load_reload sc_in sc_lv 32 signal 17 } 
	{ int_acc_w_17_load_reload sc_in sc_lv 32 signal 18 } 
	{ int_acc_w_25_load_reload sc_in sc_lv 32 signal 19 } 
	{ int_acc_w_33_load_reload sc_in sc_lv 32 signal 20 } 
	{ int_acc_w_41_load_reload sc_in sc_lv 32 signal 21 } 
	{ int_acc_w_49_load_reload sc_in sc_lv 32 signal 22 } 
	{ int_acc_w_57_load_reload sc_in sc_lv 32 signal 23 } 
	{ int_acc_m_1_load_reload sc_in sc_lv 32 signal 24 } 
	{ int_acc_m_9_load_reload sc_in sc_lv 32 signal 25 } 
	{ int_acc_m_17_load_reload sc_in sc_lv 32 signal 26 } 
	{ int_acc_m_25_load_reload sc_in sc_lv 32 signal 27 } 
	{ int_acc_m_33_load_reload sc_in sc_lv 32 signal 28 } 
	{ int_acc_m_41_load_reload sc_in sc_lv 32 signal 29 } 
	{ int_acc_m_49_load_reload sc_in sc_lv 32 signal 30 } 
	{ int_acc_m_57_load_reload sc_in sc_lv 32 signal 31 } 
	{ int_acc_w_2_load_reload sc_in sc_lv 32 signal 32 } 
	{ int_acc_w_10_load_reload sc_in sc_lv 32 signal 33 } 
	{ int_acc_w_18_load_reload sc_in sc_lv 32 signal 34 } 
	{ int_acc_w_26_load_reload sc_in sc_lv 32 signal 35 } 
	{ int_acc_w_34_load_reload sc_in sc_lv 32 signal 36 } 
	{ int_acc_w_42_load_reload sc_in sc_lv 32 signal 37 } 
	{ int_acc_w_50_load_reload sc_in sc_lv 32 signal 38 } 
	{ int_acc_w_58_load_reload sc_in sc_lv 32 signal 39 } 
	{ int_acc_m_2_load_reload sc_in sc_lv 32 signal 40 } 
	{ int_acc_m_10_load_reload sc_in sc_lv 32 signal 41 } 
	{ int_acc_m_18_load_reload sc_in sc_lv 32 signal 42 } 
	{ int_acc_m_26_load_reload sc_in sc_lv 32 signal 43 } 
	{ int_acc_m_34_load_reload sc_in sc_lv 32 signal 44 } 
	{ int_acc_m_42_load_reload sc_in sc_lv 32 signal 45 } 
	{ int_acc_m_50_load_reload sc_in sc_lv 32 signal 46 } 
	{ int_acc_m_58_load_reload sc_in sc_lv 32 signal 47 } 
	{ int_acc_w_3_load_reload sc_in sc_lv 32 signal 48 } 
	{ int_acc_w_11_load_reload sc_in sc_lv 32 signal 49 } 
	{ int_acc_w_19_load_reload sc_in sc_lv 32 signal 50 } 
	{ int_acc_w_27_load_reload sc_in sc_lv 32 signal 51 } 
	{ int_acc_w_35_load_reload sc_in sc_lv 32 signal 52 } 
	{ int_acc_w_43_load_reload sc_in sc_lv 32 signal 53 } 
	{ int_acc_w_51_load_reload sc_in sc_lv 32 signal 54 } 
	{ int_acc_w_59_load_reload sc_in sc_lv 32 signal 55 } 
	{ int_acc_m_3_load_reload sc_in sc_lv 32 signal 56 } 
	{ int_acc_m_11_load_reload sc_in sc_lv 32 signal 57 } 
	{ int_acc_m_19_load_reload sc_in sc_lv 32 signal 58 } 
	{ int_acc_m_27_load_reload sc_in sc_lv 32 signal 59 } 
	{ int_acc_m_35_load_reload sc_in sc_lv 32 signal 60 } 
	{ int_acc_m_43_load_reload sc_in sc_lv 32 signal 61 } 
	{ int_acc_m_51_load_reload sc_in sc_lv 32 signal 62 } 
	{ int_acc_m_59_load_reload sc_in sc_lv 32 signal 63 } 
	{ int_acc_w_4_load_reload sc_in sc_lv 32 signal 64 } 
	{ int_acc_w_12_load_reload sc_in sc_lv 32 signal 65 } 
	{ int_acc_w_20_load_reload sc_in sc_lv 32 signal 66 } 
	{ int_acc_w_28_load_reload sc_in sc_lv 32 signal 67 } 
	{ int_acc_w_36_load_reload sc_in sc_lv 32 signal 68 } 
	{ int_acc_w_44_load_reload sc_in sc_lv 32 signal 69 } 
	{ int_acc_w_52_load_reload sc_in sc_lv 32 signal 70 } 
	{ int_acc_w_60_load_reload sc_in sc_lv 32 signal 71 } 
	{ int_acc_m_4_load_reload sc_in sc_lv 32 signal 72 } 
	{ int_acc_m_12_load_reload sc_in sc_lv 32 signal 73 } 
	{ int_acc_m_20_load_reload sc_in sc_lv 32 signal 74 } 
	{ int_acc_m_28_load_reload sc_in sc_lv 32 signal 75 } 
	{ int_acc_m_36_load_reload sc_in sc_lv 32 signal 76 } 
	{ int_acc_m_44_load_reload sc_in sc_lv 32 signal 77 } 
	{ int_acc_m_52_load_reload sc_in sc_lv 32 signal 78 } 
	{ int_acc_m_60_load_reload sc_in sc_lv 32 signal 79 } 
	{ int_acc_w_5_load_reload sc_in sc_lv 32 signal 80 } 
	{ int_acc_w_13_load_reload sc_in sc_lv 32 signal 81 } 
	{ int_acc_w_21_load_reload sc_in sc_lv 32 signal 82 } 
	{ int_acc_w_29_load_reload sc_in sc_lv 32 signal 83 } 
	{ int_acc_w_37_load_reload sc_in sc_lv 32 signal 84 } 
	{ int_acc_w_45_load_reload sc_in sc_lv 32 signal 85 } 
	{ int_acc_w_53_load_reload sc_in sc_lv 32 signal 86 } 
	{ int_acc_w_61_load_reload sc_in sc_lv 32 signal 87 } 
	{ int_acc_m_5_load_reload sc_in sc_lv 32 signal 88 } 
	{ int_acc_m_13_load_reload sc_in sc_lv 32 signal 89 } 
	{ int_acc_m_21_load_reload sc_in sc_lv 32 signal 90 } 
	{ int_acc_m_29_load_reload sc_in sc_lv 32 signal 91 } 
	{ int_acc_m_37_load_reload sc_in sc_lv 32 signal 92 } 
	{ int_acc_m_45_load_reload sc_in sc_lv 32 signal 93 } 
	{ int_acc_m_53_load_reload sc_in sc_lv 32 signal 94 } 
	{ int_acc_m_61_load_reload sc_in sc_lv 32 signal 95 } 
	{ int_acc_w_6_load_reload sc_in sc_lv 32 signal 96 } 
	{ int_acc_w_14_load_reload sc_in sc_lv 32 signal 97 } 
	{ int_acc_w_22_load_reload sc_in sc_lv 32 signal 98 } 
	{ int_acc_w_30_load_reload sc_in sc_lv 32 signal 99 } 
	{ int_acc_w_38_load_reload sc_in sc_lv 32 signal 100 } 
	{ int_acc_w_46_load_reload sc_in sc_lv 32 signal 101 } 
	{ int_acc_w_54_load_reload sc_in sc_lv 32 signal 102 } 
	{ int_acc_w_62_load_reload sc_in sc_lv 32 signal 103 } 
	{ int_acc_m_6_load_reload sc_in sc_lv 32 signal 104 } 
	{ int_acc_m_14_load_reload sc_in sc_lv 32 signal 105 } 
	{ int_acc_m_22_load_reload sc_in sc_lv 32 signal 106 } 
	{ int_acc_m_30_load_reload sc_in sc_lv 32 signal 107 } 
	{ int_acc_m_38_load_reload sc_in sc_lv 32 signal 108 } 
	{ int_acc_m_46_load_reload sc_in sc_lv 32 signal 109 } 
	{ int_acc_m_54_load_reload sc_in sc_lv 32 signal 110 } 
	{ int_acc_m_62_load_reload sc_in sc_lv 32 signal 111 } 
	{ int_acc_w_7_load_reload sc_in sc_lv 32 signal 112 } 
	{ int_acc_w_15_load_reload sc_in sc_lv 32 signal 113 } 
	{ int_acc_w_23_load_reload sc_in sc_lv 32 signal 114 } 
	{ int_acc_w_31_load_reload sc_in sc_lv 32 signal 115 } 
	{ int_acc_w_39_load_reload sc_in sc_lv 32 signal 116 } 
	{ int_acc_w_47_load_reload sc_in sc_lv 32 signal 117 } 
	{ int_acc_w_55_load_reload sc_in sc_lv 32 signal 118 } 
	{ int_acc_w_63_load_reload sc_in sc_lv 32 signal 119 } 
	{ int_acc_m_7_load_reload sc_in sc_lv 32 signal 120 } 
	{ int_acc_m_15_load_reload sc_in sc_lv 32 signal 121 } 
	{ int_acc_m_23_load_reload sc_in sc_lv 32 signal 122 } 
	{ int_acc_m_31_load_reload sc_in sc_lv 32 signal 123 } 
	{ int_acc_m_39_load_reload sc_in sc_lv 32 signal 124 } 
	{ int_acc_m_47_load_reload sc_in sc_lv 32 signal 125 } 
	{ int_acc_m_55_load_reload sc_in sc_lv 32 signal 126 } 
	{ int_acc_m_63_load_reload sc_in sc_lv 32 signal 127 } 
	{ mux_case_08251_reload sc_in sc_lv 32 signal 128 } 
	{ mux_case_18264_reload sc_in sc_lv 32 signal 129 } 
	{ mux_case_28277_reload sc_in sc_lv 32 signal 130 } 
	{ mux_case_382810_reload sc_in sc_lv 32 signal 131 } 
	{ mux_case_482913_reload sc_in sc_lv 32 signal 132 } 
	{ mux_case_583016_reload sc_in sc_lv 32 signal 133 } 
	{ mux_case_683119_reload sc_in sc_lv 32 signal 134 } 
	{ mux_case_783222_reload sc_in sc_lv 32 signal 135 } 
	{ mux_case_083326_reload sc_in sc_lv 32 signal 136 } 
	{ mux_case_183429_reload sc_in sc_lv 32 signal 137 } 
	{ mux_case_283532_reload sc_in sc_lv 32 signal 138 } 
	{ mux_case_383635_reload sc_in sc_lv 32 signal 139 } 
	{ mux_case_483738_reload sc_in sc_lv 32 signal 140 } 
	{ mux_case_583841_reload sc_in sc_lv 32 signal 141 } 
	{ mux_case_683944_reload sc_in sc_lv 32 signal 142 } 
	{ mux_case_784047_reload sc_in sc_lv 32 signal 143 } 
	{ total_out sc_out sc_lv 56 signal 144 } 
	{ total_out_ap_vld sc_out sc_logic 1 outvld 144 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "int_acc_w_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_w_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_w_8_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_w_8_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_w_16_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_w_16_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_w_24_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_w_24_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_w_32_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_w_32_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_w_40_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_w_40_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_w_48_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_w_48_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_w_56_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_w_56_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_m_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_m_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_m_8_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_m_8_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_m_16_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_m_16_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_m_24_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_m_24_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_m_32_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_m_32_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_m_40_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_m_40_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_m_48_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_m_48_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_m_56_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_m_56_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_w_1_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_w_1_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_w_9_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_w_9_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_w_17_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_w_17_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_w_25_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_w_25_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_w_33_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_w_33_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_w_41_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_w_41_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_w_49_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_w_49_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_w_57_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_w_57_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_m_1_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_m_1_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_m_9_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_m_9_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_m_17_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_m_17_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_m_25_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_m_25_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_m_33_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_m_33_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_m_41_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_m_41_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_m_49_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_m_49_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_m_57_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_m_57_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_w_2_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_w_2_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_w_10_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_w_10_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_w_18_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_w_18_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_w_26_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_w_26_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_w_34_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_w_34_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_w_42_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_w_42_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_w_50_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_w_50_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_w_58_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_w_58_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_m_2_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_m_2_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_m_10_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_m_10_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_m_18_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_m_18_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_m_26_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_m_26_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_m_34_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_m_34_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_m_42_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_m_42_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_m_50_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_m_50_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_m_58_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_m_58_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_w_3_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_w_3_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_w_11_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_w_11_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_w_19_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_w_19_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_w_27_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_w_27_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_w_35_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_w_35_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_w_43_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_w_43_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_w_51_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_w_51_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_w_59_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_w_59_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_m_3_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_m_3_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_m_11_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_m_11_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_m_19_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_m_19_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_m_27_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_m_27_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_m_35_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_m_35_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_m_43_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_m_43_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_m_51_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_m_51_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_m_59_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_m_59_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_w_4_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_w_4_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_w_12_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_w_12_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_w_20_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_w_20_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_w_28_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_w_28_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_w_36_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_w_36_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_w_44_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_w_44_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_w_52_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_w_52_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_w_60_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_w_60_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_m_4_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_m_4_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_m_12_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_m_12_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_m_20_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_m_20_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_m_28_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_m_28_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_m_36_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_m_36_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_m_44_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_m_44_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_m_52_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_m_52_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_m_60_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_m_60_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_w_5_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_w_5_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_w_13_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_w_13_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_w_21_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_w_21_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_w_29_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_w_29_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_w_37_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_w_37_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_w_45_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_w_45_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_w_53_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_w_53_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_w_61_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_w_61_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_m_5_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_m_5_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_m_13_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_m_13_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_m_21_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_m_21_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_m_29_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_m_29_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_m_37_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_m_37_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_m_45_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_m_45_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_m_53_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_m_53_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_m_61_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_m_61_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_w_6_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_w_6_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_w_14_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_w_14_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_w_22_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_w_22_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_w_30_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_w_30_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_w_38_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_w_38_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_w_46_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_w_46_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_w_54_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_w_54_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_w_62_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_w_62_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_m_6_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_m_6_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_m_14_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_m_14_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_m_22_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_m_22_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_m_30_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_m_30_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_m_38_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_m_38_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_m_46_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_m_46_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_m_54_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_m_54_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_m_62_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_m_62_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_w_7_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_w_7_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_w_15_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_w_15_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_w_23_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_w_23_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_w_31_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_w_31_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_w_39_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_w_39_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_w_47_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_w_47_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_w_55_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_w_55_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_w_63_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_w_63_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_m_7_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_m_7_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_m_15_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_m_15_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_m_23_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_m_23_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_m_31_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_m_31_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_m_39_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_m_39_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_m_47_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_m_47_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_m_55_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_m_55_load_reload", "role": "default" }} , 
 	{ "name": "int_acc_m_63_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "int_acc_m_63_load_reload", "role": "default" }} , 
 	{ "name": "mux_case_08251_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "mux_case_08251_reload", "role": "default" }} , 
 	{ "name": "mux_case_18264_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "mux_case_18264_reload", "role": "default" }} , 
 	{ "name": "mux_case_28277_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "mux_case_28277_reload", "role": "default" }} , 
 	{ "name": "mux_case_382810_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "mux_case_382810_reload", "role": "default" }} , 
 	{ "name": "mux_case_482913_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "mux_case_482913_reload", "role": "default" }} , 
 	{ "name": "mux_case_583016_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "mux_case_583016_reload", "role": "default" }} , 
 	{ "name": "mux_case_683119_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "mux_case_683119_reload", "role": "default" }} , 
 	{ "name": "mux_case_783222_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "mux_case_783222_reload", "role": "default" }} , 
 	{ "name": "mux_case_083326_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "mux_case_083326_reload", "role": "default" }} , 
 	{ "name": "mux_case_183429_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "mux_case_183429_reload", "role": "default" }} , 
 	{ "name": "mux_case_283532_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "mux_case_283532_reload", "role": "default" }} , 
 	{ "name": "mux_case_383635_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "mux_case_383635_reload", "role": "default" }} , 
 	{ "name": "mux_case_483738_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "mux_case_483738_reload", "role": "default" }} , 
 	{ "name": "mux_case_583841_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "mux_case_583841_reload", "role": "default" }} , 
 	{ "name": "mux_case_683944_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "mux_case_683944_reload", "role": "default" }} , 
 	{ "name": "mux_case_784047_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "mux_case_784047_reload", "role": "default" }} , 
 	{ "name": "total_out", "direction": "out", "datatype": "sc_lv", "bitwidth":56, "type": "signal", "bundle":{"name": "total_out", "role": "default" }} , 
 	{ "name": "total_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "total_out", "role": "ap_vld" }}  ]}

set ArgLastReadFirstWriteLatency {
	mac_blocks_wv_k1_Pipeline_REDUCE_WV_K1 {
		int_acc_w_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_w_8_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_w_16_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_w_24_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_w_32_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_w_40_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_w_48_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_w_56_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_m_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_m_8_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_m_16_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_m_24_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_m_32_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_m_40_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_m_48_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_m_56_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_w_1_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_w_9_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_w_17_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_w_25_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_w_33_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_w_41_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_w_49_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_w_57_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_m_1_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_m_9_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_m_17_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_m_25_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_m_33_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_m_41_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_m_49_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_m_57_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_w_2_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_w_10_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_w_18_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_w_26_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_w_34_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_w_42_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_w_50_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_w_58_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_m_2_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_m_10_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_m_18_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_m_26_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_m_34_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_m_42_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_m_50_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_m_58_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_w_3_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_w_11_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_w_19_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_w_27_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_w_35_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_w_43_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_w_51_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_w_59_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_m_3_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_m_11_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_m_19_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_m_27_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_m_35_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_m_43_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_m_51_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_m_59_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_w_4_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_w_12_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_w_20_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_w_28_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_w_36_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_w_44_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_w_52_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_w_60_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_m_4_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_m_12_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_m_20_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_m_28_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_m_36_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_m_44_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_m_52_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_m_60_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_w_5_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_w_13_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_w_21_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_w_29_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_w_37_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_w_45_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_w_53_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_w_61_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_m_5_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_m_13_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_m_21_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_m_29_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_m_37_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_m_45_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_m_53_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_m_61_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_w_6_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_w_14_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_w_22_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_w_30_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_w_38_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_w_46_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_w_54_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_w_62_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_m_6_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_m_14_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_m_22_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_m_30_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_m_38_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_m_46_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_m_54_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_m_62_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_w_7_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_w_15_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_w_23_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_w_31_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_w_39_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_w_47_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_w_55_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_w_63_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_m_7_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_m_15_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_m_23_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_m_31_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_m_39_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_m_47_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_m_55_load_reload {Type I LastRead 0 FirstWrite -1}
		int_acc_m_63_load_reload {Type I LastRead 0 FirstWrite -1}
		mux_case_08251_reload {Type I LastRead 0 FirstWrite -1}
		mux_case_18264_reload {Type I LastRead 0 FirstWrite -1}
		mux_case_28277_reload {Type I LastRead 0 FirstWrite -1}
		mux_case_382810_reload {Type I LastRead 0 FirstWrite -1}
		mux_case_482913_reload {Type I LastRead 0 FirstWrite -1}
		mux_case_583016_reload {Type I LastRead 0 FirstWrite -1}
		mux_case_683119_reload {Type I LastRead 0 FirstWrite -1}
		mux_case_783222_reload {Type I LastRead 0 FirstWrite -1}
		mux_case_083326_reload {Type I LastRead 0 FirstWrite -1}
		mux_case_183429_reload {Type I LastRead 0 FirstWrite -1}
		mux_case_283532_reload {Type I LastRead 0 FirstWrite -1}
		mux_case_383635_reload {Type I LastRead 0 FirstWrite -1}
		mux_case_483738_reload {Type I LastRead 0 FirstWrite -1}
		mux_case_583841_reload {Type I LastRead 0 FirstWrite -1}
		mux_case_683944_reload {Type I LastRead 0 FirstWrite -1}
		mux_case_784047_reload {Type I LastRead 0 FirstWrite -1}
		total_out {Type O LastRead -1 FirstWrite 9}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "19", "Max" : "19"}
	, {"Name" : "Interval", "Min" : "19", "Max" : "19"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	int_acc_w_load_reload { ap_none {  { int_acc_w_load_reload in_data 0 32 } } }
	int_acc_w_8_load_reload { ap_none {  { int_acc_w_8_load_reload in_data 0 32 } } }
	int_acc_w_16_load_reload { ap_none {  { int_acc_w_16_load_reload in_data 0 32 } } }
	int_acc_w_24_load_reload { ap_none {  { int_acc_w_24_load_reload in_data 0 32 } } }
	int_acc_w_32_load_reload { ap_none {  { int_acc_w_32_load_reload in_data 0 32 } } }
	int_acc_w_40_load_reload { ap_none {  { int_acc_w_40_load_reload in_data 0 32 } } }
	int_acc_w_48_load_reload { ap_none {  { int_acc_w_48_load_reload in_data 0 32 } } }
	int_acc_w_56_load_reload { ap_none {  { int_acc_w_56_load_reload in_data 0 32 } } }
	int_acc_m_load_reload { ap_none {  { int_acc_m_load_reload in_data 0 32 } } }
	int_acc_m_8_load_reload { ap_none {  { int_acc_m_8_load_reload in_data 0 32 } } }
	int_acc_m_16_load_reload { ap_none {  { int_acc_m_16_load_reload in_data 0 32 } } }
	int_acc_m_24_load_reload { ap_none {  { int_acc_m_24_load_reload in_data 0 32 } } }
	int_acc_m_32_load_reload { ap_none {  { int_acc_m_32_load_reload in_data 0 32 } } }
	int_acc_m_40_load_reload { ap_none {  { int_acc_m_40_load_reload in_data 0 32 } } }
	int_acc_m_48_load_reload { ap_none {  { int_acc_m_48_load_reload in_data 0 32 } } }
	int_acc_m_56_load_reload { ap_none {  { int_acc_m_56_load_reload in_data 0 32 } } }
	int_acc_w_1_load_reload { ap_none {  { int_acc_w_1_load_reload in_data 0 32 } } }
	int_acc_w_9_load_reload { ap_none {  { int_acc_w_9_load_reload in_data 0 32 } } }
	int_acc_w_17_load_reload { ap_none {  { int_acc_w_17_load_reload in_data 0 32 } } }
	int_acc_w_25_load_reload { ap_none {  { int_acc_w_25_load_reload in_data 0 32 } } }
	int_acc_w_33_load_reload { ap_none {  { int_acc_w_33_load_reload in_data 0 32 } } }
	int_acc_w_41_load_reload { ap_none {  { int_acc_w_41_load_reload in_data 0 32 } } }
	int_acc_w_49_load_reload { ap_none {  { int_acc_w_49_load_reload in_data 0 32 } } }
	int_acc_w_57_load_reload { ap_none {  { int_acc_w_57_load_reload in_data 0 32 } } }
	int_acc_m_1_load_reload { ap_none {  { int_acc_m_1_load_reload in_data 0 32 } } }
	int_acc_m_9_load_reload { ap_none {  { int_acc_m_9_load_reload in_data 0 32 } } }
	int_acc_m_17_load_reload { ap_none {  { int_acc_m_17_load_reload in_data 0 32 } } }
	int_acc_m_25_load_reload { ap_none {  { int_acc_m_25_load_reload in_data 0 32 } } }
	int_acc_m_33_load_reload { ap_none {  { int_acc_m_33_load_reload in_data 0 32 } } }
	int_acc_m_41_load_reload { ap_none {  { int_acc_m_41_load_reload in_data 0 32 } } }
	int_acc_m_49_load_reload { ap_none {  { int_acc_m_49_load_reload in_data 0 32 } } }
	int_acc_m_57_load_reload { ap_none {  { int_acc_m_57_load_reload in_data 0 32 } } }
	int_acc_w_2_load_reload { ap_none {  { int_acc_w_2_load_reload in_data 0 32 } } }
	int_acc_w_10_load_reload { ap_none {  { int_acc_w_10_load_reload in_data 0 32 } } }
	int_acc_w_18_load_reload { ap_none {  { int_acc_w_18_load_reload in_data 0 32 } } }
	int_acc_w_26_load_reload { ap_none {  { int_acc_w_26_load_reload in_data 0 32 } } }
	int_acc_w_34_load_reload { ap_none {  { int_acc_w_34_load_reload in_data 0 32 } } }
	int_acc_w_42_load_reload { ap_none {  { int_acc_w_42_load_reload in_data 0 32 } } }
	int_acc_w_50_load_reload { ap_none {  { int_acc_w_50_load_reload in_data 0 32 } } }
	int_acc_w_58_load_reload { ap_none {  { int_acc_w_58_load_reload in_data 0 32 } } }
	int_acc_m_2_load_reload { ap_none {  { int_acc_m_2_load_reload in_data 0 32 } } }
	int_acc_m_10_load_reload { ap_none {  { int_acc_m_10_load_reload in_data 0 32 } } }
	int_acc_m_18_load_reload { ap_none {  { int_acc_m_18_load_reload in_data 0 32 } } }
	int_acc_m_26_load_reload { ap_none {  { int_acc_m_26_load_reload in_data 0 32 } } }
	int_acc_m_34_load_reload { ap_none {  { int_acc_m_34_load_reload in_data 0 32 } } }
	int_acc_m_42_load_reload { ap_none {  { int_acc_m_42_load_reload in_data 0 32 } } }
	int_acc_m_50_load_reload { ap_none {  { int_acc_m_50_load_reload in_data 0 32 } } }
	int_acc_m_58_load_reload { ap_none {  { int_acc_m_58_load_reload in_data 0 32 } } }
	int_acc_w_3_load_reload { ap_none {  { int_acc_w_3_load_reload in_data 0 32 } } }
	int_acc_w_11_load_reload { ap_none {  { int_acc_w_11_load_reload in_data 0 32 } } }
	int_acc_w_19_load_reload { ap_none {  { int_acc_w_19_load_reload in_data 0 32 } } }
	int_acc_w_27_load_reload { ap_none {  { int_acc_w_27_load_reload in_data 0 32 } } }
	int_acc_w_35_load_reload { ap_none {  { int_acc_w_35_load_reload in_data 0 32 } } }
	int_acc_w_43_load_reload { ap_none {  { int_acc_w_43_load_reload in_data 0 32 } } }
	int_acc_w_51_load_reload { ap_none {  { int_acc_w_51_load_reload in_data 0 32 } } }
	int_acc_w_59_load_reload { ap_none {  { int_acc_w_59_load_reload in_data 0 32 } } }
	int_acc_m_3_load_reload { ap_none {  { int_acc_m_3_load_reload in_data 0 32 } } }
	int_acc_m_11_load_reload { ap_none {  { int_acc_m_11_load_reload in_data 0 32 } } }
	int_acc_m_19_load_reload { ap_none {  { int_acc_m_19_load_reload in_data 0 32 } } }
	int_acc_m_27_load_reload { ap_none {  { int_acc_m_27_load_reload in_data 0 32 } } }
	int_acc_m_35_load_reload { ap_none {  { int_acc_m_35_load_reload in_data 0 32 } } }
	int_acc_m_43_load_reload { ap_none {  { int_acc_m_43_load_reload in_data 0 32 } } }
	int_acc_m_51_load_reload { ap_none {  { int_acc_m_51_load_reload in_data 0 32 } } }
	int_acc_m_59_load_reload { ap_none {  { int_acc_m_59_load_reload in_data 0 32 } } }
	int_acc_w_4_load_reload { ap_none {  { int_acc_w_4_load_reload in_data 0 32 } } }
	int_acc_w_12_load_reload { ap_none {  { int_acc_w_12_load_reload in_data 0 32 } } }
	int_acc_w_20_load_reload { ap_none {  { int_acc_w_20_load_reload in_data 0 32 } } }
	int_acc_w_28_load_reload { ap_none {  { int_acc_w_28_load_reload in_data 0 32 } } }
	int_acc_w_36_load_reload { ap_none {  { int_acc_w_36_load_reload in_data 0 32 } } }
	int_acc_w_44_load_reload { ap_none {  { int_acc_w_44_load_reload in_data 0 32 } } }
	int_acc_w_52_load_reload { ap_none {  { int_acc_w_52_load_reload in_data 0 32 } } }
	int_acc_w_60_load_reload { ap_none {  { int_acc_w_60_load_reload in_data 0 32 } } }
	int_acc_m_4_load_reload { ap_none {  { int_acc_m_4_load_reload in_data 0 32 } } }
	int_acc_m_12_load_reload { ap_none {  { int_acc_m_12_load_reload in_data 0 32 } } }
	int_acc_m_20_load_reload { ap_none {  { int_acc_m_20_load_reload in_data 0 32 } } }
	int_acc_m_28_load_reload { ap_none {  { int_acc_m_28_load_reload in_data 0 32 } } }
	int_acc_m_36_load_reload { ap_none {  { int_acc_m_36_load_reload in_data 0 32 } } }
	int_acc_m_44_load_reload { ap_none {  { int_acc_m_44_load_reload in_data 0 32 } } }
	int_acc_m_52_load_reload { ap_none {  { int_acc_m_52_load_reload in_data 0 32 } } }
	int_acc_m_60_load_reload { ap_none {  { int_acc_m_60_load_reload in_data 0 32 } } }
	int_acc_w_5_load_reload { ap_none {  { int_acc_w_5_load_reload in_data 0 32 } } }
	int_acc_w_13_load_reload { ap_none {  { int_acc_w_13_load_reload in_data 0 32 } } }
	int_acc_w_21_load_reload { ap_none {  { int_acc_w_21_load_reload in_data 0 32 } } }
	int_acc_w_29_load_reload { ap_none {  { int_acc_w_29_load_reload in_data 0 32 } } }
	int_acc_w_37_load_reload { ap_none {  { int_acc_w_37_load_reload in_data 0 32 } } }
	int_acc_w_45_load_reload { ap_none {  { int_acc_w_45_load_reload in_data 0 32 } } }
	int_acc_w_53_load_reload { ap_none {  { int_acc_w_53_load_reload in_data 0 32 } } }
	int_acc_w_61_load_reload { ap_none {  { int_acc_w_61_load_reload in_data 0 32 } } }
	int_acc_m_5_load_reload { ap_none {  { int_acc_m_5_load_reload in_data 0 32 } } }
	int_acc_m_13_load_reload { ap_none {  { int_acc_m_13_load_reload in_data 0 32 } } }
	int_acc_m_21_load_reload { ap_none {  { int_acc_m_21_load_reload in_data 0 32 } } }
	int_acc_m_29_load_reload { ap_none {  { int_acc_m_29_load_reload in_data 0 32 } } }
	int_acc_m_37_load_reload { ap_none {  { int_acc_m_37_load_reload in_data 0 32 } } }
	int_acc_m_45_load_reload { ap_none {  { int_acc_m_45_load_reload in_data 0 32 } } }
	int_acc_m_53_load_reload { ap_none {  { int_acc_m_53_load_reload in_data 0 32 } } }
	int_acc_m_61_load_reload { ap_none {  { int_acc_m_61_load_reload in_data 0 32 } } }
	int_acc_w_6_load_reload { ap_none {  { int_acc_w_6_load_reload in_data 0 32 } } }
	int_acc_w_14_load_reload { ap_none {  { int_acc_w_14_load_reload in_data 0 32 } } }
	int_acc_w_22_load_reload { ap_none {  { int_acc_w_22_load_reload in_data 0 32 } } }
	int_acc_w_30_load_reload { ap_none {  { int_acc_w_30_load_reload in_data 0 32 } } }
	int_acc_w_38_load_reload { ap_none {  { int_acc_w_38_load_reload in_data 0 32 } } }
	int_acc_w_46_load_reload { ap_none {  { int_acc_w_46_load_reload in_data 0 32 } } }
	int_acc_w_54_load_reload { ap_none {  { int_acc_w_54_load_reload in_data 0 32 } } }
	int_acc_w_62_load_reload { ap_none {  { int_acc_w_62_load_reload in_data 0 32 } } }
	int_acc_m_6_load_reload { ap_none {  { int_acc_m_6_load_reload in_data 0 32 } } }
	int_acc_m_14_load_reload { ap_none {  { int_acc_m_14_load_reload in_data 0 32 } } }
	int_acc_m_22_load_reload { ap_none {  { int_acc_m_22_load_reload in_data 0 32 } } }
	int_acc_m_30_load_reload { ap_none {  { int_acc_m_30_load_reload in_data 0 32 } } }
	int_acc_m_38_load_reload { ap_none {  { int_acc_m_38_load_reload in_data 0 32 } } }
	int_acc_m_46_load_reload { ap_none {  { int_acc_m_46_load_reload in_data 0 32 } } }
	int_acc_m_54_load_reload { ap_none {  { int_acc_m_54_load_reload in_data 0 32 } } }
	int_acc_m_62_load_reload { ap_none {  { int_acc_m_62_load_reload in_data 0 32 } } }
	int_acc_w_7_load_reload { ap_none {  { int_acc_w_7_load_reload in_data 0 32 } } }
	int_acc_w_15_load_reload { ap_none {  { int_acc_w_15_load_reload in_data 0 32 } } }
	int_acc_w_23_load_reload { ap_none {  { int_acc_w_23_load_reload in_data 0 32 } } }
	int_acc_w_31_load_reload { ap_none {  { int_acc_w_31_load_reload in_data 0 32 } } }
	int_acc_w_39_load_reload { ap_none {  { int_acc_w_39_load_reload in_data 0 32 } } }
	int_acc_w_47_load_reload { ap_none {  { int_acc_w_47_load_reload in_data 0 32 } } }
	int_acc_w_55_load_reload { ap_none {  { int_acc_w_55_load_reload in_data 0 32 } } }
	int_acc_w_63_load_reload { ap_none {  { int_acc_w_63_load_reload in_data 0 32 } } }
	int_acc_m_7_load_reload { ap_none {  { int_acc_m_7_load_reload in_data 0 32 } } }
	int_acc_m_15_load_reload { ap_none {  { int_acc_m_15_load_reload in_data 0 32 } } }
	int_acc_m_23_load_reload { ap_none {  { int_acc_m_23_load_reload in_data 0 32 } } }
	int_acc_m_31_load_reload { ap_none {  { int_acc_m_31_load_reload in_data 0 32 } } }
	int_acc_m_39_load_reload { ap_none {  { int_acc_m_39_load_reload in_data 0 32 } } }
	int_acc_m_47_load_reload { ap_none {  { int_acc_m_47_load_reload in_data 0 32 } } }
	int_acc_m_55_load_reload { ap_none {  { int_acc_m_55_load_reload in_data 0 32 } } }
	int_acc_m_63_load_reload { ap_none {  { int_acc_m_63_load_reload in_data 0 32 } } }
	mux_case_08251_reload { ap_none {  { mux_case_08251_reload in_data 0 32 } } }
	mux_case_18264_reload { ap_none {  { mux_case_18264_reload in_data 0 32 } } }
	mux_case_28277_reload { ap_none {  { mux_case_28277_reload in_data 0 32 } } }
	mux_case_382810_reload { ap_none {  { mux_case_382810_reload in_data 0 32 } } }
	mux_case_482913_reload { ap_none {  { mux_case_482913_reload in_data 0 32 } } }
	mux_case_583016_reload { ap_none {  { mux_case_583016_reload in_data 0 32 } } }
	mux_case_683119_reload { ap_none {  { mux_case_683119_reload in_data 0 32 } } }
	mux_case_783222_reload { ap_none {  { mux_case_783222_reload in_data 0 32 } } }
	mux_case_083326_reload { ap_none {  { mux_case_083326_reload in_data 0 32 } } }
	mux_case_183429_reload { ap_none {  { mux_case_183429_reload in_data 0 32 } } }
	mux_case_283532_reload { ap_none {  { mux_case_283532_reload in_data 0 32 } } }
	mux_case_383635_reload { ap_none {  { mux_case_383635_reload in_data 0 32 } } }
	mux_case_483738_reload { ap_none {  { mux_case_483738_reload in_data 0 32 } } }
	mux_case_583841_reload { ap_none {  { mux_case_583841_reload in_data 0 32 } } }
	mux_case_683944_reload { ap_none {  { mux_case_683944_reload in_data 0 32 } } }
	mux_case_784047_reload { ap_none {  { mux_case_784047_reload in_data 0 32 } } }
	total_out { ap_vld {  { total_out out_data 1 56 }  { total_out_ap_vld out_vld 1 1 } } }
}
