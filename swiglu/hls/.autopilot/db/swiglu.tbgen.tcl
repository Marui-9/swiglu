set moduleName swiglu
set isTopModule 1
set isCombinational 0
set isDatapathOnly 0
set isPipelined 0
set isPipelined_legacy 0
set pipeline_type dataflow
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
set C_modelName {swiglu}
set C_modelType { void 0 }
set ap_memory_interface_dict [dict create]
set C_modelArgList {
	{ gmem_W int 128 regular {axi_master 0}  }
	{ gmem_V int 128 regular {axi_master 0}  }
	{ gmem_Wd int 128 regular {axi_master 0}  }
	{ gmem_Wd2 int 128 regular {axi_master 0}  }
	{ gmem_x int 128 regular {axi_master 0}  }
	{ gmem_out int 32 regular {axi_master 1}  }
	{ W int 64 regular {axi_slave 0}  }
	{ V int 64 regular {axi_slave 0}  }
	{ W_down int 64 regular {axi_slave 0}  }
	{ W_down2 int 64 regular {axi_slave 0}  }
	{ x_batch int 64 regular {axi_slave 0}  }
	{ out_batch int 64 regular {axi_slave 0}  }
	{ down_quant_mode int 32 regular {axi_slave 0}  }
	{ x_scale float 32 regular {axi_slave 0}  }
}
set hasAXIMCache 0
set l_AXIML2Cache [list]
set AXIMCacheInstDict [dict create]
set C_modelArgMapList {[ 
	{ "Name" : "gmem_W", "interface" : "axi_master", "bitwidth" : 128, "direction" : "READONLY", "bitSlice":[ {"cElement": [{"cName": "W","offset": { "type": "dynamic","port_name": "W","bundle": "CTRL"},"direction": "READONLY"}]}]} , 
 	{ "Name" : "gmem_V", "interface" : "axi_master", "bitwidth" : 128, "direction" : "READONLY", "bitSlice":[ {"cElement": [{"cName": "V","offset": { "type": "dynamic","port_name": "V","bundle": "CTRL"},"direction": "READONLY"}]}]} , 
 	{ "Name" : "gmem_Wd", "interface" : "axi_master", "bitwidth" : 128, "direction" : "READONLY", "bitSlice":[ {"cElement": [{"cName": "W_down","offset": { "type": "dynamic","port_name": "W_down","bundle": "CTRL"},"direction": "READONLY"}]}]} , 
 	{ "Name" : "gmem_Wd2", "interface" : "axi_master", "bitwidth" : 128, "direction" : "READONLY", "bitSlice":[ {"cElement": [{"cName": "W_down2","offset": { "type": "dynamic","port_name": "W_down2","bundle": "CTRL"},"direction": "READONLY"}]}]} , 
 	{ "Name" : "gmem_x", "interface" : "axi_master", "bitwidth" : 128, "direction" : "READONLY", "bitSlice":[ {"cElement": [{"cName": "x_batch","offset": { "type": "dynamic","port_name": "x_batch","bundle": "CTRL"},"direction": "READONLY"}]}]} , 
 	{ "Name" : "gmem_out", "interface" : "axi_master", "bitwidth" : 32, "direction" : "WRITEONLY", "bitSlice":[ {"cElement": [{"cName": "out_batch","offset": { "type": "dynamic","port_name": "out_batch","bundle": "CTRL"},"direction": "WRITEONLY"}]}]} , 
 	{ "Name" : "W", "interface" : "axi_slave", "bundle":"CTRL","type":"ap_none","bitwidth" : 64, "direction" : "READONLY", "offset" : {"in":16}, "offset_end" : {"in":27}} , 
 	{ "Name" : "V", "interface" : "axi_slave", "bundle":"CTRL","type":"ap_none","bitwidth" : 64, "direction" : "READONLY", "offset" : {"in":28}, "offset_end" : {"in":39}} , 
 	{ "Name" : "W_down", "interface" : "axi_slave", "bundle":"CTRL","type":"ap_none","bitwidth" : 64, "direction" : "READONLY", "offset" : {"in":40}, "offset_end" : {"in":51}} , 
 	{ "Name" : "W_down2", "interface" : "axi_slave", "bundle":"CTRL","type":"ap_none","bitwidth" : 64, "direction" : "READONLY", "offset" : {"in":52}, "offset_end" : {"in":63}} , 
 	{ "Name" : "x_batch", "interface" : "axi_slave", "bundle":"CTRL","type":"ap_none","bitwidth" : 64, "direction" : "READONLY", "offset" : {"in":64}, "offset_end" : {"in":75}} , 
 	{ "Name" : "out_batch", "interface" : "axi_slave", "bundle":"CTRL","type":"ap_none","bitwidth" : 64, "direction" : "READONLY", "offset" : {"in":76}, "offset_end" : {"in":87}} , 
 	{ "Name" : "down_quant_mode", "interface" : "axi_slave", "bundle":"CTRL","type":"ap_none","bitwidth" : 32, "direction" : "READONLY", "offset" : {"in":88}, "offset_end" : {"in":95}} , 
 	{ "Name" : "x_scale", "interface" : "axi_slave", "bundle":"CTRL","type":"ap_none","bitwidth" : 32, "direction" : "READONLY", "offset" : {"in":96}, "offset_end" : {"in":103}} ]}
# RTL Port declarations: 
set portNum 290
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst_n sc_in sc_logic 1 reset -1 active_low_sync } 
	{ s_axi_CTRL_AWVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_CTRL_AWREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_CTRL_AWADDR sc_in sc_lv 7 signal -1 } 
	{ s_axi_CTRL_WVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_CTRL_WREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_CTRL_WDATA sc_in sc_lv 32 signal -1 } 
	{ s_axi_CTRL_WSTRB sc_in sc_lv 4 signal -1 } 
	{ s_axi_CTRL_ARVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_CTRL_ARREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_CTRL_ARADDR sc_in sc_lv 7 signal -1 } 
	{ s_axi_CTRL_RVALID sc_out sc_logic 1 signal -1 } 
	{ s_axi_CTRL_RREADY sc_in sc_logic 1 signal -1 } 
	{ s_axi_CTRL_RDATA sc_out sc_lv 32 signal -1 } 
	{ s_axi_CTRL_RRESP sc_out sc_lv 2 signal -1 } 
	{ s_axi_CTRL_BVALID sc_out sc_logic 1 signal -1 } 
	{ s_axi_CTRL_BREADY sc_in sc_logic 1 signal -1 } 
	{ s_axi_CTRL_BRESP sc_out sc_lv 2 signal -1 } 
	{ interrupt sc_out sc_logic 1 signal -1 } 
	{ m_axi_gmem_V_AWVALID sc_out sc_logic 1 signal 1 } 
	{ m_axi_gmem_V_AWREADY sc_in sc_logic 1 signal 1 } 
	{ m_axi_gmem_V_AWADDR sc_out sc_lv 64 signal 1 } 
	{ m_axi_gmem_V_AWID sc_out sc_lv 1 signal 1 } 
	{ m_axi_gmem_V_AWLEN sc_out sc_lv 8 signal 1 } 
	{ m_axi_gmem_V_AWSIZE sc_out sc_lv 3 signal 1 } 
	{ m_axi_gmem_V_AWBURST sc_out sc_lv 2 signal 1 } 
	{ m_axi_gmem_V_AWLOCK sc_out sc_lv 2 signal 1 } 
	{ m_axi_gmem_V_AWCACHE sc_out sc_lv 4 signal 1 } 
	{ m_axi_gmem_V_AWPROT sc_out sc_lv 3 signal 1 } 
	{ m_axi_gmem_V_AWQOS sc_out sc_lv 4 signal 1 } 
	{ m_axi_gmem_V_AWREGION sc_out sc_lv 4 signal 1 } 
	{ m_axi_gmem_V_AWUSER sc_out sc_lv 1 signal 1 } 
	{ m_axi_gmem_V_WVALID sc_out sc_logic 1 signal 1 } 
	{ m_axi_gmem_V_WREADY sc_in sc_logic 1 signal 1 } 
	{ m_axi_gmem_V_WDATA sc_out sc_lv 128 signal 1 } 
	{ m_axi_gmem_V_WSTRB sc_out sc_lv 16 signal 1 } 
	{ m_axi_gmem_V_WLAST sc_out sc_logic 1 signal 1 } 
	{ m_axi_gmem_V_WID sc_out sc_lv 1 signal 1 } 
	{ m_axi_gmem_V_WUSER sc_out sc_lv 1 signal 1 } 
	{ m_axi_gmem_V_ARVALID sc_out sc_logic 1 signal 1 } 
	{ m_axi_gmem_V_ARREADY sc_in sc_logic 1 signal 1 } 
	{ m_axi_gmem_V_ARADDR sc_out sc_lv 64 signal 1 } 
	{ m_axi_gmem_V_ARID sc_out sc_lv 1 signal 1 } 
	{ m_axi_gmem_V_ARLEN sc_out sc_lv 8 signal 1 } 
	{ m_axi_gmem_V_ARSIZE sc_out sc_lv 3 signal 1 } 
	{ m_axi_gmem_V_ARBURST sc_out sc_lv 2 signal 1 } 
	{ m_axi_gmem_V_ARLOCK sc_out sc_lv 2 signal 1 } 
	{ m_axi_gmem_V_ARCACHE sc_out sc_lv 4 signal 1 } 
	{ m_axi_gmem_V_ARPROT sc_out sc_lv 3 signal 1 } 
	{ m_axi_gmem_V_ARQOS sc_out sc_lv 4 signal 1 } 
	{ m_axi_gmem_V_ARREGION sc_out sc_lv 4 signal 1 } 
	{ m_axi_gmem_V_ARUSER sc_out sc_lv 1 signal 1 } 
	{ m_axi_gmem_V_RVALID sc_in sc_logic 1 signal 1 } 
	{ m_axi_gmem_V_RREADY sc_out sc_logic 1 signal 1 } 
	{ m_axi_gmem_V_RDATA sc_in sc_lv 128 signal 1 } 
	{ m_axi_gmem_V_RLAST sc_in sc_logic 1 signal 1 } 
	{ m_axi_gmem_V_RID sc_in sc_lv 1 signal 1 } 
	{ m_axi_gmem_V_RUSER sc_in sc_lv 1 signal 1 } 
	{ m_axi_gmem_V_RRESP sc_in sc_lv 2 signal 1 } 
	{ m_axi_gmem_V_BVALID sc_in sc_logic 1 signal 1 } 
	{ m_axi_gmem_V_BREADY sc_out sc_logic 1 signal 1 } 
	{ m_axi_gmem_V_BRESP sc_in sc_lv 2 signal 1 } 
	{ m_axi_gmem_V_BID sc_in sc_lv 1 signal 1 } 
	{ m_axi_gmem_V_BUSER sc_in sc_lv 1 signal 1 } 
	{ m_axi_gmem_W_AWVALID sc_out sc_logic 1 signal 0 } 
	{ m_axi_gmem_W_AWREADY sc_in sc_logic 1 signal 0 } 
	{ m_axi_gmem_W_AWADDR sc_out sc_lv 64 signal 0 } 
	{ m_axi_gmem_W_AWID sc_out sc_lv 1 signal 0 } 
	{ m_axi_gmem_W_AWLEN sc_out sc_lv 8 signal 0 } 
	{ m_axi_gmem_W_AWSIZE sc_out sc_lv 3 signal 0 } 
	{ m_axi_gmem_W_AWBURST sc_out sc_lv 2 signal 0 } 
	{ m_axi_gmem_W_AWLOCK sc_out sc_lv 2 signal 0 } 
	{ m_axi_gmem_W_AWCACHE sc_out sc_lv 4 signal 0 } 
	{ m_axi_gmem_W_AWPROT sc_out sc_lv 3 signal 0 } 
	{ m_axi_gmem_W_AWQOS sc_out sc_lv 4 signal 0 } 
	{ m_axi_gmem_W_AWREGION sc_out sc_lv 4 signal 0 } 
	{ m_axi_gmem_W_AWUSER sc_out sc_lv 1 signal 0 } 
	{ m_axi_gmem_W_WVALID sc_out sc_logic 1 signal 0 } 
	{ m_axi_gmem_W_WREADY sc_in sc_logic 1 signal 0 } 
	{ m_axi_gmem_W_WDATA sc_out sc_lv 128 signal 0 } 
	{ m_axi_gmem_W_WSTRB sc_out sc_lv 16 signal 0 } 
	{ m_axi_gmem_W_WLAST sc_out sc_logic 1 signal 0 } 
	{ m_axi_gmem_W_WID sc_out sc_lv 1 signal 0 } 
	{ m_axi_gmem_W_WUSER sc_out sc_lv 1 signal 0 } 
	{ m_axi_gmem_W_ARVALID sc_out sc_logic 1 signal 0 } 
	{ m_axi_gmem_W_ARREADY sc_in sc_logic 1 signal 0 } 
	{ m_axi_gmem_W_ARADDR sc_out sc_lv 64 signal 0 } 
	{ m_axi_gmem_W_ARID sc_out sc_lv 1 signal 0 } 
	{ m_axi_gmem_W_ARLEN sc_out sc_lv 8 signal 0 } 
	{ m_axi_gmem_W_ARSIZE sc_out sc_lv 3 signal 0 } 
	{ m_axi_gmem_W_ARBURST sc_out sc_lv 2 signal 0 } 
	{ m_axi_gmem_W_ARLOCK sc_out sc_lv 2 signal 0 } 
	{ m_axi_gmem_W_ARCACHE sc_out sc_lv 4 signal 0 } 
	{ m_axi_gmem_W_ARPROT sc_out sc_lv 3 signal 0 } 
	{ m_axi_gmem_W_ARQOS sc_out sc_lv 4 signal 0 } 
	{ m_axi_gmem_W_ARREGION sc_out sc_lv 4 signal 0 } 
	{ m_axi_gmem_W_ARUSER sc_out sc_lv 1 signal 0 } 
	{ m_axi_gmem_W_RVALID sc_in sc_logic 1 signal 0 } 
	{ m_axi_gmem_W_RREADY sc_out sc_logic 1 signal 0 } 
	{ m_axi_gmem_W_RDATA sc_in sc_lv 128 signal 0 } 
	{ m_axi_gmem_W_RLAST sc_in sc_logic 1 signal 0 } 
	{ m_axi_gmem_W_RID sc_in sc_lv 1 signal 0 } 
	{ m_axi_gmem_W_RUSER sc_in sc_lv 1 signal 0 } 
	{ m_axi_gmem_W_RRESP sc_in sc_lv 2 signal 0 } 
	{ m_axi_gmem_W_BVALID sc_in sc_logic 1 signal 0 } 
	{ m_axi_gmem_W_BREADY sc_out sc_logic 1 signal 0 } 
	{ m_axi_gmem_W_BRESP sc_in sc_lv 2 signal 0 } 
	{ m_axi_gmem_W_BID sc_in sc_lv 1 signal 0 } 
	{ m_axi_gmem_W_BUSER sc_in sc_lv 1 signal 0 } 
	{ m_axi_gmem_Wd_AWVALID sc_out sc_logic 1 signal 2 } 
	{ m_axi_gmem_Wd_AWREADY sc_in sc_logic 1 signal 2 } 
	{ m_axi_gmem_Wd_AWADDR sc_out sc_lv 64 signal 2 } 
	{ m_axi_gmem_Wd_AWID sc_out sc_lv 1 signal 2 } 
	{ m_axi_gmem_Wd_AWLEN sc_out sc_lv 8 signal 2 } 
	{ m_axi_gmem_Wd_AWSIZE sc_out sc_lv 3 signal 2 } 
	{ m_axi_gmem_Wd_AWBURST sc_out sc_lv 2 signal 2 } 
	{ m_axi_gmem_Wd_AWLOCK sc_out sc_lv 2 signal 2 } 
	{ m_axi_gmem_Wd_AWCACHE sc_out sc_lv 4 signal 2 } 
	{ m_axi_gmem_Wd_AWPROT sc_out sc_lv 3 signal 2 } 
	{ m_axi_gmem_Wd_AWQOS sc_out sc_lv 4 signal 2 } 
	{ m_axi_gmem_Wd_AWREGION sc_out sc_lv 4 signal 2 } 
	{ m_axi_gmem_Wd_AWUSER sc_out sc_lv 1 signal 2 } 
	{ m_axi_gmem_Wd_WVALID sc_out sc_logic 1 signal 2 } 
	{ m_axi_gmem_Wd_WREADY sc_in sc_logic 1 signal 2 } 
	{ m_axi_gmem_Wd_WDATA sc_out sc_lv 128 signal 2 } 
	{ m_axi_gmem_Wd_WSTRB sc_out sc_lv 16 signal 2 } 
	{ m_axi_gmem_Wd_WLAST sc_out sc_logic 1 signal 2 } 
	{ m_axi_gmem_Wd_WID sc_out sc_lv 1 signal 2 } 
	{ m_axi_gmem_Wd_WUSER sc_out sc_lv 1 signal 2 } 
	{ m_axi_gmem_Wd_ARVALID sc_out sc_logic 1 signal 2 } 
	{ m_axi_gmem_Wd_ARREADY sc_in sc_logic 1 signal 2 } 
	{ m_axi_gmem_Wd_ARADDR sc_out sc_lv 64 signal 2 } 
	{ m_axi_gmem_Wd_ARID sc_out sc_lv 1 signal 2 } 
	{ m_axi_gmem_Wd_ARLEN sc_out sc_lv 8 signal 2 } 
	{ m_axi_gmem_Wd_ARSIZE sc_out sc_lv 3 signal 2 } 
	{ m_axi_gmem_Wd_ARBURST sc_out sc_lv 2 signal 2 } 
	{ m_axi_gmem_Wd_ARLOCK sc_out sc_lv 2 signal 2 } 
	{ m_axi_gmem_Wd_ARCACHE sc_out sc_lv 4 signal 2 } 
	{ m_axi_gmem_Wd_ARPROT sc_out sc_lv 3 signal 2 } 
	{ m_axi_gmem_Wd_ARQOS sc_out sc_lv 4 signal 2 } 
	{ m_axi_gmem_Wd_ARREGION sc_out sc_lv 4 signal 2 } 
	{ m_axi_gmem_Wd_ARUSER sc_out sc_lv 1 signal 2 } 
	{ m_axi_gmem_Wd_RVALID sc_in sc_logic 1 signal 2 } 
	{ m_axi_gmem_Wd_RREADY sc_out sc_logic 1 signal 2 } 
	{ m_axi_gmem_Wd_RDATA sc_in sc_lv 128 signal 2 } 
	{ m_axi_gmem_Wd_RLAST sc_in sc_logic 1 signal 2 } 
	{ m_axi_gmem_Wd_RID sc_in sc_lv 1 signal 2 } 
	{ m_axi_gmem_Wd_RUSER sc_in sc_lv 1 signal 2 } 
	{ m_axi_gmem_Wd_RRESP sc_in sc_lv 2 signal 2 } 
	{ m_axi_gmem_Wd_BVALID sc_in sc_logic 1 signal 2 } 
	{ m_axi_gmem_Wd_BREADY sc_out sc_logic 1 signal 2 } 
	{ m_axi_gmem_Wd_BRESP sc_in sc_lv 2 signal 2 } 
	{ m_axi_gmem_Wd_BID sc_in sc_lv 1 signal 2 } 
	{ m_axi_gmem_Wd_BUSER sc_in sc_lv 1 signal 2 } 
	{ m_axi_gmem_Wd2_AWVALID sc_out sc_logic 1 signal 3 } 
	{ m_axi_gmem_Wd2_AWREADY sc_in sc_logic 1 signal 3 } 
	{ m_axi_gmem_Wd2_AWADDR sc_out sc_lv 64 signal 3 } 
	{ m_axi_gmem_Wd2_AWID sc_out sc_lv 1 signal 3 } 
	{ m_axi_gmem_Wd2_AWLEN sc_out sc_lv 8 signal 3 } 
	{ m_axi_gmem_Wd2_AWSIZE sc_out sc_lv 3 signal 3 } 
	{ m_axi_gmem_Wd2_AWBURST sc_out sc_lv 2 signal 3 } 
	{ m_axi_gmem_Wd2_AWLOCK sc_out sc_lv 2 signal 3 } 
	{ m_axi_gmem_Wd2_AWCACHE sc_out sc_lv 4 signal 3 } 
	{ m_axi_gmem_Wd2_AWPROT sc_out sc_lv 3 signal 3 } 
	{ m_axi_gmem_Wd2_AWQOS sc_out sc_lv 4 signal 3 } 
	{ m_axi_gmem_Wd2_AWREGION sc_out sc_lv 4 signal 3 } 
	{ m_axi_gmem_Wd2_AWUSER sc_out sc_lv 1 signal 3 } 
	{ m_axi_gmem_Wd2_WVALID sc_out sc_logic 1 signal 3 } 
	{ m_axi_gmem_Wd2_WREADY sc_in sc_logic 1 signal 3 } 
	{ m_axi_gmem_Wd2_WDATA sc_out sc_lv 128 signal 3 } 
	{ m_axi_gmem_Wd2_WSTRB sc_out sc_lv 16 signal 3 } 
	{ m_axi_gmem_Wd2_WLAST sc_out sc_logic 1 signal 3 } 
	{ m_axi_gmem_Wd2_WID sc_out sc_lv 1 signal 3 } 
	{ m_axi_gmem_Wd2_WUSER sc_out sc_lv 1 signal 3 } 
	{ m_axi_gmem_Wd2_ARVALID sc_out sc_logic 1 signal 3 } 
	{ m_axi_gmem_Wd2_ARREADY sc_in sc_logic 1 signal 3 } 
	{ m_axi_gmem_Wd2_ARADDR sc_out sc_lv 64 signal 3 } 
	{ m_axi_gmem_Wd2_ARID sc_out sc_lv 1 signal 3 } 
	{ m_axi_gmem_Wd2_ARLEN sc_out sc_lv 8 signal 3 } 
	{ m_axi_gmem_Wd2_ARSIZE sc_out sc_lv 3 signal 3 } 
	{ m_axi_gmem_Wd2_ARBURST sc_out sc_lv 2 signal 3 } 
	{ m_axi_gmem_Wd2_ARLOCK sc_out sc_lv 2 signal 3 } 
	{ m_axi_gmem_Wd2_ARCACHE sc_out sc_lv 4 signal 3 } 
	{ m_axi_gmem_Wd2_ARPROT sc_out sc_lv 3 signal 3 } 
	{ m_axi_gmem_Wd2_ARQOS sc_out sc_lv 4 signal 3 } 
	{ m_axi_gmem_Wd2_ARREGION sc_out sc_lv 4 signal 3 } 
	{ m_axi_gmem_Wd2_ARUSER sc_out sc_lv 1 signal 3 } 
	{ m_axi_gmem_Wd2_RVALID sc_in sc_logic 1 signal 3 } 
	{ m_axi_gmem_Wd2_RREADY sc_out sc_logic 1 signal 3 } 
	{ m_axi_gmem_Wd2_RDATA sc_in sc_lv 128 signal 3 } 
	{ m_axi_gmem_Wd2_RLAST sc_in sc_logic 1 signal 3 } 
	{ m_axi_gmem_Wd2_RID sc_in sc_lv 1 signal 3 } 
	{ m_axi_gmem_Wd2_RUSER sc_in sc_lv 1 signal 3 } 
	{ m_axi_gmem_Wd2_RRESP sc_in sc_lv 2 signal 3 } 
	{ m_axi_gmem_Wd2_BVALID sc_in sc_logic 1 signal 3 } 
	{ m_axi_gmem_Wd2_BREADY sc_out sc_logic 1 signal 3 } 
	{ m_axi_gmem_Wd2_BRESP sc_in sc_lv 2 signal 3 } 
	{ m_axi_gmem_Wd2_BID sc_in sc_lv 1 signal 3 } 
	{ m_axi_gmem_Wd2_BUSER sc_in sc_lv 1 signal 3 } 
	{ m_axi_gmem_out_AWVALID sc_out sc_logic 1 signal 5 } 
	{ m_axi_gmem_out_AWREADY sc_in sc_logic 1 signal 5 } 
	{ m_axi_gmem_out_AWADDR sc_out sc_lv 64 signal 5 } 
	{ m_axi_gmem_out_AWID sc_out sc_lv 1 signal 5 } 
	{ m_axi_gmem_out_AWLEN sc_out sc_lv 8 signal 5 } 
	{ m_axi_gmem_out_AWSIZE sc_out sc_lv 3 signal 5 } 
	{ m_axi_gmem_out_AWBURST sc_out sc_lv 2 signal 5 } 
	{ m_axi_gmem_out_AWLOCK sc_out sc_lv 2 signal 5 } 
	{ m_axi_gmem_out_AWCACHE sc_out sc_lv 4 signal 5 } 
	{ m_axi_gmem_out_AWPROT sc_out sc_lv 3 signal 5 } 
	{ m_axi_gmem_out_AWQOS sc_out sc_lv 4 signal 5 } 
	{ m_axi_gmem_out_AWREGION sc_out sc_lv 4 signal 5 } 
	{ m_axi_gmem_out_AWUSER sc_out sc_lv 1 signal 5 } 
	{ m_axi_gmem_out_WVALID sc_out sc_logic 1 signal 5 } 
	{ m_axi_gmem_out_WREADY sc_in sc_logic 1 signal 5 } 
	{ m_axi_gmem_out_WDATA sc_out sc_lv 32 signal 5 } 
	{ m_axi_gmem_out_WSTRB sc_out sc_lv 4 signal 5 } 
	{ m_axi_gmem_out_WLAST sc_out sc_logic 1 signal 5 } 
	{ m_axi_gmem_out_WID sc_out sc_lv 1 signal 5 } 
	{ m_axi_gmem_out_WUSER sc_out sc_lv 1 signal 5 } 
	{ m_axi_gmem_out_ARVALID sc_out sc_logic 1 signal 5 } 
	{ m_axi_gmem_out_ARREADY sc_in sc_logic 1 signal 5 } 
	{ m_axi_gmem_out_ARADDR sc_out sc_lv 64 signal 5 } 
	{ m_axi_gmem_out_ARID sc_out sc_lv 1 signal 5 } 
	{ m_axi_gmem_out_ARLEN sc_out sc_lv 8 signal 5 } 
	{ m_axi_gmem_out_ARSIZE sc_out sc_lv 3 signal 5 } 
	{ m_axi_gmem_out_ARBURST sc_out sc_lv 2 signal 5 } 
	{ m_axi_gmem_out_ARLOCK sc_out sc_lv 2 signal 5 } 
	{ m_axi_gmem_out_ARCACHE sc_out sc_lv 4 signal 5 } 
	{ m_axi_gmem_out_ARPROT sc_out sc_lv 3 signal 5 } 
	{ m_axi_gmem_out_ARQOS sc_out sc_lv 4 signal 5 } 
	{ m_axi_gmem_out_ARREGION sc_out sc_lv 4 signal 5 } 
	{ m_axi_gmem_out_ARUSER sc_out sc_lv 1 signal 5 } 
	{ m_axi_gmem_out_RVALID sc_in sc_logic 1 signal 5 } 
	{ m_axi_gmem_out_RREADY sc_out sc_logic 1 signal 5 } 
	{ m_axi_gmem_out_RDATA sc_in sc_lv 32 signal 5 } 
	{ m_axi_gmem_out_RLAST sc_in sc_logic 1 signal 5 } 
	{ m_axi_gmem_out_RID sc_in sc_lv 1 signal 5 } 
	{ m_axi_gmem_out_RUSER sc_in sc_lv 1 signal 5 } 
	{ m_axi_gmem_out_RRESP sc_in sc_lv 2 signal 5 } 
	{ m_axi_gmem_out_BVALID sc_in sc_logic 1 signal 5 } 
	{ m_axi_gmem_out_BREADY sc_out sc_logic 1 signal 5 } 
	{ m_axi_gmem_out_BRESP sc_in sc_lv 2 signal 5 } 
	{ m_axi_gmem_out_BID sc_in sc_lv 1 signal 5 } 
	{ m_axi_gmem_out_BUSER sc_in sc_lv 1 signal 5 } 
	{ m_axi_gmem_x_AWVALID sc_out sc_logic 1 signal 4 } 
	{ m_axi_gmem_x_AWREADY sc_in sc_logic 1 signal 4 } 
	{ m_axi_gmem_x_AWADDR sc_out sc_lv 64 signal 4 } 
	{ m_axi_gmem_x_AWID sc_out sc_lv 1 signal 4 } 
	{ m_axi_gmem_x_AWLEN sc_out sc_lv 8 signal 4 } 
	{ m_axi_gmem_x_AWSIZE sc_out sc_lv 3 signal 4 } 
	{ m_axi_gmem_x_AWBURST sc_out sc_lv 2 signal 4 } 
	{ m_axi_gmem_x_AWLOCK sc_out sc_lv 2 signal 4 } 
	{ m_axi_gmem_x_AWCACHE sc_out sc_lv 4 signal 4 } 
	{ m_axi_gmem_x_AWPROT sc_out sc_lv 3 signal 4 } 
	{ m_axi_gmem_x_AWQOS sc_out sc_lv 4 signal 4 } 
	{ m_axi_gmem_x_AWREGION sc_out sc_lv 4 signal 4 } 
	{ m_axi_gmem_x_AWUSER sc_out sc_lv 1 signal 4 } 
	{ m_axi_gmem_x_WVALID sc_out sc_logic 1 signal 4 } 
	{ m_axi_gmem_x_WREADY sc_in sc_logic 1 signal 4 } 
	{ m_axi_gmem_x_WDATA sc_out sc_lv 128 signal 4 } 
	{ m_axi_gmem_x_WSTRB sc_out sc_lv 16 signal 4 } 
	{ m_axi_gmem_x_WLAST sc_out sc_logic 1 signal 4 } 
	{ m_axi_gmem_x_WID sc_out sc_lv 1 signal 4 } 
	{ m_axi_gmem_x_WUSER sc_out sc_lv 1 signal 4 } 
	{ m_axi_gmem_x_ARVALID sc_out sc_logic 1 signal 4 } 
	{ m_axi_gmem_x_ARREADY sc_in sc_logic 1 signal 4 } 
	{ m_axi_gmem_x_ARADDR sc_out sc_lv 64 signal 4 } 
	{ m_axi_gmem_x_ARID sc_out sc_lv 1 signal 4 } 
	{ m_axi_gmem_x_ARLEN sc_out sc_lv 8 signal 4 } 
	{ m_axi_gmem_x_ARSIZE sc_out sc_lv 3 signal 4 } 
	{ m_axi_gmem_x_ARBURST sc_out sc_lv 2 signal 4 } 
	{ m_axi_gmem_x_ARLOCK sc_out sc_lv 2 signal 4 } 
	{ m_axi_gmem_x_ARCACHE sc_out sc_lv 4 signal 4 } 
	{ m_axi_gmem_x_ARPROT sc_out sc_lv 3 signal 4 } 
	{ m_axi_gmem_x_ARQOS sc_out sc_lv 4 signal 4 } 
	{ m_axi_gmem_x_ARREGION sc_out sc_lv 4 signal 4 } 
	{ m_axi_gmem_x_ARUSER sc_out sc_lv 1 signal 4 } 
	{ m_axi_gmem_x_RVALID sc_in sc_logic 1 signal 4 } 
	{ m_axi_gmem_x_RREADY sc_out sc_logic 1 signal 4 } 
	{ m_axi_gmem_x_RDATA sc_in sc_lv 128 signal 4 } 
	{ m_axi_gmem_x_RLAST sc_in sc_logic 1 signal 4 } 
	{ m_axi_gmem_x_RID sc_in sc_lv 1 signal 4 } 
	{ m_axi_gmem_x_RUSER sc_in sc_lv 1 signal 4 } 
	{ m_axi_gmem_x_RRESP sc_in sc_lv 2 signal 4 } 
	{ m_axi_gmem_x_BVALID sc_in sc_logic 1 signal 4 } 
	{ m_axi_gmem_x_BREADY sc_out sc_logic 1 signal 4 } 
	{ m_axi_gmem_x_BRESP sc_in sc_lv 2 signal 4 } 
	{ m_axi_gmem_x_BID sc_in sc_lv 1 signal 4 } 
	{ m_axi_gmem_x_BUSER sc_in sc_lv 1 signal 4 } 
}
set NewPortList {[ 
	{ "name": "s_axi_CTRL_AWADDR", "direction": "in", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "CTRL", "role": "AWADDR" },"address":[{"name":"swiglu","role":"start","value":"0","valid_bit":"0"},{"name":"swiglu","role":"continue","value":"0","valid_bit":"4"},{"name":"swiglu","role":"auto_start","value":"0","valid_bit":"7"},{"name":"W","role":"data","value":"16"},{"name":"V","role":"data","value":"28"},{"name":"W_down","role":"data","value":"40"},{"name":"W_down2","role":"data","value":"52"},{"name":"x_batch","role":"data","value":"64"},{"name":"out_batch","role":"data","value":"76"},{"name":"down_quant_mode","role":"data","value":"88"},{"name":"x_scale","role":"data","value":"96"}] },
	{ "name": "s_axi_CTRL_AWVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "CTRL", "role": "AWVALID" } },
	{ "name": "s_axi_CTRL_AWREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "CTRL", "role": "AWREADY" } },
	{ "name": "s_axi_CTRL_WVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "CTRL", "role": "WVALID" } },
	{ "name": "s_axi_CTRL_WREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "CTRL", "role": "WREADY" } },
	{ "name": "s_axi_CTRL_WDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "CTRL", "role": "WDATA" } },
	{ "name": "s_axi_CTRL_WSTRB", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "CTRL", "role": "WSTRB" } },
	{ "name": "s_axi_CTRL_ARADDR", "direction": "in", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "CTRL", "role": "ARADDR" },"address":[{"name":"swiglu","role":"start","value":"0","valid_bit":"0"},{"name":"swiglu","role":"done","value":"0","valid_bit":"1"},{"name":"swiglu","role":"idle","value":"0","valid_bit":"2"},{"name":"swiglu","role":"ready","value":"0","valid_bit":"3"},{"name":"swiglu","role":"auto_start","value":"0","valid_bit":"7"}] },
	{ "name": "s_axi_CTRL_ARVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "CTRL", "role": "ARVALID" } },
	{ "name": "s_axi_CTRL_ARREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "CTRL", "role": "ARREADY" } },
	{ "name": "s_axi_CTRL_RVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "CTRL", "role": "RVALID" } },
	{ "name": "s_axi_CTRL_RREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "CTRL", "role": "RREADY" } },
	{ "name": "s_axi_CTRL_RDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "CTRL", "role": "RDATA" } },
	{ "name": "s_axi_CTRL_RRESP", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "CTRL", "role": "RRESP" } },
	{ "name": "s_axi_CTRL_BVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "CTRL", "role": "BVALID" } },
	{ "name": "s_axi_CTRL_BREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "CTRL", "role": "BREADY" } },
	{ "name": "s_axi_CTRL_BRESP", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "CTRL", "role": "BRESP" } },
	{ "name": "interrupt", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "CTRL", "role": "interrupt" } }, 
 	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst_n", "role": "default" }} , 
 	{ "name": "m_axi_gmem_V_AWVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_V", "role": "AWVALID" }} , 
 	{ "name": "m_axi_gmem_V_AWREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_V", "role": "AWREADY" }} , 
 	{ "name": "m_axi_gmem_V_AWADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "gmem_V", "role": "AWADDR" }} , 
 	{ "name": "m_axi_gmem_V_AWID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_V", "role": "AWID" }} , 
 	{ "name": "m_axi_gmem_V_AWLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "gmem_V", "role": "AWLEN" }} , 
 	{ "name": "m_axi_gmem_V_AWSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "gmem_V", "role": "AWSIZE" }} , 
 	{ "name": "m_axi_gmem_V_AWBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem_V", "role": "AWBURST" }} , 
 	{ "name": "m_axi_gmem_V_AWLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem_V", "role": "AWLOCK" }} , 
 	{ "name": "m_axi_gmem_V_AWCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem_V", "role": "AWCACHE" }} , 
 	{ "name": "m_axi_gmem_V_AWPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "gmem_V", "role": "AWPROT" }} , 
 	{ "name": "m_axi_gmem_V_AWQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem_V", "role": "AWQOS" }} , 
 	{ "name": "m_axi_gmem_V_AWREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem_V", "role": "AWREGION" }} , 
 	{ "name": "m_axi_gmem_V_AWUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_V", "role": "AWUSER" }} , 
 	{ "name": "m_axi_gmem_V_WVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_V", "role": "WVALID" }} , 
 	{ "name": "m_axi_gmem_V_WREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_V", "role": "WREADY" }} , 
 	{ "name": "m_axi_gmem_V_WDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "gmem_V", "role": "WDATA" }} , 
 	{ "name": "m_axi_gmem_V_WSTRB", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "gmem_V", "role": "WSTRB" }} , 
 	{ "name": "m_axi_gmem_V_WLAST", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_V", "role": "WLAST" }} , 
 	{ "name": "m_axi_gmem_V_WID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_V", "role": "WID" }} , 
 	{ "name": "m_axi_gmem_V_WUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_V", "role": "WUSER" }} , 
 	{ "name": "m_axi_gmem_V_ARVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_V", "role": "ARVALID" }} , 
 	{ "name": "m_axi_gmem_V_ARREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_V", "role": "ARREADY" }} , 
 	{ "name": "m_axi_gmem_V_ARADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "gmem_V", "role": "ARADDR" }} , 
 	{ "name": "m_axi_gmem_V_ARID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_V", "role": "ARID" }} , 
 	{ "name": "m_axi_gmem_V_ARLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "gmem_V", "role": "ARLEN" }} , 
 	{ "name": "m_axi_gmem_V_ARSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "gmem_V", "role": "ARSIZE" }} , 
 	{ "name": "m_axi_gmem_V_ARBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem_V", "role": "ARBURST" }} , 
 	{ "name": "m_axi_gmem_V_ARLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem_V", "role": "ARLOCK" }} , 
 	{ "name": "m_axi_gmem_V_ARCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem_V", "role": "ARCACHE" }} , 
 	{ "name": "m_axi_gmem_V_ARPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "gmem_V", "role": "ARPROT" }} , 
 	{ "name": "m_axi_gmem_V_ARQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem_V", "role": "ARQOS" }} , 
 	{ "name": "m_axi_gmem_V_ARREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem_V", "role": "ARREGION" }} , 
 	{ "name": "m_axi_gmem_V_ARUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_V", "role": "ARUSER" }} , 
 	{ "name": "m_axi_gmem_V_RVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_V", "role": "RVALID" }} , 
 	{ "name": "m_axi_gmem_V_RREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_V", "role": "RREADY" }} , 
 	{ "name": "m_axi_gmem_V_RDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "gmem_V", "role": "RDATA" }} , 
 	{ "name": "m_axi_gmem_V_RLAST", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_V", "role": "RLAST" }} , 
 	{ "name": "m_axi_gmem_V_RID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_V", "role": "RID" }} , 
 	{ "name": "m_axi_gmem_V_RUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_V", "role": "RUSER" }} , 
 	{ "name": "m_axi_gmem_V_RRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem_V", "role": "RRESP" }} , 
 	{ "name": "m_axi_gmem_V_BVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_V", "role": "BVALID" }} , 
 	{ "name": "m_axi_gmem_V_BREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_V", "role": "BREADY" }} , 
 	{ "name": "m_axi_gmem_V_BRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem_V", "role": "BRESP" }} , 
 	{ "name": "m_axi_gmem_V_BID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_V", "role": "BID" }} , 
 	{ "name": "m_axi_gmem_V_BUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_V", "role": "BUSER" }} , 
 	{ "name": "m_axi_gmem_W_AWVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_W", "role": "AWVALID" }} , 
 	{ "name": "m_axi_gmem_W_AWREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_W", "role": "AWREADY" }} , 
 	{ "name": "m_axi_gmem_W_AWADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "gmem_W", "role": "AWADDR" }} , 
 	{ "name": "m_axi_gmem_W_AWID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_W", "role": "AWID" }} , 
 	{ "name": "m_axi_gmem_W_AWLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "gmem_W", "role": "AWLEN" }} , 
 	{ "name": "m_axi_gmem_W_AWSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "gmem_W", "role": "AWSIZE" }} , 
 	{ "name": "m_axi_gmem_W_AWBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem_W", "role": "AWBURST" }} , 
 	{ "name": "m_axi_gmem_W_AWLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem_W", "role": "AWLOCK" }} , 
 	{ "name": "m_axi_gmem_W_AWCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem_W", "role": "AWCACHE" }} , 
 	{ "name": "m_axi_gmem_W_AWPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "gmem_W", "role": "AWPROT" }} , 
 	{ "name": "m_axi_gmem_W_AWQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem_W", "role": "AWQOS" }} , 
 	{ "name": "m_axi_gmem_W_AWREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem_W", "role": "AWREGION" }} , 
 	{ "name": "m_axi_gmem_W_AWUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_W", "role": "AWUSER" }} , 
 	{ "name": "m_axi_gmem_W_WVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_W", "role": "WVALID" }} , 
 	{ "name": "m_axi_gmem_W_WREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_W", "role": "WREADY" }} , 
 	{ "name": "m_axi_gmem_W_WDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "gmem_W", "role": "WDATA" }} , 
 	{ "name": "m_axi_gmem_W_WSTRB", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "gmem_W", "role": "WSTRB" }} , 
 	{ "name": "m_axi_gmem_W_WLAST", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_W", "role": "WLAST" }} , 
 	{ "name": "m_axi_gmem_W_WID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_W", "role": "WID" }} , 
 	{ "name": "m_axi_gmem_W_WUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_W", "role": "WUSER" }} , 
 	{ "name": "m_axi_gmem_W_ARVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_W", "role": "ARVALID" }} , 
 	{ "name": "m_axi_gmem_W_ARREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_W", "role": "ARREADY" }} , 
 	{ "name": "m_axi_gmem_W_ARADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "gmem_W", "role": "ARADDR" }} , 
 	{ "name": "m_axi_gmem_W_ARID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_W", "role": "ARID" }} , 
 	{ "name": "m_axi_gmem_W_ARLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "gmem_W", "role": "ARLEN" }} , 
 	{ "name": "m_axi_gmem_W_ARSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "gmem_W", "role": "ARSIZE" }} , 
 	{ "name": "m_axi_gmem_W_ARBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem_W", "role": "ARBURST" }} , 
 	{ "name": "m_axi_gmem_W_ARLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem_W", "role": "ARLOCK" }} , 
 	{ "name": "m_axi_gmem_W_ARCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem_W", "role": "ARCACHE" }} , 
 	{ "name": "m_axi_gmem_W_ARPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "gmem_W", "role": "ARPROT" }} , 
 	{ "name": "m_axi_gmem_W_ARQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem_W", "role": "ARQOS" }} , 
 	{ "name": "m_axi_gmem_W_ARREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem_W", "role": "ARREGION" }} , 
 	{ "name": "m_axi_gmem_W_ARUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_W", "role": "ARUSER" }} , 
 	{ "name": "m_axi_gmem_W_RVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_W", "role": "RVALID" }} , 
 	{ "name": "m_axi_gmem_W_RREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_W", "role": "RREADY" }} , 
 	{ "name": "m_axi_gmem_W_RDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "gmem_W", "role": "RDATA" }} , 
 	{ "name": "m_axi_gmem_W_RLAST", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_W", "role": "RLAST" }} , 
 	{ "name": "m_axi_gmem_W_RID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_W", "role": "RID" }} , 
 	{ "name": "m_axi_gmem_W_RUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_W", "role": "RUSER" }} , 
 	{ "name": "m_axi_gmem_W_RRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem_W", "role": "RRESP" }} , 
 	{ "name": "m_axi_gmem_W_BVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_W", "role": "BVALID" }} , 
 	{ "name": "m_axi_gmem_W_BREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_W", "role": "BREADY" }} , 
 	{ "name": "m_axi_gmem_W_BRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem_W", "role": "BRESP" }} , 
 	{ "name": "m_axi_gmem_W_BID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_W", "role": "BID" }} , 
 	{ "name": "m_axi_gmem_W_BUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_W", "role": "BUSER" }} , 
 	{ "name": "m_axi_gmem_Wd_AWVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_Wd", "role": "AWVALID" }} , 
 	{ "name": "m_axi_gmem_Wd_AWREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_Wd", "role": "AWREADY" }} , 
 	{ "name": "m_axi_gmem_Wd_AWADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "gmem_Wd", "role": "AWADDR" }} , 
 	{ "name": "m_axi_gmem_Wd_AWID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_Wd", "role": "AWID" }} , 
 	{ "name": "m_axi_gmem_Wd_AWLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "gmem_Wd", "role": "AWLEN" }} , 
 	{ "name": "m_axi_gmem_Wd_AWSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "gmem_Wd", "role": "AWSIZE" }} , 
 	{ "name": "m_axi_gmem_Wd_AWBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem_Wd", "role": "AWBURST" }} , 
 	{ "name": "m_axi_gmem_Wd_AWLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem_Wd", "role": "AWLOCK" }} , 
 	{ "name": "m_axi_gmem_Wd_AWCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem_Wd", "role": "AWCACHE" }} , 
 	{ "name": "m_axi_gmem_Wd_AWPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "gmem_Wd", "role": "AWPROT" }} , 
 	{ "name": "m_axi_gmem_Wd_AWQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem_Wd", "role": "AWQOS" }} , 
 	{ "name": "m_axi_gmem_Wd_AWREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem_Wd", "role": "AWREGION" }} , 
 	{ "name": "m_axi_gmem_Wd_AWUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_Wd", "role": "AWUSER" }} , 
 	{ "name": "m_axi_gmem_Wd_WVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_Wd", "role": "WVALID" }} , 
 	{ "name": "m_axi_gmem_Wd_WREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_Wd", "role": "WREADY" }} , 
 	{ "name": "m_axi_gmem_Wd_WDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "gmem_Wd", "role": "WDATA" }} , 
 	{ "name": "m_axi_gmem_Wd_WSTRB", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "gmem_Wd", "role": "WSTRB" }} , 
 	{ "name": "m_axi_gmem_Wd_WLAST", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_Wd", "role": "WLAST" }} , 
 	{ "name": "m_axi_gmem_Wd_WID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_Wd", "role": "WID" }} , 
 	{ "name": "m_axi_gmem_Wd_WUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_Wd", "role": "WUSER" }} , 
 	{ "name": "m_axi_gmem_Wd_ARVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_Wd", "role": "ARVALID" }} , 
 	{ "name": "m_axi_gmem_Wd_ARREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_Wd", "role": "ARREADY" }} , 
 	{ "name": "m_axi_gmem_Wd_ARADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "gmem_Wd", "role": "ARADDR" }} , 
 	{ "name": "m_axi_gmem_Wd_ARID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_Wd", "role": "ARID" }} , 
 	{ "name": "m_axi_gmem_Wd_ARLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "gmem_Wd", "role": "ARLEN" }} , 
 	{ "name": "m_axi_gmem_Wd_ARSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "gmem_Wd", "role": "ARSIZE" }} , 
 	{ "name": "m_axi_gmem_Wd_ARBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem_Wd", "role": "ARBURST" }} , 
 	{ "name": "m_axi_gmem_Wd_ARLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem_Wd", "role": "ARLOCK" }} , 
 	{ "name": "m_axi_gmem_Wd_ARCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem_Wd", "role": "ARCACHE" }} , 
 	{ "name": "m_axi_gmem_Wd_ARPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "gmem_Wd", "role": "ARPROT" }} , 
 	{ "name": "m_axi_gmem_Wd_ARQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem_Wd", "role": "ARQOS" }} , 
 	{ "name": "m_axi_gmem_Wd_ARREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem_Wd", "role": "ARREGION" }} , 
 	{ "name": "m_axi_gmem_Wd_ARUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_Wd", "role": "ARUSER" }} , 
 	{ "name": "m_axi_gmem_Wd_RVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_Wd", "role": "RVALID" }} , 
 	{ "name": "m_axi_gmem_Wd_RREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_Wd", "role": "RREADY" }} , 
 	{ "name": "m_axi_gmem_Wd_RDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "gmem_Wd", "role": "RDATA" }} , 
 	{ "name": "m_axi_gmem_Wd_RLAST", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_Wd", "role": "RLAST" }} , 
 	{ "name": "m_axi_gmem_Wd_RID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_Wd", "role": "RID" }} , 
 	{ "name": "m_axi_gmem_Wd_RUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_Wd", "role": "RUSER" }} , 
 	{ "name": "m_axi_gmem_Wd_RRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem_Wd", "role": "RRESP" }} , 
 	{ "name": "m_axi_gmem_Wd_BVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_Wd", "role": "BVALID" }} , 
 	{ "name": "m_axi_gmem_Wd_BREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_Wd", "role": "BREADY" }} , 
 	{ "name": "m_axi_gmem_Wd_BRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem_Wd", "role": "BRESP" }} , 
 	{ "name": "m_axi_gmem_Wd_BID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_Wd", "role": "BID" }} , 
 	{ "name": "m_axi_gmem_Wd_BUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_Wd", "role": "BUSER" }} , 
 	{ "name": "m_axi_gmem_Wd2_AWVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_Wd2", "role": "AWVALID" }} , 
 	{ "name": "m_axi_gmem_Wd2_AWREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_Wd2", "role": "AWREADY" }} , 
 	{ "name": "m_axi_gmem_Wd2_AWADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "gmem_Wd2", "role": "AWADDR" }} , 
 	{ "name": "m_axi_gmem_Wd2_AWID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_Wd2", "role": "AWID" }} , 
 	{ "name": "m_axi_gmem_Wd2_AWLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "gmem_Wd2", "role": "AWLEN" }} , 
 	{ "name": "m_axi_gmem_Wd2_AWSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "gmem_Wd2", "role": "AWSIZE" }} , 
 	{ "name": "m_axi_gmem_Wd2_AWBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem_Wd2", "role": "AWBURST" }} , 
 	{ "name": "m_axi_gmem_Wd2_AWLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem_Wd2", "role": "AWLOCK" }} , 
 	{ "name": "m_axi_gmem_Wd2_AWCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem_Wd2", "role": "AWCACHE" }} , 
 	{ "name": "m_axi_gmem_Wd2_AWPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "gmem_Wd2", "role": "AWPROT" }} , 
 	{ "name": "m_axi_gmem_Wd2_AWQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem_Wd2", "role": "AWQOS" }} , 
 	{ "name": "m_axi_gmem_Wd2_AWREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem_Wd2", "role": "AWREGION" }} , 
 	{ "name": "m_axi_gmem_Wd2_AWUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_Wd2", "role": "AWUSER" }} , 
 	{ "name": "m_axi_gmem_Wd2_WVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_Wd2", "role": "WVALID" }} , 
 	{ "name": "m_axi_gmem_Wd2_WREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_Wd2", "role": "WREADY" }} , 
 	{ "name": "m_axi_gmem_Wd2_WDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "gmem_Wd2", "role": "WDATA" }} , 
 	{ "name": "m_axi_gmem_Wd2_WSTRB", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "gmem_Wd2", "role": "WSTRB" }} , 
 	{ "name": "m_axi_gmem_Wd2_WLAST", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_Wd2", "role": "WLAST" }} , 
 	{ "name": "m_axi_gmem_Wd2_WID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_Wd2", "role": "WID" }} , 
 	{ "name": "m_axi_gmem_Wd2_WUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_Wd2", "role": "WUSER" }} , 
 	{ "name": "m_axi_gmem_Wd2_ARVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_Wd2", "role": "ARVALID" }} , 
 	{ "name": "m_axi_gmem_Wd2_ARREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_Wd2", "role": "ARREADY" }} , 
 	{ "name": "m_axi_gmem_Wd2_ARADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "gmem_Wd2", "role": "ARADDR" }} , 
 	{ "name": "m_axi_gmem_Wd2_ARID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_Wd2", "role": "ARID" }} , 
 	{ "name": "m_axi_gmem_Wd2_ARLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "gmem_Wd2", "role": "ARLEN" }} , 
 	{ "name": "m_axi_gmem_Wd2_ARSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "gmem_Wd2", "role": "ARSIZE" }} , 
 	{ "name": "m_axi_gmem_Wd2_ARBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem_Wd2", "role": "ARBURST" }} , 
 	{ "name": "m_axi_gmem_Wd2_ARLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem_Wd2", "role": "ARLOCK" }} , 
 	{ "name": "m_axi_gmem_Wd2_ARCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem_Wd2", "role": "ARCACHE" }} , 
 	{ "name": "m_axi_gmem_Wd2_ARPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "gmem_Wd2", "role": "ARPROT" }} , 
 	{ "name": "m_axi_gmem_Wd2_ARQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem_Wd2", "role": "ARQOS" }} , 
 	{ "name": "m_axi_gmem_Wd2_ARREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem_Wd2", "role": "ARREGION" }} , 
 	{ "name": "m_axi_gmem_Wd2_ARUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_Wd2", "role": "ARUSER" }} , 
 	{ "name": "m_axi_gmem_Wd2_RVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_Wd2", "role": "RVALID" }} , 
 	{ "name": "m_axi_gmem_Wd2_RREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_Wd2", "role": "RREADY" }} , 
 	{ "name": "m_axi_gmem_Wd2_RDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "gmem_Wd2", "role": "RDATA" }} , 
 	{ "name": "m_axi_gmem_Wd2_RLAST", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_Wd2", "role": "RLAST" }} , 
 	{ "name": "m_axi_gmem_Wd2_RID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_Wd2", "role": "RID" }} , 
 	{ "name": "m_axi_gmem_Wd2_RUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_Wd2", "role": "RUSER" }} , 
 	{ "name": "m_axi_gmem_Wd2_RRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem_Wd2", "role": "RRESP" }} , 
 	{ "name": "m_axi_gmem_Wd2_BVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_Wd2", "role": "BVALID" }} , 
 	{ "name": "m_axi_gmem_Wd2_BREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_Wd2", "role": "BREADY" }} , 
 	{ "name": "m_axi_gmem_Wd2_BRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem_Wd2", "role": "BRESP" }} , 
 	{ "name": "m_axi_gmem_Wd2_BID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_Wd2", "role": "BID" }} , 
 	{ "name": "m_axi_gmem_Wd2_BUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_Wd2", "role": "BUSER" }} , 
 	{ "name": "m_axi_gmem_out_AWVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_out", "role": "AWVALID" }} , 
 	{ "name": "m_axi_gmem_out_AWREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_out", "role": "AWREADY" }} , 
 	{ "name": "m_axi_gmem_out_AWADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "gmem_out", "role": "AWADDR" }} , 
 	{ "name": "m_axi_gmem_out_AWID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_out", "role": "AWID" }} , 
 	{ "name": "m_axi_gmem_out_AWLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "gmem_out", "role": "AWLEN" }} , 
 	{ "name": "m_axi_gmem_out_AWSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "gmem_out", "role": "AWSIZE" }} , 
 	{ "name": "m_axi_gmem_out_AWBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem_out", "role": "AWBURST" }} , 
 	{ "name": "m_axi_gmem_out_AWLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem_out", "role": "AWLOCK" }} , 
 	{ "name": "m_axi_gmem_out_AWCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem_out", "role": "AWCACHE" }} , 
 	{ "name": "m_axi_gmem_out_AWPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "gmem_out", "role": "AWPROT" }} , 
 	{ "name": "m_axi_gmem_out_AWQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem_out", "role": "AWQOS" }} , 
 	{ "name": "m_axi_gmem_out_AWREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem_out", "role": "AWREGION" }} , 
 	{ "name": "m_axi_gmem_out_AWUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_out", "role": "AWUSER" }} , 
 	{ "name": "m_axi_gmem_out_WVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_out", "role": "WVALID" }} , 
 	{ "name": "m_axi_gmem_out_WREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_out", "role": "WREADY" }} , 
 	{ "name": "m_axi_gmem_out_WDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "gmem_out", "role": "WDATA" }} , 
 	{ "name": "m_axi_gmem_out_WSTRB", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem_out", "role": "WSTRB" }} , 
 	{ "name": "m_axi_gmem_out_WLAST", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_out", "role": "WLAST" }} , 
 	{ "name": "m_axi_gmem_out_WID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_out", "role": "WID" }} , 
 	{ "name": "m_axi_gmem_out_WUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_out", "role": "WUSER" }} , 
 	{ "name": "m_axi_gmem_out_ARVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_out", "role": "ARVALID" }} , 
 	{ "name": "m_axi_gmem_out_ARREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_out", "role": "ARREADY" }} , 
 	{ "name": "m_axi_gmem_out_ARADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "gmem_out", "role": "ARADDR" }} , 
 	{ "name": "m_axi_gmem_out_ARID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_out", "role": "ARID" }} , 
 	{ "name": "m_axi_gmem_out_ARLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "gmem_out", "role": "ARLEN" }} , 
 	{ "name": "m_axi_gmem_out_ARSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "gmem_out", "role": "ARSIZE" }} , 
 	{ "name": "m_axi_gmem_out_ARBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem_out", "role": "ARBURST" }} , 
 	{ "name": "m_axi_gmem_out_ARLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem_out", "role": "ARLOCK" }} , 
 	{ "name": "m_axi_gmem_out_ARCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem_out", "role": "ARCACHE" }} , 
 	{ "name": "m_axi_gmem_out_ARPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "gmem_out", "role": "ARPROT" }} , 
 	{ "name": "m_axi_gmem_out_ARQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem_out", "role": "ARQOS" }} , 
 	{ "name": "m_axi_gmem_out_ARREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem_out", "role": "ARREGION" }} , 
 	{ "name": "m_axi_gmem_out_ARUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_out", "role": "ARUSER" }} , 
 	{ "name": "m_axi_gmem_out_RVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_out", "role": "RVALID" }} , 
 	{ "name": "m_axi_gmem_out_RREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_out", "role": "RREADY" }} , 
 	{ "name": "m_axi_gmem_out_RDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "gmem_out", "role": "RDATA" }} , 
 	{ "name": "m_axi_gmem_out_RLAST", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_out", "role": "RLAST" }} , 
 	{ "name": "m_axi_gmem_out_RID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_out", "role": "RID" }} , 
 	{ "name": "m_axi_gmem_out_RUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_out", "role": "RUSER" }} , 
 	{ "name": "m_axi_gmem_out_RRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem_out", "role": "RRESP" }} , 
 	{ "name": "m_axi_gmem_out_BVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_out", "role": "BVALID" }} , 
 	{ "name": "m_axi_gmem_out_BREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_out", "role": "BREADY" }} , 
 	{ "name": "m_axi_gmem_out_BRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem_out", "role": "BRESP" }} , 
 	{ "name": "m_axi_gmem_out_BID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_out", "role": "BID" }} , 
 	{ "name": "m_axi_gmem_out_BUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_out", "role": "BUSER" }} , 
 	{ "name": "m_axi_gmem_x_AWVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_x", "role": "AWVALID" }} , 
 	{ "name": "m_axi_gmem_x_AWREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_x", "role": "AWREADY" }} , 
 	{ "name": "m_axi_gmem_x_AWADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "gmem_x", "role": "AWADDR" }} , 
 	{ "name": "m_axi_gmem_x_AWID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_x", "role": "AWID" }} , 
 	{ "name": "m_axi_gmem_x_AWLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "gmem_x", "role": "AWLEN" }} , 
 	{ "name": "m_axi_gmem_x_AWSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "gmem_x", "role": "AWSIZE" }} , 
 	{ "name": "m_axi_gmem_x_AWBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem_x", "role": "AWBURST" }} , 
 	{ "name": "m_axi_gmem_x_AWLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem_x", "role": "AWLOCK" }} , 
 	{ "name": "m_axi_gmem_x_AWCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem_x", "role": "AWCACHE" }} , 
 	{ "name": "m_axi_gmem_x_AWPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "gmem_x", "role": "AWPROT" }} , 
 	{ "name": "m_axi_gmem_x_AWQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem_x", "role": "AWQOS" }} , 
 	{ "name": "m_axi_gmem_x_AWREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem_x", "role": "AWREGION" }} , 
 	{ "name": "m_axi_gmem_x_AWUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_x", "role": "AWUSER" }} , 
 	{ "name": "m_axi_gmem_x_WVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_x", "role": "WVALID" }} , 
 	{ "name": "m_axi_gmem_x_WREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_x", "role": "WREADY" }} , 
 	{ "name": "m_axi_gmem_x_WDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "gmem_x", "role": "WDATA" }} , 
 	{ "name": "m_axi_gmem_x_WSTRB", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "gmem_x", "role": "WSTRB" }} , 
 	{ "name": "m_axi_gmem_x_WLAST", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_x", "role": "WLAST" }} , 
 	{ "name": "m_axi_gmem_x_WID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_x", "role": "WID" }} , 
 	{ "name": "m_axi_gmem_x_WUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_x", "role": "WUSER" }} , 
 	{ "name": "m_axi_gmem_x_ARVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_x", "role": "ARVALID" }} , 
 	{ "name": "m_axi_gmem_x_ARREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_x", "role": "ARREADY" }} , 
 	{ "name": "m_axi_gmem_x_ARADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "gmem_x", "role": "ARADDR" }} , 
 	{ "name": "m_axi_gmem_x_ARID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_x", "role": "ARID" }} , 
 	{ "name": "m_axi_gmem_x_ARLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "gmem_x", "role": "ARLEN" }} , 
 	{ "name": "m_axi_gmem_x_ARSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "gmem_x", "role": "ARSIZE" }} , 
 	{ "name": "m_axi_gmem_x_ARBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem_x", "role": "ARBURST" }} , 
 	{ "name": "m_axi_gmem_x_ARLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem_x", "role": "ARLOCK" }} , 
 	{ "name": "m_axi_gmem_x_ARCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem_x", "role": "ARCACHE" }} , 
 	{ "name": "m_axi_gmem_x_ARPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "gmem_x", "role": "ARPROT" }} , 
 	{ "name": "m_axi_gmem_x_ARQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem_x", "role": "ARQOS" }} , 
 	{ "name": "m_axi_gmem_x_ARREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem_x", "role": "ARREGION" }} , 
 	{ "name": "m_axi_gmem_x_ARUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_x", "role": "ARUSER" }} , 
 	{ "name": "m_axi_gmem_x_RVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_x", "role": "RVALID" }} , 
 	{ "name": "m_axi_gmem_x_RREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_x", "role": "RREADY" }} , 
 	{ "name": "m_axi_gmem_x_RDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "gmem_x", "role": "RDATA" }} , 
 	{ "name": "m_axi_gmem_x_RLAST", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_x", "role": "RLAST" }} , 
 	{ "name": "m_axi_gmem_x_RID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_x", "role": "RID" }} , 
 	{ "name": "m_axi_gmem_x_RUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_x", "role": "RUSER" }} , 
 	{ "name": "m_axi_gmem_x_RRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem_x", "role": "RRESP" }} , 
 	{ "name": "m_axi_gmem_x_BVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_x", "role": "BVALID" }} , 
 	{ "name": "m_axi_gmem_x_BREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_x", "role": "BREADY" }} , 
 	{ "name": "m_axi_gmem_x_BRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem_x", "role": "BRESP" }} , 
 	{ "name": "m_axi_gmem_x_BID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_x", "role": "BID" }} , 
 	{ "name": "m_axi_gmem_x_BUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_x", "role": "BUSER" }}  ]}

set ArgLastReadFirstWriteLatency {
	swiglu {
		gmem_W {Type I LastRead 1 FirstWrite -1}
		gmem_V {Type I LastRead 1 FirstWrite -1}
		gmem_Wd {Type I LastRead 221 FirstWrite -1}
		gmem_Wd2 {Type I LastRead 221 FirstWrite -1}
		gmem_x {Type I LastRead 72 FirstWrite -1}
		gmem_out {Type O LastRead 71 FirstWrite 2}
		W {Type I LastRead 0 FirstWrite -1}
		V {Type I LastRead 0 FirstWrite -1}
		W_down {Type I LastRead 0 FirstWrite -1}
		W_down2 {Type I LastRead 0 FirstWrite -1}
		x_batch {Type I LastRead 0 FirstWrite -1}
		out_batch {Type I LastRead 0 FirstWrite -1}
		down_quant_mode {Type I LastRead 0 FirstWrite -1}
		x_scale {Type I LastRead 0 FirstWrite -1}
		sigmoid_lut {Type I LastRead -1 FirstWrite -1}}
	load_x_local {
		gmem_x {Type I LastRead 72 FirstWrite -1}
		x_batch {Type I LastRead 0 FirstWrite -1}
		x_local_1_0_0 {Type O LastRead -1 FirstWrite 73}
		x_local_1_0_1 {Type O LastRead -1 FirstWrite 73}
		x_local_1_0_2 {Type O LastRead -1 FirstWrite 73}
		x_local_1_0_3 {Type O LastRead -1 FirstWrite 73}
		x_local_1_0_4 {Type O LastRead -1 FirstWrite 73}
		x_local_1_0_5 {Type O LastRead -1 FirstWrite 73}
		x_local_1_0_6 {Type O LastRead -1 FirstWrite 73}
		x_local_1_0_7 {Type O LastRead -1 FirstWrite 73}
		x_local_1_0_8 {Type O LastRead -1 FirstWrite 73}
		x_local_1_0_9 {Type O LastRead -1 FirstWrite 73}
		x_local_1_0_10 {Type O LastRead -1 FirstWrite 73}
		x_local_1_0_11 {Type O LastRead -1 FirstWrite 73}
		x_local_1_0_12 {Type O LastRead -1 FirstWrite 73}
		x_local_1_0_13 {Type O LastRead -1 FirstWrite 73}
		x_local_1_0_14 {Type O LastRead -1 FirstWrite 73}
		x_local_1_0_15 {Type O LastRead -1 FirstWrite 73}
		x_local_1_1_0 {Type O LastRead -1 FirstWrite 73}
		x_local_1_1_1 {Type O LastRead -1 FirstWrite 73}
		x_local_1_1_2 {Type O LastRead -1 FirstWrite 73}
		x_local_1_1_3 {Type O LastRead -1 FirstWrite 73}
		x_local_1_1_4 {Type O LastRead -1 FirstWrite 73}
		x_local_1_1_5 {Type O LastRead -1 FirstWrite 73}
		x_local_1_1_6 {Type O LastRead -1 FirstWrite 73}
		x_local_1_1_7 {Type O LastRead -1 FirstWrite 73}
		x_local_1_1_8 {Type O LastRead -1 FirstWrite 73}
		x_local_1_1_9 {Type O LastRead -1 FirstWrite 73}
		x_local_1_1_10 {Type O LastRead -1 FirstWrite 73}
		x_local_1_1_11 {Type O LastRead -1 FirstWrite 73}
		x_local_1_1_12 {Type O LastRead -1 FirstWrite 73}
		x_local_1_1_13 {Type O LastRead -1 FirstWrite 73}
		x_local_1_1_14 {Type O LastRead -1 FirstWrite 73}
		x_local_1_1_15 {Type O LastRead -1 FirstWrite 73}
		x_local_1_2_0 {Type O LastRead -1 FirstWrite 73}
		x_local_1_2_1 {Type O LastRead -1 FirstWrite 73}
		x_local_1_2_2 {Type O LastRead -1 FirstWrite 73}
		x_local_1_2_3 {Type O LastRead -1 FirstWrite 73}
		x_local_1_2_4 {Type O LastRead -1 FirstWrite 73}
		x_local_1_2_5 {Type O LastRead -1 FirstWrite 73}
		x_local_1_2_6 {Type O LastRead -1 FirstWrite 73}
		x_local_1_2_7 {Type O LastRead -1 FirstWrite 73}
		x_local_1_2_8 {Type O LastRead -1 FirstWrite 73}
		x_local_1_2_9 {Type O LastRead -1 FirstWrite 73}
		x_local_1_2_10 {Type O LastRead -1 FirstWrite 73}
		x_local_1_2_11 {Type O LastRead -1 FirstWrite 73}
		x_local_1_2_12 {Type O LastRead -1 FirstWrite 73}
		x_local_1_2_13 {Type O LastRead -1 FirstWrite 73}
		x_local_1_2_14 {Type O LastRead -1 FirstWrite 73}
		x_local_1_2_15 {Type O LastRead -1 FirstWrite 73}
		x_local_1_3_0 {Type O LastRead -1 FirstWrite 73}
		x_local_1_3_1 {Type O LastRead -1 FirstWrite 73}
		x_local_1_3_2 {Type O LastRead -1 FirstWrite 73}
		x_local_1_3_3 {Type O LastRead -1 FirstWrite 73}
		x_local_1_3_4 {Type O LastRead -1 FirstWrite 73}
		x_local_1_3_5 {Type O LastRead -1 FirstWrite 73}
		x_local_1_3_6 {Type O LastRead -1 FirstWrite 73}
		x_local_1_3_7 {Type O LastRead -1 FirstWrite 73}
		x_local_1_3_8 {Type O LastRead -1 FirstWrite 73}
		x_local_1_3_9 {Type O LastRead -1 FirstWrite 73}
		x_local_1_3_10 {Type O LastRead -1 FirstWrite 73}
		x_local_1_3_11 {Type O LastRead -1 FirstWrite 73}
		x_local_1_3_12 {Type O LastRead -1 FirstWrite 73}
		x_local_1_3_13 {Type O LastRead -1 FirstWrite 73}
		x_local_1_3_14 {Type O LastRead -1 FirstWrite 73}
		x_local_1_3_15 {Type O LastRead -1 FirstWrite 73}
		x_local_1_4_0 {Type O LastRead -1 FirstWrite 73}
		x_local_1_4_1 {Type O LastRead -1 FirstWrite 73}
		x_local_1_4_2 {Type O LastRead -1 FirstWrite 73}
		x_local_1_4_3 {Type O LastRead -1 FirstWrite 73}
		x_local_1_4_4 {Type O LastRead -1 FirstWrite 73}
		x_local_1_4_5 {Type O LastRead -1 FirstWrite 73}
		x_local_1_4_6 {Type O LastRead -1 FirstWrite 73}
		x_local_1_4_7 {Type O LastRead -1 FirstWrite 73}
		x_local_1_4_8 {Type O LastRead -1 FirstWrite 73}
		x_local_1_4_9 {Type O LastRead -1 FirstWrite 73}
		x_local_1_4_10 {Type O LastRead -1 FirstWrite 73}
		x_local_1_4_11 {Type O LastRead -1 FirstWrite 73}
		x_local_1_4_12 {Type O LastRead -1 FirstWrite 73}
		x_local_1_4_13 {Type O LastRead -1 FirstWrite 73}
		x_local_1_4_14 {Type O LastRead -1 FirstWrite 73}
		x_local_1_4_15 {Type O LastRead -1 FirstWrite 73}
		x_local_1_5_0 {Type O LastRead -1 FirstWrite 73}
		x_local_1_5_1 {Type O LastRead -1 FirstWrite 73}
		x_local_1_5_2 {Type O LastRead -1 FirstWrite 73}
		x_local_1_5_3 {Type O LastRead -1 FirstWrite 73}
		x_local_1_5_4 {Type O LastRead -1 FirstWrite 73}
		x_local_1_5_5 {Type O LastRead -1 FirstWrite 73}
		x_local_1_5_6 {Type O LastRead -1 FirstWrite 73}
		x_local_1_5_7 {Type O LastRead -1 FirstWrite 73}
		x_local_1_5_8 {Type O LastRead -1 FirstWrite 73}
		x_local_1_5_9 {Type O LastRead -1 FirstWrite 73}
		x_local_1_5_10 {Type O LastRead -1 FirstWrite 73}
		x_local_1_5_11 {Type O LastRead -1 FirstWrite 73}
		x_local_1_5_12 {Type O LastRead -1 FirstWrite 73}
		x_local_1_5_13 {Type O LastRead -1 FirstWrite 73}
		x_local_1_5_14 {Type O LastRead -1 FirstWrite 73}
		x_local_1_5_15 {Type O LastRead -1 FirstWrite 73}
		x_local_1_6_0 {Type O LastRead -1 FirstWrite 73}
		x_local_1_6_1 {Type O LastRead -1 FirstWrite 73}
		x_local_1_6_2 {Type O LastRead -1 FirstWrite 73}
		x_local_1_6_3 {Type O LastRead -1 FirstWrite 73}
		x_local_1_6_4 {Type O LastRead -1 FirstWrite 73}
		x_local_1_6_5 {Type O LastRead -1 FirstWrite 73}
		x_local_1_6_6 {Type O LastRead -1 FirstWrite 73}
		x_local_1_6_7 {Type O LastRead -1 FirstWrite 73}
		x_local_1_6_8 {Type O LastRead -1 FirstWrite 73}
		x_local_1_6_9 {Type O LastRead -1 FirstWrite 73}
		x_local_1_6_10 {Type O LastRead -1 FirstWrite 73}
		x_local_1_6_11 {Type O LastRead -1 FirstWrite 73}
		x_local_1_6_12 {Type O LastRead -1 FirstWrite 73}
		x_local_1_6_13 {Type O LastRead -1 FirstWrite 73}
		x_local_1_6_14 {Type O LastRead -1 FirstWrite 73}
		x_local_1_6_15 {Type O LastRead -1 FirstWrite 73}
		x_local_1_7_0 {Type O LastRead -1 FirstWrite 73}
		x_local_1_7_1 {Type O LastRead -1 FirstWrite 73}
		x_local_1_7_2 {Type O LastRead -1 FirstWrite 73}
		x_local_1_7_3 {Type O LastRead -1 FirstWrite 73}
		x_local_1_7_4 {Type O LastRead -1 FirstWrite 73}
		x_local_1_7_5 {Type O LastRead -1 FirstWrite 73}
		x_local_1_7_6 {Type O LastRead -1 FirstWrite 73}
		x_local_1_7_7 {Type O LastRead -1 FirstWrite 73}
		x_local_1_7_8 {Type O LastRead -1 FirstWrite 73}
		x_local_1_7_9 {Type O LastRead -1 FirstWrite 73}
		x_local_1_7_10 {Type O LastRead -1 FirstWrite 73}
		x_local_1_7_11 {Type O LastRead -1 FirstWrite 73}
		x_local_1_7_12 {Type O LastRead -1 FirstWrite 73}
		x_local_1_7_13 {Type O LastRead -1 FirstWrite 73}
		x_local_1_7_14 {Type O LastRead -1 FirstWrite 73}
		x_local_1_7_15 {Type O LastRead -1 FirstWrite 73}
		x_local_2_0_0 {Type O LastRead -1 FirstWrite 73}
		x_local_2_0_1 {Type O LastRead -1 FirstWrite 73}
		x_local_2_0_2 {Type O LastRead -1 FirstWrite 73}
		x_local_2_0_3 {Type O LastRead -1 FirstWrite 73}
		x_local_2_0_4 {Type O LastRead -1 FirstWrite 73}
		x_local_2_0_5 {Type O LastRead -1 FirstWrite 73}
		x_local_2_0_6 {Type O LastRead -1 FirstWrite 73}
		x_local_2_0_7 {Type O LastRead -1 FirstWrite 73}
		x_local_2_0_8 {Type O LastRead -1 FirstWrite 73}
		x_local_2_0_9 {Type O LastRead -1 FirstWrite 73}
		x_local_2_0_10 {Type O LastRead -1 FirstWrite 73}
		x_local_2_0_11 {Type O LastRead -1 FirstWrite 73}
		x_local_2_0_12 {Type O LastRead -1 FirstWrite 73}
		x_local_2_0_13 {Type O LastRead -1 FirstWrite 73}
		x_local_2_0_14 {Type O LastRead -1 FirstWrite 73}
		x_local_2_0_15 {Type O LastRead -1 FirstWrite 73}
		x_local_2_1_0 {Type O LastRead -1 FirstWrite 73}
		x_local_2_1_1 {Type O LastRead -1 FirstWrite 73}
		x_local_2_1_2 {Type O LastRead -1 FirstWrite 73}
		x_local_2_1_3 {Type O LastRead -1 FirstWrite 73}
		x_local_2_1_4 {Type O LastRead -1 FirstWrite 73}
		x_local_2_1_5 {Type O LastRead -1 FirstWrite 73}
		x_local_2_1_6 {Type O LastRead -1 FirstWrite 73}
		x_local_2_1_7 {Type O LastRead -1 FirstWrite 73}
		x_local_2_1_8 {Type O LastRead -1 FirstWrite 73}
		x_local_2_1_9 {Type O LastRead -1 FirstWrite 73}
		x_local_2_1_10 {Type O LastRead -1 FirstWrite 73}
		x_local_2_1_11 {Type O LastRead -1 FirstWrite 73}
		x_local_2_1_12 {Type O LastRead -1 FirstWrite 73}
		x_local_2_1_13 {Type O LastRead -1 FirstWrite 73}
		x_local_2_1_14 {Type O LastRead -1 FirstWrite 73}
		x_local_2_1_15 {Type O LastRead -1 FirstWrite 73}
		x_local_2_2_0 {Type O LastRead -1 FirstWrite 73}
		x_local_2_2_1 {Type O LastRead -1 FirstWrite 73}
		x_local_2_2_2 {Type O LastRead -1 FirstWrite 73}
		x_local_2_2_3 {Type O LastRead -1 FirstWrite 73}
		x_local_2_2_4 {Type O LastRead -1 FirstWrite 73}
		x_local_2_2_5 {Type O LastRead -1 FirstWrite 73}
		x_local_2_2_6 {Type O LastRead -1 FirstWrite 73}
		x_local_2_2_7 {Type O LastRead -1 FirstWrite 73}
		x_local_2_2_8 {Type O LastRead -1 FirstWrite 73}
		x_local_2_2_9 {Type O LastRead -1 FirstWrite 73}
		x_local_2_2_10 {Type O LastRead -1 FirstWrite 73}
		x_local_2_2_11 {Type O LastRead -1 FirstWrite 73}
		x_local_2_2_12 {Type O LastRead -1 FirstWrite 73}
		x_local_2_2_13 {Type O LastRead -1 FirstWrite 73}
		x_local_2_2_14 {Type O LastRead -1 FirstWrite 73}
		x_local_2_2_15 {Type O LastRead -1 FirstWrite 73}
		x_local_2_3_0 {Type O LastRead -1 FirstWrite 73}
		x_local_2_3_1 {Type O LastRead -1 FirstWrite 73}
		x_local_2_3_2 {Type O LastRead -1 FirstWrite 73}
		x_local_2_3_3 {Type O LastRead -1 FirstWrite 73}
		x_local_2_3_4 {Type O LastRead -1 FirstWrite 73}
		x_local_2_3_5 {Type O LastRead -1 FirstWrite 73}
		x_local_2_3_6 {Type O LastRead -1 FirstWrite 73}
		x_local_2_3_7 {Type O LastRead -1 FirstWrite 73}
		x_local_2_3_8 {Type O LastRead -1 FirstWrite 73}
		x_local_2_3_9 {Type O LastRead -1 FirstWrite 73}
		x_local_2_3_10 {Type O LastRead -1 FirstWrite 73}
		x_local_2_3_11 {Type O LastRead -1 FirstWrite 73}
		x_local_2_3_12 {Type O LastRead -1 FirstWrite 73}
		x_local_2_3_13 {Type O LastRead -1 FirstWrite 73}
		x_local_2_3_14 {Type O LastRead -1 FirstWrite 73}
		x_local_2_3_15 {Type O LastRead -1 FirstWrite 73}
		x_local_2_4_0 {Type O LastRead -1 FirstWrite 73}
		x_local_2_4_1 {Type O LastRead -1 FirstWrite 73}
		x_local_2_4_2 {Type O LastRead -1 FirstWrite 73}
		x_local_2_4_3 {Type O LastRead -1 FirstWrite 73}
		x_local_2_4_4 {Type O LastRead -1 FirstWrite 73}
		x_local_2_4_5 {Type O LastRead -1 FirstWrite 73}
		x_local_2_4_6 {Type O LastRead -1 FirstWrite 73}
		x_local_2_4_7 {Type O LastRead -1 FirstWrite 73}
		x_local_2_4_8 {Type O LastRead -1 FirstWrite 73}
		x_local_2_4_9 {Type O LastRead -1 FirstWrite 73}
		x_local_2_4_10 {Type O LastRead -1 FirstWrite 73}
		x_local_2_4_11 {Type O LastRead -1 FirstWrite 73}
		x_local_2_4_12 {Type O LastRead -1 FirstWrite 73}
		x_local_2_4_13 {Type O LastRead -1 FirstWrite 73}
		x_local_2_4_14 {Type O LastRead -1 FirstWrite 73}
		x_local_2_4_15 {Type O LastRead -1 FirstWrite 73}
		x_local_2_5_0 {Type O LastRead -1 FirstWrite 73}
		x_local_2_5_1 {Type O LastRead -1 FirstWrite 73}
		x_local_2_5_2 {Type O LastRead -1 FirstWrite 73}
		x_local_2_5_3 {Type O LastRead -1 FirstWrite 73}
		x_local_2_5_4 {Type O LastRead -1 FirstWrite 73}
		x_local_2_5_5 {Type O LastRead -1 FirstWrite 73}
		x_local_2_5_6 {Type O LastRead -1 FirstWrite 73}
		x_local_2_5_7 {Type O LastRead -1 FirstWrite 73}
		x_local_2_5_8 {Type O LastRead -1 FirstWrite 73}
		x_local_2_5_9 {Type O LastRead -1 FirstWrite 73}
		x_local_2_5_10 {Type O LastRead -1 FirstWrite 73}
		x_local_2_5_11 {Type O LastRead -1 FirstWrite 73}
		x_local_2_5_12 {Type O LastRead -1 FirstWrite 73}
		x_local_2_5_13 {Type O LastRead -1 FirstWrite 73}
		x_local_2_5_14 {Type O LastRead -1 FirstWrite 73}
		x_local_2_5_15 {Type O LastRead -1 FirstWrite 73}
		x_local_2_6_0 {Type O LastRead -1 FirstWrite 73}
		x_local_2_6_1 {Type O LastRead -1 FirstWrite 73}
		x_local_2_6_2 {Type O LastRead -1 FirstWrite 73}
		x_local_2_6_3 {Type O LastRead -1 FirstWrite 73}
		x_local_2_6_4 {Type O LastRead -1 FirstWrite 73}
		x_local_2_6_5 {Type O LastRead -1 FirstWrite 73}
		x_local_2_6_6 {Type O LastRead -1 FirstWrite 73}
		x_local_2_6_7 {Type O LastRead -1 FirstWrite 73}
		x_local_2_6_8 {Type O LastRead -1 FirstWrite 73}
		x_local_2_6_9 {Type O LastRead -1 FirstWrite 73}
		x_local_2_6_10 {Type O LastRead -1 FirstWrite 73}
		x_local_2_6_11 {Type O LastRead -1 FirstWrite 73}
		x_local_2_6_12 {Type O LastRead -1 FirstWrite 73}
		x_local_2_6_13 {Type O LastRead -1 FirstWrite 73}
		x_local_2_6_14 {Type O LastRead -1 FirstWrite 73}
		x_local_2_6_15 {Type O LastRead -1 FirstWrite 73}
		x_local_2_7_0 {Type O LastRead -1 FirstWrite 73}
		x_local_2_7_1 {Type O LastRead -1 FirstWrite 73}
		x_local_2_7_2 {Type O LastRead -1 FirstWrite 73}
		x_local_2_7_3 {Type O LastRead -1 FirstWrite 73}
		x_local_2_7_4 {Type O LastRead -1 FirstWrite 73}
		x_local_2_7_5 {Type O LastRead -1 FirstWrite 73}
		x_local_2_7_6 {Type O LastRead -1 FirstWrite 73}
		x_local_2_7_7 {Type O LastRead -1 FirstWrite 73}
		x_local_2_7_8 {Type O LastRead -1 FirstWrite 73}
		x_local_2_7_9 {Type O LastRead -1 FirstWrite 73}
		x_local_2_7_10 {Type O LastRead -1 FirstWrite 73}
		x_local_2_7_11 {Type O LastRead -1 FirstWrite 73}
		x_local_2_7_12 {Type O LastRead -1 FirstWrite 73}
		x_local_2_7_13 {Type O LastRead -1 FirstWrite 73}
		x_local_2_7_14 {Type O LastRead -1 FirstWrite 73}
		x_local_2_7_15 {Type O LastRead -1 FirstWrite 73}}
	compute_X1 {
		gmem_W {Type I LastRead 1 FirstWrite -1}
		W {Type I LastRead 0 FirstWrite -1}
		x_local_1_0_0 {Type I LastRead 1 FirstWrite -1}
		x_local_1_0_1 {Type I LastRead 1 FirstWrite -1}
		x_local_1_0_2 {Type I LastRead 1 FirstWrite -1}
		x_local_1_0_3 {Type I LastRead 1 FirstWrite -1}
		x_local_1_0_4 {Type I LastRead 1 FirstWrite -1}
		x_local_1_0_5 {Type I LastRead 1 FirstWrite -1}
		x_local_1_0_6 {Type I LastRead 1 FirstWrite -1}
		x_local_1_0_7 {Type I LastRead 1 FirstWrite -1}
		x_local_1_0_8 {Type I LastRead 1 FirstWrite -1}
		x_local_1_0_9 {Type I LastRead 1 FirstWrite -1}
		x_local_1_0_10 {Type I LastRead 1 FirstWrite -1}
		x_local_1_0_11 {Type I LastRead 1 FirstWrite -1}
		x_local_1_0_12 {Type I LastRead 1 FirstWrite -1}
		x_local_1_0_13 {Type I LastRead 1 FirstWrite -1}
		x_local_1_0_14 {Type I LastRead 1 FirstWrite -1}
		x_local_1_0_15 {Type I LastRead 1 FirstWrite -1}
		x_local_1_1_0 {Type I LastRead 1 FirstWrite -1}
		x_local_1_1_1 {Type I LastRead 1 FirstWrite -1}
		x_local_1_1_2 {Type I LastRead 1 FirstWrite -1}
		x_local_1_1_3 {Type I LastRead 1 FirstWrite -1}
		x_local_1_1_4 {Type I LastRead 1 FirstWrite -1}
		x_local_1_1_5 {Type I LastRead 1 FirstWrite -1}
		x_local_1_1_6 {Type I LastRead 1 FirstWrite -1}
		x_local_1_1_7 {Type I LastRead 1 FirstWrite -1}
		x_local_1_1_8 {Type I LastRead 1 FirstWrite -1}
		x_local_1_1_9 {Type I LastRead 1 FirstWrite -1}
		x_local_1_1_10 {Type I LastRead 1 FirstWrite -1}
		x_local_1_1_11 {Type I LastRead 1 FirstWrite -1}
		x_local_1_1_12 {Type I LastRead 1 FirstWrite -1}
		x_local_1_1_13 {Type I LastRead 1 FirstWrite -1}
		x_local_1_1_14 {Type I LastRead 1 FirstWrite -1}
		x_local_1_1_15 {Type I LastRead 1 FirstWrite -1}
		x_local_1_2_0 {Type I LastRead 1 FirstWrite -1}
		x_local_1_2_1 {Type I LastRead 1 FirstWrite -1}
		x_local_1_2_2 {Type I LastRead 1 FirstWrite -1}
		x_local_1_2_3 {Type I LastRead 1 FirstWrite -1}
		x_local_1_2_4 {Type I LastRead 1 FirstWrite -1}
		x_local_1_2_5 {Type I LastRead 1 FirstWrite -1}
		x_local_1_2_6 {Type I LastRead 1 FirstWrite -1}
		x_local_1_2_7 {Type I LastRead 1 FirstWrite -1}
		x_local_1_2_8 {Type I LastRead 1 FirstWrite -1}
		x_local_1_2_9 {Type I LastRead 1 FirstWrite -1}
		x_local_1_2_10 {Type I LastRead 1 FirstWrite -1}
		x_local_1_2_11 {Type I LastRead 1 FirstWrite -1}
		x_local_1_2_12 {Type I LastRead 1 FirstWrite -1}
		x_local_1_2_13 {Type I LastRead 1 FirstWrite -1}
		x_local_1_2_14 {Type I LastRead 1 FirstWrite -1}
		x_local_1_2_15 {Type I LastRead 1 FirstWrite -1}
		x_local_1_3_0 {Type I LastRead 1 FirstWrite -1}
		x_local_1_3_1 {Type I LastRead 1 FirstWrite -1}
		x_local_1_3_2 {Type I LastRead 1 FirstWrite -1}
		x_local_1_3_3 {Type I LastRead 1 FirstWrite -1}
		x_local_1_3_4 {Type I LastRead 1 FirstWrite -1}
		x_local_1_3_5 {Type I LastRead 1 FirstWrite -1}
		x_local_1_3_6 {Type I LastRead 1 FirstWrite -1}
		x_local_1_3_7 {Type I LastRead 1 FirstWrite -1}
		x_local_1_3_8 {Type I LastRead 1 FirstWrite -1}
		x_local_1_3_9 {Type I LastRead 1 FirstWrite -1}
		x_local_1_3_10 {Type I LastRead 1 FirstWrite -1}
		x_local_1_3_11 {Type I LastRead 1 FirstWrite -1}
		x_local_1_3_12 {Type I LastRead 1 FirstWrite -1}
		x_local_1_3_13 {Type I LastRead 1 FirstWrite -1}
		x_local_1_3_14 {Type I LastRead 1 FirstWrite -1}
		x_local_1_3_15 {Type I LastRead 1 FirstWrite -1}
		x_local_1_4_0 {Type I LastRead 1 FirstWrite -1}
		x_local_1_4_1 {Type I LastRead 1 FirstWrite -1}
		x_local_1_4_2 {Type I LastRead 1 FirstWrite -1}
		x_local_1_4_3 {Type I LastRead 1 FirstWrite -1}
		x_local_1_4_4 {Type I LastRead 1 FirstWrite -1}
		x_local_1_4_5 {Type I LastRead 1 FirstWrite -1}
		x_local_1_4_6 {Type I LastRead 1 FirstWrite -1}
		x_local_1_4_7 {Type I LastRead 1 FirstWrite -1}
		x_local_1_4_8 {Type I LastRead 1 FirstWrite -1}
		x_local_1_4_9 {Type I LastRead 1 FirstWrite -1}
		x_local_1_4_10 {Type I LastRead 1 FirstWrite -1}
		x_local_1_4_11 {Type I LastRead 1 FirstWrite -1}
		x_local_1_4_12 {Type I LastRead 1 FirstWrite -1}
		x_local_1_4_13 {Type I LastRead 1 FirstWrite -1}
		x_local_1_4_14 {Type I LastRead 1 FirstWrite -1}
		x_local_1_4_15 {Type I LastRead 1 FirstWrite -1}
		x_local_1_5_0 {Type I LastRead 1 FirstWrite -1}
		x_local_1_5_1 {Type I LastRead 1 FirstWrite -1}
		x_local_1_5_2 {Type I LastRead 1 FirstWrite -1}
		x_local_1_5_3 {Type I LastRead 1 FirstWrite -1}
		x_local_1_5_4 {Type I LastRead 1 FirstWrite -1}
		x_local_1_5_5 {Type I LastRead 1 FirstWrite -1}
		x_local_1_5_6 {Type I LastRead 1 FirstWrite -1}
		x_local_1_5_7 {Type I LastRead 1 FirstWrite -1}
		x_local_1_5_8 {Type I LastRead 1 FirstWrite -1}
		x_local_1_5_9 {Type I LastRead 1 FirstWrite -1}
		x_local_1_5_10 {Type I LastRead 1 FirstWrite -1}
		x_local_1_5_11 {Type I LastRead 1 FirstWrite -1}
		x_local_1_5_12 {Type I LastRead 1 FirstWrite -1}
		x_local_1_5_13 {Type I LastRead 1 FirstWrite -1}
		x_local_1_5_14 {Type I LastRead 1 FirstWrite -1}
		x_local_1_5_15 {Type I LastRead 1 FirstWrite -1}
		x_local_1_6_0 {Type I LastRead 1 FirstWrite -1}
		x_local_1_6_1 {Type I LastRead 1 FirstWrite -1}
		x_local_1_6_2 {Type I LastRead 1 FirstWrite -1}
		x_local_1_6_3 {Type I LastRead 1 FirstWrite -1}
		x_local_1_6_4 {Type I LastRead 1 FirstWrite -1}
		x_local_1_6_5 {Type I LastRead 1 FirstWrite -1}
		x_local_1_6_6 {Type I LastRead 1 FirstWrite -1}
		x_local_1_6_7 {Type I LastRead 1 FirstWrite -1}
		x_local_1_6_8 {Type I LastRead 1 FirstWrite -1}
		x_local_1_6_9 {Type I LastRead 1 FirstWrite -1}
		x_local_1_6_10 {Type I LastRead 1 FirstWrite -1}
		x_local_1_6_11 {Type I LastRead 1 FirstWrite -1}
		x_local_1_6_12 {Type I LastRead 1 FirstWrite -1}
		x_local_1_6_13 {Type I LastRead 1 FirstWrite -1}
		x_local_1_6_14 {Type I LastRead 1 FirstWrite -1}
		x_local_1_6_15 {Type I LastRead 1 FirstWrite -1}
		x_local_1_7_0 {Type I LastRead 1 FirstWrite -1}
		x_local_1_7_1 {Type I LastRead 1 FirstWrite -1}
		x_local_1_7_2 {Type I LastRead 1 FirstWrite -1}
		x_local_1_7_3 {Type I LastRead 1 FirstWrite -1}
		x_local_1_7_4 {Type I LastRead 1 FirstWrite -1}
		x_local_1_7_5 {Type I LastRead 1 FirstWrite -1}
		x_local_1_7_6 {Type I LastRead 1 FirstWrite -1}
		x_local_1_7_7 {Type I LastRead 1 FirstWrite -1}
		x_local_1_7_8 {Type I LastRead 1 FirstWrite -1}
		x_local_1_7_9 {Type I LastRead 1 FirstWrite -1}
		x_local_1_7_10 {Type I LastRead 1 FirstWrite -1}
		x_local_1_7_11 {Type I LastRead 1 FirstWrite -1}
		x_local_1_7_12 {Type I LastRead 1 FirstWrite -1}
		x_local_1_7_13 {Type I LastRead 1 FirstWrite -1}
		x_local_1_7_14 {Type I LastRead 1 FirstWrite -1}
		x_local_1_7_15 {Type I LastRead 1 FirstWrite -1}
		x_scale {Type I LastRead 0 FirstWrite -1}
		X1_cache {Type O LastRead -1 FirstWrite 32}}
	load_row_wv {
		gmem_V {Type I LastRead 1 FirstWrite -1}
		W_wide {Type I LastRead 0 FirstWrite -1}
		row {Type I LastRead 0 FirstWrite -1}
		rb_0 {Type O LastRead -1 FirstWrite 2}
		rb_1 {Type O LastRead -1 FirstWrite 2}
		rb_2 {Type O LastRead -1 FirstWrite 2}
		rb_3 {Type O LastRead -1 FirstWrite 2}
		rb_4 {Type O LastRead -1 FirstWrite 2}
		rb_5 {Type O LastRead -1 FirstWrite 2}
		rb_6 {Type O LastRead -1 FirstWrite 2}
		rb_7 {Type O LastRead -1 FirstWrite 2}}
	load_row_wv_Pipeline_LOAD_WV_VITIS_LOOP_95_1 {
		gmem_V {Type I LastRead 1 FirstWrite -1}
		sext_ln94 {Type I LastRead 0 FirstWrite -1}
		rb_7 {Type O LastRead -1 FirstWrite 2}
		rb_6 {Type O LastRead -1 FirstWrite 2}
		rb_5 {Type O LastRead -1 FirstWrite 2}
		rb_4 {Type O LastRead -1 FirstWrite 2}
		rb_3 {Type O LastRead -1 FirstWrite 2}
		rb_2 {Type O LastRead -1 FirstWrite 2}
		rb_1 {Type O LastRead -1 FirstWrite 2}
		rb_0 {Type O LastRead -1 FirstWrite 2}}
	mac_blocks_wv_k1 {
		rb_0 {Type I LastRead 1 FirstWrite -1}
		rb_1 {Type I LastRead 1 FirstWrite -1}
		rb_2 {Type I LastRead 1 FirstWrite -1}
		rb_3 {Type I LastRead 1 FirstWrite -1}
		rb_4 {Type I LastRead 1 FirstWrite -1}
		rb_5 {Type I LastRead 1 FirstWrite -1}
		rb_6 {Type I LastRead 1 FirstWrite -1}
		rb_7 {Type I LastRead 1 FirstWrite -1}
		x_0_0 {Type I LastRead 1 FirstWrite -1}
		x_0_1 {Type I LastRead 1 FirstWrite -1}
		x_0_2 {Type I LastRead 1 FirstWrite -1}
		x_0_3 {Type I LastRead 1 FirstWrite -1}
		x_0_4 {Type I LastRead 1 FirstWrite -1}
		x_0_5 {Type I LastRead 1 FirstWrite -1}
		x_0_6 {Type I LastRead 1 FirstWrite -1}
		x_0_7 {Type I LastRead 1 FirstWrite -1}
		x_0_8 {Type I LastRead 1 FirstWrite -1}
		x_0_9 {Type I LastRead 1 FirstWrite -1}
		x_0_10 {Type I LastRead 1 FirstWrite -1}
		x_0_11 {Type I LastRead 1 FirstWrite -1}
		x_0_12 {Type I LastRead 1 FirstWrite -1}
		x_0_13 {Type I LastRead 1 FirstWrite -1}
		x_0_14 {Type I LastRead 1 FirstWrite -1}
		x_0_15 {Type I LastRead 1 FirstWrite -1}
		x_1_0 {Type I LastRead 1 FirstWrite -1}
		x_1_1 {Type I LastRead 1 FirstWrite -1}
		x_1_2 {Type I LastRead 1 FirstWrite -1}
		x_1_3 {Type I LastRead 1 FirstWrite -1}
		x_1_4 {Type I LastRead 1 FirstWrite -1}
		x_1_5 {Type I LastRead 1 FirstWrite -1}
		x_1_6 {Type I LastRead 1 FirstWrite -1}
		x_1_7 {Type I LastRead 1 FirstWrite -1}
		x_1_8 {Type I LastRead 1 FirstWrite -1}
		x_1_9 {Type I LastRead 1 FirstWrite -1}
		x_1_10 {Type I LastRead 1 FirstWrite -1}
		x_1_11 {Type I LastRead 1 FirstWrite -1}
		x_1_12 {Type I LastRead 1 FirstWrite -1}
		x_1_13 {Type I LastRead 1 FirstWrite -1}
		x_1_14 {Type I LastRead 1 FirstWrite -1}
		x_1_15 {Type I LastRead 1 FirstWrite -1}
		x_2_0 {Type I LastRead 1 FirstWrite -1}
		x_2_1 {Type I LastRead 1 FirstWrite -1}
		x_2_2 {Type I LastRead 1 FirstWrite -1}
		x_2_3 {Type I LastRead 1 FirstWrite -1}
		x_2_4 {Type I LastRead 1 FirstWrite -1}
		x_2_5 {Type I LastRead 1 FirstWrite -1}
		x_2_6 {Type I LastRead 1 FirstWrite -1}
		x_2_7 {Type I LastRead 1 FirstWrite -1}
		x_2_8 {Type I LastRead 1 FirstWrite -1}
		x_2_9 {Type I LastRead 1 FirstWrite -1}
		x_2_10 {Type I LastRead 1 FirstWrite -1}
		x_2_11 {Type I LastRead 1 FirstWrite -1}
		x_2_12 {Type I LastRead 1 FirstWrite -1}
		x_2_13 {Type I LastRead 1 FirstWrite -1}
		x_2_14 {Type I LastRead 1 FirstWrite -1}
		x_2_15 {Type I LastRead 1 FirstWrite -1}
		x_3_0 {Type I LastRead 1 FirstWrite -1}
		x_3_1 {Type I LastRead 1 FirstWrite -1}
		x_3_2 {Type I LastRead 1 FirstWrite -1}
		x_3_3 {Type I LastRead 1 FirstWrite -1}
		x_3_4 {Type I LastRead 1 FirstWrite -1}
		x_3_5 {Type I LastRead 1 FirstWrite -1}
		x_3_6 {Type I LastRead 1 FirstWrite -1}
		x_3_7 {Type I LastRead 1 FirstWrite -1}
		x_3_8 {Type I LastRead 1 FirstWrite -1}
		x_3_9 {Type I LastRead 1 FirstWrite -1}
		x_3_10 {Type I LastRead 1 FirstWrite -1}
		x_3_11 {Type I LastRead 1 FirstWrite -1}
		x_3_12 {Type I LastRead 1 FirstWrite -1}
		x_3_13 {Type I LastRead 1 FirstWrite -1}
		x_3_14 {Type I LastRead 1 FirstWrite -1}
		x_3_15 {Type I LastRead 1 FirstWrite -1}
		x_4_0 {Type I LastRead 1 FirstWrite -1}
		x_4_1 {Type I LastRead 1 FirstWrite -1}
		x_4_2 {Type I LastRead 1 FirstWrite -1}
		x_4_3 {Type I LastRead 1 FirstWrite -1}
		x_4_4 {Type I LastRead 1 FirstWrite -1}
		x_4_5 {Type I LastRead 1 FirstWrite -1}
		x_4_6 {Type I LastRead 1 FirstWrite -1}
		x_4_7 {Type I LastRead 1 FirstWrite -1}
		x_4_8 {Type I LastRead 1 FirstWrite -1}
		x_4_9 {Type I LastRead 1 FirstWrite -1}
		x_4_10 {Type I LastRead 1 FirstWrite -1}
		x_4_11 {Type I LastRead 1 FirstWrite -1}
		x_4_12 {Type I LastRead 1 FirstWrite -1}
		x_4_13 {Type I LastRead 1 FirstWrite -1}
		x_4_14 {Type I LastRead 1 FirstWrite -1}
		x_4_15 {Type I LastRead 1 FirstWrite -1}
		x_5_0 {Type I LastRead 1 FirstWrite -1}
		x_5_1 {Type I LastRead 1 FirstWrite -1}
		x_5_2 {Type I LastRead 1 FirstWrite -1}
		x_5_3 {Type I LastRead 1 FirstWrite -1}
		x_5_4 {Type I LastRead 1 FirstWrite -1}
		x_5_5 {Type I LastRead 1 FirstWrite -1}
		x_5_6 {Type I LastRead 1 FirstWrite -1}
		x_5_7 {Type I LastRead 1 FirstWrite -1}
		x_5_8 {Type I LastRead 1 FirstWrite -1}
		x_5_9 {Type I LastRead 1 FirstWrite -1}
		x_5_10 {Type I LastRead 1 FirstWrite -1}
		x_5_11 {Type I LastRead 1 FirstWrite -1}
		x_5_12 {Type I LastRead 1 FirstWrite -1}
		x_5_13 {Type I LastRead 1 FirstWrite -1}
		x_5_14 {Type I LastRead 1 FirstWrite -1}
		x_5_15 {Type I LastRead 1 FirstWrite -1}
		x_6_0 {Type I LastRead 1 FirstWrite -1}
		x_6_1 {Type I LastRead 1 FirstWrite -1}
		x_6_2 {Type I LastRead 1 FirstWrite -1}
		x_6_3 {Type I LastRead 1 FirstWrite -1}
		x_6_4 {Type I LastRead 1 FirstWrite -1}
		x_6_5 {Type I LastRead 1 FirstWrite -1}
		x_6_6 {Type I LastRead 1 FirstWrite -1}
		x_6_7 {Type I LastRead 1 FirstWrite -1}
		x_6_8 {Type I LastRead 1 FirstWrite -1}
		x_6_9 {Type I LastRead 1 FirstWrite -1}
		x_6_10 {Type I LastRead 1 FirstWrite -1}
		x_6_11 {Type I LastRead 1 FirstWrite -1}
		x_6_12 {Type I LastRead 1 FirstWrite -1}
		x_6_13 {Type I LastRead 1 FirstWrite -1}
		x_6_14 {Type I LastRead 1 FirstWrite -1}
		x_6_15 {Type I LastRead 1 FirstWrite -1}
		x_7_0 {Type I LastRead 1 FirstWrite -1}
		x_7_1 {Type I LastRead 1 FirstWrite -1}
		x_7_2 {Type I LastRead 1 FirstWrite -1}
		x_7_3 {Type I LastRead 1 FirstWrite -1}
		x_7_4 {Type I LastRead 1 FirstWrite -1}
		x_7_5 {Type I LastRead 1 FirstWrite -1}
		x_7_6 {Type I LastRead 1 FirstWrite -1}
		x_7_7 {Type I LastRead 1 FirstWrite -1}
		x_7_8 {Type I LastRead 1 FirstWrite -1}
		x_7_9 {Type I LastRead 1 FirstWrite -1}
		x_7_10 {Type I LastRead 1 FirstWrite -1}
		x_7_11 {Type I LastRead 1 FirstWrite -1}
		x_7_12 {Type I LastRead 1 FirstWrite -1}
		x_7_13 {Type I LastRead 1 FirstWrite -1}
		x_7_14 {Type I LastRead 1 FirstWrite -1}
		x_7_15 {Type I LastRead 1 FirstWrite -1}
		x_scale {Type I LastRead 11 FirstWrite -1}}
	mac_blocks_wv_k1_Pipeline_UNPACK_HDR_WV_K1 {
		rb_0_load {Type I LastRead 0 FirstWrite -1}
		rb_1_load {Type I LastRead 0 FirstWrite -1}
		rb_2_load {Type I LastRead 0 FirstWrite -1}
		rb_3_load {Type I LastRead 0 FirstWrite -1}
		rb_4_load {Type I LastRead 0 FirstWrite -1}
		rb_5_load {Type I LastRead 0 FirstWrite -1}
		rb_6_load {Type I LastRead 0 FirstWrite -1}
		rb_7_load {Type I LastRead 0 FirstWrite -1}
		mn6_63_out {Type O LastRead -1 FirstWrite 5}
		mn6_62_out {Type O LastRead -1 FirstWrite 5}
		mn6_61_out {Type O LastRead -1 FirstWrite 5}
		mn6_60_out {Type O LastRead -1 FirstWrite 5}
		mn6_59_out {Type O LastRead -1 FirstWrite 5}
		mn6_58_out {Type O LastRead -1 FirstWrite 5}
		mn6_57_out {Type O LastRead -1 FirstWrite 5}
		mn6_56_out {Type O LastRead -1 FirstWrite 5}
		mn6_55_out {Type O LastRead -1 FirstWrite 5}
		mn6_54_out {Type O LastRead -1 FirstWrite 5}
		mn6_53_out {Type O LastRead -1 FirstWrite 5}
		mn6_52_out {Type O LastRead -1 FirstWrite 5}
		mn6_51_out {Type O LastRead -1 FirstWrite 5}
		mn6_50_out {Type O LastRead -1 FirstWrite 5}
		mn6_49_out {Type O LastRead -1 FirstWrite 5}
		mn6_48_out {Type O LastRead -1 FirstWrite 5}
		mn6_47_out {Type O LastRead -1 FirstWrite 5}
		mn6_46_out {Type O LastRead -1 FirstWrite 5}
		mn6_45_out {Type O LastRead -1 FirstWrite 5}
		mn6_44_out {Type O LastRead -1 FirstWrite 5}
		mn6_43_out {Type O LastRead -1 FirstWrite 5}
		mn6_42_out {Type O LastRead -1 FirstWrite 5}
		mn6_41_out {Type O LastRead -1 FirstWrite 5}
		mn6_40_out {Type O LastRead -1 FirstWrite 5}
		mn6_39_out {Type O LastRead -1 FirstWrite 5}
		mn6_38_out {Type O LastRead -1 FirstWrite 5}
		mn6_37_out {Type O LastRead -1 FirstWrite 5}
		mn6_36_out {Type O LastRead -1 FirstWrite 5}
		mn6_35_out {Type O LastRead -1 FirstWrite 5}
		mn6_34_out {Type O LastRead -1 FirstWrite 5}
		mn6_33_out {Type O LastRead -1 FirstWrite 5}
		mn6_32_out {Type O LastRead -1 FirstWrite 5}
		mn6_31_out {Type O LastRead -1 FirstWrite 5}
		mn6_30_out {Type O LastRead -1 FirstWrite 5}
		mn6_29_out {Type O LastRead -1 FirstWrite 5}
		mn6_28_out {Type O LastRead -1 FirstWrite 5}
		mn6_27_out {Type O LastRead -1 FirstWrite 5}
		mn6_26_out {Type O LastRead -1 FirstWrite 5}
		mn6_25_out {Type O LastRead -1 FirstWrite 5}
		mn6_24_out {Type O LastRead -1 FirstWrite 5}
		mn6_23_out {Type O LastRead -1 FirstWrite 5}
		mn6_22_out {Type O LastRead -1 FirstWrite 5}
		mn6_21_out {Type O LastRead -1 FirstWrite 5}
		mn6_20_out {Type O LastRead -1 FirstWrite 5}
		mn6_19_out {Type O LastRead -1 FirstWrite 5}
		mn6_18_out {Type O LastRead -1 FirstWrite 5}
		mn6_17_out {Type O LastRead -1 FirstWrite 5}
		mn6_16_out {Type O LastRead -1 FirstWrite 5}
		mn6_15_out {Type O LastRead -1 FirstWrite 5}
		mn6_14_out {Type O LastRead -1 FirstWrite 5}
		mn6_13_out {Type O LastRead -1 FirstWrite 5}
		mn6_12_out {Type O LastRead -1 FirstWrite 5}
		mn6_11_out {Type O LastRead -1 FirstWrite 5}
		mn6_10_out {Type O LastRead -1 FirstWrite 5}
		mn6_9_out {Type O LastRead -1 FirstWrite 5}
		mn6_8_out {Type O LastRead -1 FirstWrite 5}
		mn6_7_out {Type O LastRead -1 FirstWrite 5}
		mn6_6_out {Type O LastRead -1 FirstWrite 5}
		mn6_5_out {Type O LastRead -1 FirstWrite 5}
		mn6_4_out {Type O LastRead -1 FirstWrite 5}
		mn6_3_out {Type O LastRead -1 FirstWrite 5}
		mn6_2_out {Type O LastRead -1 FirstWrite 5}
		mn6_1_out {Type O LastRead -1 FirstWrite 5}
		mn6_out {Type O LastRead -1 FirstWrite 5}
		sc6_63_out {Type O LastRead -1 FirstWrite 5}
		sc6_62_out {Type O LastRead -1 FirstWrite 5}
		sc6_61_out {Type O LastRead -1 FirstWrite 5}
		sc6_60_out {Type O LastRead -1 FirstWrite 5}
		sc6_59_out {Type O LastRead -1 FirstWrite 5}
		sc6_58_out {Type O LastRead -1 FirstWrite 5}
		sc6_57_out {Type O LastRead -1 FirstWrite 5}
		sc6_56_out {Type O LastRead -1 FirstWrite 5}
		sc6_55_out {Type O LastRead -1 FirstWrite 5}
		sc6_54_out {Type O LastRead -1 FirstWrite 5}
		sc6_53_out {Type O LastRead -1 FirstWrite 5}
		sc6_52_out {Type O LastRead -1 FirstWrite 5}
		sc6_51_out {Type O LastRead -1 FirstWrite 5}
		sc6_50_out {Type O LastRead -1 FirstWrite 5}
		sc6_49_out {Type O LastRead -1 FirstWrite 5}
		sc6_48_out {Type O LastRead -1 FirstWrite 5}
		sc6_47_out {Type O LastRead -1 FirstWrite 5}
		sc6_46_out {Type O LastRead -1 FirstWrite 5}
		sc6_45_out {Type O LastRead -1 FirstWrite 5}
		sc6_44_out {Type O LastRead -1 FirstWrite 5}
		sc6_43_out {Type O LastRead -1 FirstWrite 5}
		sc6_42_out {Type O LastRead -1 FirstWrite 5}
		sc6_41_out {Type O LastRead -1 FirstWrite 5}
		sc6_40_out {Type O LastRead -1 FirstWrite 5}
		sc6_39_out {Type O LastRead -1 FirstWrite 5}
		sc6_38_out {Type O LastRead -1 FirstWrite 5}
		sc6_37_out {Type O LastRead -1 FirstWrite 5}
		sc6_36_out {Type O LastRead -1 FirstWrite 5}
		sc6_35_out {Type O LastRead -1 FirstWrite 5}
		sc6_34_out {Type O LastRead -1 FirstWrite 5}
		sc6_33_out {Type O LastRead -1 FirstWrite 5}
		sc6_32_out {Type O LastRead -1 FirstWrite 5}
		sc6_31_out {Type O LastRead -1 FirstWrite 5}
		sc6_30_out {Type O LastRead -1 FirstWrite 5}
		sc6_29_out {Type O LastRead -1 FirstWrite 5}
		sc6_28_out {Type O LastRead -1 FirstWrite 5}
		sc6_27_out {Type O LastRead -1 FirstWrite 5}
		sc6_26_out {Type O LastRead -1 FirstWrite 5}
		sc6_25_out {Type O LastRead -1 FirstWrite 5}
		sc6_24_out {Type O LastRead -1 FirstWrite 5}
		sc6_23_out {Type O LastRead -1 FirstWrite 5}
		sc6_22_out {Type O LastRead -1 FirstWrite 5}
		sc6_21_out {Type O LastRead -1 FirstWrite 5}
		sc6_20_out {Type O LastRead -1 FirstWrite 5}
		sc6_19_out {Type O LastRead -1 FirstWrite 5}
		sc6_18_out {Type O LastRead -1 FirstWrite 5}
		sc6_17_out {Type O LastRead -1 FirstWrite 5}
		sc6_16_out {Type O LastRead -1 FirstWrite 5}
		sc6_15_out {Type O LastRead -1 FirstWrite 5}
		sc6_14_out {Type O LastRead -1 FirstWrite 5}
		sc6_13_out {Type O LastRead -1 FirstWrite 5}
		sc6_12_out {Type O LastRead -1 FirstWrite 5}
		sc6_11_out {Type O LastRead -1 FirstWrite 5}
		sc6_10_out {Type O LastRead -1 FirstWrite 5}
		sc6_9_out {Type O LastRead -1 FirstWrite 5}
		sc6_8_out {Type O LastRead -1 FirstWrite 5}
		sc6_7_out {Type O LastRead -1 FirstWrite 5}
		sc6_6_out {Type O LastRead -1 FirstWrite 5}
		sc6_5_out {Type O LastRead -1 FirstWrite 5}
		sc6_4_out {Type O LastRead -1 FirstWrite 5}
		sc6_3_out {Type O LastRead -1 FirstWrite 5}
		sc6_2_out {Type O LastRead -1 FirstWrite 5}
		sc6_1_out {Type O LastRead -1 FirstWrite 5}
		sc6_out {Type O LastRead -1 FirstWrite 5}
		mux_case_784047_out {Type O LastRead -1 FirstWrite 5}
		mux_case_683944_out {Type O LastRead -1 FirstWrite 5}
		mux_case_583841_out {Type O LastRead -1 FirstWrite 5}
		mux_case_483738_out {Type O LastRead -1 FirstWrite 5}
		mux_case_383635_out {Type O LastRead -1 FirstWrite 5}
		mux_case_283532_out {Type O LastRead -1 FirstWrite 5}
		mux_case_183429_out {Type O LastRead -1 FirstWrite 5}
		mux_case_083326_out {Type O LastRead -1 FirstWrite 5}
		mux_case_783222_out {Type O LastRead -1 FirstWrite 5}
		mux_case_683119_out {Type O LastRead -1 FirstWrite 5}
		mux_case_583016_out {Type O LastRead -1 FirstWrite 5}
		mux_case_482913_out {Type O LastRead -1 FirstWrite 5}
		mux_case_382810_out {Type O LastRead -1 FirstWrite 5}
		mux_case_28277_out {Type O LastRead -1 FirstWrite 5}
		mux_case_18264_out {Type O LastRead -1 FirstWrite 5}
		mux_case_08251_out {Type O LastRead -1 FirstWrite 5}}
	fp16_to_fp32 {
		h {Type I LastRead 0 FirstWrite -1}}
	fp16_to_fp32 {
		h {Type I LastRead 0 FirstWrite -1}}
	mac_blocks_wv_k1_Pipeline_MAC_ALL_K1 {
		x_0_0 {Type I LastRead 1 FirstWrite -1}
		x_0_1 {Type I LastRead 1 FirstWrite -1}
		x_0_2 {Type I LastRead 1 FirstWrite -1}
		x_0_3 {Type I LastRead 1 FirstWrite -1}
		x_0_4 {Type I LastRead 1 FirstWrite -1}
		x_0_5 {Type I LastRead 1 FirstWrite -1}
		x_0_6 {Type I LastRead 1 FirstWrite -1}
		x_0_7 {Type I LastRead 1 FirstWrite -1}
		x_0_8 {Type I LastRead 1 FirstWrite -1}
		x_0_9 {Type I LastRead 1 FirstWrite -1}
		x_0_10 {Type I LastRead 1 FirstWrite -1}
		x_0_11 {Type I LastRead 1 FirstWrite -1}
		x_0_12 {Type I LastRead 1 FirstWrite -1}
		x_0_13 {Type I LastRead 1 FirstWrite -1}
		x_0_14 {Type I LastRead 1 FirstWrite -1}
		x_0_15 {Type I LastRead 1 FirstWrite -1}
		rb_0 {Type I LastRead 1 FirstWrite -1}
		empty_43 {Type I LastRead 0 FirstWrite -1}
		empty_44 {Type I LastRead 0 FirstWrite -1}
		empty_45 {Type I LastRead 0 FirstWrite -1}
		empty_46 {Type I LastRead 0 FirstWrite -1}
		empty_47 {Type I LastRead 0 FirstWrite -1}
		empty_48 {Type I LastRead 0 FirstWrite -1}
		empty_49 {Type I LastRead 0 FirstWrite -1}
		empty_50 {Type I LastRead 0 FirstWrite -1}
		empty_51 {Type I LastRead 0 FirstWrite -1}
		empty_52 {Type I LastRead 0 FirstWrite -1}
		empty_53 {Type I LastRead 0 FirstWrite -1}
		empty_54 {Type I LastRead 0 FirstWrite -1}
		empty_55 {Type I LastRead 0 FirstWrite -1}
		empty_56 {Type I LastRead 0 FirstWrite -1}
		empty_57 {Type I LastRead 0 FirstWrite -1}
		empty_58 {Type I LastRead 0 FirstWrite -1}
		x_1_0 {Type I LastRead 1 FirstWrite -1}
		x_1_1 {Type I LastRead 1 FirstWrite -1}
		x_1_2 {Type I LastRead 1 FirstWrite -1}
		x_1_3 {Type I LastRead 1 FirstWrite -1}
		x_1_4 {Type I LastRead 1 FirstWrite -1}
		x_1_5 {Type I LastRead 1 FirstWrite -1}
		x_1_6 {Type I LastRead 1 FirstWrite -1}
		x_1_7 {Type I LastRead 1 FirstWrite -1}
		x_1_8 {Type I LastRead 1 FirstWrite -1}
		x_1_9 {Type I LastRead 1 FirstWrite -1}
		x_1_10 {Type I LastRead 1 FirstWrite -1}
		x_1_11 {Type I LastRead 1 FirstWrite -1}
		x_1_12 {Type I LastRead 1 FirstWrite -1}
		x_1_13 {Type I LastRead 1 FirstWrite -1}
		x_1_14 {Type I LastRead 1 FirstWrite -1}
		x_1_15 {Type I LastRead 1 FirstWrite -1}
		rb_1 {Type I LastRead 1 FirstWrite -1}
		x_2_0 {Type I LastRead 1 FirstWrite -1}
		x_2_1 {Type I LastRead 1 FirstWrite -1}
		x_2_2 {Type I LastRead 1 FirstWrite -1}
		x_2_3 {Type I LastRead 1 FirstWrite -1}
		x_2_4 {Type I LastRead 1 FirstWrite -1}
		x_2_5 {Type I LastRead 1 FirstWrite -1}
		x_2_6 {Type I LastRead 1 FirstWrite -1}
		x_2_7 {Type I LastRead 1 FirstWrite -1}
		x_2_8 {Type I LastRead 1 FirstWrite -1}
		x_2_9 {Type I LastRead 1 FirstWrite -1}
		x_2_10 {Type I LastRead 1 FirstWrite -1}
		x_2_11 {Type I LastRead 1 FirstWrite -1}
		x_2_12 {Type I LastRead 1 FirstWrite -1}
		x_2_13 {Type I LastRead 1 FirstWrite -1}
		x_2_14 {Type I LastRead 1 FirstWrite -1}
		x_2_15 {Type I LastRead 1 FirstWrite -1}
		rb_2 {Type I LastRead 1 FirstWrite -1}
		x_3_0 {Type I LastRead 1 FirstWrite -1}
		x_3_1 {Type I LastRead 1 FirstWrite -1}
		x_3_2 {Type I LastRead 1 FirstWrite -1}
		x_3_3 {Type I LastRead 1 FirstWrite -1}
		x_3_4 {Type I LastRead 1 FirstWrite -1}
		x_3_5 {Type I LastRead 1 FirstWrite -1}
		x_3_6 {Type I LastRead 1 FirstWrite -1}
		x_3_7 {Type I LastRead 1 FirstWrite -1}
		x_3_8 {Type I LastRead 1 FirstWrite -1}
		x_3_9 {Type I LastRead 1 FirstWrite -1}
		x_3_10 {Type I LastRead 1 FirstWrite -1}
		x_3_11 {Type I LastRead 1 FirstWrite -1}
		x_3_12 {Type I LastRead 1 FirstWrite -1}
		x_3_13 {Type I LastRead 1 FirstWrite -1}
		x_3_14 {Type I LastRead 1 FirstWrite -1}
		x_3_15 {Type I LastRead 1 FirstWrite -1}
		rb_3 {Type I LastRead 1 FirstWrite -1}
		x_4_0 {Type I LastRead 1 FirstWrite -1}
		x_4_1 {Type I LastRead 1 FirstWrite -1}
		x_4_2 {Type I LastRead 1 FirstWrite -1}
		x_4_3 {Type I LastRead 1 FirstWrite -1}
		x_4_4 {Type I LastRead 1 FirstWrite -1}
		x_4_5 {Type I LastRead 1 FirstWrite -1}
		x_4_6 {Type I LastRead 1 FirstWrite -1}
		x_4_7 {Type I LastRead 1 FirstWrite -1}
		x_4_8 {Type I LastRead 1 FirstWrite -1}
		x_4_9 {Type I LastRead 1 FirstWrite -1}
		x_4_10 {Type I LastRead 1 FirstWrite -1}
		x_4_11 {Type I LastRead 1 FirstWrite -1}
		x_4_12 {Type I LastRead 1 FirstWrite -1}
		x_4_13 {Type I LastRead 1 FirstWrite -1}
		x_4_14 {Type I LastRead 1 FirstWrite -1}
		x_4_15 {Type I LastRead 1 FirstWrite -1}
		rb_4 {Type I LastRead 1 FirstWrite -1}
		x_5_0 {Type I LastRead 1 FirstWrite -1}
		x_5_1 {Type I LastRead 1 FirstWrite -1}
		x_5_2 {Type I LastRead 1 FirstWrite -1}
		x_5_3 {Type I LastRead 1 FirstWrite -1}
		x_5_4 {Type I LastRead 1 FirstWrite -1}
		x_5_5 {Type I LastRead 1 FirstWrite -1}
		x_5_6 {Type I LastRead 1 FirstWrite -1}
		x_5_7 {Type I LastRead 1 FirstWrite -1}
		x_5_8 {Type I LastRead 1 FirstWrite -1}
		x_5_9 {Type I LastRead 1 FirstWrite -1}
		x_5_10 {Type I LastRead 1 FirstWrite -1}
		x_5_11 {Type I LastRead 1 FirstWrite -1}
		x_5_12 {Type I LastRead 1 FirstWrite -1}
		x_5_13 {Type I LastRead 1 FirstWrite -1}
		x_5_14 {Type I LastRead 1 FirstWrite -1}
		x_5_15 {Type I LastRead 1 FirstWrite -1}
		rb_5 {Type I LastRead 1 FirstWrite -1}
		x_6_0 {Type I LastRead 1 FirstWrite -1}
		x_6_1 {Type I LastRead 1 FirstWrite -1}
		x_6_2 {Type I LastRead 1 FirstWrite -1}
		x_6_3 {Type I LastRead 1 FirstWrite -1}
		x_6_4 {Type I LastRead 1 FirstWrite -1}
		x_6_5 {Type I LastRead 1 FirstWrite -1}
		x_6_6 {Type I LastRead 1 FirstWrite -1}
		x_6_7 {Type I LastRead 1 FirstWrite -1}
		x_6_8 {Type I LastRead 1 FirstWrite -1}
		x_6_9 {Type I LastRead 1 FirstWrite -1}
		x_6_10 {Type I LastRead 1 FirstWrite -1}
		x_6_11 {Type I LastRead 1 FirstWrite -1}
		x_6_12 {Type I LastRead 1 FirstWrite -1}
		x_6_13 {Type I LastRead 1 FirstWrite -1}
		x_6_14 {Type I LastRead 1 FirstWrite -1}
		x_6_15 {Type I LastRead 1 FirstWrite -1}
		rb_6 {Type I LastRead 1 FirstWrite -1}
		x_7_0 {Type I LastRead 1 FirstWrite -1}
		x_7_1 {Type I LastRead 1 FirstWrite -1}
		x_7_2 {Type I LastRead 1 FirstWrite -1}
		x_7_3 {Type I LastRead 1 FirstWrite -1}
		x_7_4 {Type I LastRead 1 FirstWrite -1}
		x_7_5 {Type I LastRead 1 FirstWrite -1}
		x_7_6 {Type I LastRead 1 FirstWrite -1}
		x_7_7 {Type I LastRead 1 FirstWrite -1}
		x_7_8 {Type I LastRead 1 FirstWrite -1}
		x_7_9 {Type I LastRead 1 FirstWrite -1}
		x_7_10 {Type I LastRead 1 FirstWrite -1}
		x_7_11 {Type I LastRead 1 FirstWrite -1}
		x_7_12 {Type I LastRead 1 FirstWrite -1}
		x_7_13 {Type I LastRead 1 FirstWrite -1}
		x_7_14 {Type I LastRead 1 FirstWrite -1}
		x_7_15 {Type I LastRead 1 FirstWrite -1}
		rb_7 {Type I LastRead 1 FirstWrite -1}
		empty_59 {Type I LastRead 0 FirstWrite -1}
		empty_60 {Type I LastRead 0 FirstWrite -1}
		empty_61 {Type I LastRead 0 FirstWrite -1}
		empty_62 {Type I LastRead 0 FirstWrite -1}
		empty_63 {Type I LastRead 0 FirstWrite -1}
		empty_64 {Type I LastRead 0 FirstWrite -1}
		empty_65 {Type I LastRead 0 FirstWrite -1}
		empty_66 {Type I LastRead 0 FirstWrite -1}
		empty_67 {Type I LastRead 0 FirstWrite -1}
		empty_68 {Type I LastRead 0 FirstWrite -1}
		empty_69 {Type I LastRead 0 FirstWrite -1}
		empty_70 {Type I LastRead 0 FirstWrite -1}
		empty_71 {Type I LastRead 0 FirstWrite -1}
		empty_72 {Type I LastRead 0 FirstWrite -1}
		empty_73 {Type I LastRead 0 FirstWrite -1}
		empty_74 {Type I LastRead 0 FirstWrite -1}
		empty_75 {Type I LastRead 0 FirstWrite -1}
		empty_76 {Type I LastRead 0 FirstWrite -1}
		empty_77 {Type I LastRead 0 FirstWrite -1}
		empty_78 {Type I LastRead 0 FirstWrite -1}
		empty_79 {Type I LastRead 0 FirstWrite -1}
		empty_80 {Type I LastRead 0 FirstWrite -1}
		empty_81 {Type I LastRead 0 FirstWrite -1}
		empty_82 {Type I LastRead 0 FirstWrite -1}
		empty_83 {Type I LastRead 0 FirstWrite -1}
		empty_84 {Type I LastRead 0 FirstWrite -1}
		empty_85 {Type I LastRead 0 FirstWrite -1}
		empty_86 {Type I LastRead 0 FirstWrite -1}
		empty_87 {Type I LastRead 0 FirstWrite -1}
		empty_88 {Type I LastRead 0 FirstWrite -1}
		empty_89 {Type I LastRead 0 FirstWrite -1}
		empty_90 {Type I LastRead 0 FirstWrite -1}
		empty_91 {Type I LastRead 0 FirstWrite -1}
		empty_92 {Type I LastRead 0 FirstWrite -1}
		empty_93 {Type I LastRead 0 FirstWrite -1}
		empty_94 {Type I LastRead 0 FirstWrite -1}
		empty_95 {Type I LastRead 0 FirstWrite -1}
		empty_96 {Type I LastRead 0 FirstWrite -1}
		empty_97 {Type I LastRead 0 FirstWrite -1}
		empty_98 {Type I LastRead 0 FirstWrite -1}
		empty_99 {Type I LastRead 0 FirstWrite -1}
		empty_100 {Type I LastRead 0 FirstWrite -1}
		empty_101 {Type I LastRead 0 FirstWrite -1}
		empty_102 {Type I LastRead 0 FirstWrite -1}
		empty_103 {Type I LastRead 0 FirstWrite -1}
		empty_104 {Type I LastRead 0 FirstWrite -1}
		empty_105 {Type I LastRead 0 FirstWrite -1}
		empty_106 {Type I LastRead 0 FirstWrite -1}
		empty_107 {Type I LastRead 0 FirstWrite -1}
		empty_108 {Type I LastRead 0 FirstWrite -1}
		empty_109 {Type I LastRead 0 FirstWrite -1}
		empty_110 {Type I LastRead 0 FirstWrite -1}
		empty_111 {Type I LastRead 0 FirstWrite -1}
		empty_112 {Type I LastRead 0 FirstWrite -1}
		empty_113 {Type I LastRead 0 FirstWrite -1}
		empty_114 {Type I LastRead 0 FirstWrite -1}
		empty_115 {Type I LastRead 0 FirstWrite -1}
		empty_116 {Type I LastRead 0 FirstWrite -1}
		empty_117 {Type I LastRead 0 FirstWrite -1}
		empty_118 {Type I LastRead 0 FirstWrite -1}
		empty_119 {Type I LastRead 0 FirstWrite -1}
		empty_120 {Type I LastRead 0 FirstWrite -1}
		empty_121 {Type I LastRead 0 FirstWrite -1}
		empty_122 {Type I LastRead 0 FirstWrite -1}
		empty_123 {Type I LastRead 0 FirstWrite -1}
		empty_124 {Type I LastRead 0 FirstWrite -1}
		empty_125 {Type I LastRead 0 FirstWrite -1}
		empty_126 {Type I LastRead 0 FirstWrite -1}
		empty_127 {Type I LastRead 0 FirstWrite -1}
		empty_128 {Type I LastRead 0 FirstWrite -1}
		empty_129 {Type I LastRead 0 FirstWrite -1}
		empty_130 {Type I LastRead 0 FirstWrite -1}
		empty_131 {Type I LastRead 0 FirstWrite -1}
		empty_132 {Type I LastRead 0 FirstWrite -1}
		empty_133 {Type I LastRead 0 FirstWrite -1}
		empty_134 {Type I LastRead 0 FirstWrite -1}
		empty_135 {Type I LastRead 0 FirstWrite -1}
		empty_136 {Type I LastRead 0 FirstWrite -1}
		empty_137 {Type I LastRead 0 FirstWrite -1}
		empty_138 {Type I LastRead 0 FirstWrite -1}
		empty_139 {Type I LastRead 0 FirstWrite -1}
		empty_140 {Type I LastRead 0 FirstWrite -1}
		empty_141 {Type I LastRead 0 FirstWrite -1}
		empty_142 {Type I LastRead 0 FirstWrite -1}
		empty_143 {Type I LastRead 0 FirstWrite -1}
		empty_144 {Type I LastRead 0 FirstWrite -1}
		empty_145 {Type I LastRead 0 FirstWrite -1}
		empty_146 {Type I LastRead 0 FirstWrite -1}
		empty_147 {Type I LastRead 0 FirstWrite -1}
		empty_148 {Type I LastRead 0 FirstWrite -1}
		empty_149 {Type I LastRead 0 FirstWrite -1}
		empty_150 {Type I LastRead 0 FirstWrite -1}
		empty_151 {Type I LastRead 0 FirstWrite -1}
		empty_152 {Type I LastRead 0 FirstWrite -1}
		empty_153 {Type I LastRead 0 FirstWrite -1}
		empty_154 {Type I LastRead 0 FirstWrite -1}
		empty_155 {Type I LastRead 0 FirstWrite -1}
		empty_156 {Type I LastRead 0 FirstWrite -1}
		empty_157 {Type I LastRead 0 FirstWrite -1}
		empty_158 {Type I LastRead 0 FirstWrite -1}
		empty_159 {Type I LastRead 0 FirstWrite -1}
		empty_160 {Type I LastRead 0 FirstWrite -1}
		empty_161 {Type I LastRead 0 FirstWrite -1}
		empty_162 {Type I LastRead 0 FirstWrite -1}
		empty_163 {Type I LastRead 0 FirstWrite -1}
		empty_164 {Type I LastRead 0 FirstWrite -1}
		empty_165 {Type I LastRead 0 FirstWrite -1}
		empty_166 {Type I LastRead 0 FirstWrite -1}
		empty_167 {Type I LastRead 0 FirstWrite -1}
		empty_168 {Type I LastRead 0 FirstWrite -1}
		empty_169 {Type I LastRead 0 FirstWrite -1}
		empty {Type I LastRead 0 FirstWrite -1}
		int_acc_w_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_w_1_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_w_2_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_w_3_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_w_4_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_w_5_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_w_6_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_w_7_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_w_8_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_w_9_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_w_10_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_w_11_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_w_12_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_w_13_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_w_14_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_w_15_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_w_16_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_w_17_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_w_18_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_w_19_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_w_20_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_w_21_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_w_22_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_w_23_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_w_24_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_w_25_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_w_26_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_w_27_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_w_28_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_w_29_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_w_30_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_w_31_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_w_32_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_w_33_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_w_34_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_w_35_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_w_36_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_w_37_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_w_38_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_w_39_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_w_40_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_w_41_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_w_42_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_w_43_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_w_44_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_w_45_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_w_46_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_w_47_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_w_48_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_w_49_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_w_50_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_w_51_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_w_52_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_w_53_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_w_54_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_w_55_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_w_56_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_w_57_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_w_58_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_w_59_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_w_60_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_w_61_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_w_62_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_w_63_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_m_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_m_1_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_m_2_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_m_3_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_m_4_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_m_5_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_m_6_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_m_7_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_m_8_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_m_9_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_m_10_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_m_11_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_m_12_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_m_13_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_m_14_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_m_15_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_m_16_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_m_17_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_m_18_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_m_19_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_m_20_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_m_21_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_m_22_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_m_23_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_m_24_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_m_25_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_m_26_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_m_27_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_m_28_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_m_29_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_m_30_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_m_31_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_m_32_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_m_33_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_m_34_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_m_35_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_m_36_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_m_37_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_m_38_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_m_39_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_m_40_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_m_41_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_m_42_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_m_43_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_m_44_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_m_45_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_m_46_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_m_47_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_m_48_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_m_49_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_m_50_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_m_51_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_m_52_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_m_53_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_m_54_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_m_55_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_m_56_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_m_57_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_m_58_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_m_59_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_m_60_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_m_61_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_m_62_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_m_63_load_out {Type O LastRead -1 FirstWrite 6}}
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
		total_out {Type O LastRead -1 FirstWrite 9}}
	compute_X2 {
		gmem_V {Type I LastRead 1 FirstWrite -1}
		V {Type I LastRead 0 FirstWrite -1}
		x_local_2_0_0 {Type I LastRead 1 FirstWrite -1}
		x_local_2_0_1 {Type I LastRead 1 FirstWrite -1}
		x_local_2_0_2 {Type I LastRead 1 FirstWrite -1}
		x_local_2_0_3 {Type I LastRead 1 FirstWrite -1}
		x_local_2_0_4 {Type I LastRead 1 FirstWrite -1}
		x_local_2_0_5 {Type I LastRead 1 FirstWrite -1}
		x_local_2_0_6 {Type I LastRead 1 FirstWrite -1}
		x_local_2_0_7 {Type I LastRead 1 FirstWrite -1}
		x_local_2_0_8 {Type I LastRead 1 FirstWrite -1}
		x_local_2_0_9 {Type I LastRead 1 FirstWrite -1}
		x_local_2_0_10 {Type I LastRead 1 FirstWrite -1}
		x_local_2_0_11 {Type I LastRead 1 FirstWrite -1}
		x_local_2_0_12 {Type I LastRead 1 FirstWrite -1}
		x_local_2_0_13 {Type I LastRead 1 FirstWrite -1}
		x_local_2_0_14 {Type I LastRead 1 FirstWrite -1}
		x_local_2_0_15 {Type I LastRead 1 FirstWrite -1}
		x_local_2_1_0 {Type I LastRead 1 FirstWrite -1}
		x_local_2_1_1 {Type I LastRead 1 FirstWrite -1}
		x_local_2_1_2 {Type I LastRead 1 FirstWrite -1}
		x_local_2_1_3 {Type I LastRead 1 FirstWrite -1}
		x_local_2_1_4 {Type I LastRead 1 FirstWrite -1}
		x_local_2_1_5 {Type I LastRead 1 FirstWrite -1}
		x_local_2_1_6 {Type I LastRead 1 FirstWrite -1}
		x_local_2_1_7 {Type I LastRead 1 FirstWrite -1}
		x_local_2_1_8 {Type I LastRead 1 FirstWrite -1}
		x_local_2_1_9 {Type I LastRead 1 FirstWrite -1}
		x_local_2_1_10 {Type I LastRead 1 FirstWrite -1}
		x_local_2_1_11 {Type I LastRead 1 FirstWrite -1}
		x_local_2_1_12 {Type I LastRead 1 FirstWrite -1}
		x_local_2_1_13 {Type I LastRead 1 FirstWrite -1}
		x_local_2_1_14 {Type I LastRead 1 FirstWrite -1}
		x_local_2_1_15 {Type I LastRead 1 FirstWrite -1}
		x_local_2_2_0 {Type I LastRead 1 FirstWrite -1}
		x_local_2_2_1 {Type I LastRead 1 FirstWrite -1}
		x_local_2_2_2 {Type I LastRead 1 FirstWrite -1}
		x_local_2_2_3 {Type I LastRead 1 FirstWrite -1}
		x_local_2_2_4 {Type I LastRead 1 FirstWrite -1}
		x_local_2_2_5 {Type I LastRead 1 FirstWrite -1}
		x_local_2_2_6 {Type I LastRead 1 FirstWrite -1}
		x_local_2_2_7 {Type I LastRead 1 FirstWrite -1}
		x_local_2_2_8 {Type I LastRead 1 FirstWrite -1}
		x_local_2_2_9 {Type I LastRead 1 FirstWrite -1}
		x_local_2_2_10 {Type I LastRead 1 FirstWrite -1}
		x_local_2_2_11 {Type I LastRead 1 FirstWrite -1}
		x_local_2_2_12 {Type I LastRead 1 FirstWrite -1}
		x_local_2_2_13 {Type I LastRead 1 FirstWrite -1}
		x_local_2_2_14 {Type I LastRead 1 FirstWrite -1}
		x_local_2_2_15 {Type I LastRead 1 FirstWrite -1}
		x_local_2_3_0 {Type I LastRead 1 FirstWrite -1}
		x_local_2_3_1 {Type I LastRead 1 FirstWrite -1}
		x_local_2_3_2 {Type I LastRead 1 FirstWrite -1}
		x_local_2_3_3 {Type I LastRead 1 FirstWrite -1}
		x_local_2_3_4 {Type I LastRead 1 FirstWrite -1}
		x_local_2_3_5 {Type I LastRead 1 FirstWrite -1}
		x_local_2_3_6 {Type I LastRead 1 FirstWrite -1}
		x_local_2_3_7 {Type I LastRead 1 FirstWrite -1}
		x_local_2_3_8 {Type I LastRead 1 FirstWrite -1}
		x_local_2_3_9 {Type I LastRead 1 FirstWrite -1}
		x_local_2_3_10 {Type I LastRead 1 FirstWrite -1}
		x_local_2_3_11 {Type I LastRead 1 FirstWrite -1}
		x_local_2_3_12 {Type I LastRead 1 FirstWrite -1}
		x_local_2_3_13 {Type I LastRead 1 FirstWrite -1}
		x_local_2_3_14 {Type I LastRead 1 FirstWrite -1}
		x_local_2_3_15 {Type I LastRead 1 FirstWrite -1}
		x_local_2_4_0 {Type I LastRead 1 FirstWrite -1}
		x_local_2_4_1 {Type I LastRead 1 FirstWrite -1}
		x_local_2_4_2 {Type I LastRead 1 FirstWrite -1}
		x_local_2_4_3 {Type I LastRead 1 FirstWrite -1}
		x_local_2_4_4 {Type I LastRead 1 FirstWrite -1}
		x_local_2_4_5 {Type I LastRead 1 FirstWrite -1}
		x_local_2_4_6 {Type I LastRead 1 FirstWrite -1}
		x_local_2_4_7 {Type I LastRead 1 FirstWrite -1}
		x_local_2_4_8 {Type I LastRead 1 FirstWrite -1}
		x_local_2_4_9 {Type I LastRead 1 FirstWrite -1}
		x_local_2_4_10 {Type I LastRead 1 FirstWrite -1}
		x_local_2_4_11 {Type I LastRead 1 FirstWrite -1}
		x_local_2_4_12 {Type I LastRead 1 FirstWrite -1}
		x_local_2_4_13 {Type I LastRead 1 FirstWrite -1}
		x_local_2_4_14 {Type I LastRead 1 FirstWrite -1}
		x_local_2_4_15 {Type I LastRead 1 FirstWrite -1}
		x_local_2_5_0 {Type I LastRead 1 FirstWrite -1}
		x_local_2_5_1 {Type I LastRead 1 FirstWrite -1}
		x_local_2_5_2 {Type I LastRead 1 FirstWrite -1}
		x_local_2_5_3 {Type I LastRead 1 FirstWrite -1}
		x_local_2_5_4 {Type I LastRead 1 FirstWrite -1}
		x_local_2_5_5 {Type I LastRead 1 FirstWrite -1}
		x_local_2_5_6 {Type I LastRead 1 FirstWrite -1}
		x_local_2_5_7 {Type I LastRead 1 FirstWrite -1}
		x_local_2_5_8 {Type I LastRead 1 FirstWrite -1}
		x_local_2_5_9 {Type I LastRead 1 FirstWrite -1}
		x_local_2_5_10 {Type I LastRead 1 FirstWrite -1}
		x_local_2_5_11 {Type I LastRead 1 FirstWrite -1}
		x_local_2_5_12 {Type I LastRead 1 FirstWrite -1}
		x_local_2_5_13 {Type I LastRead 1 FirstWrite -1}
		x_local_2_5_14 {Type I LastRead 1 FirstWrite -1}
		x_local_2_5_15 {Type I LastRead 1 FirstWrite -1}
		x_local_2_6_0 {Type I LastRead 1 FirstWrite -1}
		x_local_2_6_1 {Type I LastRead 1 FirstWrite -1}
		x_local_2_6_2 {Type I LastRead 1 FirstWrite -1}
		x_local_2_6_3 {Type I LastRead 1 FirstWrite -1}
		x_local_2_6_4 {Type I LastRead 1 FirstWrite -1}
		x_local_2_6_5 {Type I LastRead 1 FirstWrite -1}
		x_local_2_6_6 {Type I LastRead 1 FirstWrite -1}
		x_local_2_6_7 {Type I LastRead 1 FirstWrite -1}
		x_local_2_6_8 {Type I LastRead 1 FirstWrite -1}
		x_local_2_6_9 {Type I LastRead 1 FirstWrite -1}
		x_local_2_6_10 {Type I LastRead 1 FirstWrite -1}
		x_local_2_6_11 {Type I LastRead 1 FirstWrite -1}
		x_local_2_6_12 {Type I LastRead 1 FirstWrite -1}
		x_local_2_6_13 {Type I LastRead 1 FirstWrite -1}
		x_local_2_6_14 {Type I LastRead 1 FirstWrite -1}
		x_local_2_6_15 {Type I LastRead 1 FirstWrite -1}
		x_local_2_7_0 {Type I LastRead 1 FirstWrite -1}
		x_local_2_7_1 {Type I LastRead 1 FirstWrite -1}
		x_local_2_7_2 {Type I LastRead 1 FirstWrite -1}
		x_local_2_7_3 {Type I LastRead 1 FirstWrite -1}
		x_local_2_7_4 {Type I LastRead 1 FirstWrite -1}
		x_local_2_7_5 {Type I LastRead 1 FirstWrite -1}
		x_local_2_7_6 {Type I LastRead 1 FirstWrite -1}
		x_local_2_7_7 {Type I LastRead 1 FirstWrite -1}
		x_local_2_7_8 {Type I LastRead 1 FirstWrite -1}
		x_local_2_7_9 {Type I LastRead 1 FirstWrite -1}
		x_local_2_7_10 {Type I LastRead 1 FirstWrite -1}
		x_local_2_7_11 {Type I LastRead 1 FirstWrite -1}
		x_local_2_7_12 {Type I LastRead 1 FirstWrite -1}
		x_local_2_7_13 {Type I LastRead 1 FirstWrite -1}
		x_local_2_7_14 {Type I LastRead 1 FirstWrite -1}
		x_local_2_7_15 {Type I LastRead 1 FirstWrite -1}
		x_scale {Type I LastRead 0 FirstWrite -1}
		X2_cache {Type O LastRead -1 FirstWrite 32}}
	load_row_wv {
		gmem_V {Type I LastRead 1 FirstWrite -1}
		W_wide {Type I LastRead 0 FirstWrite -1}
		row {Type I LastRead 0 FirstWrite -1}
		rb_0 {Type O LastRead -1 FirstWrite 2}
		rb_1 {Type O LastRead -1 FirstWrite 2}
		rb_2 {Type O LastRead -1 FirstWrite 2}
		rb_3 {Type O LastRead -1 FirstWrite 2}
		rb_4 {Type O LastRead -1 FirstWrite 2}
		rb_5 {Type O LastRead -1 FirstWrite 2}
		rb_6 {Type O LastRead -1 FirstWrite 2}
		rb_7 {Type O LastRead -1 FirstWrite 2}}
	load_row_wv_Pipeline_LOAD_WV_VITIS_LOOP_95_1 {
		gmem_V {Type I LastRead 1 FirstWrite -1}
		sext_ln94 {Type I LastRead 0 FirstWrite -1}
		rb_7 {Type O LastRead -1 FirstWrite 2}
		rb_6 {Type O LastRead -1 FirstWrite 2}
		rb_5 {Type O LastRead -1 FirstWrite 2}
		rb_4 {Type O LastRead -1 FirstWrite 2}
		rb_3 {Type O LastRead -1 FirstWrite 2}
		rb_2 {Type O LastRead -1 FirstWrite 2}
		rb_1 {Type O LastRead -1 FirstWrite 2}
		rb_0 {Type O LastRead -1 FirstWrite 2}}
	mac_blocks_wv_k1 {
		rb_0 {Type I LastRead 1 FirstWrite -1}
		rb_1 {Type I LastRead 1 FirstWrite -1}
		rb_2 {Type I LastRead 1 FirstWrite -1}
		rb_3 {Type I LastRead 1 FirstWrite -1}
		rb_4 {Type I LastRead 1 FirstWrite -1}
		rb_5 {Type I LastRead 1 FirstWrite -1}
		rb_6 {Type I LastRead 1 FirstWrite -1}
		rb_7 {Type I LastRead 1 FirstWrite -1}
		x_0_0 {Type I LastRead 1 FirstWrite -1}
		x_0_1 {Type I LastRead 1 FirstWrite -1}
		x_0_2 {Type I LastRead 1 FirstWrite -1}
		x_0_3 {Type I LastRead 1 FirstWrite -1}
		x_0_4 {Type I LastRead 1 FirstWrite -1}
		x_0_5 {Type I LastRead 1 FirstWrite -1}
		x_0_6 {Type I LastRead 1 FirstWrite -1}
		x_0_7 {Type I LastRead 1 FirstWrite -1}
		x_0_8 {Type I LastRead 1 FirstWrite -1}
		x_0_9 {Type I LastRead 1 FirstWrite -1}
		x_0_10 {Type I LastRead 1 FirstWrite -1}
		x_0_11 {Type I LastRead 1 FirstWrite -1}
		x_0_12 {Type I LastRead 1 FirstWrite -1}
		x_0_13 {Type I LastRead 1 FirstWrite -1}
		x_0_14 {Type I LastRead 1 FirstWrite -1}
		x_0_15 {Type I LastRead 1 FirstWrite -1}
		x_1_0 {Type I LastRead 1 FirstWrite -1}
		x_1_1 {Type I LastRead 1 FirstWrite -1}
		x_1_2 {Type I LastRead 1 FirstWrite -1}
		x_1_3 {Type I LastRead 1 FirstWrite -1}
		x_1_4 {Type I LastRead 1 FirstWrite -1}
		x_1_5 {Type I LastRead 1 FirstWrite -1}
		x_1_6 {Type I LastRead 1 FirstWrite -1}
		x_1_7 {Type I LastRead 1 FirstWrite -1}
		x_1_8 {Type I LastRead 1 FirstWrite -1}
		x_1_9 {Type I LastRead 1 FirstWrite -1}
		x_1_10 {Type I LastRead 1 FirstWrite -1}
		x_1_11 {Type I LastRead 1 FirstWrite -1}
		x_1_12 {Type I LastRead 1 FirstWrite -1}
		x_1_13 {Type I LastRead 1 FirstWrite -1}
		x_1_14 {Type I LastRead 1 FirstWrite -1}
		x_1_15 {Type I LastRead 1 FirstWrite -1}
		x_2_0 {Type I LastRead 1 FirstWrite -1}
		x_2_1 {Type I LastRead 1 FirstWrite -1}
		x_2_2 {Type I LastRead 1 FirstWrite -1}
		x_2_3 {Type I LastRead 1 FirstWrite -1}
		x_2_4 {Type I LastRead 1 FirstWrite -1}
		x_2_5 {Type I LastRead 1 FirstWrite -1}
		x_2_6 {Type I LastRead 1 FirstWrite -1}
		x_2_7 {Type I LastRead 1 FirstWrite -1}
		x_2_8 {Type I LastRead 1 FirstWrite -1}
		x_2_9 {Type I LastRead 1 FirstWrite -1}
		x_2_10 {Type I LastRead 1 FirstWrite -1}
		x_2_11 {Type I LastRead 1 FirstWrite -1}
		x_2_12 {Type I LastRead 1 FirstWrite -1}
		x_2_13 {Type I LastRead 1 FirstWrite -1}
		x_2_14 {Type I LastRead 1 FirstWrite -1}
		x_2_15 {Type I LastRead 1 FirstWrite -1}
		x_3_0 {Type I LastRead 1 FirstWrite -1}
		x_3_1 {Type I LastRead 1 FirstWrite -1}
		x_3_2 {Type I LastRead 1 FirstWrite -1}
		x_3_3 {Type I LastRead 1 FirstWrite -1}
		x_3_4 {Type I LastRead 1 FirstWrite -1}
		x_3_5 {Type I LastRead 1 FirstWrite -1}
		x_3_6 {Type I LastRead 1 FirstWrite -1}
		x_3_7 {Type I LastRead 1 FirstWrite -1}
		x_3_8 {Type I LastRead 1 FirstWrite -1}
		x_3_9 {Type I LastRead 1 FirstWrite -1}
		x_3_10 {Type I LastRead 1 FirstWrite -1}
		x_3_11 {Type I LastRead 1 FirstWrite -1}
		x_3_12 {Type I LastRead 1 FirstWrite -1}
		x_3_13 {Type I LastRead 1 FirstWrite -1}
		x_3_14 {Type I LastRead 1 FirstWrite -1}
		x_3_15 {Type I LastRead 1 FirstWrite -1}
		x_4_0 {Type I LastRead 1 FirstWrite -1}
		x_4_1 {Type I LastRead 1 FirstWrite -1}
		x_4_2 {Type I LastRead 1 FirstWrite -1}
		x_4_3 {Type I LastRead 1 FirstWrite -1}
		x_4_4 {Type I LastRead 1 FirstWrite -1}
		x_4_5 {Type I LastRead 1 FirstWrite -1}
		x_4_6 {Type I LastRead 1 FirstWrite -1}
		x_4_7 {Type I LastRead 1 FirstWrite -1}
		x_4_8 {Type I LastRead 1 FirstWrite -1}
		x_4_9 {Type I LastRead 1 FirstWrite -1}
		x_4_10 {Type I LastRead 1 FirstWrite -1}
		x_4_11 {Type I LastRead 1 FirstWrite -1}
		x_4_12 {Type I LastRead 1 FirstWrite -1}
		x_4_13 {Type I LastRead 1 FirstWrite -1}
		x_4_14 {Type I LastRead 1 FirstWrite -1}
		x_4_15 {Type I LastRead 1 FirstWrite -1}
		x_5_0 {Type I LastRead 1 FirstWrite -1}
		x_5_1 {Type I LastRead 1 FirstWrite -1}
		x_5_2 {Type I LastRead 1 FirstWrite -1}
		x_5_3 {Type I LastRead 1 FirstWrite -1}
		x_5_4 {Type I LastRead 1 FirstWrite -1}
		x_5_5 {Type I LastRead 1 FirstWrite -1}
		x_5_6 {Type I LastRead 1 FirstWrite -1}
		x_5_7 {Type I LastRead 1 FirstWrite -1}
		x_5_8 {Type I LastRead 1 FirstWrite -1}
		x_5_9 {Type I LastRead 1 FirstWrite -1}
		x_5_10 {Type I LastRead 1 FirstWrite -1}
		x_5_11 {Type I LastRead 1 FirstWrite -1}
		x_5_12 {Type I LastRead 1 FirstWrite -1}
		x_5_13 {Type I LastRead 1 FirstWrite -1}
		x_5_14 {Type I LastRead 1 FirstWrite -1}
		x_5_15 {Type I LastRead 1 FirstWrite -1}
		x_6_0 {Type I LastRead 1 FirstWrite -1}
		x_6_1 {Type I LastRead 1 FirstWrite -1}
		x_6_2 {Type I LastRead 1 FirstWrite -1}
		x_6_3 {Type I LastRead 1 FirstWrite -1}
		x_6_4 {Type I LastRead 1 FirstWrite -1}
		x_6_5 {Type I LastRead 1 FirstWrite -1}
		x_6_6 {Type I LastRead 1 FirstWrite -1}
		x_6_7 {Type I LastRead 1 FirstWrite -1}
		x_6_8 {Type I LastRead 1 FirstWrite -1}
		x_6_9 {Type I LastRead 1 FirstWrite -1}
		x_6_10 {Type I LastRead 1 FirstWrite -1}
		x_6_11 {Type I LastRead 1 FirstWrite -1}
		x_6_12 {Type I LastRead 1 FirstWrite -1}
		x_6_13 {Type I LastRead 1 FirstWrite -1}
		x_6_14 {Type I LastRead 1 FirstWrite -1}
		x_6_15 {Type I LastRead 1 FirstWrite -1}
		x_7_0 {Type I LastRead 1 FirstWrite -1}
		x_7_1 {Type I LastRead 1 FirstWrite -1}
		x_7_2 {Type I LastRead 1 FirstWrite -1}
		x_7_3 {Type I LastRead 1 FirstWrite -1}
		x_7_4 {Type I LastRead 1 FirstWrite -1}
		x_7_5 {Type I LastRead 1 FirstWrite -1}
		x_7_6 {Type I LastRead 1 FirstWrite -1}
		x_7_7 {Type I LastRead 1 FirstWrite -1}
		x_7_8 {Type I LastRead 1 FirstWrite -1}
		x_7_9 {Type I LastRead 1 FirstWrite -1}
		x_7_10 {Type I LastRead 1 FirstWrite -1}
		x_7_11 {Type I LastRead 1 FirstWrite -1}
		x_7_12 {Type I LastRead 1 FirstWrite -1}
		x_7_13 {Type I LastRead 1 FirstWrite -1}
		x_7_14 {Type I LastRead 1 FirstWrite -1}
		x_7_15 {Type I LastRead 1 FirstWrite -1}
		x_scale {Type I LastRead 11 FirstWrite -1}}
	mac_blocks_wv_k1_Pipeline_UNPACK_HDR_WV_K1 {
		rb_0_load {Type I LastRead 0 FirstWrite -1}
		rb_1_load {Type I LastRead 0 FirstWrite -1}
		rb_2_load {Type I LastRead 0 FirstWrite -1}
		rb_3_load {Type I LastRead 0 FirstWrite -1}
		rb_4_load {Type I LastRead 0 FirstWrite -1}
		rb_5_load {Type I LastRead 0 FirstWrite -1}
		rb_6_load {Type I LastRead 0 FirstWrite -1}
		rb_7_load {Type I LastRead 0 FirstWrite -1}
		mn6_63_out {Type O LastRead -1 FirstWrite 5}
		mn6_62_out {Type O LastRead -1 FirstWrite 5}
		mn6_61_out {Type O LastRead -1 FirstWrite 5}
		mn6_60_out {Type O LastRead -1 FirstWrite 5}
		mn6_59_out {Type O LastRead -1 FirstWrite 5}
		mn6_58_out {Type O LastRead -1 FirstWrite 5}
		mn6_57_out {Type O LastRead -1 FirstWrite 5}
		mn6_56_out {Type O LastRead -1 FirstWrite 5}
		mn6_55_out {Type O LastRead -1 FirstWrite 5}
		mn6_54_out {Type O LastRead -1 FirstWrite 5}
		mn6_53_out {Type O LastRead -1 FirstWrite 5}
		mn6_52_out {Type O LastRead -1 FirstWrite 5}
		mn6_51_out {Type O LastRead -1 FirstWrite 5}
		mn6_50_out {Type O LastRead -1 FirstWrite 5}
		mn6_49_out {Type O LastRead -1 FirstWrite 5}
		mn6_48_out {Type O LastRead -1 FirstWrite 5}
		mn6_47_out {Type O LastRead -1 FirstWrite 5}
		mn6_46_out {Type O LastRead -1 FirstWrite 5}
		mn6_45_out {Type O LastRead -1 FirstWrite 5}
		mn6_44_out {Type O LastRead -1 FirstWrite 5}
		mn6_43_out {Type O LastRead -1 FirstWrite 5}
		mn6_42_out {Type O LastRead -1 FirstWrite 5}
		mn6_41_out {Type O LastRead -1 FirstWrite 5}
		mn6_40_out {Type O LastRead -1 FirstWrite 5}
		mn6_39_out {Type O LastRead -1 FirstWrite 5}
		mn6_38_out {Type O LastRead -1 FirstWrite 5}
		mn6_37_out {Type O LastRead -1 FirstWrite 5}
		mn6_36_out {Type O LastRead -1 FirstWrite 5}
		mn6_35_out {Type O LastRead -1 FirstWrite 5}
		mn6_34_out {Type O LastRead -1 FirstWrite 5}
		mn6_33_out {Type O LastRead -1 FirstWrite 5}
		mn6_32_out {Type O LastRead -1 FirstWrite 5}
		mn6_31_out {Type O LastRead -1 FirstWrite 5}
		mn6_30_out {Type O LastRead -1 FirstWrite 5}
		mn6_29_out {Type O LastRead -1 FirstWrite 5}
		mn6_28_out {Type O LastRead -1 FirstWrite 5}
		mn6_27_out {Type O LastRead -1 FirstWrite 5}
		mn6_26_out {Type O LastRead -1 FirstWrite 5}
		mn6_25_out {Type O LastRead -1 FirstWrite 5}
		mn6_24_out {Type O LastRead -1 FirstWrite 5}
		mn6_23_out {Type O LastRead -1 FirstWrite 5}
		mn6_22_out {Type O LastRead -1 FirstWrite 5}
		mn6_21_out {Type O LastRead -1 FirstWrite 5}
		mn6_20_out {Type O LastRead -1 FirstWrite 5}
		mn6_19_out {Type O LastRead -1 FirstWrite 5}
		mn6_18_out {Type O LastRead -1 FirstWrite 5}
		mn6_17_out {Type O LastRead -1 FirstWrite 5}
		mn6_16_out {Type O LastRead -1 FirstWrite 5}
		mn6_15_out {Type O LastRead -1 FirstWrite 5}
		mn6_14_out {Type O LastRead -1 FirstWrite 5}
		mn6_13_out {Type O LastRead -1 FirstWrite 5}
		mn6_12_out {Type O LastRead -1 FirstWrite 5}
		mn6_11_out {Type O LastRead -1 FirstWrite 5}
		mn6_10_out {Type O LastRead -1 FirstWrite 5}
		mn6_9_out {Type O LastRead -1 FirstWrite 5}
		mn6_8_out {Type O LastRead -1 FirstWrite 5}
		mn6_7_out {Type O LastRead -1 FirstWrite 5}
		mn6_6_out {Type O LastRead -1 FirstWrite 5}
		mn6_5_out {Type O LastRead -1 FirstWrite 5}
		mn6_4_out {Type O LastRead -1 FirstWrite 5}
		mn6_3_out {Type O LastRead -1 FirstWrite 5}
		mn6_2_out {Type O LastRead -1 FirstWrite 5}
		mn6_1_out {Type O LastRead -1 FirstWrite 5}
		mn6_out {Type O LastRead -1 FirstWrite 5}
		sc6_63_out {Type O LastRead -1 FirstWrite 5}
		sc6_62_out {Type O LastRead -1 FirstWrite 5}
		sc6_61_out {Type O LastRead -1 FirstWrite 5}
		sc6_60_out {Type O LastRead -1 FirstWrite 5}
		sc6_59_out {Type O LastRead -1 FirstWrite 5}
		sc6_58_out {Type O LastRead -1 FirstWrite 5}
		sc6_57_out {Type O LastRead -1 FirstWrite 5}
		sc6_56_out {Type O LastRead -1 FirstWrite 5}
		sc6_55_out {Type O LastRead -1 FirstWrite 5}
		sc6_54_out {Type O LastRead -1 FirstWrite 5}
		sc6_53_out {Type O LastRead -1 FirstWrite 5}
		sc6_52_out {Type O LastRead -1 FirstWrite 5}
		sc6_51_out {Type O LastRead -1 FirstWrite 5}
		sc6_50_out {Type O LastRead -1 FirstWrite 5}
		sc6_49_out {Type O LastRead -1 FirstWrite 5}
		sc6_48_out {Type O LastRead -1 FirstWrite 5}
		sc6_47_out {Type O LastRead -1 FirstWrite 5}
		sc6_46_out {Type O LastRead -1 FirstWrite 5}
		sc6_45_out {Type O LastRead -1 FirstWrite 5}
		sc6_44_out {Type O LastRead -1 FirstWrite 5}
		sc6_43_out {Type O LastRead -1 FirstWrite 5}
		sc6_42_out {Type O LastRead -1 FirstWrite 5}
		sc6_41_out {Type O LastRead -1 FirstWrite 5}
		sc6_40_out {Type O LastRead -1 FirstWrite 5}
		sc6_39_out {Type O LastRead -1 FirstWrite 5}
		sc6_38_out {Type O LastRead -1 FirstWrite 5}
		sc6_37_out {Type O LastRead -1 FirstWrite 5}
		sc6_36_out {Type O LastRead -1 FirstWrite 5}
		sc6_35_out {Type O LastRead -1 FirstWrite 5}
		sc6_34_out {Type O LastRead -1 FirstWrite 5}
		sc6_33_out {Type O LastRead -1 FirstWrite 5}
		sc6_32_out {Type O LastRead -1 FirstWrite 5}
		sc6_31_out {Type O LastRead -1 FirstWrite 5}
		sc6_30_out {Type O LastRead -1 FirstWrite 5}
		sc6_29_out {Type O LastRead -1 FirstWrite 5}
		sc6_28_out {Type O LastRead -1 FirstWrite 5}
		sc6_27_out {Type O LastRead -1 FirstWrite 5}
		sc6_26_out {Type O LastRead -1 FirstWrite 5}
		sc6_25_out {Type O LastRead -1 FirstWrite 5}
		sc6_24_out {Type O LastRead -1 FirstWrite 5}
		sc6_23_out {Type O LastRead -1 FirstWrite 5}
		sc6_22_out {Type O LastRead -1 FirstWrite 5}
		sc6_21_out {Type O LastRead -1 FirstWrite 5}
		sc6_20_out {Type O LastRead -1 FirstWrite 5}
		sc6_19_out {Type O LastRead -1 FirstWrite 5}
		sc6_18_out {Type O LastRead -1 FirstWrite 5}
		sc6_17_out {Type O LastRead -1 FirstWrite 5}
		sc6_16_out {Type O LastRead -1 FirstWrite 5}
		sc6_15_out {Type O LastRead -1 FirstWrite 5}
		sc6_14_out {Type O LastRead -1 FirstWrite 5}
		sc6_13_out {Type O LastRead -1 FirstWrite 5}
		sc6_12_out {Type O LastRead -1 FirstWrite 5}
		sc6_11_out {Type O LastRead -1 FirstWrite 5}
		sc6_10_out {Type O LastRead -1 FirstWrite 5}
		sc6_9_out {Type O LastRead -1 FirstWrite 5}
		sc6_8_out {Type O LastRead -1 FirstWrite 5}
		sc6_7_out {Type O LastRead -1 FirstWrite 5}
		sc6_6_out {Type O LastRead -1 FirstWrite 5}
		sc6_5_out {Type O LastRead -1 FirstWrite 5}
		sc6_4_out {Type O LastRead -1 FirstWrite 5}
		sc6_3_out {Type O LastRead -1 FirstWrite 5}
		sc6_2_out {Type O LastRead -1 FirstWrite 5}
		sc6_1_out {Type O LastRead -1 FirstWrite 5}
		sc6_out {Type O LastRead -1 FirstWrite 5}
		mux_case_784047_out {Type O LastRead -1 FirstWrite 5}
		mux_case_683944_out {Type O LastRead -1 FirstWrite 5}
		mux_case_583841_out {Type O LastRead -1 FirstWrite 5}
		mux_case_483738_out {Type O LastRead -1 FirstWrite 5}
		mux_case_383635_out {Type O LastRead -1 FirstWrite 5}
		mux_case_283532_out {Type O LastRead -1 FirstWrite 5}
		mux_case_183429_out {Type O LastRead -1 FirstWrite 5}
		mux_case_083326_out {Type O LastRead -1 FirstWrite 5}
		mux_case_783222_out {Type O LastRead -1 FirstWrite 5}
		mux_case_683119_out {Type O LastRead -1 FirstWrite 5}
		mux_case_583016_out {Type O LastRead -1 FirstWrite 5}
		mux_case_482913_out {Type O LastRead -1 FirstWrite 5}
		mux_case_382810_out {Type O LastRead -1 FirstWrite 5}
		mux_case_28277_out {Type O LastRead -1 FirstWrite 5}
		mux_case_18264_out {Type O LastRead -1 FirstWrite 5}
		mux_case_08251_out {Type O LastRead -1 FirstWrite 5}}
	fp16_to_fp32 {
		h {Type I LastRead 0 FirstWrite -1}}
	fp16_to_fp32 {
		h {Type I LastRead 0 FirstWrite -1}}
	mac_blocks_wv_k1_Pipeline_MAC_ALL_K1 {
		x_0_0 {Type I LastRead 1 FirstWrite -1}
		x_0_1 {Type I LastRead 1 FirstWrite -1}
		x_0_2 {Type I LastRead 1 FirstWrite -1}
		x_0_3 {Type I LastRead 1 FirstWrite -1}
		x_0_4 {Type I LastRead 1 FirstWrite -1}
		x_0_5 {Type I LastRead 1 FirstWrite -1}
		x_0_6 {Type I LastRead 1 FirstWrite -1}
		x_0_7 {Type I LastRead 1 FirstWrite -1}
		x_0_8 {Type I LastRead 1 FirstWrite -1}
		x_0_9 {Type I LastRead 1 FirstWrite -1}
		x_0_10 {Type I LastRead 1 FirstWrite -1}
		x_0_11 {Type I LastRead 1 FirstWrite -1}
		x_0_12 {Type I LastRead 1 FirstWrite -1}
		x_0_13 {Type I LastRead 1 FirstWrite -1}
		x_0_14 {Type I LastRead 1 FirstWrite -1}
		x_0_15 {Type I LastRead 1 FirstWrite -1}
		rb_0 {Type I LastRead 1 FirstWrite -1}
		empty_43 {Type I LastRead 0 FirstWrite -1}
		empty_44 {Type I LastRead 0 FirstWrite -1}
		empty_45 {Type I LastRead 0 FirstWrite -1}
		empty_46 {Type I LastRead 0 FirstWrite -1}
		empty_47 {Type I LastRead 0 FirstWrite -1}
		empty_48 {Type I LastRead 0 FirstWrite -1}
		empty_49 {Type I LastRead 0 FirstWrite -1}
		empty_50 {Type I LastRead 0 FirstWrite -1}
		empty_51 {Type I LastRead 0 FirstWrite -1}
		empty_52 {Type I LastRead 0 FirstWrite -1}
		empty_53 {Type I LastRead 0 FirstWrite -1}
		empty_54 {Type I LastRead 0 FirstWrite -1}
		empty_55 {Type I LastRead 0 FirstWrite -1}
		empty_56 {Type I LastRead 0 FirstWrite -1}
		empty_57 {Type I LastRead 0 FirstWrite -1}
		empty_58 {Type I LastRead 0 FirstWrite -1}
		x_1_0 {Type I LastRead 1 FirstWrite -1}
		x_1_1 {Type I LastRead 1 FirstWrite -1}
		x_1_2 {Type I LastRead 1 FirstWrite -1}
		x_1_3 {Type I LastRead 1 FirstWrite -1}
		x_1_4 {Type I LastRead 1 FirstWrite -1}
		x_1_5 {Type I LastRead 1 FirstWrite -1}
		x_1_6 {Type I LastRead 1 FirstWrite -1}
		x_1_7 {Type I LastRead 1 FirstWrite -1}
		x_1_8 {Type I LastRead 1 FirstWrite -1}
		x_1_9 {Type I LastRead 1 FirstWrite -1}
		x_1_10 {Type I LastRead 1 FirstWrite -1}
		x_1_11 {Type I LastRead 1 FirstWrite -1}
		x_1_12 {Type I LastRead 1 FirstWrite -1}
		x_1_13 {Type I LastRead 1 FirstWrite -1}
		x_1_14 {Type I LastRead 1 FirstWrite -1}
		x_1_15 {Type I LastRead 1 FirstWrite -1}
		rb_1 {Type I LastRead 1 FirstWrite -1}
		x_2_0 {Type I LastRead 1 FirstWrite -1}
		x_2_1 {Type I LastRead 1 FirstWrite -1}
		x_2_2 {Type I LastRead 1 FirstWrite -1}
		x_2_3 {Type I LastRead 1 FirstWrite -1}
		x_2_4 {Type I LastRead 1 FirstWrite -1}
		x_2_5 {Type I LastRead 1 FirstWrite -1}
		x_2_6 {Type I LastRead 1 FirstWrite -1}
		x_2_7 {Type I LastRead 1 FirstWrite -1}
		x_2_8 {Type I LastRead 1 FirstWrite -1}
		x_2_9 {Type I LastRead 1 FirstWrite -1}
		x_2_10 {Type I LastRead 1 FirstWrite -1}
		x_2_11 {Type I LastRead 1 FirstWrite -1}
		x_2_12 {Type I LastRead 1 FirstWrite -1}
		x_2_13 {Type I LastRead 1 FirstWrite -1}
		x_2_14 {Type I LastRead 1 FirstWrite -1}
		x_2_15 {Type I LastRead 1 FirstWrite -1}
		rb_2 {Type I LastRead 1 FirstWrite -1}
		x_3_0 {Type I LastRead 1 FirstWrite -1}
		x_3_1 {Type I LastRead 1 FirstWrite -1}
		x_3_2 {Type I LastRead 1 FirstWrite -1}
		x_3_3 {Type I LastRead 1 FirstWrite -1}
		x_3_4 {Type I LastRead 1 FirstWrite -1}
		x_3_5 {Type I LastRead 1 FirstWrite -1}
		x_3_6 {Type I LastRead 1 FirstWrite -1}
		x_3_7 {Type I LastRead 1 FirstWrite -1}
		x_3_8 {Type I LastRead 1 FirstWrite -1}
		x_3_9 {Type I LastRead 1 FirstWrite -1}
		x_3_10 {Type I LastRead 1 FirstWrite -1}
		x_3_11 {Type I LastRead 1 FirstWrite -1}
		x_3_12 {Type I LastRead 1 FirstWrite -1}
		x_3_13 {Type I LastRead 1 FirstWrite -1}
		x_3_14 {Type I LastRead 1 FirstWrite -1}
		x_3_15 {Type I LastRead 1 FirstWrite -1}
		rb_3 {Type I LastRead 1 FirstWrite -1}
		x_4_0 {Type I LastRead 1 FirstWrite -1}
		x_4_1 {Type I LastRead 1 FirstWrite -1}
		x_4_2 {Type I LastRead 1 FirstWrite -1}
		x_4_3 {Type I LastRead 1 FirstWrite -1}
		x_4_4 {Type I LastRead 1 FirstWrite -1}
		x_4_5 {Type I LastRead 1 FirstWrite -1}
		x_4_6 {Type I LastRead 1 FirstWrite -1}
		x_4_7 {Type I LastRead 1 FirstWrite -1}
		x_4_8 {Type I LastRead 1 FirstWrite -1}
		x_4_9 {Type I LastRead 1 FirstWrite -1}
		x_4_10 {Type I LastRead 1 FirstWrite -1}
		x_4_11 {Type I LastRead 1 FirstWrite -1}
		x_4_12 {Type I LastRead 1 FirstWrite -1}
		x_4_13 {Type I LastRead 1 FirstWrite -1}
		x_4_14 {Type I LastRead 1 FirstWrite -1}
		x_4_15 {Type I LastRead 1 FirstWrite -1}
		rb_4 {Type I LastRead 1 FirstWrite -1}
		x_5_0 {Type I LastRead 1 FirstWrite -1}
		x_5_1 {Type I LastRead 1 FirstWrite -1}
		x_5_2 {Type I LastRead 1 FirstWrite -1}
		x_5_3 {Type I LastRead 1 FirstWrite -1}
		x_5_4 {Type I LastRead 1 FirstWrite -1}
		x_5_5 {Type I LastRead 1 FirstWrite -1}
		x_5_6 {Type I LastRead 1 FirstWrite -1}
		x_5_7 {Type I LastRead 1 FirstWrite -1}
		x_5_8 {Type I LastRead 1 FirstWrite -1}
		x_5_9 {Type I LastRead 1 FirstWrite -1}
		x_5_10 {Type I LastRead 1 FirstWrite -1}
		x_5_11 {Type I LastRead 1 FirstWrite -1}
		x_5_12 {Type I LastRead 1 FirstWrite -1}
		x_5_13 {Type I LastRead 1 FirstWrite -1}
		x_5_14 {Type I LastRead 1 FirstWrite -1}
		x_5_15 {Type I LastRead 1 FirstWrite -1}
		rb_5 {Type I LastRead 1 FirstWrite -1}
		x_6_0 {Type I LastRead 1 FirstWrite -1}
		x_6_1 {Type I LastRead 1 FirstWrite -1}
		x_6_2 {Type I LastRead 1 FirstWrite -1}
		x_6_3 {Type I LastRead 1 FirstWrite -1}
		x_6_4 {Type I LastRead 1 FirstWrite -1}
		x_6_5 {Type I LastRead 1 FirstWrite -1}
		x_6_6 {Type I LastRead 1 FirstWrite -1}
		x_6_7 {Type I LastRead 1 FirstWrite -1}
		x_6_8 {Type I LastRead 1 FirstWrite -1}
		x_6_9 {Type I LastRead 1 FirstWrite -1}
		x_6_10 {Type I LastRead 1 FirstWrite -1}
		x_6_11 {Type I LastRead 1 FirstWrite -1}
		x_6_12 {Type I LastRead 1 FirstWrite -1}
		x_6_13 {Type I LastRead 1 FirstWrite -1}
		x_6_14 {Type I LastRead 1 FirstWrite -1}
		x_6_15 {Type I LastRead 1 FirstWrite -1}
		rb_6 {Type I LastRead 1 FirstWrite -1}
		x_7_0 {Type I LastRead 1 FirstWrite -1}
		x_7_1 {Type I LastRead 1 FirstWrite -1}
		x_7_2 {Type I LastRead 1 FirstWrite -1}
		x_7_3 {Type I LastRead 1 FirstWrite -1}
		x_7_4 {Type I LastRead 1 FirstWrite -1}
		x_7_5 {Type I LastRead 1 FirstWrite -1}
		x_7_6 {Type I LastRead 1 FirstWrite -1}
		x_7_7 {Type I LastRead 1 FirstWrite -1}
		x_7_8 {Type I LastRead 1 FirstWrite -1}
		x_7_9 {Type I LastRead 1 FirstWrite -1}
		x_7_10 {Type I LastRead 1 FirstWrite -1}
		x_7_11 {Type I LastRead 1 FirstWrite -1}
		x_7_12 {Type I LastRead 1 FirstWrite -1}
		x_7_13 {Type I LastRead 1 FirstWrite -1}
		x_7_14 {Type I LastRead 1 FirstWrite -1}
		x_7_15 {Type I LastRead 1 FirstWrite -1}
		rb_7 {Type I LastRead 1 FirstWrite -1}
		empty_59 {Type I LastRead 0 FirstWrite -1}
		empty_60 {Type I LastRead 0 FirstWrite -1}
		empty_61 {Type I LastRead 0 FirstWrite -1}
		empty_62 {Type I LastRead 0 FirstWrite -1}
		empty_63 {Type I LastRead 0 FirstWrite -1}
		empty_64 {Type I LastRead 0 FirstWrite -1}
		empty_65 {Type I LastRead 0 FirstWrite -1}
		empty_66 {Type I LastRead 0 FirstWrite -1}
		empty_67 {Type I LastRead 0 FirstWrite -1}
		empty_68 {Type I LastRead 0 FirstWrite -1}
		empty_69 {Type I LastRead 0 FirstWrite -1}
		empty_70 {Type I LastRead 0 FirstWrite -1}
		empty_71 {Type I LastRead 0 FirstWrite -1}
		empty_72 {Type I LastRead 0 FirstWrite -1}
		empty_73 {Type I LastRead 0 FirstWrite -1}
		empty_74 {Type I LastRead 0 FirstWrite -1}
		empty_75 {Type I LastRead 0 FirstWrite -1}
		empty_76 {Type I LastRead 0 FirstWrite -1}
		empty_77 {Type I LastRead 0 FirstWrite -1}
		empty_78 {Type I LastRead 0 FirstWrite -1}
		empty_79 {Type I LastRead 0 FirstWrite -1}
		empty_80 {Type I LastRead 0 FirstWrite -1}
		empty_81 {Type I LastRead 0 FirstWrite -1}
		empty_82 {Type I LastRead 0 FirstWrite -1}
		empty_83 {Type I LastRead 0 FirstWrite -1}
		empty_84 {Type I LastRead 0 FirstWrite -1}
		empty_85 {Type I LastRead 0 FirstWrite -1}
		empty_86 {Type I LastRead 0 FirstWrite -1}
		empty_87 {Type I LastRead 0 FirstWrite -1}
		empty_88 {Type I LastRead 0 FirstWrite -1}
		empty_89 {Type I LastRead 0 FirstWrite -1}
		empty_90 {Type I LastRead 0 FirstWrite -1}
		empty_91 {Type I LastRead 0 FirstWrite -1}
		empty_92 {Type I LastRead 0 FirstWrite -1}
		empty_93 {Type I LastRead 0 FirstWrite -1}
		empty_94 {Type I LastRead 0 FirstWrite -1}
		empty_95 {Type I LastRead 0 FirstWrite -1}
		empty_96 {Type I LastRead 0 FirstWrite -1}
		empty_97 {Type I LastRead 0 FirstWrite -1}
		empty_98 {Type I LastRead 0 FirstWrite -1}
		empty_99 {Type I LastRead 0 FirstWrite -1}
		empty_100 {Type I LastRead 0 FirstWrite -1}
		empty_101 {Type I LastRead 0 FirstWrite -1}
		empty_102 {Type I LastRead 0 FirstWrite -1}
		empty_103 {Type I LastRead 0 FirstWrite -1}
		empty_104 {Type I LastRead 0 FirstWrite -1}
		empty_105 {Type I LastRead 0 FirstWrite -1}
		empty_106 {Type I LastRead 0 FirstWrite -1}
		empty_107 {Type I LastRead 0 FirstWrite -1}
		empty_108 {Type I LastRead 0 FirstWrite -1}
		empty_109 {Type I LastRead 0 FirstWrite -1}
		empty_110 {Type I LastRead 0 FirstWrite -1}
		empty_111 {Type I LastRead 0 FirstWrite -1}
		empty_112 {Type I LastRead 0 FirstWrite -1}
		empty_113 {Type I LastRead 0 FirstWrite -1}
		empty_114 {Type I LastRead 0 FirstWrite -1}
		empty_115 {Type I LastRead 0 FirstWrite -1}
		empty_116 {Type I LastRead 0 FirstWrite -1}
		empty_117 {Type I LastRead 0 FirstWrite -1}
		empty_118 {Type I LastRead 0 FirstWrite -1}
		empty_119 {Type I LastRead 0 FirstWrite -1}
		empty_120 {Type I LastRead 0 FirstWrite -1}
		empty_121 {Type I LastRead 0 FirstWrite -1}
		empty_122 {Type I LastRead 0 FirstWrite -1}
		empty_123 {Type I LastRead 0 FirstWrite -1}
		empty_124 {Type I LastRead 0 FirstWrite -1}
		empty_125 {Type I LastRead 0 FirstWrite -1}
		empty_126 {Type I LastRead 0 FirstWrite -1}
		empty_127 {Type I LastRead 0 FirstWrite -1}
		empty_128 {Type I LastRead 0 FirstWrite -1}
		empty_129 {Type I LastRead 0 FirstWrite -1}
		empty_130 {Type I LastRead 0 FirstWrite -1}
		empty_131 {Type I LastRead 0 FirstWrite -1}
		empty_132 {Type I LastRead 0 FirstWrite -1}
		empty_133 {Type I LastRead 0 FirstWrite -1}
		empty_134 {Type I LastRead 0 FirstWrite -1}
		empty_135 {Type I LastRead 0 FirstWrite -1}
		empty_136 {Type I LastRead 0 FirstWrite -1}
		empty_137 {Type I LastRead 0 FirstWrite -1}
		empty_138 {Type I LastRead 0 FirstWrite -1}
		empty_139 {Type I LastRead 0 FirstWrite -1}
		empty_140 {Type I LastRead 0 FirstWrite -1}
		empty_141 {Type I LastRead 0 FirstWrite -1}
		empty_142 {Type I LastRead 0 FirstWrite -1}
		empty_143 {Type I LastRead 0 FirstWrite -1}
		empty_144 {Type I LastRead 0 FirstWrite -1}
		empty_145 {Type I LastRead 0 FirstWrite -1}
		empty_146 {Type I LastRead 0 FirstWrite -1}
		empty_147 {Type I LastRead 0 FirstWrite -1}
		empty_148 {Type I LastRead 0 FirstWrite -1}
		empty_149 {Type I LastRead 0 FirstWrite -1}
		empty_150 {Type I LastRead 0 FirstWrite -1}
		empty_151 {Type I LastRead 0 FirstWrite -1}
		empty_152 {Type I LastRead 0 FirstWrite -1}
		empty_153 {Type I LastRead 0 FirstWrite -1}
		empty_154 {Type I LastRead 0 FirstWrite -1}
		empty_155 {Type I LastRead 0 FirstWrite -1}
		empty_156 {Type I LastRead 0 FirstWrite -1}
		empty_157 {Type I LastRead 0 FirstWrite -1}
		empty_158 {Type I LastRead 0 FirstWrite -1}
		empty_159 {Type I LastRead 0 FirstWrite -1}
		empty_160 {Type I LastRead 0 FirstWrite -1}
		empty_161 {Type I LastRead 0 FirstWrite -1}
		empty_162 {Type I LastRead 0 FirstWrite -1}
		empty_163 {Type I LastRead 0 FirstWrite -1}
		empty_164 {Type I LastRead 0 FirstWrite -1}
		empty_165 {Type I LastRead 0 FirstWrite -1}
		empty_166 {Type I LastRead 0 FirstWrite -1}
		empty_167 {Type I LastRead 0 FirstWrite -1}
		empty_168 {Type I LastRead 0 FirstWrite -1}
		empty_169 {Type I LastRead 0 FirstWrite -1}
		empty {Type I LastRead 0 FirstWrite -1}
		int_acc_w_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_w_1_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_w_2_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_w_3_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_w_4_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_w_5_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_w_6_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_w_7_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_w_8_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_w_9_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_w_10_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_w_11_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_w_12_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_w_13_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_w_14_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_w_15_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_w_16_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_w_17_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_w_18_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_w_19_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_w_20_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_w_21_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_w_22_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_w_23_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_w_24_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_w_25_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_w_26_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_w_27_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_w_28_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_w_29_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_w_30_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_w_31_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_w_32_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_w_33_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_w_34_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_w_35_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_w_36_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_w_37_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_w_38_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_w_39_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_w_40_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_w_41_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_w_42_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_w_43_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_w_44_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_w_45_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_w_46_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_w_47_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_w_48_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_w_49_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_w_50_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_w_51_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_w_52_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_w_53_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_w_54_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_w_55_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_w_56_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_w_57_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_w_58_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_w_59_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_w_60_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_w_61_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_w_62_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_w_63_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_m_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_m_1_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_m_2_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_m_3_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_m_4_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_m_5_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_m_6_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_m_7_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_m_8_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_m_9_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_m_10_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_m_11_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_m_12_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_m_13_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_m_14_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_m_15_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_m_16_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_m_17_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_m_18_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_m_19_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_m_20_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_m_21_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_m_22_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_m_23_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_m_24_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_m_25_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_m_26_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_m_27_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_m_28_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_m_29_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_m_30_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_m_31_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_m_32_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_m_33_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_m_34_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_m_35_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_m_36_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_m_37_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_m_38_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_m_39_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_m_40_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_m_41_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_m_42_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_m_43_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_m_44_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_m_45_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_m_46_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_m_47_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_m_48_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_m_49_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_m_50_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_m_51_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_m_52_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_m_53_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_m_54_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_m_55_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_m_56_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_m_57_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_m_58_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_m_59_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_m_60_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_m_61_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_m_62_load_out {Type O LastRead -1 FirstWrite 6}
		int_acc_m_63_load_out {Type O LastRead -1 FirstWrite 6}}
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
		total_out {Type O LastRead -1 FirstWrite 9}}
	compute_gate {
		X1_cache {Type I LastRead 0 FirstWrite -1}
		X2_cache {Type I LastRead 31 FirstWrite -1}
		gate_cache_0 {Type O LastRead -1 FirstWrite 80}
		gate_cache_1 {Type O LastRead -1 FirstWrite 80}
		gate_cache_2 {Type O LastRead -1 FirstWrite 80}
		gate_cache_3 {Type O LastRead -1 FirstWrite 80}
		gate_cache_4 {Type O LastRead -1 FirstWrite 80}
		gate_cache_5 {Type O LastRead -1 FirstWrite 80}
		gate_cache_6 {Type O LastRead -1 FirstWrite 80}
		gate_cache_7 {Type O LastRead -1 FirstWrite 80}
		sigmoid_lut {Type I LastRead -1 FirstWrite -1}}
	compute_gate_Pipeline_GATE_PASS1 {
		X1_cache {Type I LastRead 0 FirstWrite -1}
		X2_cache {Type I LastRead 31 FirstWrite -1}
		max_abs_out {Type O LastRead -1 FirstWrite 60}
		max_abs_2_out {Type O LastRead -1 FirstWrite 60}
		max_abs_4_out {Type O LastRead -1 FirstWrite 60}
		max_abs_6_out {Type O LastRead -1 FirstWrite 60}
		max_abs_8_out {Type O LastRead -1 FirstWrite 60}
		max_abs_10_out {Type O LastRead -1 FirstWrite 60}
		max_abs_12_out {Type O LastRead -1 FirstWrite 60}
		max_abs_14_out {Type O LastRead -1 FirstWrite 60}
		sigmoid_lut {Type I LastRead 38 FirstWrite -1}}
	compute_gate_Pipeline_GATE_PASS2 {
		X1_cache {Type I LastRead 0 FirstWrite -1}
		X2_cache {Type I LastRead 31 FirstWrite -1}
		gate_cache_7 {Type O LastRead -1 FirstWrite 80}
		gate_cache_6 {Type O LastRead -1 FirstWrite 80}
		gate_cache_5 {Type O LastRead -1 FirstWrite 80}
		gate_cache_4 {Type O LastRead -1 FirstWrite 80}
		gate_cache_3 {Type O LastRead -1 FirstWrite 80}
		gate_cache_2 {Type O LastRead -1 FirstWrite 80}
		gate_cache_1 {Type O LastRead -1 FirstWrite 80}
		gate_cache_0 {Type O LastRead -1 FirstWrite 80}
		inv_gs {Type I LastRead 0 FirstWrite -1}
		sigmoid_lut {Type I LastRead 38 FirstWrite -1}}
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
	{"Name" : "Latency", "Min" : "6929927", "Max" : "9503239"}
	, {"Name" : "Interval", "Min" : "4055043", "Max" : "5431371"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	gmem_W { m_axi {  { m_axi_gmem_W_AWVALID VALID 1 1 }  { m_axi_gmem_W_AWREADY READY 0 1 }  { m_axi_gmem_W_AWADDR ADDR 1 64 }  { m_axi_gmem_W_AWID ID 1 1 }  { m_axi_gmem_W_AWLEN SIZE 1 8 }  { m_axi_gmem_W_AWSIZE BURST 1 3 }  { m_axi_gmem_W_AWBURST LOCK 1 2 }  { m_axi_gmem_W_AWLOCK CACHE 1 2 }  { m_axi_gmem_W_AWCACHE PROT 1 4 }  { m_axi_gmem_W_AWPROT QOS 1 3 }  { m_axi_gmem_W_AWQOS REGION 1 4 }  { m_axi_gmem_W_AWREGION USER 1 4 }  { m_axi_gmem_W_AWUSER DATA 1 1 }  { m_axi_gmem_W_WVALID VALID 1 1 }  { m_axi_gmem_W_WREADY READY 0 1 }  { m_axi_gmem_W_WDATA FIFONUM 1 128 }  { m_axi_gmem_W_WSTRB STRB 1 16 }  { m_axi_gmem_W_WLAST LAST 1 1 }  { m_axi_gmem_W_WID ID 1 1 }  { m_axi_gmem_W_WUSER DATA 1 1 }  { m_axi_gmem_W_ARVALID VALID 1 1 }  { m_axi_gmem_W_ARREADY READY 0 1 }  { m_axi_gmem_W_ARADDR ADDR 1 64 }  { m_axi_gmem_W_ARID ID 1 1 }  { m_axi_gmem_W_ARLEN SIZE 1 8 }  { m_axi_gmem_W_ARSIZE BURST 1 3 }  { m_axi_gmem_W_ARBURST LOCK 1 2 }  { m_axi_gmem_W_ARLOCK CACHE 1 2 }  { m_axi_gmem_W_ARCACHE PROT 1 4 }  { m_axi_gmem_W_ARPROT QOS 1 3 }  { m_axi_gmem_W_ARQOS REGION 1 4 }  { m_axi_gmem_W_ARREGION USER 1 4 }  { m_axi_gmem_W_ARUSER DATA 1 1 }  { m_axi_gmem_W_RVALID VALID 0 1 }  { m_axi_gmem_W_RREADY READY 1 1 }  { m_axi_gmem_W_RDATA FIFONUM 0 128 }  { m_axi_gmem_W_RLAST LAST 0 1 }  { m_axi_gmem_W_RID ID 0 1 }  { m_axi_gmem_W_RUSER DATA 0 1 }  { m_axi_gmem_W_RRESP RESP 0 2 }  { m_axi_gmem_W_BVALID VALID 0 1 }  { m_axi_gmem_W_BREADY READY 1 1 }  { m_axi_gmem_W_BRESP RESP 0 2 }  { m_axi_gmem_W_BID ID 0 1 }  { m_axi_gmem_W_BUSER DATA 0 1 } } }
	gmem_V { m_axi {  { m_axi_gmem_V_AWVALID VALID 1 1 }  { m_axi_gmem_V_AWREADY READY 0 1 }  { m_axi_gmem_V_AWADDR ADDR 1 64 }  { m_axi_gmem_V_AWID ID 1 1 }  { m_axi_gmem_V_AWLEN SIZE 1 8 }  { m_axi_gmem_V_AWSIZE BURST 1 3 }  { m_axi_gmem_V_AWBURST LOCK 1 2 }  { m_axi_gmem_V_AWLOCK CACHE 1 2 }  { m_axi_gmem_V_AWCACHE PROT 1 4 }  { m_axi_gmem_V_AWPROT QOS 1 3 }  { m_axi_gmem_V_AWQOS REGION 1 4 }  { m_axi_gmem_V_AWREGION USER 1 4 }  { m_axi_gmem_V_AWUSER DATA 1 1 }  { m_axi_gmem_V_WVALID VALID 1 1 }  { m_axi_gmem_V_WREADY READY 0 1 }  { m_axi_gmem_V_WDATA FIFONUM 1 128 }  { m_axi_gmem_V_WSTRB STRB 1 16 }  { m_axi_gmem_V_WLAST LAST 1 1 }  { m_axi_gmem_V_WID ID 1 1 }  { m_axi_gmem_V_WUSER DATA 1 1 }  { m_axi_gmem_V_ARVALID VALID 1 1 }  { m_axi_gmem_V_ARREADY READY 0 1 }  { m_axi_gmem_V_ARADDR ADDR 1 64 }  { m_axi_gmem_V_ARID ID 1 1 }  { m_axi_gmem_V_ARLEN SIZE 1 8 }  { m_axi_gmem_V_ARSIZE BURST 1 3 }  { m_axi_gmem_V_ARBURST LOCK 1 2 }  { m_axi_gmem_V_ARLOCK CACHE 1 2 }  { m_axi_gmem_V_ARCACHE PROT 1 4 }  { m_axi_gmem_V_ARPROT QOS 1 3 }  { m_axi_gmem_V_ARQOS REGION 1 4 }  { m_axi_gmem_V_ARREGION USER 1 4 }  { m_axi_gmem_V_ARUSER DATA 1 1 }  { m_axi_gmem_V_RVALID VALID 0 1 }  { m_axi_gmem_V_RREADY READY 1 1 }  { m_axi_gmem_V_RDATA FIFONUM 0 128 }  { m_axi_gmem_V_RLAST LAST 0 1 }  { m_axi_gmem_V_RID ID 0 1 }  { m_axi_gmem_V_RUSER DATA 0 1 }  { m_axi_gmem_V_RRESP RESP 0 2 }  { m_axi_gmem_V_BVALID VALID 0 1 }  { m_axi_gmem_V_BREADY READY 1 1 }  { m_axi_gmem_V_BRESP RESP 0 2 }  { m_axi_gmem_V_BID ID 0 1 }  { m_axi_gmem_V_BUSER DATA 0 1 } } }
	gmem_Wd { m_axi {  { m_axi_gmem_Wd_AWVALID VALID 1 1 }  { m_axi_gmem_Wd_AWREADY READY 0 1 }  { m_axi_gmem_Wd_AWADDR ADDR 1 64 }  { m_axi_gmem_Wd_AWID ID 1 1 }  { m_axi_gmem_Wd_AWLEN SIZE 1 8 }  { m_axi_gmem_Wd_AWSIZE BURST 1 3 }  { m_axi_gmem_Wd_AWBURST LOCK 1 2 }  { m_axi_gmem_Wd_AWLOCK CACHE 1 2 }  { m_axi_gmem_Wd_AWCACHE PROT 1 4 }  { m_axi_gmem_Wd_AWPROT QOS 1 3 }  { m_axi_gmem_Wd_AWQOS REGION 1 4 }  { m_axi_gmem_Wd_AWREGION USER 1 4 }  { m_axi_gmem_Wd_AWUSER DATA 1 1 }  { m_axi_gmem_Wd_WVALID VALID 1 1 }  { m_axi_gmem_Wd_WREADY READY 0 1 }  { m_axi_gmem_Wd_WDATA FIFONUM 1 128 }  { m_axi_gmem_Wd_WSTRB STRB 1 16 }  { m_axi_gmem_Wd_WLAST LAST 1 1 }  { m_axi_gmem_Wd_WID ID 1 1 }  { m_axi_gmem_Wd_WUSER DATA 1 1 }  { m_axi_gmem_Wd_ARVALID VALID 1 1 }  { m_axi_gmem_Wd_ARREADY READY 0 1 }  { m_axi_gmem_Wd_ARADDR ADDR 1 64 }  { m_axi_gmem_Wd_ARID ID 1 1 }  { m_axi_gmem_Wd_ARLEN SIZE 1 8 }  { m_axi_gmem_Wd_ARSIZE BURST 1 3 }  { m_axi_gmem_Wd_ARBURST LOCK 1 2 }  { m_axi_gmem_Wd_ARLOCK CACHE 1 2 }  { m_axi_gmem_Wd_ARCACHE PROT 1 4 }  { m_axi_gmem_Wd_ARPROT QOS 1 3 }  { m_axi_gmem_Wd_ARQOS REGION 1 4 }  { m_axi_gmem_Wd_ARREGION USER 1 4 }  { m_axi_gmem_Wd_ARUSER DATA 1 1 }  { m_axi_gmem_Wd_RVALID VALID 0 1 }  { m_axi_gmem_Wd_RREADY READY 1 1 }  { m_axi_gmem_Wd_RDATA FIFONUM 0 128 }  { m_axi_gmem_Wd_RLAST LAST 0 1 }  { m_axi_gmem_Wd_RID ID 0 1 }  { m_axi_gmem_Wd_RUSER DATA 0 1 }  { m_axi_gmem_Wd_RRESP RESP 0 2 }  { m_axi_gmem_Wd_BVALID VALID 0 1 }  { m_axi_gmem_Wd_BREADY READY 1 1 }  { m_axi_gmem_Wd_BRESP RESP 0 2 }  { m_axi_gmem_Wd_BID ID 0 1 }  { m_axi_gmem_Wd_BUSER DATA 0 1 } } }
	gmem_Wd2 { m_axi {  { m_axi_gmem_Wd2_AWVALID VALID 1 1 }  { m_axi_gmem_Wd2_AWREADY READY 0 1 }  { m_axi_gmem_Wd2_AWADDR ADDR 1 64 }  { m_axi_gmem_Wd2_AWID ID 1 1 }  { m_axi_gmem_Wd2_AWLEN SIZE 1 8 }  { m_axi_gmem_Wd2_AWSIZE BURST 1 3 }  { m_axi_gmem_Wd2_AWBURST LOCK 1 2 }  { m_axi_gmem_Wd2_AWLOCK CACHE 1 2 }  { m_axi_gmem_Wd2_AWCACHE PROT 1 4 }  { m_axi_gmem_Wd2_AWPROT QOS 1 3 }  { m_axi_gmem_Wd2_AWQOS REGION 1 4 }  { m_axi_gmem_Wd2_AWREGION USER 1 4 }  { m_axi_gmem_Wd2_AWUSER DATA 1 1 }  { m_axi_gmem_Wd2_WVALID VALID 1 1 }  { m_axi_gmem_Wd2_WREADY READY 0 1 }  { m_axi_gmem_Wd2_WDATA FIFONUM 1 128 }  { m_axi_gmem_Wd2_WSTRB STRB 1 16 }  { m_axi_gmem_Wd2_WLAST LAST 1 1 }  { m_axi_gmem_Wd2_WID ID 1 1 }  { m_axi_gmem_Wd2_WUSER DATA 1 1 }  { m_axi_gmem_Wd2_ARVALID VALID 1 1 }  { m_axi_gmem_Wd2_ARREADY READY 0 1 }  { m_axi_gmem_Wd2_ARADDR ADDR 1 64 }  { m_axi_gmem_Wd2_ARID ID 1 1 }  { m_axi_gmem_Wd2_ARLEN SIZE 1 8 }  { m_axi_gmem_Wd2_ARSIZE BURST 1 3 }  { m_axi_gmem_Wd2_ARBURST LOCK 1 2 }  { m_axi_gmem_Wd2_ARLOCK CACHE 1 2 }  { m_axi_gmem_Wd2_ARCACHE PROT 1 4 }  { m_axi_gmem_Wd2_ARPROT QOS 1 3 }  { m_axi_gmem_Wd2_ARQOS REGION 1 4 }  { m_axi_gmem_Wd2_ARREGION USER 1 4 }  { m_axi_gmem_Wd2_ARUSER DATA 1 1 }  { m_axi_gmem_Wd2_RVALID VALID 0 1 }  { m_axi_gmem_Wd2_RREADY READY 1 1 }  { m_axi_gmem_Wd2_RDATA FIFONUM 0 128 }  { m_axi_gmem_Wd2_RLAST LAST 0 1 }  { m_axi_gmem_Wd2_RID ID 0 1 }  { m_axi_gmem_Wd2_RUSER DATA 0 1 }  { m_axi_gmem_Wd2_RRESP RESP 0 2 }  { m_axi_gmem_Wd2_BVALID VALID 0 1 }  { m_axi_gmem_Wd2_BREADY READY 1 1 }  { m_axi_gmem_Wd2_BRESP RESP 0 2 }  { m_axi_gmem_Wd2_BID ID 0 1 }  { m_axi_gmem_Wd2_BUSER DATA 0 1 } } }
	gmem_x { m_axi {  { m_axi_gmem_x_AWVALID VALID 1 1 }  { m_axi_gmem_x_AWREADY READY 0 1 }  { m_axi_gmem_x_AWADDR ADDR 1 64 }  { m_axi_gmem_x_AWID ID 1 1 }  { m_axi_gmem_x_AWLEN SIZE 1 8 }  { m_axi_gmem_x_AWSIZE BURST 1 3 }  { m_axi_gmem_x_AWBURST LOCK 1 2 }  { m_axi_gmem_x_AWLOCK CACHE 1 2 }  { m_axi_gmem_x_AWCACHE PROT 1 4 }  { m_axi_gmem_x_AWPROT QOS 1 3 }  { m_axi_gmem_x_AWQOS REGION 1 4 }  { m_axi_gmem_x_AWREGION USER 1 4 }  { m_axi_gmem_x_AWUSER DATA 1 1 }  { m_axi_gmem_x_WVALID VALID 1 1 }  { m_axi_gmem_x_WREADY READY 0 1 }  { m_axi_gmem_x_WDATA FIFONUM 1 128 }  { m_axi_gmem_x_WSTRB STRB 1 16 }  { m_axi_gmem_x_WLAST LAST 1 1 }  { m_axi_gmem_x_WID ID 1 1 }  { m_axi_gmem_x_WUSER DATA 1 1 }  { m_axi_gmem_x_ARVALID VALID 1 1 }  { m_axi_gmem_x_ARREADY READY 0 1 }  { m_axi_gmem_x_ARADDR ADDR 1 64 }  { m_axi_gmem_x_ARID ID 1 1 }  { m_axi_gmem_x_ARLEN SIZE 1 8 }  { m_axi_gmem_x_ARSIZE BURST 1 3 }  { m_axi_gmem_x_ARBURST LOCK 1 2 }  { m_axi_gmem_x_ARLOCK CACHE 1 2 }  { m_axi_gmem_x_ARCACHE PROT 1 4 }  { m_axi_gmem_x_ARPROT QOS 1 3 }  { m_axi_gmem_x_ARQOS REGION 1 4 }  { m_axi_gmem_x_ARREGION USER 1 4 }  { m_axi_gmem_x_ARUSER DATA 1 1 }  { m_axi_gmem_x_RVALID VALID 0 1 }  { m_axi_gmem_x_RREADY READY 1 1 }  { m_axi_gmem_x_RDATA FIFONUM 0 128 }  { m_axi_gmem_x_RLAST LAST 0 1 }  { m_axi_gmem_x_RID ID 0 1 }  { m_axi_gmem_x_RUSER DATA 0 1 }  { m_axi_gmem_x_RRESP RESP 0 2 }  { m_axi_gmem_x_BVALID VALID 0 1 }  { m_axi_gmem_x_BREADY READY 1 1 }  { m_axi_gmem_x_BRESP RESP 0 2 }  { m_axi_gmem_x_BID ID 0 1 }  { m_axi_gmem_x_BUSER DATA 0 1 } } }
	gmem_out { m_axi {  { m_axi_gmem_out_AWVALID VALID 1 1 }  { m_axi_gmem_out_AWREADY READY 0 1 }  { m_axi_gmem_out_AWADDR ADDR 1 64 }  { m_axi_gmem_out_AWID ID 1 1 }  { m_axi_gmem_out_AWLEN SIZE 1 8 }  { m_axi_gmem_out_AWSIZE BURST 1 3 }  { m_axi_gmem_out_AWBURST LOCK 1 2 }  { m_axi_gmem_out_AWLOCK CACHE 1 2 }  { m_axi_gmem_out_AWCACHE PROT 1 4 }  { m_axi_gmem_out_AWPROT QOS 1 3 }  { m_axi_gmem_out_AWQOS REGION 1 4 }  { m_axi_gmem_out_AWREGION USER 1 4 }  { m_axi_gmem_out_AWUSER DATA 1 1 }  { m_axi_gmem_out_WVALID VALID 1 1 }  { m_axi_gmem_out_WREADY READY 0 1 }  { m_axi_gmem_out_WDATA FIFONUM 1 32 }  { m_axi_gmem_out_WSTRB STRB 1 4 }  { m_axi_gmem_out_WLAST LAST 1 1 }  { m_axi_gmem_out_WID ID 1 1 }  { m_axi_gmem_out_WUSER DATA 1 1 }  { m_axi_gmem_out_ARVALID VALID 1 1 }  { m_axi_gmem_out_ARREADY READY 0 1 }  { m_axi_gmem_out_ARADDR ADDR 1 64 }  { m_axi_gmem_out_ARID ID 1 1 }  { m_axi_gmem_out_ARLEN SIZE 1 8 }  { m_axi_gmem_out_ARSIZE BURST 1 3 }  { m_axi_gmem_out_ARBURST LOCK 1 2 }  { m_axi_gmem_out_ARLOCK CACHE 1 2 }  { m_axi_gmem_out_ARCACHE PROT 1 4 }  { m_axi_gmem_out_ARPROT QOS 1 3 }  { m_axi_gmem_out_ARQOS REGION 1 4 }  { m_axi_gmem_out_ARREGION USER 1 4 }  { m_axi_gmem_out_ARUSER DATA 1 1 }  { m_axi_gmem_out_RVALID VALID 0 1 }  { m_axi_gmem_out_RREADY READY 1 1 }  { m_axi_gmem_out_RDATA FIFONUM 0 32 }  { m_axi_gmem_out_RLAST LAST 0 1 }  { m_axi_gmem_out_RID ID 0 1 }  { m_axi_gmem_out_RUSER DATA 0 1 }  { m_axi_gmem_out_RRESP RESP 0 2 }  { m_axi_gmem_out_BVALID VALID 0 1 }  { m_axi_gmem_out_BREADY READY 1 1 }  { m_axi_gmem_out_BRESP RESP 0 2 }  { m_axi_gmem_out_BID ID 0 1 }  { m_axi_gmem_out_BUSER DATA 0 1 } } }
}

set maxi_interface_dict [dict create]
dict set maxi_interface_dict gmem_V { CHANNEL_NUM 0 BUNDLE gmem_V NUM_READ_OUTSTANDING 2 NUM_WRITE_OUTSTANDING 16 MAX_READ_BURST_LENGTH 256 MAX_WRITE_BURST_LENGTH 16 READ_WRITE_MODE READ_ONLY}
dict set maxi_interface_dict gmem_W { CHANNEL_NUM 0 BUNDLE gmem_W NUM_READ_OUTSTANDING 2 NUM_WRITE_OUTSTANDING 16 MAX_READ_BURST_LENGTH 256 MAX_WRITE_BURST_LENGTH 16 READ_WRITE_MODE READ_ONLY}
dict set maxi_interface_dict gmem_Wd { CHANNEL_NUM 0 BUNDLE gmem_Wd NUM_READ_OUTSTANDING 2 NUM_WRITE_OUTSTANDING 16 MAX_READ_BURST_LENGTH 256 MAX_WRITE_BURST_LENGTH 16 READ_WRITE_MODE READ_ONLY}
dict set maxi_interface_dict gmem_Wd2 { CHANNEL_NUM 0 BUNDLE gmem_Wd2 NUM_READ_OUTSTANDING 2 NUM_WRITE_OUTSTANDING 16 MAX_READ_BURST_LENGTH 256 MAX_WRITE_BURST_LENGTH 16 READ_WRITE_MODE READ_ONLY}
dict set maxi_interface_dict gmem_out { CHANNEL_NUM 0 BUNDLE gmem_out NUM_READ_OUTSTANDING 16 NUM_WRITE_OUTSTANDING 2 MAX_READ_BURST_LENGTH 16 MAX_WRITE_BURST_LENGTH 256 READ_WRITE_MODE WRITE_ONLY}
dict set maxi_interface_dict gmem_x { CHANNEL_NUM 0 BUNDLE gmem_x NUM_READ_OUTSTANDING 2 NUM_WRITE_OUTSTANDING 16 MAX_READ_BURST_LENGTH 256 MAX_WRITE_BURST_LENGTH 16 READ_WRITE_MODE READ_ONLY}

# RTL port scheduling information:
set fifoSchedulingInfoList { 
}

# RTL bus port read request latency information:
set busReadReqLatencyList { 
	{ gmem_W 64 }
	{ gmem_V 64 }
	{ gmem_Wd 64 }
	{ gmem_Wd2 64 }
	{ gmem_x 64 }
	{ gmem_out 64 }
}

# RTL bus port write response latency information:
set busWriteResLatencyList { 
	{ gmem_W 64 }
	{ gmem_V 64 }
	{ gmem_Wd 64 }
	{ gmem_Wd2 64 }
	{ gmem_x 64 }
	{ gmem_out 64 }
}

# RTL array port load latency information:
set memoryLoadLatencyList { 
}
