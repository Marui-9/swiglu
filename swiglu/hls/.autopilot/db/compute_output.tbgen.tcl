set moduleName compute_output
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
set C_modelName {compute_output}
set C_modelType { void 0 }
set ap_memory_interface_dict [dict create]
dict set ap_memory_interface_dict gate_cache_0 { MEM_WIDTH 8 MEM_SIZE 1024 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict gate_cache_1 { MEM_WIDTH 8 MEM_SIZE 1024 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict gate_cache_2 { MEM_WIDTH 8 MEM_SIZE 1024 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict gate_cache_3 { MEM_WIDTH 8 MEM_SIZE 1024 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict gate_cache_4 { MEM_WIDTH 8 MEM_SIZE 1024 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict gate_cache_5 { MEM_WIDTH 8 MEM_SIZE 1024 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict gate_cache_6 { MEM_WIDTH 8 MEM_SIZE 1024 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict gate_cache_7 { MEM_WIDTH 8 MEM_SIZE 1024 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
set C_modelArgList {
	{ p_read float 32 regular  }
	{ gmem_Wd int 128 regular {axi_master 0}  }
	{ W_down int 64 regular  }
	{ gmem_Wd2 int 128 regular {axi_master 0}  }
	{ W_down2 int 64 regular  }
	{ gate_cache_0 int 8 regular {array 1024 { 1 } 1 1 }  }
	{ gate_cache_1 int 8 regular {array 1024 { 1 } 1 1 }  }
	{ gate_cache_2 int 8 regular {array 1024 { 1 } 1 1 }  }
	{ gate_cache_3 int 8 regular {array 1024 { 1 } 1 1 }  }
	{ gate_cache_4 int 8 regular {array 1024 { 1 } 1 1 }  }
	{ gate_cache_5 int 8 regular {array 1024 { 1 } 1 1 }  }
	{ gate_cache_6 int 8 regular {array 1024 { 1 } 1 1 }  }
	{ gate_cache_7 int 8 regular {array 1024 { 1 } 1 1 }  }
	{ gmem_out int 32 regular {axi_master 1}  }
	{ out_batch int 64 regular  }
	{ down_quant_mode int 32 regular  }
}
set hasAXIMCache 0
set l_AXIML2Cache [list]
set AXIMCacheInstDict [dict create]
set C_modelArgMapList {[ 
	{ "Name" : "p_read", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "gmem_Wd", "interface" : "axi_master", "bitwidth" : 128, "direction" : "READONLY", "bitSlice":[ {"cElement": [{"cName": "W_down","offset": { "type": "dynamic","port_name": "W_down","bundle": "CTRL"},"direction": "READONLY"}]}]} , 
 	{ "Name" : "W_down", "interface" : "wire", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "gmem_Wd2", "interface" : "axi_master", "bitwidth" : 128, "direction" : "READONLY", "bitSlice":[ {"cElement": [{"cName": "W_down2","offset": { "type": "dynamic","port_name": "W_down2","bundle": "CTRL"},"direction": "READONLY"}]}]} , 
 	{ "Name" : "W_down2", "interface" : "wire", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "gate_cache_0", "interface" : "memory", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "gate_cache_1", "interface" : "memory", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "gate_cache_2", "interface" : "memory", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "gate_cache_3", "interface" : "memory", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "gate_cache_4", "interface" : "memory", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "gate_cache_5", "interface" : "memory", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "gate_cache_6", "interface" : "memory", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "gate_cache_7", "interface" : "memory", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "gmem_out", "interface" : "axi_master", "bitwidth" : 32, "direction" : "WRITEONLY", "bitSlice":[ {"cElement": [{"cName": "out_batch","offset": { "type": "dynamic","port_name": "out_batch","bundle": "CTRL"},"direction": "WRITEONLY"}]}]} , 
 	{ "Name" : "out_batch", "interface" : "wire", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "down_quant_mode", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} ]}
# RTL Port declarations: 
set portNum 174
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_continue sc_in sc_logic 1 continue -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ p_read sc_in sc_lv 32 signal 0 } 
	{ m_axi_gmem_Wd_0_AWVALID sc_out sc_logic 1 signal 1 } 
	{ m_axi_gmem_Wd_0_AWREADY sc_in sc_logic 1 signal 1 } 
	{ m_axi_gmem_Wd_0_AWADDR sc_out sc_lv 64 signal 1 } 
	{ m_axi_gmem_Wd_0_AWID sc_out sc_lv 1 signal 1 } 
	{ m_axi_gmem_Wd_0_AWLEN sc_out sc_lv 32 signal 1 } 
	{ m_axi_gmem_Wd_0_AWSIZE sc_out sc_lv 3 signal 1 } 
	{ m_axi_gmem_Wd_0_AWBURST sc_out sc_lv 2 signal 1 } 
	{ m_axi_gmem_Wd_0_AWLOCK sc_out sc_lv 2 signal 1 } 
	{ m_axi_gmem_Wd_0_AWCACHE sc_out sc_lv 4 signal 1 } 
	{ m_axi_gmem_Wd_0_AWPROT sc_out sc_lv 3 signal 1 } 
	{ m_axi_gmem_Wd_0_AWQOS sc_out sc_lv 4 signal 1 } 
	{ m_axi_gmem_Wd_0_AWREGION sc_out sc_lv 4 signal 1 } 
	{ m_axi_gmem_Wd_0_AWUSER sc_out sc_lv 1 signal 1 } 
	{ m_axi_gmem_Wd_0_WVALID sc_out sc_logic 1 signal 1 } 
	{ m_axi_gmem_Wd_0_WREADY sc_in sc_logic 1 signal 1 } 
	{ m_axi_gmem_Wd_0_WDATA sc_out sc_lv 128 signal 1 } 
	{ m_axi_gmem_Wd_0_WSTRB sc_out sc_lv 16 signal 1 } 
	{ m_axi_gmem_Wd_0_WLAST sc_out sc_logic 1 signal 1 } 
	{ m_axi_gmem_Wd_0_WID sc_out sc_lv 1 signal 1 } 
	{ m_axi_gmem_Wd_0_WUSER sc_out sc_lv 1 signal 1 } 
	{ m_axi_gmem_Wd_0_ARVALID sc_out sc_logic 1 signal 1 } 
	{ m_axi_gmem_Wd_0_ARREADY sc_in sc_logic 1 signal 1 } 
	{ m_axi_gmem_Wd_0_ARADDR sc_out sc_lv 64 signal 1 } 
	{ m_axi_gmem_Wd_0_ARID sc_out sc_lv 1 signal 1 } 
	{ m_axi_gmem_Wd_0_ARLEN sc_out sc_lv 32 signal 1 } 
	{ m_axi_gmem_Wd_0_ARSIZE sc_out sc_lv 3 signal 1 } 
	{ m_axi_gmem_Wd_0_ARBURST sc_out sc_lv 2 signal 1 } 
	{ m_axi_gmem_Wd_0_ARLOCK sc_out sc_lv 2 signal 1 } 
	{ m_axi_gmem_Wd_0_ARCACHE sc_out sc_lv 4 signal 1 } 
	{ m_axi_gmem_Wd_0_ARPROT sc_out sc_lv 3 signal 1 } 
	{ m_axi_gmem_Wd_0_ARQOS sc_out sc_lv 4 signal 1 } 
	{ m_axi_gmem_Wd_0_ARREGION sc_out sc_lv 4 signal 1 } 
	{ m_axi_gmem_Wd_0_ARUSER sc_out sc_lv 1 signal 1 } 
	{ m_axi_gmem_Wd_0_RVALID sc_in sc_logic 1 signal 1 } 
	{ m_axi_gmem_Wd_0_RREADY sc_out sc_logic 1 signal 1 } 
	{ m_axi_gmem_Wd_0_RDATA sc_in sc_lv 128 signal 1 } 
	{ m_axi_gmem_Wd_0_RLAST sc_in sc_logic 1 signal 1 } 
	{ m_axi_gmem_Wd_0_RID sc_in sc_lv 1 signal 1 } 
	{ m_axi_gmem_Wd_0_RFIFONUM sc_in sc_lv 10 signal 1 } 
	{ m_axi_gmem_Wd_0_RUSER sc_in sc_lv 1 signal 1 } 
	{ m_axi_gmem_Wd_0_RRESP sc_in sc_lv 2 signal 1 } 
	{ m_axi_gmem_Wd_0_BVALID sc_in sc_logic 1 signal 1 } 
	{ m_axi_gmem_Wd_0_BREADY sc_out sc_logic 1 signal 1 } 
	{ m_axi_gmem_Wd_0_BRESP sc_in sc_lv 2 signal 1 } 
	{ m_axi_gmem_Wd_0_BID sc_in sc_lv 1 signal 1 } 
	{ m_axi_gmem_Wd_0_BUSER sc_in sc_lv 1 signal 1 } 
	{ W_down sc_in sc_lv 64 signal 2 } 
	{ m_axi_gmem_Wd2_0_AWVALID sc_out sc_logic 1 signal 3 } 
	{ m_axi_gmem_Wd2_0_AWREADY sc_in sc_logic 1 signal 3 } 
	{ m_axi_gmem_Wd2_0_AWADDR sc_out sc_lv 64 signal 3 } 
	{ m_axi_gmem_Wd2_0_AWID sc_out sc_lv 1 signal 3 } 
	{ m_axi_gmem_Wd2_0_AWLEN sc_out sc_lv 32 signal 3 } 
	{ m_axi_gmem_Wd2_0_AWSIZE sc_out sc_lv 3 signal 3 } 
	{ m_axi_gmem_Wd2_0_AWBURST sc_out sc_lv 2 signal 3 } 
	{ m_axi_gmem_Wd2_0_AWLOCK sc_out sc_lv 2 signal 3 } 
	{ m_axi_gmem_Wd2_0_AWCACHE sc_out sc_lv 4 signal 3 } 
	{ m_axi_gmem_Wd2_0_AWPROT sc_out sc_lv 3 signal 3 } 
	{ m_axi_gmem_Wd2_0_AWQOS sc_out sc_lv 4 signal 3 } 
	{ m_axi_gmem_Wd2_0_AWREGION sc_out sc_lv 4 signal 3 } 
	{ m_axi_gmem_Wd2_0_AWUSER sc_out sc_lv 1 signal 3 } 
	{ m_axi_gmem_Wd2_0_WVALID sc_out sc_logic 1 signal 3 } 
	{ m_axi_gmem_Wd2_0_WREADY sc_in sc_logic 1 signal 3 } 
	{ m_axi_gmem_Wd2_0_WDATA sc_out sc_lv 128 signal 3 } 
	{ m_axi_gmem_Wd2_0_WSTRB sc_out sc_lv 16 signal 3 } 
	{ m_axi_gmem_Wd2_0_WLAST sc_out sc_logic 1 signal 3 } 
	{ m_axi_gmem_Wd2_0_WID sc_out sc_lv 1 signal 3 } 
	{ m_axi_gmem_Wd2_0_WUSER sc_out sc_lv 1 signal 3 } 
	{ m_axi_gmem_Wd2_0_ARVALID sc_out sc_logic 1 signal 3 } 
	{ m_axi_gmem_Wd2_0_ARREADY sc_in sc_logic 1 signal 3 } 
	{ m_axi_gmem_Wd2_0_ARADDR sc_out sc_lv 64 signal 3 } 
	{ m_axi_gmem_Wd2_0_ARID sc_out sc_lv 1 signal 3 } 
	{ m_axi_gmem_Wd2_0_ARLEN sc_out sc_lv 32 signal 3 } 
	{ m_axi_gmem_Wd2_0_ARSIZE sc_out sc_lv 3 signal 3 } 
	{ m_axi_gmem_Wd2_0_ARBURST sc_out sc_lv 2 signal 3 } 
	{ m_axi_gmem_Wd2_0_ARLOCK sc_out sc_lv 2 signal 3 } 
	{ m_axi_gmem_Wd2_0_ARCACHE sc_out sc_lv 4 signal 3 } 
	{ m_axi_gmem_Wd2_0_ARPROT sc_out sc_lv 3 signal 3 } 
	{ m_axi_gmem_Wd2_0_ARQOS sc_out sc_lv 4 signal 3 } 
	{ m_axi_gmem_Wd2_0_ARREGION sc_out sc_lv 4 signal 3 } 
	{ m_axi_gmem_Wd2_0_ARUSER sc_out sc_lv 1 signal 3 } 
	{ m_axi_gmem_Wd2_0_RVALID sc_in sc_logic 1 signal 3 } 
	{ m_axi_gmem_Wd2_0_RREADY sc_out sc_logic 1 signal 3 } 
	{ m_axi_gmem_Wd2_0_RDATA sc_in sc_lv 128 signal 3 } 
	{ m_axi_gmem_Wd2_0_RLAST sc_in sc_logic 1 signal 3 } 
	{ m_axi_gmem_Wd2_0_RID sc_in sc_lv 1 signal 3 } 
	{ m_axi_gmem_Wd2_0_RFIFONUM sc_in sc_lv 10 signal 3 } 
	{ m_axi_gmem_Wd2_0_RUSER sc_in sc_lv 1 signal 3 } 
	{ m_axi_gmem_Wd2_0_RRESP sc_in sc_lv 2 signal 3 } 
	{ m_axi_gmem_Wd2_0_BVALID sc_in sc_logic 1 signal 3 } 
	{ m_axi_gmem_Wd2_0_BREADY sc_out sc_logic 1 signal 3 } 
	{ m_axi_gmem_Wd2_0_BRESP sc_in sc_lv 2 signal 3 } 
	{ m_axi_gmem_Wd2_0_BID sc_in sc_lv 1 signal 3 } 
	{ m_axi_gmem_Wd2_0_BUSER sc_in sc_lv 1 signal 3 } 
	{ W_down2 sc_in sc_lv 64 signal 4 } 
	{ gate_cache_0_address0 sc_out sc_lv 10 signal 5 } 
	{ gate_cache_0_ce0 sc_out sc_logic 1 signal 5 } 
	{ gate_cache_0_q0 sc_in sc_lv 8 signal 5 } 
	{ gate_cache_1_address0 sc_out sc_lv 10 signal 6 } 
	{ gate_cache_1_ce0 sc_out sc_logic 1 signal 6 } 
	{ gate_cache_1_q0 sc_in sc_lv 8 signal 6 } 
	{ gate_cache_2_address0 sc_out sc_lv 10 signal 7 } 
	{ gate_cache_2_ce0 sc_out sc_logic 1 signal 7 } 
	{ gate_cache_2_q0 sc_in sc_lv 8 signal 7 } 
	{ gate_cache_3_address0 sc_out sc_lv 10 signal 8 } 
	{ gate_cache_3_ce0 sc_out sc_logic 1 signal 8 } 
	{ gate_cache_3_q0 sc_in sc_lv 8 signal 8 } 
	{ gate_cache_4_address0 sc_out sc_lv 10 signal 9 } 
	{ gate_cache_4_ce0 sc_out sc_logic 1 signal 9 } 
	{ gate_cache_4_q0 sc_in sc_lv 8 signal 9 } 
	{ gate_cache_5_address0 sc_out sc_lv 10 signal 10 } 
	{ gate_cache_5_ce0 sc_out sc_logic 1 signal 10 } 
	{ gate_cache_5_q0 sc_in sc_lv 8 signal 10 } 
	{ gate_cache_6_address0 sc_out sc_lv 10 signal 11 } 
	{ gate_cache_6_ce0 sc_out sc_logic 1 signal 11 } 
	{ gate_cache_6_q0 sc_in sc_lv 8 signal 11 } 
	{ gate_cache_7_address0 sc_out sc_lv 10 signal 12 } 
	{ gate_cache_7_ce0 sc_out sc_logic 1 signal 12 } 
	{ gate_cache_7_q0 sc_in sc_lv 8 signal 12 } 
	{ m_axi_gmem_out_0_AWVALID sc_out sc_logic 1 signal 13 } 
	{ m_axi_gmem_out_0_AWREADY sc_in sc_logic 1 signal 13 } 
	{ m_axi_gmem_out_0_AWADDR sc_out sc_lv 64 signal 13 } 
	{ m_axi_gmem_out_0_AWID sc_out sc_lv 1 signal 13 } 
	{ m_axi_gmem_out_0_AWLEN sc_out sc_lv 32 signal 13 } 
	{ m_axi_gmem_out_0_AWSIZE sc_out sc_lv 3 signal 13 } 
	{ m_axi_gmem_out_0_AWBURST sc_out sc_lv 2 signal 13 } 
	{ m_axi_gmem_out_0_AWLOCK sc_out sc_lv 2 signal 13 } 
	{ m_axi_gmem_out_0_AWCACHE sc_out sc_lv 4 signal 13 } 
	{ m_axi_gmem_out_0_AWPROT sc_out sc_lv 3 signal 13 } 
	{ m_axi_gmem_out_0_AWQOS sc_out sc_lv 4 signal 13 } 
	{ m_axi_gmem_out_0_AWREGION sc_out sc_lv 4 signal 13 } 
	{ m_axi_gmem_out_0_AWUSER sc_out sc_lv 1 signal 13 } 
	{ m_axi_gmem_out_0_WVALID sc_out sc_logic 1 signal 13 } 
	{ m_axi_gmem_out_0_WREADY sc_in sc_logic 1 signal 13 } 
	{ m_axi_gmem_out_0_WDATA sc_out sc_lv 32 signal 13 } 
	{ m_axi_gmem_out_0_WSTRB sc_out sc_lv 4 signal 13 } 
	{ m_axi_gmem_out_0_WLAST sc_out sc_logic 1 signal 13 } 
	{ m_axi_gmem_out_0_WID sc_out sc_lv 1 signal 13 } 
	{ m_axi_gmem_out_0_WUSER sc_out sc_lv 1 signal 13 } 
	{ m_axi_gmem_out_0_ARVALID sc_out sc_logic 1 signal 13 } 
	{ m_axi_gmem_out_0_ARREADY sc_in sc_logic 1 signal 13 } 
	{ m_axi_gmem_out_0_ARADDR sc_out sc_lv 64 signal 13 } 
	{ m_axi_gmem_out_0_ARID sc_out sc_lv 1 signal 13 } 
	{ m_axi_gmem_out_0_ARLEN sc_out sc_lv 32 signal 13 } 
	{ m_axi_gmem_out_0_ARSIZE sc_out sc_lv 3 signal 13 } 
	{ m_axi_gmem_out_0_ARBURST sc_out sc_lv 2 signal 13 } 
	{ m_axi_gmem_out_0_ARLOCK sc_out sc_lv 2 signal 13 } 
	{ m_axi_gmem_out_0_ARCACHE sc_out sc_lv 4 signal 13 } 
	{ m_axi_gmem_out_0_ARPROT sc_out sc_lv 3 signal 13 } 
	{ m_axi_gmem_out_0_ARQOS sc_out sc_lv 4 signal 13 } 
	{ m_axi_gmem_out_0_ARREGION sc_out sc_lv 4 signal 13 } 
	{ m_axi_gmem_out_0_ARUSER sc_out sc_lv 1 signal 13 } 
	{ m_axi_gmem_out_0_RVALID sc_in sc_logic 1 signal 13 } 
	{ m_axi_gmem_out_0_RREADY sc_out sc_logic 1 signal 13 } 
	{ m_axi_gmem_out_0_RDATA sc_in sc_lv 32 signal 13 } 
	{ m_axi_gmem_out_0_RLAST sc_in sc_logic 1 signal 13 } 
	{ m_axi_gmem_out_0_RID sc_in sc_lv 1 signal 13 } 
	{ m_axi_gmem_out_0_RFIFONUM sc_in sc_lv 9 signal 13 } 
	{ m_axi_gmem_out_0_RUSER sc_in sc_lv 1 signal 13 } 
	{ m_axi_gmem_out_0_RRESP sc_in sc_lv 2 signal 13 } 
	{ m_axi_gmem_out_0_BVALID sc_in sc_logic 1 signal 13 } 
	{ m_axi_gmem_out_0_BREADY sc_out sc_logic 1 signal 13 } 
	{ m_axi_gmem_out_0_BRESP sc_in sc_lv 2 signal 13 } 
	{ m_axi_gmem_out_0_BID sc_in sc_lv 1 signal 13 } 
	{ m_axi_gmem_out_0_BUSER sc_in sc_lv 1 signal 13 } 
	{ out_batch sc_in sc_lv 64 signal 14 } 
	{ down_quant_mode sc_in sc_lv 32 signal 15 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_continue", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "continue", "bundle":{"name": "ap_continue", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "p_read", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "p_read", "role": "default" }} , 
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
 	{ "name": "W_down", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "W_down", "role": "default" }} , 
 	{ "name": "m_axi_gmem_Wd2_0_AWVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_Wd2", "role": "0_AWVALID" }} , 
 	{ "name": "m_axi_gmem_Wd2_0_AWREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_Wd2", "role": "0_AWREADY" }} , 
 	{ "name": "m_axi_gmem_Wd2_0_AWADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "gmem_Wd2", "role": "0_AWADDR" }} , 
 	{ "name": "m_axi_gmem_Wd2_0_AWID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_Wd2", "role": "0_AWID" }} , 
 	{ "name": "m_axi_gmem_Wd2_0_AWLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "gmem_Wd2", "role": "0_AWLEN" }} , 
 	{ "name": "m_axi_gmem_Wd2_0_AWSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "gmem_Wd2", "role": "0_AWSIZE" }} , 
 	{ "name": "m_axi_gmem_Wd2_0_AWBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem_Wd2", "role": "0_AWBURST" }} , 
 	{ "name": "m_axi_gmem_Wd2_0_AWLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem_Wd2", "role": "0_AWLOCK" }} , 
 	{ "name": "m_axi_gmem_Wd2_0_AWCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem_Wd2", "role": "0_AWCACHE" }} , 
 	{ "name": "m_axi_gmem_Wd2_0_AWPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "gmem_Wd2", "role": "0_AWPROT" }} , 
 	{ "name": "m_axi_gmem_Wd2_0_AWQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem_Wd2", "role": "0_AWQOS" }} , 
 	{ "name": "m_axi_gmem_Wd2_0_AWREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem_Wd2", "role": "0_AWREGION" }} , 
 	{ "name": "m_axi_gmem_Wd2_0_AWUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_Wd2", "role": "0_AWUSER" }} , 
 	{ "name": "m_axi_gmem_Wd2_0_WVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_Wd2", "role": "0_WVALID" }} , 
 	{ "name": "m_axi_gmem_Wd2_0_WREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_Wd2", "role": "0_WREADY" }} , 
 	{ "name": "m_axi_gmem_Wd2_0_WDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "gmem_Wd2", "role": "0_WDATA" }} , 
 	{ "name": "m_axi_gmem_Wd2_0_WSTRB", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "gmem_Wd2", "role": "0_WSTRB" }} , 
 	{ "name": "m_axi_gmem_Wd2_0_WLAST", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_Wd2", "role": "0_WLAST" }} , 
 	{ "name": "m_axi_gmem_Wd2_0_WID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_Wd2", "role": "0_WID" }} , 
 	{ "name": "m_axi_gmem_Wd2_0_WUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_Wd2", "role": "0_WUSER" }} , 
 	{ "name": "m_axi_gmem_Wd2_0_ARVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_Wd2", "role": "0_ARVALID" }} , 
 	{ "name": "m_axi_gmem_Wd2_0_ARREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_Wd2", "role": "0_ARREADY" }} , 
 	{ "name": "m_axi_gmem_Wd2_0_ARADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "gmem_Wd2", "role": "0_ARADDR" }} , 
 	{ "name": "m_axi_gmem_Wd2_0_ARID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_Wd2", "role": "0_ARID" }} , 
 	{ "name": "m_axi_gmem_Wd2_0_ARLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "gmem_Wd2", "role": "0_ARLEN" }} , 
 	{ "name": "m_axi_gmem_Wd2_0_ARSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "gmem_Wd2", "role": "0_ARSIZE" }} , 
 	{ "name": "m_axi_gmem_Wd2_0_ARBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem_Wd2", "role": "0_ARBURST" }} , 
 	{ "name": "m_axi_gmem_Wd2_0_ARLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem_Wd2", "role": "0_ARLOCK" }} , 
 	{ "name": "m_axi_gmem_Wd2_0_ARCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem_Wd2", "role": "0_ARCACHE" }} , 
 	{ "name": "m_axi_gmem_Wd2_0_ARPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "gmem_Wd2", "role": "0_ARPROT" }} , 
 	{ "name": "m_axi_gmem_Wd2_0_ARQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem_Wd2", "role": "0_ARQOS" }} , 
 	{ "name": "m_axi_gmem_Wd2_0_ARREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem_Wd2", "role": "0_ARREGION" }} , 
 	{ "name": "m_axi_gmem_Wd2_0_ARUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_Wd2", "role": "0_ARUSER" }} , 
 	{ "name": "m_axi_gmem_Wd2_0_RVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_Wd2", "role": "0_RVALID" }} , 
 	{ "name": "m_axi_gmem_Wd2_0_RREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_Wd2", "role": "0_RREADY" }} , 
 	{ "name": "m_axi_gmem_Wd2_0_RDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "gmem_Wd2", "role": "0_RDATA" }} , 
 	{ "name": "m_axi_gmem_Wd2_0_RLAST", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_Wd2", "role": "0_RLAST" }} , 
 	{ "name": "m_axi_gmem_Wd2_0_RID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_Wd2", "role": "0_RID" }} , 
 	{ "name": "m_axi_gmem_Wd2_0_RFIFONUM", "direction": "in", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "gmem_Wd2", "role": "0_RFIFONUM" }} , 
 	{ "name": "m_axi_gmem_Wd2_0_RUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_Wd2", "role": "0_RUSER" }} , 
 	{ "name": "m_axi_gmem_Wd2_0_RRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem_Wd2", "role": "0_RRESP" }} , 
 	{ "name": "m_axi_gmem_Wd2_0_BVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_Wd2", "role": "0_BVALID" }} , 
 	{ "name": "m_axi_gmem_Wd2_0_BREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_Wd2", "role": "0_BREADY" }} , 
 	{ "name": "m_axi_gmem_Wd2_0_BRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem_Wd2", "role": "0_BRESP" }} , 
 	{ "name": "m_axi_gmem_Wd2_0_BID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_Wd2", "role": "0_BID" }} , 
 	{ "name": "m_axi_gmem_Wd2_0_BUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_Wd2", "role": "0_BUSER" }} , 
 	{ "name": "W_down2", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "W_down2", "role": "default" }} , 
 	{ "name": "gate_cache_0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "gate_cache_0", "role": "address0" }} , 
 	{ "name": "gate_cache_0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gate_cache_0", "role": "ce0" }} , 
 	{ "name": "gate_cache_0_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "gate_cache_0", "role": "q0" }} , 
 	{ "name": "gate_cache_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "gate_cache_1", "role": "address0" }} , 
 	{ "name": "gate_cache_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gate_cache_1", "role": "ce0" }} , 
 	{ "name": "gate_cache_1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "gate_cache_1", "role": "q0" }} , 
 	{ "name": "gate_cache_2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "gate_cache_2", "role": "address0" }} , 
 	{ "name": "gate_cache_2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gate_cache_2", "role": "ce0" }} , 
 	{ "name": "gate_cache_2_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "gate_cache_2", "role": "q0" }} , 
 	{ "name": "gate_cache_3_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "gate_cache_3", "role": "address0" }} , 
 	{ "name": "gate_cache_3_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gate_cache_3", "role": "ce0" }} , 
 	{ "name": "gate_cache_3_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "gate_cache_3", "role": "q0" }} , 
 	{ "name": "gate_cache_4_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "gate_cache_4", "role": "address0" }} , 
 	{ "name": "gate_cache_4_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gate_cache_4", "role": "ce0" }} , 
 	{ "name": "gate_cache_4_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "gate_cache_4", "role": "q0" }} , 
 	{ "name": "gate_cache_5_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "gate_cache_5", "role": "address0" }} , 
 	{ "name": "gate_cache_5_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gate_cache_5", "role": "ce0" }} , 
 	{ "name": "gate_cache_5_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "gate_cache_5", "role": "q0" }} , 
 	{ "name": "gate_cache_6_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "gate_cache_6", "role": "address0" }} , 
 	{ "name": "gate_cache_6_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gate_cache_6", "role": "ce0" }} , 
 	{ "name": "gate_cache_6_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "gate_cache_6", "role": "q0" }} , 
 	{ "name": "gate_cache_7_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "gate_cache_7", "role": "address0" }} , 
 	{ "name": "gate_cache_7_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gate_cache_7", "role": "ce0" }} , 
 	{ "name": "gate_cache_7_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "gate_cache_7", "role": "q0" }} , 
 	{ "name": "m_axi_gmem_out_0_AWVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_out", "role": "0_AWVALID" }} , 
 	{ "name": "m_axi_gmem_out_0_AWREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_out", "role": "0_AWREADY" }} , 
 	{ "name": "m_axi_gmem_out_0_AWADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "gmem_out", "role": "0_AWADDR" }} , 
 	{ "name": "m_axi_gmem_out_0_AWID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_out", "role": "0_AWID" }} , 
 	{ "name": "m_axi_gmem_out_0_AWLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "gmem_out", "role": "0_AWLEN" }} , 
 	{ "name": "m_axi_gmem_out_0_AWSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "gmem_out", "role": "0_AWSIZE" }} , 
 	{ "name": "m_axi_gmem_out_0_AWBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem_out", "role": "0_AWBURST" }} , 
 	{ "name": "m_axi_gmem_out_0_AWLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem_out", "role": "0_AWLOCK" }} , 
 	{ "name": "m_axi_gmem_out_0_AWCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem_out", "role": "0_AWCACHE" }} , 
 	{ "name": "m_axi_gmem_out_0_AWPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "gmem_out", "role": "0_AWPROT" }} , 
 	{ "name": "m_axi_gmem_out_0_AWQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem_out", "role": "0_AWQOS" }} , 
 	{ "name": "m_axi_gmem_out_0_AWREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem_out", "role": "0_AWREGION" }} , 
 	{ "name": "m_axi_gmem_out_0_AWUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_out", "role": "0_AWUSER" }} , 
 	{ "name": "m_axi_gmem_out_0_WVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_out", "role": "0_WVALID" }} , 
 	{ "name": "m_axi_gmem_out_0_WREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_out", "role": "0_WREADY" }} , 
 	{ "name": "m_axi_gmem_out_0_WDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "gmem_out", "role": "0_WDATA" }} , 
 	{ "name": "m_axi_gmem_out_0_WSTRB", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem_out", "role": "0_WSTRB" }} , 
 	{ "name": "m_axi_gmem_out_0_WLAST", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_out", "role": "0_WLAST" }} , 
 	{ "name": "m_axi_gmem_out_0_WID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_out", "role": "0_WID" }} , 
 	{ "name": "m_axi_gmem_out_0_WUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_out", "role": "0_WUSER" }} , 
 	{ "name": "m_axi_gmem_out_0_ARVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_out", "role": "0_ARVALID" }} , 
 	{ "name": "m_axi_gmem_out_0_ARREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_out", "role": "0_ARREADY" }} , 
 	{ "name": "m_axi_gmem_out_0_ARADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "gmem_out", "role": "0_ARADDR" }} , 
 	{ "name": "m_axi_gmem_out_0_ARID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_out", "role": "0_ARID" }} , 
 	{ "name": "m_axi_gmem_out_0_ARLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "gmem_out", "role": "0_ARLEN" }} , 
 	{ "name": "m_axi_gmem_out_0_ARSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "gmem_out", "role": "0_ARSIZE" }} , 
 	{ "name": "m_axi_gmem_out_0_ARBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem_out", "role": "0_ARBURST" }} , 
 	{ "name": "m_axi_gmem_out_0_ARLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem_out", "role": "0_ARLOCK" }} , 
 	{ "name": "m_axi_gmem_out_0_ARCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem_out", "role": "0_ARCACHE" }} , 
 	{ "name": "m_axi_gmem_out_0_ARPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "gmem_out", "role": "0_ARPROT" }} , 
 	{ "name": "m_axi_gmem_out_0_ARQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem_out", "role": "0_ARQOS" }} , 
 	{ "name": "m_axi_gmem_out_0_ARREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem_out", "role": "0_ARREGION" }} , 
 	{ "name": "m_axi_gmem_out_0_ARUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_out", "role": "0_ARUSER" }} , 
 	{ "name": "m_axi_gmem_out_0_RVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_out", "role": "0_RVALID" }} , 
 	{ "name": "m_axi_gmem_out_0_RREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_out", "role": "0_RREADY" }} , 
 	{ "name": "m_axi_gmem_out_0_RDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "gmem_out", "role": "0_RDATA" }} , 
 	{ "name": "m_axi_gmem_out_0_RLAST", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_out", "role": "0_RLAST" }} , 
 	{ "name": "m_axi_gmem_out_0_RID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_out", "role": "0_RID" }} , 
 	{ "name": "m_axi_gmem_out_0_RFIFONUM", "direction": "in", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "gmem_out", "role": "0_RFIFONUM" }} , 
 	{ "name": "m_axi_gmem_out_0_RUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_out", "role": "0_RUSER" }} , 
 	{ "name": "m_axi_gmem_out_0_RRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem_out", "role": "0_RRESP" }} , 
 	{ "name": "m_axi_gmem_out_0_BVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_out", "role": "0_BVALID" }} , 
 	{ "name": "m_axi_gmem_out_0_BREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_out", "role": "0_BREADY" }} , 
 	{ "name": "m_axi_gmem_out_0_BRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem_out", "role": "0_BRESP" }} , 
 	{ "name": "m_axi_gmem_out_0_BID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_out", "role": "0_BID" }} , 
 	{ "name": "m_axi_gmem_out_0_BUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_out", "role": "0_BUSER" }} , 
 	{ "name": "out_batch", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "out_batch", "role": "default" }} , 
 	{ "name": "down_quant_mode", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "down_quant_mode", "role": "default" }}  ]}

set ArgLastReadFirstWriteLatency {
	compute_output {
		p_read {Type I LastRead 0 FirstWrite -1}
		gmem_Wd {Type I LastRead 221 FirstWrite -1}
		W_down {Type I LastRead 0 FirstWrite -1}
		gmem_Wd2 {Type I LastRead 221 FirstWrite -1}
		W_down2 {Type I LastRead 0 FirstWrite -1}
		gate_cache_0 {Type I LastRead 1 FirstWrite -1}
		gate_cache_1 {Type I LastRead 2 FirstWrite -1}
		gate_cache_2 {Type I LastRead 2 FirstWrite -1}
		gate_cache_3 {Type I LastRead 2 FirstWrite -1}
		gate_cache_4 {Type I LastRead 1 FirstWrite -1}
		gate_cache_5 {Type I LastRead 2 FirstWrite -1}
		gate_cache_6 {Type I LastRead 2 FirstWrite -1}
		gate_cache_7 {Type I LastRead 2 FirstWrite -1}
		gmem_out {Type O LastRead 71 FirstWrite 2}
		out_batch {Type I LastRead 0 FirstWrite -1}
		down_quant_mode {Type I LastRead 0 FirstWrite -1}}
	load_pair_q6k {
		gmem_Wd {Type I LastRead 221 FirstWrite -1}
		W_down_wide {Type I LastRead 0 FirstWrite -1}
		out_i0 {Type I LastRead 0 FirstWrite -1}
		gmem_Wd2 {Type I LastRead 221 FirstWrite -1}
		W_down2_wide {Type I LastRead 0 FirstWrite -1}
		out_i1 {Type I LastRead 0 FirstWrite -1}
		ql0_0 {Type O LastRead -1 FirstWrite 2}
		ql0_1 {Type O LastRead -1 FirstWrite 2}
		ql0_2 {Type O LastRead -1 FirstWrite 2}
		ql0_3 {Type O LastRead -1 FirstWrite 2}
		ql0_4 {Type O LastRead -1 FirstWrite 2}
		ql0_5 {Type O LastRead -1 FirstWrite 2}
		ql0_6 {Type O LastRead -1 FirstWrite 2}
		ql0_7 {Type O LastRead -1 FirstWrite 2}
		qh0_0 {Type O LastRead -1 FirstWrite 2}
		qh0_1 {Type O LastRead -1 FirstWrite 2}
		qh0_2 {Type O LastRead -1 FirstWrite 2}
		qh0_3 {Type O LastRead -1 FirstWrite 2}
		qh0_4 {Type O LastRead -1 FirstWrite 2}
		qh0_5 {Type O LastRead -1 FirstWrite 2}
		qh0_6 {Type O LastRead -1 FirstWrite 2}
		qh0_7 {Type O LastRead -1 FirstWrite 2}
		sc0_0 {Type O LastRead -1 FirstWrite 1}
		sc0_1 {Type O LastRead -1 FirstWrite 1}
		sc0_2 {Type O LastRead -1 FirstWrite 1}
		sc0_3 {Type O LastRead -1 FirstWrite 1}
		sc0_4 {Type O LastRead -1 FirstWrite 1}
		sc0_5 {Type O LastRead -1 FirstWrite 1}
		sc0_6 {Type O LastRead -1 FirstWrite 1}
		sc0_7 {Type O LastRead -1 FirstWrite 1}
		sc0_8 {Type O LastRead -1 FirstWrite 1}
		sc0_9 {Type O LastRead -1 FirstWrite 1}
		sc0_10 {Type O LastRead -1 FirstWrite 1}
		sc0_11 {Type O LastRead -1 FirstWrite 1}
		sc0_12 {Type O LastRead -1 FirstWrite 1}
		sc0_13 {Type O LastRead -1 FirstWrite 1}
		sc0_14 {Type O LastRead -1 FirstWrite 1}
		sc0_15 {Type O LastRead -1 FirstWrite 1}
		sc0_16 {Type O LastRead -1 FirstWrite 1}
		sc0_17 {Type O LastRead -1 FirstWrite 1}
		sc0_18 {Type O LastRead -1 FirstWrite 1}
		sc0_19 {Type O LastRead -1 FirstWrite 1}
		sc0_20 {Type O LastRead -1 FirstWrite 1}
		sc0_21 {Type O LastRead -1 FirstWrite 1}
		sc0_22 {Type O LastRead -1 FirstWrite 1}
		sc0_23 {Type O LastRead -1 FirstWrite 1}
		sc0_24 {Type O LastRead -1 FirstWrite 1}
		sc0_25 {Type O LastRead -1 FirstWrite 1}
		sc0_26 {Type O LastRead -1 FirstWrite 1}
		sc0_27 {Type O LastRead -1 FirstWrite 1}
		sc0_28 {Type O LastRead -1 FirstWrite 1}
		sc0_29 {Type O LastRead -1 FirstWrite 1}
		sc0_30 {Type O LastRead -1 FirstWrite 1}
		sc0_31 {Type O LastRead -1 FirstWrite 1}
		d0_0 {Type O LastRead -1 FirstWrite 7}
		d0_1 {Type O LastRead -1 FirstWrite 7}
		d0_2 {Type O LastRead -1 FirstWrite 7}
		d0_3 {Type O LastRead -1 FirstWrite 7}
		d0_4 {Type O LastRead -1 FirstWrite 7}
		d0_5 {Type O LastRead -1 FirstWrite 7}
		d0_6 {Type O LastRead -1 FirstWrite 7}
		d0_7 {Type O LastRead -1 FirstWrite 7}
		d0_8 {Type O LastRead -1 FirstWrite 7}
		d0_9 {Type O LastRead -1 FirstWrite 7}
		d0_10 {Type O LastRead -1 FirstWrite 7}
		d0_11 {Type O LastRead -1 FirstWrite 7}
		d0_12 {Type O LastRead -1 FirstWrite 7}
		d0_13 {Type O LastRead -1 FirstWrite 7}
		d0_14 {Type O LastRead -1 FirstWrite 7}
		d0_15 {Type O LastRead -1 FirstWrite 7}
		d0_16 {Type O LastRead -1 FirstWrite 7}
		d0_17 {Type O LastRead -1 FirstWrite 7}
		d0_18 {Type O LastRead -1 FirstWrite 7}
		d0_19 {Type O LastRead -1 FirstWrite 7}
		d0_20 {Type O LastRead -1 FirstWrite 7}
		d0_21 {Type O LastRead -1 FirstWrite 7}
		d0_22 {Type O LastRead -1 FirstWrite 7}
		d0_23 {Type O LastRead -1 FirstWrite 7}
		d0_24 {Type O LastRead -1 FirstWrite 7}
		d0_25 {Type O LastRead -1 FirstWrite 7}
		d0_26 {Type O LastRead -1 FirstWrite 7}
		d0_27 {Type O LastRead -1 FirstWrite 7}
		d0_28 {Type O LastRead -1 FirstWrite 7}
		d0_29 {Type O LastRead -1 FirstWrite 7}
		d0_30 {Type O LastRead -1 FirstWrite 7}
		d0_31 {Type O LastRead -1 FirstWrite 7}
		ql1_0 {Type O LastRead -1 FirstWrite 2}
		ql1_1 {Type O LastRead -1 FirstWrite 2}
		ql1_2 {Type O LastRead -1 FirstWrite 2}
		ql1_3 {Type O LastRead -1 FirstWrite 2}
		ql1_4 {Type O LastRead -1 FirstWrite 2}
		ql1_5 {Type O LastRead -1 FirstWrite 2}
		ql1_6 {Type O LastRead -1 FirstWrite 2}
		ql1_7 {Type O LastRead -1 FirstWrite 2}
		qh1_0 {Type O LastRead -1 FirstWrite 2}
		qh1_1 {Type O LastRead -1 FirstWrite 2}
		qh1_2 {Type O LastRead -1 FirstWrite 2}
		qh1_3 {Type O LastRead -1 FirstWrite 2}
		qh1_4 {Type O LastRead -1 FirstWrite 2}
		qh1_5 {Type O LastRead -1 FirstWrite 2}
		qh1_6 {Type O LastRead -1 FirstWrite 2}
		qh1_7 {Type O LastRead -1 FirstWrite 2}
		sc1_0 {Type O LastRead -1 FirstWrite 1}
		sc1_1 {Type O LastRead -1 FirstWrite 1}
		sc1_2 {Type O LastRead -1 FirstWrite 1}
		sc1_3 {Type O LastRead -1 FirstWrite 1}
		sc1_4 {Type O LastRead -1 FirstWrite 1}
		sc1_5 {Type O LastRead -1 FirstWrite 1}
		sc1_6 {Type O LastRead -1 FirstWrite 1}
		sc1_7 {Type O LastRead -1 FirstWrite 1}
		sc1_8 {Type O LastRead -1 FirstWrite 1}
		sc1_9 {Type O LastRead -1 FirstWrite 1}
		sc1_10 {Type O LastRead -1 FirstWrite 1}
		sc1_11 {Type O LastRead -1 FirstWrite 1}
		sc1_12 {Type O LastRead -1 FirstWrite 1}
		sc1_13 {Type O LastRead -1 FirstWrite 1}
		sc1_14 {Type O LastRead -1 FirstWrite 1}
		sc1_15 {Type O LastRead -1 FirstWrite 1}
		sc1_16 {Type O LastRead -1 FirstWrite 1}
		sc1_17 {Type O LastRead -1 FirstWrite 1}
		sc1_18 {Type O LastRead -1 FirstWrite 1}
		sc1_19 {Type O LastRead -1 FirstWrite 1}
		sc1_20 {Type O LastRead -1 FirstWrite 1}
		sc1_21 {Type O LastRead -1 FirstWrite 1}
		sc1_22 {Type O LastRead -1 FirstWrite 1}
		sc1_23 {Type O LastRead -1 FirstWrite 1}
		sc1_24 {Type O LastRead -1 FirstWrite 1}
		sc1_25 {Type O LastRead -1 FirstWrite 1}
		sc1_26 {Type O LastRead -1 FirstWrite 1}
		sc1_27 {Type O LastRead -1 FirstWrite 1}
		sc1_28 {Type O LastRead -1 FirstWrite 1}
		sc1_29 {Type O LastRead -1 FirstWrite 1}
		sc1_30 {Type O LastRead -1 FirstWrite 1}
		sc1_31 {Type O LastRead -1 FirstWrite 1}
		d1_0 {Type O LastRead -1 FirstWrite 7}
		d1_1 {Type O LastRead -1 FirstWrite 7}
		d1_2 {Type O LastRead -1 FirstWrite 7}
		d1_3 {Type O LastRead -1 FirstWrite 7}
		d1_4 {Type O LastRead -1 FirstWrite 7}
		d1_5 {Type O LastRead -1 FirstWrite 7}
		d1_6 {Type O LastRead -1 FirstWrite 7}
		d1_7 {Type O LastRead -1 FirstWrite 7}
		d1_8 {Type O LastRead -1 FirstWrite 7}
		d1_9 {Type O LastRead -1 FirstWrite 7}
		d1_10 {Type O LastRead -1 FirstWrite 7}
		d1_11 {Type O LastRead -1 FirstWrite 7}
		d1_12 {Type O LastRead -1 FirstWrite 7}
		d1_13 {Type O LastRead -1 FirstWrite 7}
		d1_14 {Type O LastRead -1 FirstWrite 7}
		d1_15 {Type O LastRead -1 FirstWrite 7}
		d1_16 {Type O LastRead -1 FirstWrite 7}
		d1_17 {Type O LastRead -1 FirstWrite 7}
		d1_18 {Type O LastRead -1 FirstWrite 7}
		d1_19 {Type O LastRead -1 FirstWrite 7}
		d1_20 {Type O LastRead -1 FirstWrite 7}
		d1_21 {Type O LastRead -1 FirstWrite 7}
		d1_22 {Type O LastRead -1 FirstWrite 7}
		d1_23 {Type O LastRead -1 FirstWrite 7}
		d1_24 {Type O LastRead -1 FirstWrite 7}
		d1_25 {Type O LastRead -1 FirstWrite 7}
		d1_26 {Type O LastRead -1 FirstWrite 7}
		d1_27 {Type O LastRead -1 FirstWrite 7}
		d1_28 {Type O LastRead -1 FirstWrite 7}
		d1_29 {Type O LastRead -1 FirstWrite 7}
		d1_30 {Type O LastRead -1 FirstWrite 7}
		d1_31 {Type O LastRead -1 FirstWrite 7}}
	load_row_down_q6k {
		gmem_Wd {Type I LastRead 221 FirstWrite -1}
		W_down_wide {Type I LastRead 1 FirstWrite -1}
		out_i {Type I LastRead 0 FirstWrite -1}
		ql_buf_0 {Type O LastRead -1 FirstWrite 2}
		ql_buf_1 {Type O LastRead -1 FirstWrite 2}
		ql_buf_2 {Type O LastRead -1 FirstWrite 2}
		ql_buf_3 {Type O LastRead -1 FirstWrite 2}
		ql_buf_4 {Type O LastRead -1 FirstWrite 2}
		ql_buf_5 {Type O LastRead -1 FirstWrite 2}
		ql_buf_6 {Type O LastRead -1 FirstWrite 2}
		ql_buf_7 {Type O LastRead -1 FirstWrite 2}
		qh_buf_0 {Type O LastRead -1 FirstWrite 2}
		qh_buf_1 {Type O LastRead -1 FirstWrite 2}
		qh_buf_2 {Type O LastRead -1 FirstWrite 2}
		qh_buf_3 {Type O LastRead -1 FirstWrite 2}
		qh_buf_4 {Type O LastRead -1 FirstWrite 2}
		qh_buf_5 {Type O LastRead -1 FirstWrite 2}
		qh_buf_6 {Type O LastRead -1 FirstWrite 2}
		qh_buf_7 {Type O LastRead -1 FirstWrite 2}
		sc_buf_0 {Type O LastRead -1 FirstWrite 1}
		sc_buf_1 {Type O LastRead -1 FirstWrite 1}
		sc_buf_2 {Type O LastRead -1 FirstWrite 1}
		sc_buf_3 {Type O LastRead -1 FirstWrite 1}
		sc_buf_4 {Type O LastRead -1 FirstWrite 1}
		sc_buf_5 {Type O LastRead -1 FirstWrite 1}
		sc_buf_6 {Type O LastRead -1 FirstWrite 1}
		sc_buf_7 {Type O LastRead -1 FirstWrite 1}
		sc_buf_8 {Type O LastRead -1 FirstWrite 1}
		sc_buf_9 {Type O LastRead -1 FirstWrite 1}
		sc_buf_10 {Type O LastRead -1 FirstWrite 1}
		sc_buf_11 {Type O LastRead -1 FirstWrite 1}
		sc_buf_12 {Type O LastRead -1 FirstWrite 1}
		sc_buf_13 {Type O LastRead -1 FirstWrite 1}
		sc_buf_14 {Type O LastRead -1 FirstWrite 1}
		sc_buf_15 {Type O LastRead -1 FirstWrite 1}
		sc_buf_16 {Type O LastRead -1 FirstWrite 1}
		sc_buf_17 {Type O LastRead -1 FirstWrite 1}
		sc_buf_18 {Type O LastRead -1 FirstWrite 1}
		sc_buf_19 {Type O LastRead -1 FirstWrite 1}
		sc_buf_20 {Type O LastRead -1 FirstWrite 1}
		sc_buf_21 {Type O LastRead -1 FirstWrite 1}
		sc_buf_22 {Type O LastRead -1 FirstWrite 1}
		sc_buf_23 {Type O LastRead -1 FirstWrite 1}
		sc_buf_24 {Type O LastRead -1 FirstWrite 1}
		sc_buf_25 {Type O LastRead -1 FirstWrite 1}
		sc_buf_26 {Type O LastRead -1 FirstWrite 1}
		sc_buf_27 {Type O LastRead -1 FirstWrite 1}
		sc_buf_28 {Type O LastRead -1 FirstWrite 1}
		sc_buf_29 {Type O LastRead -1 FirstWrite 1}
		sc_buf_30 {Type O LastRead -1 FirstWrite 1}
		sc_buf_31 {Type O LastRead -1 FirstWrite 1}
		d_buf_0 {Type O LastRead -1 FirstWrite 7}
		d_buf_1 {Type O LastRead -1 FirstWrite 7}
		d_buf_2 {Type O LastRead -1 FirstWrite 7}
		d_buf_3 {Type O LastRead -1 FirstWrite 7}
		d_buf_4 {Type O LastRead -1 FirstWrite 7}
		d_buf_5 {Type O LastRead -1 FirstWrite 7}
		d_buf_6 {Type O LastRead -1 FirstWrite 7}
		d_buf_7 {Type O LastRead -1 FirstWrite 7}
		d_buf_8 {Type O LastRead -1 FirstWrite 7}
		d_buf_9 {Type O LastRead -1 FirstWrite 7}
		d_buf_10 {Type O LastRead -1 FirstWrite 7}
		d_buf_11 {Type O LastRead -1 FirstWrite 7}
		d_buf_12 {Type O LastRead -1 FirstWrite 7}
		d_buf_13 {Type O LastRead -1 FirstWrite 7}
		d_buf_14 {Type O LastRead -1 FirstWrite 7}
		d_buf_15 {Type O LastRead -1 FirstWrite 7}
		d_buf_16 {Type O LastRead -1 FirstWrite 7}
		d_buf_17 {Type O LastRead -1 FirstWrite 7}
		d_buf_18 {Type O LastRead -1 FirstWrite 7}
		d_buf_19 {Type O LastRead -1 FirstWrite 7}
		d_buf_20 {Type O LastRead -1 FirstWrite 7}
		d_buf_21 {Type O LastRead -1 FirstWrite 7}
		d_buf_22 {Type O LastRead -1 FirstWrite 7}
		d_buf_23 {Type O LastRead -1 FirstWrite 7}
		d_buf_24 {Type O LastRead -1 FirstWrite 7}
		d_buf_25 {Type O LastRead -1 FirstWrite 7}
		d_buf_26 {Type O LastRead -1 FirstWrite 7}
		d_buf_27 {Type O LastRead -1 FirstWrite 7}
		d_buf_28 {Type O LastRead -1 FirstWrite 7}
		d_buf_29 {Type O LastRead -1 FirstWrite 7}
		d_buf_30 {Type O LastRead -1 FirstWrite 7}
		d_buf_31 {Type O LastRead -1 FirstWrite 7}}
	load_row_down_q6k_Pipeline_LOAD_QL {
		gmem_Wd {Type I LastRead 1 FirstWrite -1}
		sext_ln492 {Type I LastRead 0 FirstWrite -1}
		ql_buf_7 {Type O LastRead -1 FirstWrite 2}
		ql_buf_6 {Type O LastRead -1 FirstWrite 2}
		ql_buf_5 {Type O LastRead -1 FirstWrite 2}
		ql_buf_4 {Type O LastRead -1 FirstWrite 2}
		ql_buf_3 {Type O LastRead -1 FirstWrite 2}
		ql_buf_2 {Type O LastRead -1 FirstWrite 2}
		ql_buf_1 {Type O LastRead -1 FirstWrite 2}
		ql_buf_0 {Type O LastRead -1 FirstWrite 2}}
	load_row_down_q6k_Pipeline_LOAD_QH {
		gmem_Wd {Type I LastRead 1 FirstWrite -1}
		sext_ln498 {Type I LastRead 0 FirstWrite -1}
		qh_buf_7 {Type O LastRead -1 FirstWrite 2}
		qh_buf_6 {Type O LastRead -1 FirstWrite 2}
		qh_buf_5 {Type O LastRead -1 FirstWrite 2}
		qh_buf_4 {Type O LastRead -1 FirstWrite 2}
		qh_buf_3 {Type O LastRead -1 FirstWrite 2}
		qh_buf_2 {Type O LastRead -1 FirstWrite 2}
		qh_buf_1 {Type O LastRead -1 FirstWrite 2}
		qh_buf_0 {Type O LastRead -1 FirstWrite 2}}
	load_row_down_q6k_Pipeline_LOAD_SC {
		sc_buf_0 {Type O LastRead -1 FirstWrite 1}
		gmem_Wd {Type I LastRead 1 FirstWrite -1}
		sext_ln504 {Type I LastRead 0 FirstWrite -1}
		sc_buf_31 {Type O LastRead -1 FirstWrite 1}
		sc_buf_30 {Type O LastRead -1 FirstWrite 1}
		sc_buf_29 {Type O LastRead -1 FirstWrite 1}
		sc_buf_28 {Type O LastRead -1 FirstWrite 1}
		sc_buf_27 {Type O LastRead -1 FirstWrite 1}
		sc_buf_26 {Type O LastRead -1 FirstWrite 1}
		sc_buf_25 {Type O LastRead -1 FirstWrite 1}
		sc_buf_24 {Type O LastRead -1 FirstWrite 1}
		sc_buf_23 {Type O LastRead -1 FirstWrite 1}
		sc_buf_22 {Type O LastRead -1 FirstWrite 1}
		sc_buf_21 {Type O LastRead -1 FirstWrite 1}
		sc_buf_20 {Type O LastRead -1 FirstWrite 1}
		sc_buf_19 {Type O LastRead -1 FirstWrite 1}
		sc_buf_18 {Type O LastRead -1 FirstWrite 1}
		sc_buf_17 {Type O LastRead -1 FirstWrite 1}
		sc_buf_16 {Type O LastRead -1 FirstWrite 1}
		sc_buf_15 {Type O LastRead -1 FirstWrite 1}
		sc_buf_14 {Type O LastRead -1 FirstWrite 1}
		sc_buf_13 {Type O LastRead -1 FirstWrite 1}
		sc_buf_12 {Type O LastRead -1 FirstWrite 1}
		sc_buf_11 {Type O LastRead -1 FirstWrite 1}
		sc_buf_10 {Type O LastRead -1 FirstWrite 1}
		sc_buf_9 {Type O LastRead -1 FirstWrite 1}
		sc_buf_8 {Type O LastRead -1 FirstWrite 1}
		sc_buf_7 {Type O LastRead -1 FirstWrite 1}
		sc_buf_6 {Type O LastRead -1 FirstWrite 1}
		sc_buf_5 {Type O LastRead -1 FirstWrite 1}
		sc_buf_4 {Type O LastRead -1 FirstWrite 1}
		sc_buf_3 {Type O LastRead -1 FirstWrite 1}
		sc_buf_2 {Type O LastRead -1 FirstWrite 1}
		sc_buf_1 {Type O LastRead -1 FirstWrite 1}}
	load_row_down_q6k_Pipeline_LOAD_D {
		d_buf_0 {Type O LastRead -1 FirstWrite 7}
		d_buf_1 {Type O LastRead -1 FirstWrite 7}
		d_buf_2 {Type O LastRead -1 FirstWrite 7}
		d_buf_3 {Type O LastRead -1 FirstWrite 7}
		d_buf_4 {Type O LastRead -1 FirstWrite 7}
		d_buf_5 {Type O LastRead -1 FirstWrite 7}
		d_buf_6 {Type O LastRead -1 FirstWrite 7}
		d_buf_7 {Type O LastRead -1 FirstWrite 7}
		gmem_Wd {Type I LastRead 1 FirstWrite -1}
		sext_ln510 {Type I LastRead 0 FirstWrite -1}
		d_buf_31 {Type O LastRead -1 FirstWrite 7}
		d_buf_30 {Type O LastRead -1 FirstWrite 7}
		d_buf_29 {Type O LastRead -1 FirstWrite 7}
		d_buf_28 {Type O LastRead -1 FirstWrite 7}
		d_buf_27 {Type O LastRead -1 FirstWrite 7}
		d_buf_26 {Type O LastRead -1 FirstWrite 7}
		d_buf_25 {Type O LastRead -1 FirstWrite 7}
		d_buf_24 {Type O LastRead -1 FirstWrite 7}
		d_buf_23 {Type O LastRead -1 FirstWrite 7}
		d_buf_22 {Type O LastRead -1 FirstWrite 7}
		d_buf_21 {Type O LastRead -1 FirstWrite 7}
		d_buf_20 {Type O LastRead -1 FirstWrite 7}
		d_buf_19 {Type O LastRead -1 FirstWrite 7}
		d_buf_18 {Type O LastRead -1 FirstWrite 7}
		d_buf_17 {Type O LastRead -1 FirstWrite 7}
		d_buf_16 {Type O LastRead -1 FirstWrite 7}
		d_buf_15 {Type O LastRead -1 FirstWrite 7}
		d_buf_14 {Type O LastRead -1 FirstWrite 7}
		d_buf_13 {Type O LastRead -1 FirstWrite 7}
		d_buf_12 {Type O LastRead -1 FirstWrite 7}
		d_buf_11 {Type O LastRead -1 FirstWrite 7}
		d_buf_10 {Type O LastRead -1 FirstWrite 7}
		d_buf_9 {Type O LastRead -1 FirstWrite 7}
		d_buf_8 {Type O LastRead -1 FirstWrite 7}}
	fp16_to_fp32 {
		h {Type I LastRead 0 FirstWrite -1}}
	fp16_to_fp32 {
		h {Type I LastRead 0 FirstWrite -1}}
	fp16_to_fp32 {
		h {Type I LastRead 0 FirstWrite -1}}
	fp16_to_fp32 {
		h {Type I LastRead 0 FirstWrite -1}}
	fp16_to_fp32 {
		h {Type I LastRead 0 FirstWrite -1}}
	fp16_to_fp32 {
		h {Type I LastRead 0 FirstWrite -1}}
	fp16_to_fp32 {
		h {Type I LastRead 0 FirstWrite -1}}
	fp16_to_fp32 {
		h {Type I LastRead 0 FirstWrite -1}}
	load_row_down_q6k_1 {
		gmem_Wd2 {Type I LastRead 221 FirstWrite -1}
		W_down_wide {Type I LastRead 1 FirstWrite -1}
		out_i {Type I LastRead 0 FirstWrite -1}
		ql_buf_0 {Type O LastRead -1 FirstWrite 2}
		ql_buf_1 {Type O LastRead -1 FirstWrite 2}
		ql_buf_2 {Type O LastRead -1 FirstWrite 2}
		ql_buf_3 {Type O LastRead -1 FirstWrite 2}
		ql_buf_4 {Type O LastRead -1 FirstWrite 2}
		ql_buf_5 {Type O LastRead -1 FirstWrite 2}
		ql_buf_6 {Type O LastRead -1 FirstWrite 2}
		ql_buf_7 {Type O LastRead -1 FirstWrite 2}
		qh_buf_0 {Type O LastRead -1 FirstWrite 2}
		qh_buf_1 {Type O LastRead -1 FirstWrite 2}
		qh_buf_2 {Type O LastRead -1 FirstWrite 2}
		qh_buf_3 {Type O LastRead -1 FirstWrite 2}
		qh_buf_4 {Type O LastRead -1 FirstWrite 2}
		qh_buf_5 {Type O LastRead -1 FirstWrite 2}
		qh_buf_6 {Type O LastRead -1 FirstWrite 2}
		qh_buf_7 {Type O LastRead -1 FirstWrite 2}
		sc_buf_0 {Type O LastRead -1 FirstWrite 1}
		sc_buf_1 {Type O LastRead -1 FirstWrite 1}
		sc_buf_2 {Type O LastRead -1 FirstWrite 1}
		sc_buf_3 {Type O LastRead -1 FirstWrite 1}
		sc_buf_4 {Type O LastRead -1 FirstWrite 1}
		sc_buf_5 {Type O LastRead -1 FirstWrite 1}
		sc_buf_6 {Type O LastRead -1 FirstWrite 1}
		sc_buf_7 {Type O LastRead -1 FirstWrite 1}
		sc_buf_8 {Type O LastRead -1 FirstWrite 1}
		sc_buf_9 {Type O LastRead -1 FirstWrite 1}
		sc_buf_10 {Type O LastRead -1 FirstWrite 1}
		sc_buf_11 {Type O LastRead -1 FirstWrite 1}
		sc_buf_12 {Type O LastRead -1 FirstWrite 1}
		sc_buf_13 {Type O LastRead -1 FirstWrite 1}
		sc_buf_14 {Type O LastRead -1 FirstWrite 1}
		sc_buf_15 {Type O LastRead -1 FirstWrite 1}
		sc_buf_16 {Type O LastRead -1 FirstWrite 1}
		sc_buf_17 {Type O LastRead -1 FirstWrite 1}
		sc_buf_18 {Type O LastRead -1 FirstWrite 1}
		sc_buf_19 {Type O LastRead -1 FirstWrite 1}
		sc_buf_20 {Type O LastRead -1 FirstWrite 1}
		sc_buf_21 {Type O LastRead -1 FirstWrite 1}
		sc_buf_22 {Type O LastRead -1 FirstWrite 1}
		sc_buf_23 {Type O LastRead -1 FirstWrite 1}
		sc_buf_24 {Type O LastRead -1 FirstWrite 1}
		sc_buf_25 {Type O LastRead -1 FirstWrite 1}
		sc_buf_26 {Type O LastRead -1 FirstWrite 1}
		sc_buf_27 {Type O LastRead -1 FirstWrite 1}
		sc_buf_28 {Type O LastRead -1 FirstWrite 1}
		sc_buf_29 {Type O LastRead -1 FirstWrite 1}
		sc_buf_30 {Type O LastRead -1 FirstWrite 1}
		sc_buf_31 {Type O LastRead -1 FirstWrite 1}
		d_buf_0 {Type O LastRead -1 FirstWrite 7}
		d_buf_1 {Type O LastRead -1 FirstWrite 7}
		d_buf_2 {Type O LastRead -1 FirstWrite 7}
		d_buf_3 {Type O LastRead -1 FirstWrite 7}
		d_buf_4 {Type O LastRead -1 FirstWrite 7}
		d_buf_5 {Type O LastRead -1 FirstWrite 7}
		d_buf_6 {Type O LastRead -1 FirstWrite 7}
		d_buf_7 {Type O LastRead -1 FirstWrite 7}
		d_buf_8 {Type O LastRead -1 FirstWrite 7}
		d_buf_9 {Type O LastRead -1 FirstWrite 7}
		d_buf_10 {Type O LastRead -1 FirstWrite 7}
		d_buf_11 {Type O LastRead -1 FirstWrite 7}
		d_buf_12 {Type O LastRead -1 FirstWrite 7}
		d_buf_13 {Type O LastRead -1 FirstWrite 7}
		d_buf_14 {Type O LastRead -1 FirstWrite 7}
		d_buf_15 {Type O LastRead -1 FirstWrite 7}
		d_buf_16 {Type O LastRead -1 FirstWrite 7}
		d_buf_17 {Type O LastRead -1 FirstWrite 7}
		d_buf_18 {Type O LastRead -1 FirstWrite 7}
		d_buf_19 {Type O LastRead -1 FirstWrite 7}
		d_buf_20 {Type O LastRead -1 FirstWrite 7}
		d_buf_21 {Type O LastRead -1 FirstWrite 7}
		d_buf_22 {Type O LastRead -1 FirstWrite 7}
		d_buf_23 {Type O LastRead -1 FirstWrite 7}
		d_buf_24 {Type O LastRead -1 FirstWrite 7}
		d_buf_25 {Type O LastRead -1 FirstWrite 7}
		d_buf_26 {Type O LastRead -1 FirstWrite 7}
		d_buf_27 {Type O LastRead -1 FirstWrite 7}
		d_buf_28 {Type O LastRead -1 FirstWrite 7}
		d_buf_29 {Type O LastRead -1 FirstWrite 7}
		d_buf_30 {Type O LastRead -1 FirstWrite 7}
		d_buf_31 {Type O LastRead -1 FirstWrite 7}}
	load_row_down_q6k_1_Pipeline_LOAD_QL {
		gmem_Wd2 {Type I LastRead 1 FirstWrite -1}
		sext_ln492 {Type I LastRead 0 FirstWrite -1}
		ql_buf_7 {Type O LastRead -1 FirstWrite 2}
		ql_buf_6 {Type O LastRead -1 FirstWrite 2}
		ql_buf_5 {Type O LastRead -1 FirstWrite 2}
		ql_buf_4 {Type O LastRead -1 FirstWrite 2}
		ql_buf_3 {Type O LastRead -1 FirstWrite 2}
		ql_buf_2 {Type O LastRead -1 FirstWrite 2}
		ql_buf_1 {Type O LastRead -1 FirstWrite 2}
		ql_buf_0 {Type O LastRead -1 FirstWrite 2}}
	load_row_down_q6k_1_Pipeline_LOAD_QH {
		gmem_Wd2 {Type I LastRead 1 FirstWrite -1}
		sext_ln498 {Type I LastRead 0 FirstWrite -1}
		qh_buf_7 {Type O LastRead -1 FirstWrite 2}
		qh_buf_6 {Type O LastRead -1 FirstWrite 2}
		qh_buf_5 {Type O LastRead -1 FirstWrite 2}
		qh_buf_4 {Type O LastRead -1 FirstWrite 2}
		qh_buf_3 {Type O LastRead -1 FirstWrite 2}
		qh_buf_2 {Type O LastRead -1 FirstWrite 2}
		qh_buf_1 {Type O LastRead -1 FirstWrite 2}
		qh_buf_0 {Type O LastRead -1 FirstWrite 2}}
	load_row_down_q6k_1_Pipeline_LOAD_SC {
		sc_buf_0 {Type O LastRead -1 FirstWrite 1}
		gmem_Wd2 {Type I LastRead 1 FirstWrite -1}
		sext_ln504 {Type I LastRead 0 FirstWrite -1}
		sc_buf_31 {Type O LastRead -1 FirstWrite 1}
		sc_buf_30 {Type O LastRead -1 FirstWrite 1}
		sc_buf_29 {Type O LastRead -1 FirstWrite 1}
		sc_buf_28 {Type O LastRead -1 FirstWrite 1}
		sc_buf_27 {Type O LastRead -1 FirstWrite 1}
		sc_buf_26 {Type O LastRead -1 FirstWrite 1}
		sc_buf_25 {Type O LastRead -1 FirstWrite 1}
		sc_buf_24 {Type O LastRead -1 FirstWrite 1}
		sc_buf_23 {Type O LastRead -1 FirstWrite 1}
		sc_buf_22 {Type O LastRead -1 FirstWrite 1}
		sc_buf_21 {Type O LastRead -1 FirstWrite 1}
		sc_buf_20 {Type O LastRead -1 FirstWrite 1}
		sc_buf_19 {Type O LastRead -1 FirstWrite 1}
		sc_buf_18 {Type O LastRead -1 FirstWrite 1}
		sc_buf_17 {Type O LastRead -1 FirstWrite 1}
		sc_buf_16 {Type O LastRead -1 FirstWrite 1}
		sc_buf_15 {Type O LastRead -1 FirstWrite 1}
		sc_buf_14 {Type O LastRead -1 FirstWrite 1}
		sc_buf_13 {Type O LastRead -1 FirstWrite 1}
		sc_buf_12 {Type O LastRead -1 FirstWrite 1}
		sc_buf_11 {Type O LastRead -1 FirstWrite 1}
		sc_buf_10 {Type O LastRead -1 FirstWrite 1}
		sc_buf_9 {Type O LastRead -1 FirstWrite 1}
		sc_buf_8 {Type O LastRead -1 FirstWrite 1}
		sc_buf_7 {Type O LastRead -1 FirstWrite 1}
		sc_buf_6 {Type O LastRead -1 FirstWrite 1}
		sc_buf_5 {Type O LastRead -1 FirstWrite 1}
		sc_buf_4 {Type O LastRead -1 FirstWrite 1}
		sc_buf_3 {Type O LastRead -1 FirstWrite 1}
		sc_buf_2 {Type O LastRead -1 FirstWrite 1}
		sc_buf_1 {Type O LastRead -1 FirstWrite 1}}
	load_row_down_q6k_1_Pipeline_LOAD_D {
		d_buf_0 {Type O LastRead -1 FirstWrite 7}
		d_buf_1 {Type O LastRead -1 FirstWrite 7}
		d_buf_2 {Type O LastRead -1 FirstWrite 7}
		d_buf_3 {Type O LastRead -1 FirstWrite 7}
		d_buf_4 {Type O LastRead -1 FirstWrite 7}
		d_buf_5 {Type O LastRead -1 FirstWrite 7}
		d_buf_6 {Type O LastRead -1 FirstWrite 7}
		d_buf_7 {Type O LastRead -1 FirstWrite 7}
		gmem_Wd2 {Type I LastRead 1 FirstWrite -1}
		sext_ln510 {Type I LastRead 0 FirstWrite -1}
		d_buf_31 {Type O LastRead -1 FirstWrite 7}
		d_buf_30 {Type O LastRead -1 FirstWrite 7}
		d_buf_29 {Type O LastRead -1 FirstWrite 7}
		d_buf_28 {Type O LastRead -1 FirstWrite 7}
		d_buf_27 {Type O LastRead -1 FirstWrite 7}
		d_buf_26 {Type O LastRead -1 FirstWrite 7}
		d_buf_25 {Type O LastRead -1 FirstWrite 7}
		d_buf_24 {Type O LastRead -1 FirstWrite 7}
		d_buf_23 {Type O LastRead -1 FirstWrite 7}
		d_buf_22 {Type O LastRead -1 FirstWrite 7}
		d_buf_21 {Type O LastRead -1 FirstWrite 7}
		d_buf_20 {Type O LastRead -1 FirstWrite 7}
		d_buf_19 {Type O LastRead -1 FirstWrite 7}
		d_buf_18 {Type O LastRead -1 FirstWrite 7}
		d_buf_17 {Type O LastRead -1 FirstWrite 7}
		d_buf_16 {Type O LastRead -1 FirstWrite 7}
		d_buf_15 {Type O LastRead -1 FirstWrite 7}
		d_buf_14 {Type O LastRead -1 FirstWrite 7}
		d_buf_13 {Type O LastRead -1 FirstWrite 7}
		d_buf_12 {Type O LastRead -1 FirstWrite 7}
		d_buf_11 {Type O LastRead -1 FirstWrite 7}
		d_buf_10 {Type O LastRead -1 FirstWrite 7}
		d_buf_9 {Type O LastRead -1 FirstWrite 7}
		d_buf_8 {Type O LastRead -1 FirstWrite 7}}
	fp16_to_fp32 {
		h {Type I LastRead 0 FirstWrite -1}}
	fp16_to_fp32 {
		h {Type I LastRead 0 FirstWrite -1}}
	fp16_to_fp32 {
		h {Type I LastRead 0 FirstWrite -1}}
	fp16_to_fp32 {
		h {Type I LastRead 0 FirstWrite -1}}
	fp16_to_fp32 {
		h {Type I LastRead 0 FirstWrite -1}}
	fp16_to_fp32 {
		h {Type I LastRead 0 FirstWrite -1}}
	fp16_to_fp32 {
		h {Type I LastRead 0 FirstWrite -1}}
	fp16_to_fp32 {
		h {Type I LastRead 0 FirstWrite -1}}
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
		add_i_i14_phi_out {Type O LastRead -1 FirstWrite 9}}
	compute_output_Pipeline_1 {
		gmem_out {Type O LastRead -1 FirstWrite 2}
		sext_ln703 {Type I LastRead 0 FirstWrite -1}
		out_local_1 {Type I LastRead 0 FirstWrite -1}}
	load_row_down_q4k {
		gmem_Wd {Type I LastRead 1 FirstWrite -1}
		W_down_wide {Type I LastRead 0 FirstWrite -1}
		out_i {Type I LastRead 0 FirstWrite -1}
		rb_0 {Type O LastRead -1 FirstWrite 2}
		rb_1 {Type O LastRead -1 FirstWrite 2}
		rb_2 {Type O LastRead -1 FirstWrite 2}
		rb_3 {Type O LastRead -1 FirstWrite 2}
		rb_4 {Type O LastRead -1 FirstWrite 2}
		rb_5 {Type O LastRead -1 FirstWrite 2}
		rb_6 {Type O LastRead -1 FirstWrite 2}
		rb_7 {Type O LastRead -1 FirstWrite 2}}
	load_row_down_q4k_Pipeline_LOAD_DOWN_Q4K_VITIS_LOOP_337_1 {
		gmem_Wd {Type I LastRead 1 FirstWrite -1}
		sext_ln336 {Type I LastRead 0 FirstWrite -1}
		rb_0 {Type O LastRead -1 FirstWrite 2}
		rb_1 {Type O LastRead -1 FirstWrite 2}
		rb_2 {Type O LastRead -1 FirstWrite 2}
		rb_3 {Type O LastRead -1 FirstWrite 2}
		rb_4 {Type O LastRead -1 FirstWrite 2}
		rb_5 {Type O LastRead -1 FirstWrite 2}
		rb_6 {Type O LastRead -1 FirstWrite 2}
		rb_7 {Type O LastRead -1 FirstWrite 2}}
	mac_blocks_down_q4k7 {
		rb_0 {Type I LastRead 1 FirstWrite -1}
		rb_1 {Type I LastRead 1 FirstWrite -1}
		rb_2 {Type I LastRead 1 FirstWrite -1}
		rb_3 {Type I LastRead 1 FirstWrite -1}
		rb_4 {Type I LastRead 1 FirstWrite -1}
		rb_5 {Type I LastRead 1 FirstWrite -1}
		rb_6 {Type I LastRead 1 FirstWrite -1}
		rb_7 {Type I LastRead 1 FirstWrite -1}
		gate_0 {Type I LastRead 1 FirstWrite -1}
		gate_1 {Type I LastRead 1 FirstWrite -1}
		gate_2 {Type I LastRead 1 FirstWrite -1}
		gate_3 {Type I LastRead 1 FirstWrite -1}
		gate_4 {Type I LastRead 1 FirstWrite -1}
		gate_5 {Type I LastRead 1 FirstWrite -1}
		gate_6 {Type I LastRead 1 FirstWrite -1}
		gate_7 {Type I LastRead 1 FirstWrite -1}
		gate_scale {Type I LastRead 2 FirstWrite -1}}
	mac_blocks_down_q4k7_Pipeline_UNPACK_HDR_DOWN {
		rb_0 {Type I LastRead 0 FirstWrite -1}
		rb_1 {Type I LastRead 0 FirstWrite -1}
		rb_2 {Type I LastRead 0 FirstWrite -1}
		rb_3 {Type I LastRead 0 FirstWrite -1}
		rb_4 {Type I LastRead 0 FirstWrite -1}
		rb_5 {Type I LastRead 0 FirstWrite -1}
		rb_6 {Type I LastRead 0 FirstWrite -1}
		rb_7 {Type I LastRead 0 FirstWrite -1}
		mn6_390_out {Type O LastRead -1 FirstWrite 6}
		mn6_389_out {Type O LastRead -1 FirstWrite 6}
		mn6_388_out {Type O LastRead -1 FirstWrite 6}
		mn6_387_out {Type O LastRead -1 FirstWrite 6}
		mn6_386_out {Type O LastRead -1 FirstWrite 6}
		mn6_385_out {Type O LastRead -1 FirstWrite 6}
		mn6_384_out {Type O LastRead -1 FirstWrite 6}
		mn6_383_out {Type O LastRead -1 FirstWrite 6}
		mn6_382_out {Type O LastRead -1 FirstWrite 6}
		mn6_381_out {Type O LastRead -1 FirstWrite 6}
		mn6_380_out {Type O LastRead -1 FirstWrite 6}
		mn6_379_out {Type O LastRead -1 FirstWrite 6}
		mn6_378_out {Type O LastRead -1 FirstWrite 6}
		mn6_377_out {Type O LastRead -1 FirstWrite 6}
		mn6_376_out {Type O LastRead -1 FirstWrite 6}
		mn6_375_out {Type O LastRead -1 FirstWrite 6}
		mn6_374_out {Type O LastRead -1 FirstWrite 6}
		mn6_373_out {Type O LastRead -1 FirstWrite 6}
		mn6_372_out {Type O LastRead -1 FirstWrite 6}
		mn6_371_out {Type O LastRead -1 FirstWrite 6}
		mn6_370_out {Type O LastRead -1 FirstWrite 6}
		mn6_369_out {Type O LastRead -1 FirstWrite 6}
		mn6_368_out {Type O LastRead -1 FirstWrite 6}
		mn6_367_out {Type O LastRead -1 FirstWrite 6}
		mn6_366_out {Type O LastRead -1 FirstWrite 6}
		mn6_365_out {Type O LastRead -1 FirstWrite 6}
		mn6_364_out {Type O LastRead -1 FirstWrite 6}
		mn6_363_out {Type O LastRead -1 FirstWrite 6}
		mn6_362_out {Type O LastRead -1 FirstWrite 6}
		mn6_361_out {Type O LastRead -1 FirstWrite 6}
		mn6_360_out {Type O LastRead -1 FirstWrite 6}
		mn6_359_out {Type O LastRead -1 FirstWrite 6}
		mn6_358_out {Type O LastRead -1 FirstWrite 6}
		mn6_357_out {Type O LastRead -1 FirstWrite 6}
		mn6_356_out {Type O LastRead -1 FirstWrite 6}
		mn6_355_out {Type O LastRead -1 FirstWrite 6}
		mn6_354_out {Type O LastRead -1 FirstWrite 6}
		mn6_353_out {Type O LastRead -1 FirstWrite 6}
		mn6_352_out {Type O LastRead -1 FirstWrite 6}
		mn6_351_out {Type O LastRead -1 FirstWrite 6}
		mn6_350_out {Type O LastRead -1 FirstWrite 6}
		mn6_349_out {Type O LastRead -1 FirstWrite 6}
		mn6_348_out {Type O LastRead -1 FirstWrite 6}
		mn6_347_out {Type O LastRead -1 FirstWrite 6}
		mn6_346_out {Type O LastRead -1 FirstWrite 6}
		mn6_345_out {Type O LastRead -1 FirstWrite 6}
		mn6_344_out {Type O LastRead -1 FirstWrite 6}
		mn6_343_out {Type O LastRead -1 FirstWrite 6}
		mn6_342_out {Type O LastRead -1 FirstWrite 6}
		mn6_341_out {Type O LastRead -1 FirstWrite 6}
		mn6_340_out {Type O LastRead -1 FirstWrite 6}
		mn6_339_out {Type O LastRead -1 FirstWrite 6}
		mn6_338_out {Type O LastRead -1 FirstWrite 6}
		mn6_337_out {Type O LastRead -1 FirstWrite 6}
		mn6_336_out {Type O LastRead -1 FirstWrite 6}
		mn6_335_out {Type O LastRead -1 FirstWrite 6}
		mn6_334_out {Type O LastRead -1 FirstWrite 6}
		mn6_333_out {Type O LastRead -1 FirstWrite 6}
		mn6_332_out {Type O LastRead -1 FirstWrite 6}
		mn6_331_out {Type O LastRead -1 FirstWrite 6}
		mn6_330_out {Type O LastRead -1 FirstWrite 6}
		mn6_329_out {Type O LastRead -1 FirstWrite 6}
		mn6_328_out {Type O LastRead -1 FirstWrite 6}
		mn6_327_out {Type O LastRead -1 FirstWrite 6}
		mn6_326_out {Type O LastRead -1 FirstWrite 6}
		mn6_325_out {Type O LastRead -1 FirstWrite 6}
		mn6_324_out {Type O LastRead -1 FirstWrite 6}
		mn6_323_out {Type O LastRead -1 FirstWrite 6}
		mn6_322_out {Type O LastRead -1 FirstWrite 6}
		mn6_321_out {Type O LastRead -1 FirstWrite 6}
		mn6_320_out {Type O LastRead -1 FirstWrite 6}
		mn6_319_out {Type O LastRead -1 FirstWrite 6}
		mn6_318_out {Type O LastRead -1 FirstWrite 6}
		mn6_317_out {Type O LastRead -1 FirstWrite 6}
		mn6_316_out {Type O LastRead -1 FirstWrite 6}
		mn6_315_out {Type O LastRead -1 FirstWrite 6}
		mn6_314_out {Type O LastRead -1 FirstWrite 6}
		mn6_313_out {Type O LastRead -1 FirstWrite 6}
		mn6_312_out {Type O LastRead -1 FirstWrite 6}
		mn6_311_out {Type O LastRead -1 FirstWrite 6}
		mn6_310_out {Type O LastRead -1 FirstWrite 6}
		mn6_309_out {Type O LastRead -1 FirstWrite 6}
		mn6_308_out {Type O LastRead -1 FirstWrite 6}
		mn6_307_out {Type O LastRead -1 FirstWrite 6}
		mn6_306_out {Type O LastRead -1 FirstWrite 6}
		mn6_305_out {Type O LastRead -1 FirstWrite 6}
		mn6_304_out {Type O LastRead -1 FirstWrite 6}
		mn6_303_out {Type O LastRead -1 FirstWrite 6}
		mn6_302_out {Type O LastRead -1 FirstWrite 6}
		mn6_301_out {Type O LastRead -1 FirstWrite 6}
		mn6_300_out {Type O LastRead -1 FirstWrite 6}
		mn6_299_out {Type O LastRead -1 FirstWrite 6}
		mn6_298_out {Type O LastRead -1 FirstWrite 6}
		mn6_297_out {Type O LastRead -1 FirstWrite 6}
		mn6_296_out {Type O LastRead -1 FirstWrite 6}
		mn6_295_out {Type O LastRead -1 FirstWrite 6}
		mn6_294_out {Type O LastRead -1 FirstWrite 6}
		mn6_293_out {Type O LastRead -1 FirstWrite 6}
		mn6_292_out {Type O LastRead -1 FirstWrite 6}
		mn6_291_out {Type O LastRead -1 FirstWrite 6}
		mn6_290_out {Type O LastRead -1 FirstWrite 6}
		mn6_289_out {Type O LastRead -1 FirstWrite 6}
		mn6_288_out {Type O LastRead -1 FirstWrite 6}
		mn6_287_out {Type O LastRead -1 FirstWrite 6}
		mn6_286_out {Type O LastRead -1 FirstWrite 6}
		mn6_285_out {Type O LastRead -1 FirstWrite 6}
		mn6_284_out {Type O LastRead -1 FirstWrite 6}
		mn6_283_out {Type O LastRead -1 FirstWrite 6}
		mn6_282_out {Type O LastRead -1 FirstWrite 6}
		mn6_281_out {Type O LastRead -1 FirstWrite 6}
		mn6_280_out {Type O LastRead -1 FirstWrite 6}
		mn6_279_out {Type O LastRead -1 FirstWrite 6}
		mn6_278_out {Type O LastRead -1 FirstWrite 6}
		mn6_277_out {Type O LastRead -1 FirstWrite 6}
		mn6_276_out {Type O LastRead -1 FirstWrite 6}
		mn6_275_out {Type O LastRead -1 FirstWrite 6}
		mn6_274_out {Type O LastRead -1 FirstWrite 6}
		mn6_273_out {Type O LastRead -1 FirstWrite 6}
		mn6_272_out {Type O LastRead -1 FirstWrite 6}
		mn6_271_out {Type O LastRead -1 FirstWrite 6}
		mn6_270_out {Type O LastRead -1 FirstWrite 6}
		mn6_269_out {Type O LastRead -1 FirstWrite 6}
		mn6_268_out {Type O LastRead -1 FirstWrite 6}
		mn6_267_out {Type O LastRead -1 FirstWrite 6}
		mn6_266_out {Type O LastRead -1 FirstWrite 6}
		mn6_265_out {Type O LastRead -1 FirstWrite 6}
		mn6_264_out {Type O LastRead -1 FirstWrite 6}
		mn6_263_out {Type O LastRead -1 FirstWrite 6}
		mn6_262_out {Type O LastRead -1 FirstWrite 6}
		mn6_261_out {Type O LastRead -1 FirstWrite 6}
		mn6_260_out {Type O LastRead -1 FirstWrite 6}
		mn6_259_out {Type O LastRead -1 FirstWrite 6}
		mn6_258_out {Type O LastRead -1 FirstWrite 6}
		mn6_257_out {Type O LastRead -1 FirstWrite 6}
		mn6_256_out {Type O LastRead -1 FirstWrite 6}
		mn6_255_out {Type O LastRead -1 FirstWrite 6}
		mn6_254_out {Type O LastRead -1 FirstWrite 6}
		mn6_253_out {Type O LastRead -1 FirstWrite 6}
		mn6_252_out {Type O LastRead -1 FirstWrite 6}
		mn6_251_out {Type O LastRead -1 FirstWrite 6}
		mn6_250_out {Type O LastRead -1 FirstWrite 6}
		mn6_249_out {Type O LastRead -1 FirstWrite 6}
		mn6_248_out {Type O LastRead -1 FirstWrite 6}
		mn6_247_out {Type O LastRead -1 FirstWrite 6}
		mn6_246_out {Type O LastRead -1 FirstWrite 6}
		mn6_245_out {Type O LastRead -1 FirstWrite 6}
		mn6_244_out {Type O LastRead -1 FirstWrite 6}
		mn6_243_out {Type O LastRead -1 FirstWrite 6}
		mn6_242_out {Type O LastRead -1 FirstWrite 6}
		mn6_241_out {Type O LastRead -1 FirstWrite 6}
		mn6_240_out {Type O LastRead -1 FirstWrite 6}
		mn6_239_out {Type O LastRead -1 FirstWrite 6}
		mn6_238_out {Type O LastRead -1 FirstWrite 6}
		mn6_237_out {Type O LastRead -1 FirstWrite 6}
		mn6_236_out {Type O LastRead -1 FirstWrite 6}
		mn6_235_out {Type O LastRead -1 FirstWrite 6}
		mn6_234_out {Type O LastRead -1 FirstWrite 6}
		mn6_233_out {Type O LastRead -1 FirstWrite 6}
		mn6_232_out {Type O LastRead -1 FirstWrite 6}
		mn6_231_out {Type O LastRead -1 FirstWrite 6}
		mn6_230_out {Type O LastRead -1 FirstWrite 6}
		mn6_229_out {Type O LastRead -1 FirstWrite 6}
		mn6_228_out {Type O LastRead -1 FirstWrite 6}
		mn6_227_out {Type O LastRead -1 FirstWrite 6}
		mn6_226_out {Type O LastRead -1 FirstWrite 6}
		mn6_225_out {Type O LastRead -1 FirstWrite 6}
		mn6_224_out {Type O LastRead -1 FirstWrite 6}
		mn6_223_out {Type O LastRead -1 FirstWrite 6}
		mn6_222_out {Type O LastRead -1 FirstWrite 6}
		mn6_221_out {Type O LastRead -1 FirstWrite 6}
		mn6_220_out {Type O LastRead -1 FirstWrite 6}
		mn6_219_out {Type O LastRead -1 FirstWrite 6}
		mn6_218_out {Type O LastRead -1 FirstWrite 6}
		mn6_217_out {Type O LastRead -1 FirstWrite 6}
		mn6_216_out {Type O LastRead -1 FirstWrite 6}
		mn6_215_out {Type O LastRead -1 FirstWrite 6}
		mn6_214_out {Type O LastRead -1 FirstWrite 6}
		mn6_213_out {Type O LastRead -1 FirstWrite 6}
		mn6_212_out {Type O LastRead -1 FirstWrite 6}
		mn6_211_out {Type O LastRead -1 FirstWrite 6}
		mn6_210_out {Type O LastRead -1 FirstWrite 6}
		mn6_209_out {Type O LastRead -1 FirstWrite 6}
		mn6_208_out {Type O LastRead -1 FirstWrite 6}
		mn6_207_out {Type O LastRead -1 FirstWrite 6}
		mn6_206_out {Type O LastRead -1 FirstWrite 6}
		mn6_205_out {Type O LastRead -1 FirstWrite 6}
		mn6_204_out {Type O LastRead -1 FirstWrite 6}
		mn6_203_out {Type O LastRead -1 FirstWrite 6}
		mn6_202_out {Type O LastRead -1 FirstWrite 6}
		mn6_201_out {Type O LastRead -1 FirstWrite 6}
		mn6_200_out {Type O LastRead -1 FirstWrite 6}
		mn6_199_out {Type O LastRead -1 FirstWrite 6}
		mn6_198_out {Type O LastRead -1 FirstWrite 6}
		mn6_197_out {Type O LastRead -1 FirstWrite 6}
		mn6_196_out {Type O LastRead -1 FirstWrite 6}
		mn6_195_out {Type O LastRead -1 FirstWrite 6}
		mn6_194_out {Type O LastRead -1 FirstWrite 6}
		mn6_193_out {Type O LastRead -1 FirstWrite 6}
		mn6_192_out {Type O LastRead -1 FirstWrite 6}
		mn6_191_out {Type O LastRead -1 FirstWrite 6}
		mn6_190_out {Type O LastRead -1 FirstWrite 6}
		mn6_189_out {Type O LastRead -1 FirstWrite 6}
		mn6_188_out {Type O LastRead -1 FirstWrite 6}
		mn6_187_out {Type O LastRead -1 FirstWrite 6}
		mn6_186_out {Type O LastRead -1 FirstWrite 6}
		mn6_185_out {Type O LastRead -1 FirstWrite 6}
		mn6_184_out {Type O LastRead -1 FirstWrite 6}
		mn6_183_out {Type O LastRead -1 FirstWrite 6}
		mn6_182_out {Type O LastRead -1 FirstWrite 6}
		mn6_181_out {Type O LastRead -1 FirstWrite 6}
		mn6_180_out {Type O LastRead -1 FirstWrite 6}
		mn6_179_out {Type O LastRead -1 FirstWrite 6}
		mn6_178_out {Type O LastRead -1 FirstWrite 6}
		mn6_177_out {Type O LastRead -1 FirstWrite 6}
		mn6_176_out {Type O LastRead -1 FirstWrite 6}
		mn6_175_out {Type O LastRead -1 FirstWrite 6}
		mn6_174_out {Type O LastRead -1 FirstWrite 6}
		mn6_173_out {Type O LastRead -1 FirstWrite 6}
		mn6_172_out {Type O LastRead -1 FirstWrite 6}
		mn6_171_out {Type O LastRead -1 FirstWrite 6}
		mn6_170_out {Type O LastRead -1 FirstWrite 6}
		mn6_169_out {Type O LastRead -1 FirstWrite 6}
		mn6_168_out {Type O LastRead -1 FirstWrite 6}
		mn6_167_out {Type O LastRead -1 FirstWrite 6}
		mn6_166_out {Type O LastRead -1 FirstWrite 6}
		mn6_165_out {Type O LastRead -1 FirstWrite 6}
		mn6_164_out {Type O LastRead -1 FirstWrite 6}
		mn6_163_out {Type O LastRead -1 FirstWrite 6}
		mn6_162_out {Type O LastRead -1 FirstWrite 6}
		mn6_161_out {Type O LastRead -1 FirstWrite 6}
		mn6_160_out {Type O LastRead -1 FirstWrite 6}
		mn6_159_out {Type O LastRead -1 FirstWrite 6}
		mn6_158_out {Type O LastRead -1 FirstWrite 6}
		mn6_157_out {Type O LastRead -1 FirstWrite 6}
		mn6_156_out {Type O LastRead -1 FirstWrite 6}
		mn6_155_out {Type O LastRead -1 FirstWrite 6}
		mn6_154_out {Type O LastRead -1 FirstWrite 6}
		mn6_153_out {Type O LastRead -1 FirstWrite 6}
		mn6_152_out {Type O LastRead -1 FirstWrite 6}
		mn6_151_out {Type O LastRead -1 FirstWrite 6}
		mn6_150_out {Type O LastRead -1 FirstWrite 6}
		mn6_149_out {Type O LastRead -1 FirstWrite 6}
		mn6_148_out {Type O LastRead -1 FirstWrite 6}
		mn6_147_out {Type O LastRead -1 FirstWrite 6}
		mn6_146_out {Type O LastRead -1 FirstWrite 6}
		mn6_145_out {Type O LastRead -1 FirstWrite 6}
		mn6_144_out {Type O LastRead -1 FirstWrite 6}
		mn6_143_out {Type O LastRead -1 FirstWrite 6}
		mn6_142_out {Type O LastRead -1 FirstWrite 6}
		mn6_141_out {Type O LastRead -1 FirstWrite 6}
		mn6_140_out {Type O LastRead -1 FirstWrite 6}
		mn6_139_out {Type O LastRead -1 FirstWrite 6}
		mn6_138_out {Type O LastRead -1 FirstWrite 6}
		mn6_137_out {Type O LastRead -1 FirstWrite 6}
		mn6_136_out {Type O LastRead -1 FirstWrite 6}
		mn6_out {Type O LastRead -1 FirstWrite 6}
		sc6_390_out {Type O LastRead -1 FirstWrite 6}
		sc6_389_out {Type O LastRead -1 FirstWrite 6}
		sc6_388_out {Type O LastRead -1 FirstWrite 6}
		sc6_387_out {Type O LastRead -1 FirstWrite 6}
		sc6_386_out {Type O LastRead -1 FirstWrite 6}
		sc6_385_out {Type O LastRead -1 FirstWrite 6}
		sc6_384_out {Type O LastRead -1 FirstWrite 6}
		sc6_383_out {Type O LastRead -1 FirstWrite 6}
		sc6_382_out {Type O LastRead -1 FirstWrite 6}
		sc6_381_out {Type O LastRead -1 FirstWrite 6}
		sc6_380_out {Type O LastRead -1 FirstWrite 6}
		sc6_379_out {Type O LastRead -1 FirstWrite 6}
		sc6_378_out {Type O LastRead -1 FirstWrite 6}
		sc6_377_out {Type O LastRead -1 FirstWrite 6}
		sc6_376_out {Type O LastRead -1 FirstWrite 6}
		sc6_375_out {Type O LastRead -1 FirstWrite 6}
		sc6_374_out {Type O LastRead -1 FirstWrite 6}
		sc6_373_out {Type O LastRead -1 FirstWrite 6}
		sc6_372_out {Type O LastRead -1 FirstWrite 6}
		sc6_371_out {Type O LastRead -1 FirstWrite 6}
		sc6_370_out {Type O LastRead -1 FirstWrite 6}
		sc6_369_out {Type O LastRead -1 FirstWrite 6}
		sc6_368_out {Type O LastRead -1 FirstWrite 6}
		sc6_367_out {Type O LastRead -1 FirstWrite 6}
		sc6_366_out {Type O LastRead -1 FirstWrite 6}
		sc6_365_out {Type O LastRead -1 FirstWrite 6}
		sc6_364_out {Type O LastRead -1 FirstWrite 6}
		sc6_363_out {Type O LastRead -1 FirstWrite 6}
		sc6_362_out {Type O LastRead -1 FirstWrite 6}
		sc6_361_out {Type O LastRead -1 FirstWrite 6}
		sc6_360_out {Type O LastRead -1 FirstWrite 6}
		sc6_359_out {Type O LastRead -1 FirstWrite 6}
		sc6_358_out {Type O LastRead -1 FirstWrite 6}
		sc6_357_out {Type O LastRead -1 FirstWrite 6}
		sc6_356_out {Type O LastRead -1 FirstWrite 6}
		sc6_355_out {Type O LastRead -1 FirstWrite 6}
		sc6_354_out {Type O LastRead -1 FirstWrite 6}
		sc6_353_out {Type O LastRead -1 FirstWrite 6}
		sc6_352_out {Type O LastRead -1 FirstWrite 6}
		sc6_351_out {Type O LastRead -1 FirstWrite 6}
		sc6_350_out {Type O LastRead -1 FirstWrite 6}
		sc6_349_out {Type O LastRead -1 FirstWrite 6}
		sc6_348_out {Type O LastRead -1 FirstWrite 6}
		sc6_347_out {Type O LastRead -1 FirstWrite 6}
		sc6_346_out {Type O LastRead -1 FirstWrite 6}
		sc6_345_out {Type O LastRead -1 FirstWrite 6}
		sc6_344_out {Type O LastRead -1 FirstWrite 6}
		sc6_343_out {Type O LastRead -1 FirstWrite 6}
		sc6_342_out {Type O LastRead -1 FirstWrite 6}
		sc6_341_out {Type O LastRead -1 FirstWrite 6}
		sc6_340_out {Type O LastRead -1 FirstWrite 6}
		sc6_339_out {Type O LastRead -1 FirstWrite 6}
		sc6_338_out {Type O LastRead -1 FirstWrite 6}
		sc6_337_out {Type O LastRead -1 FirstWrite 6}
		sc6_336_out {Type O LastRead -1 FirstWrite 6}
		sc6_335_out {Type O LastRead -1 FirstWrite 6}
		sc6_334_out {Type O LastRead -1 FirstWrite 6}
		sc6_333_out {Type O LastRead -1 FirstWrite 6}
		sc6_332_out {Type O LastRead -1 FirstWrite 6}
		sc6_331_out {Type O LastRead -1 FirstWrite 6}
		sc6_330_out {Type O LastRead -1 FirstWrite 6}
		sc6_329_out {Type O LastRead -1 FirstWrite 6}
		sc6_328_out {Type O LastRead -1 FirstWrite 6}
		sc6_327_out {Type O LastRead -1 FirstWrite 6}
		sc6_326_out {Type O LastRead -1 FirstWrite 6}
		sc6_325_out {Type O LastRead -1 FirstWrite 6}
		sc6_324_out {Type O LastRead -1 FirstWrite 6}
		sc6_323_out {Type O LastRead -1 FirstWrite 6}
		sc6_322_out {Type O LastRead -1 FirstWrite 6}
		sc6_321_out {Type O LastRead -1 FirstWrite 6}
		sc6_320_out {Type O LastRead -1 FirstWrite 6}
		sc6_319_out {Type O LastRead -1 FirstWrite 6}
		sc6_318_out {Type O LastRead -1 FirstWrite 6}
		sc6_317_out {Type O LastRead -1 FirstWrite 6}
		sc6_316_out {Type O LastRead -1 FirstWrite 6}
		sc6_315_out {Type O LastRead -1 FirstWrite 6}
		sc6_314_out {Type O LastRead -1 FirstWrite 6}
		sc6_313_out {Type O LastRead -1 FirstWrite 6}
		sc6_312_out {Type O LastRead -1 FirstWrite 6}
		sc6_311_out {Type O LastRead -1 FirstWrite 6}
		sc6_310_out {Type O LastRead -1 FirstWrite 6}
		sc6_309_out {Type O LastRead -1 FirstWrite 6}
		sc6_308_out {Type O LastRead -1 FirstWrite 6}
		sc6_307_out {Type O LastRead -1 FirstWrite 6}
		sc6_306_out {Type O LastRead -1 FirstWrite 6}
		sc6_305_out {Type O LastRead -1 FirstWrite 6}
		sc6_304_out {Type O LastRead -1 FirstWrite 6}
		sc6_303_out {Type O LastRead -1 FirstWrite 6}
		sc6_302_out {Type O LastRead -1 FirstWrite 6}
		sc6_301_out {Type O LastRead -1 FirstWrite 6}
		sc6_300_out {Type O LastRead -1 FirstWrite 6}
		sc6_299_out {Type O LastRead -1 FirstWrite 6}
		sc6_298_out {Type O LastRead -1 FirstWrite 6}
		sc6_297_out {Type O LastRead -1 FirstWrite 6}
		sc6_296_out {Type O LastRead -1 FirstWrite 6}
		sc6_295_out {Type O LastRead -1 FirstWrite 6}
		sc6_294_out {Type O LastRead -1 FirstWrite 6}
		sc6_293_out {Type O LastRead -1 FirstWrite 6}
		sc6_292_out {Type O LastRead -1 FirstWrite 6}
		sc6_291_out {Type O LastRead -1 FirstWrite 6}
		sc6_290_out {Type O LastRead -1 FirstWrite 6}
		sc6_289_out {Type O LastRead -1 FirstWrite 6}
		sc6_288_out {Type O LastRead -1 FirstWrite 6}
		sc6_287_out {Type O LastRead -1 FirstWrite 6}
		sc6_286_out {Type O LastRead -1 FirstWrite 6}
		sc6_285_out {Type O LastRead -1 FirstWrite 6}
		sc6_284_out {Type O LastRead -1 FirstWrite 6}
		sc6_283_out {Type O LastRead -1 FirstWrite 6}
		sc6_282_out {Type O LastRead -1 FirstWrite 6}
		sc6_281_out {Type O LastRead -1 FirstWrite 6}
		sc6_280_out {Type O LastRead -1 FirstWrite 6}
		sc6_279_out {Type O LastRead -1 FirstWrite 6}
		sc6_278_out {Type O LastRead -1 FirstWrite 6}
		sc6_277_out {Type O LastRead -1 FirstWrite 6}
		sc6_276_out {Type O LastRead -1 FirstWrite 6}
		sc6_275_out {Type O LastRead -1 FirstWrite 6}
		sc6_274_out {Type O LastRead -1 FirstWrite 6}
		sc6_273_out {Type O LastRead -1 FirstWrite 6}
		sc6_272_out {Type O LastRead -1 FirstWrite 6}
		sc6_271_out {Type O LastRead -1 FirstWrite 6}
		sc6_270_out {Type O LastRead -1 FirstWrite 6}
		sc6_269_out {Type O LastRead -1 FirstWrite 6}
		sc6_268_out {Type O LastRead -1 FirstWrite 6}
		sc6_267_out {Type O LastRead -1 FirstWrite 6}
		sc6_266_out {Type O LastRead -1 FirstWrite 6}
		sc6_265_out {Type O LastRead -1 FirstWrite 6}
		sc6_264_out {Type O LastRead -1 FirstWrite 6}
		sc6_263_out {Type O LastRead -1 FirstWrite 6}
		sc6_262_out {Type O LastRead -1 FirstWrite 6}
		sc6_261_out {Type O LastRead -1 FirstWrite 6}
		sc6_260_out {Type O LastRead -1 FirstWrite 6}
		sc6_259_out {Type O LastRead -1 FirstWrite 6}
		sc6_258_out {Type O LastRead -1 FirstWrite 6}
		sc6_257_out {Type O LastRead -1 FirstWrite 6}
		sc6_256_out {Type O LastRead -1 FirstWrite 6}
		sc6_255_out {Type O LastRead -1 FirstWrite 6}
		sc6_254_out {Type O LastRead -1 FirstWrite 6}
		sc6_253_out {Type O LastRead -1 FirstWrite 6}
		sc6_252_out {Type O LastRead -1 FirstWrite 6}
		sc6_251_out {Type O LastRead -1 FirstWrite 6}
		sc6_250_out {Type O LastRead -1 FirstWrite 6}
		sc6_249_out {Type O LastRead -1 FirstWrite 6}
		sc6_248_out {Type O LastRead -1 FirstWrite 6}
		sc6_247_out {Type O LastRead -1 FirstWrite 6}
		sc6_246_out {Type O LastRead -1 FirstWrite 6}
		sc6_245_out {Type O LastRead -1 FirstWrite 6}
		sc6_244_out {Type O LastRead -1 FirstWrite 6}
		sc6_243_out {Type O LastRead -1 FirstWrite 6}
		sc6_242_out {Type O LastRead -1 FirstWrite 6}
		sc6_241_out {Type O LastRead -1 FirstWrite 6}
		sc6_240_out {Type O LastRead -1 FirstWrite 6}
		sc6_239_out {Type O LastRead -1 FirstWrite 6}
		sc6_238_out {Type O LastRead -1 FirstWrite 6}
		sc6_237_out {Type O LastRead -1 FirstWrite 6}
		sc6_236_out {Type O LastRead -1 FirstWrite 6}
		sc6_235_out {Type O LastRead -1 FirstWrite 6}
		sc6_234_out {Type O LastRead -1 FirstWrite 6}
		sc6_233_out {Type O LastRead -1 FirstWrite 6}
		sc6_232_out {Type O LastRead -1 FirstWrite 6}
		sc6_231_out {Type O LastRead -1 FirstWrite 6}
		sc6_230_out {Type O LastRead -1 FirstWrite 6}
		sc6_229_out {Type O LastRead -1 FirstWrite 6}
		sc6_228_out {Type O LastRead -1 FirstWrite 6}
		sc6_227_out {Type O LastRead -1 FirstWrite 6}
		sc6_226_out {Type O LastRead -1 FirstWrite 6}
		sc6_225_out {Type O LastRead -1 FirstWrite 6}
		sc6_224_out {Type O LastRead -1 FirstWrite 6}
		sc6_223_out {Type O LastRead -1 FirstWrite 6}
		sc6_222_out {Type O LastRead -1 FirstWrite 6}
		sc6_221_out {Type O LastRead -1 FirstWrite 6}
		sc6_220_out {Type O LastRead -1 FirstWrite 6}
		sc6_219_out {Type O LastRead -1 FirstWrite 6}
		sc6_218_out {Type O LastRead -1 FirstWrite 6}
		sc6_217_out {Type O LastRead -1 FirstWrite 6}
		sc6_216_out {Type O LastRead -1 FirstWrite 6}
		sc6_215_out {Type O LastRead -1 FirstWrite 6}
		sc6_214_out {Type O LastRead -1 FirstWrite 6}
		sc6_213_out {Type O LastRead -1 FirstWrite 6}
		sc6_212_out {Type O LastRead -1 FirstWrite 6}
		sc6_211_out {Type O LastRead -1 FirstWrite 6}
		sc6_210_out {Type O LastRead -1 FirstWrite 6}
		sc6_209_out {Type O LastRead -1 FirstWrite 6}
		sc6_208_out {Type O LastRead -1 FirstWrite 6}
		sc6_207_out {Type O LastRead -1 FirstWrite 6}
		sc6_206_out {Type O LastRead -1 FirstWrite 6}
		sc6_205_out {Type O LastRead -1 FirstWrite 6}
		sc6_204_out {Type O LastRead -1 FirstWrite 6}
		sc6_203_out {Type O LastRead -1 FirstWrite 6}
		sc6_202_out {Type O LastRead -1 FirstWrite 6}
		sc6_201_out {Type O LastRead -1 FirstWrite 6}
		sc6_200_out {Type O LastRead -1 FirstWrite 6}
		sc6_199_out {Type O LastRead -1 FirstWrite 6}
		sc6_198_out {Type O LastRead -1 FirstWrite 6}
		sc6_197_out {Type O LastRead -1 FirstWrite 6}
		sc6_196_out {Type O LastRead -1 FirstWrite 6}
		sc6_195_out {Type O LastRead -1 FirstWrite 6}
		sc6_194_out {Type O LastRead -1 FirstWrite 6}
		sc6_193_out {Type O LastRead -1 FirstWrite 6}
		sc6_192_out {Type O LastRead -1 FirstWrite 6}
		sc6_191_out {Type O LastRead -1 FirstWrite 6}
		sc6_190_out {Type O LastRead -1 FirstWrite 6}
		sc6_189_out {Type O LastRead -1 FirstWrite 6}
		sc6_188_out {Type O LastRead -1 FirstWrite 6}
		sc6_187_out {Type O LastRead -1 FirstWrite 6}
		sc6_186_out {Type O LastRead -1 FirstWrite 6}
		sc6_185_out {Type O LastRead -1 FirstWrite 6}
		sc6_184_out {Type O LastRead -1 FirstWrite 6}
		sc6_183_out {Type O LastRead -1 FirstWrite 6}
		sc6_182_out {Type O LastRead -1 FirstWrite 6}
		sc6_181_out {Type O LastRead -1 FirstWrite 6}
		sc6_180_out {Type O LastRead -1 FirstWrite 6}
		sc6_179_out {Type O LastRead -1 FirstWrite 6}
		sc6_178_out {Type O LastRead -1 FirstWrite 6}
		sc6_177_out {Type O LastRead -1 FirstWrite 6}
		sc6_176_out {Type O LastRead -1 FirstWrite 6}
		sc6_175_out {Type O LastRead -1 FirstWrite 6}
		sc6_174_out {Type O LastRead -1 FirstWrite 6}
		sc6_173_out {Type O LastRead -1 FirstWrite 6}
		sc6_172_out {Type O LastRead -1 FirstWrite 6}
		sc6_171_out {Type O LastRead -1 FirstWrite 6}
		sc6_170_out {Type O LastRead -1 FirstWrite 6}
		sc6_169_out {Type O LastRead -1 FirstWrite 6}
		sc6_168_out {Type O LastRead -1 FirstWrite 6}
		sc6_167_out {Type O LastRead -1 FirstWrite 6}
		sc6_166_out {Type O LastRead -1 FirstWrite 6}
		sc6_165_out {Type O LastRead -1 FirstWrite 6}
		sc6_164_out {Type O LastRead -1 FirstWrite 6}
		sc6_163_out {Type O LastRead -1 FirstWrite 6}
		sc6_162_out {Type O LastRead -1 FirstWrite 6}
		sc6_161_out {Type O LastRead -1 FirstWrite 6}
		sc6_160_out {Type O LastRead -1 FirstWrite 6}
		sc6_159_out {Type O LastRead -1 FirstWrite 6}
		sc6_158_out {Type O LastRead -1 FirstWrite 6}
		sc6_157_out {Type O LastRead -1 FirstWrite 6}
		sc6_156_out {Type O LastRead -1 FirstWrite 6}
		sc6_155_out {Type O LastRead -1 FirstWrite 6}
		sc6_154_out {Type O LastRead -1 FirstWrite 6}
		sc6_153_out {Type O LastRead -1 FirstWrite 6}
		sc6_152_out {Type O LastRead -1 FirstWrite 6}
		sc6_151_out {Type O LastRead -1 FirstWrite 6}
		sc6_150_out {Type O LastRead -1 FirstWrite 6}
		sc6_149_out {Type O LastRead -1 FirstWrite 6}
		sc6_148_out {Type O LastRead -1 FirstWrite 6}
		sc6_147_out {Type O LastRead -1 FirstWrite 6}
		sc6_146_out {Type O LastRead -1 FirstWrite 6}
		sc6_145_out {Type O LastRead -1 FirstWrite 6}
		sc6_144_out {Type O LastRead -1 FirstWrite 6}
		sc6_143_out {Type O LastRead -1 FirstWrite 6}
		sc6_142_out {Type O LastRead -1 FirstWrite 6}
		sc6_141_out {Type O LastRead -1 FirstWrite 6}
		sc6_140_out {Type O LastRead -1 FirstWrite 6}
		sc6_139_out {Type O LastRead -1 FirstWrite 6}
		sc6_138_out {Type O LastRead -1 FirstWrite 6}
		sc6_137_out {Type O LastRead -1 FirstWrite 6}
		sc6_136_out {Type O LastRead -1 FirstWrite 6}
		sc6_out {Type O LastRead -1 FirstWrite 6}
		dmin_31_out {Type O LastRead -1 FirstWrite 6}
		dmin_30_out {Type O LastRead -1 FirstWrite 6}
		dmin_29_out {Type O LastRead -1 FirstWrite 6}
		dmin_28_out {Type O LastRead -1 FirstWrite 6}
		dmin_27_out {Type O LastRead -1 FirstWrite 6}
		dmin_26_out {Type O LastRead -1 FirstWrite 6}
		dmin_25_out {Type O LastRead -1 FirstWrite 6}
		dmin_24_out {Type O LastRead -1 FirstWrite 6}
		dmin_23_out {Type O LastRead -1 FirstWrite 6}
		dmin_22_out {Type O LastRead -1 FirstWrite 6}
		dmin_21_out {Type O LastRead -1 FirstWrite 6}
		dmin_20_out {Type O LastRead -1 FirstWrite 6}
		dmin_19_out {Type O LastRead -1 FirstWrite 6}
		dmin_18_out {Type O LastRead -1 FirstWrite 6}
		dmin_17_out {Type O LastRead -1 FirstWrite 6}
		dmin_16_out {Type O LastRead -1 FirstWrite 6}
		dmin_15_out {Type O LastRead -1 FirstWrite 6}
		dmin_14_out {Type O LastRead -1 FirstWrite 6}
		dmin_13_out {Type O LastRead -1 FirstWrite 6}
		dmin_12_out {Type O LastRead -1 FirstWrite 6}
		dmin_11_out {Type O LastRead -1 FirstWrite 6}
		dmin_10_out {Type O LastRead -1 FirstWrite 6}
		dmin_9_out {Type O LastRead -1 FirstWrite 6}
		dmin_8_out {Type O LastRead -1 FirstWrite 6}
		dmin_7_out {Type O LastRead -1 FirstWrite 6}
		dmin_6_out {Type O LastRead -1 FirstWrite 6}
		dmin_5_out {Type O LastRead -1 FirstWrite 6}
		dmin_4_out {Type O LastRead -1 FirstWrite 6}
		dmin_3_out {Type O LastRead -1 FirstWrite 6}
		dmin_2_out {Type O LastRead -1 FirstWrite 6}
		dmin_1_out {Type O LastRead -1 FirstWrite 6}
		dmin_out {Type O LastRead -1 FirstWrite 6}
		d_31_out {Type O LastRead -1 FirstWrite 6}
		d_30_out {Type O LastRead -1 FirstWrite 6}
		d_29_out {Type O LastRead -1 FirstWrite 6}
		d_28_out {Type O LastRead -1 FirstWrite 6}
		d_27_out {Type O LastRead -1 FirstWrite 6}
		d_26_out {Type O LastRead -1 FirstWrite 6}
		d_25_out {Type O LastRead -1 FirstWrite 6}
		d_24_out {Type O LastRead -1 FirstWrite 6}
		d_23_out {Type O LastRead -1 FirstWrite 6}
		d_22_out {Type O LastRead -1 FirstWrite 6}
		d_21_out {Type O LastRead -1 FirstWrite 6}
		d_20_out {Type O LastRead -1 FirstWrite 6}
		d_19_out {Type O LastRead -1 FirstWrite 6}
		d_18_out {Type O LastRead -1 FirstWrite 6}
		d_17_out {Type O LastRead -1 FirstWrite 6}
		d_16_out {Type O LastRead -1 FirstWrite 6}
		d_15_out {Type O LastRead -1 FirstWrite 6}
		d_14_out {Type O LastRead -1 FirstWrite 6}
		d_13_out {Type O LastRead -1 FirstWrite 6}
		d_12_out {Type O LastRead -1 FirstWrite 6}
		d_11_out {Type O LastRead -1 FirstWrite 6}
		d_10_out {Type O LastRead -1 FirstWrite 6}
		d_9_out {Type O LastRead -1 FirstWrite 6}
		d_8_out {Type O LastRead -1 FirstWrite 6}
		d_7_out {Type O LastRead -1 FirstWrite 6}
		d_6_out {Type O LastRead -1 FirstWrite 6}
		d_5_out {Type O LastRead -1 FirstWrite 6}
		d_4_out {Type O LastRead -1 FirstWrite 6}
		d_3_out {Type O LastRead -1 FirstWrite 6}
		d_2_out {Type O LastRead -1 FirstWrite 6}
		d_1_out {Type O LastRead -1 FirstWrite 6}
		d_out {Type O LastRead -1 FirstWrite 6}}
	fp16_to_fp32 {
		h {Type I LastRead 0 FirstWrite -1}}
	fp16_to_fp32 {
		h {Type I LastRead 0 FirstWrite -1}}
	mac_blocks_down_q4k7_Pipeline_MAC_GROUP {
		zext_ln425 {Type I LastRead 0 FirstWrite -1}
		gate_0 {Type I LastRead 1 FirstWrite -1}
		gate_1 {Type I LastRead 1 FirstWrite -1}
		gate_2 {Type I LastRead 1 FirstWrite -1}
		gate_3 {Type I LastRead 1 FirstWrite -1}
		gate_4 {Type I LastRead 1 FirstWrite -1}
		gate_5 {Type I LastRead 1 FirstWrite -1}
		gate_6 {Type I LastRead 1 FirstWrite -1}
		gate_7 {Type I LastRead 1 FirstWrite -1}
		mul_ln79_1 {Type I LastRead 0 FirstWrite -1}
		rb_0 {Type I LastRead 1 FirstWrite -1}
		rb_1 {Type I LastRead 1 FirstWrite -1}
		rb_2 {Type I LastRead 1 FirstWrite -1}
		rb_3 {Type I LastRead 1 FirstWrite -1}
		rb_4 {Type I LastRead 1 FirstWrite -1}
		rb_5 {Type I LastRead 1 FirstWrite -1}
		rb_6 {Type I LastRead 1 FirstWrite -1}
		rb_7 {Type I LastRead 1 FirstWrite -1}
		empty_170 {Type I LastRead 0 FirstWrite -1}
		empty_171 {Type I LastRead 0 FirstWrite -1}
		empty_172 {Type I LastRead 0 FirstWrite -1}
		empty_173 {Type I LastRead 0 FirstWrite -1}
		empty_174 {Type I LastRead 0 FirstWrite -1}
		empty_175 {Type I LastRead 0 FirstWrite -1}
		empty_176 {Type I LastRead 0 FirstWrite -1}
		empty_177 {Type I LastRead 0 FirstWrite -1}
		empty_178 {Type I LastRead 0 FirstWrite -1}
		empty_179 {Type I LastRead 0 FirstWrite -1}
		empty_180 {Type I LastRead 0 FirstWrite -1}
		empty_181 {Type I LastRead 0 FirstWrite -1}
		empty_182 {Type I LastRead 0 FirstWrite -1}
		empty_183 {Type I LastRead 0 FirstWrite -1}
		empty_184 {Type I LastRead 0 FirstWrite -1}
		empty_185 {Type I LastRead 0 FirstWrite -1}
		empty_186 {Type I LastRead 0 FirstWrite -1}
		empty_187 {Type I LastRead 0 FirstWrite -1}
		empty_188 {Type I LastRead 0 FirstWrite -1}
		empty_189 {Type I LastRead 0 FirstWrite -1}
		empty_190 {Type I LastRead 0 FirstWrite -1}
		empty_191 {Type I LastRead 0 FirstWrite -1}
		empty_192 {Type I LastRead 0 FirstWrite -1}
		empty_193 {Type I LastRead 0 FirstWrite -1}
		empty_194 {Type I LastRead 0 FirstWrite -1}
		empty_195 {Type I LastRead 0 FirstWrite -1}
		empty_196 {Type I LastRead 0 FirstWrite -1}
		empty_197 {Type I LastRead 0 FirstWrite -1}
		empty_198 {Type I LastRead 0 FirstWrite -1}
		empty_199 {Type I LastRead 0 FirstWrite -1}
		empty_200 {Type I LastRead 0 FirstWrite -1}
		empty_201 {Type I LastRead 0 FirstWrite -1}
		empty_202 {Type I LastRead 0 FirstWrite -1}
		empty_203 {Type I LastRead 0 FirstWrite -1}
		empty_204 {Type I LastRead 0 FirstWrite -1}
		empty_205 {Type I LastRead 0 FirstWrite -1}
		empty_206 {Type I LastRead 0 FirstWrite -1}
		empty_207 {Type I LastRead 0 FirstWrite -1}
		empty_208 {Type I LastRead 0 FirstWrite -1}
		empty_209 {Type I LastRead 0 FirstWrite -1}
		empty_210 {Type I LastRead 0 FirstWrite -1}
		empty_211 {Type I LastRead 0 FirstWrite -1}
		empty_212 {Type I LastRead 0 FirstWrite -1}
		empty_213 {Type I LastRead 0 FirstWrite -1}
		empty_214 {Type I LastRead 0 FirstWrite -1}
		empty_215 {Type I LastRead 0 FirstWrite -1}
		empty_216 {Type I LastRead 0 FirstWrite -1}
		empty_217 {Type I LastRead 0 FirstWrite -1}
		empty_218 {Type I LastRead 0 FirstWrite -1}
		empty_219 {Type I LastRead 0 FirstWrite -1}
		empty_220 {Type I LastRead 0 FirstWrite -1}
		empty_221 {Type I LastRead 0 FirstWrite -1}
		empty_222 {Type I LastRead 0 FirstWrite -1}
		empty_223 {Type I LastRead 0 FirstWrite -1}
		empty_224 {Type I LastRead 0 FirstWrite -1}
		empty_225 {Type I LastRead 0 FirstWrite -1}
		empty_226 {Type I LastRead 0 FirstWrite -1}
		empty_227 {Type I LastRead 0 FirstWrite -1}
		empty_228 {Type I LastRead 0 FirstWrite -1}
		empty_229 {Type I LastRead 0 FirstWrite -1}
		empty_230 {Type I LastRead 0 FirstWrite -1}
		empty_231 {Type I LastRead 0 FirstWrite -1}
		empty_232 {Type I LastRead 0 FirstWrite -1}
		empty_233 {Type I LastRead 0 FirstWrite -1}
		empty_234 {Type I LastRead 0 FirstWrite -1}
		empty_235 {Type I LastRead 0 FirstWrite -1}
		empty_236 {Type I LastRead 0 FirstWrite -1}
		empty_237 {Type I LastRead 0 FirstWrite -1}
		empty_238 {Type I LastRead 0 FirstWrite -1}
		empty_239 {Type I LastRead 0 FirstWrite -1}
		empty_240 {Type I LastRead 0 FirstWrite -1}
		empty_241 {Type I LastRead 0 FirstWrite -1}
		empty_242 {Type I LastRead 0 FirstWrite -1}
		empty_243 {Type I LastRead 0 FirstWrite -1}
		empty_244 {Type I LastRead 0 FirstWrite -1}
		empty_245 {Type I LastRead 0 FirstWrite -1}
		empty_246 {Type I LastRead 0 FirstWrite -1}
		empty_247 {Type I LastRead 0 FirstWrite -1}
		empty_248 {Type I LastRead 0 FirstWrite -1}
		empty_249 {Type I LastRead 0 FirstWrite -1}
		empty_250 {Type I LastRead 0 FirstWrite -1}
		empty_251 {Type I LastRead 0 FirstWrite -1}
		empty_252 {Type I LastRead 0 FirstWrite -1}
		empty_253 {Type I LastRead 0 FirstWrite -1}
		empty_254 {Type I LastRead 0 FirstWrite -1}
		empty_255 {Type I LastRead 0 FirstWrite -1}
		empty_256 {Type I LastRead 0 FirstWrite -1}
		empty_257 {Type I LastRead 0 FirstWrite -1}
		empty_258 {Type I LastRead 0 FirstWrite -1}
		empty_259 {Type I LastRead 0 FirstWrite -1}
		empty_260 {Type I LastRead 0 FirstWrite -1}
		empty_261 {Type I LastRead 0 FirstWrite -1}
		empty_262 {Type I LastRead 0 FirstWrite -1}
		empty_263 {Type I LastRead 0 FirstWrite -1}
		empty_264 {Type I LastRead 0 FirstWrite -1}
		empty_265 {Type I LastRead 0 FirstWrite -1}
		empty_266 {Type I LastRead 0 FirstWrite -1}
		empty_267 {Type I LastRead 0 FirstWrite -1}
		empty_268 {Type I LastRead 0 FirstWrite -1}
		empty_269 {Type I LastRead 0 FirstWrite -1}
		empty_270 {Type I LastRead 0 FirstWrite -1}
		empty_271 {Type I LastRead 0 FirstWrite -1}
		empty_272 {Type I LastRead 0 FirstWrite -1}
		empty_273 {Type I LastRead 0 FirstWrite -1}
		empty_274 {Type I LastRead 0 FirstWrite -1}
		empty_275 {Type I LastRead 0 FirstWrite -1}
		empty_276 {Type I LastRead 0 FirstWrite -1}
		empty_277 {Type I LastRead 0 FirstWrite -1}
		empty_278 {Type I LastRead 0 FirstWrite -1}
		empty_279 {Type I LastRead 0 FirstWrite -1}
		empty_280 {Type I LastRead 0 FirstWrite -1}
		empty_281 {Type I LastRead 0 FirstWrite -1}
		empty_282 {Type I LastRead 0 FirstWrite -1}
		empty_283 {Type I LastRead 0 FirstWrite -1}
		empty_284 {Type I LastRead 0 FirstWrite -1}
		empty_285 {Type I LastRead 0 FirstWrite -1}
		empty_286 {Type I LastRead 0 FirstWrite -1}
		empty_287 {Type I LastRead 0 FirstWrite -1}
		empty_288 {Type I LastRead 0 FirstWrite -1}
		empty_289 {Type I LastRead 0 FirstWrite -1}
		empty_290 {Type I LastRead 0 FirstWrite -1}
		empty_291 {Type I LastRead 0 FirstWrite -1}
		empty_292 {Type I LastRead 0 FirstWrite -1}
		empty_293 {Type I LastRead 0 FirstWrite -1}
		empty_294 {Type I LastRead 0 FirstWrite -1}
		empty_295 {Type I LastRead 0 FirstWrite -1}
		empty_296 {Type I LastRead 0 FirstWrite -1}
		empty_297 {Type I LastRead 0 FirstWrite -1}
		empty_298 {Type I LastRead 0 FirstWrite -1}
		empty_299 {Type I LastRead 0 FirstWrite -1}
		empty_300 {Type I LastRead 0 FirstWrite -1}
		empty_301 {Type I LastRead 0 FirstWrite -1}
		empty_302 {Type I LastRead 0 FirstWrite -1}
		empty_303 {Type I LastRead 0 FirstWrite -1}
		empty_304 {Type I LastRead 0 FirstWrite -1}
		empty_305 {Type I LastRead 0 FirstWrite -1}
		empty_306 {Type I LastRead 0 FirstWrite -1}
		empty_307 {Type I LastRead 0 FirstWrite -1}
		empty_308 {Type I LastRead 0 FirstWrite -1}
		empty_309 {Type I LastRead 0 FirstWrite -1}
		empty_310 {Type I LastRead 0 FirstWrite -1}
		empty_311 {Type I LastRead 0 FirstWrite -1}
		empty_312 {Type I LastRead 0 FirstWrite -1}
		empty_313 {Type I LastRead 0 FirstWrite -1}
		empty_314 {Type I LastRead 0 FirstWrite -1}
		empty_315 {Type I LastRead 0 FirstWrite -1}
		empty_316 {Type I LastRead 0 FirstWrite -1}
		empty_317 {Type I LastRead 0 FirstWrite -1}
		empty_318 {Type I LastRead 0 FirstWrite -1}
		empty_319 {Type I LastRead 0 FirstWrite -1}
		empty_320 {Type I LastRead 0 FirstWrite -1}
		empty_321 {Type I LastRead 0 FirstWrite -1}
		empty_322 {Type I LastRead 0 FirstWrite -1}
		empty_323 {Type I LastRead 0 FirstWrite -1}
		empty_324 {Type I LastRead 0 FirstWrite -1}
		empty_325 {Type I LastRead 0 FirstWrite -1}
		empty_326 {Type I LastRead 0 FirstWrite -1}
		empty_327 {Type I LastRead 0 FirstWrite -1}
		empty_328 {Type I LastRead 0 FirstWrite -1}
		empty_329 {Type I LastRead 0 FirstWrite -1}
		empty_330 {Type I LastRead 0 FirstWrite -1}
		empty_331 {Type I LastRead 0 FirstWrite -1}
		empty_332 {Type I LastRead 0 FirstWrite -1}
		empty_333 {Type I LastRead 0 FirstWrite -1}
		empty_334 {Type I LastRead 0 FirstWrite -1}
		empty_335 {Type I LastRead 0 FirstWrite -1}
		empty_336 {Type I LastRead 0 FirstWrite -1}
		empty_337 {Type I LastRead 0 FirstWrite -1}
		empty_338 {Type I LastRead 0 FirstWrite -1}
		empty_339 {Type I LastRead 0 FirstWrite -1}
		empty_340 {Type I LastRead 0 FirstWrite -1}
		empty_341 {Type I LastRead 0 FirstWrite -1}
		empty_342 {Type I LastRead 0 FirstWrite -1}
		empty_343 {Type I LastRead 0 FirstWrite -1}
		empty_344 {Type I LastRead 0 FirstWrite -1}
		empty_345 {Type I LastRead 0 FirstWrite -1}
		empty_346 {Type I LastRead 0 FirstWrite -1}
		empty_347 {Type I LastRead 0 FirstWrite -1}
		empty_348 {Type I LastRead 0 FirstWrite -1}
		empty_349 {Type I LastRead 0 FirstWrite -1}
		empty_350 {Type I LastRead 0 FirstWrite -1}
		empty_351 {Type I LastRead 0 FirstWrite -1}
		empty_352 {Type I LastRead 0 FirstWrite -1}
		empty_353 {Type I LastRead 0 FirstWrite -1}
		empty_354 {Type I LastRead 0 FirstWrite -1}
		empty_355 {Type I LastRead 0 FirstWrite -1}
		empty_356 {Type I LastRead 0 FirstWrite -1}
		empty_357 {Type I LastRead 0 FirstWrite -1}
		empty_358 {Type I LastRead 0 FirstWrite -1}
		empty_359 {Type I LastRead 0 FirstWrite -1}
		empty_360 {Type I LastRead 0 FirstWrite -1}
		empty_361 {Type I LastRead 0 FirstWrite -1}
		empty_362 {Type I LastRead 0 FirstWrite -1}
		empty_363 {Type I LastRead 0 FirstWrite -1}
		empty_364 {Type I LastRead 0 FirstWrite -1}
		empty_365 {Type I LastRead 0 FirstWrite -1}
		empty_366 {Type I LastRead 0 FirstWrite -1}
		empty_367 {Type I LastRead 0 FirstWrite -1}
		empty_368 {Type I LastRead 0 FirstWrite -1}
		empty_369 {Type I LastRead 0 FirstWrite -1}
		empty_370 {Type I LastRead 0 FirstWrite -1}
		empty_371 {Type I LastRead 0 FirstWrite -1}
		empty_372 {Type I LastRead 0 FirstWrite -1}
		empty_373 {Type I LastRead 0 FirstWrite -1}
		empty_374 {Type I LastRead 0 FirstWrite -1}
		empty_375 {Type I LastRead 0 FirstWrite -1}
		empty_376 {Type I LastRead 0 FirstWrite -1}
		empty_377 {Type I LastRead 0 FirstWrite -1}
		empty_378 {Type I LastRead 0 FirstWrite -1}
		empty_379 {Type I LastRead 0 FirstWrite -1}
		empty_380 {Type I LastRead 0 FirstWrite -1}
		empty_381 {Type I LastRead 0 FirstWrite -1}
		empty_382 {Type I LastRead 0 FirstWrite -1}
		empty_383 {Type I LastRead 0 FirstWrite -1}
		empty_384 {Type I LastRead 0 FirstWrite -1}
		empty_385 {Type I LastRead 0 FirstWrite -1}
		empty_386 {Type I LastRead 0 FirstWrite -1}
		empty_387 {Type I LastRead 0 FirstWrite -1}
		empty_388 {Type I LastRead 0 FirstWrite -1}
		empty_389 {Type I LastRead 0 FirstWrite -1}
		empty_390 {Type I LastRead 0 FirstWrite -1}
		empty_391 {Type I LastRead 0 FirstWrite -1}
		empty_392 {Type I LastRead 0 FirstWrite -1}
		empty_393 {Type I LastRead 0 FirstWrite -1}
		empty_394 {Type I LastRead 0 FirstWrite -1}
		empty_395 {Type I LastRead 0 FirstWrite -1}
		empty_396 {Type I LastRead 0 FirstWrite -1}
		empty_397 {Type I LastRead 0 FirstWrite -1}
		empty_398 {Type I LastRead 0 FirstWrite -1}
		empty_399 {Type I LastRead 0 FirstWrite -1}
		empty_400 {Type I LastRead 0 FirstWrite -1}
		empty_401 {Type I LastRead 0 FirstWrite -1}
		empty_402 {Type I LastRead 0 FirstWrite -1}
		empty_403 {Type I LastRead 0 FirstWrite -1}
		empty_404 {Type I LastRead 0 FirstWrite -1}
		empty_405 {Type I LastRead 0 FirstWrite -1}
		empty_406 {Type I LastRead 0 FirstWrite -1}
		empty_407 {Type I LastRead 0 FirstWrite -1}
		empty_408 {Type I LastRead 0 FirstWrite -1}
		empty_409 {Type I LastRead 0 FirstWrite -1}
		empty_410 {Type I LastRead 0 FirstWrite -1}
		empty_411 {Type I LastRead 0 FirstWrite -1}
		empty_412 {Type I LastRead 0 FirstWrite -1}
		empty_413 {Type I LastRead 0 FirstWrite -1}
		empty_414 {Type I LastRead 0 FirstWrite -1}
		empty_415 {Type I LastRead 0 FirstWrite -1}
		empty_416 {Type I LastRead 0 FirstWrite -1}
		empty_417 {Type I LastRead 0 FirstWrite -1}
		empty_418 {Type I LastRead 0 FirstWrite -1}
		empty_419 {Type I LastRead 0 FirstWrite -1}
		empty_420 {Type I LastRead 0 FirstWrite -1}
		empty_421 {Type I LastRead 0 FirstWrite -1}
		empty_422 {Type I LastRead 0 FirstWrite -1}
		empty_423 {Type I LastRead 0 FirstWrite -1}
		empty_424 {Type I LastRead 0 FirstWrite -1}
		empty_425 {Type I LastRead 0 FirstWrite -1}
		empty_426 {Type I LastRead 0 FirstWrite -1}
		empty_427 {Type I LastRead 0 FirstWrite -1}
		empty_428 {Type I LastRead 0 FirstWrite -1}
		empty_429 {Type I LastRead 0 FirstWrite -1}
		empty_430 {Type I LastRead 0 FirstWrite -1}
		empty_431 {Type I LastRead 0 FirstWrite -1}
		empty_432 {Type I LastRead 0 FirstWrite -1}
		empty_433 {Type I LastRead 0 FirstWrite -1}
		empty_434 {Type I LastRead 0 FirstWrite -1}
		empty_435 {Type I LastRead 0 FirstWrite -1}
		empty_436 {Type I LastRead 0 FirstWrite -1}
		empty_437 {Type I LastRead 0 FirstWrite -1}
		empty_438 {Type I LastRead 0 FirstWrite -1}
		empty_439 {Type I LastRead 0 FirstWrite -1}
		empty_440 {Type I LastRead 0 FirstWrite -1}
		empty_441 {Type I LastRead 0 FirstWrite -1}
		empty_442 {Type I LastRead 0 FirstWrite -1}
		empty_443 {Type I LastRead 0 FirstWrite -1}
		empty_444 {Type I LastRead 0 FirstWrite -1}
		empty_445 {Type I LastRead 0 FirstWrite -1}
		empty_446 {Type I LastRead 0 FirstWrite -1}
		empty_447 {Type I LastRead 0 FirstWrite -1}
		empty_448 {Type I LastRead 0 FirstWrite -1}
		empty_449 {Type I LastRead 0 FirstWrite -1}
		empty_450 {Type I LastRead 0 FirstWrite -1}
		empty_451 {Type I LastRead 0 FirstWrite -1}
		empty_452 {Type I LastRead 0 FirstWrite -1}
		empty_453 {Type I LastRead 0 FirstWrite -1}
		empty_454 {Type I LastRead 0 FirstWrite -1}
		empty_455 {Type I LastRead 0 FirstWrite -1}
		empty_456 {Type I LastRead 0 FirstWrite -1}
		empty_457 {Type I LastRead 0 FirstWrite -1}
		empty_458 {Type I LastRead 0 FirstWrite -1}
		empty_459 {Type I LastRead 0 FirstWrite -1}
		empty_460 {Type I LastRead 0 FirstWrite -1}
		empty_461 {Type I LastRead 0 FirstWrite -1}
		empty_462 {Type I LastRead 0 FirstWrite -1}
		empty_463 {Type I LastRead 0 FirstWrite -1}
		empty_464 {Type I LastRead 0 FirstWrite -1}
		empty_465 {Type I LastRead 0 FirstWrite -1}
		empty_466 {Type I LastRead 0 FirstWrite -1}
		empty_467 {Type I LastRead 0 FirstWrite -1}
		empty_468 {Type I LastRead 0 FirstWrite -1}
		empty_469 {Type I LastRead 0 FirstWrite -1}
		empty_470 {Type I LastRead 0 FirstWrite -1}
		empty_471 {Type I LastRead 0 FirstWrite -1}
		empty_472 {Type I LastRead 0 FirstWrite -1}
		empty_473 {Type I LastRead 0 FirstWrite -1}
		empty_474 {Type I LastRead 0 FirstWrite -1}
		empty_475 {Type I LastRead 0 FirstWrite -1}
		empty_476 {Type I LastRead 0 FirstWrite -1}
		empty_477 {Type I LastRead 0 FirstWrite -1}
		empty_478 {Type I LastRead 0 FirstWrite -1}
		empty_479 {Type I LastRead 0 FirstWrite -1}
		empty_480 {Type I LastRead 0 FirstWrite -1}
		empty_481 {Type I LastRead 0 FirstWrite -1}
		empty_482 {Type I LastRead 0 FirstWrite -1}
		empty_483 {Type I LastRead 0 FirstWrite -1}
		empty_484 {Type I LastRead 0 FirstWrite -1}
		empty_485 {Type I LastRead 0 FirstWrite -1}
		empty_486 {Type I LastRead 0 FirstWrite -1}
		empty_487 {Type I LastRead 0 FirstWrite -1}
		empty_488 {Type I LastRead 0 FirstWrite -1}
		empty_489 {Type I LastRead 0 FirstWrite -1}
		empty_490 {Type I LastRead 0 FirstWrite -1}
		empty_491 {Type I LastRead 0 FirstWrite -1}
		empty_492 {Type I LastRead 0 FirstWrite -1}
		empty_493 {Type I LastRead 0 FirstWrite -1}
		empty_494 {Type I LastRead 0 FirstWrite -1}
		empty_495 {Type I LastRead 0 FirstWrite -1}
		empty_496 {Type I LastRead 0 FirstWrite -1}
		empty_497 {Type I LastRead 0 FirstWrite -1}
		empty_498 {Type I LastRead 0 FirstWrite -1}
		empty_499 {Type I LastRead 0 FirstWrite -1}
		empty_500 {Type I LastRead 0 FirstWrite -1}
		empty_501 {Type I LastRead 0 FirstWrite -1}
		empty_502 {Type I LastRead 0 FirstWrite -1}
		empty_503 {Type I LastRead 0 FirstWrite -1}
		empty_504 {Type I LastRead 0 FirstWrite -1}
		empty_505 {Type I LastRead 0 FirstWrite -1}
		empty_506 {Type I LastRead 0 FirstWrite -1}
		empty_507 {Type I LastRead 0 FirstWrite -1}
		empty_508 {Type I LastRead 0 FirstWrite -1}
		empty_509 {Type I LastRead 0 FirstWrite -1}
		empty_510 {Type I LastRead 0 FirstWrite -1}
		empty_511 {Type I LastRead 0 FirstWrite -1}
		empty_512 {Type I LastRead 0 FirstWrite -1}
		empty_513 {Type I LastRead 0 FirstWrite -1}
		empty_514 {Type I LastRead 0 FirstWrite -1}
		empty_515 {Type I LastRead 0 FirstWrite -1}
		empty_516 {Type I LastRead 0 FirstWrite -1}
		empty_517 {Type I LastRead 0 FirstWrite -1}
		empty_518 {Type I LastRead 0 FirstWrite -1}
		empty_519 {Type I LastRead 0 FirstWrite -1}
		empty_520 {Type I LastRead 0 FirstWrite -1}
		empty_521 {Type I LastRead 0 FirstWrite -1}
		empty_522 {Type I LastRead 0 FirstWrite -1}
		empty_523 {Type I LastRead 0 FirstWrite -1}
		empty_524 {Type I LastRead 0 FirstWrite -1}
		empty_525 {Type I LastRead 0 FirstWrite -1}
		empty_526 {Type I LastRead 0 FirstWrite -1}
		empty_527 {Type I LastRead 0 FirstWrite -1}
		empty_528 {Type I LastRead 0 FirstWrite -1}
		empty_529 {Type I LastRead 0 FirstWrite -1}
		empty_530 {Type I LastRead 0 FirstWrite -1}
		empty_531 {Type I LastRead 0 FirstWrite -1}
		empty_532 {Type I LastRead 0 FirstWrite -1}
		empty_533 {Type I LastRead 0 FirstWrite -1}
		empty_534 {Type I LastRead 0 FirstWrite -1}
		empty_535 {Type I LastRead 0 FirstWrite -1}
		empty_536 {Type I LastRead 0 FirstWrite -1}
		empty_537 {Type I LastRead 0 FirstWrite -1}
		empty_538 {Type I LastRead 0 FirstWrite -1}
		empty_539 {Type I LastRead 0 FirstWrite -1}
		empty_540 {Type I LastRead 0 FirstWrite -1}
		empty_541 {Type I LastRead 0 FirstWrite -1}
		empty_542 {Type I LastRead 0 FirstWrite -1}
		empty_543 {Type I LastRead 0 FirstWrite -1}
		empty_544 {Type I LastRead 0 FirstWrite -1}
		empty_545 {Type I LastRead 0 FirstWrite -1}
		empty_546 {Type I LastRead 0 FirstWrite -1}
		empty_547 {Type I LastRead 0 FirstWrite -1}
		empty_548 {Type I LastRead 0 FirstWrite -1}
		empty_549 {Type I LastRead 0 FirstWrite -1}
		empty_550 {Type I LastRead 0 FirstWrite -1}
		empty_551 {Type I LastRead 0 FirstWrite -1}
		empty_552 {Type I LastRead 0 FirstWrite -1}
		empty_553 {Type I LastRead 0 FirstWrite -1}
		empty_554 {Type I LastRead 0 FirstWrite -1}
		empty_555 {Type I LastRead 0 FirstWrite -1}
		empty_556 {Type I LastRead 0 FirstWrite -1}
		empty_557 {Type I LastRead 0 FirstWrite -1}
		empty_558 {Type I LastRead 0 FirstWrite -1}
		empty_559 {Type I LastRead 0 FirstWrite -1}
		empty_560 {Type I LastRead 0 FirstWrite -1}
		empty_561 {Type I LastRead 0 FirstWrite -1}
		empty_562 {Type I LastRead 0 FirstWrite -1}
		empty_563 {Type I LastRead 0 FirstWrite -1}
		empty_564 {Type I LastRead 0 FirstWrite -1}
		empty_565 {Type I LastRead 0 FirstWrite -1}
		empty_566 {Type I LastRead 0 FirstWrite -1}
		empty_567 {Type I LastRead 0 FirstWrite -1}
		empty_568 {Type I LastRead 0 FirstWrite -1}
		empty_569 {Type I LastRead 0 FirstWrite -1}
		empty_570 {Type I LastRead 0 FirstWrite -1}
		empty_571 {Type I LastRead 0 FirstWrite -1}
		empty_572 {Type I LastRead 0 FirstWrite -1}
		empty_573 {Type I LastRead 0 FirstWrite -1}
		empty_574 {Type I LastRead 0 FirstWrite -1}
		empty_575 {Type I LastRead 0 FirstWrite -1}
		empty_576 {Type I LastRead 0 FirstWrite -1}
		empty_577 {Type I LastRead 0 FirstWrite -1}
		empty_578 {Type I LastRead 0 FirstWrite -1}
		empty_579 {Type I LastRead 0 FirstWrite -1}
		empty_580 {Type I LastRead 0 FirstWrite -1}
		empty_581 {Type I LastRead 0 FirstWrite -1}
		empty_582 {Type I LastRead 0 FirstWrite -1}
		empty_583 {Type I LastRead 0 FirstWrite -1}
		empty_584 {Type I LastRead 0 FirstWrite -1}
		empty_585 {Type I LastRead 0 FirstWrite -1}
		empty_586 {Type I LastRead 0 FirstWrite -1}
		empty_587 {Type I LastRead 0 FirstWrite -1}
		empty_588 {Type I LastRead 0 FirstWrite -1}
		empty_589 {Type I LastRead 0 FirstWrite -1}
		empty_590 {Type I LastRead 0 FirstWrite -1}
		empty_591 {Type I LastRead 0 FirstWrite -1}
		empty_592 {Type I LastRead 0 FirstWrite -1}
		empty_593 {Type I LastRead 0 FirstWrite -1}
		empty_594 {Type I LastRead 0 FirstWrite -1}
		empty_595 {Type I LastRead 0 FirstWrite -1}
		empty_596 {Type I LastRead 0 FirstWrite -1}
		empty_597 {Type I LastRead 0 FirstWrite -1}
		empty_598 {Type I LastRead 0 FirstWrite -1}
		empty_599 {Type I LastRead 0 FirstWrite -1}
		empty_600 {Type I LastRead 0 FirstWrite -1}
		empty_601 {Type I LastRead 0 FirstWrite -1}
		empty_602 {Type I LastRead 0 FirstWrite -1}
		empty_603 {Type I LastRead 0 FirstWrite -1}
		empty_604 {Type I LastRead 0 FirstWrite -1}
		empty_605 {Type I LastRead 0 FirstWrite -1}
		empty_606 {Type I LastRead 0 FirstWrite -1}
		empty_607 {Type I LastRead 0 FirstWrite -1}
		empty_608 {Type I LastRead 0 FirstWrite -1}
		empty_609 {Type I LastRead 0 FirstWrite -1}
		empty_610 {Type I LastRead 0 FirstWrite -1}
		empty_611 {Type I LastRead 0 FirstWrite -1}
		empty_612 {Type I LastRead 0 FirstWrite -1}
		empty_613 {Type I LastRead 0 FirstWrite -1}
		empty_614 {Type I LastRead 0 FirstWrite -1}
		empty_615 {Type I LastRead 0 FirstWrite -1}
		empty_616 {Type I LastRead 0 FirstWrite -1}
		empty_617 {Type I LastRead 0 FirstWrite -1}
		empty_618 {Type I LastRead 0 FirstWrite -1}
		empty_619 {Type I LastRead 0 FirstWrite -1}
		empty_620 {Type I LastRead 0 FirstWrite -1}
		empty_621 {Type I LastRead 0 FirstWrite -1}
		empty_622 {Type I LastRead 0 FirstWrite -1}
		empty_623 {Type I LastRead 0 FirstWrite -1}
		empty_624 {Type I LastRead 0 FirstWrite -1}
		empty_625 {Type I LastRead 0 FirstWrite -1}
		empty_626 {Type I LastRead 0 FirstWrite -1}
		empty_627 {Type I LastRead 0 FirstWrite -1}
		empty_628 {Type I LastRead 0 FirstWrite -1}
		empty_629 {Type I LastRead 0 FirstWrite -1}
		empty_630 {Type I LastRead 0 FirstWrite -1}
		empty_631 {Type I LastRead 0 FirstWrite -1}
		empty_632 {Type I LastRead 0 FirstWrite -1}
		empty_633 {Type I LastRead 0 FirstWrite -1}
		empty_634 {Type I LastRead 0 FirstWrite -1}
		empty_635 {Type I LastRead 0 FirstWrite -1}
		empty_636 {Type I LastRead 0 FirstWrite -1}
		empty_637 {Type I LastRead 0 FirstWrite -1}
		empty_638 {Type I LastRead 0 FirstWrite -1}
		empty_639 {Type I LastRead 0 FirstWrite -1}
		empty_640 {Type I LastRead 0 FirstWrite -1}
		empty_641 {Type I LastRead 0 FirstWrite -1}
		empty_642 {Type I LastRead 0 FirstWrite -1}
		empty_643 {Type I LastRead 0 FirstWrite -1}
		empty_644 {Type I LastRead 0 FirstWrite -1}
		empty_645 {Type I LastRead 0 FirstWrite -1}
		empty_646 {Type I LastRead 0 FirstWrite -1}
		empty_647 {Type I LastRead 0 FirstWrite -1}
		empty_648 {Type I LastRead 0 FirstWrite -1}
		empty_649 {Type I LastRead 0 FirstWrite -1}
		empty_650 {Type I LastRead 0 FirstWrite -1}
		empty_651 {Type I LastRead 0 FirstWrite -1}
		empty_652 {Type I LastRead 0 FirstWrite -1}
		empty_653 {Type I LastRead 0 FirstWrite -1}
		empty_654 {Type I LastRead 0 FirstWrite -1}
		empty_655 {Type I LastRead 0 FirstWrite -1}
		empty_656 {Type I LastRead 0 FirstWrite -1}
		empty_657 {Type I LastRead 0 FirstWrite -1}
		empty_658 {Type I LastRead 0 FirstWrite -1}
		empty_659 {Type I LastRead 0 FirstWrite -1}
		empty_660 {Type I LastRead 0 FirstWrite -1}
		empty_661 {Type I LastRead 0 FirstWrite -1}
		empty_662 {Type I LastRead 0 FirstWrite -1}
		empty_663 {Type I LastRead 0 FirstWrite -1}
		empty_664 {Type I LastRead 0 FirstWrite -1}
		empty_665 {Type I LastRead 0 FirstWrite -1}
		empty_666 {Type I LastRead 0 FirstWrite -1}
		empty_667 {Type I LastRead 0 FirstWrite -1}
		empty_668 {Type I LastRead 0 FirstWrite -1}
		empty_669 {Type I LastRead 0 FirstWrite -1}
		empty_670 {Type I LastRead 0 FirstWrite -1}
		empty_671 {Type I LastRead 0 FirstWrite -1}
		empty_672 {Type I LastRead 0 FirstWrite -1}
		empty_673 {Type I LastRead 0 FirstWrite -1}
		empty_674 {Type I LastRead 0 FirstWrite -1}
		empty_675 {Type I LastRead 0 FirstWrite -1}
		empty_676 {Type I LastRead 0 FirstWrite -1}
		empty_677 {Type I LastRead 0 FirstWrite -1}
		empty_678 {Type I LastRead 0 FirstWrite -1}
		empty_679 {Type I LastRead 0 FirstWrite -1}
		empty_680 {Type I LastRead 0 FirstWrite -1}
		empty_681 {Type I LastRead 0 FirstWrite -1}
		empty {Type I LastRead 0 FirstWrite -1}
		acc_w_g_load_out {Type O LastRead -1 FirstWrite 6}
		acc_w_g_1_load_out {Type O LastRead -1 FirstWrite 6}
		acc_w_g_2_load_out {Type O LastRead -1 FirstWrite 6}
		acc_w_g_3_load_out {Type O LastRead -1 FirstWrite 6}
		acc_w_g_4_load_out {Type O LastRead -1 FirstWrite 6}
		acc_w_g_5_load_out {Type O LastRead -1 FirstWrite 6}
		acc_w_g_6_load_out {Type O LastRead -1 FirstWrite 6}
		acc_w_g_7_load_out {Type O LastRead -1 FirstWrite 6}
		acc_w_g_8_load_out {Type O LastRead -1 FirstWrite 6}
		acc_w_g_9_load_out {Type O LastRead -1 FirstWrite 6}
		acc_w_g_10_load_out {Type O LastRead -1 FirstWrite 6}
		acc_w_g_11_load_out {Type O LastRead -1 FirstWrite 6}
		acc_w_g_12_load_out {Type O LastRead -1 FirstWrite 6}
		acc_w_g_13_load_out {Type O LastRead -1 FirstWrite 6}
		acc_w_g_14_load_out {Type O LastRead -1 FirstWrite 6}
		acc_w_g_15_load_out {Type O LastRead -1 FirstWrite 6}
		acc_w_g_16_load_out {Type O LastRead -1 FirstWrite 6}
		acc_w_g_17_load_out {Type O LastRead -1 FirstWrite 6}
		acc_w_g_18_load_out {Type O LastRead -1 FirstWrite 6}
		acc_w_g_19_load_out {Type O LastRead -1 FirstWrite 6}
		acc_w_g_20_load_out {Type O LastRead -1 FirstWrite 6}
		acc_w_g_21_load_out {Type O LastRead -1 FirstWrite 6}
		acc_w_g_22_load_out {Type O LastRead -1 FirstWrite 6}
		acc_w_g_23_load_out {Type O LastRead -1 FirstWrite 6}
		acc_w_g_24_load_out {Type O LastRead -1 FirstWrite 6}
		acc_w_g_25_load_out {Type O LastRead -1 FirstWrite 6}
		acc_w_g_26_load_out {Type O LastRead -1 FirstWrite 6}
		acc_w_g_27_load_out {Type O LastRead -1 FirstWrite 6}
		acc_w_g_28_load_out {Type O LastRead -1 FirstWrite 6}
		acc_w_g_29_load_out {Type O LastRead -1 FirstWrite 6}
		acc_w_g_30_load_out {Type O LastRead -1 FirstWrite 6}
		acc_w_g_31_load_out {Type O LastRead -1 FirstWrite 6}
		acc_w_g_32_load_out {Type O LastRead -1 FirstWrite 6}
		acc_w_g_33_load_out {Type O LastRead -1 FirstWrite 6}
		acc_w_g_34_load_out {Type O LastRead -1 FirstWrite 6}
		acc_w_g_35_load_out {Type O LastRead -1 FirstWrite 6}
		acc_w_g_36_load_out {Type O LastRead -1 FirstWrite 6}
		acc_w_g_37_load_out {Type O LastRead -1 FirstWrite 6}
		acc_w_g_38_load_out {Type O LastRead -1 FirstWrite 6}
		acc_w_g_39_load_out {Type O LastRead -1 FirstWrite 6}
		acc_w_g_40_load_out {Type O LastRead -1 FirstWrite 6}
		acc_w_g_41_load_out {Type O LastRead -1 FirstWrite 6}
		acc_w_g_42_load_out {Type O LastRead -1 FirstWrite 6}
		acc_w_g_43_load_out {Type O LastRead -1 FirstWrite 6}
		acc_w_g_44_load_out {Type O LastRead -1 FirstWrite 6}
		acc_w_g_45_load_out {Type O LastRead -1 FirstWrite 6}
		acc_w_g_46_load_out {Type O LastRead -1 FirstWrite 6}
		acc_w_g_47_load_out {Type O LastRead -1 FirstWrite 6}
		acc_w_g_48_load_out {Type O LastRead -1 FirstWrite 6}
		acc_w_g_49_load_out {Type O LastRead -1 FirstWrite 6}
		acc_w_g_50_load_out {Type O LastRead -1 FirstWrite 6}
		acc_w_g_51_load_out {Type O LastRead -1 FirstWrite 6}
		acc_w_g_52_load_out {Type O LastRead -1 FirstWrite 6}
		acc_w_g_53_load_out {Type O LastRead -1 FirstWrite 6}
		acc_w_g_54_load_out {Type O LastRead -1 FirstWrite 6}
		acc_w_g_55_load_out {Type O LastRead -1 FirstWrite 6}
		acc_w_g_56_load_out {Type O LastRead -1 FirstWrite 6}
		acc_w_g_57_load_out {Type O LastRead -1 FirstWrite 6}
		acc_w_g_58_load_out {Type O LastRead -1 FirstWrite 6}
		acc_w_g_59_load_out {Type O LastRead -1 FirstWrite 6}
		acc_w_g_60_load_out {Type O LastRead -1 FirstWrite 6}
		acc_w_g_61_load_out {Type O LastRead -1 FirstWrite 6}
		acc_w_g_62_load_out {Type O LastRead -1 FirstWrite 6}
		acc_w_g_63_load_out {Type O LastRead -1 FirstWrite 6}
		acc_m_g_load_out {Type O LastRead -1 FirstWrite 6}
		acc_m_g_1_load_out {Type O LastRead -1 FirstWrite 6}
		acc_m_g_2_load_out {Type O LastRead -1 FirstWrite 6}
		acc_m_g_3_load_out {Type O LastRead -1 FirstWrite 6}
		acc_m_g_4_load_out {Type O LastRead -1 FirstWrite 6}
		acc_m_g_5_load_out {Type O LastRead -1 FirstWrite 6}
		acc_m_g_6_load_out {Type O LastRead -1 FirstWrite 6}
		acc_m_g_7_load_out {Type O LastRead -1 FirstWrite 6}
		acc_m_g_8_load_out {Type O LastRead -1 FirstWrite 6}
		acc_m_g_9_load_out {Type O LastRead -1 FirstWrite 6}
		acc_m_g_10_load_out {Type O LastRead -1 FirstWrite 6}
		acc_m_g_11_load_out {Type O LastRead -1 FirstWrite 6}
		acc_m_g_12_load_out {Type O LastRead -1 FirstWrite 6}
		acc_m_g_13_load_out {Type O LastRead -1 FirstWrite 6}
		acc_m_g_14_load_out {Type O LastRead -1 FirstWrite 6}
		acc_m_g_15_load_out {Type O LastRead -1 FirstWrite 6}
		acc_m_g_16_load_out {Type O LastRead -1 FirstWrite 6}
		acc_m_g_17_load_out {Type O LastRead -1 FirstWrite 6}
		acc_m_g_18_load_out {Type O LastRead -1 FirstWrite 6}
		acc_m_g_19_load_out {Type O LastRead -1 FirstWrite 6}
		acc_m_g_20_load_out {Type O LastRead -1 FirstWrite 6}
		acc_m_g_21_load_out {Type O LastRead -1 FirstWrite 6}
		acc_m_g_22_load_out {Type O LastRead -1 FirstWrite 6}
		acc_m_g_23_load_out {Type O LastRead -1 FirstWrite 6}
		acc_m_g_24_load_out {Type O LastRead -1 FirstWrite 6}
		acc_m_g_25_load_out {Type O LastRead -1 FirstWrite 6}
		acc_m_g_26_load_out {Type O LastRead -1 FirstWrite 6}
		acc_m_g_27_load_out {Type O LastRead -1 FirstWrite 6}
		acc_m_g_28_load_out {Type O LastRead -1 FirstWrite 6}
		acc_m_g_29_load_out {Type O LastRead -1 FirstWrite 6}
		acc_m_g_30_load_out {Type O LastRead -1 FirstWrite 6}
		acc_m_g_31_load_out {Type O LastRead -1 FirstWrite 6}
		acc_m_g_32_load_out {Type O LastRead -1 FirstWrite 6}
		acc_m_g_33_load_out {Type O LastRead -1 FirstWrite 6}
		acc_m_g_34_load_out {Type O LastRead -1 FirstWrite 6}
		acc_m_g_35_load_out {Type O LastRead -1 FirstWrite 6}
		acc_m_g_36_load_out {Type O LastRead -1 FirstWrite 6}
		acc_m_g_37_load_out {Type O LastRead -1 FirstWrite 6}
		acc_m_g_38_load_out {Type O LastRead -1 FirstWrite 6}
		acc_m_g_39_load_out {Type O LastRead -1 FirstWrite 6}
		acc_m_g_40_load_out {Type O LastRead -1 FirstWrite 6}
		acc_m_g_41_load_out {Type O LastRead -1 FirstWrite 6}
		acc_m_g_42_load_out {Type O LastRead -1 FirstWrite 6}
		acc_m_g_43_load_out {Type O LastRead -1 FirstWrite 6}
		acc_m_g_44_load_out {Type O LastRead -1 FirstWrite 6}
		acc_m_g_45_load_out {Type O LastRead -1 FirstWrite 6}
		acc_m_g_46_load_out {Type O LastRead -1 FirstWrite 6}
		acc_m_g_47_load_out {Type O LastRead -1 FirstWrite 6}
		acc_m_g_48_load_out {Type O LastRead -1 FirstWrite 6}
		acc_m_g_49_load_out {Type O LastRead -1 FirstWrite 6}
		acc_m_g_50_load_out {Type O LastRead -1 FirstWrite 6}
		acc_m_g_51_load_out {Type O LastRead -1 FirstWrite 6}
		acc_m_g_52_load_out {Type O LastRead -1 FirstWrite 6}
		acc_m_g_53_load_out {Type O LastRead -1 FirstWrite 6}
		acc_m_g_54_load_out {Type O LastRead -1 FirstWrite 6}
		acc_m_g_55_load_out {Type O LastRead -1 FirstWrite 6}
		acc_m_g_56_load_out {Type O LastRead -1 FirstWrite 6}
		acc_m_g_57_load_out {Type O LastRead -1 FirstWrite 6}
		acc_m_g_58_load_out {Type O LastRead -1 FirstWrite 6}
		acc_m_g_59_load_out {Type O LastRead -1 FirstWrite 6}
		acc_m_g_60_load_out {Type O LastRead -1 FirstWrite 6}
		acc_m_g_61_load_out {Type O LastRead -1 FirstWrite 6}
		acc_m_g_62_load_out {Type O LastRead -1 FirstWrite 6}
		acc_m_g_63_load_out {Type O LastRead -1 FirstWrite 6}}
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
		add_i_i69_phi_out {Type O LastRead -1 FirstWrite 10}}
	compute_output_Pipeline_2 {
		gmem_out {Type O LastRead -1 FirstWrite 2}
		sext_ln666 {Type I LastRead 0 FirstWrite -1}
		out_local {Type I LastRead 0 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "2858058", "Max" : "5431370"}
	, {"Name" : "Interval", "Min" : "2858058", "Max" : "5431370"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	p_read { ap_none {  { p_read in_data 0 32 } } }
	 { m_axi {  { m_axi_gmem_Wd_0_AWVALID VALID 1 1 }  { m_axi_gmem_Wd_0_AWREADY READY 0 1 }  { m_axi_gmem_Wd_0_AWADDR ADDR 1 64 }  { m_axi_gmem_Wd_0_AWID ID 1 1 }  { m_axi_gmem_Wd_0_AWLEN SIZE 1 32 }  { m_axi_gmem_Wd_0_AWSIZE BURST 1 3 }  { m_axi_gmem_Wd_0_AWBURST LOCK 1 2 }  { m_axi_gmem_Wd_0_AWLOCK CACHE 1 2 }  { m_axi_gmem_Wd_0_AWCACHE PROT 1 4 }  { m_axi_gmem_Wd_0_AWPROT QOS 1 3 }  { m_axi_gmem_Wd_0_AWQOS REGION 1 4 }  { m_axi_gmem_Wd_0_AWREGION USER 1 4 }  { m_axi_gmem_Wd_0_AWUSER DATA 1 1 }  { m_axi_gmem_Wd_0_WVALID VALID 1 1 }  { m_axi_gmem_Wd_0_WREADY READY 0 1 }  { m_axi_gmem_Wd_0_WDATA FIFONUM 1 128 }  { m_axi_gmem_Wd_0_WSTRB STRB 1 16 }  { m_axi_gmem_Wd_0_WLAST LAST 1 1 }  { m_axi_gmem_Wd_0_WID ID 1 1 }  { m_axi_gmem_Wd_0_WUSER DATA 1 1 }  { m_axi_gmem_Wd_0_ARVALID VALID 1 1 }  { m_axi_gmem_Wd_0_ARREADY READY 0 1 }  { m_axi_gmem_Wd_0_ARADDR ADDR 1 64 }  { m_axi_gmem_Wd_0_ARID ID 1 1 }  { m_axi_gmem_Wd_0_ARLEN SIZE 1 32 }  { m_axi_gmem_Wd_0_ARSIZE BURST 1 3 }  { m_axi_gmem_Wd_0_ARBURST LOCK 1 2 }  { m_axi_gmem_Wd_0_ARLOCK CACHE 1 2 }  { m_axi_gmem_Wd_0_ARCACHE PROT 1 4 }  { m_axi_gmem_Wd_0_ARPROT QOS 1 3 }  { m_axi_gmem_Wd_0_ARQOS REGION 1 4 }  { m_axi_gmem_Wd_0_ARREGION USER 1 4 }  { m_axi_gmem_Wd_0_ARUSER DATA 1 1 }  { m_axi_gmem_Wd_0_RVALID VALID 0 1 }  { m_axi_gmem_Wd_0_RREADY READY 1 1 }  { m_axi_gmem_Wd_0_RDATA FIFONUM 0 128 }  { m_axi_gmem_Wd_0_RLAST LAST 0 1 }  { m_axi_gmem_Wd_0_RID ID 0 1 }  { m_axi_gmem_Wd_0_RFIFONUM LEN 0 10 }  { m_axi_gmem_Wd_0_RUSER DATA 0 1 }  { m_axi_gmem_Wd_0_RRESP RESP 0 2 }  { m_axi_gmem_Wd_0_BVALID VALID 0 1 }  { m_axi_gmem_Wd_0_BREADY READY 1 1 }  { m_axi_gmem_Wd_0_BRESP RESP 0 2 }  { m_axi_gmem_Wd_0_BID ID 0 1 }  { m_axi_gmem_Wd_0_BUSER DATA 0 1 } } }
	W_down { ap_none {  { W_down in_data 0 64 } } }
	 { m_axi {  { m_axi_gmem_Wd2_0_AWVALID VALID 1 1 }  { m_axi_gmem_Wd2_0_AWREADY READY 0 1 }  { m_axi_gmem_Wd2_0_AWADDR ADDR 1 64 }  { m_axi_gmem_Wd2_0_AWID ID 1 1 }  { m_axi_gmem_Wd2_0_AWLEN SIZE 1 32 }  { m_axi_gmem_Wd2_0_AWSIZE BURST 1 3 }  { m_axi_gmem_Wd2_0_AWBURST LOCK 1 2 }  { m_axi_gmem_Wd2_0_AWLOCK CACHE 1 2 }  { m_axi_gmem_Wd2_0_AWCACHE PROT 1 4 }  { m_axi_gmem_Wd2_0_AWPROT QOS 1 3 }  { m_axi_gmem_Wd2_0_AWQOS REGION 1 4 }  { m_axi_gmem_Wd2_0_AWREGION USER 1 4 }  { m_axi_gmem_Wd2_0_AWUSER DATA 1 1 }  { m_axi_gmem_Wd2_0_WVALID VALID 1 1 }  { m_axi_gmem_Wd2_0_WREADY READY 0 1 }  { m_axi_gmem_Wd2_0_WDATA FIFONUM 1 128 }  { m_axi_gmem_Wd2_0_WSTRB STRB 1 16 }  { m_axi_gmem_Wd2_0_WLAST LAST 1 1 }  { m_axi_gmem_Wd2_0_WID ID 1 1 }  { m_axi_gmem_Wd2_0_WUSER DATA 1 1 }  { m_axi_gmem_Wd2_0_ARVALID VALID 1 1 }  { m_axi_gmem_Wd2_0_ARREADY READY 0 1 }  { m_axi_gmem_Wd2_0_ARADDR ADDR 1 64 }  { m_axi_gmem_Wd2_0_ARID ID 1 1 }  { m_axi_gmem_Wd2_0_ARLEN SIZE 1 32 }  { m_axi_gmem_Wd2_0_ARSIZE BURST 1 3 }  { m_axi_gmem_Wd2_0_ARBURST LOCK 1 2 }  { m_axi_gmem_Wd2_0_ARLOCK CACHE 1 2 }  { m_axi_gmem_Wd2_0_ARCACHE PROT 1 4 }  { m_axi_gmem_Wd2_0_ARPROT QOS 1 3 }  { m_axi_gmem_Wd2_0_ARQOS REGION 1 4 }  { m_axi_gmem_Wd2_0_ARREGION USER 1 4 }  { m_axi_gmem_Wd2_0_ARUSER DATA 1 1 }  { m_axi_gmem_Wd2_0_RVALID VALID 0 1 }  { m_axi_gmem_Wd2_0_RREADY READY 1 1 }  { m_axi_gmem_Wd2_0_RDATA FIFONUM 0 128 }  { m_axi_gmem_Wd2_0_RLAST LAST 0 1 }  { m_axi_gmem_Wd2_0_RID ID 0 1 }  { m_axi_gmem_Wd2_0_RFIFONUM LEN 0 10 }  { m_axi_gmem_Wd2_0_RUSER DATA 0 1 }  { m_axi_gmem_Wd2_0_RRESP RESP 0 2 }  { m_axi_gmem_Wd2_0_BVALID VALID 0 1 }  { m_axi_gmem_Wd2_0_BREADY READY 1 1 }  { m_axi_gmem_Wd2_0_BRESP RESP 0 2 }  { m_axi_gmem_Wd2_0_BID ID 0 1 }  { m_axi_gmem_Wd2_0_BUSER DATA 0 1 } } }
	W_down2 { ap_none {  { W_down2 in_data 0 64 } } }
	gate_cache_0 { ap_memory {  { gate_cache_0_address0 mem_address 1 10 }  { gate_cache_0_ce0 mem_ce 1 1 }  { gate_cache_0_q0 mem_dout 0 8 } } }
	gate_cache_1 { ap_memory {  { gate_cache_1_address0 mem_address 1 10 }  { gate_cache_1_ce0 mem_ce 1 1 }  { gate_cache_1_q0 mem_dout 0 8 } } }
	gate_cache_2 { ap_memory {  { gate_cache_2_address0 mem_address 1 10 }  { gate_cache_2_ce0 mem_ce 1 1 }  { gate_cache_2_q0 mem_dout 0 8 } } }
	gate_cache_3 { ap_memory {  { gate_cache_3_address0 mem_address 1 10 }  { gate_cache_3_ce0 mem_ce 1 1 }  { gate_cache_3_q0 mem_dout 0 8 } } }
	gate_cache_4 { ap_memory {  { gate_cache_4_address0 mem_address 1 10 }  { gate_cache_4_ce0 mem_ce 1 1 }  { gate_cache_4_q0 mem_dout 0 8 } } }
	gate_cache_5 { ap_memory {  { gate_cache_5_address0 mem_address 1 10 }  { gate_cache_5_ce0 mem_ce 1 1 }  { gate_cache_5_q0 mem_dout 0 8 } } }
	gate_cache_6 { ap_memory {  { gate_cache_6_address0 mem_address 1 10 }  { gate_cache_6_ce0 mem_ce 1 1 }  { gate_cache_6_q0 mem_dout 0 8 } } }
	gate_cache_7 { ap_memory {  { gate_cache_7_address0 mem_address 1 10 }  { gate_cache_7_ce0 mem_ce 1 1 }  { gate_cache_7_q0 mem_dout 0 8 } } }
	 { m_axi {  { m_axi_gmem_out_0_AWVALID VALID 1 1 }  { m_axi_gmem_out_0_AWREADY READY 0 1 }  { m_axi_gmem_out_0_AWADDR ADDR 1 64 }  { m_axi_gmem_out_0_AWID ID 1 1 }  { m_axi_gmem_out_0_AWLEN SIZE 1 32 }  { m_axi_gmem_out_0_AWSIZE BURST 1 3 }  { m_axi_gmem_out_0_AWBURST LOCK 1 2 }  { m_axi_gmem_out_0_AWLOCK CACHE 1 2 }  { m_axi_gmem_out_0_AWCACHE PROT 1 4 }  { m_axi_gmem_out_0_AWPROT QOS 1 3 }  { m_axi_gmem_out_0_AWQOS REGION 1 4 }  { m_axi_gmem_out_0_AWREGION USER 1 4 }  { m_axi_gmem_out_0_AWUSER DATA 1 1 }  { m_axi_gmem_out_0_WVALID VALID 1 1 }  { m_axi_gmem_out_0_WREADY READY 0 1 }  { m_axi_gmem_out_0_WDATA FIFONUM 1 32 }  { m_axi_gmem_out_0_WSTRB STRB 1 4 }  { m_axi_gmem_out_0_WLAST LAST 1 1 }  { m_axi_gmem_out_0_WID ID 1 1 }  { m_axi_gmem_out_0_WUSER DATA 1 1 }  { m_axi_gmem_out_0_ARVALID VALID 1 1 }  { m_axi_gmem_out_0_ARREADY READY 0 1 }  { m_axi_gmem_out_0_ARADDR ADDR 1 64 }  { m_axi_gmem_out_0_ARID ID 1 1 }  { m_axi_gmem_out_0_ARLEN SIZE 1 32 }  { m_axi_gmem_out_0_ARSIZE BURST 1 3 }  { m_axi_gmem_out_0_ARBURST LOCK 1 2 }  { m_axi_gmem_out_0_ARLOCK CACHE 1 2 }  { m_axi_gmem_out_0_ARCACHE PROT 1 4 }  { m_axi_gmem_out_0_ARPROT QOS 1 3 }  { m_axi_gmem_out_0_ARQOS REGION 1 4 }  { m_axi_gmem_out_0_ARREGION USER 1 4 }  { m_axi_gmem_out_0_ARUSER DATA 1 1 }  { m_axi_gmem_out_0_RVALID VALID 0 1 }  { m_axi_gmem_out_0_RREADY READY 1 1 }  { m_axi_gmem_out_0_RDATA FIFONUM 0 32 }  { m_axi_gmem_out_0_RLAST LAST 0 1 }  { m_axi_gmem_out_0_RID ID 0 1 }  { m_axi_gmem_out_0_RFIFONUM LEN 0 9 }  { m_axi_gmem_out_0_RUSER DATA 0 1 }  { m_axi_gmem_out_0_RRESP RESP 0 2 }  { m_axi_gmem_out_0_BVALID VALID 0 1 }  { m_axi_gmem_out_0_BREADY READY 1 1 }  { m_axi_gmem_out_0_BRESP RESP 0 2 }  { m_axi_gmem_out_0_BID ID 0 1 }  { m_axi_gmem_out_0_BUSER DATA 0 1 } } }
	out_batch { ap_none {  { out_batch in_data 0 64 } } }
	down_quant_mode { ap_none {  { down_quant_mode in_data 0 32 } } }
}
