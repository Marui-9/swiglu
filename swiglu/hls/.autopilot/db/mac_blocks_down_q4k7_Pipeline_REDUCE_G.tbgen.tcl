set moduleName mac_blocks_down_q4k7_Pipeline_REDUCE_G
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
set C_modelName {mac_blocks_down_q4k7_Pipeline_REDUCE_G}
set C_modelType { void 0 }
set ap_memory_interface_dict [dict create]
set C_modelArgList {
	{ total int 56 regular  }
	{ add_i_i69_lcssa_phi int 90 regular  }
	{ tmp_229 int 5 regular  }
	{ acc_w_g_load_reload int 32 regular  }
	{ acc_w_g_8_load_reload int 32 regular  }
	{ acc_w_g_16_load_reload int 32 regular  }
	{ acc_w_g_24_load_reload int 32 regular  }
	{ acc_w_g_32_load_reload int 32 regular  }
	{ acc_w_g_40_load_reload int 32 regular  }
	{ acc_w_g_48_load_reload int 32 regular  }
	{ acc_w_g_56_load_reload int 32 regular  }
	{ acc_m_g_load_reload int 32 regular  }
	{ acc_m_g_8_load_reload int 32 regular  }
	{ acc_m_g_16_load_reload int 32 regular  }
	{ acc_m_g_24_load_reload int 32 regular  }
	{ acc_m_g_32_load_reload int 32 regular  }
	{ acc_m_g_40_load_reload int 32 regular  }
	{ acc_m_g_48_load_reload int 32 regular  }
	{ acc_m_g_56_load_reload int 32 regular  }
	{ acc_w_g_1_load_reload int 32 regular  }
	{ acc_w_g_9_load_reload int 32 regular  }
	{ acc_w_g_17_load_reload int 32 regular  }
	{ acc_w_g_25_load_reload int 32 regular  }
	{ acc_w_g_33_load_reload int 32 regular  }
	{ acc_w_g_41_load_reload int 32 regular  }
	{ acc_w_g_49_load_reload int 32 regular  }
	{ acc_w_g_57_load_reload int 32 regular  }
	{ acc_m_g_1_load_reload int 32 regular  }
	{ acc_m_g_9_load_reload int 32 regular  }
	{ acc_m_g_17_load_reload int 32 regular  }
	{ acc_m_g_25_load_reload int 32 regular  }
	{ acc_m_g_33_load_reload int 32 regular  }
	{ acc_m_g_41_load_reload int 32 regular  }
	{ acc_m_g_49_load_reload int 32 regular  }
	{ acc_m_g_57_load_reload int 32 regular  }
	{ acc_w_g_2_load_reload int 32 regular  }
	{ acc_w_g_10_load_reload int 32 regular  }
	{ acc_w_g_18_load_reload int 32 regular  }
	{ acc_w_g_26_load_reload int 32 regular  }
	{ acc_w_g_34_load_reload int 32 regular  }
	{ acc_w_g_42_load_reload int 32 regular  }
	{ acc_w_g_50_load_reload int 32 regular  }
	{ acc_w_g_58_load_reload int 32 regular  }
	{ acc_m_g_2_load_reload int 32 regular  }
	{ acc_m_g_10_load_reload int 32 regular  }
	{ acc_m_g_18_load_reload int 32 regular  }
	{ acc_m_g_26_load_reload int 32 regular  }
	{ acc_m_g_34_load_reload int 32 regular  }
	{ acc_m_g_42_load_reload int 32 regular  }
	{ acc_m_g_50_load_reload int 32 regular  }
	{ acc_m_g_58_load_reload int 32 regular  }
	{ acc_w_g_3_load_reload int 32 regular  }
	{ acc_w_g_11_load_reload int 32 regular  }
	{ acc_w_g_19_load_reload int 32 regular  }
	{ acc_w_g_27_load_reload int 32 regular  }
	{ acc_w_g_35_load_reload int 32 regular  }
	{ acc_w_g_43_load_reload int 32 regular  }
	{ acc_w_g_51_load_reload int 32 regular  }
	{ acc_w_g_59_load_reload int 32 regular  }
	{ acc_m_g_3_load_reload int 32 regular  }
	{ acc_m_g_11_load_reload int 32 regular  }
	{ acc_m_g_19_load_reload int 32 regular  }
	{ acc_m_g_27_load_reload int 32 regular  }
	{ acc_m_g_35_load_reload int 32 regular  }
	{ acc_m_g_43_load_reload int 32 regular  }
	{ acc_m_g_51_load_reload int 32 regular  }
	{ acc_m_g_59_load_reload int 32 regular  }
	{ acc_w_g_4_load_reload int 32 regular  }
	{ acc_w_g_12_load_reload int 32 regular  }
	{ acc_w_g_20_load_reload int 32 regular  }
	{ acc_w_g_28_load_reload int 32 regular  }
	{ acc_w_g_36_load_reload int 32 regular  }
	{ acc_w_g_44_load_reload int 32 regular  }
	{ acc_w_g_52_load_reload int 32 regular  }
	{ acc_w_g_60_load_reload int 32 regular  }
	{ acc_m_g_4_load_reload int 32 regular  }
	{ acc_m_g_12_load_reload int 32 regular  }
	{ acc_m_g_20_load_reload int 32 regular  }
	{ acc_m_g_28_load_reload int 32 regular  }
	{ acc_m_g_36_load_reload int 32 regular  }
	{ acc_m_g_44_load_reload int 32 regular  }
	{ acc_m_g_52_load_reload int 32 regular  }
	{ acc_m_g_60_load_reload int 32 regular  }
	{ acc_w_g_5_load_reload int 32 regular  }
	{ acc_w_g_13_load_reload int 32 regular  }
	{ acc_w_g_21_load_reload int 32 regular  }
	{ acc_w_g_29_load_reload int 32 regular  }
	{ acc_w_g_37_load_reload int 32 regular  }
	{ acc_w_g_45_load_reload int 32 regular  }
	{ acc_w_g_53_load_reload int 32 regular  }
	{ acc_w_g_61_load_reload int 32 regular  }
	{ acc_m_g_5_load_reload int 32 regular  }
	{ acc_m_g_13_load_reload int 32 regular  }
	{ acc_m_g_21_load_reload int 32 regular  }
	{ acc_m_g_29_load_reload int 32 regular  }
	{ acc_m_g_37_load_reload int 32 regular  }
	{ acc_m_g_45_load_reload int 32 regular  }
	{ acc_m_g_53_load_reload int 32 regular  }
	{ acc_m_g_61_load_reload int 32 regular  }
	{ acc_w_g_6_load_reload int 32 regular  }
	{ acc_w_g_14_load_reload int 32 regular  }
	{ acc_w_g_22_load_reload int 32 regular  }
	{ acc_w_g_30_load_reload int 32 regular  }
	{ acc_w_g_38_load_reload int 32 regular  }
	{ acc_w_g_46_load_reload int 32 regular  }
	{ acc_w_g_54_load_reload int 32 regular  }
	{ acc_w_g_62_load_reload int 32 regular  }
	{ acc_m_g_6_load_reload int 32 regular  }
	{ acc_m_g_14_load_reload int 32 regular  }
	{ acc_m_g_22_load_reload int 32 regular  }
	{ acc_m_g_30_load_reload int 32 regular  }
	{ acc_m_g_38_load_reload int 32 regular  }
	{ acc_m_g_46_load_reload int 32 regular  }
	{ acc_m_g_54_load_reload int 32 regular  }
	{ acc_m_g_62_load_reload int 32 regular  }
	{ acc_w_g_7_load_reload int 32 regular  }
	{ acc_w_g_15_load_reload int 32 regular  }
	{ acc_w_g_23_load_reload int 32 regular  }
	{ acc_w_g_31_load_reload int 32 regular  }
	{ acc_w_g_39_load_reload int 32 regular  }
	{ acc_w_g_47_load_reload int 32 regular  }
	{ acc_w_g_55_load_reload int 32 regular  }
	{ acc_w_g_63_load_reload int 32 regular  }
	{ acc_m_g_7_load_reload int 32 regular  }
	{ acc_m_g_15_load_reload int 32 regular  }
	{ acc_m_g_23_load_reload int 32 regular  }
	{ acc_m_g_31_load_reload int 32 regular  }
	{ acc_m_g_39_load_reload int 32 regular  }
	{ acc_m_g_47_load_reload int 32 regular  }
	{ acc_m_g_55_load_reload int 32 regular  }
	{ acc_m_g_63_load_reload int 32 regular  }
	{ d_reload float 32 regular  }
	{ d_1_reload float 32 regular  }
	{ d_2_reload float 32 regular  }
	{ d_3_reload float 32 regular  }
	{ d_4_reload float 32 regular  }
	{ d_5_reload float 32 regular  }
	{ d_6_reload float 32 regular  }
	{ d_7_reload float 32 regular  }
	{ d_8_reload float 32 regular  }
	{ d_9_reload float 32 regular  }
	{ d_10_reload float 32 regular  }
	{ d_11_reload float 32 regular  }
	{ d_12_reload float 32 regular  }
	{ d_13_reload float 32 regular  }
	{ d_14_reload float 32 regular  }
	{ d_15_reload float 32 regular  }
	{ d_16_reload float 32 regular  }
	{ d_17_reload float 32 regular  }
	{ d_18_reload float 32 regular  }
	{ d_19_reload float 32 regular  }
	{ d_20_reload float 32 regular  }
	{ d_21_reload float 32 regular  }
	{ d_22_reload float 32 regular  }
	{ d_23_reload float 32 regular  }
	{ d_24_reload float 32 regular  }
	{ d_25_reload float 32 regular  }
	{ d_26_reload float 32 regular  }
	{ d_27_reload float 32 regular  }
	{ d_28_reload float 32 regular  }
	{ d_29_reload float 32 regular  }
	{ d_30_reload float 32 regular  }
	{ d_31_reload float 32 regular  }
	{ dmin_reload float 32 regular  }
	{ dmin_1_reload float 32 regular  }
	{ dmin_2_reload float 32 regular  }
	{ dmin_3_reload float 32 regular  }
	{ dmin_4_reload float 32 regular  }
	{ dmin_5_reload float 32 regular  }
	{ dmin_6_reload float 32 regular  }
	{ dmin_7_reload float 32 regular  }
	{ dmin_8_reload float 32 regular  }
	{ dmin_9_reload float 32 regular  }
	{ dmin_10_reload float 32 regular  }
	{ dmin_11_reload float 32 regular  }
	{ dmin_12_reload float 32 regular  }
	{ dmin_13_reload float 32 regular  }
	{ dmin_14_reload float 32 regular  }
	{ dmin_15_reload float 32 regular  }
	{ dmin_16_reload float 32 regular  }
	{ dmin_17_reload float 32 regular  }
	{ dmin_18_reload float 32 regular  }
	{ dmin_19_reload float 32 regular  }
	{ dmin_20_reload float 32 regular  }
	{ dmin_21_reload float 32 regular  }
	{ dmin_22_reload float 32 regular  }
	{ dmin_23_reload float 32 regular  }
	{ dmin_24_reload float 32 regular  }
	{ dmin_25_reload float 32 regular  }
	{ dmin_26_reload float 32 regular  }
	{ dmin_27_reload float 32 regular  }
	{ dmin_28_reload float 32 regular  }
	{ dmin_29_reload float 32 regular  }
	{ dmin_30_reload float 32 regular  }
	{ dmin_31_reload float 32 regular  }
	{ add_i_i69_phi_out int 90 regular {pointer 1}  }
}
set hasAXIMCache 0
set l_AXIML2Cache [list]
set AXIMCacheInstDict [dict create]
set C_modelArgMapList {[ 
	{ "Name" : "total", "interface" : "wire", "bitwidth" : 56, "direction" : "READONLY"} , 
 	{ "Name" : "add_i_i69_lcssa_phi", "interface" : "wire", "bitwidth" : 90, "direction" : "READONLY"} , 
 	{ "Name" : "tmp_229", "interface" : "wire", "bitwidth" : 5, "direction" : "READONLY"} , 
 	{ "Name" : "acc_w_g_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_w_g_8_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_w_g_16_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_w_g_24_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_w_g_32_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_w_g_40_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_w_g_48_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_w_g_56_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_m_g_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_m_g_8_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_m_g_16_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_m_g_24_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_m_g_32_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_m_g_40_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_m_g_48_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_m_g_56_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_w_g_1_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_w_g_9_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_w_g_17_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_w_g_25_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_w_g_33_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_w_g_41_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_w_g_49_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_w_g_57_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_m_g_1_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_m_g_9_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_m_g_17_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_m_g_25_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_m_g_33_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_m_g_41_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_m_g_49_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_m_g_57_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_w_g_2_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_w_g_10_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_w_g_18_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_w_g_26_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_w_g_34_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_w_g_42_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_w_g_50_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_w_g_58_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_m_g_2_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_m_g_10_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_m_g_18_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_m_g_26_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_m_g_34_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_m_g_42_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_m_g_50_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_m_g_58_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_w_g_3_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_w_g_11_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_w_g_19_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_w_g_27_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_w_g_35_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_w_g_43_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_w_g_51_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_w_g_59_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_m_g_3_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_m_g_11_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_m_g_19_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_m_g_27_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_m_g_35_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_m_g_43_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_m_g_51_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_m_g_59_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_w_g_4_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_w_g_12_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_w_g_20_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_w_g_28_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_w_g_36_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_w_g_44_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_w_g_52_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_w_g_60_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_m_g_4_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_m_g_12_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_m_g_20_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_m_g_28_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_m_g_36_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_m_g_44_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_m_g_52_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_m_g_60_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_w_g_5_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_w_g_13_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_w_g_21_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_w_g_29_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_w_g_37_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_w_g_45_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_w_g_53_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_w_g_61_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_m_g_5_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_m_g_13_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_m_g_21_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_m_g_29_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_m_g_37_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_m_g_45_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_m_g_53_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_m_g_61_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_w_g_6_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_w_g_14_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_w_g_22_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_w_g_30_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_w_g_38_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_w_g_46_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_w_g_54_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_w_g_62_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_m_g_6_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_m_g_14_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_m_g_22_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_m_g_30_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_m_g_38_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_m_g_46_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_m_g_54_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_m_g_62_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_w_g_7_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_w_g_15_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_w_g_23_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_w_g_31_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_w_g_39_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_w_g_47_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_w_g_55_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_w_g_63_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_m_g_7_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_m_g_15_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_m_g_23_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_m_g_31_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_m_g_39_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_m_g_47_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_m_g_55_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acc_m_g_63_load_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "d_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "d_1_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "d_2_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "d_3_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "d_4_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "d_5_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "d_6_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "d_7_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "d_8_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "d_9_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "d_10_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "d_11_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "d_12_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "d_13_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "d_14_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "d_15_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "d_16_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "d_17_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "d_18_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "d_19_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "d_20_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "d_21_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "d_22_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "d_23_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "d_24_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "d_25_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "d_26_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "d_27_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "d_28_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "d_29_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "d_30_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "d_31_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "dmin_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "dmin_1_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "dmin_2_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "dmin_3_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "dmin_4_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "dmin_5_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "dmin_6_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "dmin_7_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "dmin_8_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "dmin_9_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "dmin_10_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "dmin_11_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "dmin_12_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "dmin_13_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "dmin_14_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "dmin_15_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "dmin_16_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "dmin_17_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "dmin_18_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "dmin_19_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "dmin_20_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "dmin_21_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "dmin_22_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "dmin_23_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "dmin_24_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "dmin_25_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "dmin_26_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "dmin_27_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "dmin_28_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "dmin_29_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "dmin_30_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "dmin_31_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "add_i_i69_phi_out", "interface" : "wire", "bitwidth" : 90, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 203
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ total sc_in sc_lv 56 signal 0 } 
	{ add_i_i69_lcssa_phi sc_in sc_lv 90 signal 1 } 
	{ tmp_229 sc_in sc_lv 5 signal 2 } 
	{ acc_w_g_load_reload sc_in sc_lv 32 signal 3 } 
	{ acc_w_g_8_load_reload sc_in sc_lv 32 signal 4 } 
	{ acc_w_g_16_load_reload sc_in sc_lv 32 signal 5 } 
	{ acc_w_g_24_load_reload sc_in sc_lv 32 signal 6 } 
	{ acc_w_g_32_load_reload sc_in sc_lv 32 signal 7 } 
	{ acc_w_g_40_load_reload sc_in sc_lv 32 signal 8 } 
	{ acc_w_g_48_load_reload sc_in sc_lv 32 signal 9 } 
	{ acc_w_g_56_load_reload sc_in sc_lv 32 signal 10 } 
	{ acc_m_g_load_reload sc_in sc_lv 32 signal 11 } 
	{ acc_m_g_8_load_reload sc_in sc_lv 32 signal 12 } 
	{ acc_m_g_16_load_reload sc_in sc_lv 32 signal 13 } 
	{ acc_m_g_24_load_reload sc_in sc_lv 32 signal 14 } 
	{ acc_m_g_32_load_reload sc_in sc_lv 32 signal 15 } 
	{ acc_m_g_40_load_reload sc_in sc_lv 32 signal 16 } 
	{ acc_m_g_48_load_reload sc_in sc_lv 32 signal 17 } 
	{ acc_m_g_56_load_reload sc_in sc_lv 32 signal 18 } 
	{ acc_w_g_1_load_reload sc_in sc_lv 32 signal 19 } 
	{ acc_w_g_9_load_reload sc_in sc_lv 32 signal 20 } 
	{ acc_w_g_17_load_reload sc_in sc_lv 32 signal 21 } 
	{ acc_w_g_25_load_reload sc_in sc_lv 32 signal 22 } 
	{ acc_w_g_33_load_reload sc_in sc_lv 32 signal 23 } 
	{ acc_w_g_41_load_reload sc_in sc_lv 32 signal 24 } 
	{ acc_w_g_49_load_reload sc_in sc_lv 32 signal 25 } 
	{ acc_w_g_57_load_reload sc_in sc_lv 32 signal 26 } 
	{ acc_m_g_1_load_reload sc_in sc_lv 32 signal 27 } 
	{ acc_m_g_9_load_reload sc_in sc_lv 32 signal 28 } 
	{ acc_m_g_17_load_reload sc_in sc_lv 32 signal 29 } 
	{ acc_m_g_25_load_reload sc_in sc_lv 32 signal 30 } 
	{ acc_m_g_33_load_reload sc_in sc_lv 32 signal 31 } 
	{ acc_m_g_41_load_reload sc_in sc_lv 32 signal 32 } 
	{ acc_m_g_49_load_reload sc_in sc_lv 32 signal 33 } 
	{ acc_m_g_57_load_reload sc_in sc_lv 32 signal 34 } 
	{ acc_w_g_2_load_reload sc_in sc_lv 32 signal 35 } 
	{ acc_w_g_10_load_reload sc_in sc_lv 32 signal 36 } 
	{ acc_w_g_18_load_reload sc_in sc_lv 32 signal 37 } 
	{ acc_w_g_26_load_reload sc_in sc_lv 32 signal 38 } 
	{ acc_w_g_34_load_reload sc_in sc_lv 32 signal 39 } 
	{ acc_w_g_42_load_reload sc_in sc_lv 32 signal 40 } 
	{ acc_w_g_50_load_reload sc_in sc_lv 32 signal 41 } 
	{ acc_w_g_58_load_reload sc_in sc_lv 32 signal 42 } 
	{ acc_m_g_2_load_reload sc_in sc_lv 32 signal 43 } 
	{ acc_m_g_10_load_reload sc_in sc_lv 32 signal 44 } 
	{ acc_m_g_18_load_reload sc_in sc_lv 32 signal 45 } 
	{ acc_m_g_26_load_reload sc_in sc_lv 32 signal 46 } 
	{ acc_m_g_34_load_reload sc_in sc_lv 32 signal 47 } 
	{ acc_m_g_42_load_reload sc_in sc_lv 32 signal 48 } 
	{ acc_m_g_50_load_reload sc_in sc_lv 32 signal 49 } 
	{ acc_m_g_58_load_reload sc_in sc_lv 32 signal 50 } 
	{ acc_w_g_3_load_reload sc_in sc_lv 32 signal 51 } 
	{ acc_w_g_11_load_reload sc_in sc_lv 32 signal 52 } 
	{ acc_w_g_19_load_reload sc_in sc_lv 32 signal 53 } 
	{ acc_w_g_27_load_reload sc_in sc_lv 32 signal 54 } 
	{ acc_w_g_35_load_reload sc_in sc_lv 32 signal 55 } 
	{ acc_w_g_43_load_reload sc_in sc_lv 32 signal 56 } 
	{ acc_w_g_51_load_reload sc_in sc_lv 32 signal 57 } 
	{ acc_w_g_59_load_reload sc_in sc_lv 32 signal 58 } 
	{ acc_m_g_3_load_reload sc_in sc_lv 32 signal 59 } 
	{ acc_m_g_11_load_reload sc_in sc_lv 32 signal 60 } 
	{ acc_m_g_19_load_reload sc_in sc_lv 32 signal 61 } 
	{ acc_m_g_27_load_reload sc_in sc_lv 32 signal 62 } 
	{ acc_m_g_35_load_reload sc_in sc_lv 32 signal 63 } 
	{ acc_m_g_43_load_reload sc_in sc_lv 32 signal 64 } 
	{ acc_m_g_51_load_reload sc_in sc_lv 32 signal 65 } 
	{ acc_m_g_59_load_reload sc_in sc_lv 32 signal 66 } 
	{ acc_w_g_4_load_reload sc_in sc_lv 32 signal 67 } 
	{ acc_w_g_12_load_reload sc_in sc_lv 32 signal 68 } 
	{ acc_w_g_20_load_reload sc_in sc_lv 32 signal 69 } 
	{ acc_w_g_28_load_reload sc_in sc_lv 32 signal 70 } 
	{ acc_w_g_36_load_reload sc_in sc_lv 32 signal 71 } 
	{ acc_w_g_44_load_reload sc_in sc_lv 32 signal 72 } 
	{ acc_w_g_52_load_reload sc_in sc_lv 32 signal 73 } 
	{ acc_w_g_60_load_reload sc_in sc_lv 32 signal 74 } 
	{ acc_m_g_4_load_reload sc_in sc_lv 32 signal 75 } 
	{ acc_m_g_12_load_reload sc_in sc_lv 32 signal 76 } 
	{ acc_m_g_20_load_reload sc_in sc_lv 32 signal 77 } 
	{ acc_m_g_28_load_reload sc_in sc_lv 32 signal 78 } 
	{ acc_m_g_36_load_reload sc_in sc_lv 32 signal 79 } 
	{ acc_m_g_44_load_reload sc_in sc_lv 32 signal 80 } 
	{ acc_m_g_52_load_reload sc_in sc_lv 32 signal 81 } 
	{ acc_m_g_60_load_reload sc_in sc_lv 32 signal 82 } 
	{ acc_w_g_5_load_reload sc_in sc_lv 32 signal 83 } 
	{ acc_w_g_13_load_reload sc_in sc_lv 32 signal 84 } 
	{ acc_w_g_21_load_reload sc_in sc_lv 32 signal 85 } 
	{ acc_w_g_29_load_reload sc_in sc_lv 32 signal 86 } 
	{ acc_w_g_37_load_reload sc_in sc_lv 32 signal 87 } 
	{ acc_w_g_45_load_reload sc_in sc_lv 32 signal 88 } 
	{ acc_w_g_53_load_reload sc_in sc_lv 32 signal 89 } 
	{ acc_w_g_61_load_reload sc_in sc_lv 32 signal 90 } 
	{ acc_m_g_5_load_reload sc_in sc_lv 32 signal 91 } 
	{ acc_m_g_13_load_reload sc_in sc_lv 32 signal 92 } 
	{ acc_m_g_21_load_reload sc_in sc_lv 32 signal 93 } 
	{ acc_m_g_29_load_reload sc_in sc_lv 32 signal 94 } 
	{ acc_m_g_37_load_reload sc_in sc_lv 32 signal 95 } 
	{ acc_m_g_45_load_reload sc_in sc_lv 32 signal 96 } 
	{ acc_m_g_53_load_reload sc_in sc_lv 32 signal 97 } 
	{ acc_m_g_61_load_reload sc_in sc_lv 32 signal 98 } 
	{ acc_w_g_6_load_reload sc_in sc_lv 32 signal 99 } 
	{ acc_w_g_14_load_reload sc_in sc_lv 32 signal 100 } 
	{ acc_w_g_22_load_reload sc_in sc_lv 32 signal 101 } 
	{ acc_w_g_30_load_reload sc_in sc_lv 32 signal 102 } 
	{ acc_w_g_38_load_reload sc_in sc_lv 32 signal 103 } 
	{ acc_w_g_46_load_reload sc_in sc_lv 32 signal 104 } 
	{ acc_w_g_54_load_reload sc_in sc_lv 32 signal 105 } 
	{ acc_w_g_62_load_reload sc_in sc_lv 32 signal 106 } 
	{ acc_m_g_6_load_reload sc_in sc_lv 32 signal 107 } 
	{ acc_m_g_14_load_reload sc_in sc_lv 32 signal 108 } 
	{ acc_m_g_22_load_reload sc_in sc_lv 32 signal 109 } 
	{ acc_m_g_30_load_reload sc_in sc_lv 32 signal 110 } 
	{ acc_m_g_38_load_reload sc_in sc_lv 32 signal 111 } 
	{ acc_m_g_46_load_reload sc_in sc_lv 32 signal 112 } 
	{ acc_m_g_54_load_reload sc_in sc_lv 32 signal 113 } 
	{ acc_m_g_62_load_reload sc_in sc_lv 32 signal 114 } 
	{ acc_w_g_7_load_reload sc_in sc_lv 32 signal 115 } 
	{ acc_w_g_15_load_reload sc_in sc_lv 32 signal 116 } 
	{ acc_w_g_23_load_reload sc_in sc_lv 32 signal 117 } 
	{ acc_w_g_31_load_reload sc_in sc_lv 32 signal 118 } 
	{ acc_w_g_39_load_reload sc_in sc_lv 32 signal 119 } 
	{ acc_w_g_47_load_reload sc_in sc_lv 32 signal 120 } 
	{ acc_w_g_55_load_reload sc_in sc_lv 32 signal 121 } 
	{ acc_w_g_63_load_reload sc_in sc_lv 32 signal 122 } 
	{ acc_m_g_7_load_reload sc_in sc_lv 32 signal 123 } 
	{ acc_m_g_15_load_reload sc_in sc_lv 32 signal 124 } 
	{ acc_m_g_23_load_reload sc_in sc_lv 32 signal 125 } 
	{ acc_m_g_31_load_reload sc_in sc_lv 32 signal 126 } 
	{ acc_m_g_39_load_reload sc_in sc_lv 32 signal 127 } 
	{ acc_m_g_47_load_reload sc_in sc_lv 32 signal 128 } 
	{ acc_m_g_55_load_reload sc_in sc_lv 32 signal 129 } 
	{ acc_m_g_63_load_reload sc_in sc_lv 32 signal 130 } 
	{ d_reload sc_in sc_lv 32 signal 131 } 
	{ d_1_reload sc_in sc_lv 32 signal 132 } 
	{ d_2_reload sc_in sc_lv 32 signal 133 } 
	{ d_3_reload sc_in sc_lv 32 signal 134 } 
	{ d_4_reload sc_in sc_lv 32 signal 135 } 
	{ d_5_reload sc_in sc_lv 32 signal 136 } 
	{ d_6_reload sc_in sc_lv 32 signal 137 } 
	{ d_7_reload sc_in sc_lv 32 signal 138 } 
	{ d_8_reload sc_in sc_lv 32 signal 139 } 
	{ d_9_reload sc_in sc_lv 32 signal 140 } 
	{ d_10_reload sc_in sc_lv 32 signal 141 } 
	{ d_11_reload sc_in sc_lv 32 signal 142 } 
	{ d_12_reload sc_in sc_lv 32 signal 143 } 
	{ d_13_reload sc_in sc_lv 32 signal 144 } 
	{ d_14_reload sc_in sc_lv 32 signal 145 } 
	{ d_15_reload sc_in sc_lv 32 signal 146 } 
	{ d_16_reload sc_in sc_lv 32 signal 147 } 
	{ d_17_reload sc_in sc_lv 32 signal 148 } 
	{ d_18_reload sc_in sc_lv 32 signal 149 } 
	{ d_19_reload sc_in sc_lv 32 signal 150 } 
	{ d_20_reload sc_in sc_lv 32 signal 151 } 
	{ d_21_reload sc_in sc_lv 32 signal 152 } 
	{ d_22_reload sc_in sc_lv 32 signal 153 } 
	{ d_23_reload sc_in sc_lv 32 signal 154 } 
	{ d_24_reload sc_in sc_lv 32 signal 155 } 
	{ d_25_reload sc_in sc_lv 32 signal 156 } 
	{ d_26_reload sc_in sc_lv 32 signal 157 } 
	{ d_27_reload sc_in sc_lv 32 signal 158 } 
	{ d_28_reload sc_in sc_lv 32 signal 159 } 
	{ d_29_reload sc_in sc_lv 32 signal 160 } 
	{ d_30_reload sc_in sc_lv 32 signal 161 } 
	{ d_31_reload sc_in sc_lv 32 signal 162 } 
	{ dmin_reload sc_in sc_lv 32 signal 163 } 
	{ dmin_1_reload sc_in sc_lv 32 signal 164 } 
	{ dmin_2_reload sc_in sc_lv 32 signal 165 } 
	{ dmin_3_reload sc_in sc_lv 32 signal 166 } 
	{ dmin_4_reload sc_in sc_lv 32 signal 167 } 
	{ dmin_5_reload sc_in sc_lv 32 signal 168 } 
	{ dmin_6_reload sc_in sc_lv 32 signal 169 } 
	{ dmin_7_reload sc_in sc_lv 32 signal 170 } 
	{ dmin_8_reload sc_in sc_lv 32 signal 171 } 
	{ dmin_9_reload sc_in sc_lv 32 signal 172 } 
	{ dmin_10_reload sc_in sc_lv 32 signal 173 } 
	{ dmin_11_reload sc_in sc_lv 32 signal 174 } 
	{ dmin_12_reload sc_in sc_lv 32 signal 175 } 
	{ dmin_13_reload sc_in sc_lv 32 signal 176 } 
	{ dmin_14_reload sc_in sc_lv 32 signal 177 } 
	{ dmin_15_reload sc_in sc_lv 32 signal 178 } 
	{ dmin_16_reload sc_in sc_lv 32 signal 179 } 
	{ dmin_17_reload sc_in sc_lv 32 signal 180 } 
	{ dmin_18_reload sc_in sc_lv 32 signal 181 } 
	{ dmin_19_reload sc_in sc_lv 32 signal 182 } 
	{ dmin_20_reload sc_in sc_lv 32 signal 183 } 
	{ dmin_21_reload sc_in sc_lv 32 signal 184 } 
	{ dmin_22_reload sc_in sc_lv 32 signal 185 } 
	{ dmin_23_reload sc_in sc_lv 32 signal 186 } 
	{ dmin_24_reload sc_in sc_lv 32 signal 187 } 
	{ dmin_25_reload sc_in sc_lv 32 signal 188 } 
	{ dmin_26_reload sc_in sc_lv 32 signal 189 } 
	{ dmin_27_reload sc_in sc_lv 32 signal 190 } 
	{ dmin_28_reload sc_in sc_lv 32 signal 191 } 
	{ dmin_29_reload sc_in sc_lv 32 signal 192 } 
	{ dmin_30_reload sc_in sc_lv 32 signal 193 } 
	{ dmin_31_reload sc_in sc_lv 32 signal 194 } 
	{ add_i_i69_phi_out sc_out sc_lv 90 signal 195 } 
	{ add_i_i69_phi_out_ap_vld sc_out sc_logic 1 outvld 195 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "total", "direction": "in", "datatype": "sc_lv", "bitwidth":56, "type": "signal", "bundle":{"name": "total", "role": "default" }} , 
 	{ "name": "add_i_i69_lcssa_phi", "direction": "in", "datatype": "sc_lv", "bitwidth":90, "type": "signal", "bundle":{"name": "add_i_i69_lcssa_phi", "role": "default" }} , 
 	{ "name": "tmp_229", "direction": "in", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "tmp_229", "role": "default" }} , 
 	{ "name": "acc_w_g_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_w_g_load_reload", "role": "default" }} , 
 	{ "name": "acc_w_g_8_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_w_g_8_load_reload", "role": "default" }} , 
 	{ "name": "acc_w_g_16_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_w_g_16_load_reload", "role": "default" }} , 
 	{ "name": "acc_w_g_24_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_w_g_24_load_reload", "role": "default" }} , 
 	{ "name": "acc_w_g_32_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_w_g_32_load_reload", "role": "default" }} , 
 	{ "name": "acc_w_g_40_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_w_g_40_load_reload", "role": "default" }} , 
 	{ "name": "acc_w_g_48_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_w_g_48_load_reload", "role": "default" }} , 
 	{ "name": "acc_w_g_56_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_w_g_56_load_reload", "role": "default" }} , 
 	{ "name": "acc_m_g_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_m_g_load_reload", "role": "default" }} , 
 	{ "name": "acc_m_g_8_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_m_g_8_load_reload", "role": "default" }} , 
 	{ "name": "acc_m_g_16_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_m_g_16_load_reload", "role": "default" }} , 
 	{ "name": "acc_m_g_24_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_m_g_24_load_reload", "role": "default" }} , 
 	{ "name": "acc_m_g_32_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_m_g_32_load_reload", "role": "default" }} , 
 	{ "name": "acc_m_g_40_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_m_g_40_load_reload", "role": "default" }} , 
 	{ "name": "acc_m_g_48_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_m_g_48_load_reload", "role": "default" }} , 
 	{ "name": "acc_m_g_56_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_m_g_56_load_reload", "role": "default" }} , 
 	{ "name": "acc_w_g_1_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_w_g_1_load_reload", "role": "default" }} , 
 	{ "name": "acc_w_g_9_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_w_g_9_load_reload", "role": "default" }} , 
 	{ "name": "acc_w_g_17_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_w_g_17_load_reload", "role": "default" }} , 
 	{ "name": "acc_w_g_25_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_w_g_25_load_reload", "role": "default" }} , 
 	{ "name": "acc_w_g_33_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_w_g_33_load_reload", "role": "default" }} , 
 	{ "name": "acc_w_g_41_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_w_g_41_load_reload", "role": "default" }} , 
 	{ "name": "acc_w_g_49_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_w_g_49_load_reload", "role": "default" }} , 
 	{ "name": "acc_w_g_57_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_w_g_57_load_reload", "role": "default" }} , 
 	{ "name": "acc_m_g_1_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_m_g_1_load_reload", "role": "default" }} , 
 	{ "name": "acc_m_g_9_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_m_g_9_load_reload", "role": "default" }} , 
 	{ "name": "acc_m_g_17_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_m_g_17_load_reload", "role": "default" }} , 
 	{ "name": "acc_m_g_25_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_m_g_25_load_reload", "role": "default" }} , 
 	{ "name": "acc_m_g_33_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_m_g_33_load_reload", "role": "default" }} , 
 	{ "name": "acc_m_g_41_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_m_g_41_load_reload", "role": "default" }} , 
 	{ "name": "acc_m_g_49_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_m_g_49_load_reload", "role": "default" }} , 
 	{ "name": "acc_m_g_57_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_m_g_57_load_reload", "role": "default" }} , 
 	{ "name": "acc_w_g_2_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_w_g_2_load_reload", "role": "default" }} , 
 	{ "name": "acc_w_g_10_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_w_g_10_load_reload", "role": "default" }} , 
 	{ "name": "acc_w_g_18_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_w_g_18_load_reload", "role": "default" }} , 
 	{ "name": "acc_w_g_26_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_w_g_26_load_reload", "role": "default" }} , 
 	{ "name": "acc_w_g_34_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_w_g_34_load_reload", "role": "default" }} , 
 	{ "name": "acc_w_g_42_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_w_g_42_load_reload", "role": "default" }} , 
 	{ "name": "acc_w_g_50_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_w_g_50_load_reload", "role": "default" }} , 
 	{ "name": "acc_w_g_58_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_w_g_58_load_reload", "role": "default" }} , 
 	{ "name": "acc_m_g_2_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_m_g_2_load_reload", "role": "default" }} , 
 	{ "name": "acc_m_g_10_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_m_g_10_load_reload", "role": "default" }} , 
 	{ "name": "acc_m_g_18_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_m_g_18_load_reload", "role": "default" }} , 
 	{ "name": "acc_m_g_26_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_m_g_26_load_reload", "role": "default" }} , 
 	{ "name": "acc_m_g_34_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_m_g_34_load_reload", "role": "default" }} , 
 	{ "name": "acc_m_g_42_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_m_g_42_load_reload", "role": "default" }} , 
 	{ "name": "acc_m_g_50_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_m_g_50_load_reload", "role": "default" }} , 
 	{ "name": "acc_m_g_58_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_m_g_58_load_reload", "role": "default" }} , 
 	{ "name": "acc_w_g_3_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_w_g_3_load_reload", "role": "default" }} , 
 	{ "name": "acc_w_g_11_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_w_g_11_load_reload", "role": "default" }} , 
 	{ "name": "acc_w_g_19_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_w_g_19_load_reload", "role": "default" }} , 
 	{ "name": "acc_w_g_27_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_w_g_27_load_reload", "role": "default" }} , 
 	{ "name": "acc_w_g_35_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_w_g_35_load_reload", "role": "default" }} , 
 	{ "name": "acc_w_g_43_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_w_g_43_load_reload", "role": "default" }} , 
 	{ "name": "acc_w_g_51_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_w_g_51_load_reload", "role": "default" }} , 
 	{ "name": "acc_w_g_59_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_w_g_59_load_reload", "role": "default" }} , 
 	{ "name": "acc_m_g_3_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_m_g_3_load_reload", "role": "default" }} , 
 	{ "name": "acc_m_g_11_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_m_g_11_load_reload", "role": "default" }} , 
 	{ "name": "acc_m_g_19_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_m_g_19_load_reload", "role": "default" }} , 
 	{ "name": "acc_m_g_27_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_m_g_27_load_reload", "role": "default" }} , 
 	{ "name": "acc_m_g_35_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_m_g_35_load_reload", "role": "default" }} , 
 	{ "name": "acc_m_g_43_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_m_g_43_load_reload", "role": "default" }} , 
 	{ "name": "acc_m_g_51_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_m_g_51_load_reload", "role": "default" }} , 
 	{ "name": "acc_m_g_59_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_m_g_59_load_reload", "role": "default" }} , 
 	{ "name": "acc_w_g_4_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_w_g_4_load_reload", "role": "default" }} , 
 	{ "name": "acc_w_g_12_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_w_g_12_load_reload", "role": "default" }} , 
 	{ "name": "acc_w_g_20_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_w_g_20_load_reload", "role": "default" }} , 
 	{ "name": "acc_w_g_28_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_w_g_28_load_reload", "role": "default" }} , 
 	{ "name": "acc_w_g_36_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_w_g_36_load_reload", "role": "default" }} , 
 	{ "name": "acc_w_g_44_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_w_g_44_load_reload", "role": "default" }} , 
 	{ "name": "acc_w_g_52_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_w_g_52_load_reload", "role": "default" }} , 
 	{ "name": "acc_w_g_60_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_w_g_60_load_reload", "role": "default" }} , 
 	{ "name": "acc_m_g_4_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_m_g_4_load_reload", "role": "default" }} , 
 	{ "name": "acc_m_g_12_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_m_g_12_load_reload", "role": "default" }} , 
 	{ "name": "acc_m_g_20_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_m_g_20_load_reload", "role": "default" }} , 
 	{ "name": "acc_m_g_28_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_m_g_28_load_reload", "role": "default" }} , 
 	{ "name": "acc_m_g_36_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_m_g_36_load_reload", "role": "default" }} , 
 	{ "name": "acc_m_g_44_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_m_g_44_load_reload", "role": "default" }} , 
 	{ "name": "acc_m_g_52_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_m_g_52_load_reload", "role": "default" }} , 
 	{ "name": "acc_m_g_60_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_m_g_60_load_reload", "role": "default" }} , 
 	{ "name": "acc_w_g_5_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_w_g_5_load_reload", "role": "default" }} , 
 	{ "name": "acc_w_g_13_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_w_g_13_load_reload", "role": "default" }} , 
 	{ "name": "acc_w_g_21_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_w_g_21_load_reload", "role": "default" }} , 
 	{ "name": "acc_w_g_29_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_w_g_29_load_reload", "role": "default" }} , 
 	{ "name": "acc_w_g_37_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_w_g_37_load_reload", "role": "default" }} , 
 	{ "name": "acc_w_g_45_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_w_g_45_load_reload", "role": "default" }} , 
 	{ "name": "acc_w_g_53_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_w_g_53_load_reload", "role": "default" }} , 
 	{ "name": "acc_w_g_61_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_w_g_61_load_reload", "role": "default" }} , 
 	{ "name": "acc_m_g_5_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_m_g_5_load_reload", "role": "default" }} , 
 	{ "name": "acc_m_g_13_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_m_g_13_load_reload", "role": "default" }} , 
 	{ "name": "acc_m_g_21_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_m_g_21_load_reload", "role": "default" }} , 
 	{ "name": "acc_m_g_29_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_m_g_29_load_reload", "role": "default" }} , 
 	{ "name": "acc_m_g_37_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_m_g_37_load_reload", "role": "default" }} , 
 	{ "name": "acc_m_g_45_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_m_g_45_load_reload", "role": "default" }} , 
 	{ "name": "acc_m_g_53_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_m_g_53_load_reload", "role": "default" }} , 
 	{ "name": "acc_m_g_61_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_m_g_61_load_reload", "role": "default" }} , 
 	{ "name": "acc_w_g_6_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_w_g_6_load_reload", "role": "default" }} , 
 	{ "name": "acc_w_g_14_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_w_g_14_load_reload", "role": "default" }} , 
 	{ "name": "acc_w_g_22_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_w_g_22_load_reload", "role": "default" }} , 
 	{ "name": "acc_w_g_30_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_w_g_30_load_reload", "role": "default" }} , 
 	{ "name": "acc_w_g_38_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_w_g_38_load_reload", "role": "default" }} , 
 	{ "name": "acc_w_g_46_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_w_g_46_load_reload", "role": "default" }} , 
 	{ "name": "acc_w_g_54_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_w_g_54_load_reload", "role": "default" }} , 
 	{ "name": "acc_w_g_62_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_w_g_62_load_reload", "role": "default" }} , 
 	{ "name": "acc_m_g_6_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_m_g_6_load_reload", "role": "default" }} , 
 	{ "name": "acc_m_g_14_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_m_g_14_load_reload", "role": "default" }} , 
 	{ "name": "acc_m_g_22_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_m_g_22_load_reload", "role": "default" }} , 
 	{ "name": "acc_m_g_30_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_m_g_30_load_reload", "role": "default" }} , 
 	{ "name": "acc_m_g_38_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_m_g_38_load_reload", "role": "default" }} , 
 	{ "name": "acc_m_g_46_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_m_g_46_load_reload", "role": "default" }} , 
 	{ "name": "acc_m_g_54_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_m_g_54_load_reload", "role": "default" }} , 
 	{ "name": "acc_m_g_62_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_m_g_62_load_reload", "role": "default" }} , 
 	{ "name": "acc_w_g_7_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_w_g_7_load_reload", "role": "default" }} , 
 	{ "name": "acc_w_g_15_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_w_g_15_load_reload", "role": "default" }} , 
 	{ "name": "acc_w_g_23_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_w_g_23_load_reload", "role": "default" }} , 
 	{ "name": "acc_w_g_31_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_w_g_31_load_reload", "role": "default" }} , 
 	{ "name": "acc_w_g_39_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_w_g_39_load_reload", "role": "default" }} , 
 	{ "name": "acc_w_g_47_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_w_g_47_load_reload", "role": "default" }} , 
 	{ "name": "acc_w_g_55_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_w_g_55_load_reload", "role": "default" }} , 
 	{ "name": "acc_w_g_63_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_w_g_63_load_reload", "role": "default" }} , 
 	{ "name": "acc_m_g_7_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_m_g_7_load_reload", "role": "default" }} , 
 	{ "name": "acc_m_g_15_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_m_g_15_load_reload", "role": "default" }} , 
 	{ "name": "acc_m_g_23_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_m_g_23_load_reload", "role": "default" }} , 
 	{ "name": "acc_m_g_31_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_m_g_31_load_reload", "role": "default" }} , 
 	{ "name": "acc_m_g_39_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_m_g_39_load_reload", "role": "default" }} , 
 	{ "name": "acc_m_g_47_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_m_g_47_load_reload", "role": "default" }} , 
 	{ "name": "acc_m_g_55_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_m_g_55_load_reload", "role": "default" }} , 
 	{ "name": "acc_m_g_63_load_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_m_g_63_load_reload", "role": "default" }} , 
 	{ "name": "d_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "d_reload", "role": "default" }} , 
 	{ "name": "d_1_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "d_1_reload", "role": "default" }} , 
 	{ "name": "d_2_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "d_2_reload", "role": "default" }} , 
 	{ "name": "d_3_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "d_3_reload", "role": "default" }} , 
 	{ "name": "d_4_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "d_4_reload", "role": "default" }} , 
 	{ "name": "d_5_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "d_5_reload", "role": "default" }} , 
 	{ "name": "d_6_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "d_6_reload", "role": "default" }} , 
 	{ "name": "d_7_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "d_7_reload", "role": "default" }} , 
 	{ "name": "d_8_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "d_8_reload", "role": "default" }} , 
 	{ "name": "d_9_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "d_9_reload", "role": "default" }} , 
 	{ "name": "d_10_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "d_10_reload", "role": "default" }} , 
 	{ "name": "d_11_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "d_11_reload", "role": "default" }} , 
 	{ "name": "d_12_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "d_12_reload", "role": "default" }} , 
 	{ "name": "d_13_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "d_13_reload", "role": "default" }} , 
 	{ "name": "d_14_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "d_14_reload", "role": "default" }} , 
 	{ "name": "d_15_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "d_15_reload", "role": "default" }} , 
 	{ "name": "d_16_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "d_16_reload", "role": "default" }} , 
 	{ "name": "d_17_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "d_17_reload", "role": "default" }} , 
 	{ "name": "d_18_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "d_18_reload", "role": "default" }} , 
 	{ "name": "d_19_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "d_19_reload", "role": "default" }} , 
 	{ "name": "d_20_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "d_20_reload", "role": "default" }} , 
 	{ "name": "d_21_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "d_21_reload", "role": "default" }} , 
 	{ "name": "d_22_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "d_22_reload", "role": "default" }} , 
 	{ "name": "d_23_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "d_23_reload", "role": "default" }} , 
 	{ "name": "d_24_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "d_24_reload", "role": "default" }} , 
 	{ "name": "d_25_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "d_25_reload", "role": "default" }} , 
 	{ "name": "d_26_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "d_26_reload", "role": "default" }} , 
 	{ "name": "d_27_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "d_27_reload", "role": "default" }} , 
 	{ "name": "d_28_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "d_28_reload", "role": "default" }} , 
 	{ "name": "d_29_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "d_29_reload", "role": "default" }} , 
 	{ "name": "d_30_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "d_30_reload", "role": "default" }} , 
 	{ "name": "d_31_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "d_31_reload", "role": "default" }} , 
 	{ "name": "dmin_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "dmin_reload", "role": "default" }} , 
 	{ "name": "dmin_1_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "dmin_1_reload", "role": "default" }} , 
 	{ "name": "dmin_2_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "dmin_2_reload", "role": "default" }} , 
 	{ "name": "dmin_3_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "dmin_3_reload", "role": "default" }} , 
 	{ "name": "dmin_4_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "dmin_4_reload", "role": "default" }} , 
 	{ "name": "dmin_5_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "dmin_5_reload", "role": "default" }} , 
 	{ "name": "dmin_6_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "dmin_6_reload", "role": "default" }} , 
 	{ "name": "dmin_7_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "dmin_7_reload", "role": "default" }} , 
 	{ "name": "dmin_8_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "dmin_8_reload", "role": "default" }} , 
 	{ "name": "dmin_9_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "dmin_9_reload", "role": "default" }} , 
 	{ "name": "dmin_10_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "dmin_10_reload", "role": "default" }} , 
 	{ "name": "dmin_11_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "dmin_11_reload", "role": "default" }} , 
 	{ "name": "dmin_12_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "dmin_12_reload", "role": "default" }} , 
 	{ "name": "dmin_13_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "dmin_13_reload", "role": "default" }} , 
 	{ "name": "dmin_14_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "dmin_14_reload", "role": "default" }} , 
 	{ "name": "dmin_15_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "dmin_15_reload", "role": "default" }} , 
 	{ "name": "dmin_16_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "dmin_16_reload", "role": "default" }} , 
 	{ "name": "dmin_17_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "dmin_17_reload", "role": "default" }} , 
 	{ "name": "dmin_18_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "dmin_18_reload", "role": "default" }} , 
 	{ "name": "dmin_19_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "dmin_19_reload", "role": "default" }} , 
 	{ "name": "dmin_20_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "dmin_20_reload", "role": "default" }} , 
 	{ "name": "dmin_21_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "dmin_21_reload", "role": "default" }} , 
 	{ "name": "dmin_22_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "dmin_22_reload", "role": "default" }} , 
 	{ "name": "dmin_23_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "dmin_23_reload", "role": "default" }} , 
 	{ "name": "dmin_24_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "dmin_24_reload", "role": "default" }} , 
 	{ "name": "dmin_25_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "dmin_25_reload", "role": "default" }} , 
 	{ "name": "dmin_26_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "dmin_26_reload", "role": "default" }} , 
 	{ "name": "dmin_27_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "dmin_27_reload", "role": "default" }} , 
 	{ "name": "dmin_28_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "dmin_28_reload", "role": "default" }} , 
 	{ "name": "dmin_29_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "dmin_29_reload", "role": "default" }} , 
 	{ "name": "dmin_30_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "dmin_30_reload", "role": "default" }} , 
 	{ "name": "dmin_31_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "dmin_31_reload", "role": "default" }} , 
 	{ "name": "add_i_i69_phi_out", "direction": "out", "datatype": "sc_lv", "bitwidth":90, "type": "signal", "bundle":{"name": "add_i_i69_phi_out", "role": "default" }} , 
 	{ "name": "add_i_i69_phi_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "add_i_i69_phi_out", "role": "ap_vld" }}  ]}

set ArgLastReadFirstWriteLatency {
	mac_blocks_down_q4k7_Pipeline_REDUCE_G {
		total {Type I LastRead 0 FirstWrite -1}
		add_i_i69_lcssa_phi {Type I LastRead 0 FirstWrite -1}
		tmp_229 {Type I LastRead 0 FirstWrite -1}
		acc_w_g_load_reload {Type I LastRead 0 FirstWrite -1}
		acc_w_g_8_load_reload {Type I LastRead 0 FirstWrite -1}
		acc_w_g_16_load_reload {Type I LastRead 0 FirstWrite -1}
		acc_w_g_24_load_reload {Type I LastRead 0 FirstWrite -1}
		acc_w_g_32_load_reload {Type I LastRead 0 FirstWrite -1}
		acc_w_g_40_load_reload {Type I LastRead 0 FirstWrite -1}
		acc_w_g_48_load_reload {Type I LastRead 0 FirstWrite -1}
		acc_w_g_56_load_reload {Type I LastRead 0 FirstWrite -1}
		acc_m_g_load_reload {Type I LastRead 0 FirstWrite -1}
		acc_m_g_8_load_reload {Type I LastRead 0 FirstWrite -1}
		acc_m_g_16_load_reload {Type I LastRead 0 FirstWrite -1}
		acc_m_g_24_load_reload {Type I LastRead 0 FirstWrite -1}
		acc_m_g_32_load_reload {Type I LastRead 0 FirstWrite -1}
		acc_m_g_40_load_reload {Type I LastRead 0 FirstWrite -1}
		acc_m_g_48_load_reload {Type I LastRead 0 FirstWrite -1}
		acc_m_g_56_load_reload {Type I LastRead 0 FirstWrite -1}
		acc_w_g_1_load_reload {Type I LastRead 0 FirstWrite -1}
		acc_w_g_9_load_reload {Type I LastRead 0 FirstWrite -1}
		acc_w_g_17_load_reload {Type I LastRead 0 FirstWrite -1}
		acc_w_g_25_load_reload {Type I LastRead 0 FirstWrite -1}
		acc_w_g_33_load_reload {Type I LastRead 0 FirstWrite -1}
		acc_w_g_41_load_reload {Type I LastRead 0 FirstWrite -1}
		acc_w_g_49_load_reload {Type I LastRead 0 FirstWrite -1}
		acc_w_g_57_load_reload {Type I LastRead 0 FirstWrite -1}
		acc_m_g_1_load_reload {Type I LastRead 0 FirstWrite -1}
		acc_m_g_9_load_reload {Type I LastRead 0 FirstWrite -1}
		acc_m_g_17_load_reload {Type I LastRead 0 FirstWrite -1}
		acc_m_g_25_load_reload {Type I LastRead 0 FirstWrite -1}
		acc_m_g_33_load_reload {Type I LastRead 0 FirstWrite -1}
		acc_m_g_41_load_reload {Type I LastRead 0 FirstWrite -1}
		acc_m_g_49_load_reload {Type I LastRead 0 FirstWrite -1}
		acc_m_g_57_load_reload {Type I LastRead 0 FirstWrite -1}
		acc_w_g_2_load_reload {Type I LastRead 0 FirstWrite -1}
		acc_w_g_10_load_reload {Type I LastRead 0 FirstWrite -1}
		acc_w_g_18_load_reload {Type I LastRead 0 FirstWrite -1}
		acc_w_g_26_load_reload {Type I LastRead 0 FirstWrite -1}
		acc_w_g_34_load_reload {Type I LastRead 0 FirstWrite -1}
		acc_w_g_42_load_reload {Type I LastRead 0 FirstWrite -1}
		acc_w_g_50_load_reload {Type I LastRead 0 FirstWrite -1}
		acc_w_g_58_load_reload {Type I LastRead 0 FirstWrite -1}
		acc_m_g_2_load_reload {Type I LastRead 0 FirstWrite -1}
		acc_m_g_10_load_reload {Type I LastRead 0 FirstWrite -1}
		acc_m_g_18_load_reload {Type I LastRead 0 FirstWrite -1}
		acc_m_g_26_load_reload {Type I LastRead 0 FirstWrite -1}
		acc_m_g_34_load_reload {Type I LastRead 0 FirstWrite -1}
		acc_m_g_42_load_reload {Type I LastRead 0 FirstWrite -1}
		acc_m_g_50_load_reload {Type I LastRead 0 FirstWrite -1}
		acc_m_g_58_load_reload {Type I LastRead 0 FirstWrite -1}
		acc_w_g_3_load_reload {Type I LastRead 0 FirstWrite -1}
		acc_w_g_11_load_reload {Type I LastRead 0 FirstWrite -1}
		acc_w_g_19_load_reload {Type I LastRead 0 FirstWrite -1}
		acc_w_g_27_load_reload {Type I LastRead 0 FirstWrite -1}
		acc_w_g_35_load_reload {Type I LastRead 0 FirstWrite -1}
		acc_w_g_43_load_reload {Type I LastRead 0 FirstWrite -1}
		acc_w_g_51_load_reload {Type I LastRead 0 FirstWrite -1}
		acc_w_g_59_load_reload {Type I LastRead 0 FirstWrite -1}
		acc_m_g_3_load_reload {Type I LastRead 0 FirstWrite -1}
		acc_m_g_11_load_reload {Type I LastRead 0 FirstWrite -1}
		acc_m_g_19_load_reload {Type I LastRead 0 FirstWrite -1}
		acc_m_g_27_load_reload {Type I LastRead 0 FirstWrite -1}
		acc_m_g_35_load_reload {Type I LastRead 0 FirstWrite -1}
		acc_m_g_43_load_reload {Type I LastRead 0 FirstWrite -1}
		acc_m_g_51_load_reload {Type I LastRead 0 FirstWrite -1}
		acc_m_g_59_load_reload {Type I LastRead 0 FirstWrite -1}
		acc_w_g_4_load_reload {Type I LastRead 0 FirstWrite -1}
		acc_w_g_12_load_reload {Type I LastRead 0 FirstWrite -1}
		acc_w_g_20_load_reload {Type I LastRead 0 FirstWrite -1}
		acc_w_g_28_load_reload {Type I LastRead 0 FirstWrite -1}
		acc_w_g_36_load_reload {Type I LastRead 0 FirstWrite -1}
		acc_w_g_44_load_reload {Type I LastRead 0 FirstWrite -1}
		acc_w_g_52_load_reload {Type I LastRead 0 FirstWrite -1}
		acc_w_g_60_load_reload {Type I LastRead 0 FirstWrite -1}
		acc_m_g_4_load_reload {Type I LastRead 0 FirstWrite -1}
		acc_m_g_12_load_reload {Type I LastRead 0 FirstWrite -1}
		acc_m_g_20_load_reload {Type I LastRead 0 FirstWrite -1}
		acc_m_g_28_load_reload {Type I LastRead 0 FirstWrite -1}
		acc_m_g_36_load_reload {Type I LastRead 0 FirstWrite -1}
		acc_m_g_44_load_reload {Type I LastRead 0 FirstWrite -1}
		acc_m_g_52_load_reload {Type I LastRead 0 FirstWrite -1}
		acc_m_g_60_load_reload {Type I LastRead 0 FirstWrite -1}
		acc_w_g_5_load_reload {Type I LastRead 0 FirstWrite -1}
		acc_w_g_13_load_reload {Type I LastRead 0 FirstWrite -1}
		acc_w_g_21_load_reload {Type I LastRead 0 FirstWrite -1}
		acc_w_g_29_load_reload {Type I LastRead 0 FirstWrite -1}
		acc_w_g_37_load_reload {Type I LastRead 0 FirstWrite -1}
		acc_w_g_45_load_reload {Type I LastRead 0 FirstWrite -1}
		acc_w_g_53_load_reload {Type I LastRead 0 FirstWrite -1}
		acc_w_g_61_load_reload {Type I LastRead 0 FirstWrite -1}
		acc_m_g_5_load_reload {Type I LastRead 0 FirstWrite -1}
		acc_m_g_13_load_reload {Type I LastRead 0 FirstWrite -1}
		acc_m_g_21_load_reload {Type I LastRead 0 FirstWrite -1}
		acc_m_g_29_load_reload {Type I LastRead 0 FirstWrite -1}
		acc_m_g_37_load_reload {Type I LastRead 0 FirstWrite -1}
		acc_m_g_45_load_reload {Type I LastRead 0 FirstWrite -1}
		acc_m_g_53_load_reload {Type I LastRead 0 FirstWrite -1}
		acc_m_g_61_load_reload {Type I LastRead 0 FirstWrite -1}
		acc_w_g_6_load_reload {Type I LastRead 0 FirstWrite -1}
		acc_w_g_14_load_reload {Type I LastRead 0 FirstWrite -1}
		acc_w_g_22_load_reload {Type I LastRead 0 FirstWrite -1}
		acc_w_g_30_load_reload {Type I LastRead 0 FirstWrite -1}
		acc_w_g_38_load_reload {Type I LastRead 0 FirstWrite -1}
		acc_w_g_46_load_reload {Type I LastRead 0 FirstWrite -1}
		acc_w_g_54_load_reload {Type I LastRead 0 FirstWrite -1}
		acc_w_g_62_load_reload {Type I LastRead 0 FirstWrite -1}
		acc_m_g_6_load_reload {Type I LastRead 0 FirstWrite -1}
		acc_m_g_14_load_reload {Type I LastRead 0 FirstWrite -1}
		acc_m_g_22_load_reload {Type I LastRead 0 FirstWrite -1}
		acc_m_g_30_load_reload {Type I LastRead 0 FirstWrite -1}
		acc_m_g_38_load_reload {Type I LastRead 0 FirstWrite -1}
		acc_m_g_46_load_reload {Type I LastRead 0 FirstWrite -1}
		acc_m_g_54_load_reload {Type I LastRead 0 FirstWrite -1}
		acc_m_g_62_load_reload {Type I LastRead 0 FirstWrite -1}
		acc_w_g_7_load_reload {Type I LastRead 0 FirstWrite -1}
		acc_w_g_15_load_reload {Type I LastRead 0 FirstWrite -1}
		acc_w_g_23_load_reload {Type I LastRead 0 FirstWrite -1}
		acc_w_g_31_load_reload {Type I LastRead 0 FirstWrite -1}
		acc_w_g_39_load_reload {Type I LastRead 0 FirstWrite -1}
		acc_w_g_47_load_reload {Type I LastRead 0 FirstWrite -1}
		acc_w_g_55_load_reload {Type I LastRead 0 FirstWrite -1}
		acc_w_g_63_load_reload {Type I LastRead 0 FirstWrite -1}
		acc_m_g_7_load_reload {Type I LastRead 0 FirstWrite -1}
		acc_m_g_15_load_reload {Type I LastRead 0 FirstWrite -1}
		acc_m_g_23_load_reload {Type I LastRead 0 FirstWrite -1}
		acc_m_g_31_load_reload {Type I LastRead 0 FirstWrite -1}
		acc_m_g_39_load_reload {Type I LastRead 0 FirstWrite -1}
		acc_m_g_47_load_reload {Type I LastRead 0 FirstWrite -1}
		acc_m_g_55_load_reload {Type I LastRead 0 FirstWrite -1}
		acc_m_g_63_load_reload {Type I LastRead 0 FirstWrite -1}
		d_reload {Type I LastRead 0 FirstWrite -1}
		d_1_reload {Type I LastRead 0 FirstWrite -1}
		d_2_reload {Type I LastRead 0 FirstWrite -1}
		d_3_reload {Type I LastRead 0 FirstWrite -1}
		d_4_reload {Type I LastRead 0 FirstWrite -1}
		d_5_reload {Type I LastRead 0 FirstWrite -1}
		d_6_reload {Type I LastRead 0 FirstWrite -1}
		d_7_reload {Type I LastRead 0 FirstWrite -1}
		d_8_reload {Type I LastRead 0 FirstWrite -1}
		d_9_reload {Type I LastRead 0 FirstWrite -1}
		d_10_reload {Type I LastRead 0 FirstWrite -1}
		d_11_reload {Type I LastRead 0 FirstWrite -1}
		d_12_reload {Type I LastRead 0 FirstWrite -1}
		d_13_reload {Type I LastRead 0 FirstWrite -1}
		d_14_reload {Type I LastRead 0 FirstWrite -1}
		d_15_reload {Type I LastRead 0 FirstWrite -1}
		d_16_reload {Type I LastRead 0 FirstWrite -1}
		d_17_reload {Type I LastRead 0 FirstWrite -1}
		d_18_reload {Type I LastRead 0 FirstWrite -1}
		d_19_reload {Type I LastRead 0 FirstWrite -1}
		d_20_reload {Type I LastRead 0 FirstWrite -1}
		d_21_reload {Type I LastRead 0 FirstWrite -1}
		d_22_reload {Type I LastRead 0 FirstWrite -1}
		d_23_reload {Type I LastRead 0 FirstWrite -1}
		d_24_reload {Type I LastRead 0 FirstWrite -1}
		d_25_reload {Type I LastRead 0 FirstWrite -1}
		d_26_reload {Type I LastRead 0 FirstWrite -1}
		d_27_reload {Type I LastRead 0 FirstWrite -1}
		d_28_reload {Type I LastRead 0 FirstWrite -1}
		d_29_reload {Type I LastRead 0 FirstWrite -1}
		d_30_reload {Type I LastRead 0 FirstWrite -1}
		d_31_reload {Type I LastRead 0 FirstWrite -1}
		dmin_reload {Type I LastRead 0 FirstWrite -1}
		dmin_1_reload {Type I LastRead 0 FirstWrite -1}
		dmin_2_reload {Type I LastRead 0 FirstWrite -1}
		dmin_3_reload {Type I LastRead 0 FirstWrite -1}
		dmin_4_reload {Type I LastRead 0 FirstWrite -1}
		dmin_5_reload {Type I LastRead 0 FirstWrite -1}
		dmin_6_reload {Type I LastRead 0 FirstWrite -1}
		dmin_7_reload {Type I LastRead 0 FirstWrite -1}
		dmin_8_reload {Type I LastRead 0 FirstWrite -1}
		dmin_9_reload {Type I LastRead 0 FirstWrite -1}
		dmin_10_reload {Type I LastRead 0 FirstWrite -1}
		dmin_11_reload {Type I LastRead 0 FirstWrite -1}
		dmin_12_reload {Type I LastRead 0 FirstWrite -1}
		dmin_13_reload {Type I LastRead 0 FirstWrite -1}
		dmin_14_reload {Type I LastRead 0 FirstWrite -1}
		dmin_15_reload {Type I LastRead 0 FirstWrite -1}
		dmin_16_reload {Type I LastRead 0 FirstWrite -1}
		dmin_17_reload {Type I LastRead 0 FirstWrite -1}
		dmin_18_reload {Type I LastRead 0 FirstWrite -1}
		dmin_19_reload {Type I LastRead 0 FirstWrite -1}
		dmin_20_reload {Type I LastRead 0 FirstWrite -1}
		dmin_21_reload {Type I LastRead 0 FirstWrite -1}
		dmin_22_reload {Type I LastRead 0 FirstWrite -1}
		dmin_23_reload {Type I LastRead 0 FirstWrite -1}
		dmin_24_reload {Type I LastRead 0 FirstWrite -1}
		dmin_25_reload {Type I LastRead 0 FirstWrite -1}
		dmin_26_reload {Type I LastRead 0 FirstWrite -1}
		dmin_27_reload {Type I LastRead 0 FirstWrite -1}
		dmin_28_reload {Type I LastRead 0 FirstWrite -1}
		dmin_29_reload {Type I LastRead 0 FirstWrite -1}
		dmin_30_reload {Type I LastRead 0 FirstWrite -1}
		dmin_31_reload {Type I LastRead 0 FirstWrite -1}
		add_i_i69_phi_out {Type O LastRead -1 FirstWrite 10}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "20", "Max" : "20"}
	, {"Name" : "Interval", "Min" : "20", "Max" : "20"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	total { ap_none {  { total in_data 0 56 } } }
	add_i_i69_lcssa_phi { ap_none {  { add_i_i69_lcssa_phi in_data 0 90 } } }
	tmp_229 { ap_none {  { tmp_229 in_data 0 5 } } }
	acc_w_g_load_reload { ap_none {  { acc_w_g_load_reload in_data 0 32 } } }
	acc_w_g_8_load_reload { ap_none {  { acc_w_g_8_load_reload in_data 0 32 } } }
	acc_w_g_16_load_reload { ap_none {  { acc_w_g_16_load_reload in_data 0 32 } } }
	acc_w_g_24_load_reload { ap_none {  { acc_w_g_24_load_reload in_data 0 32 } } }
	acc_w_g_32_load_reload { ap_none {  { acc_w_g_32_load_reload in_data 0 32 } } }
	acc_w_g_40_load_reload { ap_none {  { acc_w_g_40_load_reload in_data 0 32 } } }
	acc_w_g_48_load_reload { ap_none {  { acc_w_g_48_load_reload in_data 0 32 } } }
	acc_w_g_56_load_reload { ap_none {  { acc_w_g_56_load_reload in_data 0 32 } } }
	acc_m_g_load_reload { ap_none {  { acc_m_g_load_reload in_data 0 32 } } }
	acc_m_g_8_load_reload { ap_none {  { acc_m_g_8_load_reload in_data 0 32 } } }
	acc_m_g_16_load_reload { ap_none {  { acc_m_g_16_load_reload in_data 0 32 } } }
	acc_m_g_24_load_reload { ap_none {  { acc_m_g_24_load_reload in_data 0 32 } } }
	acc_m_g_32_load_reload { ap_none {  { acc_m_g_32_load_reload in_data 0 32 } } }
	acc_m_g_40_load_reload { ap_none {  { acc_m_g_40_load_reload in_data 0 32 } } }
	acc_m_g_48_load_reload { ap_none {  { acc_m_g_48_load_reload in_data 0 32 } } }
	acc_m_g_56_load_reload { ap_none {  { acc_m_g_56_load_reload in_data 0 32 } } }
	acc_w_g_1_load_reload { ap_none {  { acc_w_g_1_load_reload in_data 0 32 } } }
	acc_w_g_9_load_reload { ap_none {  { acc_w_g_9_load_reload in_data 0 32 } } }
	acc_w_g_17_load_reload { ap_none {  { acc_w_g_17_load_reload in_data 0 32 } } }
	acc_w_g_25_load_reload { ap_none {  { acc_w_g_25_load_reload in_data 0 32 } } }
	acc_w_g_33_load_reload { ap_none {  { acc_w_g_33_load_reload in_data 0 32 } } }
	acc_w_g_41_load_reload { ap_none {  { acc_w_g_41_load_reload in_data 0 32 } } }
	acc_w_g_49_load_reload { ap_none {  { acc_w_g_49_load_reload in_data 0 32 } } }
	acc_w_g_57_load_reload { ap_none {  { acc_w_g_57_load_reload in_data 0 32 } } }
	acc_m_g_1_load_reload { ap_none {  { acc_m_g_1_load_reload in_data 0 32 } } }
	acc_m_g_9_load_reload { ap_none {  { acc_m_g_9_load_reload in_data 0 32 } } }
	acc_m_g_17_load_reload { ap_none {  { acc_m_g_17_load_reload in_data 0 32 } } }
	acc_m_g_25_load_reload { ap_none {  { acc_m_g_25_load_reload in_data 0 32 } } }
	acc_m_g_33_load_reload { ap_none {  { acc_m_g_33_load_reload in_data 0 32 } } }
	acc_m_g_41_load_reload { ap_none {  { acc_m_g_41_load_reload in_data 0 32 } } }
	acc_m_g_49_load_reload { ap_none {  { acc_m_g_49_load_reload in_data 0 32 } } }
	acc_m_g_57_load_reload { ap_none {  { acc_m_g_57_load_reload in_data 0 32 } } }
	acc_w_g_2_load_reload { ap_none {  { acc_w_g_2_load_reload in_data 0 32 } } }
	acc_w_g_10_load_reload { ap_none {  { acc_w_g_10_load_reload in_data 0 32 } } }
	acc_w_g_18_load_reload { ap_none {  { acc_w_g_18_load_reload in_data 0 32 } } }
	acc_w_g_26_load_reload { ap_none {  { acc_w_g_26_load_reload in_data 0 32 } } }
	acc_w_g_34_load_reload { ap_none {  { acc_w_g_34_load_reload in_data 0 32 } } }
	acc_w_g_42_load_reload { ap_none {  { acc_w_g_42_load_reload in_data 0 32 } } }
	acc_w_g_50_load_reload { ap_none {  { acc_w_g_50_load_reload in_data 0 32 } } }
	acc_w_g_58_load_reload { ap_none {  { acc_w_g_58_load_reload in_data 0 32 } } }
	acc_m_g_2_load_reload { ap_none {  { acc_m_g_2_load_reload in_data 0 32 } } }
	acc_m_g_10_load_reload { ap_none {  { acc_m_g_10_load_reload in_data 0 32 } } }
	acc_m_g_18_load_reload { ap_none {  { acc_m_g_18_load_reload in_data 0 32 } } }
	acc_m_g_26_load_reload { ap_none {  { acc_m_g_26_load_reload in_data 0 32 } } }
	acc_m_g_34_load_reload { ap_none {  { acc_m_g_34_load_reload in_data 0 32 } } }
	acc_m_g_42_load_reload { ap_none {  { acc_m_g_42_load_reload in_data 0 32 } } }
	acc_m_g_50_load_reload { ap_none {  { acc_m_g_50_load_reload in_data 0 32 } } }
	acc_m_g_58_load_reload { ap_none {  { acc_m_g_58_load_reload in_data 0 32 } } }
	acc_w_g_3_load_reload { ap_none {  { acc_w_g_3_load_reload in_data 0 32 } } }
	acc_w_g_11_load_reload { ap_none {  { acc_w_g_11_load_reload in_data 0 32 } } }
	acc_w_g_19_load_reload { ap_none {  { acc_w_g_19_load_reload in_data 0 32 } } }
	acc_w_g_27_load_reload { ap_none {  { acc_w_g_27_load_reload in_data 0 32 } } }
	acc_w_g_35_load_reload { ap_none {  { acc_w_g_35_load_reload in_data 0 32 } } }
	acc_w_g_43_load_reload { ap_none {  { acc_w_g_43_load_reload in_data 0 32 } } }
	acc_w_g_51_load_reload { ap_none {  { acc_w_g_51_load_reload in_data 0 32 } } }
	acc_w_g_59_load_reload { ap_none {  { acc_w_g_59_load_reload in_data 0 32 } } }
	acc_m_g_3_load_reload { ap_none {  { acc_m_g_3_load_reload in_data 0 32 } } }
	acc_m_g_11_load_reload { ap_none {  { acc_m_g_11_load_reload in_data 0 32 } } }
	acc_m_g_19_load_reload { ap_none {  { acc_m_g_19_load_reload in_data 0 32 } } }
	acc_m_g_27_load_reload { ap_none {  { acc_m_g_27_load_reload in_data 0 32 } } }
	acc_m_g_35_load_reload { ap_none {  { acc_m_g_35_load_reload in_data 0 32 } } }
	acc_m_g_43_load_reload { ap_none {  { acc_m_g_43_load_reload in_data 0 32 } } }
	acc_m_g_51_load_reload { ap_none {  { acc_m_g_51_load_reload in_data 0 32 } } }
	acc_m_g_59_load_reload { ap_none {  { acc_m_g_59_load_reload in_data 0 32 } } }
	acc_w_g_4_load_reload { ap_none {  { acc_w_g_4_load_reload in_data 0 32 } } }
	acc_w_g_12_load_reload { ap_none {  { acc_w_g_12_load_reload in_data 0 32 } } }
	acc_w_g_20_load_reload { ap_none {  { acc_w_g_20_load_reload in_data 0 32 } } }
	acc_w_g_28_load_reload { ap_none {  { acc_w_g_28_load_reload in_data 0 32 } } }
	acc_w_g_36_load_reload { ap_none {  { acc_w_g_36_load_reload in_data 0 32 } } }
	acc_w_g_44_load_reload { ap_none {  { acc_w_g_44_load_reload in_data 0 32 } } }
	acc_w_g_52_load_reload { ap_none {  { acc_w_g_52_load_reload in_data 0 32 } } }
	acc_w_g_60_load_reload { ap_none {  { acc_w_g_60_load_reload in_data 0 32 } } }
	acc_m_g_4_load_reload { ap_none {  { acc_m_g_4_load_reload in_data 0 32 } } }
	acc_m_g_12_load_reload { ap_none {  { acc_m_g_12_load_reload in_data 0 32 } } }
	acc_m_g_20_load_reload { ap_none {  { acc_m_g_20_load_reload in_data 0 32 } } }
	acc_m_g_28_load_reload { ap_none {  { acc_m_g_28_load_reload in_data 0 32 } } }
	acc_m_g_36_load_reload { ap_none {  { acc_m_g_36_load_reload in_data 0 32 } } }
	acc_m_g_44_load_reload { ap_none {  { acc_m_g_44_load_reload in_data 0 32 } } }
	acc_m_g_52_load_reload { ap_none {  { acc_m_g_52_load_reload in_data 0 32 } } }
	acc_m_g_60_load_reload { ap_none {  { acc_m_g_60_load_reload in_data 0 32 } } }
	acc_w_g_5_load_reload { ap_none {  { acc_w_g_5_load_reload in_data 0 32 } } }
	acc_w_g_13_load_reload { ap_none {  { acc_w_g_13_load_reload in_data 0 32 } } }
	acc_w_g_21_load_reload { ap_none {  { acc_w_g_21_load_reload in_data 0 32 } } }
	acc_w_g_29_load_reload { ap_none {  { acc_w_g_29_load_reload in_data 0 32 } } }
	acc_w_g_37_load_reload { ap_none {  { acc_w_g_37_load_reload in_data 0 32 } } }
	acc_w_g_45_load_reload { ap_none {  { acc_w_g_45_load_reload in_data 0 32 } } }
	acc_w_g_53_load_reload { ap_none {  { acc_w_g_53_load_reload in_data 0 32 } } }
	acc_w_g_61_load_reload { ap_none {  { acc_w_g_61_load_reload in_data 0 32 } } }
	acc_m_g_5_load_reload { ap_none {  { acc_m_g_5_load_reload in_data 0 32 } } }
	acc_m_g_13_load_reload { ap_none {  { acc_m_g_13_load_reload in_data 0 32 } } }
	acc_m_g_21_load_reload { ap_none {  { acc_m_g_21_load_reload in_data 0 32 } } }
	acc_m_g_29_load_reload { ap_none {  { acc_m_g_29_load_reload in_data 0 32 } } }
	acc_m_g_37_load_reload { ap_none {  { acc_m_g_37_load_reload in_data 0 32 } } }
	acc_m_g_45_load_reload { ap_none {  { acc_m_g_45_load_reload in_data 0 32 } } }
	acc_m_g_53_load_reload { ap_none {  { acc_m_g_53_load_reload in_data 0 32 } } }
	acc_m_g_61_load_reload { ap_none {  { acc_m_g_61_load_reload in_data 0 32 } } }
	acc_w_g_6_load_reload { ap_none {  { acc_w_g_6_load_reload in_data 0 32 } } }
	acc_w_g_14_load_reload { ap_none {  { acc_w_g_14_load_reload in_data 0 32 } } }
	acc_w_g_22_load_reload { ap_none {  { acc_w_g_22_load_reload in_data 0 32 } } }
	acc_w_g_30_load_reload { ap_none {  { acc_w_g_30_load_reload in_data 0 32 } } }
	acc_w_g_38_load_reload { ap_none {  { acc_w_g_38_load_reload in_data 0 32 } } }
	acc_w_g_46_load_reload { ap_none {  { acc_w_g_46_load_reload in_data 0 32 } } }
	acc_w_g_54_load_reload { ap_none {  { acc_w_g_54_load_reload in_data 0 32 } } }
	acc_w_g_62_load_reload { ap_none {  { acc_w_g_62_load_reload in_data 0 32 } } }
	acc_m_g_6_load_reload { ap_none {  { acc_m_g_6_load_reload in_data 0 32 } } }
	acc_m_g_14_load_reload { ap_none {  { acc_m_g_14_load_reload in_data 0 32 } } }
	acc_m_g_22_load_reload { ap_none {  { acc_m_g_22_load_reload in_data 0 32 } } }
	acc_m_g_30_load_reload { ap_none {  { acc_m_g_30_load_reload in_data 0 32 } } }
	acc_m_g_38_load_reload { ap_none {  { acc_m_g_38_load_reload in_data 0 32 } } }
	acc_m_g_46_load_reload { ap_none {  { acc_m_g_46_load_reload in_data 0 32 } } }
	acc_m_g_54_load_reload { ap_none {  { acc_m_g_54_load_reload in_data 0 32 } } }
	acc_m_g_62_load_reload { ap_none {  { acc_m_g_62_load_reload in_data 0 32 } } }
	acc_w_g_7_load_reload { ap_none {  { acc_w_g_7_load_reload in_data 0 32 } } }
	acc_w_g_15_load_reload { ap_none {  { acc_w_g_15_load_reload in_data 0 32 } } }
	acc_w_g_23_load_reload { ap_none {  { acc_w_g_23_load_reload in_data 0 32 } } }
	acc_w_g_31_load_reload { ap_none {  { acc_w_g_31_load_reload in_data 0 32 } } }
	acc_w_g_39_load_reload { ap_none {  { acc_w_g_39_load_reload in_data 0 32 } } }
	acc_w_g_47_load_reload { ap_none {  { acc_w_g_47_load_reload in_data 0 32 } } }
	acc_w_g_55_load_reload { ap_none {  { acc_w_g_55_load_reload in_data 0 32 } } }
	acc_w_g_63_load_reload { ap_none {  { acc_w_g_63_load_reload in_data 0 32 } } }
	acc_m_g_7_load_reload { ap_none {  { acc_m_g_7_load_reload in_data 0 32 } } }
	acc_m_g_15_load_reload { ap_none {  { acc_m_g_15_load_reload in_data 0 32 } } }
	acc_m_g_23_load_reload { ap_none {  { acc_m_g_23_load_reload in_data 0 32 } } }
	acc_m_g_31_load_reload { ap_none {  { acc_m_g_31_load_reload in_data 0 32 } } }
	acc_m_g_39_load_reload { ap_none {  { acc_m_g_39_load_reload in_data 0 32 } } }
	acc_m_g_47_load_reload { ap_none {  { acc_m_g_47_load_reload in_data 0 32 } } }
	acc_m_g_55_load_reload { ap_none {  { acc_m_g_55_load_reload in_data 0 32 } } }
	acc_m_g_63_load_reload { ap_none {  { acc_m_g_63_load_reload in_data 0 32 } } }
	d_reload { ap_none {  { d_reload in_data 0 32 } } }
	d_1_reload { ap_none {  { d_1_reload in_data 0 32 } } }
	d_2_reload { ap_none {  { d_2_reload in_data 0 32 } } }
	d_3_reload { ap_none {  { d_3_reload in_data 0 32 } } }
	d_4_reload { ap_none {  { d_4_reload in_data 0 32 } } }
	d_5_reload { ap_none {  { d_5_reload in_data 0 32 } } }
	d_6_reload { ap_none {  { d_6_reload in_data 0 32 } } }
	d_7_reload { ap_none {  { d_7_reload in_data 0 32 } } }
	d_8_reload { ap_none {  { d_8_reload in_data 0 32 } } }
	d_9_reload { ap_none {  { d_9_reload in_data 0 32 } } }
	d_10_reload { ap_none {  { d_10_reload in_data 0 32 } } }
	d_11_reload { ap_none {  { d_11_reload in_data 0 32 } } }
	d_12_reload { ap_none {  { d_12_reload in_data 0 32 } } }
	d_13_reload { ap_none {  { d_13_reload in_data 0 32 } } }
	d_14_reload { ap_none {  { d_14_reload in_data 0 32 } } }
	d_15_reload { ap_none {  { d_15_reload in_data 0 32 } } }
	d_16_reload { ap_none {  { d_16_reload in_data 0 32 } } }
	d_17_reload { ap_none {  { d_17_reload in_data 0 32 } } }
	d_18_reload { ap_none {  { d_18_reload in_data 0 32 } } }
	d_19_reload { ap_none {  { d_19_reload in_data 0 32 } } }
	d_20_reload { ap_none {  { d_20_reload in_data 0 32 } } }
	d_21_reload { ap_none {  { d_21_reload in_data 0 32 } } }
	d_22_reload { ap_none {  { d_22_reload in_data 0 32 } } }
	d_23_reload { ap_none {  { d_23_reload in_data 0 32 } } }
	d_24_reload { ap_none {  { d_24_reload in_data 0 32 } } }
	d_25_reload { ap_none {  { d_25_reload in_data 0 32 } } }
	d_26_reload { ap_none {  { d_26_reload in_data 0 32 } } }
	d_27_reload { ap_none {  { d_27_reload in_data 0 32 } } }
	d_28_reload { ap_none {  { d_28_reload in_data 0 32 } } }
	d_29_reload { ap_none {  { d_29_reload in_data 0 32 } } }
	d_30_reload { ap_none {  { d_30_reload in_data 0 32 } } }
	d_31_reload { ap_none {  { d_31_reload in_data 0 32 } } }
	dmin_reload { ap_none {  { dmin_reload in_data 0 32 } } }
	dmin_1_reload { ap_none {  { dmin_1_reload in_data 0 32 } } }
	dmin_2_reload { ap_none {  { dmin_2_reload in_data 0 32 } } }
	dmin_3_reload { ap_none {  { dmin_3_reload in_data 0 32 } } }
	dmin_4_reload { ap_none {  { dmin_4_reload in_data 0 32 } } }
	dmin_5_reload { ap_none {  { dmin_5_reload in_data 0 32 } } }
	dmin_6_reload { ap_none {  { dmin_6_reload in_data 0 32 } } }
	dmin_7_reload { ap_none {  { dmin_7_reload in_data 0 32 } } }
	dmin_8_reload { ap_none {  { dmin_8_reload in_data 0 32 } } }
	dmin_9_reload { ap_none {  { dmin_9_reload in_data 0 32 } } }
	dmin_10_reload { ap_none {  { dmin_10_reload in_data 0 32 } } }
	dmin_11_reload { ap_none {  { dmin_11_reload in_data 0 32 } } }
	dmin_12_reload { ap_none {  { dmin_12_reload in_data 0 32 } } }
	dmin_13_reload { ap_none {  { dmin_13_reload in_data 0 32 } } }
	dmin_14_reload { ap_none {  { dmin_14_reload in_data 0 32 } } }
	dmin_15_reload { ap_none {  { dmin_15_reload in_data 0 32 } } }
	dmin_16_reload { ap_none {  { dmin_16_reload in_data 0 32 } } }
	dmin_17_reload { ap_none {  { dmin_17_reload in_data 0 32 } } }
	dmin_18_reload { ap_none {  { dmin_18_reload in_data 0 32 } } }
	dmin_19_reload { ap_none {  { dmin_19_reload in_data 0 32 } } }
	dmin_20_reload { ap_none {  { dmin_20_reload in_data 0 32 } } }
	dmin_21_reload { ap_none {  { dmin_21_reload in_data 0 32 } } }
	dmin_22_reload { ap_none {  { dmin_22_reload in_data 0 32 } } }
	dmin_23_reload { ap_none {  { dmin_23_reload in_data 0 32 } } }
	dmin_24_reload { ap_none {  { dmin_24_reload in_data 0 32 } } }
	dmin_25_reload { ap_none {  { dmin_25_reload in_data 0 32 } } }
	dmin_26_reload { ap_none {  { dmin_26_reload in_data 0 32 } } }
	dmin_27_reload { ap_none {  { dmin_27_reload in_data 0 32 } } }
	dmin_28_reload { ap_none {  { dmin_28_reload in_data 0 32 } } }
	dmin_29_reload { ap_none {  { dmin_29_reload in_data 0 32 } } }
	dmin_30_reload { ap_none {  { dmin_30_reload in_data 0 32 } } }
	dmin_31_reload { ap_none {  { dmin_31_reload in_data 0 32 } } }
	add_i_i69_phi_out { ap_vld {  { add_i_i69_phi_out out_data 1 90 }  { add_i_i69_phi_out_ap_vld out_vld 1 1 } } }
}
