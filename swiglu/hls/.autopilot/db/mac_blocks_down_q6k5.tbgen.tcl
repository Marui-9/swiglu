set moduleName mac_blocks_down_q6k5
set isTopModule 0
set isCombinational 0
set isDatapathOnly 0
set isPipelined 0
set isPipelined_legacy 0
set pipeline_type none
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
set C_modelName {mac_blocks_down_q6k5}
set C_modelType { float 32 }
set ap_memory_interface_dict [dict create]
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
dict set ap_memory_interface_dict gate_0 { MEM_WIDTH 8 MEM_SIZE 1024 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict gate_1 { MEM_WIDTH 8 MEM_SIZE 1024 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict gate_2 { MEM_WIDTH 8 MEM_SIZE 1024 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict gate_3 { MEM_WIDTH 8 MEM_SIZE 1024 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict gate_4 { MEM_WIDTH 8 MEM_SIZE 1024 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict gate_5 { MEM_WIDTH 8 MEM_SIZE 1024 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict gate_6 { MEM_WIDTH 8 MEM_SIZE 1024 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict gate_7 { MEM_WIDTH 8 MEM_SIZE 1024 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
set C_modelArgList {
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
	{ sc_buf_0_val int 128 regular  }
	{ sc_buf_1_val int 128 regular  }
	{ sc_buf_2_val int 128 regular  }
	{ sc_buf_3_val int 128 regular  }
	{ sc_buf_4_val int 128 regular  }
	{ sc_buf_5_val int 128 regular  }
	{ sc_buf_6_val int 128 regular  }
	{ sc_buf_7_val int 128 regular  }
	{ sc_buf_8_val int 128 regular  }
	{ sc_buf_9_val int 128 regular  }
	{ sc_buf_10_val int 128 regular  }
	{ sc_buf_11_val int 128 regular  }
	{ sc_buf_12_val int 128 regular  }
	{ sc_buf_13_val int 128 regular  }
	{ sc_buf_14_val int 128 regular  }
	{ sc_buf_15_val int 128 regular  }
	{ sc_buf_16_val int 128 regular  }
	{ sc_buf_17_val int 128 regular  }
	{ sc_buf_18_val int 128 regular  }
	{ sc_buf_19_val int 128 regular  }
	{ sc_buf_20_val int 128 regular  }
	{ sc_buf_21_val int 128 regular  }
	{ sc_buf_22_val int 128 regular  }
	{ sc_buf_23_val int 128 regular  }
	{ sc_buf_24_val int 128 regular  }
	{ sc_buf_25_val int 128 regular  }
	{ sc_buf_26_val int 128 regular  }
	{ sc_buf_27_val int 128 regular  }
	{ sc_buf_28_val int 128 regular  }
	{ sc_buf_29_val int 128 regular  }
	{ sc_buf_30_val int 128 regular  }
	{ sc_buf_31_val int 128 regular  }
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
	{ gate_0 int 8 regular {array 1024 { 1 } 1 1 }  }
	{ gate_1 int 8 regular {array 1024 { 1 } 1 1 }  }
	{ gate_2 int 8 regular {array 1024 { 1 } 1 1 }  }
	{ gate_3 int 8 regular {array 1024 { 1 } 1 1 }  }
	{ gate_4 int 8 regular {array 1024 { 1 } 1 1 }  }
	{ gate_5 int 8 regular {array 1024 { 1 } 1 1 }  }
	{ gate_6 int 8 regular {array 1024 { 1 } 1 1 }  }
	{ gate_7 int 8 regular {array 1024 { 1 } 1 1 }  }
	{ gate_scale float 32 regular  }
}
set hasAXIMCache 0
set l_AXIML2Cache [list]
set AXIMCacheInstDict [dict create]
set C_modelArgMapList {[ 
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
 	{ "Name" : "sc_buf_0_val", "interface" : "wire", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "sc_buf_1_val", "interface" : "wire", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "sc_buf_2_val", "interface" : "wire", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "sc_buf_3_val", "interface" : "wire", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "sc_buf_4_val", "interface" : "wire", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "sc_buf_5_val", "interface" : "wire", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "sc_buf_6_val", "interface" : "wire", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "sc_buf_7_val", "interface" : "wire", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "sc_buf_8_val", "interface" : "wire", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "sc_buf_9_val", "interface" : "wire", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "sc_buf_10_val", "interface" : "wire", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "sc_buf_11_val", "interface" : "wire", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "sc_buf_12_val", "interface" : "wire", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "sc_buf_13_val", "interface" : "wire", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "sc_buf_14_val", "interface" : "wire", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "sc_buf_15_val", "interface" : "wire", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "sc_buf_16_val", "interface" : "wire", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "sc_buf_17_val", "interface" : "wire", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "sc_buf_18_val", "interface" : "wire", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "sc_buf_19_val", "interface" : "wire", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "sc_buf_20_val", "interface" : "wire", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "sc_buf_21_val", "interface" : "wire", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "sc_buf_22_val", "interface" : "wire", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "sc_buf_23_val", "interface" : "wire", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "sc_buf_24_val", "interface" : "wire", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "sc_buf_25_val", "interface" : "wire", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "sc_buf_26_val", "interface" : "wire", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "sc_buf_27_val", "interface" : "wire", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "sc_buf_28_val", "interface" : "wire", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "sc_buf_29_val", "interface" : "wire", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "sc_buf_30_val", "interface" : "wire", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "sc_buf_31_val", "interface" : "wire", "bitwidth" : 128, "direction" : "READONLY"} , 
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
 	{ "Name" : "gate_0", "interface" : "memory", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "gate_1", "interface" : "memory", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "gate_2", "interface" : "memory", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "gate_3", "interface" : "memory", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "gate_4", "interface" : "memory", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "gate_5", "interface" : "memory", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "gate_6", "interface" : "memory", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "gate_7", "interface" : "memory", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "gate_scale", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "ap_return", "interface" : "wire", "bitwidth" : 32} ]}
# RTL Port declarations: 
set portNum 144
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ ql_buf_0_address0 sc_out sc_lv 5 signal 0 } 
	{ ql_buf_0_ce0 sc_out sc_logic 1 signal 0 } 
	{ ql_buf_0_q0 sc_in sc_lv 128 signal 0 } 
	{ ql_buf_1_address0 sc_out sc_lv 5 signal 1 } 
	{ ql_buf_1_ce0 sc_out sc_logic 1 signal 1 } 
	{ ql_buf_1_q0 sc_in sc_lv 128 signal 1 } 
	{ ql_buf_2_address0 sc_out sc_lv 5 signal 2 } 
	{ ql_buf_2_ce0 sc_out sc_logic 1 signal 2 } 
	{ ql_buf_2_q0 sc_in sc_lv 128 signal 2 } 
	{ ql_buf_3_address0 sc_out sc_lv 5 signal 3 } 
	{ ql_buf_3_ce0 sc_out sc_logic 1 signal 3 } 
	{ ql_buf_3_q0 sc_in sc_lv 128 signal 3 } 
	{ ql_buf_4_address0 sc_out sc_lv 5 signal 4 } 
	{ ql_buf_4_ce0 sc_out sc_logic 1 signal 4 } 
	{ ql_buf_4_q0 sc_in sc_lv 128 signal 4 } 
	{ ql_buf_5_address0 sc_out sc_lv 5 signal 5 } 
	{ ql_buf_5_ce0 sc_out sc_logic 1 signal 5 } 
	{ ql_buf_5_q0 sc_in sc_lv 128 signal 5 } 
	{ ql_buf_6_address0 sc_out sc_lv 5 signal 6 } 
	{ ql_buf_6_ce0 sc_out sc_logic 1 signal 6 } 
	{ ql_buf_6_q0 sc_in sc_lv 128 signal 6 } 
	{ ql_buf_7_address0 sc_out sc_lv 5 signal 7 } 
	{ ql_buf_7_ce0 sc_out sc_logic 1 signal 7 } 
	{ ql_buf_7_q0 sc_in sc_lv 128 signal 7 } 
	{ qh_buf_0_address0 sc_out sc_lv 4 signal 8 } 
	{ qh_buf_0_ce0 sc_out sc_logic 1 signal 8 } 
	{ qh_buf_0_q0 sc_in sc_lv 128 signal 8 } 
	{ qh_buf_1_address0 sc_out sc_lv 4 signal 9 } 
	{ qh_buf_1_ce0 sc_out sc_logic 1 signal 9 } 
	{ qh_buf_1_q0 sc_in sc_lv 128 signal 9 } 
	{ qh_buf_2_address0 sc_out sc_lv 4 signal 10 } 
	{ qh_buf_2_ce0 sc_out sc_logic 1 signal 10 } 
	{ qh_buf_2_q0 sc_in sc_lv 128 signal 10 } 
	{ qh_buf_3_address0 sc_out sc_lv 4 signal 11 } 
	{ qh_buf_3_ce0 sc_out sc_logic 1 signal 11 } 
	{ qh_buf_3_q0 sc_in sc_lv 128 signal 11 } 
	{ qh_buf_4_address0 sc_out sc_lv 4 signal 12 } 
	{ qh_buf_4_ce0 sc_out sc_logic 1 signal 12 } 
	{ qh_buf_4_q0 sc_in sc_lv 128 signal 12 } 
	{ qh_buf_5_address0 sc_out sc_lv 4 signal 13 } 
	{ qh_buf_5_ce0 sc_out sc_logic 1 signal 13 } 
	{ qh_buf_5_q0 sc_in sc_lv 128 signal 13 } 
	{ qh_buf_6_address0 sc_out sc_lv 4 signal 14 } 
	{ qh_buf_6_ce0 sc_out sc_logic 1 signal 14 } 
	{ qh_buf_6_q0 sc_in sc_lv 128 signal 14 } 
	{ qh_buf_7_address0 sc_out sc_lv 4 signal 15 } 
	{ qh_buf_7_ce0 sc_out sc_logic 1 signal 15 } 
	{ qh_buf_7_q0 sc_in sc_lv 128 signal 15 } 
	{ sc_buf_0_val sc_in sc_lv 128 signal 16 } 
	{ sc_buf_1_val sc_in sc_lv 128 signal 17 } 
	{ sc_buf_2_val sc_in sc_lv 128 signal 18 } 
	{ sc_buf_3_val sc_in sc_lv 128 signal 19 } 
	{ sc_buf_4_val sc_in sc_lv 128 signal 20 } 
	{ sc_buf_5_val sc_in sc_lv 128 signal 21 } 
	{ sc_buf_6_val sc_in sc_lv 128 signal 22 } 
	{ sc_buf_7_val sc_in sc_lv 128 signal 23 } 
	{ sc_buf_8_val sc_in sc_lv 128 signal 24 } 
	{ sc_buf_9_val sc_in sc_lv 128 signal 25 } 
	{ sc_buf_10_val sc_in sc_lv 128 signal 26 } 
	{ sc_buf_11_val sc_in sc_lv 128 signal 27 } 
	{ sc_buf_12_val sc_in sc_lv 128 signal 28 } 
	{ sc_buf_13_val sc_in sc_lv 128 signal 29 } 
	{ sc_buf_14_val sc_in sc_lv 128 signal 30 } 
	{ sc_buf_15_val sc_in sc_lv 128 signal 31 } 
	{ sc_buf_16_val sc_in sc_lv 128 signal 32 } 
	{ sc_buf_17_val sc_in sc_lv 128 signal 33 } 
	{ sc_buf_18_val sc_in sc_lv 128 signal 34 } 
	{ sc_buf_19_val sc_in sc_lv 128 signal 35 } 
	{ sc_buf_20_val sc_in sc_lv 128 signal 36 } 
	{ sc_buf_21_val sc_in sc_lv 128 signal 37 } 
	{ sc_buf_22_val sc_in sc_lv 128 signal 38 } 
	{ sc_buf_23_val sc_in sc_lv 128 signal 39 } 
	{ sc_buf_24_val sc_in sc_lv 128 signal 40 } 
	{ sc_buf_25_val sc_in sc_lv 128 signal 41 } 
	{ sc_buf_26_val sc_in sc_lv 128 signal 42 } 
	{ sc_buf_27_val sc_in sc_lv 128 signal 43 } 
	{ sc_buf_28_val sc_in sc_lv 128 signal 44 } 
	{ sc_buf_29_val sc_in sc_lv 128 signal 45 } 
	{ sc_buf_30_val sc_in sc_lv 128 signal 46 } 
	{ sc_buf_31_val sc_in sc_lv 128 signal 47 } 
	{ d_buf_0_val sc_in sc_lv 32 signal 48 } 
	{ d_buf_1_val sc_in sc_lv 32 signal 49 } 
	{ d_buf_2_val sc_in sc_lv 32 signal 50 } 
	{ d_buf_3_val sc_in sc_lv 32 signal 51 } 
	{ d_buf_4_val sc_in sc_lv 32 signal 52 } 
	{ d_buf_5_val sc_in sc_lv 32 signal 53 } 
	{ d_buf_6_val sc_in sc_lv 32 signal 54 } 
	{ d_buf_7_val sc_in sc_lv 32 signal 55 } 
	{ d_buf_8_val sc_in sc_lv 32 signal 56 } 
	{ d_buf_9_val sc_in sc_lv 32 signal 57 } 
	{ d_buf_10_val sc_in sc_lv 32 signal 58 } 
	{ d_buf_11_val sc_in sc_lv 32 signal 59 } 
	{ d_buf_12_val sc_in sc_lv 32 signal 60 } 
	{ d_buf_13_val sc_in sc_lv 32 signal 61 } 
	{ d_buf_14_val sc_in sc_lv 32 signal 62 } 
	{ d_buf_15_val sc_in sc_lv 32 signal 63 } 
	{ d_buf_16_val sc_in sc_lv 32 signal 64 } 
	{ d_buf_17_val sc_in sc_lv 32 signal 65 } 
	{ d_buf_18_val sc_in sc_lv 32 signal 66 } 
	{ d_buf_19_val sc_in sc_lv 32 signal 67 } 
	{ d_buf_20_val sc_in sc_lv 32 signal 68 } 
	{ d_buf_21_val sc_in sc_lv 32 signal 69 } 
	{ d_buf_22_val sc_in sc_lv 32 signal 70 } 
	{ d_buf_23_val sc_in sc_lv 32 signal 71 } 
	{ d_buf_24_val sc_in sc_lv 32 signal 72 } 
	{ d_buf_25_val sc_in sc_lv 32 signal 73 } 
	{ d_buf_26_val sc_in sc_lv 32 signal 74 } 
	{ d_buf_27_val sc_in sc_lv 32 signal 75 } 
	{ d_buf_28_val sc_in sc_lv 32 signal 76 } 
	{ d_buf_29_val sc_in sc_lv 32 signal 77 } 
	{ d_buf_30_val sc_in sc_lv 32 signal 78 } 
	{ d_buf_31_val sc_in sc_lv 32 signal 79 } 
	{ gate_0_address0 sc_out sc_lv 10 signal 80 } 
	{ gate_0_ce0 sc_out sc_logic 1 signal 80 } 
	{ gate_0_q0 sc_in sc_lv 8 signal 80 } 
	{ gate_1_address0 sc_out sc_lv 10 signal 81 } 
	{ gate_1_ce0 sc_out sc_logic 1 signal 81 } 
	{ gate_1_q0 sc_in sc_lv 8 signal 81 } 
	{ gate_2_address0 sc_out sc_lv 10 signal 82 } 
	{ gate_2_ce0 sc_out sc_logic 1 signal 82 } 
	{ gate_2_q0 sc_in sc_lv 8 signal 82 } 
	{ gate_3_address0 sc_out sc_lv 10 signal 83 } 
	{ gate_3_ce0 sc_out sc_logic 1 signal 83 } 
	{ gate_3_q0 sc_in sc_lv 8 signal 83 } 
	{ gate_4_address0 sc_out sc_lv 10 signal 84 } 
	{ gate_4_ce0 sc_out sc_logic 1 signal 84 } 
	{ gate_4_q0 sc_in sc_lv 8 signal 84 } 
	{ gate_5_address0 sc_out sc_lv 10 signal 85 } 
	{ gate_5_ce0 sc_out sc_logic 1 signal 85 } 
	{ gate_5_q0 sc_in sc_lv 8 signal 85 } 
	{ gate_6_address0 sc_out sc_lv 10 signal 86 } 
	{ gate_6_ce0 sc_out sc_logic 1 signal 86 } 
	{ gate_6_q0 sc_in sc_lv 8 signal 86 } 
	{ gate_7_address0 sc_out sc_lv 10 signal 87 } 
	{ gate_7_ce0 sc_out sc_logic 1 signal 87 } 
	{ gate_7_q0 sc_in sc_lv 8 signal 87 } 
	{ gate_scale sc_in sc_lv 32 signal 88 } 
	{ ap_return sc_out sc_lv 32 signal -1 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
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
 	{ "name": "sc_buf_0_val", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "sc_buf_0_val", "role": "default" }} , 
 	{ "name": "sc_buf_1_val", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "sc_buf_1_val", "role": "default" }} , 
 	{ "name": "sc_buf_2_val", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "sc_buf_2_val", "role": "default" }} , 
 	{ "name": "sc_buf_3_val", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "sc_buf_3_val", "role": "default" }} , 
 	{ "name": "sc_buf_4_val", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "sc_buf_4_val", "role": "default" }} , 
 	{ "name": "sc_buf_5_val", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "sc_buf_5_val", "role": "default" }} , 
 	{ "name": "sc_buf_6_val", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "sc_buf_6_val", "role": "default" }} , 
 	{ "name": "sc_buf_7_val", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "sc_buf_7_val", "role": "default" }} , 
 	{ "name": "sc_buf_8_val", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "sc_buf_8_val", "role": "default" }} , 
 	{ "name": "sc_buf_9_val", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "sc_buf_9_val", "role": "default" }} , 
 	{ "name": "sc_buf_10_val", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "sc_buf_10_val", "role": "default" }} , 
 	{ "name": "sc_buf_11_val", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "sc_buf_11_val", "role": "default" }} , 
 	{ "name": "sc_buf_12_val", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "sc_buf_12_val", "role": "default" }} , 
 	{ "name": "sc_buf_13_val", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "sc_buf_13_val", "role": "default" }} , 
 	{ "name": "sc_buf_14_val", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "sc_buf_14_val", "role": "default" }} , 
 	{ "name": "sc_buf_15_val", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "sc_buf_15_val", "role": "default" }} , 
 	{ "name": "sc_buf_16_val", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "sc_buf_16_val", "role": "default" }} , 
 	{ "name": "sc_buf_17_val", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "sc_buf_17_val", "role": "default" }} , 
 	{ "name": "sc_buf_18_val", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "sc_buf_18_val", "role": "default" }} , 
 	{ "name": "sc_buf_19_val", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "sc_buf_19_val", "role": "default" }} , 
 	{ "name": "sc_buf_20_val", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "sc_buf_20_val", "role": "default" }} , 
 	{ "name": "sc_buf_21_val", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "sc_buf_21_val", "role": "default" }} , 
 	{ "name": "sc_buf_22_val", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "sc_buf_22_val", "role": "default" }} , 
 	{ "name": "sc_buf_23_val", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "sc_buf_23_val", "role": "default" }} , 
 	{ "name": "sc_buf_24_val", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "sc_buf_24_val", "role": "default" }} , 
 	{ "name": "sc_buf_25_val", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "sc_buf_25_val", "role": "default" }} , 
 	{ "name": "sc_buf_26_val", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "sc_buf_26_val", "role": "default" }} , 
 	{ "name": "sc_buf_27_val", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "sc_buf_27_val", "role": "default" }} , 
 	{ "name": "sc_buf_28_val", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "sc_buf_28_val", "role": "default" }} , 
 	{ "name": "sc_buf_29_val", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "sc_buf_29_val", "role": "default" }} , 
 	{ "name": "sc_buf_30_val", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "sc_buf_30_val", "role": "default" }} , 
 	{ "name": "sc_buf_31_val", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "sc_buf_31_val", "role": "default" }} , 
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
 	{ "name": "gate_scale", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "gate_scale", "role": "default" }} , 
 	{ "name": "ap_return", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ap_return", "role": "default" }}  ]}

set ArgLastReadFirstWriteLatency {
	mac_blocks_down_q6k5 {
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
		sc_buf_0_val {Type I LastRead 0 FirstWrite -1}
		sc_buf_1_val {Type I LastRead 0 FirstWrite -1}
		sc_buf_2_val {Type I LastRead 0 FirstWrite -1}
		sc_buf_3_val {Type I LastRead 0 FirstWrite -1}
		sc_buf_4_val {Type I LastRead 0 FirstWrite -1}
		sc_buf_5_val {Type I LastRead 0 FirstWrite -1}
		sc_buf_6_val {Type I LastRead 0 FirstWrite -1}
		sc_buf_7_val {Type I LastRead 0 FirstWrite -1}
		sc_buf_8_val {Type I LastRead 0 FirstWrite -1}
		sc_buf_9_val {Type I LastRead 0 FirstWrite -1}
		sc_buf_10_val {Type I LastRead 0 FirstWrite -1}
		sc_buf_11_val {Type I LastRead 0 FirstWrite -1}
		sc_buf_12_val {Type I LastRead 0 FirstWrite -1}
		sc_buf_13_val {Type I LastRead 0 FirstWrite -1}
		sc_buf_14_val {Type I LastRead 0 FirstWrite -1}
		sc_buf_15_val {Type I LastRead 0 FirstWrite -1}
		sc_buf_16_val {Type I LastRead 0 FirstWrite -1}
		sc_buf_17_val {Type I LastRead 0 FirstWrite -1}
		sc_buf_18_val {Type I LastRead 0 FirstWrite -1}
		sc_buf_19_val {Type I LastRead 0 FirstWrite -1}
		sc_buf_20_val {Type I LastRead 0 FirstWrite -1}
		sc_buf_21_val {Type I LastRead 0 FirstWrite -1}
		sc_buf_22_val {Type I LastRead 0 FirstWrite -1}
		sc_buf_23_val {Type I LastRead 0 FirstWrite -1}
		sc_buf_24_val {Type I LastRead 0 FirstWrite -1}
		sc_buf_25_val {Type I LastRead 0 FirstWrite -1}
		sc_buf_26_val {Type I LastRead 0 FirstWrite -1}
		sc_buf_27_val {Type I LastRead 0 FirstWrite -1}
		sc_buf_28_val {Type I LastRead 0 FirstWrite -1}
		sc_buf_29_val {Type I LastRead 0 FirstWrite -1}
		sc_buf_30_val {Type I LastRead 0 FirstWrite -1}
		sc_buf_31_val {Type I LastRead 0 FirstWrite -1}
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
		gate_0 {Type I LastRead 1 FirstWrite -1}
		gate_1 {Type I LastRead 2 FirstWrite -1}
		gate_2 {Type I LastRead 2 FirstWrite -1}
		gate_3 {Type I LastRead 2 FirstWrite -1}
		gate_4 {Type I LastRead 1 FirstWrite -1}
		gate_5 {Type I LastRead 2 FirstWrite -1}
		gate_6 {Type I LastRead 2 FirstWrite -1}
		gate_7 {Type I LastRead 2 FirstWrite -1}
		gate_scale {Type I LastRead 0 FirstWrite -1}}
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
		acc_local_31_load_out {Type O LastRead -1 FirstWrite 6}}
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
	{"Name" : "Latency", "Min" : "2283", "Max" : "2283"}
	, {"Name" : "Interval", "Min" : "2283", "Max" : "2283"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
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
	sc_buf_0_val { ap_none {  { sc_buf_0_val in_data 0 128 } } }
	sc_buf_1_val { ap_none {  { sc_buf_1_val in_data 0 128 } } }
	sc_buf_2_val { ap_none {  { sc_buf_2_val in_data 0 128 } } }
	sc_buf_3_val { ap_none {  { sc_buf_3_val in_data 0 128 } } }
	sc_buf_4_val { ap_none {  { sc_buf_4_val in_data 0 128 } } }
	sc_buf_5_val { ap_none {  { sc_buf_5_val in_data 0 128 } } }
	sc_buf_6_val { ap_none {  { sc_buf_6_val in_data 0 128 } } }
	sc_buf_7_val { ap_none {  { sc_buf_7_val in_data 0 128 } } }
	sc_buf_8_val { ap_none {  { sc_buf_8_val in_data 0 128 } } }
	sc_buf_9_val { ap_none {  { sc_buf_9_val in_data 0 128 } } }
	sc_buf_10_val { ap_none {  { sc_buf_10_val in_data 0 128 } } }
	sc_buf_11_val { ap_none {  { sc_buf_11_val in_data 0 128 } } }
	sc_buf_12_val { ap_none {  { sc_buf_12_val in_data 0 128 } } }
	sc_buf_13_val { ap_none {  { sc_buf_13_val in_data 0 128 } } }
	sc_buf_14_val { ap_none {  { sc_buf_14_val in_data 0 128 } } }
	sc_buf_15_val { ap_none {  { sc_buf_15_val in_data 0 128 } } }
	sc_buf_16_val { ap_none {  { sc_buf_16_val in_data 0 128 } } }
	sc_buf_17_val { ap_none {  { sc_buf_17_val in_data 0 128 } } }
	sc_buf_18_val { ap_none {  { sc_buf_18_val in_data 0 128 } } }
	sc_buf_19_val { ap_none {  { sc_buf_19_val in_data 0 128 } } }
	sc_buf_20_val { ap_none {  { sc_buf_20_val in_data 0 128 } } }
	sc_buf_21_val { ap_none {  { sc_buf_21_val in_data 0 128 } } }
	sc_buf_22_val { ap_none {  { sc_buf_22_val in_data 0 128 } } }
	sc_buf_23_val { ap_none {  { sc_buf_23_val in_data 0 128 } } }
	sc_buf_24_val { ap_none {  { sc_buf_24_val in_data 0 128 } } }
	sc_buf_25_val { ap_none {  { sc_buf_25_val in_data 0 128 } } }
	sc_buf_26_val { ap_none {  { sc_buf_26_val in_data 0 128 } } }
	sc_buf_27_val { ap_none {  { sc_buf_27_val in_data 0 128 } } }
	sc_buf_28_val { ap_none {  { sc_buf_28_val in_data 0 128 } } }
	sc_buf_29_val { ap_none {  { sc_buf_29_val in_data 0 128 } } }
	sc_buf_30_val { ap_none {  { sc_buf_30_val in_data 0 128 } } }
	sc_buf_31_val { ap_none {  { sc_buf_31_val in_data 0 128 } } }
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
	gate_0 { ap_memory {  { gate_0_address0 mem_address 1 10 }  { gate_0_ce0 mem_ce 1 1 }  { gate_0_q0 mem_dout 0 8 } } }
	gate_1 { ap_memory {  { gate_1_address0 mem_address 1 10 }  { gate_1_ce0 mem_ce 1 1 }  { gate_1_q0 mem_dout 0 8 } } }
	gate_2 { ap_memory {  { gate_2_address0 mem_address 1 10 }  { gate_2_ce0 mem_ce 1 1 }  { gate_2_q0 mem_dout 0 8 } } }
	gate_3 { ap_memory {  { gate_3_address0 mem_address 1 10 }  { gate_3_ce0 mem_ce 1 1 }  { gate_3_q0 mem_dout 0 8 } } }
	gate_4 { ap_memory {  { gate_4_address0 mem_address 1 10 }  { gate_4_ce0 mem_ce 1 1 }  { gate_4_q0 mem_dout 0 8 } } }
	gate_5 { ap_memory {  { gate_5_address0 mem_address 1 10 }  { gate_5_ce0 mem_ce 1 1 }  { gate_5_q0 mem_dout 0 8 } } }
	gate_6 { ap_memory {  { gate_6_address0 mem_address 1 10 }  { gate_6_ce0 mem_ce 1 1 }  { gate_6_q0 mem_dout 0 8 } } }
	gate_7 { ap_memory {  { gate_7_address0 mem_address 1 10 }  { gate_7_ce0 mem_ce 1 1 }  { gate_7_q0 mem_dout 0 8 } } }
	gate_scale { ap_none {  { gate_scale in_data 0 32 } } }
}
