set moduleName mac_blocks_down_q6k5_Pipeline_Q6K_MAC_GROUP
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
set C_modelName {mac_blocks_down_q6k5_Pipeline_Q6K_MAC_GROUP}
set C_modelType { void 0 }
set ap_memory_interface_dict [dict create]
dict set ap_memory_interface_dict gate_0 { MEM_WIDTH 8 MEM_SIZE 1024 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict gate_1 { MEM_WIDTH 8 MEM_SIZE 1024 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict gate_2 { MEM_WIDTH 8 MEM_SIZE 1024 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict gate_3 { MEM_WIDTH 8 MEM_SIZE 1024 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict gate_4 { MEM_WIDTH 8 MEM_SIZE 1024 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict gate_5 { MEM_WIDTH 8 MEM_SIZE 1024 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict gate_6 { MEM_WIDTH 8 MEM_SIZE 1024 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict gate_7 { MEM_WIDTH 8 MEM_SIZE 1024 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict ql_buf_0 { MEM_WIDTH 128 MEM_SIZE 512 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict ql_buf_1 { MEM_WIDTH 128 MEM_SIZE 512 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict ql_buf_2 { MEM_WIDTH 128 MEM_SIZE 512 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict ql_buf_3 { MEM_WIDTH 128 MEM_SIZE 512 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict ql_buf_4 { MEM_WIDTH 128 MEM_SIZE 512 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict ql_buf_5 { MEM_WIDTH 128 MEM_SIZE 512 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict ql_buf_6 { MEM_WIDTH 128 MEM_SIZE 512 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict ql_buf_7 { MEM_WIDTH 128 MEM_SIZE 512 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict qh_buf_0 { MEM_WIDTH 128 MEM_SIZE 256 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict qh_buf_1 { MEM_WIDTH 128 MEM_SIZE 256 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict qh_buf_2 { MEM_WIDTH 128 MEM_SIZE 256 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict qh_buf_3 { MEM_WIDTH 128 MEM_SIZE 256 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict qh_buf_4 { MEM_WIDTH 128 MEM_SIZE 256 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict qh_buf_5 { MEM_WIDTH 128 MEM_SIZE 256 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict qh_buf_6 { MEM_WIDTH 128 MEM_SIZE 256 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict qh_buf_7 { MEM_WIDTH 128 MEM_SIZE 256 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
set C_modelArgList {
	{ zext_ln607 int 10 regular  }
	{ gate_0 int 8 regular {array 1024 { 1 } 1 1 }  }
	{ gate_1 int 8 regular {array 1024 { 1 } 1 1 }  }
	{ gate_2 int 8 regular {array 1024 { 1 } 1 1 }  }
	{ gate_3 int 8 regular {array 1024 { 1 } 1 1 }  }
	{ gate_4 int 8 regular {array 1024 { 1 } 1 1 }  }
	{ gate_5 int 8 regular {array 1024 { 1 } 1 1 }  }
	{ gate_6 int 8 regular {array 1024 { 1 } 1 1 }  }
	{ gate_7 int 8 regular {array 1024 { 1 } 1 1 }  }
	{ tmp_87 int 2 regular  }
	{ ql_buf_0 int 128 regular {array 32 { 1 } 1 1 }  }
	{ ql_buf_1 int 128 regular {array 32 { 1 } 1 1 }  }
	{ ql_buf_2 int 128 regular {array 32 { 1 } 1 1 }  }
	{ ql_buf_3 int 128 regular {array 32 { 1 } 1 1 }  }
	{ ql_buf_4 int 128 regular {array 32 { 1 } 1 1 }  }
	{ ql_buf_5 int 128 regular {array 32 { 1 } 1 1 }  }
	{ ql_buf_6 int 128 regular {array 32 { 1 } 1 1 }  }
	{ ql_buf_7 int 128 regular {array 32 { 1 } 1 1 }  }
	{ qh_buf_0 int 128 regular {array 16 { 1 } 1 1 }  }
	{ qh_buf_1 int 128 regular {array 16 { 1 } 1 1 }  }
	{ qh_buf_2 int 128 regular {array 16 { 1 } 1 1 }  }
	{ qh_buf_3 int 128 regular {array 16 { 1 } 1 1 }  }
	{ qh_buf_4 int 128 regular {array 16 { 1 } 1 1 }  }
	{ qh_buf_5 int 128 regular {array 16 { 1 } 1 1 }  }
	{ qh_buf_6 int 128 regular {array 16 { 1 } 1 1 }  }
	{ qh_buf_7 int 128 regular {array 16 { 1 } 1 1 }  }
	{ empty int 1 regular  }
	{ tmp int 128 regular  }
	{ tmp_s int 128 regular  }
	{ tmp_65 int 128 regular  }
	{ tmp_66 int 128 regular  }
	{ acc_local_load_out int 32 regular {pointer 1}  }
	{ acc_local_1_load_out int 32 regular {pointer 1}  }
	{ acc_local_2_load_out int 32 regular {pointer 1}  }
	{ acc_local_3_load_out int 32 regular {pointer 1}  }
	{ acc_local_4_load_out int 32 regular {pointer 1}  }
	{ acc_local_5_load_out int 32 regular {pointer 1}  }
	{ acc_local_6_load_out int 32 regular {pointer 1}  }
	{ acc_local_7_load_out int 32 regular {pointer 1}  }
	{ acc_local_8_load_out int 32 regular {pointer 1}  }
	{ acc_local_9_load_out int 32 regular {pointer 1}  }
	{ acc_local_10_load_out int 32 regular {pointer 1}  }
	{ acc_local_11_load_out int 32 regular {pointer 1}  }
	{ acc_local_12_load_out int 32 regular {pointer 1}  }
	{ acc_local_13_load_out int 32 regular {pointer 1}  }
	{ acc_local_14_load_out int 32 regular {pointer 1}  }
	{ acc_local_15_load_out int 32 regular {pointer 1}  }
	{ acc_local_16_load_out int 32 regular {pointer 1}  }
	{ acc_local_17_load_out int 32 regular {pointer 1}  }
	{ acc_local_18_load_out int 32 regular {pointer 1}  }
	{ acc_local_19_load_out int 32 regular {pointer 1}  }
	{ acc_local_20_load_out int 32 regular {pointer 1}  }
	{ acc_local_21_load_out int 32 regular {pointer 1}  }
	{ acc_local_22_load_out int 32 regular {pointer 1}  }
	{ acc_local_23_load_out int 32 regular {pointer 1}  }
	{ acc_local_24_load_out int 32 regular {pointer 1}  }
	{ acc_local_25_load_out int 32 regular {pointer 1}  }
	{ acc_local_26_load_out int 32 regular {pointer 1}  }
	{ acc_local_27_load_out int 32 regular {pointer 1}  }
	{ acc_local_28_load_out int 32 regular {pointer 1}  }
	{ acc_local_29_load_out int 32 regular {pointer 1}  }
	{ acc_local_30_load_out int 32 regular {pointer 1}  }
	{ acc_local_31_load_out int 32 regular {pointer 1}  }
}
set hasAXIMCache 0
set l_AXIML2Cache [list]
set AXIMCacheInstDict [dict create]
set C_modelArgMapList {[ 
	{ "Name" : "zext_ln607", "interface" : "wire", "bitwidth" : 10, "direction" : "READONLY"} , 
 	{ "Name" : "gate_0", "interface" : "memory", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "gate_1", "interface" : "memory", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "gate_2", "interface" : "memory", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "gate_3", "interface" : "memory", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "gate_4", "interface" : "memory", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "gate_5", "interface" : "memory", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "gate_6", "interface" : "memory", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "gate_7", "interface" : "memory", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "tmp_87", "interface" : "wire", "bitwidth" : 2, "direction" : "READONLY"} , 
 	{ "Name" : "ql_buf_0", "interface" : "memory", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "ql_buf_1", "interface" : "memory", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "ql_buf_2", "interface" : "memory", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "ql_buf_3", "interface" : "memory", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "ql_buf_4", "interface" : "memory", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "ql_buf_5", "interface" : "memory", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "ql_buf_6", "interface" : "memory", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "ql_buf_7", "interface" : "memory", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "qh_buf_0", "interface" : "memory", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "qh_buf_1", "interface" : "memory", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "qh_buf_2", "interface" : "memory", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "qh_buf_3", "interface" : "memory", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "qh_buf_4", "interface" : "memory", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "qh_buf_5", "interface" : "memory", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "qh_buf_6", "interface" : "memory", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "qh_buf_7", "interface" : "memory", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "empty", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "tmp", "interface" : "wire", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "tmp_s", "interface" : "wire", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "tmp_65", "interface" : "wire", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "tmp_66", "interface" : "wire", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "acc_local_load_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "acc_local_1_load_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "acc_local_2_load_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "acc_local_3_load_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "acc_local_4_load_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "acc_local_5_load_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "acc_local_6_load_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "acc_local_7_load_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "acc_local_8_load_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "acc_local_9_load_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "acc_local_10_load_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "acc_local_11_load_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "acc_local_12_load_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "acc_local_13_load_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "acc_local_14_load_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "acc_local_15_load_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "acc_local_16_load_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "acc_local_17_load_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "acc_local_18_load_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "acc_local_19_load_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "acc_local_20_load_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "acc_local_21_load_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "acc_local_22_load_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "acc_local_23_load_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "acc_local_24_load_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "acc_local_25_load_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "acc_local_26_load_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "acc_local_27_load_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "acc_local_28_load_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "acc_local_29_load_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "acc_local_30_load_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "acc_local_31_load_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 149
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ zext_ln607 sc_in sc_lv 10 signal 0 } 
	{ gate_0_address0 sc_out sc_lv 10 signal 1 } 
	{ gate_0_ce0 sc_out sc_logic 1 signal 1 } 
	{ gate_0_q0 sc_in sc_lv 8 signal 1 } 
	{ gate_1_address0 sc_out sc_lv 10 signal 2 } 
	{ gate_1_ce0 sc_out sc_logic 1 signal 2 } 
	{ gate_1_q0 sc_in sc_lv 8 signal 2 } 
	{ gate_2_address0 sc_out sc_lv 10 signal 3 } 
	{ gate_2_ce0 sc_out sc_logic 1 signal 3 } 
	{ gate_2_q0 sc_in sc_lv 8 signal 3 } 
	{ gate_3_address0 sc_out sc_lv 10 signal 4 } 
	{ gate_3_ce0 sc_out sc_logic 1 signal 4 } 
	{ gate_3_q0 sc_in sc_lv 8 signal 4 } 
	{ gate_4_address0 sc_out sc_lv 10 signal 5 } 
	{ gate_4_ce0 sc_out sc_logic 1 signal 5 } 
	{ gate_4_q0 sc_in sc_lv 8 signal 5 } 
	{ gate_5_address0 sc_out sc_lv 10 signal 6 } 
	{ gate_5_ce0 sc_out sc_logic 1 signal 6 } 
	{ gate_5_q0 sc_in sc_lv 8 signal 6 } 
	{ gate_6_address0 sc_out sc_lv 10 signal 7 } 
	{ gate_6_ce0 sc_out sc_logic 1 signal 7 } 
	{ gate_6_q0 sc_in sc_lv 8 signal 7 } 
	{ gate_7_address0 sc_out sc_lv 10 signal 8 } 
	{ gate_7_ce0 sc_out sc_logic 1 signal 8 } 
	{ gate_7_q0 sc_in sc_lv 8 signal 8 } 
	{ tmp_87 sc_in sc_lv 2 signal 9 } 
	{ ql_buf_0_address0 sc_out sc_lv 5 signal 10 } 
	{ ql_buf_0_ce0 sc_out sc_logic 1 signal 10 } 
	{ ql_buf_0_q0 sc_in sc_lv 128 signal 10 } 
	{ ql_buf_1_address0 sc_out sc_lv 5 signal 11 } 
	{ ql_buf_1_ce0 sc_out sc_logic 1 signal 11 } 
	{ ql_buf_1_q0 sc_in sc_lv 128 signal 11 } 
	{ ql_buf_2_address0 sc_out sc_lv 5 signal 12 } 
	{ ql_buf_2_ce0 sc_out sc_logic 1 signal 12 } 
	{ ql_buf_2_q0 sc_in sc_lv 128 signal 12 } 
	{ ql_buf_3_address0 sc_out sc_lv 5 signal 13 } 
	{ ql_buf_3_ce0 sc_out sc_logic 1 signal 13 } 
	{ ql_buf_3_q0 sc_in sc_lv 128 signal 13 } 
	{ ql_buf_4_address0 sc_out sc_lv 5 signal 14 } 
	{ ql_buf_4_ce0 sc_out sc_logic 1 signal 14 } 
	{ ql_buf_4_q0 sc_in sc_lv 128 signal 14 } 
	{ ql_buf_5_address0 sc_out sc_lv 5 signal 15 } 
	{ ql_buf_5_ce0 sc_out sc_logic 1 signal 15 } 
	{ ql_buf_5_q0 sc_in sc_lv 128 signal 15 } 
	{ ql_buf_6_address0 sc_out sc_lv 5 signal 16 } 
	{ ql_buf_6_ce0 sc_out sc_logic 1 signal 16 } 
	{ ql_buf_6_q0 sc_in sc_lv 128 signal 16 } 
	{ ql_buf_7_address0 sc_out sc_lv 5 signal 17 } 
	{ ql_buf_7_ce0 sc_out sc_logic 1 signal 17 } 
	{ ql_buf_7_q0 sc_in sc_lv 128 signal 17 } 
	{ qh_buf_0_address0 sc_out sc_lv 4 signal 18 } 
	{ qh_buf_0_ce0 sc_out sc_logic 1 signal 18 } 
	{ qh_buf_0_q0 sc_in sc_lv 128 signal 18 } 
	{ qh_buf_1_address0 sc_out sc_lv 4 signal 19 } 
	{ qh_buf_1_ce0 sc_out sc_logic 1 signal 19 } 
	{ qh_buf_1_q0 sc_in sc_lv 128 signal 19 } 
	{ qh_buf_2_address0 sc_out sc_lv 4 signal 20 } 
	{ qh_buf_2_ce0 sc_out sc_logic 1 signal 20 } 
	{ qh_buf_2_q0 sc_in sc_lv 128 signal 20 } 
	{ qh_buf_3_address0 sc_out sc_lv 4 signal 21 } 
	{ qh_buf_3_ce0 sc_out sc_logic 1 signal 21 } 
	{ qh_buf_3_q0 sc_in sc_lv 128 signal 21 } 
	{ qh_buf_4_address0 sc_out sc_lv 4 signal 22 } 
	{ qh_buf_4_ce0 sc_out sc_logic 1 signal 22 } 
	{ qh_buf_4_q0 sc_in sc_lv 128 signal 22 } 
	{ qh_buf_5_address0 sc_out sc_lv 4 signal 23 } 
	{ qh_buf_5_ce0 sc_out sc_logic 1 signal 23 } 
	{ qh_buf_5_q0 sc_in sc_lv 128 signal 23 } 
	{ qh_buf_6_address0 sc_out sc_lv 4 signal 24 } 
	{ qh_buf_6_ce0 sc_out sc_logic 1 signal 24 } 
	{ qh_buf_6_q0 sc_in sc_lv 128 signal 24 } 
	{ qh_buf_7_address0 sc_out sc_lv 4 signal 25 } 
	{ qh_buf_7_ce0 sc_out sc_logic 1 signal 25 } 
	{ qh_buf_7_q0 sc_in sc_lv 128 signal 25 } 
	{ empty sc_in sc_lv 1 signal 26 } 
	{ tmp sc_in sc_lv 128 signal 27 } 
	{ tmp_s sc_in sc_lv 128 signal 28 } 
	{ tmp_65 sc_in sc_lv 128 signal 29 } 
	{ tmp_66 sc_in sc_lv 128 signal 30 } 
	{ acc_local_load_out sc_out sc_lv 32 signal 31 } 
	{ acc_local_load_out_ap_vld sc_out sc_logic 1 outvld 31 } 
	{ acc_local_1_load_out sc_out sc_lv 32 signal 32 } 
	{ acc_local_1_load_out_ap_vld sc_out sc_logic 1 outvld 32 } 
	{ acc_local_2_load_out sc_out sc_lv 32 signal 33 } 
	{ acc_local_2_load_out_ap_vld sc_out sc_logic 1 outvld 33 } 
	{ acc_local_3_load_out sc_out sc_lv 32 signal 34 } 
	{ acc_local_3_load_out_ap_vld sc_out sc_logic 1 outvld 34 } 
	{ acc_local_4_load_out sc_out sc_lv 32 signal 35 } 
	{ acc_local_4_load_out_ap_vld sc_out sc_logic 1 outvld 35 } 
	{ acc_local_5_load_out sc_out sc_lv 32 signal 36 } 
	{ acc_local_5_load_out_ap_vld sc_out sc_logic 1 outvld 36 } 
	{ acc_local_6_load_out sc_out sc_lv 32 signal 37 } 
	{ acc_local_6_load_out_ap_vld sc_out sc_logic 1 outvld 37 } 
	{ acc_local_7_load_out sc_out sc_lv 32 signal 38 } 
	{ acc_local_7_load_out_ap_vld sc_out sc_logic 1 outvld 38 } 
	{ acc_local_8_load_out sc_out sc_lv 32 signal 39 } 
	{ acc_local_8_load_out_ap_vld sc_out sc_logic 1 outvld 39 } 
	{ acc_local_9_load_out sc_out sc_lv 32 signal 40 } 
	{ acc_local_9_load_out_ap_vld sc_out sc_logic 1 outvld 40 } 
	{ acc_local_10_load_out sc_out sc_lv 32 signal 41 } 
	{ acc_local_10_load_out_ap_vld sc_out sc_logic 1 outvld 41 } 
	{ acc_local_11_load_out sc_out sc_lv 32 signal 42 } 
	{ acc_local_11_load_out_ap_vld sc_out sc_logic 1 outvld 42 } 
	{ acc_local_12_load_out sc_out sc_lv 32 signal 43 } 
	{ acc_local_12_load_out_ap_vld sc_out sc_logic 1 outvld 43 } 
	{ acc_local_13_load_out sc_out sc_lv 32 signal 44 } 
	{ acc_local_13_load_out_ap_vld sc_out sc_logic 1 outvld 44 } 
	{ acc_local_14_load_out sc_out sc_lv 32 signal 45 } 
	{ acc_local_14_load_out_ap_vld sc_out sc_logic 1 outvld 45 } 
	{ acc_local_15_load_out sc_out sc_lv 32 signal 46 } 
	{ acc_local_15_load_out_ap_vld sc_out sc_logic 1 outvld 46 } 
	{ acc_local_16_load_out sc_out sc_lv 32 signal 47 } 
	{ acc_local_16_load_out_ap_vld sc_out sc_logic 1 outvld 47 } 
	{ acc_local_17_load_out sc_out sc_lv 32 signal 48 } 
	{ acc_local_17_load_out_ap_vld sc_out sc_logic 1 outvld 48 } 
	{ acc_local_18_load_out sc_out sc_lv 32 signal 49 } 
	{ acc_local_18_load_out_ap_vld sc_out sc_logic 1 outvld 49 } 
	{ acc_local_19_load_out sc_out sc_lv 32 signal 50 } 
	{ acc_local_19_load_out_ap_vld sc_out sc_logic 1 outvld 50 } 
	{ acc_local_20_load_out sc_out sc_lv 32 signal 51 } 
	{ acc_local_20_load_out_ap_vld sc_out sc_logic 1 outvld 51 } 
	{ acc_local_21_load_out sc_out sc_lv 32 signal 52 } 
	{ acc_local_21_load_out_ap_vld sc_out sc_logic 1 outvld 52 } 
	{ acc_local_22_load_out sc_out sc_lv 32 signal 53 } 
	{ acc_local_22_load_out_ap_vld sc_out sc_logic 1 outvld 53 } 
	{ acc_local_23_load_out sc_out sc_lv 32 signal 54 } 
	{ acc_local_23_load_out_ap_vld sc_out sc_logic 1 outvld 54 } 
	{ acc_local_24_load_out sc_out sc_lv 32 signal 55 } 
	{ acc_local_24_load_out_ap_vld sc_out sc_logic 1 outvld 55 } 
	{ acc_local_25_load_out sc_out sc_lv 32 signal 56 } 
	{ acc_local_25_load_out_ap_vld sc_out sc_logic 1 outvld 56 } 
	{ acc_local_26_load_out sc_out sc_lv 32 signal 57 } 
	{ acc_local_26_load_out_ap_vld sc_out sc_logic 1 outvld 57 } 
	{ acc_local_27_load_out sc_out sc_lv 32 signal 58 } 
	{ acc_local_27_load_out_ap_vld sc_out sc_logic 1 outvld 58 } 
	{ acc_local_28_load_out sc_out sc_lv 32 signal 59 } 
	{ acc_local_28_load_out_ap_vld sc_out sc_logic 1 outvld 59 } 
	{ acc_local_29_load_out sc_out sc_lv 32 signal 60 } 
	{ acc_local_29_load_out_ap_vld sc_out sc_logic 1 outvld 60 } 
	{ acc_local_30_load_out sc_out sc_lv 32 signal 61 } 
	{ acc_local_30_load_out_ap_vld sc_out sc_logic 1 outvld 61 } 
	{ acc_local_31_load_out sc_out sc_lv 32 signal 62 } 
	{ acc_local_31_load_out_ap_vld sc_out sc_logic 1 outvld 62 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "zext_ln607", "direction": "in", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "zext_ln607", "role": "default" }} , 
 	{ "name": "gate_0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "gate_0", "role": "address0" }} , 
 	{ "name": "gate_0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gate_0", "role": "ce0" }} , 
 	{ "name": "gate_0_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "gate_0", "role": "q0" }} , 
 	{ "name": "gate_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "gate_1", "role": "address0" }} , 
 	{ "name": "gate_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gate_1", "role": "ce0" }} , 
 	{ "name": "gate_1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "gate_1", "role": "q0" }} , 
 	{ "name": "gate_2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "gate_2", "role": "address0" }} , 
 	{ "name": "gate_2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gate_2", "role": "ce0" }} , 
 	{ "name": "gate_2_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "gate_2", "role": "q0" }} , 
 	{ "name": "gate_3_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "gate_3", "role": "address0" }} , 
 	{ "name": "gate_3_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gate_3", "role": "ce0" }} , 
 	{ "name": "gate_3_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "gate_3", "role": "q0" }} , 
 	{ "name": "gate_4_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "gate_4", "role": "address0" }} , 
 	{ "name": "gate_4_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gate_4", "role": "ce0" }} , 
 	{ "name": "gate_4_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "gate_4", "role": "q0" }} , 
 	{ "name": "gate_5_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "gate_5", "role": "address0" }} , 
 	{ "name": "gate_5_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gate_5", "role": "ce0" }} , 
 	{ "name": "gate_5_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "gate_5", "role": "q0" }} , 
 	{ "name": "gate_6_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "gate_6", "role": "address0" }} , 
 	{ "name": "gate_6_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gate_6", "role": "ce0" }} , 
 	{ "name": "gate_6_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "gate_6", "role": "q0" }} , 
 	{ "name": "gate_7_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "gate_7", "role": "address0" }} , 
 	{ "name": "gate_7_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gate_7", "role": "ce0" }} , 
 	{ "name": "gate_7_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "gate_7", "role": "q0" }} , 
 	{ "name": "tmp_87", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "tmp_87", "role": "default" }} , 
 	{ "name": "ql_buf_0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "ql_buf_0", "role": "address0" }} , 
 	{ "name": "ql_buf_0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ql_buf_0", "role": "ce0" }} , 
 	{ "name": "ql_buf_0_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "ql_buf_0", "role": "q0" }} , 
 	{ "name": "ql_buf_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "ql_buf_1", "role": "address0" }} , 
 	{ "name": "ql_buf_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ql_buf_1", "role": "ce0" }} , 
 	{ "name": "ql_buf_1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "ql_buf_1", "role": "q0" }} , 
 	{ "name": "ql_buf_2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "ql_buf_2", "role": "address0" }} , 
 	{ "name": "ql_buf_2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ql_buf_2", "role": "ce0" }} , 
 	{ "name": "ql_buf_2_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "ql_buf_2", "role": "q0" }} , 
 	{ "name": "ql_buf_3_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "ql_buf_3", "role": "address0" }} , 
 	{ "name": "ql_buf_3_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ql_buf_3", "role": "ce0" }} , 
 	{ "name": "ql_buf_3_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "ql_buf_3", "role": "q0" }} , 
 	{ "name": "ql_buf_4_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "ql_buf_4", "role": "address0" }} , 
 	{ "name": "ql_buf_4_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ql_buf_4", "role": "ce0" }} , 
 	{ "name": "ql_buf_4_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "ql_buf_4", "role": "q0" }} , 
 	{ "name": "ql_buf_5_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "ql_buf_5", "role": "address0" }} , 
 	{ "name": "ql_buf_5_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ql_buf_5", "role": "ce0" }} , 
 	{ "name": "ql_buf_5_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "ql_buf_5", "role": "q0" }} , 
 	{ "name": "ql_buf_6_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "ql_buf_6", "role": "address0" }} , 
 	{ "name": "ql_buf_6_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ql_buf_6", "role": "ce0" }} , 
 	{ "name": "ql_buf_6_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "ql_buf_6", "role": "q0" }} , 
 	{ "name": "ql_buf_7_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "ql_buf_7", "role": "address0" }} , 
 	{ "name": "ql_buf_7_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ql_buf_7", "role": "ce0" }} , 
 	{ "name": "ql_buf_7_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "ql_buf_7", "role": "q0" }} , 
 	{ "name": "qh_buf_0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "qh_buf_0", "role": "address0" }} , 
 	{ "name": "qh_buf_0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "qh_buf_0", "role": "ce0" }} , 
 	{ "name": "qh_buf_0_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "qh_buf_0", "role": "q0" }} , 
 	{ "name": "qh_buf_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "qh_buf_1", "role": "address0" }} , 
 	{ "name": "qh_buf_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "qh_buf_1", "role": "ce0" }} , 
 	{ "name": "qh_buf_1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "qh_buf_1", "role": "q0" }} , 
 	{ "name": "qh_buf_2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "qh_buf_2", "role": "address0" }} , 
 	{ "name": "qh_buf_2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "qh_buf_2", "role": "ce0" }} , 
 	{ "name": "qh_buf_2_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "qh_buf_2", "role": "q0" }} , 
 	{ "name": "qh_buf_3_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "qh_buf_3", "role": "address0" }} , 
 	{ "name": "qh_buf_3_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "qh_buf_3", "role": "ce0" }} , 
 	{ "name": "qh_buf_3_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "qh_buf_3", "role": "q0" }} , 
 	{ "name": "qh_buf_4_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "qh_buf_4", "role": "address0" }} , 
 	{ "name": "qh_buf_4_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "qh_buf_4", "role": "ce0" }} , 
 	{ "name": "qh_buf_4_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "qh_buf_4", "role": "q0" }} , 
 	{ "name": "qh_buf_5_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "qh_buf_5", "role": "address0" }} , 
 	{ "name": "qh_buf_5_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "qh_buf_5", "role": "ce0" }} , 
 	{ "name": "qh_buf_5_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "qh_buf_5", "role": "q0" }} , 
 	{ "name": "qh_buf_6_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "qh_buf_6", "role": "address0" }} , 
 	{ "name": "qh_buf_6_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "qh_buf_6", "role": "ce0" }} , 
 	{ "name": "qh_buf_6_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "qh_buf_6", "role": "q0" }} , 
 	{ "name": "qh_buf_7_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "qh_buf_7", "role": "address0" }} , 
 	{ "name": "qh_buf_7_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "qh_buf_7", "role": "ce0" }} , 
 	{ "name": "qh_buf_7_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "qh_buf_7", "role": "q0" }} , 
 	{ "name": "empty", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "empty", "role": "default" }} , 
 	{ "name": "tmp", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "tmp", "role": "default" }} , 
 	{ "name": "tmp_s", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "tmp_s", "role": "default" }} , 
 	{ "name": "tmp_65", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "tmp_65", "role": "default" }} , 
 	{ "name": "tmp_66", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "tmp_66", "role": "default" }} , 
 	{ "name": "acc_local_load_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_local_load_out", "role": "default" }} , 
 	{ "name": "acc_local_load_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "acc_local_load_out", "role": "ap_vld" }} , 
 	{ "name": "acc_local_1_load_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_local_1_load_out", "role": "default" }} , 
 	{ "name": "acc_local_1_load_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "acc_local_1_load_out", "role": "ap_vld" }} , 
 	{ "name": "acc_local_2_load_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_local_2_load_out", "role": "default" }} , 
 	{ "name": "acc_local_2_load_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "acc_local_2_load_out", "role": "ap_vld" }} , 
 	{ "name": "acc_local_3_load_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_local_3_load_out", "role": "default" }} , 
 	{ "name": "acc_local_3_load_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "acc_local_3_load_out", "role": "ap_vld" }} , 
 	{ "name": "acc_local_4_load_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_local_4_load_out", "role": "default" }} , 
 	{ "name": "acc_local_4_load_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "acc_local_4_load_out", "role": "ap_vld" }} , 
 	{ "name": "acc_local_5_load_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_local_5_load_out", "role": "default" }} , 
 	{ "name": "acc_local_5_load_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "acc_local_5_load_out", "role": "ap_vld" }} , 
 	{ "name": "acc_local_6_load_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_local_6_load_out", "role": "default" }} , 
 	{ "name": "acc_local_6_load_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "acc_local_6_load_out", "role": "ap_vld" }} , 
 	{ "name": "acc_local_7_load_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_local_7_load_out", "role": "default" }} , 
 	{ "name": "acc_local_7_load_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "acc_local_7_load_out", "role": "ap_vld" }} , 
 	{ "name": "acc_local_8_load_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_local_8_load_out", "role": "default" }} , 
 	{ "name": "acc_local_8_load_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "acc_local_8_load_out", "role": "ap_vld" }} , 
 	{ "name": "acc_local_9_load_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_local_9_load_out", "role": "default" }} , 
 	{ "name": "acc_local_9_load_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "acc_local_9_load_out", "role": "ap_vld" }} , 
 	{ "name": "acc_local_10_load_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_local_10_load_out", "role": "default" }} , 
 	{ "name": "acc_local_10_load_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "acc_local_10_load_out", "role": "ap_vld" }} , 
 	{ "name": "acc_local_11_load_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_local_11_load_out", "role": "default" }} , 
 	{ "name": "acc_local_11_load_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "acc_local_11_load_out", "role": "ap_vld" }} , 
 	{ "name": "acc_local_12_load_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_local_12_load_out", "role": "default" }} , 
 	{ "name": "acc_local_12_load_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "acc_local_12_load_out", "role": "ap_vld" }} , 
 	{ "name": "acc_local_13_load_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_local_13_load_out", "role": "default" }} , 
 	{ "name": "acc_local_13_load_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "acc_local_13_load_out", "role": "ap_vld" }} , 
 	{ "name": "acc_local_14_load_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_local_14_load_out", "role": "default" }} , 
 	{ "name": "acc_local_14_load_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "acc_local_14_load_out", "role": "ap_vld" }} , 
 	{ "name": "acc_local_15_load_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_local_15_load_out", "role": "default" }} , 
 	{ "name": "acc_local_15_load_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "acc_local_15_load_out", "role": "ap_vld" }} , 
 	{ "name": "acc_local_16_load_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_local_16_load_out", "role": "default" }} , 
 	{ "name": "acc_local_16_load_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "acc_local_16_load_out", "role": "ap_vld" }} , 
 	{ "name": "acc_local_17_load_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_local_17_load_out", "role": "default" }} , 
 	{ "name": "acc_local_17_load_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "acc_local_17_load_out", "role": "ap_vld" }} , 
 	{ "name": "acc_local_18_load_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_local_18_load_out", "role": "default" }} , 
 	{ "name": "acc_local_18_load_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "acc_local_18_load_out", "role": "ap_vld" }} , 
 	{ "name": "acc_local_19_load_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_local_19_load_out", "role": "default" }} , 
 	{ "name": "acc_local_19_load_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "acc_local_19_load_out", "role": "ap_vld" }} , 
 	{ "name": "acc_local_20_load_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_local_20_load_out", "role": "default" }} , 
 	{ "name": "acc_local_20_load_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "acc_local_20_load_out", "role": "ap_vld" }} , 
 	{ "name": "acc_local_21_load_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_local_21_load_out", "role": "default" }} , 
 	{ "name": "acc_local_21_load_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "acc_local_21_load_out", "role": "ap_vld" }} , 
 	{ "name": "acc_local_22_load_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_local_22_load_out", "role": "default" }} , 
 	{ "name": "acc_local_22_load_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "acc_local_22_load_out", "role": "ap_vld" }} , 
 	{ "name": "acc_local_23_load_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_local_23_load_out", "role": "default" }} , 
 	{ "name": "acc_local_23_load_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "acc_local_23_load_out", "role": "ap_vld" }} , 
 	{ "name": "acc_local_24_load_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_local_24_load_out", "role": "default" }} , 
 	{ "name": "acc_local_24_load_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "acc_local_24_load_out", "role": "ap_vld" }} , 
 	{ "name": "acc_local_25_load_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_local_25_load_out", "role": "default" }} , 
 	{ "name": "acc_local_25_load_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "acc_local_25_load_out", "role": "ap_vld" }} , 
 	{ "name": "acc_local_26_load_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_local_26_load_out", "role": "default" }} , 
 	{ "name": "acc_local_26_load_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "acc_local_26_load_out", "role": "ap_vld" }} , 
 	{ "name": "acc_local_27_load_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_local_27_load_out", "role": "default" }} , 
 	{ "name": "acc_local_27_load_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "acc_local_27_load_out", "role": "ap_vld" }} , 
 	{ "name": "acc_local_28_load_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_local_28_load_out", "role": "default" }} , 
 	{ "name": "acc_local_28_load_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "acc_local_28_load_out", "role": "ap_vld" }} , 
 	{ "name": "acc_local_29_load_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_local_29_load_out", "role": "default" }} , 
 	{ "name": "acc_local_29_load_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "acc_local_29_load_out", "role": "ap_vld" }} , 
 	{ "name": "acc_local_30_load_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_local_30_load_out", "role": "default" }} , 
 	{ "name": "acc_local_30_load_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "acc_local_30_load_out", "role": "ap_vld" }} , 
 	{ "name": "acc_local_31_load_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_local_31_load_out", "role": "default" }} , 
 	{ "name": "acc_local_31_load_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "acc_local_31_load_out", "role": "ap_vld" }}  ]}

set ArgLastReadFirstWriteLatency {
	mac_blocks_down_q6k5_Pipeline_Q6K_MAC_GROUP {
		zext_ln607 {Type I LastRead 0 FirstWrite -1}
		gate_0 {Type I LastRead 1 FirstWrite -1}
		gate_1 {Type I LastRead 2 FirstWrite -1}
		gate_2 {Type I LastRead 2 FirstWrite -1}
		gate_3 {Type I LastRead 2 FirstWrite -1}
		gate_4 {Type I LastRead 1 FirstWrite -1}
		gate_5 {Type I LastRead 2 FirstWrite -1}
		gate_6 {Type I LastRead 2 FirstWrite -1}
		gate_7 {Type I LastRead 2 FirstWrite -1}
		tmp_87 {Type I LastRead 0 FirstWrite -1}
		ql_buf_0 {Type I LastRead 2 FirstWrite -1}
		ql_buf_1 {Type I LastRead 0 FirstWrite -1}
		ql_buf_2 {Type I LastRead 0 FirstWrite -1}
		ql_buf_3 {Type I LastRead 0 FirstWrite -1}
		ql_buf_4 {Type I LastRead 2 FirstWrite -1}
		ql_buf_5 {Type I LastRead 0 FirstWrite -1}
		ql_buf_6 {Type I LastRead 0 FirstWrite -1}
		ql_buf_7 {Type I LastRead 0 FirstWrite -1}
		qh_buf_0 {Type I LastRead 2 FirstWrite -1}
		qh_buf_1 {Type I LastRead 0 FirstWrite -1}
		qh_buf_2 {Type I LastRead 0 FirstWrite -1}
		qh_buf_3 {Type I LastRead 0 FirstWrite -1}
		qh_buf_4 {Type I LastRead 2 FirstWrite -1}
		qh_buf_5 {Type I LastRead 0 FirstWrite -1}
		qh_buf_6 {Type I LastRead 0 FirstWrite -1}
		qh_buf_7 {Type I LastRead 0 FirstWrite -1}
		empty {Type I LastRead 0 FirstWrite -1}
		tmp {Type I LastRead 0 FirstWrite -1}
		tmp_s {Type I LastRead 0 FirstWrite -1}
		tmp_65 {Type I LastRead 0 FirstWrite -1}
		tmp_66 {Type I LastRead 0 FirstWrite -1}
		acc_local_load_out {Type O LastRead -1 FirstWrite 6}
		acc_local_1_load_out {Type O LastRead -1 FirstWrite 6}
		acc_local_2_load_out {Type O LastRead -1 FirstWrite 6}
		acc_local_3_load_out {Type O LastRead -1 FirstWrite 6}
		acc_local_4_load_out {Type O LastRead -1 FirstWrite 6}
		acc_local_5_load_out {Type O LastRead -1 FirstWrite 6}
		acc_local_6_load_out {Type O LastRead -1 FirstWrite 6}
		acc_local_7_load_out {Type O LastRead -1 FirstWrite 6}
		acc_local_8_load_out {Type O LastRead -1 FirstWrite 6}
		acc_local_9_load_out {Type O LastRead -1 FirstWrite 6}
		acc_local_10_load_out {Type O LastRead -1 FirstWrite 6}
		acc_local_11_load_out {Type O LastRead -1 FirstWrite 6}
		acc_local_12_load_out {Type O LastRead -1 FirstWrite 6}
		acc_local_13_load_out {Type O LastRead -1 FirstWrite 6}
		acc_local_14_load_out {Type O LastRead -1 FirstWrite 6}
		acc_local_15_load_out {Type O LastRead -1 FirstWrite 6}
		acc_local_16_load_out {Type O LastRead -1 FirstWrite 6}
		acc_local_17_load_out {Type O LastRead -1 FirstWrite 6}
		acc_local_18_load_out {Type O LastRead -1 FirstWrite 6}
		acc_local_19_load_out {Type O LastRead -1 FirstWrite 6}
		acc_local_20_load_out {Type O LastRead -1 FirstWrite 6}
		acc_local_21_load_out {Type O LastRead -1 FirstWrite 6}
		acc_local_22_load_out {Type O LastRead -1 FirstWrite 6}
		acc_local_23_load_out {Type O LastRead -1 FirstWrite 6}
		acc_local_24_load_out {Type O LastRead -1 FirstWrite 6}
		acc_local_25_load_out {Type O LastRead -1 FirstWrite 6}
		acc_local_26_load_out {Type O LastRead -1 FirstWrite 6}
		acc_local_27_load_out {Type O LastRead -1 FirstWrite 6}
		acc_local_28_load_out {Type O LastRead -1 FirstWrite 6}
		acc_local_29_load_out {Type O LastRead -1 FirstWrite 6}
		acc_local_30_load_out {Type O LastRead -1 FirstWrite 6}
		acc_local_31_load_out {Type O LastRead -1 FirstWrite 6}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "264", "Max" : "264"}
	, {"Name" : "Interval", "Min" : "264", "Max" : "264"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	zext_ln607 { ap_none {  { zext_ln607 in_data 0 10 } } }
	gate_0 { ap_memory {  { gate_0_address0 mem_address 1 10 }  { gate_0_ce0 mem_ce 1 1 }  { gate_0_q0 mem_dout 0 8 } } }
	gate_1 { ap_memory {  { gate_1_address0 mem_address 1 10 }  { gate_1_ce0 mem_ce 1 1 }  { gate_1_q0 mem_dout 0 8 } } }
	gate_2 { ap_memory {  { gate_2_address0 mem_address 1 10 }  { gate_2_ce0 mem_ce 1 1 }  { gate_2_q0 mem_dout 0 8 } } }
	gate_3 { ap_memory {  { gate_3_address0 mem_address 1 10 }  { gate_3_ce0 mem_ce 1 1 }  { gate_3_q0 mem_dout 0 8 } } }
	gate_4 { ap_memory {  { gate_4_address0 mem_address 1 10 }  { gate_4_ce0 mem_ce 1 1 }  { gate_4_q0 mem_dout 0 8 } } }
	gate_5 { ap_memory {  { gate_5_address0 mem_address 1 10 }  { gate_5_ce0 mem_ce 1 1 }  { gate_5_q0 mem_dout 0 8 } } }
	gate_6 { ap_memory {  { gate_6_address0 mem_address 1 10 }  { gate_6_ce0 mem_ce 1 1 }  { gate_6_q0 mem_dout 0 8 } } }
	gate_7 { ap_memory {  { gate_7_address0 mem_address 1 10 }  { gate_7_ce0 mem_ce 1 1 }  { gate_7_q0 mem_dout 0 8 } } }
	tmp_87 { ap_none {  { tmp_87 in_data 0 2 } } }
	ql_buf_0 { ap_memory {  { ql_buf_0_address0 mem_address 1 5 }  { ql_buf_0_ce0 mem_ce 1 1 }  { ql_buf_0_q0 mem_dout 0 128 } } }
	ql_buf_1 { ap_memory {  { ql_buf_1_address0 mem_address 1 5 }  { ql_buf_1_ce0 mem_ce 1 1 }  { ql_buf_1_q0 mem_dout 0 128 } } }
	ql_buf_2 { ap_memory {  { ql_buf_2_address0 mem_address 1 5 }  { ql_buf_2_ce0 mem_ce 1 1 }  { ql_buf_2_q0 mem_dout 0 128 } } }
	ql_buf_3 { ap_memory {  { ql_buf_3_address0 mem_address 1 5 }  { ql_buf_3_ce0 mem_ce 1 1 }  { ql_buf_3_q0 mem_dout 0 128 } } }
	ql_buf_4 { ap_memory {  { ql_buf_4_address0 mem_address 1 5 }  { ql_buf_4_ce0 mem_ce 1 1 }  { ql_buf_4_q0 mem_dout 0 128 } } }
	ql_buf_5 { ap_memory {  { ql_buf_5_address0 mem_address 1 5 }  { ql_buf_5_ce0 mem_ce 1 1 }  { ql_buf_5_q0 mem_dout 0 128 } } }
	ql_buf_6 { ap_memory {  { ql_buf_6_address0 mem_address 1 5 }  { ql_buf_6_ce0 mem_ce 1 1 }  { ql_buf_6_q0 mem_dout 0 128 } } }
	ql_buf_7 { ap_memory {  { ql_buf_7_address0 mem_address 1 5 }  { ql_buf_7_ce0 mem_ce 1 1 }  { ql_buf_7_q0 mem_dout 0 128 } } }
	qh_buf_0 { ap_memory {  { qh_buf_0_address0 mem_address 1 4 }  { qh_buf_0_ce0 mem_ce 1 1 }  { qh_buf_0_q0 mem_dout 0 128 } } }
	qh_buf_1 { ap_memory {  { qh_buf_1_address0 mem_address 1 4 }  { qh_buf_1_ce0 mem_ce 1 1 }  { qh_buf_1_q0 mem_dout 0 128 } } }
	qh_buf_2 { ap_memory {  { qh_buf_2_address0 mem_address 1 4 }  { qh_buf_2_ce0 mem_ce 1 1 }  { qh_buf_2_q0 mem_dout 0 128 } } }
	qh_buf_3 { ap_memory {  { qh_buf_3_address0 mem_address 1 4 }  { qh_buf_3_ce0 mem_ce 1 1 }  { qh_buf_3_q0 mem_dout 0 128 } } }
	qh_buf_4 { ap_memory {  { qh_buf_4_address0 mem_address 1 4 }  { qh_buf_4_ce0 mem_ce 1 1 }  { qh_buf_4_q0 mem_dout 0 128 } } }
	qh_buf_5 { ap_memory {  { qh_buf_5_address0 mem_address 1 4 }  { qh_buf_5_ce0 mem_ce 1 1 }  { qh_buf_5_q0 mem_dout 0 128 } } }
	qh_buf_6 { ap_memory {  { qh_buf_6_address0 mem_address 1 4 }  { qh_buf_6_ce0 mem_ce 1 1 }  { qh_buf_6_q0 mem_dout 0 128 } } }
	qh_buf_7 { ap_memory {  { qh_buf_7_address0 mem_address 1 4 }  { qh_buf_7_ce0 mem_ce 1 1 }  { qh_buf_7_q0 mem_dout 0 128 } } }
	empty { ap_none {  { empty in_data 0 1 } } }
	tmp { ap_none {  { tmp in_data 0 128 } } }
	tmp_s { ap_none {  { tmp_s in_data 0 128 } } }
	tmp_65 { ap_none {  { tmp_65 in_data 0 128 } } }
	tmp_66 { ap_none {  { tmp_66 in_data 0 128 } } }
	acc_local_load_out { ap_vld {  { acc_local_load_out out_data 1 32 }  { acc_local_load_out_ap_vld out_vld 1 1 } } }
	acc_local_1_load_out { ap_vld {  { acc_local_1_load_out out_data 1 32 }  { acc_local_1_load_out_ap_vld out_vld 1 1 } } }
	acc_local_2_load_out { ap_vld {  { acc_local_2_load_out out_data 1 32 }  { acc_local_2_load_out_ap_vld out_vld 1 1 } } }
	acc_local_3_load_out { ap_vld {  { acc_local_3_load_out out_data 1 32 }  { acc_local_3_load_out_ap_vld out_vld 1 1 } } }
	acc_local_4_load_out { ap_vld {  { acc_local_4_load_out out_data 1 32 }  { acc_local_4_load_out_ap_vld out_vld 1 1 } } }
	acc_local_5_load_out { ap_vld {  { acc_local_5_load_out out_data 1 32 }  { acc_local_5_load_out_ap_vld out_vld 1 1 } } }
	acc_local_6_load_out { ap_vld {  { acc_local_6_load_out out_data 1 32 }  { acc_local_6_load_out_ap_vld out_vld 1 1 } } }
	acc_local_7_load_out { ap_vld {  { acc_local_7_load_out out_data 1 32 }  { acc_local_7_load_out_ap_vld out_vld 1 1 } } }
	acc_local_8_load_out { ap_vld {  { acc_local_8_load_out out_data 1 32 }  { acc_local_8_load_out_ap_vld out_vld 1 1 } } }
	acc_local_9_load_out { ap_vld {  { acc_local_9_load_out out_data 1 32 }  { acc_local_9_load_out_ap_vld out_vld 1 1 } } }
	acc_local_10_load_out { ap_vld {  { acc_local_10_load_out out_data 1 32 }  { acc_local_10_load_out_ap_vld out_vld 1 1 } } }
	acc_local_11_load_out { ap_vld {  { acc_local_11_load_out out_data 1 32 }  { acc_local_11_load_out_ap_vld out_vld 1 1 } } }
	acc_local_12_load_out { ap_vld {  { acc_local_12_load_out out_data 1 32 }  { acc_local_12_load_out_ap_vld out_vld 1 1 } } }
	acc_local_13_load_out { ap_vld {  { acc_local_13_load_out out_data 1 32 }  { acc_local_13_load_out_ap_vld out_vld 1 1 } } }
	acc_local_14_load_out { ap_vld {  { acc_local_14_load_out out_data 1 32 }  { acc_local_14_load_out_ap_vld out_vld 1 1 } } }
	acc_local_15_load_out { ap_vld {  { acc_local_15_load_out out_data 1 32 }  { acc_local_15_load_out_ap_vld out_vld 1 1 } } }
	acc_local_16_load_out { ap_vld {  { acc_local_16_load_out out_data 1 32 }  { acc_local_16_load_out_ap_vld out_vld 1 1 } } }
	acc_local_17_load_out { ap_vld {  { acc_local_17_load_out out_data 1 32 }  { acc_local_17_load_out_ap_vld out_vld 1 1 } } }
	acc_local_18_load_out { ap_vld {  { acc_local_18_load_out out_data 1 32 }  { acc_local_18_load_out_ap_vld out_vld 1 1 } } }
	acc_local_19_load_out { ap_vld {  { acc_local_19_load_out out_data 1 32 }  { acc_local_19_load_out_ap_vld out_vld 1 1 } } }
	acc_local_20_load_out { ap_vld {  { acc_local_20_load_out out_data 1 32 }  { acc_local_20_load_out_ap_vld out_vld 1 1 } } }
	acc_local_21_load_out { ap_vld {  { acc_local_21_load_out out_data 1 32 }  { acc_local_21_load_out_ap_vld out_vld 1 1 } } }
	acc_local_22_load_out { ap_vld {  { acc_local_22_load_out out_data 1 32 }  { acc_local_22_load_out_ap_vld out_vld 1 1 } } }
	acc_local_23_load_out { ap_vld {  { acc_local_23_load_out out_data 1 32 }  { acc_local_23_load_out_ap_vld out_vld 1 1 } } }
	acc_local_24_load_out { ap_vld {  { acc_local_24_load_out out_data 1 32 }  { acc_local_24_load_out_ap_vld out_vld 1 1 } } }
	acc_local_25_load_out { ap_vld {  { acc_local_25_load_out out_data 1 32 }  { acc_local_25_load_out_ap_vld out_vld 1 1 } } }
	acc_local_26_load_out { ap_vld {  { acc_local_26_load_out out_data 1 32 }  { acc_local_26_load_out_ap_vld out_vld 1 1 } } }
	acc_local_27_load_out { ap_vld {  { acc_local_27_load_out out_data 1 32 }  { acc_local_27_load_out_ap_vld out_vld 1 1 } } }
	acc_local_28_load_out { ap_vld {  { acc_local_28_load_out out_data 1 32 }  { acc_local_28_load_out_ap_vld out_vld 1 1 } } }
	acc_local_29_load_out { ap_vld {  { acc_local_29_load_out out_data 1 32 }  { acc_local_29_load_out_ap_vld out_vld 1 1 } } }
	acc_local_30_load_out { ap_vld {  { acc_local_30_load_out out_data 1 32 }  { acc_local_30_load_out_ap_vld out_vld 1 1 } } }
	acc_local_31_load_out { ap_vld {  { acc_local_31_load_out out_data 1 32 }  { acc_local_31_load_out_ap_vld out_vld 1 1 } } }
}
