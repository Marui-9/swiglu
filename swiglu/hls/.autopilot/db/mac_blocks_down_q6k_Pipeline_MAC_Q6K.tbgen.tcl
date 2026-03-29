set moduleName mac_blocks_down_q6k_Pipeline_MAC_Q6K
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
set C_modelName {mac_blocks_down_q6k_Pipeline_MAC_Q6K}
set C_modelType { void 0 }
set ap_memory_interface_dict [dict create]
dict set ap_memory_interface_dict rb_0 { MEM_WIDTH 128 MEM_SIZE 432 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict rb_1 { MEM_WIDTH 128 MEM_SIZE 432 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict rb_2 { MEM_WIDTH 128 MEM_SIZE 432 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict rb_3 { MEM_WIDTH 128 MEM_SIZE 432 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict rb_4 { MEM_WIDTH 128 MEM_SIZE 432 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict rb_5 { MEM_WIDTH 128 MEM_SIZE 432 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict rb_6 { MEM_WIDTH 128 MEM_SIZE 432 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict rb_7 { MEM_WIDTH 128 MEM_SIZE 432 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict rb_8 { MEM_WIDTH 128 MEM_SIZE 432 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict rb_9 { MEM_WIDTH 128 MEM_SIZE 432 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict rb_10 { MEM_WIDTH 128 MEM_SIZE 432 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict rb_11 { MEM_WIDTH 128 MEM_SIZE 432 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict rb_12 { MEM_WIDTH 128 MEM_SIZE 432 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict rb_13 { MEM_WIDTH 128 MEM_SIZE 432 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict rb_14 { MEM_WIDTH 128 MEM_SIZE 432 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict rb_15 { MEM_WIDTH 128 MEM_SIZE 432 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict gate_0 { MEM_WIDTH 8 MEM_SIZE 256 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict gate_4 { MEM_WIDTH 8 MEM_SIZE 256 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict gate_8 { MEM_WIDTH 8 MEM_SIZE 256 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict gate_12 { MEM_WIDTH 8 MEM_SIZE 256 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict gate_16 { MEM_WIDTH 8 MEM_SIZE 256 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict gate_20 { MEM_WIDTH 8 MEM_SIZE 256 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict gate_24 { MEM_WIDTH 8 MEM_SIZE 256 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict gate_28 { MEM_WIDTH 8 MEM_SIZE 256 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
set C_modelArgList {
	{ acc float 32 regular {pointer 2}  }
	{ acc_7 float 32 regular {pointer 2}  }
	{ acc_6 float 32 regular {pointer 2}  }
	{ acc_5 float 32 regular {pointer 2}  }
	{ acc_4 float 32 regular {pointer 2}  }
	{ acc_3 float 32 regular {pointer 2}  }
	{ acc_2 float 32 regular {pointer 2}  }
	{ acc_1 float 32 regular {pointer 2}  }
	{ mul_ln55 int 13 regular  }
	{ rb_0 int 128 regular {array 27 { 1 1 1 3 3 3 3 3 3 3 3 3 3 3 3 3 3 } 1 1 }  }
	{ rb_1 int 128 regular {array 27 { 1 1 1 3 3 3 3 3 3 3 3 3 3 3 3 3 3 } 1 1 }  }
	{ rb_2 int 128 regular {array 27 { 1 1 1 3 3 3 3 3 3 3 3 3 3 3 3 3 3 } 1 1 }  }
	{ rb_3 int 128 regular {array 27 { 1 1 1 3 3 3 3 3 3 3 3 3 3 3 3 3 3 } 1 1 }  }
	{ rb_4 int 128 regular {array 27 { 1 1 1 3 3 3 3 3 3 3 3 3 3 3 3 3 3 } 1 1 }  }
	{ rb_5 int 128 regular {array 27 { 1 1 1 3 3 3 3 3 3 3 3 3 3 3 3 3 3 } 1 1 }  }
	{ rb_6 int 128 regular {array 27 { 1 1 1 3 3 3 3 3 3 3 3 3 3 3 3 3 3 } 1 1 }  }
	{ rb_7 int 128 regular {array 27 { 1 1 1 3 3 3 3 3 3 3 3 3 3 3 3 3 3 } 1 1 }  }
	{ rb_8 int 128 regular {array 27 { 1 1 1 3 3 3 3 3 3 3 3 3 3 3 3 3 3 } 1 1 }  }
	{ rb_9 int 128 regular {array 27 { 1 1 1 3 3 3 3 3 3 3 3 3 3 3 3 3 3 } 1 1 }  }
	{ rb_10 int 128 regular {array 27 { 1 1 1 3 3 3 3 3 3 3 3 3 3 3 3 3 3 } 1 1 }  }
	{ rb_11 int 128 regular {array 27 { 1 1 1 3 3 3 3 3 3 3 3 3 3 3 3 3 3 } 1 1 }  }
	{ rb_12 int 128 regular {array 27 { 1 1 1 3 3 3 3 3 3 3 3 3 3 3 3 3 3 } 1 1 }  }
	{ rb_13 int 128 regular {array 27 { 1 1 1 3 3 3 3 3 3 3 3 3 3 3 3 3 3 } 1 1 }  }
	{ rb_14 int 128 regular {array 27 { 1 1 1 3 3 3 3 3 3 3 3 3 3 3 3 3 3 } 1 1 }  }
	{ rb_15 int 128 regular {array 27 { 1 1 1 3 3 3 3 3 3 3 3 3 3 3 3 3 3 } 1 1 }  }
	{ gate_0 int 8 regular {array 256 { 1 3 } 1 1 }  }
	{ gate_4 int 8 regular {array 256 { 1 3 } 1 1 }  }
	{ gate_8 int 8 regular {array 256 { 1 3 } 1 1 }  }
	{ gate_12 int 8 regular {array 256 { 1 3 } 1 1 }  }
	{ gate_16 int 8 regular {array 256 { 1 3 } 1 1 }  }
	{ gate_20 int 8 regular {array 256 { 1 3 } 1 1 }  }
	{ gate_24 int 8 regular {array 256 { 1 3 } 1 1 }  }
	{ gate_28 int 8 regular {array 256 { 1 3 } 1 1 }  }
	{ empty int 5 regular  }
	{ gate_scale float 32 regular  }
}
set hasAXIMCache 0
set l_AXIML2Cache [list]
set AXIMCacheInstDict [dict create]
set C_modelArgMapList {[ 
	{ "Name" : "acc", "interface" : "wire", "bitwidth" : 32, "direction" : "READWRITE"} , 
 	{ "Name" : "acc_7", "interface" : "wire", "bitwidth" : 32, "direction" : "READWRITE"} , 
 	{ "Name" : "acc_6", "interface" : "wire", "bitwidth" : 32, "direction" : "READWRITE"} , 
 	{ "Name" : "acc_5", "interface" : "wire", "bitwidth" : 32, "direction" : "READWRITE"} , 
 	{ "Name" : "acc_4", "interface" : "wire", "bitwidth" : 32, "direction" : "READWRITE"} , 
 	{ "Name" : "acc_3", "interface" : "wire", "bitwidth" : 32, "direction" : "READWRITE"} , 
 	{ "Name" : "acc_2", "interface" : "wire", "bitwidth" : 32, "direction" : "READWRITE"} , 
 	{ "Name" : "acc_1", "interface" : "wire", "bitwidth" : 32, "direction" : "READWRITE"} , 
 	{ "Name" : "mul_ln55", "interface" : "wire", "bitwidth" : 13, "direction" : "READONLY"} , 
 	{ "Name" : "rb_0", "interface" : "memory", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "rb_1", "interface" : "memory", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "rb_2", "interface" : "memory", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "rb_3", "interface" : "memory", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "rb_4", "interface" : "memory", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "rb_5", "interface" : "memory", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "rb_6", "interface" : "memory", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "rb_7", "interface" : "memory", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "rb_8", "interface" : "memory", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "rb_9", "interface" : "memory", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "rb_10", "interface" : "memory", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "rb_11", "interface" : "memory", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "rb_12", "interface" : "memory", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "rb_13", "interface" : "memory", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "rb_14", "interface" : "memory", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "rb_15", "interface" : "memory", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "gate_0", "interface" : "memory", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "gate_4", "interface" : "memory", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "gate_8", "interface" : "memory", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "gate_12", "interface" : "memory", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "gate_16", "interface" : "memory", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "gate_20", "interface" : "memory", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "gate_24", "interface" : "memory", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "gate_28", "interface" : "memory", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "empty", "interface" : "wire", "bitwidth" : 5, "direction" : "READONLY"} , 
 	{ "Name" : "gate_scale", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} ]}
# RTL Port declarations: 
set portNum 227
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ acc_i sc_in sc_lv 32 signal 0 } 
	{ acc_o sc_out sc_lv 32 signal 0 } 
	{ acc_o_ap_vld sc_out sc_logic 1 outvld 0 } 
	{ acc_7_i sc_in sc_lv 32 signal 1 } 
	{ acc_7_o sc_out sc_lv 32 signal 1 } 
	{ acc_7_o_ap_vld sc_out sc_logic 1 outvld 1 } 
	{ acc_6_i sc_in sc_lv 32 signal 2 } 
	{ acc_6_o sc_out sc_lv 32 signal 2 } 
	{ acc_6_o_ap_vld sc_out sc_logic 1 outvld 2 } 
	{ acc_5_i sc_in sc_lv 32 signal 3 } 
	{ acc_5_o sc_out sc_lv 32 signal 3 } 
	{ acc_5_o_ap_vld sc_out sc_logic 1 outvld 3 } 
	{ acc_4_i sc_in sc_lv 32 signal 4 } 
	{ acc_4_o sc_out sc_lv 32 signal 4 } 
	{ acc_4_o_ap_vld sc_out sc_logic 1 outvld 4 } 
	{ acc_3_i sc_in sc_lv 32 signal 5 } 
	{ acc_3_o sc_out sc_lv 32 signal 5 } 
	{ acc_3_o_ap_vld sc_out sc_logic 1 outvld 5 } 
	{ acc_2_i sc_in sc_lv 32 signal 6 } 
	{ acc_2_o sc_out sc_lv 32 signal 6 } 
	{ acc_2_o_ap_vld sc_out sc_logic 1 outvld 6 } 
	{ acc_1_i sc_in sc_lv 32 signal 7 } 
	{ acc_1_o sc_out sc_lv 32 signal 7 } 
	{ acc_1_o_ap_vld sc_out sc_logic 1 outvld 7 } 
	{ mul_ln55 sc_in sc_lv 13 signal 8 } 
	{ rb_0_address0 sc_out sc_lv 5 signal 9 } 
	{ rb_0_ce0 sc_out sc_logic 1 signal 9 } 
	{ rb_0_q0 sc_in sc_lv 128 signal 9 } 
	{ rb_0_address1 sc_out sc_lv 5 signal 9 } 
	{ rb_0_ce1 sc_out sc_logic 1 signal 9 } 
	{ rb_0_q1 sc_in sc_lv 128 signal 9 } 
	{ rb_0_address2 sc_out sc_lv 5 signal 9 } 
	{ rb_0_ce2 sc_out sc_logic 1 signal 9 } 
	{ rb_0_q2 sc_in sc_lv 128 signal 9 } 
	{ rb_1_address0 sc_out sc_lv 5 signal 10 } 
	{ rb_1_ce0 sc_out sc_logic 1 signal 10 } 
	{ rb_1_q0 sc_in sc_lv 128 signal 10 } 
	{ rb_1_address1 sc_out sc_lv 5 signal 10 } 
	{ rb_1_ce1 sc_out sc_logic 1 signal 10 } 
	{ rb_1_q1 sc_in sc_lv 128 signal 10 } 
	{ rb_1_address2 sc_out sc_lv 5 signal 10 } 
	{ rb_1_ce2 sc_out sc_logic 1 signal 10 } 
	{ rb_1_q2 sc_in sc_lv 128 signal 10 } 
	{ rb_2_address0 sc_out sc_lv 5 signal 11 } 
	{ rb_2_ce0 sc_out sc_logic 1 signal 11 } 
	{ rb_2_q0 sc_in sc_lv 128 signal 11 } 
	{ rb_2_address1 sc_out sc_lv 5 signal 11 } 
	{ rb_2_ce1 sc_out sc_logic 1 signal 11 } 
	{ rb_2_q1 sc_in sc_lv 128 signal 11 } 
	{ rb_2_address2 sc_out sc_lv 5 signal 11 } 
	{ rb_2_ce2 sc_out sc_logic 1 signal 11 } 
	{ rb_2_q2 sc_in sc_lv 128 signal 11 } 
	{ rb_3_address0 sc_out sc_lv 5 signal 12 } 
	{ rb_3_ce0 sc_out sc_logic 1 signal 12 } 
	{ rb_3_q0 sc_in sc_lv 128 signal 12 } 
	{ rb_3_address1 sc_out sc_lv 5 signal 12 } 
	{ rb_3_ce1 sc_out sc_logic 1 signal 12 } 
	{ rb_3_q1 sc_in sc_lv 128 signal 12 } 
	{ rb_3_address2 sc_out sc_lv 5 signal 12 } 
	{ rb_3_ce2 sc_out sc_logic 1 signal 12 } 
	{ rb_3_q2 sc_in sc_lv 128 signal 12 } 
	{ rb_4_address0 sc_out sc_lv 5 signal 13 } 
	{ rb_4_ce0 sc_out sc_logic 1 signal 13 } 
	{ rb_4_q0 sc_in sc_lv 128 signal 13 } 
	{ rb_4_address1 sc_out sc_lv 5 signal 13 } 
	{ rb_4_ce1 sc_out sc_logic 1 signal 13 } 
	{ rb_4_q1 sc_in sc_lv 128 signal 13 } 
	{ rb_4_address2 sc_out sc_lv 5 signal 13 } 
	{ rb_4_ce2 sc_out sc_logic 1 signal 13 } 
	{ rb_4_q2 sc_in sc_lv 128 signal 13 } 
	{ rb_5_address0 sc_out sc_lv 5 signal 14 } 
	{ rb_5_ce0 sc_out sc_logic 1 signal 14 } 
	{ rb_5_q0 sc_in sc_lv 128 signal 14 } 
	{ rb_5_address1 sc_out sc_lv 5 signal 14 } 
	{ rb_5_ce1 sc_out sc_logic 1 signal 14 } 
	{ rb_5_q1 sc_in sc_lv 128 signal 14 } 
	{ rb_5_address2 sc_out sc_lv 5 signal 14 } 
	{ rb_5_ce2 sc_out sc_logic 1 signal 14 } 
	{ rb_5_q2 sc_in sc_lv 128 signal 14 } 
	{ rb_6_address0 sc_out sc_lv 5 signal 15 } 
	{ rb_6_ce0 sc_out sc_logic 1 signal 15 } 
	{ rb_6_q0 sc_in sc_lv 128 signal 15 } 
	{ rb_6_address1 sc_out sc_lv 5 signal 15 } 
	{ rb_6_ce1 sc_out sc_logic 1 signal 15 } 
	{ rb_6_q1 sc_in sc_lv 128 signal 15 } 
	{ rb_6_address2 sc_out sc_lv 5 signal 15 } 
	{ rb_6_ce2 sc_out sc_logic 1 signal 15 } 
	{ rb_6_q2 sc_in sc_lv 128 signal 15 } 
	{ rb_7_address0 sc_out sc_lv 5 signal 16 } 
	{ rb_7_ce0 sc_out sc_logic 1 signal 16 } 
	{ rb_7_q0 sc_in sc_lv 128 signal 16 } 
	{ rb_7_address1 sc_out sc_lv 5 signal 16 } 
	{ rb_7_ce1 sc_out sc_logic 1 signal 16 } 
	{ rb_7_q1 sc_in sc_lv 128 signal 16 } 
	{ rb_7_address2 sc_out sc_lv 5 signal 16 } 
	{ rb_7_ce2 sc_out sc_logic 1 signal 16 } 
	{ rb_7_q2 sc_in sc_lv 128 signal 16 } 
	{ rb_8_address0 sc_out sc_lv 5 signal 17 } 
	{ rb_8_ce0 sc_out sc_logic 1 signal 17 } 
	{ rb_8_q0 sc_in sc_lv 128 signal 17 } 
	{ rb_8_address1 sc_out sc_lv 5 signal 17 } 
	{ rb_8_ce1 sc_out sc_logic 1 signal 17 } 
	{ rb_8_q1 sc_in sc_lv 128 signal 17 } 
	{ rb_8_address2 sc_out sc_lv 5 signal 17 } 
	{ rb_8_ce2 sc_out sc_logic 1 signal 17 } 
	{ rb_8_q2 sc_in sc_lv 128 signal 17 } 
	{ rb_9_address0 sc_out sc_lv 5 signal 18 } 
	{ rb_9_ce0 sc_out sc_logic 1 signal 18 } 
	{ rb_9_q0 sc_in sc_lv 128 signal 18 } 
	{ rb_9_address1 sc_out sc_lv 5 signal 18 } 
	{ rb_9_ce1 sc_out sc_logic 1 signal 18 } 
	{ rb_9_q1 sc_in sc_lv 128 signal 18 } 
	{ rb_9_address2 sc_out sc_lv 5 signal 18 } 
	{ rb_9_ce2 sc_out sc_logic 1 signal 18 } 
	{ rb_9_q2 sc_in sc_lv 128 signal 18 } 
	{ rb_10_address0 sc_out sc_lv 5 signal 19 } 
	{ rb_10_ce0 sc_out sc_logic 1 signal 19 } 
	{ rb_10_q0 sc_in sc_lv 128 signal 19 } 
	{ rb_10_address1 sc_out sc_lv 5 signal 19 } 
	{ rb_10_ce1 sc_out sc_logic 1 signal 19 } 
	{ rb_10_q1 sc_in sc_lv 128 signal 19 } 
	{ rb_10_address2 sc_out sc_lv 5 signal 19 } 
	{ rb_10_ce2 sc_out sc_logic 1 signal 19 } 
	{ rb_10_q2 sc_in sc_lv 128 signal 19 } 
	{ rb_11_address0 sc_out sc_lv 5 signal 20 } 
	{ rb_11_ce0 sc_out sc_logic 1 signal 20 } 
	{ rb_11_q0 sc_in sc_lv 128 signal 20 } 
	{ rb_11_address1 sc_out sc_lv 5 signal 20 } 
	{ rb_11_ce1 sc_out sc_logic 1 signal 20 } 
	{ rb_11_q1 sc_in sc_lv 128 signal 20 } 
	{ rb_11_address2 sc_out sc_lv 5 signal 20 } 
	{ rb_11_ce2 sc_out sc_logic 1 signal 20 } 
	{ rb_11_q2 sc_in sc_lv 128 signal 20 } 
	{ rb_12_address0 sc_out sc_lv 5 signal 21 } 
	{ rb_12_ce0 sc_out sc_logic 1 signal 21 } 
	{ rb_12_q0 sc_in sc_lv 128 signal 21 } 
	{ rb_12_address1 sc_out sc_lv 5 signal 21 } 
	{ rb_12_ce1 sc_out sc_logic 1 signal 21 } 
	{ rb_12_q1 sc_in sc_lv 128 signal 21 } 
	{ rb_12_address2 sc_out sc_lv 5 signal 21 } 
	{ rb_12_ce2 sc_out sc_logic 1 signal 21 } 
	{ rb_12_q2 sc_in sc_lv 128 signal 21 } 
	{ rb_13_address0 sc_out sc_lv 5 signal 22 } 
	{ rb_13_ce0 sc_out sc_logic 1 signal 22 } 
	{ rb_13_q0 sc_in sc_lv 128 signal 22 } 
	{ rb_13_address1 sc_out sc_lv 5 signal 22 } 
	{ rb_13_ce1 sc_out sc_logic 1 signal 22 } 
	{ rb_13_q1 sc_in sc_lv 128 signal 22 } 
	{ rb_13_address2 sc_out sc_lv 5 signal 22 } 
	{ rb_13_ce2 sc_out sc_logic 1 signal 22 } 
	{ rb_13_q2 sc_in sc_lv 128 signal 22 } 
	{ rb_14_address0 sc_out sc_lv 5 signal 23 } 
	{ rb_14_ce0 sc_out sc_logic 1 signal 23 } 
	{ rb_14_q0 sc_in sc_lv 128 signal 23 } 
	{ rb_14_address1 sc_out sc_lv 5 signal 23 } 
	{ rb_14_ce1 sc_out sc_logic 1 signal 23 } 
	{ rb_14_q1 sc_in sc_lv 128 signal 23 } 
	{ rb_14_address2 sc_out sc_lv 5 signal 23 } 
	{ rb_14_ce2 sc_out sc_logic 1 signal 23 } 
	{ rb_14_q2 sc_in sc_lv 128 signal 23 } 
	{ rb_15_address0 sc_out sc_lv 5 signal 24 } 
	{ rb_15_ce0 sc_out sc_logic 1 signal 24 } 
	{ rb_15_q0 sc_in sc_lv 128 signal 24 } 
	{ rb_15_address1 sc_out sc_lv 5 signal 24 } 
	{ rb_15_ce1 sc_out sc_logic 1 signal 24 } 
	{ rb_15_q1 sc_in sc_lv 128 signal 24 } 
	{ rb_15_address2 sc_out sc_lv 5 signal 24 } 
	{ rb_15_ce2 sc_out sc_logic 1 signal 24 } 
	{ rb_15_q2 sc_in sc_lv 128 signal 24 } 
	{ gate_0_address0 sc_out sc_lv 8 signal 25 } 
	{ gate_0_ce0 sc_out sc_logic 1 signal 25 } 
	{ gate_0_q0 sc_in sc_lv 8 signal 25 } 
	{ gate_4_address0 sc_out sc_lv 8 signal 26 } 
	{ gate_4_ce0 sc_out sc_logic 1 signal 26 } 
	{ gate_4_q0 sc_in sc_lv 8 signal 26 } 
	{ gate_8_address0 sc_out sc_lv 8 signal 27 } 
	{ gate_8_ce0 sc_out sc_logic 1 signal 27 } 
	{ gate_8_q0 sc_in sc_lv 8 signal 27 } 
	{ gate_12_address0 sc_out sc_lv 8 signal 28 } 
	{ gate_12_ce0 sc_out sc_logic 1 signal 28 } 
	{ gate_12_q0 sc_in sc_lv 8 signal 28 } 
	{ gate_16_address0 sc_out sc_lv 8 signal 29 } 
	{ gate_16_ce0 sc_out sc_logic 1 signal 29 } 
	{ gate_16_q0 sc_in sc_lv 8 signal 29 } 
	{ gate_20_address0 sc_out sc_lv 8 signal 30 } 
	{ gate_20_ce0 sc_out sc_logic 1 signal 30 } 
	{ gate_20_q0 sc_in sc_lv 8 signal 30 } 
	{ gate_24_address0 sc_out sc_lv 8 signal 31 } 
	{ gate_24_ce0 sc_out sc_logic 1 signal 31 } 
	{ gate_24_q0 sc_in sc_lv 8 signal 31 } 
	{ gate_28_address0 sc_out sc_lv 8 signal 32 } 
	{ gate_28_ce0 sc_out sc_logic 1 signal 32 } 
	{ gate_28_q0 sc_in sc_lv 8 signal 32 } 
	{ empty sc_in sc_lv 5 signal 33 } 
	{ gate_scale sc_in sc_lv 32 signal 34 } 
	{ grp_fu_3363_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_3363_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_3363_p_opcode sc_out sc_lv 2 signal -1 } 
	{ grp_fu_3363_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_3363_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_1326_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_1326_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_1326_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_1326_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_3367_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_3367_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_3367_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_3367_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_3371_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_3371_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_3371_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_3371_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_3375_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_3375_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_3375_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_3378_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_3378_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_3378_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_3381_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_3381_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_3381_p_ce sc_out sc_logic 1 signal -1 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "acc_i", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc", "role": "i" }} , 
 	{ "name": "acc_o", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc", "role": "o" }} , 
 	{ "name": "acc_o_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "acc", "role": "o_ap_vld" }} , 
 	{ "name": "acc_7_i", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_7", "role": "i" }} , 
 	{ "name": "acc_7_o", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_7", "role": "o" }} , 
 	{ "name": "acc_7_o_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "acc_7", "role": "o_ap_vld" }} , 
 	{ "name": "acc_6_i", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_6", "role": "i" }} , 
 	{ "name": "acc_6_o", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_6", "role": "o" }} , 
 	{ "name": "acc_6_o_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "acc_6", "role": "o_ap_vld" }} , 
 	{ "name": "acc_5_i", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_5", "role": "i" }} , 
 	{ "name": "acc_5_o", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_5", "role": "o" }} , 
 	{ "name": "acc_5_o_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "acc_5", "role": "o_ap_vld" }} , 
 	{ "name": "acc_4_i", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_4", "role": "i" }} , 
 	{ "name": "acc_4_o", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_4", "role": "o" }} , 
 	{ "name": "acc_4_o_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "acc_4", "role": "o_ap_vld" }} , 
 	{ "name": "acc_3_i", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_3", "role": "i" }} , 
 	{ "name": "acc_3_o", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_3", "role": "o" }} , 
 	{ "name": "acc_3_o_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "acc_3", "role": "o_ap_vld" }} , 
 	{ "name": "acc_2_i", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_2", "role": "i" }} , 
 	{ "name": "acc_2_o", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_2", "role": "o" }} , 
 	{ "name": "acc_2_o_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "acc_2", "role": "o_ap_vld" }} , 
 	{ "name": "acc_1_i", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_1", "role": "i" }} , 
 	{ "name": "acc_1_o", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_1", "role": "o" }} , 
 	{ "name": "acc_1_o_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "acc_1", "role": "o_ap_vld" }} , 
 	{ "name": "mul_ln55", "direction": "in", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "mul_ln55", "role": "default" }} , 
 	{ "name": "rb_0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "rb_0", "role": "address0" }} , 
 	{ "name": "rb_0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rb_0", "role": "ce0" }} , 
 	{ "name": "rb_0_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "rb_0", "role": "q0" }} , 
 	{ "name": "rb_0_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "rb_0", "role": "address1" }} , 
 	{ "name": "rb_0_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rb_0", "role": "ce1" }} , 
 	{ "name": "rb_0_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "rb_0", "role": "q1" }} , 
 	{ "name": "rb_0_address2", "direction": "out", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "rb_0", "role": "address2" }} , 
 	{ "name": "rb_0_ce2", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rb_0", "role": "ce2" }} , 
 	{ "name": "rb_0_q2", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "rb_0", "role": "q2" }} , 
 	{ "name": "rb_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "rb_1", "role": "address0" }} , 
 	{ "name": "rb_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rb_1", "role": "ce0" }} , 
 	{ "name": "rb_1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "rb_1", "role": "q0" }} , 
 	{ "name": "rb_1_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "rb_1", "role": "address1" }} , 
 	{ "name": "rb_1_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rb_1", "role": "ce1" }} , 
 	{ "name": "rb_1_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "rb_1", "role": "q1" }} , 
 	{ "name": "rb_1_address2", "direction": "out", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "rb_1", "role": "address2" }} , 
 	{ "name": "rb_1_ce2", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rb_1", "role": "ce2" }} , 
 	{ "name": "rb_1_q2", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "rb_1", "role": "q2" }} , 
 	{ "name": "rb_2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "rb_2", "role": "address0" }} , 
 	{ "name": "rb_2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rb_2", "role": "ce0" }} , 
 	{ "name": "rb_2_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "rb_2", "role": "q0" }} , 
 	{ "name": "rb_2_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "rb_2", "role": "address1" }} , 
 	{ "name": "rb_2_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rb_2", "role": "ce1" }} , 
 	{ "name": "rb_2_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "rb_2", "role": "q1" }} , 
 	{ "name": "rb_2_address2", "direction": "out", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "rb_2", "role": "address2" }} , 
 	{ "name": "rb_2_ce2", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rb_2", "role": "ce2" }} , 
 	{ "name": "rb_2_q2", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "rb_2", "role": "q2" }} , 
 	{ "name": "rb_3_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "rb_3", "role": "address0" }} , 
 	{ "name": "rb_3_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rb_3", "role": "ce0" }} , 
 	{ "name": "rb_3_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "rb_3", "role": "q0" }} , 
 	{ "name": "rb_3_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "rb_3", "role": "address1" }} , 
 	{ "name": "rb_3_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rb_3", "role": "ce1" }} , 
 	{ "name": "rb_3_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "rb_3", "role": "q1" }} , 
 	{ "name": "rb_3_address2", "direction": "out", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "rb_3", "role": "address2" }} , 
 	{ "name": "rb_3_ce2", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rb_3", "role": "ce2" }} , 
 	{ "name": "rb_3_q2", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "rb_3", "role": "q2" }} , 
 	{ "name": "rb_4_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "rb_4", "role": "address0" }} , 
 	{ "name": "rb_4_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rb_4", "role": "ce0" }} , 
 	{ "name": "rb_4_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "rb_4", "role": "q0" }} , 
 	{ "name": "rb_4_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "rb_4", "role": "address1" }} , 
 	{ "name": "rb_4_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rb_4", "role": "ce1" }} , 
 	{ "name": "rb_4_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "rb_4", "role": "q1" }} , 
 	{ "name": "rb_4_address2", "direction": "out", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "rb_4", "role": "address2" }} , 
 	{ "name": "rb_4_ce2", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rb_4", "role": "ce2" }} , 
 	{ "name": "rb_4_q2", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "rb_4", "role": "q2" }} , 
 	{ "name": "rb_5_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "rb_5", "role": "address0" }} , 
 	{ "name": "rb_5_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rb_5", "role": "ce0" }} , 
 	{ "name": "rb_5_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "rb_5", "role": "q0" }} , 
 	{ "name": "rb_5_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "rb_5", "role": "address1" }} , 
 	{ "name": "rb_5_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rb_5", "role": "ce1" }} , 
 	{ "name": "rb_5_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "rb_5", "role": "q1" }} , 
 	{ "name": "rb_5_address2", "direction": "out", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "rb_5", "role": "address2" }} , 
 	{ "name": "rb_5_ce2", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rb_5", "role": "ce2" }} , 
 	{ "name": "rb_5_q2", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "rb_5", "role": "q2" }} , 
 	{ "name": "rb_6_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "rb_6", "role": "address0" }} , 
 	{ "name": "rb_6_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rb_6", "role": "ce0" }} , 
 	{ "name": "rb_6_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "rb_6", "role": "q0" }} , 
 	{ "name": "rb_6_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "rb_6", "role": "address1" }} , 
 	{ "name": "rb_6_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rb_6", "role": "ce1" }} , 
 	{ "name": "rb_6_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "rb_6", "role": "q1" }} , 
 	{ "name": "rb_6_address2", "direction": "out", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "rb_6", "role": "address2" }} , 
 	{ "name": "rb_6_ce2", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rb_6", "role": "ce2" }} , 
 	{ "name": "rb_6_q2", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "rb_6", "role": "q2" }} , 
 	{ "name": "rb_7_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "rb_7", "role": "address0" }} , 
 	{ "name": "rb_7_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rb_7", "role": "ce0" }} , 
 	{ "name": "rb_7_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "rb_7", "role": "q0" }} , 
 	{ "name": "rb_7_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "rb_7", "role": "address1" }} , 
 	{ "name": "rb_7_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rb_7", "role": "ce1" }} , 
 	{ "name": "rb_7_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "rb_7", "role": "q1" }} , 
 	{ "name": "rb_7_address2", "direction": "out", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "rb_7", "role": "address2" }} , 
 	{ "name": "rb_7_ce2", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rb_7", "role": "ce2" }} , 
 	{ "name": "rb_7_q2", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "rb_7", "role": "q2" }} , 
 	{ "name": "rb_8_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "rb_8", "role": "address0" }} , 
 	{ "name": "rb_8_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rb_8", "role": "ce0" }} , 
 	{ "name": "rb_8_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "rb_8", "role": "q0" }} , 
 	{ "name": "rb_8_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "rb_8", "role": "address1" }} , 
 	{ "name": "rb_8_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rb_8", "role": "ce1" }} , 
 	{ "name": "rb_8_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "rb_8", "role": "q1" }} , 
 	{ "name": "rb_8_address2", "direction": "out", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "rb_8", "role": "address2" }} , 
 	{ "name": "rb_8_ce2", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rb_8", "role": "ce2" }} , 
 	{ "name": "rb_8_q2", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "rb_8", "role": "q2" }} , 
 	{ "name": "rb_9_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "rb_9", "role": "address0" }} , 
 	{ "name": "rb_9_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rb_9", "role": "ce0" }} , 
 	{ "name": "rb_9_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "rb_9", "role": "q0" }} , 
 	{ "name": "rb_9_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "rb_9", "role": "address1" }} , 
 	{ "name": "rb_9_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rb_9", "role": "ce1" }} , 
 	{ "name": "rb_9_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "rb_9", "role": "q1" }} , 
 	{ "name": "rb_9_address2", "direction": "out", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "rb_9", "role": "address2" }} , 
 	{ "name": "rb_9_ce2", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rb_9", "role": "ce2" }} , 
 	{ "name": "rb_9_q2", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "rb_9", "role": "q2" }} , 
 	{ "name": "rb_10_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "rb_10", "role": "address0" }} , 
 	{ "name": "rb_10_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rb_10", "role": "ce0" }} , 
 	{ "name": "rb_10_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "rb_10", "role": "q0" }} , 
 	{ "name": "rb_10_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "rb_10", "role": "address1" }} , 
 	{ "name": "rb_10_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rb_10", "role": "ce1" }} , 
 	{ "name": "rb_10_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "rb_10", "role": "q1" }} , 
 	{ "name": "rb_10_address2", "direction": "out", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "rb_10", "role": "address2" }} , 
 	{ "name": "rb_10_ce2", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rb_10", "role": "ce2" }} , 
 	{ "name": "rb_10_q2", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "rb_10", "role": "q2" }} , 
 	{ "name": "rb_11_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "rb_11", "role": "address0" }} , 
 	{ "name": "rb_11_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rb_11", "role": "ce0" }} , 
 	{ "name": "rb_11_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "rb_11", "role": "q0" }} , 
 	{ "name": "rb_11_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "rb_11", "role": "address1" }} , 
 	{ "name": "rb_11_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rb_11", "role": "ce1" }} , 
 	{ "name": "rb_11_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "rb_11", "role": "q1" }} , 
 	{ "name": "rb_11_address2", "direction": "out", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "rb_11", "role": "address2" }} , 
 	{ "name": "rb_11_ce2", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rb_11", "role": "ce2" }} , 
 	{ "name": "rb_11_q2", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "rb_11", "role": "q2" }} , 
 	{ "name": "rb_12_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "rb_12", "role": "address0" }} , 
 	{ "name": "rb_12_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rb_12", "role": "ce0" }} , 
 	{ "name": "rb_12_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "rb_12", "role": "q0" }} , 
 	{ "name": "rb_12_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "rb_12", "role": "address1" }} , 
 	{ "name": "rb_12_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rb_12", "role": "ce1" }} , 
 	{ "name": "rb_12_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "rb_12", "role": "q1" }} , 
 	{ "name": "rb_12_address2", "direction": "out", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "rb_12", "role": "address2" }} , 
 	{ "name": "rb_12_ce2", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rb_12", "role": "ce2" }} , 
 	{ "name": "rb_12_q2", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "rb_12", "role": "q2" }} , 
 	{ "name": "rb_13_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "rb_13", "role": "address0" }} , 
 	{ "name": "rb_13_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rb_13", "role": "ce0" }} , 
 	{ "name": "rb_13_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "rb_13", "role": "q0" }} , 
 	{ "name": "rb_13_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "rb_13", "role": "address1" }} , 
 	{ "name": "rb_13_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rb_13", "role": "ce1" }} , 
 	{ "name": "rb_13_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "rb_13", "role": "q1" }} , 
 	{ "name": "rb_13_address2", "direction": "out", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "rb_13", "role": "address2" }} , 
 	{ "name": "rb_13_ce2", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rb_13", "role": "ce2" }} , 
 	{ "name": "rb_13_q2", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "rb_13", "role": "q2" }} , 
 	{ "name": "rb_14_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "rb_14", "role": "address0" }} , 
 	{ "name": "rb_14_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rb_14", "role": "ce0" }} , 
 	{ "name": "rb_14_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "rb_14", "role": "q0" }} , 
 	{ "name": "rb_14_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "rb_14", "role": "address1" }} , 
 	{ "name": "rb_14_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rb_14", "role": "ce1" }} , 
 	{ "name": "rb_14_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "rb_14", "role": "q1" }} , 
 	{ "name": "rb_14_address2", "direction": "out", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "rb_14", "role": "address2" }} , 
 	{ "name": "rb_14_ce2", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rb_14", "role": "ce2" }} , 
 	{ "name": "rb_14_q2", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "rb_14", "role": "q2" }} , 
 	{ "name": "rb_15_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "rb_15", "role": "address0" }} , 
 	{ "name": "rb_15_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rb_15", "role": "ce0" }} , 
 	{ "name": "rb_15_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "rb_15", "role": "q0" }} , 
 	{ "name": "rb_15_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "rb_15", "role": "address1" }} , 
 	{ "name": "rb_15_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rb_15", "role": "ce1" }} , 
 	{ "name": "rb_15_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "rb_15", "role": "q1" }} , 
 	{ "name": "rb_15_address2", "direction": "out", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "rb_15", "role": "address2" }} , 
 	{ "name": "rb_15_ce2", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rb_15", "role": "ce2" }} , 
 	{ "name": "rb_15_q2", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "rb_15", "role": "q2" }} , 
 	{ "name": "gate_0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "gate_0", "role": "address0" }} , 
 	{ "name": "gate_0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gate_0", "role": "ce0" }} , 
 	{ "name": "gate_0_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "gate_0", "role": "q0" }} , 
 	{ "name": "gate_4_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "gate_4", "role": "address0" }} , 
 	{ "name": "gate_4_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gate_4", "role": "ce0" }} , 
 	{ "name": "gate_4_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "gate_4", "role": "q0" }} , 
 	{ "name": "gate_8_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "gate_8", "role": "address0" }} , 
 	{ "name": "gate_8_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gate_8", "role": "ce0" }} , 
 	{ "name": "gate_8_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "gate_8", "role": "q0" }} , 
 	{ "name": "gate_12_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "gate_12", "role": "address0" }} , 
 	{ "name": "gate_12_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gate_12", "role": "ce0" }} , 
 	{ "name": "gate_12_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "gate_12", "role": "q0" }} , 
 	{ "name": "gate_16_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "gate_16", "role": "address0" }} , 
 	{ "name": "gate_16_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gate_16", "role": "ce0" }} , 
 	{ "name": "gate_16_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "gate_16", "role": "q0" }} , 
 	{ "name": "gate_20_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "gate_20", "role": "address0" }} , 
 	{ "name": "gate_20_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gate_20", "role": "ce0" }} , 
 	{ "name": "gate_20_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "gate_20", "role": "q0" }} , 
 	{ "name": "gate_24_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "gate_24", "role": "address0" }} , 
 	{ "name": "gate_24_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gate_24", "role": "ce0" }} , 
 	{ "name": "gate_24_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "gate_24", "role": "q0" }} , 
 	{ "name": "gate_28_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "gate_28", "role": "address0" }} , 
 	{ "name": "gate_28_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gate_28", "role": "ce0" }} , 
 	{ "name": "gate_28_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "gate_28", "role": "q0" }} , 
 	{ "name": "empty", "direction": "in", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "empty", "role": "default" }} , 
 	{ "name": "gate_scale", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "gate_scale", "role": "default" }} , 
 	{ "name": "grp_fu_3363_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_3363_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_3363_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_3363_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_3363_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "grp_fu_3363_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_3363_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_3363_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_3363_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_3363_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_1326_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1326_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_1326_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1326_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_1326_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1326_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_1326_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_1326_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_3367_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_3367_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_3367_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_3367_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_3367_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_3367_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_3367_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_3367_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_3371_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_3371_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_3371_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_3371_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_3371_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_3371_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_3371_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_3371_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_3375_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_3375_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_3375_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_3375_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_3375_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_3375_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_3378_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_3378_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_3378_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_3378_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_3378_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_3378_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_3381_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_3381_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_3381_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_3381_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_3381_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_3381_p_ce", "role": "default" }}  ]}

set ArgLastReadFirstWriteLatency {
	mac_blocks_down_q6k_Pipeline_MAC_Q6K {
		acc {Type IO LastRead 30 FirstWrite 37}
		acc_7 {Type IO LastRead 30 FirstWrite 37}
		acc_6 {Type IO LastRead 30 FirstWrite 37}
		acc_5 {Type IO LastRead 30 FirstWrite 37}
		acc_4 {Type IO LastRead 30 FirstWrite 37}
		acc_3 {Type IO LastRead 30 FirstWrite 37}
		acc_2 {Type IO LastRead 30 FirstWrite 37}
		acc_1 {Type IO LastRead 30 FirstWrite 37}
		mul_ln55 {Type I LastRead 0 FirstWrite -1}
		rb_0 {Type I LastRead 1 FirstWrite -1}
		rb_1 {Type I LastRead 1 FirstWrite -1}
		rb_2 {Type I LastRead 1 FirstWrite -1}
		rb_3 {Type I LastRead 1 FirstWrite -1}
		rb_4 {Type I LastRead 1 FirstWrite -1}
		rb_5 {Type I LastRead 1 FirstWrite -1}
		rb_6 {Type I LastRead 1 FirstWrite -1}
		rb_7 {Type I LastRead 1 FirstWrite -1}
		rb_8 {Type I LastRead 1 FirstWrite -1}
		rb_9 {Type I LastRead 1 FirstWrite -1}
		rb_10 {Type I LastRead 1 FirstWrite -1}
		rb_11 {Type I LastRead 1 FirstWrite -1}
		rb_12 {Type I LastRead 1 FirstWrite -1}
		rb_13 {Type I LastRead 1 FirstWrite -1}
		rb_14 {Type I LastRead 1 FirstWrite -1}
		rb_15 {Type I LastRead 1 FirstWrite -1}
		gate_0 {Type I LastRead 0 FirstWrite -1}
		gate_4 {Type I LastRead 0 FirstWrite -1}
		gate_8 {Type I LastRead 0 FirstWrite -1}
		gate_12 {Type I LastRead 0 FirstWrite -1}
		gate_16 {Type I LastRead 0 FirstWrite -1}
		gate_20 {Type I LastRead 0 FirstWrite -1}
		gate_24 {Type I LastRead 0 FirstWrite -1}
		gate_28 {Type I LastRead 0 FirstWrite -1}
		empty {Type I LastRead 0 FirstWrite -1}
		gate_scale {Type I LastRead 0 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "294", "Max" : "294"}
	, {"Name" : "Interval", "Min" : "294", "Max" : "294"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	acc { ap_ovld {  { acc_i in_data 0 32 }  { acc_o out_data 1 32 }  { acc_o_ap_vld out_vld 1 1 } } }
	acc_7 { ap_ovld {  { acc_7_i in_data 0 32 }  { acc_7_o out_data 1 32 }  { acc_7_o_ap_vld out_vld 1 1 } } }
	acc_6 { ap_ovld {  { acc_6_i in_data 0 32 }  { acc_6_o out_data 1 32 }  { acc_6_o_ap_vld out_vld 1 1 } } }
	acc_5 { ap_ovld {  { acc_5_i in_data 0 32 }  { acc_5_o out_data 1 32 }  { acc_5_o_ap_vld out_vld 1 1 } } }
	acc_4 { ap_ovld {  { acc_4_i in_data 0 32 }  { acc_4_o out_data 1 32 }  { acc_4_o_ap_vld out_vld 1 1 } } }
	acc_3 { ap_ovld {  { acc_3_i in_data 0 32 }  { acc_3_o out_data 1 32 }  { acc_3_o_ap_vld out_vld 1 1 } } }
	acc_2 { ap_ovld {  { acc_2_i in_data 0 32 }  { acc_2_o out_data 1 32 }  { acc_2_o_ap_vld out_vld 1 1 } } }
	acc_1 { ap_ovld {  { acc_1_i in_data 0 32 }  { acc_1_o out_data 1 32 }  { acc_1_o_ap_vld out_vld 1 1 } } }
	mul_ln55 { ap_none {  { mul_ln55 in_data 0 13 } } }
	rb_0 { ap_memory {  { rb_0_address0 mem_address 1 5 }  { rb_0_ce0 mem_ce 1 1 }  { rb_0_q0 mem_dout 0 128 }  { rb_0_address1 MemPortADDR2 1 5 }  { rb_0_ce1 MemPortCE2 1 1 }  { rb_0_q1 MemPortDOUT2 0 128 }  { rb_0_address2 MemPortADDR2 1 5 }  { rb_0_ce2 MemPortCE2 1 1 }  { rb_0_q2 MemPortDOUT2 0 128 } } }
	rb_1 { ap_memory {  { rb_1_address0 mem_address 1 5 }  { rb_1_ce0 mem_ce 1 1 }  { rb_1_q0 mem_dout 0 128 }  { rb_1_address1 MemPortADDR2 1 5 }  { rb_1_ce1 MemPortCE2 1 1 }  { rb_1_q1 MemPortDOUT2 0 128 }  { rb_1_address2 MemPortADDR2 1 5 }  { rb_1_ce2 MemPortCE2 1 1 }  { rb_1_q2 MemPortDOUT2 0 128 } } }
	rb_2 { ap_memory {  { rb_2_address0 mem_address 1 5 }  { rb_2_ce0 mem_ce 1 1 }  { rb_2_q0 mem_dout 0 128 }  { rb_2_address1 MemPortADDR2 1 5 }  { rb_2_ce1 MemPortCE2 1 1 }  { rb_2_q1 MemPortDOUT2 0 128 }  { rb_2_address2 MemPortADDR2 1 5 }  { rb_2_ce2 MemPortCE2 1 1 }  { rb_2_q2 MemPortDOUT2 0 128 } } }
	rb_3 { ap_memory {  { rb_3_address0 mem_address 1 5 }  { rb_3_ce0 mem_ce 1 1 }  { rb_3_q0 mem_dout 0 128 }  { rb_3_address1 MemPortADDR2 1 5 }  { rb_3_ce1 MemPortCE2 1 1 }  { rb_3_q1 MemPortDOUT2 0 128 }  { rb_3_address2 MemPortADDR2 1 5 }  { rb_3_ce2 MemPortCE2 1 1 }  { rb_3_q2 MemPortDOUT2 0 128 } } }
	rb_4 { ap_memory {  { rb_4_address0 mem_address 1 5 }  { rb_4_ce0 mem_ce 1 1 }  { rb_4_q0 mem_dout 0 128 }  { rb_4_address1 MemPortADDR2 1 5 }  { rb_4_ce1 MemPortCE2 1 1 }  { rb_4_q1 MemPortDOUT2 0 128 }  { rb_4_address2 MemPortADDR2 1 5 }  { rb_4_ce2 MemPortCE2 1 1 }  { rb_4_q2 MemPortDOUT2 0 128 } } }
	rb_5 { ap_memory {  { rb_5_address0 mem_address 1 5 }  { rb_5_ce0 mem_ce 1 1 }  { rb_5_q0 mem_dout 0 128 }  { rb_5_address1 MemPortADDR2 1 5 }  { rb_5_ce1 MemPortCE2 1 1 }  { rb_5_q1 MemPortDOUT2 0 128 }  { rb_5_address2 MemPortADDR2 1 5 }  { rb_5_ce2 MemPortCE2 1 1 }  { rb_5_q2 MemPortDOUT2 0 128 } } }
	rb_6 { ap_memory {  { rb_6_address0 mem_address 1 5 }  { rb_6_ce0 mem_ce 1 1 }  { rb_6_q0 mem_dout 0 128 }  { rb_6_address1 MemPortADDR2 1 5 }  { rb_6_ce1 MemPortCE2 1 1 }  { rb_6_q1 MemPortDOUT2 0 128 }  { rb_6_address2 MemPortADDR2 1 5 }  { rb_6_ce2 MemPortCE2 1 1 }  { rb_6_q2 MemPortDOUT2 0 128 } } }
	rb_7 { ap_memory {  { rb_7_address0 mem_address 1 5 }  { rb_7_ce0 mem_ce 1 1 }  { rb_7_q0 mem_dout 0 128 }  { rb_7_address1 MemPortADDR2 1 5 }  { rb_7_ce1 MemPortCE2 1 1 }  { rb_7_q1 MemPortDOUT2 0 128 }  { rb_7_address2 MemPortADDR2 1 5 }  { rb_7_ce2 MemPortCE2 1 1 }  { rb_7_q2 MemPortDOUT2 0 128 } } }
	rb_8 { ap_memory {  { rb_8_address0 mem_address 1 5 }  { rb_8_ce0 mem_ce 1 1 }  { rb_8_q0 mem_dout 0 128 }  { rb_8_address1 MemPortADDR2 1 5 }  { rb_8_ce1 MemPortCE2 1 1 }  { rb_8_q1 MemPortDOUT2 0 128 }  { rb_8_address2 MemPortADDR2 1 5 }  { rb_8_ce2 MemPortCE2 1 1 }  { rb_8_q2 MemPortDOUT2 0 128 } } }
	rb_9 { ap_memory {  { rb_9_address0 mem_address 1 5 }  { rb_9_ce0 mem_ce 1 1 }  { rb_9_q0 mem_dout 0 128 }  { rb_9_address1 MemPortADDR2 1 5 }  { rb_9_ce1 MemPortCE2 1 1 }  { rb_9_q1 MemPortDOUT2 0 128 }  { rb_9_address2 MemPortADDR2 1 5 }  { rb_9_ce2 MemPortCE2 1 1 }  { rb_9_q2 MemPortDOUT2 0 128 } } }
	rb_10 { ap_memory {  { rb_10_address0 mem_address 1 5 }  { rb_10_ce0 mem_ce 1 1 }  { rb_10_q0 mem_dout 0 128 }  { rb_10_address1 MemPortADDR2 1 5 }  { rb_10_ce1 MemPortCE2 1 1 }  { rb_10_q1 MemPortDOUT2 0 128 }  { rb_10_address2 MemPortADDR2 1 5 }  { rb_10_ce2 MemPortCE2 1 1 }  { rb_10_q2 MemPortDOUT2 0 128 } } }
	rb_11 { ap_memory {  { rb_11_address0 mem_address 1 5 }  { rb_11_ce0 mem_ce 1 1 }  { rb_11_q0 mem_dout 0 128 }  { rb_11_address1 MemPortADDR2 1 5 }  { rb_11_ce1 MemPortCE2 1 1 }  { rb_11_q1 MemPortDOUT2 0 128 }  { rb_11_address2 MemPortADDR2 1 5 }  { rb_11_ce2 MemPortCE2 1 1 }  { rb_11_q2 MemPortDOUT2 0 128 } } }
	rb_12 { ap_memory {  { rb_12_address0 mem_address 1 5 }  { rb_12_ce0 mem_ce 1 1 }  { rb_12_q0 mem_dout 0 128 }  { rb_12_address1 MemPortADDR2 1 5 }  { rb_12_ce1 MemPortCE2 1 1 }  { rb_12_q1 MemPortDOUT2 0 128 }  { rb_12_address2 MemPortADDR2 1 5 }  { rb_12_ce2 MemPortCE2 1 1 }  { rb_12_q2 MemPortDOUT2 0 128 } } }
	rb_13 { ap_memory {  { rb_13_address0 mem_address 1 5 }  { rb_13_ce0 mem_ce 1 1 }  { rb_13_q0 mem_dout 0 128 }  { rb_13_address1 MemPortADDR2 1 5 }  { rb_13_ce1 MemPortCE2 1 1 }  { rb_13_q1 MemPortDOUT2 0 128 }  { rb_13_address2 MemPortADDR2 1 5 }  { rb_13_ce2 MemPortCE2 1 1 }  { rb_13_q2 MemPortDOUT2 0 128 } } }
	rb_14 { ap_memory {  { rb_14_address0 mem_address 1 5 }  { rb_14_ce0 mem_ce 1 1 }  { rb_14_q0 mem_dout 0 128 }  { rb_14_address1 MemPortADDR2 1 5 }  { rb_14_ce1 MemPortCE2 1 1 }  { rb_14_q1 MemPortDOUT2 0 128 }  { rb_14_address2 MemPortADDR2 1 5 }  { rb_14_ce2 MemPortCE2 1 1 }  { rb_14_q2 MemPortDOUT2 0 128 } } }
	rb_15 { ap_memory {  { rb_15_address0 mem_address 1 5 }  { rb_15_ce0 mem_ce 1 1 }  { rb_15_q0 mem_dout 0 128 }  { rb_15_address1 MemPortADDR2 1 5 }  { rb_15_ce1 MemPortCE2 1 1 }  { rb_15_q1 MemPortDOUT2 0 128 }  { rb_15_address2 MemPortADDR2 1 5 }  { rb_15_ce2 MemPortCE2 1 1 }  { rb_15_q2 MemPortDOUT2 0 128 } } }
	gate_0 { ap_memory {  { gate_0_address0 mem_address 1 8 }  { gate_0_ce0 mem_ce 1 1 }  { gate_0_q0 mem_dout 0 8 } } }
	gate_4 { ap_memory {  { gate_4_address0 mem_address 1 8 }  { gate_4_ce0 mem_ce 1 1 }  { gate_4_q0 mem_dout 0 8 } } }
	gate_8 { ap_memory {  { gate_8_address0 mem_address 1 8 }  { gate_8_ce0 mem_ce 1 1 }  { gate_8_q0 mem_dout 0 8 } } }
	gate_12 { ap_memory {  { gate_12_address0 mem_address 1 8 }  { gate_12_ce0 mem_ce 1 1 }  { gate_12_q0 mem_dout 0 8 } } }
	gate_16 { ap_memory {  { gate_16_address0 mem_address 1 8 }  { gate_16_ce0 mem_ce 1 1 }  { gate_16_q0 mem_dout 0 8 } } }
	gate_20 { ap_memory {  { gate_20_address0 mem_address 1 8 }  { gate_20_ce0 mem_ce 1 1 }  { gate_20_q0 mem_dout 0 8 } } }
	gate_24 { ap_memory {  { gate_24_address0 mem_address 1 8 }  { gate_24_ce0 mem_ce 1 1 }  { gate_24_q0 mem_dout 0 8 } } }
	gate_28 { ap_memory {  { gate_28_address0 mem_address 1 8 }  { gate_28_ce0 mem_ce 1 1 }  { gate_28_q0 mem_dout 0 8 } } }
	empty { ap_none {  { empty in_data 0 5 } } }
	gate_scale { ap_none {  { gate_scale in_data 0 32 } } }
}
