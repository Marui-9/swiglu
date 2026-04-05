set moduleName load_row_down_q6k_Pipeline_LOAD_QL
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
set C_modelName {load_row_down_q6k_Pipeline_LOAD_QL}
set C_modelType { void 0 }
set ap_memory_interface_dict [dict create]
dict set ap_memory_interface_dict ql_buf_7 { MEM_WIDTH 128 MEM_SIZE 512 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 0 }
dict set ap_memory_interface_dict ql_buf_6 { MEM_WIDTH 128 MEM_SIZE 512 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 0 }
dict set ap_memory_interface_dict ql_buf_5 { MEM_WIDTH 128 MEM_SIZE 512 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 0 }
dict set ap_memory_interface_dict ql_buf_4 { MEM_WIDTH 128 MEM_SIZE 512 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 0 }
dict set ap_memory_interface_dict ql_buf_3 { MEM_WIDTH 128 MEM_SIZE 512 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 0 }
dict set ap_memory_interface_dict ql_buf_2 { MEM_WIDTH 128 MEM_SIZE 512 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 0 }
dict set ap_memory_interface_dict ql_buf_1 { MEM_WIDTH 128 MEM_SIZE 512 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 0 }
dict set ap_memory_interface_dict ql_buf_0 { MEM_WIDTH 128 MEM_SIZE 512 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 0 }
set C_modelArgList {
	{ gmem_Wd int 128 regular {axi_master 0 stable }  }
	{ sext_ln492 int 60 regular {ap_stable 0} }
	{ ql_buf_7 int 128 regular {array 32 { 0 } 0 1 }  }
	{ ql_buf_6 int 128 regular {array 32 { 0 } 0 1 }  }
	{ ql_buf_5 int 128 regular {array 32 { 0 } 0 1 }  }
	{ ql_buf_4 int 128 regular {array 32 { 0 } 0 1 }  }
	{ ql_buf_3 int 128 regular {array 32 { 0 } 0 1 }  }
	{ ql_buf_2 int 128 regular {array 32 { 0 } 0 1 }  }
	{ ql_buf_1 int 128 regular {array 32 { 0 } 0 1 }  }
	{ ql_buf_0 int 128 regular {array 32 { 0 } 0 1 }  }
}
set hasAXIMCache 0
set l_AXIML2Cache [list]
set AXIMCacheInstDict [dict create]
set C_modelArgMapList {[ 
	{ "Name" : "gmem_Wd", "interface" : "axi_master", "bitwidth" : 128, "direction" : "READONLY", "bitSlice":[ {"cElement": [{"cName": "W_down","offset": { "type": "dynamic","port_name": "W_down","bundle": "CTRL"},"direction": "READONLY"}]}]} , 
 	{ "Name" : "sext_ln492", "interface" : "wire", "bitwidth" : 60, "direction" : "READONLY"} , 
 	{ "Name" : "ql_buf_7", "interface" : "memory", "bitwidth" : 128, "direction" : "WRITEONLY"} , 
 	{ "Name" : "ql_buf_6", "interface" : "memory", "bitwidth" : 128, "direction" : "WRITEONLY"} , 
 	{ "Name" : "ql_buf_5", "interface" : "memory", "bitwidth" : 128, "direction" : "WRITEONLY"} , 
 	{ "Name" : "ql_buf_4", "interface" : "memory", "bitwidth" : 128, "direction" : "WRITEONLY"} , 
 	{ "Name" : "ql_buf_3", "interface" : "memory", "bitwidth" : 128, "direction" : "WRITEONLY"} , 
 	{ "Name" : "ql_buf_2", "interface" : "memory", "bitwidth" : 128, "direction" : "WRITEONLY"} , 
 	{ "Name" : "ql_buf_1", "interface" : "memory", "bitwidth" : 128, "direction" : "WRITEONLY"} , 
 	{ "Name" : "ql_buf_0", "interface" : "memory", "bitwidth" : 128, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 85
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
	{ sext_ln492 sc_in sc_lv 60 signal 1 } 
	{ ql_buf_7_address0 sc_out sc_lv 5 signal 2 } 
	{ ql_buf_7_ce0 sc_out sc_logic 1 signal 2 } 
	{ ql_buf_7_we0 sc_out sc_logic 1 signal 2 } 
	{ ql_buf_7_d0 sc_out sc_lv 128 signal 2 } 
	{ ql_buf_6_address0 sc_out sc_lv 5 signal 3 } 
	{ ql_buf_6_ce0 sc_out sc_logic 1 signal 3 } 
	{ ql_buf_6_we0 sc_out sc_logic 1 signal 3 } 
	{ ql_buf_6_d0 sc_out sc_lv 128 signal 3 } 
	{ ql_buf_5_address0 sc_out sc_lv 5 signal 4 } 
	{ ql_buf_5_ce0 sc_out sc_logic 1 signal 4 } 
	{ ql_buf_5_we0 sc_out sc_logic 1 signal 4 } 
	{ ql_buf_5_d0 sc_out sc_lv 128 signal 4 } 
	{ ql_buf_4_address0 sc_out sc_lv 5 signal 5 } 
	{ ql_buf_4_ce0 sc_out sc_logic 1 signal 5 } 
	{ ql_buf_4_we0 sc_out sc_logic 1 signal 5 } 
	{ ql_buf_4_d0 sc_out sc_lv 128 signal 5 } 
	{ ql_buf_3_address0 sc_out sc_lv 5 signal 6 } 
	{ ql_buf_3_ce0 sc_out sc_logic 1 signal 6 } 
	{ ql_buf_3_we0 sc_out sc_logic 1 signal 6 } 
	{ ql_buf_3_d0 sc_out sc_lv 128 signal 6 } 
	{ ql_buf_2_address0 sc_out sc_lv 5 signal 7 } 
	{ ql_buf_2_ce0 sc_out sc_logic 1 signal 7 } 
	{ ql_buf_2_we0 sc_out sc_logic 1 signal 7 } 
	{ ql_buf_2_d0 sc_out sc_lv 128 signal 7 } 
	{ ql_buf_1_address0 sc_out sc_lv 5 signal 8 } 
	{ ql_buf_1_ce0 sc_out sc_logic 1 signal 8 } 
	{ ql_buf_1_we0 sc_out sc_logic 1 signal 8 } 
	{ ql_buf_1_d0 sc_out sc_lv 128 signal 8 } 
	{ ql_buf_0_address0 sc_out sc_lv 5 signal 9 } 
	{ ql_buf_0_ce0 sc_out sc_logic 1 signal 9 } 
	{ ql_buf_0_we0 sc_out sc_logic 1 signal 9 } 
	{ ql_buf_0_d0 sc_out sc_lv 128 signal 9 } 
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
 	{ "name": "sext_ln492", "direction": "in", "datatype": "sc_lv", "bitwidth":60, "type": "signal", "bundle":{"name": "sext_ln492", "role": "default" }} , 
 	{ "name": "ql_buf_7_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "ql_buf_7", "role": "address0" }} , 
 	{ "name": "ql_buf_7_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ql_buf_7", "role": "ce0" }} , 
 	{ "name": "ql_buf_7_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ql_buf_7", "role": "we0" }} , 
 	{ "name": "ql_buf_7_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "ql_buf_7", "role": "d0" }} , 
 	{ "name": "ql_buf_6_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "ql_buf_6", "role": "address0" }} , 
 	{ "name": "ql_buf_6_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ql_buf_6", "role": "ce0" }} , 
 	{ "name": "ql_buf_6_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ql_buf_6", "role": "we0" }} , 
 	{ "name": "ql_buf_6_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "ql_buf_6", "role": "d0" }} , 
 	{ "name": "ql_buf_5_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "ql_buf_5", "role": "address0" }} , 
 	{ "name": "ql_buf_5_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ql_buf_5", "role": "ce0" }} , 
 	{ "name": "ql_buf_5_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ql_buf_5", "role": "we0" }} , 
 	{ "name": "ql_buf_5_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "ql_buf_5", "role": "d0" }} , 
 	{ "name": "ql_buf_4_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "ql_buf_4", "role": "address0" }} , 
 	{ "name": "ql_buf_4_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ql_buf_4", "role": "ce0" }} , 
 	{ "name": "ql_buf_4_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ql_buf_4", "role": "we0" }} , 
 	{ "name": "ql_buf_4_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "ql_buf_4", "role": "d0" }} , 
 	{ "name": "ql_buf_3_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "ql_buf_3", "role": "address0" }} , 
 	{ "name": "ql_buf_3_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ql_buf_3", "role": "ce0" }} , 
 	{ "name": "ql_buf_3_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ql_buf_3", "role": "we0" }} , 
 	{ "name": "ql_buf_3_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "ql_buf_3", "role": "d0" }} , 
 	{ "name": "ql_buf_2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "ql_buf_2", "role": "address0" }} , 
 	{ "name": "ql_buf_2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ql_buf_2", "role": "ce0" }} , 
 	{ "name": "ql_buf_2_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ql_buf_2", "role": "we0" }} , 
 	{ "name": "ql_buf_2_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "ql_buf_2", "role": "d0" }} , 
 	{ "name": "ql_buf_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "ql_buf_1", "role": "address0" }} , 
 	{ "name": "ql_buf_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ql_buf_1", "role": "ce0" }} , 
 	{ "name": "ql_buf_1_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ql_buf_1", "role": "we0" }} , 
 	{ "name": "ql_buf_1_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "ql_buf_1", "role": "d0" }} , 
 	{ "name": "ql_buf_0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "ql_buf_0", "role": "address0" }} , 
 	{ "name": "ql_buf_0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ql_buf_0", "role": "ce0" }} , 
 	{ "name": "ql_buf_0_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ql_buf_0", "role": "we0" }} , 
 	{ "name": "ql_buf_0_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "ql_buf_0", "role": "d0" }}  ]}

set ArgLastReadFirstWriteLatency {
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
		ql_buf_0 {Type O LastRead -1 FirstWrite 2}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "259", "Max" : "259"}
	, {"Name" : "Interval", "Min" : "259", "Max" : "259"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	 { m_axi {  { m_axi_gmem_Wd_0_AWVALID VALID 1 1 }  { m_axi_gmem_Wd_0_AWREADY READY 0 1 }  { m_axi_gmem_Wd_0_AWADDR ADDR 1 64 }  { m_axi_gmem_Wd_0_AWID ID 1 1 }  { m_axi_gmem_Wd_0_AWLEN SIZE 1 32 }  { m_axi_gmem_Wd_0_AWSIZE BURST 1 3 }  { m_axi_gmem_Wd_0_AWBURST LOCK 1 2 }  { m_axi_gmem_Wd_0_AWLOCK CACHE 1 2 }  { m_axi_gmem_Wd_0_AWCACHE PROT 1 4 }  { m_axi_gmem_Wd_0_AWPROT QOS 1 3 }  { m_axi_gmem_Wd_0_AWQOS REGION 1 4 }  { m_axi_gmem_Wd_0_AWREGION USER 1 4 }  { m_axi_gmem_Wd_0_AWUSER DATA 1 1 }  { m_axi_gmem_Wd_0_WVALID VALID 1 1 }  { m_axi_gmem_Wd_0_WREADY READY 0 1 }  { m_axi_gmem_Wd_0_WDATA FIFONUM 1 128 }  { m_axi_gmem_Wd_0_WSTRB STRB 1 16 }  { m_axi_gmem_Wd_0_WLAST LAST 1 1 }  { m_axi_gmem_Wd_0_WID ID 1 1 }  { m_axi_gmem_Wd_0_WUSER DATA 1 1 }  { m_axi_gmem_Wd_0_ARVALID VALID 1 1 }  { m_axi_gmem_Wd_0_ARREADY READY 0 1 }  { m_axi_gmem_Wd_0_ARADDR ADDR 1 64 }  { m_axi_gmem_Wd_0_ARID ID 1 1 }  { m_axi_gmem_Wd_0_ARLEN SIZE 1 32 }  { m_axi_gmem_Wd_0_ARSIZE BURST 1 3 }  { m_axi_gmem_Wd_0_ARBURST LOCK 1 2 }  { m_axi_gmem_Wd_0_ARLOCK CACHE 1 2 }  { m_axi_gmem_Wd_0_ARCACHE PROT 1 4 }  { m_axi_gmem_Wd_0_ARPROT QOS 1 3 }  { m_axi_gmem_Wd_0_ARQOS REGION 1 4 }  { m_axi_gmem_Wd_0_ARREGION USER 1 4 }  { m_axi_gmem_Wd_0_ARUSER DATA 1 1 }  { m_axi_gmem_Wd_0_RVALID VALID 0 1 }  { m_axi_gmem_Wd_0_RREADY READY 1 1 }  { m_axi_gmem_Wd_0_RDATA FIFONUM 0 128 }  { m_axi_gmem_Wd_0_RLAST LAST 0 1 }  { m_axi_gmem_Wd_0_RID ID 0 1 }  { m_axi_gmem_Wd_0_RFIFONUM LEN 0 10 }  { m_axi_gmem_Wd_0_RUSER DATA 0 1 }  { m_axi_gmem_Wd_0_RRESP RESP 0 2 }  { m_axi_gmem_Wd_0_BVALID VALID 0 1 }  { m_axi_gmem_Wd_0_BREADY READY 1 1 }  { m_axi_gmem_Wd_0_BRESP RESP 0 2 }  { m_axi_gmem_Wd_0_BID ID 0 1 }  { m_axi_gmem_Wd_0_BUSER DATA 0 1 } } }
	sext_ln492 { ap_stable {  { sext_ln492 in_data 0 60 } } }
	ql_buf_7 { ap_memory {  { ql_buf_7_address0 mem_address 1 5 }  { ql_buf_7_ce0 mem_ce 1 1 }  { ql_buf_7_we0 mem_we 1 1 }  { ql_buf_7_d0 mem_din 1 128 } } }
	ql_buf_6 { ap_memory {  { ql_buf_6_address0 mem_address 1 5 }  { ql_buf_6_ce0 mem_ce 1 1 }  { ql_buf_6_we0 mem_we 1 1 }  { ql_buf_6_d0 mem_din 1 128 } } }
	ql_buf_5 { ap_memory {  { ql_buf_5_address0 mem_address 1 5 }  { ql_buf_5_ce0 mem_ce 1 1 }  { ql_buf_5_we0 mem_we 1 1 }  { ql_buf_5_d0 mem_din 1 128 } } }
	ql_buf_4 { ap_memory {  { ql_buf_4_address0 mem_address 1 5 }  { ql_buf_4_ce0 mem_ce 1 1 }  { ql_buf_4_we0 mem_we 1 1 }  { ql_buf_4_d0 mem_din 1 128 } } }
	ql_buf_3 { ap_memory {  { ql_buf_3_address0 mem_address 1 5 }  { ql_buf_3_ce0 mem_ce 1 1 }  { ql_buf_3_we0 mem_we 1 1 }  { ql_buf_3_d0 mem_din 1 128 } } }
	ql_buf_2 { ap_memory {  { ql_buf_2_address0 mem_address 1 5 }  { ql_buf_2_ce0 mem_ce 1 1 }  { ql_buf_2_we0 mem_we 1 1 }  { ql_buf_2_d0 mem_din 1 128 } } }
	ql_buf_1 { ap_memory {  { ql_buf_1_address0 mem_address 1 5 }  { ql_buf_1_ce0 mem_ce 1 1 }  { ql_buf_1_we0 mem_we 1 1 }  { ql_buf_1_d0 mem_din 1 128 } } }
	ql_buf_0 { ap_memory {  { ql_buf_0_address0 mem_address 1 5 }  { ql_buf_0_ce0 mem_ce 1 1 }  { ql_buf_0_we0 mem_we 1 1 }  { ql_buf_0_d0 mem_din 1 128 } } }
}
