set moduleName load_row_wv_Pipeline_LOAD_WV_VITIS_LOOP_71_1
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
set cdfgNum 40
set C_modelName {load_row_wv_Pipeline_LOAD_WV_VITIS_LOOP_71_1}
set C_modelType { void 0 }
set ap_memory_interface_dict [dict create]
dict set ap_memory_interface_dict rb_7 { MEM_WIDTH 128 MEM_SIZE 144 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 0 }
dict set ap_memory_interface_dict rb_6 { MEM_WIDTH 128 MEM_SIZE 144 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 0 }
dict set ap_memory_interface_dict rb_5 { MEM_WIDTH 128 MEM_SIZE 144 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 0 }
dict set ap_memory_interface_dict rb_4 { MEM_WIDTH 128 MEM_SIZE 144 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 0 }
dict set ap_memory_interface_dict rb_3 { MEM_WIDTH 128 MEM_SIZE 144 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 0 }
dict set ap_memory_interface_dict rb_2 { MEM_WIDTH 128 MEM_SIZE 144 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 0 }
dict set ap_memory_interface_dict rb_1 { MEM_WIDTH 128 MEM_SIZE 144 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 0 }
dict set ap_memory_interface_dict rb_0 { MEM_WIDTH 128 MEM_SIZE 144 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 0 }
set C_modelArgList {
	{ gmem_V int 128 regular {axi_master 0}  }
	{ sext_ln70 int 60 regular  }
	{ rb_7 int 128 regular {array 9 { 0 } 0 1 }  }
	{ rb_6 int 128 regular {array 9 { 0 } 0 1 }  }
	{ rb_5 int 128 regular {array 9 { 0 } 0 1 }  }
	{ rb_4 int 128 regular {array 9 { 0 } 0 1 }  }
	{ rb_3 int 128 regular {array 9 { 0 } 0 1 }  }
	{ rb_2 int 128 regular {array 9 { 0 } 0 1 }  }
	{ rb_1 int 128 regular {array 9 { 0 } 0 1 }  }
	{ rb_0 int 128 regular {array 9 { 0 } 0 1 }  }
}
set hasAXIMCache 0
set l_AXIML2Cache [list]
set AXIMCacheInstDict [dict create]
set C_modelArgMapList {[ 
	{ "Name" : "gmem_V", "interface" : "axi_master", "bitwidth" : 128, "direction" : "READONLY", "bitSlice":[ {"cElement": [{"cName": "V","offset": { "type": "dynamic","port_name": "V","bundle": "CTRL"},"direction": "READONLY"}]}]} , 
 	{ "Name" : "sext_ln70", "interface" : "wire", "bitwidth" : 60, "direction" : "READONLY"} , 
 	{ "Name" : "rb_7", "interface" : "memory", "bitwidth" : 128, "direction" : "WRITEONLY"} , 
 	{ "Name" : "rb_6", "interface" : "memory", "bitwidth" : 128, "direction" : "WRITEONLY"} , 
 	{ "Name" : "rb_5", "interface" : "memory", "bitwidth" : 128, "direction" : "WRITEONLY"} , 
 	{ "Name" : "rb_4", "interface" : "memory", "bitwidth" : 128, "direction" : "WRITEONLY"} , 
 	{ "Name" : "rb_3", "interface" : "memory", "bitwidth" : 128, "direction" : "WRITEONLY"} , 
 	{ "Name" : "rb_2", "interface" : "memory", "bitwidth" : 128, "direction" : "WRITEONLY"} , 
 	{ "Name" : "rb_1", "interface" : "memory", "bitwidth" : 128, "direction" : "WRITEONLY"} , 
 	{ "Name" : "rb_0", "interface" : "memory", "bitwidth" : 128, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 85
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ m_axi_gmem_V_0_AWVALID sc_out sc_logic 1 signal 0 } 
	{ m_axi_gmem_V_0_AWREADY sc_in sc_logic 1 signal 0 } 
	{ m_axi_gmem_V_0_AWADDR sc_out sc_lv 64 signal 0 } 
	{ m_axi_gmem_V_0_AWID sc_out sc_lv 1 signal 0 } 
	{ m_axi_gmem_V_0_AWLEN sc_out sc_lv 32 signal 0 } 
	{ m_axi_gmem_V_0_AWSIZE sc_out sc_lv 3 signal 0 } 
	{ m_axi_gmem_V_0_AWBURST sc_out sc_lv 2 signal 0 } 
	{ m_axi_gmem_V_0_AWLOCK sc_out sc_lv 2 signal 0 } 
	{ m_axi_gmem_V_0_AWCACHE sc_out sc_lv 4 signal 0 } 
	{ m_axi_gmem_V_0_AWPROT sc_out sc_lv 3 signal 0 } 
	{ m_axi_gmem_V_0_AWQOS sc_out sc_lv 4 signal 0 } 
	{ m_axi_gmem_V_0_AWREGION sc_out sc_lv 4 signal 0 } 
	{ m_axi_gmem_V_0_AWUSER sc_out sc_lv 1 signal 0 } 
	{ m_axi_gmem_V_0_WVALID sc_out sc_logic 1 signal 0 } 
	{ m_axi_gmem_V_0_WREADY sc_in sc_logic 1 signal 0 } 
	{ m_axi_gmem_V_0_WDATA sc_out sc_lv 128 signal 0 } 
	{ m_axi_gmem_V_0_WSTRB sc_out sc_lv 16 signal 0 } 
	{ m_axi_gmem_V_0_WLAST sc_out sc_logic 1 signal 0 } 
	{ m_axi_gmem_V_0_WID sc_out sc_lv 1 signal 0 } 
	{ m_axi_gmem_V_0_WUSER sc_out sc_lv 1 signal 0 } 
	{ m_axi_gmem_V_0_ARVALID sc_out sc_logic 1 signal 0 } 
	{ m_axi_gmem_V_0_ARREADY sc_in sc_logic 1 signal 0 } 
	{ m_axi_gmem_V_0_ARADDR sc_out sc_lv 64 signal 0 } 
	{ m_axi_gmem_V_0_ARID sc_out sc_lv 1 signal 0 } 
	{ m_axi_gmem_V_0_ARLEN sc_out sc_lv 32 signal 0 } 
	{ m_axi_gmem_V_0_ARSIZE sc_out sc_lv 3 signal 0 } 
	{ m_axi_gmem_V_0_ARBURST sc_out sc_lv 2 signal 0 } 
	{ m_axi_gmem_V_0_ARLOCK sc_out sc_lv 2 signal 0 } 
	{ m_axi_gmem_V_0_ARCACHE sc_out sc_lv 4 signal 0 } 
	{ m_axi_gmem_V_0_ARPROT sc_out sc_lv 3 signal 0 } 
	{ m_axi_gmem_V_0_ARQOS sc_out sc_lv 4 signal 0 } 
	{ m_axi_gmem_V_0_ARREGION sc_out sc_lv 4 signal 0 } 
	{ m_axi_gmem_V_0_ARUSER sc_out sc_lv 1 signal 0 } 
	{ m_axi_gmem_V_0_RVALID sc_in sc_logic 1 signal 0 } 
	{ m_axi_gmem_V_0_RREADY sc_out sc_logic 1 signal 0 } 
	{ m_axi_gmem_V_0_RDATA sc_in sc_lv 128 signal 0 } 
	{ m_axi_gmem_V_0_RLAST sc_in sc_logic 1 signal 0 } 
	{ m_axi_gmem_V_0_RID sc_in sc_lv 1 signal 0 } 
	{ m_axi_gmem_V_0_RFIFONUM sc_in sc_lv 10 signal 0 } 
	{ m_axi_gmem_V_0_RUSER sc_in sc_lv 1 signal 0 } 
	{ m_axi_gmem_V_0_RRESP sc_in sc_lv 2 signal 0 } 
	{ m_axi_gmem_V_0_BVALID sc_in sc_logic 1 signal 0 } 
	{ m_axi_gmem_V_0_BREADY sc_out sc_logic 1 signal 0 } 
	{ m_axi_gmem_V_0_BRESP sc_in sc_lv 2 signal 0 } 
	{ m_axi_gmem_V_0_BID sc_in sc_lv 1 signal 0 } 
	{ m_axi_gmem_V_0_BUSER sc_in sc_lv 1 signal 0 } 
	{ sext_ln70 sc_in sc_lv 60 signal 1 } 
	{ rb_7_address0 sc_out sc_lv 4 signal 2 } 
	{ rb_7_ce0 sc_out sc_logic 1 signal 2 } 
	{ rb_7_we0 sc_out sc_logic 1 signal 2 } 
	{ rb_7_d0 sc_out sc_lv 128 signal 2 } 
	{ rb_6_address0 sc_out sc_lv 4 signal 3 } 
	{ rb_6_ce0 sc_out sc_logic 1 signal 3 } 
	{ rb_6_we0 sc_out sc_logic 1 signal 3 } 
	{ rb_6_d0 sc_out sc_lv 128 signal 3 } 
	{ rb_5_address0 sc_out sc_lv 4 signal 4 } 
	{ rb_5_ce0 sc_out sc_logic 1 signal 4 } 
	{ rb_5_we0 sc_out sc_logic 1 signal 4 } 
	{ rb_5_d0 sc_out sc_lv 128 signal 4 } 
	{ rb_4_address0 sc_out sc_lv 4 signal 5 } 
	{ rb_4_ce0 sc_out sc_logic 1 signal 5 } 
	{ rb_4_we0 sc_out sc_logic 1 signal 5 } 
	{ rb_4_d0 sc_out sc_lv 128 signal 5 } 
	{ rb_3_address0 sc_out sc_lv 4 signal 6 } 
	{ rb_3_ce0 sc_out sc_logic 1 signal 6 } 
	{ rb_3_we0 sc_out sc_logic 1 signal 6 } 
	{ rb_3_d0 sc_out sc_lv 128 signal 6 } 
	{ rb_2_address0 sc_out sc_lv 4 signal 7 } 
	{ rb_2_ce0 sc_out sc_logic 1 signal 7 } 
	{ rb_2_we0 sc_out sc_logic 1 signal 7 } 
	{ rb_2_d0 sc_out sc_lv 128 signal 7 } 
	{ rb_1_address0 sc_out sc_lv 4 signal 8 } 
	{ rb_1_ce0 sc_out sc_logic 1 signal 8 } 
	{ rb_1_we0 sc_out sc_logic 1 signal 8 } 
	{ rb_1_d0 sc_out sc_lv 128 signal 8 } 
	{ rb_0_address0 sc_out sc_lv 4 signal 9 } 
	{ rb_0_ce0 sc_out sc_logic 1 signal 9 } 
	{ rb_0_we0 sc_out sc_logic 1 signal 9 } 
	{ rb_0_d0 sc_out sc_lv 128 signal 9 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "m_axi_gmem_V_0_AWVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_V", "role": "0_AWVALID" }} , 
 	{ "name": "m_axi_gmem_V_0_AWREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_V", "role": "0_AWREADY" }} , 
 	{ "name": "m_axi_gmem_V_0_AWADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "gmem_V", "role": "0_AWADDR" }} , 
 	{ "name": "m_axi_gmem_V_0_AWID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_V", "role": "0_AWID" }} , 
 	{ "name": "m_axi_gmem_V_0_AWLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "gmem_V", "role": "0_AWLEN" }} , 
 	{ "name": "m_axi_gmem_V_0_AWSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "gmem_V", "role": "0_AWSIZE" }} , 
 	{ "name": "m_axi_gmem_V_0_AWBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem_V", "role": "0_AWBURST" }} , 
 	{ "name": "m_axi_gmem_V_0_AWLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem_V", "role": "0_AWLOCK" }} , 
 	{ "name": "m_axi_gmem_V_0_AWCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem_V", "role": "0_AWCACHE" }} , 
 	{ "name": "m_axi_gmem_V_0_AWPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "gmem_V", "role": "0_AWPROT" }} , 
 	{ "name": "m_axi_gmem_V_0_AWQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem_V", "role": "0_AWQOS" }} , 
 	{ "name": "m_axi_gmem_V_0_AWREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem_V", "role": "0_AWREGION" }} , 
 	{ "name": "m_axi_gmem_V_0_AWUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_V", "role": "0_AWUSER" }} , 
 	{ "name": "m_axi_gmem_V_0_WVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_V", "role": "0_WVALID" }} , 
 	{ "name": "m_axi_gmem_V_0_WREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_V", "role": "0_WREADY" }} , 
 	{ "name": "m_axi_gmem_V_0_WDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "gmem_V", "role": "0_WDATA" }} , 
 	{ "name": "m_axi_gmem_V_0_WSTRB", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "gmem_V", "role": "0_WSTRB" }} , 
 	{ "name": "m_axi_gmem_V_0_WLAST", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_V", "role": "0_WLAST" }} , 
 	{ "name": "m_axi_gmem_V_0_WID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_V", "role": "0_WID" }} , 
 	{ "name": "m_axi_gmem_V_0_WUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_V", "role": "0_WUSER" }} , 
 	{ "name": "m_axi_gmem_V_0_ARVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_V", "role": "0_ARVALID" }} , 
 	{ "name": "m_axi_gmem_V_0_ARREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_V", "role": "0_ARREADY" }} , 
 	{ "name": "m_axi_gmem_V_0_ARADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "gmem_V", "role": "0_ARADDR" }} , 
 	{ "name": "m_axi_gmem_V_0_ARID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_V", "role": "0_ARID" }} , 
 	{ "name": "m_axi_gmem_V_0_ARLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "gmem_V", "role": "0_ARLEN" }} , 
 	{ "name": "m_axi_gmem_V_0_ARSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "gmem_V", "role": "0_ARSIZE" }} , 
 	{ "name": "m_axi_gmem_V_0_ARBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem_V", "role": "0_ARBURST" }} , 
 	{ "name": "m_axi_gmem_V_0_ARLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem_V", "role": "0_ARLOCK" }} , 
 	{ "name": "m_axi_gmem_V_0_ARCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem_V", "role": "0_ARCACHE" }} , 
 	{ "name": "m_axi_gmem_V_0_ARPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "gmem_V", "role": "0_ARPROT" }} , 
 	{ "name": "m_axi_gmem_V_0_ARQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem_V", "role": "0_ARQOS" }} , 
 	{ "name": "m_axi_gmem_V_0_ARREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem_V", "role": "0_ARREGION" }} , 
 	{ "name": "m_axi_gmem_V_0_ARUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_V", "role": "0_ARUSER" }} , 
 	{ "name": "m_axi_gmem_V_0_RVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_V", "role": "0_RVALID" }} , 
 	{ "name": "m_axi_gmem_V_0_RREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_V", "role": "0_RREADY" }} , 
 	{ "name": "m_axi_gmem_V_0_RDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "gmem_V", "role": "0_RDATA" }} , 
 	{ "name": "m_axi_gmem_V_0_RLAST", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_V", "role": "0_RLAST" }} , 
 	{ "name": "m_axi_gmem_V_0_RID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_V", "role": "0_RID" }} , 
 	{ "name": "m_axi_gmem_V_0_RFIFONUM", "direction": "in", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "gmem_V", "role": "0_RFIFONUM" }} , 
 	{ "name": "m_axi_gmem_V_0_RUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_V", "role": "0_RUSER" }} , 
 	{ "name": "m_axi_gmem_V_0_RRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem_V", "role": "0_RRESP" }} , 
 	{ "name": "m_axi_gmem_V_0_BVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_V", "role": "0_BVALID" }} , 
 	{ "name": "m_axi_gmem_V_0_BREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_V", "role": "0_BREADY" }} , 
 	{ "name": "m_axi_gmem_V_0_BRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem_V", "role": "0_BRESP" }} , 
 	{ "name": "m_axi_gmem_V_0_BID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_V", "role": "0_BID" }} , 
 	{ "name": "m_axi_gmem_V_0_BUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_V", "role": "0_BUSER" }} , 
 	{ "name": "sext_ln70", "direction": "in", "datatype": "sc_lv", "bitwidth":60, "type": "signal", "bundle":{"name": "sext_ln70", "role": "default" }} , 
 	{ "name": "rb_7_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "rb_7", "role": "address0" }} , 
 	{ "name": "rb_7_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rb_7", "role": "ce0" }} , 
 	{ "name": "rb_7_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rb_7", "role": "we0" }} , 
 	{ "name": "rb_7_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "rb_7", "role": "d0" }} , 
 	{ "name": "rb_6_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "rb_6", "role": "address0" }} , 
 	{ "name": "rb_6_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rb_6", "role": "ce0" }} , 
 	{ "name": "rb_6_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rb_6", "role": "we0" }} , 
 	{ "name": "rb_6_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "rb_6", "role": "d0" }} , 
 	{ "name": "rb_5_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "rb_5", "role": "address0" }} , 
 	{ "name": "rb_5_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rb_5", "role": "ce0" }} , 
 	{ "name": "rb_5_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rb_5", "role": "we0" }} , 
 	{ "name": "rb_5_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "rb_5", "role": "d0" }} , 
 	{ "name": "rb_4_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "rb_4", "role": "address0" }} , 
 	{ "name": "rb_4_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rb_4", "role": "ce0" }} , 
 	{ "name": "rb_4_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rb_4", "role": "we0" }} , 
 	{ "name": "rb_4_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "rb_4", "role": "d0" }} , 
 	{ "name": "rb_3_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "rb_3", "role": "address0" }} , 
 	{ "name": "rb_3_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rb_3", "role": "ce0" }} , 
 	{ "name": "rb_3_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rb_3", "role": "we0" }} , 
 	{ "name": "rb_3_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "rb_3", "role": "d0" }} , 
 	{ "name": "rb_2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "rb_2", "role": "address0" }} , 
 	{ "name": "rb_2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rb_2", "role": "ce0" }} , 
 	{ "name": "rb_2_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rb_2", "role": "we0" }} , 
 	{ "name": "rb_2_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "rb_2", "role": "d0" }} , 
 	{ "name": "rb_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "rb_1", "role": "address0" }} , 
 	{ "name": "rb_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rb_1", "role": "ce0" }} , 
 	{ "name": "rb_1_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rb_1", "role": "we0" }} , 
 	{ "name": "rb_1_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "rb_1", "role": "d0" }} , 
 	{ "name": "rb_0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "rb_0", "role": "address0" }} , 
 	{ "name": "rb_0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rb_0", "role": "ce0" }} , 
 	{ "name": "rb_0_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rb_0", "role": "we0" }} , 
 	{ "name": "rb_0_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "rb_0", "role": "d0" }}  ]}

set ArgLastReadFirstWriteLatency {
	load_row_wv_Pipeline_LOAD_WV_VITIS_LOOP_71_1 {
		gmem_V {Type I LastRead 1 FirstWrite -1}
		sext_ln70 {Type I LastRead 0 FirstWrite -1}
		rb_7 {Type O LastRead -1 FirstWrite 2}
		rb_6 {Type O LastRead -1 FirstWrite 2}
		rb_5 {Type O LastRead -1 FirstWrite 2}
		rb_4 {Type O LastRead -1 FirstWrite 2}
		rb_3 {Type O LastRead -1 FirstWrite 2}
		rb_2 {Type O LastRead -1 FirstWrite 2}
		rb_1 {Type O LastRead -1 FirstWrite 2}
		rb_0 {Type O LastRead -1 FirstWrite 2}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "75", "Max" : "75"}
	, {"Name" : "Interval", "Min" : "75", "Max" : "75"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	 { m_axi {  { m_axi_gmem_V_0_AWVALID VALID 1 1 }  { m_axi_gmem_V_0_AWREADY READY 0 1 }  { m_axi_gmem_V_0_AWADDR ADDR 1 64 }  { m_axi_gmem_V_0_AWID ID 1 1 }  { m_axi_gmem_V_0_AWLEN SIZE 1 32 }  { m_axi_gmem_V_0_AWSIZE BURST 1 3 }  { m_axi_gmem_V_0_AWBURST LOCK 1 2 }  { m_axi_gmem_V_0_AWLOCK CACHE 1 2 }  { m_axi_gmem_V_0_AWCACHE PROT 1 4 }  { m_axi_gmem_V_0_AWPROT QOS 1 3 }  { m_axi_gmem_V_0_AWQOS REGION 1 4 }  { m_axi_gmem_V_0_AWREGION USER 1 4 }  { m_axi_gmem_V_0_AWUSER DATA 1 1 }  { m_axi_gmem_V_0_WVALID VALID 1 1 }  { m_axi_gmem_V_0_WREADY READY 0 1 }  { m_axi_gmem_V_0_WDATA FIFONUM 1 128 }  { m_axi_gmem_V_0_WSTRB STRB 1 16 }  { m_axi_gmem_V_0_WLAST LAST 1 1 }  { m_axi_gmem_V_0_WID ID 1 1 }  { m_axi_gmem_V_0_WUSER DATA 1 1 }  { m_axi_gmem_V_0_ARVALID VALID 1 1 }  { m_axi_gmem_V_0_ARREADY READY 0 1 }  { m_axi_gmem_V_0_ARADDR ADDR 1 64 }  { m_axi_gmem_V_0_ARID ID 1 1 }  { m_axi_gmem_V_0_ARLEN SIZE 1 32 }  { m_axi_gmem_V_0_ARSIZE BURST 1 3 }  { m_axi_gmem_V_0_ARBURST LOCK 1 2 }  { m_axi_gmem_V_0_ARLOCK CACHE 1 2 }  { m_axi_gmem_V_0_ARCACHE PROT 1 4 }  { m_axi_gmem_V_0_ARPROT QOS 1 3 }  { m_axi_gmem_V_0_ARQOS REGION 1 4 }  { m_axi_gmem_V_0_ARREGION USER 1 4 }  { m_axi_gmem_V_0_ARUSER DATA 1 1 }  { m_axi_gmem_V_0_RVALID VALID 0 1 }  { m_axi_gmem_V_0_RREADY READY 1 1 }  { m_axi_gmem_V_0_RDATA FIFONUM 0 128 }  { m_axi_gmem_V_0_RLAST LAST 0 1 }  { m_axi_gmem_V_0_RID ID 0 1 }  { m_axi_gmem_V_0_RFIFONUM LEN 0 10 }  { m_axi_gmem_V_0_RUSER DATA 0 1 }  { m_axi_gmem_V_0_RRESP RESP 0 2 }  { m_axi_gmem_V_0_BVALID VALID 0 1 }  { m_axi_gmem_V_0_BREADY READY 1 1 }  { m_axi_gmem_V_0_BRESP RESP 0 2 }  { m_axi_gmem_V_0_BID ID 0 1 }  { m_axi_gmem_V_0_BUSER DATA 0 1 } } }
	sext_ln70 { ap_none {  { sext_ln70 in_data 0 60 } } }
	rb_7 { ap_memory {  { rb_7_address0 mem_address 1 4 }  { rb_7_ce0 mem_ce 1 1 }  { rb_7_we0 mem_we 1 1 }  { rb_7_d0 mem_din 1 128 } } }
	rb_6 { ap_memory {  { rb_6_address0 mem_address 1 4 }  { rb_6_ce0 mem_ce 1 1 }  { rb_6_we0 mem_we 1 1 }  { rb_6_d0 mem_din 1 128 } } }
	rb_5 { ap_memory {  { rb_5_address0 mem_address 1 4 }  { rb_5_ce0 mem_ce 1 1 }  { rb_5_we0 mem_we 1 1 }  { rb_5_d0 mem_din 1 128 } } }
	rb_4 { ap_memory {  { rb_4_address0 mem_address 1 4 }  { rb_4_ce0 mem_ce 1 1 }  { rb_4_we0 mem_we 1 1 }  { rb_4_d0 mem_din 1 128 } } }
	rb_3 { ap_memory {  { rb_3_address0 mem_address 1 4 }  { rb_3_ce0 mem_ce 1 1 }  { rb_3_we0 mem_we 1 1 }  { rb_3_d0 mem_din 1 128 } } }
	rb_2 { ap_memory {  { rb_2_address0 mem_address 1 4 }  { rb_2_ce0 mem_ce 1 1 }  { rb_2_we0 mem_we 1 1 }  { rb_2_d0 mem_din 1 128 } } }
	rb_1 { ap_memory {  { rb_1_address0 mem_address 1 4 }  { rb_1_ce0 mem_ce 1 1 }  { rb_1_we0 mem_we 1 1 }  { rb_1_d0 mem_din 1 128 } } }
	rb_0 { ap_memory {  { rb_0_address0 mem_address 1 4 }  { rb_0_ce0 mem_ce 1 1 }  { rb_0_we0 mem_we 1 1 }  { rb_0_d0 mem_din 1 128 } } }
}
