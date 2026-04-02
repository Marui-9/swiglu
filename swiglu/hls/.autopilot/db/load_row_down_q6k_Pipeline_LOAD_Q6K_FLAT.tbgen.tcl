set moduleName load_row_down_q6k_Pipeline_LOAD_Q6K_FLAT
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
set cdfgNum 43
set C_modelName {load_row_down_q6k_Pipeline_LOAD_Q6K_FLAT}
set C_modelType { void 0 }
set ap_memory_interface_dict [dict create]
dict set ap_memory_interface_dict flat_30 { MEM_WIDTH 128 MEM_SIZE 432 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 0 }
dict set ap_memory_interface_dict flat_29 { MEM_WIDTH 128 MEM_SIZE 432 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 0 }
dict set ap_memory_interface_dict flat_28 { MEM_WIDTH 128 MEM_SIZE 432 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 0 }
dict set ap_memory_interface_dict flat_27 { MEM_WIDTH 128 MEM_SIZE 432 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 0 }
dict set ap_memory_interface_dict flat_26 { MEM_WIDTH 128 MEM_SIZE 432 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 0 }
dict set ap_memory_interface_dict flat_25 { MEM_WIDTH 128 MEM_SIZE 432 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 0 }
dict set ap_memory_interface_dict flat_24 { MEM_WIDTH 128 MEM_SIZE 432 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 0 }
dict set ap_memory_interface_dict flat_23 { MEM_WIDTH 128 MEM_SIZE 432 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 0 }
dict set ap_memory_interface_dict flat_22 { MEM_WIDTH 128 MEM_SIZE 432 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 0 }
dict set ap_memory_interface_dict flat_21 { MEM_WIDTH 128 MEM_SIZE 432 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 0 }
dict set ap_memory_interface_dict flat_20 { MEM_WIDTH 128 MEM_SIZE 432 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 0 }
dict set ap_memory_interface_dict flat_19 { MEM_WIDTH 128 MEM_SIZE 432 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 0 }
dict set ap_memory_interface_dict flat_18 { MEM_WIDTH 128 MEM_SIZE 432 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 0 }
dict set ap_memory_interface_dict flat_17 { MEM_WIDTH 128 MEM_SIZE 432 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 0 }
dict set ap_memory_interface_dict flat_16 { MEM_WIDTH 128 MEM_SIZE 432 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 0 }
dict set ap_memory_interface_dict flat { MEM_WIDTH 128 MEM_SIZE 432 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 0 }
set C_modelArgList {
	{ gmem_Wd int 128 regular {axi_master 0}  }
	{ sext_ln463 int 60 regular  }
	{ flat_30 int 128 regular {array 27 { 0 } 0 1 }  }
	{ flat_29 int 128 regular {array 27 { 0 } 0 1 }  }
	{ flat_28 int 128 regular {array 27 { 0 } 0 1 }  }
	{ flat_27 int 128 regular {array 27 { 0 } 0 1 }  }
	{ flat_26 int 128 regular {array 27 { 0 } 0 1 }  }
	{ flat_25 int 128 regular {array 27 { 0 } 0 1 }  }
	{ flat_24 int 128 regular {array 27 { 0 } 0 1 }  }
	{ flat_23 int 128 regular {array 27 { 0 } 0 1 }  }
	{ flat_22 int 128 regular {array 27 { 0 } 0 1 }  }
	{ flat_21 int 128 regular {array 27 { 0 } 0 1 }  }
	{ flat_20 int 128 regular {array 27 { 0 } 0 1 }  }
	{ flat_19 int 128 regular {array 27 { 0 } 0 1 }  }
	{ flat_18 int 128 regular {array 27 { 0 } 0 1 }  }
	{ flat_17 int 128 regular {array 27 { 0 } 0 1 }  }
	{ flat_16 int 128 regular {array 27 { 0 } 0 1 }  }
	{ flat int 128 regular {array 27 { 0 } 0 1 }  }
}
set hasAXIMCache 0
set l_AXIML2Cache [list]
set AXIMCacheInstDict [dict create]
set C_modelArgMapList {[ 
	{ "Name" : "gmem_Wd", "interface" : "axi_master", "bitwidth" : 128, "direction" : "READONLY", "bitSlice":[ {"cElement": [{"cName": "W_down","offset": { "type": "dynamic","port_name": "W_down","bundle": "CTRL"},"direction": "READONLY"}]}]} , 
 	{ "Name" : "sext_ln463", "interface" : "wire", "bitwidth" : 60, "direction" : "READONLY"} , 
 	{ "Name" : "flat_30", "interface" : "memory", "bitwidth" : 128, "direction" : "WRITEONLY"} , 
 	{ "Name" : "flat_29", "interface" : "memory", "bitwidth" : 128, "direction" : "WRITEONLY"} , 
 	{ "Name" : "flat_28", "interface" : "memory", "bitwidth" : 128, "direction" : "WRITEONLY"} , 
 	{ "Name" : "flat_27", "interface" : "memory", "bitwidth" : 128, "direction" : "WRITEONLY"} , 
 	{ "Name" : "flat_26", "interface" : "memory", "bitwidth" : 128, "direction" : "WRITEONLY"} , 
 	{ "Name" : "flat_25", "interface" : "memory", "bitwidth" : 128, "direction" : "WRITEONLY"} , 
 	{ "Name" : "flat_24", "interface" : "memory", "bitwidth" : 128, "direction" : "WRITEONLY"} , 
 	{ "Name" : "flat_23", "interface" : "memory", "bitwidth" : 128, "direction" : "WRITEONLY"} , 
 	{ "Name" : "flat_22", "interface" : "memory", "bitwidth" : 128, "direction" : "WRITEONLY"} , 
 	{ "Name" : "flat_21", "interface" : "memory", "bitwidth" : 128, "direction" : "WRITEONLY"} , 
 	{ "Name" : "flat_20", "interface" : "memory", "bitwidth" : 128, "direction" : "WRITEONLY"} , 
 	{ "Name" : "flat_19", "interface" : "memory", "bitwidth" : 128, "direction" : "WRITEONLY"} , 
 	{ "Name" : "flat_18", "interface" : "memory", "bitwidth" : 128, "direction" : "WRITEONLY"} , 
 	{ "Name" : "flat_17", "interface" : "memory", "bitwidth" : 128, "direction" : "WRITEONLY"} , 
 	{ "Name" : "flat_16", "interface" : "memory", "bitwidth" : 128, "direction" : "WRITEONLY"} , 
 	{ "Name" : "flat", "interface" : "memory", "bitwidth" : 128, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 117
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ m_axi_gmem_Wd_0_AWVALID sc_out sc_logic 1 signal 0 } 
	{ m_axi_gmem_Wd_0_AWREADY sc_in sc_logic 1 signal 0 } 
	{ m_axi_gmem_Wd_0_AWADDR sc_out sc_lv 64 signal 0 } 
	{ m_axi_gmem_Wd_0_AWID sc_out sc_lv 1 signal 0 } 
	{ m_axi_gmem_Wd_0_AWLEN sc_out sc_lv 32 signal 0 } 
	{ m_axi_gmem_Wd_0_AWSIZE sc_out sc_lv 3 signal 0 } 
	{ m_axi_gmem_Wd_0_AWBURST sc_out sc_lv 2 signal 0 } 
	{ m_axi_gmem_Wd_0_AWLOCK sc_out sc_lv 2 signal 0 } 
	{ m_axi_gmem_Wd_0_AWCACHE sc_out sc_lv 4 signal 0 } 
	{ m_axi_gmem_Wd_0_AWPROT sc_out sc_lv 3 signal 0 } 
	{ m_axi_gmem_Wd_0_AWQOS sc_out sc_lv 4 signal 0 } 
	{ m_axi_gmem_Wd_0_AWREGION sc_out sc_lv 4 signal 0 } 
	{ m_axi_gmem_Wd_0_AWUSER sc_out sc_lv 1 signal 0 } 
	{ m_axi_gmem_Wd_0_WVALID sc_out sc_logic 1 signal 0 } 
	{ m_axi_gmem_Wd_0_WREADY sc_in sc_logic 1 signal 0 } 
	{ m_axi_gmem_Wd_0_WDATA sc_out sc_lv 128 signal 0 } 
	{ m_axi_gmem_Wd_0_WSTRB sc_out sc_lv 16 signal 0 } 
	{ m_axi_gmem_Wd_0_WLAST sc_out sc_logic 1 signal 0 } 
	{ m_axi_gmem_Wd_0_WID sc_out sc_lv 1 signal 0 } 
	{ m_axi_gmem_Wd_0_WUSER sc_out sc_lv 1 signal 0 } 
	{ m_axi_gmem_Wd_0_ARVALID sc_out sc_logic 1 signal 0 } 
	{ m_axi_gmem_Wd_0_ARREADY sc_in sc_logic 1 signal 0 } 
	{ m_axi_gmem_Wd_0_ARADDR sc_out sc_lv 64 signal 0 } 
	{ m_axi_gmem_Wd_0_ARID sc_out sc_lv 1 signal 0 } 
	{ m_axi_gmem_Wd_0_ARLEN sc_out sc_lv 32 signal 0 } 
	{ m_axi_gmem_Wd_0_ARSIZE sc_out sc_lv 3 signal 0 } 
	{ m_axi_gmem_Wd_0_ARBURST sc_out sc_lv 2 signal 0 } 
	{ m_axi_gmem_Wd_0_ARLOCK sc_out sc_lv 2 signal 0 } 
	{ m_axi_gmem_Wd_0_ARCACHE sc_out sc_lv 4 signal 0 } 
	{ m_axi_gmem_Wd_0_ARPROT sc_out sc_lv 3 signal 0 } 
	{ m_axi_gmem_Wd_0_ARQOS sc_out sc_lv 4 signal 0 } 
	{ m_axi_gmem_Wd_0_ARREGION sc_out sc_lv 4 signal 0 } 
	{ m_axi_gmem_Wd_0_ARUSER sc_out sc_lv 1 signal 0 } 
	{ m_axi_gmem_Wd_0_RVALID sc_in sc_logic 1 signal 0 } 
	{ m_axi_gmem_Wd_0_RREADY sc_out sc_logic 1 signal 0 } 
	{ m_axi_gmem_Wd_0_RDATA sc_in sc_lv 128 signal 0 } 
	{ m_axi_gmem_Wd_0_RLAST sc_in sc_logic 1 signal 0 } 
	{ m_axi_gmem_Wd_0_RID sc_in sc_lv 1 signal 0 } 
	{ m_axi_gmem_Wd_0_RFIFONUM sc_in sc_lv 10 signal 0 } 
	{ m_axi_gmem_Wd_0_RUSER sc_in sc_lv 1 signal 0 } 
	{ m_axi_gmem_Wd_0_RRESP sc_in sc_lv 2 signal 0 } 
	{ m_axi_gmem_Wd_0_BVALID sc_in sc_logic 1 signal 0 } 
	{ m_axi_gmem_Wd_0_BREADY sc_out sc_logic 1 signal 0 } 
	{ m_axi_gmem_Wd_0_BRESP sc_in sc_lv 2 signal 0 } 
	{ m_axi_gmem_Wd_0_BID sc_in sc_lv 1 signal 0 } 
	{ m_axi_gmem_Wd_0_BUSER sc_in sc_lv 1 signal 0 } 
	{ sext_ln463 sc_in sc_lv 60 signal 1 } 
	{ flat_30_address0 sc_out sc_lv 5 signal 2 } 
	{ flat_30_ce0 sc_out sc_logic 1 signal 2 } 
	{ flat_30_we0 sc_out sc_logic 1 signal 2 } 
	{ flat_30_d0 sc_out sc_lv 128 signal 2 } 
	{ flat_29_address0 sc_out sc_lv 5 signal 3 } 
	{ flat_29_ce0 sc_out sc_logic 1 signal 3 } 
	{ flat_29_we0 sc_out sc_logic 1 signal 3 } 
	{ flat_29_d0 sc_out sc_lv 128 signal 3 } 
	{ flat_28_address0 sc_out sc_lv 5 signal 4 } 
	{ flat_28_ce0 sc_out sc_logic 1 signal 4 } 
	{ flat_28_we0 sc_out sc_logic 1 signal 4 } 
	{ flat_28_d0 sc_out sc_lv 128 signal 4 } 
	{ flat_27_address0 sc_out sc_lv 5 signal 5 } 
	{ flat_27_ce0 sc_out sc_logic 1 signal 5 } 
	{ flat_27_we0 sc_out sc_logic 1 signal 5 } 
	{ flat_27_d0 sc_out sc_lv 128 signal 5 } 
	{ flat_26_address0 sc_out sc_lv 5 signal 6 } 
	{ flat_26_ce0 sc_out sc_logic 1 signal 6 } 
	{ flat_26_we0 sc_out sc_logic 1 signal 6 } 
	{ flat_26_d0 sc_out sc_lv 128 signal 6 } 
	{ flat_25_address0 sc_out sc_lv 5 signal 7 } 
	{ flat_25_ce0 sc_out sc_logic 1 signal 7 } 
	{ flat_25_we0 sc_out sc_logic 1 signal 7 } 
	{ flat_25_d0 sc_out sc_lv 128 signal 7 } 
	{ flat_24_address0 sc_out sc_lv 5 signal 8 } 
	{ flat_24_ce0 sc_out sc_logic 1 signal 8 } 
	{ flat_24_we0 sc_out sc_logic 1 signal 8 } 
	{ flat_24_d0 sc_out sc_lv 128 signal 8 } 
	{ flat_23_address0 sc_out sc_lv 5 signal 9 } 
	{ flat_23_ce0 sc_out sc_logic 1 signal 9 } 
	{ flat_23_we0 sc_out sc_logic 1 signal 9 } 
	{ flat_23_d0 sc_out sc_lv 128 signal 9 } 
	{ flat_22_address0 sc_out sc_lv 5 signal 10 } 
	{ flat_22_ce0 sc_out sc_logic 1 signal 10 } 
	{ flat_22_we0 sc_out sc_logic 1 signal 10 } 
	{ flat_22_d0 sc_out sc_lv 128 signal 10 } 
	{ flat_21_address0 sc_out sc_lv 5 signal 11 } 
	{ flat_21_ce0 sc_out sc_logic 1 signal 11 } 
	{ flat_21_we0 sc_out sc_logic 1 signal 11 } 
	{ flat_21_d0 sc_out sc_lv 128 signal 11 } 
	{ flat_20_address0 sc_out sc_lv 5 signal 12 } 
	{ flat_20_ce0 sc_out sc_logic 1 signal 12 } 
	{ flat_20_we0 sc_out sc_logic 1 signal 12 } 
	{ flat_20_d0 sc_out sc_lv 128 signal 12 } 
	{ flat_19_address0 sc_out sc_lv 5 signal 13 } 
	{ flat_19_ce0 sc_out sc_logic 1 signal 13 } 
	{ flat_19_we0 sc_out sc_logic 1 signal 13 } 
	{ flat_19_d0 sc_out sc_lv 128 signal 13 } 
	{ flat_18_address0 sc_out sc_lv 5 signal 14 } 
	{ flat_18_ce0 sc_out sc_logic 1 signal 14 } 
	{ flat_18_we0 sc_out sc_logic 1 signal 14 } 
	{ flat_18_d0 sc_out sc_lv 128 signal 14 } 
	{ flat_17_address0 sc_out sc_lv 5 signal 15 } 
	{ flat_17_ce0 sc_out sc_logic 1 signal 15 } 
	{ flat_17_we0 sc_out sc_logic 1 signal 15 } 
	{ flat_17_d0 sc_out sc_lv 128 signal 15 } 
	{ flat_16_address0 sc_out sc_lv 5 signal 16 } 
	{ flat_16_ce0 sc_out sc_logic 1 signal 16 } 
	{ flat_16_we0 sc_out sc_logic 1 signal 16 } 
	{ flat_16_d0 sc_out sc_lv 128 signal 16 } 
	{ flat_address0 sc_out sc_lv 5 signal 17 } 
	{ flat_ce0 sc_out sc_logic 1 signal 17 } 
	{ flat_we0 sc_out sc_logic 1 signal 17 } 
	{ flat_d0 sc_out sc_lv 128 signal 17 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "m_axi_gmem_Wd_0_AWVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_Wd", "role": "0_AWVALID" }} , 
 	{ "name": "m_axi_gmem_Wd_0_AWREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_Wd", "role": "0_AWREADY" }} , 
 	{ "name": "m_axi_gmem_Wd_0_AWADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "gmem_Wd", "role": "0_AWADDR" }} , 
 	{ "name": "m_axi_gmem_Wd_0_AWID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_Wd", "role": "0_AWID" }} , 
 	{ "name": "m_axi_gmem_Wd_0_AWLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "gmem_Wd", "role": "0_AWLEN" }} , 
 	{ "name": "m_axi_gmem_Wd_0_AWSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "gmem_Wd", "role": "0_AWSIZE" }} , 
 	{ "name": "m_axi_gmem_Wd_0_AWBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem_Wd", "role": "0_AWBURST" }} , 
 	{ "name": "m_axi_gmem_Wd_0_AWLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem_Wd", "role": "0_AWLOCK" }} , 
 	{ "name": "m_axi_gmem_Wd_0_AWCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem_Wd", "role": "0_AWCACHE" }} , 
 	{ "name": "m_axi_gmem_Wd_0_AWPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "gmem_Wd", "role": "0_AWPROT" }} , 
 	{ "name": "m_axi_gmem_Wd_0_AWQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem_Wd", "role": "0_AWQOS" }} , 
 	{ "name": "m_axi_gmem_Wd_0_AWREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem_Wd", "role": "0_AWREGION" }} , 
 	{ "name": "m_axi_gmem_Wd_0_AWUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_Wd", "role": "0_AWUSER" }} , 
 	{ "name": "m_axi_gmem_Wd_0_WVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_Wd", "role": "0_WVALID" }} , 
 	{ "name": "m_axi_gmem_Wd_0_WREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_Wd", "role": "0_WREADY" }} , 
 	{ "name": "m_axi_gmem_Wd_0_WDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "gmem_Wd", "role": "0_WDATA" }} , 
 	{ "name": "m_axi_gmem_Wd_0_WSTRB", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "gmem_Wd", "role": "0_WSTRB" }} , 
 	{ "name": "m_axi_gmem_Wd_0_WLAST", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_Wd", "role": "0_WLAST" }} , 
 	{ "name": "m_axi_gmem_Wd_0_WID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_Wd", "role": "0_WID" }} , 
 	{ "name": "m_axi_gmem_Wd_0_WUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_Wd", "role": "0_WUSER" }} , 
 	{ "name": "m_axi_gmem_Wd_0_ARVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_Wd", "role": "0_ARVALID" }} , 
 	{ "name": "m_axi_gmem_Wd_0_ARREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_Wd", "role": "0_ARREADY" }} , 
 	{ "name": "m_axi_gmem_Wd_0_ARADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "gmem_Wd", "role": "0_ARADDR" }} , 
 	{ "name": "m_axi_gmem_Wd_0_ARID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_Wd", "role": "0_ARID" }} , 
 	{ "name": "m_axi_gmem_Wd_0_ARLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "gmem_Wd", "role": "0_ARLEN" }} , 
 	{ "name": "m_axi_gmem_Wd_0_ARSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "gmem_Wd", "role": "0_ARSIZE" }} , 
 	{ "name": "m_axi_gmem_Wd_0_ARBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem_Wd", "role": "0_ARBURST" }} , 
 	{ "name": "m_axi_gmem_Wd_0_ARLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem_Wd", "role": "0_ARLOCK" }} , 
 	{ "name": "m_axi_gmem_Wd_0_ARCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem_Wd", "role": "0_ARCACHE" }} , 
 	{ "name": "m_axi_gmem_Wd_0_ARPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "gmem_Wd", "role": "0_ARPROT" }} , 
 	{ "name": "m_axi_gmem_Wd_0_ARQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem_Wd", "role": "0_ARQOS" }} , 
 	{ "name": "m_axi_gmem_Wd_0_ARREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem_Wd", "role": "0_ARREGION" }} , 
 	{ "name": "m_axi_gmem_Wd_0_ARUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_Wd", "role": "0_ARUSER" }} , 
 	{ "name": "m_axi_gmem_Wd_0_RVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_Wd", "role": "0_RVALID" }} , 
 	{ "name": "m_axi_gmem_Wd_0_RREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_Wd", "role": "0_RREADY" }} , 
 	{ "name": "m_axi_gmem_Wd_0_RDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "gmem_Wd", "role": "0_RDATA" }} , 
 	{ "name": "m_axi_gmem_Wd_0_RLAST", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_Wd", "role": "0_RLAST" }} , 
 	{ "name": "m_axi_gmem_Wd_0_RID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_Wd", "role": "0_RID" }} , 
 	{ "name": "m_axi_gmem_Wd_0_RFIFONUM", "direction": "in", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "gmem_Wd", "role": "0_RFIFONUM" }} , 
 	{ "name": "m_axi_gmem_Wd_0_RUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_Wd", "role": "0_RUSER" }} , 
 	{ "name": "m_axi_gmem_Wd_0_RRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem_Wd", "role": "0_RRESP" }} , 
 	{ "name": "m_axi_gmem_Wd_0_BVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_Wd", "role": "0_BVALID" }} , 
 	{ "name": "m_axi_gmem_Wd_0_BREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_Wd", "role": "0_BREADY" }} , 
 	{ "name": "m_axi_gmem_Wd_0_BRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem_Wd", "role": "0_BRESP" }} , 
 	{ "name": "m_axi_gmem_Wd_0_BID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_Wd", "role": "0_BID" }} , 
 	{ "name": "m_axi_gmem_Wd_0_BUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_Wd", "role": "0_BUSER" }} , 
 	{ "name": "sext_ln463", "direction": "in", "datatype": "sc_lv", "bitwidth":60, "type": "signal", "bundle":{"name": "sext_ln463", "role": "default" }} , 
 	{ "name": "flat_30_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "flat_30", "role": "address0" }} , 
 	{ "name": "flat_30_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "flat_30", "role": "ce0" }} , 
 	{ "name": "flat_30_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "flat_30", "role": "we0" }} , 
 	{ "name": "flat_30_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "flat_30", "role": "d0" }} , 
 	{ "name": "flat_29_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "flat_29", "role": "address0" }} , 
 	{ "name": "flat_29_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "flat_29", "role": "ce0" }} , 
 	{ "name": "flat_29_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "flat_29", "role": "we0" }} , 
 	{ "name": "flat_29_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "flat_29", "role": "d0" }} , 
 	{ "name": "flat_28_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "flat_28", "role": "address0" }} , 
 	{ "name": "flat_28_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "flat_28", "role": "ce0" }} , 
 	{ "name": "flat_28_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "flat_28", "role": "we0" }} , 
 	{ "name": "flat_28_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "flat_28", "role": "d0" }} , 
 	{ "name": "flat_27_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "flat_27", "role": "address0" }} , 
 	{ "name": "flat_27_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "flat_27", "role": "ce0" }} , 
 	{ "name": "flat_27_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "flat_27", "role": "we0" }} , 
 	{ "name": "flat_27_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "flat_27", "role": "d0" }} , 
 	{ "name": "flat_26_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "flat_26", "role": "address0" }} , 
 	{ "name": "flat_26_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "flat_26", "role": "ce0" }} , 
 	{ "name": "flat_26_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "flat_26", "role": "we0" }} , 
 	{ "name": "flat_26_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "flat_26", "role": "d0" }} , 
 	{ "name": "flat_25_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "flat_25", "role": "address0" }} , 
 	{ "name": "flat_25_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "flat_25", "role": "ce0" }} , 
 	{ "name": "flat_25_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "flat_25", "role": "we0" }} , 
 	{ "name": "flat_25_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "flat_25", "role": "d0" }} , 
 	{ "name": "flat_24_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "flat_24", "role": "address0" }} , 
 	{ "name": "flat_24_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "flat_24", "role": "ce0" }} , 
 	{ "name": "flat_24_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "flat_24", "role": "we0" }} , 
 	{ "name": "flat_24_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "flat_24", "role": "d0" }} , 
 	{ "name": "flat_23_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "flat_23", "role": "address0" }} , 
 	{ "name": "flat_23_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "flat_23", "role": "ce0" }} , 
 	{ "name": "flat_23_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "flat_23", "role": "we0" }} , 
 	{ "name": "flat_23_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "flat_23", "role": "d0" }} , 
 	{ "name": "flat_22_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "flat_22", "role": "address0" }} , 
 	{ "name": "flat_22_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "flat_22", "role": "ce0" }} , 
 	{ "name": "flat_22_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "flat_22", "role": "we0" }} , 
 	{ "name": "flat_22_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "flat_22", "role": "d0" }} , 
 	{ "name": "flat_21_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "flat_21", "role": "address0" }} , 
 	{ "name": "flat_21_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "flat_21", "role": "ce0" }} , 
 	{ "name": "flat_21_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "flat_21", "role": "we0" }} , 
 	{ "name": "flat_21_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "flat_21", "role": "d0" }} , 
 	{ "name": "flat_20_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "flat_20", "role": "address0" }} , 
 	{ "name": "flat_20_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "flat_20", "role": "ce0" }} , 
 	{ "name": "flat_20_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "flat_20", "role": "we0" }} , 
 	{ "name": "flat_20_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "flat_20", "role": "d0" }} , 
 	{ "name": "flat_19_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "flat_19", "role": "address0" }} , 
 	{ "name": "flat_19_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "flat_19", "role": "ce0" }} , 
 	{ "name": "flat_19_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "flat_19", "role": "we0" }} , 
 	{ "name": "flat_19_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "flat_19", "role": "d0" }} , 
 	{ "name": "flat_18_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "flat_18", "role": "address0" }} , 
 	{ "name": "flat_18_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "flat_18", "role": "ce0" }} , 
 	{ "name": "flat_18_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "flat_18", "role": "we0" }} , 
 	{ "name": "flat_18_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "flat_18", "role": "d0" }} , 
 	{ "name": "flat_17_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "flat_17", "role": "address0" }} , 
 	{ "name": "flat_17_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "flat_17", "role": "ce0" }} , 
 	{ "name": "flat_17_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "flat_17", "role": "we0" }} , 
 	{ "name": "flat_17_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "flat_17", "role": "d0" }} , 
 	{ "name": "flat_16_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "flat_16", "role": "address0" }} , 
 	{ "name": "flat_16_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "flat_16", "role": "ce0" }} , 
 	{ "name": "flat_16_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "flat_16", "role": "we0" }} , 
 	{ "name": "flat_16_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "flat_16", "role": "d0" }} , 
 	{ "name": "flat_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "flat", "role": "address0" }} , 
 	{ "name": "flat_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "flat", "role": "ce0" }} , 
 	{ "name": "flat_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "flat", "role": "we0" }} , 
 	{ "name": "flat_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "flat", "role": "d0" }}  ]}

set ArgLastReadFirstWriteLatency {
	load_row_down_q6k_Pipeline_LOAD_Q6K_FLAT {
		gmem_Wd {Type I LastRead 1 FirstWrite -1}
		sext_ln463 {Type I LastRead 0 FirstWrite -1}
		flat_30 {Type O LastRead -1 FirstWrite 2}
		flat_29 {Type O LastRead -1 FirstWrite 2}
		flat_28 {Type O LastRead -1 FirstWrite 2}
		flat_27 {Type O LastRead -1 FirstWrite 2}
		flat_26 {Type O LastRead -1 FirstWrite 2}
		flat_25 {Type O LastRead -1 FirstWrite 2}
		flat_24 {Type O LastRead -1 FirstWrite 2}
		flat_23 {Type O LastRead -1 FirstWrite 2}
		flat_22 {Type O LastRead -1 FirstWrite 2}
		flat_21 {Type O LastRead -1 FirstWrite 2}
		flat_20 {Type O LastRead -1 FirstWrite 2}
		flat_19 {Type O LastRead -1 FirstWrite 2}
		flat_18 {Type O LastRead -1 FirstWrite 2}
		flat_17 {Type O LastRead -1 FirstWrite 2}
		flat_16 {Type O LastRead -1 FirstWrite 2}
		flat {Type O LastRead -1 FirstWrite 2}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "423", "Max" : "423"}
	, {"Name" : "Interval", "Min" : "423", "Max" : "423"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	 { m_axi {  { m_axi_gmem_Wd_0_AWVALID VALID 1 1 }  { m_axi_gmem_Wd_0_AWREADY READY 0 1 }  { m_axi_gmem_Wd_0_AWADDR ADDR 1 64 }  { m_axi_gmem_Wd_0_AWID ID 1 1 }  { m_axi_gmem_Wd_0_AWLEN SIZE 1 32 }  { m_axi_gmem_Wd_0_AWSIZE BURST 1 3 }  { m_axi_gmem_Wd_0_AWBURST LOCK 1 2 }  { m_axi_gmem_Wd_0_AWLOCK CACHE 1 2 }  { m_axi_gmem_Wd_0_AWCACHE PROT 1 4 }  { m_axi_gmem_Wd_0_AWPROT QOS 1 3 }  { m_axi_gmem_Wd_0_AWQOS REGION 1 4 }  { m_axi_gmem_Wd_0_AWREGION USER 1 4 }  { m_axi_gmem_Wd_0_AWUSER DATA 1 1 }  { m_axi_gmem_Wd_0_WVALID VALID 1 1 }  { m_axi_gmem_Wd_0_WREADY READY 0 1 }  { m_axi_gmem_Wd_0_WDATA FIFONUM 1 128 }  { m_axi_gmem_Wd_0_WSTRB STRB 1 16 }  { m_axi_gmem_Wd_0_WLAST LAST 1 1 }  { m_axi_gmem_Wd_0_WID ID 1 1 }  { m_axi_gmem_Wd_0_WUSER DATA 1 1 }  { m_axi_gmem_Wd_0_ARVALID VALID 1 1 }  { m_axi_gmem_Wd_0_ARREADY READY 0 1 }  { m_axi_gmem_Wd_0_ARADDR ADDR 1 64 }  { m_axi_gmem_Wd_0_ARID ID 1 1 }  { m_axi_gmem_Wd_0_ARLEN SIZE 1 32 }  { m_axi_gmem_Wd_0_ARSIZE BURST 1 3 }  { m_axi_gmem_Wd_0_ARBURST LOCK 1 2 }  { m_axi_gmem_Wd_0_ARLOCK CACHE 1 2 }  { m_axi_gmem_Wd_0_ARCACHE PROT 1 4 }  { m_axi_gmem_Wd_0_ARPROT QOS 1 3 }  { m_axi_gmem_Wd_0_ARQOS REGION 1 4 }  { m_axi_gmem_Wd_0_ARREGION USER 1 4 }  { m_axi_gmem_Wd_0_ARUSER DATA 1 1 }  { m_axi_gmem_Wd_0_RVALID VALID 0 1 }  { m_axi_gmem_Wd_0_RREADY READY 1 1 }  { m_axi_gmem_Wd_0_RDATA FIFONUM 0 128 }  { m_axi_gmem_Wd_0_RLAST LAST 0 1 }  { m_axi_gmem_Wd_0_RID ID 0 1 }  { m_axi_gmem_Wd_0_RFIFONUM LEN 0 10 }  { m_axi_gmem_Wd_0_RUSER DATA 0 1 }  { m_axi_gmem_Wd_0_RRESP RESP 0 2 }  { m_axi_gmem_Wd_0_BVALID VALID 0 1 }  { m_axi_gmem_Wd_0_BREADY READY 1 1 }  { m_axi_gmem_Wd_0_BRESP RESP 0 2 }  { m_axi_gmem_Wd_0_BID ID 0 1 }  { m_axi_gmem_Wd_0_BUSER DATA 0 1 } } }
	sext_ln463 { ap_none {  { sext_ln463 in_data 0 60 } } }
	flat_30 { ap_memory {  { flat_30_address0 mem_address 1 5 }  { flat_30_ce0 mem_ce 1 1 }  { flat_30_we0 mem_we 1 1 }  { flat_30_d0 mem_din 1 128 } } }
	flat_29 { ap_memory {  { flat_29_address0 mem_address 1 5 }  { flat_29_ce0 mem_ce 1 1 }  { flat_29_we0 mem_we 1 1 }  { flat_29_d0 mem_din 1 128 } } }
	flat_28 { ap_memory {  { flat_28_address0 mem_address 1 5 }  { flat_28_ce0 mem_ce 1 1 }  { flat_28_we0 mem_we 1 1 }  { flat_28_d0 mem_din 1 128 } } }
	flat_27 { ap_memory {  { flat_27_address0 mem_address 1 5 }  { flat_27_ce0 mem_ce 1 1 }  { flat_27_we0 mem_we 1 1 }  { flat_27_d0 mem_din 1 128 } } }
	flat_26 { ap_memory {  { flat_26_address0 mem_address 1 5 }  { flat_26_ce0 mem_ce 1 1 }  { flat_26_we0 mem_we 1 1 }  { flat_26_d0 mem_din 1 128 } } }
	flat_25 { ap_memory {  { flat_25_address0 mem_address 1 5 }  { flat_25_ce0 mem_ce 1 1 }  { flat_25_we0 mem_we 1 1 }  { flat_25_d0 mem_din 1 128 } } }
	flat_24 { ap_memory {  { flat_24_address0 mem_address 1 5 }  { flat_24_ce0 mem_ce 1 1 }  { flat_24_we0 mem_we 1 1 }  { flat_24_d0 mem_din 1 128 } } }
	flat_23 { ap_memory {  { flat_23_address0 mem_address 1 5 }  { flat_23_ce0 mem_ce 1 1 }  { flat_23_we0 mem_we 1 1 }  { flat_23_d0 mem_din 1 128 } } }
	flat_22 { ap_memory {  { flat_22_address0 mem_address 1 5 }  { flat_22_ce0 mem_ce 1 1 }  { flat_22_we0 mem_we 1 1 }  { flat_22_d0 mem_din 1 128 } } }
	flat_21 { ap_memory {  { flat_21_address0 mem_address 1 5 }  { flat_21_ce0 mem_ce 1 1 }  { flat_21_we0 mem_we 1 1 }  { flat_21_d0 mem_din 1 128 } } }
	flat_20 { ap_memory {  { flat_20_address0 mem_address 1 5 }  { flat_20_ce0 mem_ce 1 1 }  { flat_20_we0 mem_we 1 1 }  { flat_20_d0 mem_din 1 128 } } }
	flat_19 { ap_memory {  { flat_19_address0 mem_address 1 5 }  { flat_19_ce0 mem_ce 1 1 }  { flat_19_we0 mem_we 1 1 }  { flat_19_d0 mem_din 1 128 } } }
	flat_18 { ap_memory {  { flat_18_address0 mem_address 1 5 }  { flat_18_ce0 mem_ce 1 1 }  { flat_18_we0 mem_we 1 1 }  { flat_18_d0 mem_din 1 128 } } }
	flat_17 { ap_memory {  { flat_17_address0 mem_address 1 5 }  { flat_17_ce0 mem_ce 1 1 }  { flat_17_we0 mem_we 1 1 }  { flat_17_d0 mem_din 1 128 } } }
	flat_16 { ap_memory {  { flat_16_address0 mem_address 1 5 }  { flat_16_ce0 mem_ce 1 1 }  { flat_16_we0 mem_we 1 1 }  { flat_16_d0 mem_din 1 128 } } }
	flat { ap_memory {  { flat_address0 mem_address 1 5 }  { flat_ce0 mem_ce 1 1 }  { flat_we0 mem_we 1 1 }  { flat_d0 mem_din 1 128 } } }
}
