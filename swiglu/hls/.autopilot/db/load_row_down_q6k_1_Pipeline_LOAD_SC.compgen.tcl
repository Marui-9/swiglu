# This script segment is generated automatically by AutoPilot

# clear list
if {${::AESL::PGuard_autoexp_gen}} {
    cg_default_interface_gen_dc_begin
    cg_default_interface_gen_bundle_begin
    AESL_LIB_XILADAPTER::native_axis_begin
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1757 \
    name sc_buf_0 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_sc_buf_0 \
    op interface \
    ports { sc_buf_0 { O 128 vector } sc_buf_0_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1758 \
    name gmem_Wd2 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_gmem_Wd2 \
    op interface \
    ports { m_axi_gmem_Wd2_0_AWVALID { O 1 bit } m_axi_gmem_Wd2_0_AWREADY { I 1 bit } m_axi_gmem_Wd2_0_AWADDR { O 64 vector } m_axi_gmem_Wd2_0_AWID { O 1 vector } m_axi_gmem_Wd2_0_AWLEN { O 32 vector } m_axi_gmem_Wd2_0_AWSIZE { O 3 vector } m_axi_gmem_Wd2_0_AWBURST { O 2 vector } m_axi_gmem_Wd2_0_AWLOCK { O 2 vector } m_axi_gmem_Wd2_0_AWCACHE { O 4 vector } m_axi_gmem_Wd2_0_AWPROT { O 3 vector } m_axi_gmem_Wd2_0_AWQOS { O 4 vector } m_axi_gmem_Wd2_0_AWREGION { O 4 vector } m_axi_gmem_Wd2_0_AWUSER { O 1 vector } m_axi_gmem_Wd2_0_WVALID { O 1 bit } m_axi_gmem_Wd2_0_WREADY { I 1 bit } m_axi_gmem_Wd2_0_WDATA { O 128 vector } m_axi_gmem_Wd2_0_WSTRB { O 16 vector } m_axi_gmem_Wd2_0_WLAST { O 1 bit } m_axi_gmem_Wd2_0_WID { O 1 vector } m_axi_gmem_Wd2_0_WUSER { O 1 vector } m_axi_gmem_Wd2_0_ARVALID { O 1 bit } m_axi_gmem_Wd2_0_ARREADY { I 1 bit } m_axi_gmem_Wd2_0_ARADDR { O 64 vector } m_axi_gmem_Wd2_0_ARID { O 1 vector } m_axi_gmem_Wd2_0_ARLEN { O 32 vector } m_axi_gmem_Wd2_0_ARSIZE { O 3 vector } m_axi_gmem_Wd2_0_ARBURST { O 2 vector } m_axi_gmem_Wd2_0_ARLOCK { O 2 vector } m_axi_gmem_Wd2_0_ARCACHE { O 4 vector } m_axi_gmem_Wd2_0_ARPROT { O 3 vector } m_axi_gmem_Wd2_0_ARQOS { O 4 vector } m_axi_gmem_Wd2_0_ARREGION { O 4 vector } m_axi_gmem_Wd2_0_ARUSER { O 1 vector } m_axi_gmem_Wd2_0_RVALID { I 1 bit } m_axi_gmem_Wd2_0_RREADY { O 1 bit } m_axi_gmem_Wd2_0_RDATA { I 128 vector } m_axi_gmem_Wd2_0_RLAST { I 1 bit } m_axi_gmem_Wd2_0_RID { I 1 vector } m_axi_gmem_Wd2_0_RFIFONUM { I 10 vector } m_axi_gmem_Wd2_0_RUSER { I 1 vector } m_axi_gmem_Wd2_0_RRESP { I 2 vector } m_axi_gmem_Wd2_0_BVALID { I 1 bit } m_axi_gmem_Wd2_0_BREADY { O 1 bit } m_axi_gmem_Wd2_0_BRESP { I 2 vector } m_axi_gmem_Wd2_0_BID { I 1 vector } m_axi_gmem_Wd2_0_BUSER { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1759 \
    name sext_ln504 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln504 \
    op interface \
    ports { sext_ln504 { I 60 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1760 \
    name sc_buf_31 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_sc_buf_31 \
    op interface \
    ports { sc_buf_31 { O 128 vector } sc_buf_31_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1761 \
    name sc_buf_30 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_sc_buf_30 \
    op interface \
    ports { sc_buf_30 { O 128 vector } sc_buf_30_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1762 \
    name sc_buf_29 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_sc_buf_29 \
    op interface \
    ports { sc_buf_29 { O 128 vector } sc_buf_29_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1763 \
    name sc_buf_28 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_sc_buf_28 \
    op interface \
    ports { sc_buf_28 { O 128 vector } sc_buf_28_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1764 \
    name sc_buf_27 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_sc_buf_27 \
    op interface \
    ports { sc_buf_27 { O 128 vector } sc_buf_27_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1765 \
    name sc_buf_26 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_sc_buf_26 \
    op interface \
    ports { sc_buf_26 { O 128 vector } sc_buf_26_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1766 \
    name sc_buf_25 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_sc_buf_25 \
    op interface \
    ports { sc_buf_25 { O 128 vector } sc_buf_25_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1767 \
    name sc_buf_24 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_sc_buf_24 \
    op interface \
    ports { sc_buf_24 { O 128 vector } sc_buf_24_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1768 \
    name sc_buf_23 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_sc_buf_23 \
    op interface \
    ports { sc_buf_23 { O 128 vector } sc_buf_23_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1769 \
    name sc_buf_22 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_sc_buf_22 \
    op interface \
    ports { sc_buf_22 { O 128 vector } sc_buf_22_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1770 \
    name sc_buf_21 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_sc_buf_21 \
    op interface \
    ports { sc_buf_21 { O 128 vector } sc_buf_21_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1771 \
    name sc_buf_20 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_sc_buf_20 \
    op interface \
    ports { sc_buf_20 { O 128 vector } sc_buf_20_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1772 \
    name sc_buf_19 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_sc_buf_19 \
    op interface \
    ports { sc_buf_19 { O 128 vector } sc_buf_19_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1773 \
    name sc_buf_18 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_sc_buf_18 \
    op interface \
    ports { sc_buf_18 { O 128 vector } sc_buf_18_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1774 \
    name sc_buf_17 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_sc_buf_17 \
    op interface \
    ports { sc_buf_17 { O 128 vector } sc_buf_17_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1775 \
    name sc_buf_16 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_sc_buf_16 \
    op interface \
    ports { sc_buf_16 { O 128 vector } sc_buf_16_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1776 \
    name sc_buf_15 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_sc_buf_15 \
    op interface \
    ports { sc_buf_15 { O 128 vector } sc_buf_15_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1777 \
    name sc_buf_14 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_sc_buf_14 \
    op interface \
    ports { sc_buf_14 { O 128 vector } sc_buf_14_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1778 \
    name sc_buf_13 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_sc_buf_13 \
    op interface \
    ports { sc_buf_13 { O 128 vector } sc_buf_13_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1779 \
    name sc_buf_12 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_sc_buf_12 \
    op interface \
    ports { sc_buf_12 { O 128 vector } sc_buf_12_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1780 \
    name sc_buf_11 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_sc_buf_11 \
    op interface \
    ports { sc_buf_11 { O 128 vector } sc_buf_11_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1781 \
    name sc_buf_10 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_sc_buf_10 \
    op interface \
    ports { sc_buf_10 { O 128 vector } sc_buf_10_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1782 \
    name sc_buf_9 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_sc_buf_9 \
    op interface \
    ports { sc_buf_9 { O 128 vector } sc_buf_9_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1783 \
    name sc_buf_8 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_sc_buf_8 \
    op interface \
    ports { sc_buf_8 { O 128 vector } sc_buf_8_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1784 \
    name sc_buf_7 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_sc_buf_7 \
    op interface \
    ports { sc_buf_7 { O 128 vector } sc_buf_7_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1785 \
    name sc_buf_6 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_sc_buf_6 \
    op interface \
    ports { sc_buf_6 { O 128 vector } sc_buf_6_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1786 \
    name sc_buf_5 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_sc_buf_5 \
    op interface \
    ports { sc_buf_5 { O 128 vector } sc_buf_5_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1787 \
    name sc_buf_4 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_sc_buf_4 \
    op interface \
    ports { sc_buf_4 { O 128 vector } sc_buf_4_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1788 \
    name sc_buf_3 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_sc_buf_3 \
    op interface \
    ports { sc_buf_3 { O 128 vector } sc_buf_3_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1789 \
    name sc_buf_2 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_sc_buf_2 \
    op interface \
    ports { sc_buf_2 { O 128 vector } sc_buf_2_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1790 \
    name sc_buf_1 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_sc_buf_1 \
    op interface \
    ports { sc_buf_1 { O 128 vector } sc_buf_1_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id -1 \
    name ap_ctrl \
    type ap_ctrl \
    reset_level 1 \
    sync_rst true \
    corename ap_ctrl \
    op interface \
    ports { ap_start { I 1 bit } ap_ready { O 1 bit } ap_done { O 1 bit } ap_idle { O 1 bit } } \
} "
}


# Adapter definition:
set PortName ap_clk
set DataWd 1 
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc cg_default_interface_gen_clock] == "cg_default_interface_gen_clock"} {
eval "cg_default_interface_gen_clock { \
    id -2 \
    name ${PortName} \
    reset_level 1 \
    sync_rst true \
    corename apif_ap_clk \
    data_wd ${DataWd} \
    op interface \
}"
} else {
puts "@W \[IMPL-113\] Cannot find bus interface model in the library. Ignored generation of bus interface for '${PortName}'"
}
}


# Adapter definition:
set PortName ap_rst
set DataWd 1 
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc cg_default_interface_gen_reset] == "cg_default_interface_gen_reset"} {
eval "cg_default_interface_gen_reset { \
    id -3 \
    name ${PortName} \
    reset_level 1 \
    sync_rst true \
    corename apif_ap_rst \
    data_wd ${DataWd} \
    op interface \
}"
} else {
puts "@W \[IMPL-114\] Cannot find bus interface model in the library. Ignored generation of bus interface for '${PortName}'"
}
}



# merge
if {${::AESL::PGuard_autoexp_gen}} {
    cg_default_interface_gen_dc_end
    cg_default_interface_gen_bundle_end
    AESL_LIB_XILADAPTER::native_axis_end
}


# flow_control definition:
set InstName swiglu_flow_control_loop_pipe_sequential_init_U
set CompName swiglu_flow_control_loop_pipe_sequential_init
set name flow_control_loop_pipe_sequential_init
if {${::AESL::PGuard_autocg_gen} && ${::AESL::PGuard_autocg_ipmgen}} {
if {[info proc ::AESL_LIB_VIRTEX::xil_gen_UPC_flow_control] == "::AESL_LIB_VIRTEX::xil_gen_UPC_flow_control"} {
eval "::AESL_LIB_VIRTEX::xil_gen_UPC_flow_control { \
    name ${name} \
    prefix swiglu_ \
}"
} else {
puts "@W \[IMPL-107\] Cannot find ::AESL_LIB_VIRTEX::xil_gen_UPC_flow_control, check your platform lib"
}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $CompName BINDTYPE interface TYPE internal_upc_flow_control INSTNAME $InstName
}


