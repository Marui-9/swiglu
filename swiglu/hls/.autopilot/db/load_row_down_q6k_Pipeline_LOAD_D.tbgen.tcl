set moduleName load_row_down_q6k_Pipeline_LOAD_D
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
set C_modelName {load_row_down_q6k_Pipeline_LOAD_D}
set C_modelType { void 0 }
set ap_memory_interface_dict [dict create]
set C_modelArgList {
	{ d_buf_0 float 32 regular {pointer 1}  }
	{ d_buf_1 float 32 regular {pointer 1}  }
	{ d_buf_2 float 32 regular {pointer 1}  }
	{ d_buf_3 float 32 regular {pointer 1}  }
	{ d_buf_4 float 32 regular {pointer 1}  }
	{ d_buf_5 float 32 regular {pointer 1}  }
	{ d_buf_6 float 32 regular {pointer 1}  }
	{ d_buf_7 float 32 regular {pointer 1}  }
	{ gmem_Wd int 128 regular {axi_master 0 stable }  }
	{ sext_ln510 int 60 regular {ap_stable 0} }
	{ d_buf_31 float 32 regular {pointer 1}  }
	{ d_buf_30 float 32 regular {pointer 1}  }
	{ d_buf_29 float 32 regular {pointer 1}  }
	{ d_buf_28 float 32 regular {pointer 1}  }
	{ d_buf_27 float 32 regular {pointer 1}  }
	{ d_buf_26 float 32 regular {pointer 1}  }
	{ d_buf_25 float 32 regular {pointer 1}  }
	{ d_buf_24 float 32 regular {pointer 1}  }
	{ d_buf_23 float 32 regular {pointer 1}  }
	{ d_buf_22 float 32 regular {pointer 1}  }
	{ d_buf_21 float 32 regular {pointer 1}  }
	{ d_buf_20 float 32 regular {pointer 1}  }
	{ d_buf_19 float 32 regular {pointer 1}  }
	{ d_buf_18 float 32 regular {pointer 1}  }
	{ d_buf_17 float 32 regular {pointer 1}  }
	{ d_buf_16 float 32 regular {pointer 1}  }
	{ d_buf_15 float 32 regular {pointer 1}  }
	{ d_buf_14 float 32 regular {pointer 1}  }
	{ d_buf_13 float 32 regular {pointer 1}  }
	{ d_buf_12 float 32 regular {pointer 1}  }
	{ d_buf_11 float 32 regular {pointer 1}  }
	{ d_buf_10 float 32 regular {pointer 1}  }
	{ d_buf_9 float 32 regular {pointer 1}  }
	{ d_buf_8 float 32 regular {pointer 1}  }
}
set hasAXIMCache 0
set l_AXIML2Cache [list]
set AXIMCacheInstDict [dict create]
set C_modelArgMapList {[ 
	{ "Name" : "d_buf_0", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "d_buf_1", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "d_buf_2", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "d_buf_3", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "d_buf_4", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "d_buf_5", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "d_buf_6", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "d_buf_7", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "gmem_Wd", "interface" : "axi_master", "bitwidth" : 128, "direction" : "READONLY", "bitSlice":[ {"cElement": [{"cName": "W_down","offset": { "type": "dynamic","port_name": "W_down","bundle": "CTRL"},"direction": "READONLY"}]}]} , 
 	{ "Name" : "sext_ln510", "interface" : "wire", "bitwidth" : 60, "direction" : "READONLY"} , 
 	{ "Name" : "d_buf_31", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "d_buf_30", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "d_buf_29", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "d_buf_28", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "d_buf_27", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "d_buf_26", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "d_buf_25", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "d_buf_24", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "d_buf_23", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "d_buf_22", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "d_buf_21", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "d_buf_20", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "d_buf_19", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "d_buf_18", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "d_buf_17", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "d_buf_16", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "d_buf_15", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "d_buf_14", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "d_buf_13", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "d_buf_12", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "d_buf_11", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "d_buf_10", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "d_buf_9", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "d_buf_8", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 117
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ m_axi_gmem_Wd_0_AWVALID sc_out sc_logic 1 signal 8 } 
	{ m_axi_gmem_Wd_0_AWREADY sc_in sc_logic 1 signal 8 } 
	{ m_axi_gmem_Wd_0_AWADDR sc_out sc_lv 64 signal 8 } 
	{ m_axi_gmem_Wd_0_AWID sc_out sc_lv 1 signal 8 } 
	{ m_axi_gmem_Wd_0_AWLEN sc_out sc_lv 32 signal 8 } 
	{ m_axi_gmem_Wd_0_AWSIZE sc_out sc_lv 3 signal 8 } 
	{ m_axi_gmem_Wd_0_AWBURST sc_out sc_lv 2 signal 8 } 
	{ m_axi_gmem_Wd_0_AWLOCK sc_out sc_lv 2 signal 8 } 
	{ m_axi_gmem_Wd_0_AWCACHE sc_out sc_lv 4 signal 8 } 
	{ m_axi_gmem_Wd_0_AWPROT sc_out sc_lv 3 signal 8 } 
	{ m_axi_gmem_Wd_0_AWQOS sc_out sc_lv 4 signal 8 } 
	{ m_axi_gmem_Wd_0_AWREGION sc_out sc_lv 4 signal 8 } 
	{ m_axi_gmem_Wd_0_AWUSER sc_out sc_lv 1 signal 8 } 
	{ m_axi_gmem_Wd_0_WVALID sc_out sc_logic 1 signal 8 } 
	{ m_axi_gmem_Wd_0_WREADY sc_in sc_logic 1 signal 8 } 
	{ m_axi_gmem_Wd_0_WDATA sc_out sc_lv 128 signal 8 } 
	{ m_axi_gmem_Wd_0_WSTRB sc_out sc_lv 16 signal 8 } 
	{ m_axi_gmem_Wd_0_WLAST sc_out sc_logic 1 signal 8 } 
	{ m_axi_gmem_Wd_0_WID sc_out sc_lv 1 signal 8 } 
	{ m_axi_gmem_Wd_0_WUSER sc_out sc_lv 1 signal 8 } 
	{ m_axi_gmem_Wd_0_ARVALID sc_out sc_logic 1 signal 8 } 
	{ m_axi_gmem_Wd_0_ARREADY sc_in sc_logic 1 signal 8 } 
	{ m_axi_gmem_Wd_0_ARADDR sc_out sc_lv 64 signal 8 } 
	{ m_axi_gmem_Wd_0_ARID sc_out sc_lv 1 signal 8 } 
	{ m_axi_gmem_Wd_0_ARLEN sc_out sc_lv 32 signal 8 } 
	{ m_axi_gmem_Wd_0_ARSIZE sc_out sc_lv 3 signal 8 } 
	{ m_axi_gmem_Wd_0_ARBURST sc_out sc_lv 2 signal 8 } 
	{ m_axi_gmem_Wd_0_ARLOCK sc_out sc_lv 2 signal 8 } 
	{ m_axi_gmem_Wd_0_ARCACHE sc_out sc_lv 4 signal 8 } 
	{ m_axi_gmem_Wd_0_ARPROT sc_out sc_lv 3 signal 8 } 
	{ m_axi_gmem_Wd_0_ARQOS sc_out sc_lv 4 signal 8 } 
	{ m_axi_gmem_Wd_0_ARREGION sc_out sc_lv 4 signal 8 } 
	{ m_axi_gmem_Wd_0_ARUSER sc_out sc_lv 1 signal 8 } 
	{ m_axi_gmem_Wd_0_RVALID sc_in sc_logic 1 signal 8 } 
	{ m_axi_gmem_Wd_0_RREADY sc_out sc_logic 1 signal 8 } 
	{ m_axi_gmem_Wd_0_RDATA sc_in sc_lv 128 signal 8 } 
	{ m_axi_gmem_Wd_0_RLAST sc_in sc_logic 1 signal 8 } 
	{ m_axi_gmem_Wd_0_RID sc_in sc_lv 1 signal 8 } 
	{ m_axi_gmem_Wd_0_RFIFONUM sc_in sc_lv 10 signal 8 } 
	{ m_axi_gmem_Wd_0_RUSER sc_in sc_lv 1 signal 8 } 
	{ m_axi_gmem_Wd_0_RRESP sc_in sc_lv 2 signal 8 } 
	{ m_axi_gmem_Wd_0_BVALID sc_in sc_logic 1 signal 8 } 
	{ m_axi_gmem_Wd_0_BREADY sc_out sc_logic 1 signal 8 } 
	{ m_axi_gmem_Wd_0_BRESP sc_in sc_lv 2 signal 8 } 
	{ m_axi_gmem_Wd_0_BID sc_in sc_lv 1 signal 8 } 
	{ m_axi_gmem_Wd_0_BUSER sc_in sc_lv 1 signal 8 } 
	{ d_buf_0 sc_out sc_lv 32 signal 0 } 
	{ d_buf_0_ap_vld sc_out sc_logic 1 outvld 0 } 
	{ d_buf_1 sc_out sc_lv 32 signal 1 } 
	{ d_buf_1_ap_vld sc_out sc_logic 1 outvld 1 } 
	{ d_buf_2 sc_out sc_lv 32 signal 2 } 
	{ d_buf_2_ap_vld sc_out sc_logic 1 outvld 2 } 
	{ d_buf_3 sc_out sc_lv 32 signal 3 } 
	{ d_buf_3_ap_vld sc_out sc_logic 1 outvld 3 } 
	{ d_buf_4 sc_out sc_lv 32 signal 4 } 
	{ d_buf_4_ap_vld sc_out sc_logic 1 outvld 4 } 
	{ d_buf_5 sc_out sc_lv 32 signal 5 } 
	{ d_buf_5_ap_vld sc_out sc_logic 1 outvld 5 } 
	{ d_buf_6 sc_out sc_lv 32 signal 6 } 
	{ d_buf_6_ap_vld sc_out sc_logic 1 outvld 6 } 
	{ d_buf_7 sc_out sc_lv 32 signal 7 } 
	{ d_buf_7_ap_vld sc_out sc_logic 1 outvld 7 } 
	{ sext_ln510 sc_in sc_lv 60 signal 9 } 
	{ d_buf_31 sc_out sc_lv 32 signal 10 } 
	{ d_buf_31_ap_vld sc_out sc_logic 1 outvld 10 } 
	{ d_buf_30 sc_out sc_lv 32 signal 11 } 
	{ d_buf_30_ap_vld sc_out sc_logic 1 outvld 11 } 
	{ d_buf_29 sc_out sc_lv 32 signal 12 } 
	{ d_buf_29_ap_vld sc_out sc_logic 1 outvld 12 } 
	{ d_buf_28 sc_out sc_lv 32 signal 13 } 
	{ d_buf_28_ap_vld sc_out sc_logic 1 outvld 13 } 
	{ d_buf_27 sc_out sc_lv 32 signal 14 } 
	{ d_buf_27_ap_vld sc_out sc_logic 1 outvld 14 } 
	{ d_buf_26 sc_out sc_lv 32 signal 15 } 
	{ d_buf_26_ap_vld sc_out sc_logic 1 outvld 15 } 
	{ d_buf_25 sc_out sc_lv 32 signal 16 } 
	{ d_buf_25_ap_vld sc_out sc_logic 1 outvld 16 } 
	{ d_buf_24 sc_out sc_lv 32 signal 17 } 
	{ d_buf_24_ap_vld sc_out sc_logic 1 outvld 17 } 
	{ d_buf_23 sc_out sc_lv 32 signal 18 } 
	{ d_buf_23_ap_vld sc_out sc_logic 1 outvld 18 } 
	{ d_buf_22 sc_out sc_lv 32 signal 19 } 
	{ d_buf_22_ap_vld sc_out sc_logic 1 outvld 19 } 
	{ d_buf_21 sc_out sc_lv 32 signal 20 } 
	{ d_buf_21_ap_vld sc_out sc_logic 1 outvld 20 } 
	{ d_buf_20 sc_out sc_lv 32 signal 21 } 
	{ d_buf_20_ap_vld sc_out sc_logic 1 outvld 21 } 
	{ d_buf_19 sc_out sc_lv 32 signal 22 } 
	{ d_buf_19_ap_vld sc_out sc_logic 1 outvld 22 } 
	{ d_buf_18 sc_out sc_lv 32 signal 23 } 
	{ d_buf_18_ap_vld sc_out sc_logic 1 outvld 23 } 
	{ d_buf_17 sc_out sc_lv 32 signal 24 } 
	{ d_buf_17_ap_vld sc_out sc_logic 1 outvld 24 } 
	{ d_buf_16 sc_out sc_lv 32 signal 25 } 
	{ d_buf_16_ap_vld sc_out sc_logic 1 outvld 25 } 
	{ d_buf_15 sc_out sc_lv 32 signal 26 } 
	{ d_buf_15_ap_vld sc_out sc_logic 1 outvld 26 } 
	{ d_buf_14 sc_out sc_lv 32 signal 27 } 
	{ d_buf_14_ap_vld sc_out sc_logic 1 outvld 27 } 
	{ d_buf_13 sc_out sc_lv 32 signal 28 } 
	{ d_buf_13_ap_vld sc_out sc_logic 1 outvld 28 } 
	{ d_buf_12 sc_out sc_lv 32 signal 29 } 
	{ d_buf_12_ap_vld sc_out sc_logic 1 outvld 29 } 
	{ d_buf_11 sc_out sc_lv 32 signal 30 } 
	{ d_buf_11_ap_vld sc_out sc_logic 1 outvld 30 } 
	{ d_buf_10 sc_out sc_lv 32 signal 31 } 
	{ d_buf_10_ap_vld sc_out sc_logic 1 outvld 31 } 
	{ d_buf_9 sc_out sc_lv 32 signal 32 } 
	{ d_buf_9_ap_vld sc_out sc_logic 1 outvld 32 } 
	{ d_buf_8 sc_out sc_lv 32 signal 33 } 
	{ d_buf_8_ap_vld sc_out sc_logic 1 outvld 33 } 
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
 	{ "name": "d_buf_0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "d_buf_0", "role": "default" }} , 
 	{ "name": "d_buf_0_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "d_buf_0", "role": "ap_vld" }} , 
 	{ "name": "d_buf_1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "d_buf_1", "role": "default" }} , 
 	{ "name": "d_buf_1_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "d_buf_1", "role": "ap_vld" }} , 
 	{ "name": "d_buf_2", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "d_buf_2", "role": "default" }} , 
 	{ "name": "d_buf_2_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "d_buf_2", "role": "ap_vld" }} , 
 	{ "name": "d_buf_3", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "d_buf_3", "role": "default" }} , 
 	{ "name": "d_buf_3_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "d_buf_3", "role": "ap_vld" }} , 
 	{ "name": "d_buf_4", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "d_buf_4", "role": "default" }} , 
 	{ "name": "d_buf_4_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "d_buf_4", "role": "ap_vld" }} , 
 	{ "name": "d_buf_5", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "d_buf_5", "role": "default" }} , 
 	{ "name": "d_buf_5_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "d_buf_5", "role": "ap_vld" }} , 
 	{ "name": "d_buf_6", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "d_buf_6", "role": "default" }} , 
 	{ "name": "d_buf_6_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "d_buf_6", "role": "ap_vld" }} , 
 	{ "name": "d_buf_7", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "d_buf_7", "role": "default" }} , 
 	{ "name": "d_buf_7_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "d_buf_7", "role": "ap_vld" }} , 
 	{ "name": "sext_ln510", "direction": "in", "datatype": "sc_lv", "bitwidth":60, "type": "signal", "bundle":{"name": "sext_ln510", "role": "default" }} , 
 	{ "name": "d_buf_31", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "d_buf_31", "role": "default" }} , 
 	{ "name": "d_buf_31_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "d_buf_31", "role": "ap_vld" }} , 
 	{ "name": "d_buf_30", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "d_buf_30", "role": "default" }} , 
 	{ "name": "d_buf_30_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "d_buf_30", "role": "ap_vld" }} , 
 	{ "name": "d_buf_29", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "d_buf_29", "role": "default" }} , 
 	{ "name": "d_buf_29_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "d_buf_29", "role": "ap_vld" }} , 
 	{ "name": "d_buf_28", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "d_buf_28", "role": "default" }} , 
 	{ "name": "d_buf_28_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "d_buf_28", "role": "ap_vld" }} , 
 	{ "name": "d_buf_27", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "d_buf_27", "role": "default" }} , 
 	{ "name": "d_buf_27_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "d_buf_27", "role": "ap_vld" }} , 
 	{ "name": "d_buf_26", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "d_buf_26", "role": "default" }} , 
 	{ "name": "d_buf_26_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "d_buf_26", "role": "ap_vld" }} , 
 	{ "name": "d_buf_25", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "d_buf_25", "role": "default" }} , 
 	{ "name": "d_buf_25_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "d_buf_25", "role": "ap_vld" }} , 
 	{ "name": "d_buf_24", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "d_buf_24", "role": "default" }} , 
 	{ "name": "d_buf_24_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "d_buf_24", "role": "ap_vld" }} , 
 	{ "name": "d_buf_23", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "d_buf_23", "role": "default" }} , 
 	{ "name": "d_buf_23_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "d_buf_23", "role": "ap_vld" }} , 
 	{ "name": "d_buf_22", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "d_buf_22", "role": "default" }} , 
 	{ "name": "d_buf_22_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "d_buf_22", "role": "ap_vld" }} , 
 	{ "name": "d_buf_21", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "d_buf_21", "role": "default" }} , 
 	{ "name": "d_buf_21_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "d_buf_21", "role": "ap_vld" }} , 
 	{ "name": "d_buf_20", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "d_buf_20", "role": "default" }} , 
 	{ "name": "d_buf_20_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "d_buf_20", "role": "ap_vld" }} , 
 	{ "name": "d_buf_19", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "d_buf_19", "role": "default" }} , 
 	{ "name": "d_buf_19_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "d_buf_19", "role": "ap_vld" }} , 
 	{ "name": "d_buf_18", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "d_buf_18", "role": "default" }} , 
 	{ "name": "d_buf_18_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "d_buf_18", "role": "ap_vld" }} , 
 	{ "name": "d_buf_17", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "d_buf_17", "role": "default" }} , 
 	{ "name": "d_buf_17_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "d_buf_17", "role": "ap_vld" }} , 
 	{ "name": "d_buf_16", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "d_buf_16", "role": "default" }} , 
 	{ "name": "d_buf_16_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "d_buf_16", "role": "ap_vld" }} , 
 	{ "name": "d_buf_15", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "d_buf_15", "role": "default" }} , 
 	{ "name": "d_buf_15_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "d_buf_15", "role": "ap_vld" }} , 
 	{ "name": "d_buf_14", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "d_buf_14", "role": "default" }} , 
 	{ "name": "d_buf_14_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "d_buf_14", "role": "ap_vld" }} , 
 	{ "name": "d_buf_13", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "d_buf_13", "role": "default" }} , 
 	{ "name": "d_buf_13_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "d_buf_13", "role": "ap_vld" }} , 
 	{ "name": "d_buf_12", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "d_buf_12", "role": "default" }} , 
 	{ "name": "d_buf_12_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "d_buf_12", "role": "ap_vld" }} , 
 	{ "name": "d_buf_11", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "d_buf_11", "role": "default" }} , 
 	{ "name": "d_buf_11_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "d_buf_11", "role": "ap_vld" }} , 
 	{ "name": "d_buf_10", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "d_buf_10", "role": "default" }} , 
 	{ "name": "d_buf_10_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "d_buf_10", "role": "ap_vld" }} , 
 	{ "name": "d_buf_9", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "d_buf_9", "role": "default" }} , 
 	{ "name": "d_buf_9_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "d_buf_9", "role": "ap_vld" }} , 
 	{ "name": "d_buf_8", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "d_buf_8", "role": "default" }} , 
 	{ "name": "d_buf_8_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "d_buf_8", "role": "ap_vld" }}  ]}

set ArgLastReadFirstWriteLatency {
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
		h {Type I LastRead 0 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "12", "Max" : "12"}
	, {"Name" : "Interval", "Min" : "12", "Max" : "12"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	d_buf_0 { ap_vld {  { d_buf_0 out_data 1 32 }  { d_buf_0_ap_vld out_vld 1 1 } } }
	d_buf_1 { ap_vld {  { d_buf_1 out_data 1 32 }  { d_buf_1_ap_vld out_vld 1 1 } } }
	d_buf_2 { ap_vld {  { d_buf_2 out_data 1 32 }  { d_buf_2_ap_vld out_vld 1 1 } } }
	d_buf_3 { ap_vld {  { d_buf_3 out_data 1 32 }  { d_buf_3_ap_vld out_vld 1 1 } } }
	d_buf_4 { ap_vld {  { d_buf_4 out_data 1 32 }  { d_buf_4_ap_vld out_vld 1 1 } } }
	d_buf_5 { ap_vld {  { d_buf_5 out_data 1 32 }  { d_buf_5_ap_vld out_vld 1 1 } } }
	d_buf_6 { ap_vld {  { d_buf_6 out_data 1 32 }  { d_buf_6_ap_vld out_vld 1 1 } } }
	d_buf_7 { ap_vld {  { d_buf_7 out_data 1 32 }  { d_buf_7_ap_vld out_vld 1 1 } } }
	 { m_axi {  { m_axi_gmem_Wd_0_AWVALID VALID 1 1 }  { m_axi_gmem_Wd_0_AWREADY READY 0 1 }  { m_axi_gmem_Wd_0_AWADDR ADDR 1 64 }  { m_axi_gmem_Wd_0_AWID ID 1 1 }  { m_axi_gmem_Wd_0_AWLEN SIZE 1 32 }  { m_axi_gmem_Wd_0_AWSIZE BURST 1 3 }  { m_axi_gmem_Wd_0_AWBURST LOCK 1 2 }  { m_axi_gmem_Wd_0_AWLOCK CACHE 1 2 }  { m_axi_gmem_Wd_0_AWCACHE PROT 1 4 }  { m_axi_gmem_Wd_0_AWPROT QOS 1 3 }  { m_axi_gmem_Wd_0_AWQOS REGION 1 4 }  { m_axi_gmem_Wd_0_AWREGION USER 1 4 }  { m_axi_gmem_Wd_0_AWUSER DATA 1 1 }  { m_axi_gmem_Wd_0_WVALID VALID 1 1 }  { m_axi_gmem_Wd_0_WREADY READY 0 1 }  { m_axi_gmem_Wd_0_WDATA FIFONUM 1 128 }  { m_axi_gmem_Wd_0_WSTRB STRB 1 16 }  { m_axi_gmem_Wd_0_WLAST LAST 1 1 }  { m_axi_gmem_Wd_0_WID ID 1 1 }  { m_axi_gmem_Wd_0_WUSER DATA 1 1 }  { m_axi_gmem_Wd_0_ARVALID VALID 1 1 }  { m_axi_gmem_Wd_0_ARREADY READY 0 1 }  { m_axi_gmem_Wd_0_ARADDR ADDR 1 64 }  { m_axi_gmem_Wd_0_ARID ID 1 1 }  { m_axi_gmem_Wd_0_ARLEN SIZE 1 32 }  { m_axi_gmem_Wd_0_ARSIZE BURST 1 3 }  { m_axi_gmem_Wd_0_ARBURST LOCK 1 2 }  { m_axi_gmem_Wd_0_ARLOCK CACHE 1 2 }  { m_axi_gmem_Wd_0_ARCACHE PROT 1 4 }  { m_axi_gmem_Wd_0_ARPROT QOS 1 3 }  { m_axi_gmem_Wd_0_ARQOS REGION 1 4 }  { m_axi_gmem_Wd_0_ARREGION USER 1 4 }  { m_axi_gmem_Wd_0_ARUSER DATA 1 1 }  { m_axi_gmem_Wd_0_RVALID VALID 0 1 }  { m_axi_gmem_Wd_0_RREADY READY 1 1 }  { m_axi_gmem_Wd_0_RDATA FIFONUM 0 128 }  { m_axi_gmem_Wd_0_RLAST LAST 0 1 }  { m_axi_gmem_Wd_0_RID ID 0 1 }  { m_axi_gmem_Wd_0_RFIFONUM LEN 0 10 }  { m_axi_gmem_Wd_0_RUSER DATA 0 1 }  { m_axi_gmem_Wd_0_RRESP RESP 0 2 }  { m_axi_gmem_Wd_0_BVALID VALID 0 1 }  { m_axi_gmem_Wd_0_BREADY READY 1 1 }  { m_axi_gmem_Wd_0_BRESP RESP 0 2 }  { m_axi_gmem_Wd_0_BID ID 0 1 }  { m_axi_gmem_Wd_0_BUSER DATA 0 1 } } }
	sext_ln510 { ap_stable {  { sext_ln510 in_data 0 60 } } }
	d_buf_31 { ap_vld {  { d_buf_31 out_data 1 32 }  { d_buf_31_ap_vld out_vld 1 1 } } }
	d_buf_30 { ap_vld {  { d_buf_30 out_data 1 32 }  { d_buf_30_ap_vld out_vld 1 1 } } }
	d_buf_29 { ap_vld {  { d_buf_29 out_data 1 32 }  { d_buf_29_ap_vld out_vld 1 1 } } }
	d_buf_28 { ap_vld {  { d_buf_28 out_data 1 32 }  { d_buf_28_ap_vld out_vld 1 1 } } }
	d_buf_27 { ap_vld {  { d_buf_27 out_data 1 32 }  { d_buf_27_ap_vld out_vld 1 1 } } }
	d_buf_26 { ap_vld {  { d_buf_26 out_data 1 32 }  { d_buf_26_ap_vld out_vld 1 1 } } }
	d_buf_25 { ap_vld {  { d_buf_25 out_data 1 32 }  { d_buf_25_ap_vld out_vld 1 1 } } }
	d_buf_24 { ap_vld {  { d_buf_24 out_data 1 32 }  { d_buf_24_ap_vld out_vld 1 1 } } }
	d_buf_23 { ap_vld {  { d_buf_23 out_data 1 32 }  { d_buf_23_ap_vld out_vld 1 1 } } }
	d_buf_22 { ap_vld {  { d_buf_22 out_data 1 32 }  { d_buf_22_ap_vld out_vld 1 1 } } }
	d_buf_21 { ap_vld {  { d_buf_21 out_data 1 32 }  { d_buf_21_ap_vld out_vld 1 1 } } }
	d_buf_20 { ap_vld {  { d_buf_20 out_data 1 32 }  { d_buf_20_ap_vld out_vld 1 1 } } }
	d_buf_19 { ap_vld {  { d_buf_19 out_data 1 32 }  { d_buf_19_ap_vld out_vld 1 1 } } }
	d_buf_18 { ap_vld {  { d_buf_18 out_data 1 32 }  { d_buf_18_ap_vld out_vld 1 1 } } }
	d_buf_17 { ap_vld {  { d_buf_17 out_data 1 32 }  { d_buf_17_ap_vld out_vld 1 1 } } }
	d_buf_16 { ap_vld {  { d_buf_16 out_data 1 32 }  { d_buf_16_ap_vld out_vld 1 1 } } }
	d_buf_15 { ap_vld {  { d_buf_15 out_data 1 32 }  { d_buf_15_ap_vld out_vld 1 1 } } }
	d_buf_14 { ap_vld {  { d_buf_14 out_data 1 32 }  { d_buf_14_ap_vld out_vld 1 1 } } }
	d_buf_13 { ap_vld {  { d_buf_13 out_data 1 32 }  { d_buf_13_ap_vld out_vld 1 1 } } }
	d_buf_12 { ap_vld {  { d_buf_12 out_data 1 32 }  { d_buf_12_ap_vld out_vld 1 1 } } }
	d_buf_11 { ap_vld {  { d_buf_11 out_data 1 32 }  { d_buf_11_ap_vld out_vld 1 1 } } }
	d_buf_10 { ap_vld {  { d_buf_10 out_data 1 32 }  { d_buf_10_ap_vld out_vld 1 1 } } }
	d_buf_9 { ap_vld {  { d_buf_9 out_data 1 32 }  { d_buf_9_ap_vld out_vld 1 1 } } }
	d_buf_8 { ap_vld {  { d_buf_8 out_data 1 32 }  { d_buf_8_ap_vld out_vld 1 1 } } }
}
