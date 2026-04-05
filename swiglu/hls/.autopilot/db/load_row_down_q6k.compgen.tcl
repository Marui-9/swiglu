# This script segment is generated automatically by AutoPilot

set name swiglu_mul_11ns_14ns_24_1_1
if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $name BINDTYPE {op} TYPE {mul} IMPL {auto} LATENCY 0 ALLOW_PRAGMA 1
}


# clear list
if {${::AESL::PGuard_autoexp_gen}} {
    cg_default_interface_gen_dc_begin
    cg_default_interface_gen_bundle_begin
    AESL_LIB_XILADAPTER::native_axis_begin
}

# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1657 \
    name ql_buf_0 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename ql_buf_0 \
    op interface \
    ports { ql_buf_0_address0 { O 5 vector } ql_buf_0_ce0 { O 1 bit } ql_buf_0_we0 { O 1 bit } ql_buf_0_d0 { O 128 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'ql_buf_0'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1658 \
    name ql_buf_1 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename ql_buf_1 \
    op interface \
    ports { ql_buf_1_address0 { O 5 vector } ql_buf_1_ce0 { O 1 bit } ql_buf_1_we0 { O 1 bit } ql_buf_1_d0 { O 128 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'ql_buf_1'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1659 \
    name ql_buf_2 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename ql_buf_2 \
    op interface \
    ports { ql_buf_2_address0 { O 5 vector } ql_buf_2_ce0 { O 1 bit } ql_buf_2_we0 { O 1 bit } ql_buf_2_d0 { O 128 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'ql_buf_2'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1660 \
    name ql_buf_3 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename ql_buf_3 \
    op interface \
    ports { ql_buf_3_address0 { O 5 vector } ql_buf_3_ce0 { O 1 bit } ql_buf_3_we0 { O 1 bit } ql_buf_3_d0 { O 128 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'ql_buf_3'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1661 \
    name ql_buf_4 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename ql_buf_4 \
    op interface \
    ports { ql_buf_4_address0 { O 5 vector } ql_buf_4_ce0 { O 1 bit } ql_buf_4_we0 { O 1 bit } ql_buf_4_d0 { O 128 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'ql_buf_4'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1662 \
    name ql_buf_5 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename ql_buf_5 \
    op interface \
    ports { ql_buf_5_address0 { O 5 vector } ql_buf_5_ce0 { O 1 bit } ql_buf_5_we0 { O 1 bit } ql_buf_5_d0 { O 128 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'ql_buf_5'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1663 \
    name ql_buf_6 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename ql_buf_6 \
    op interface \
    ports { ql_buf_6_address0 { O 5 vector } ql_buf_6_ce0 { O 1 bit } ql_buf_6_we0 { O 1 bit } ql_buf_6_d0 { O 128 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'ql_buf_6'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1664 \
    name ql_buf_7 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename ql_buf_7 \
    op interface \
    ports { ql_buf_7_address0 { O 5 vector } ql_buf_7_ce0 { O 1 bit } ql_buf_7_we0 { O 1 bit } ql_buf_7_d0 { O 128 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'ql_buf_7'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1665 \
    name qh_buf_0 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename qh_buf_0 \
    op interface \
    ports { qh_buf_0_address0 { O 4 vector } qh_buf_0_ce0 { O 1 bit } qh_buf_0_we0 { O 1 bit } qh_buf_0_d0 { O 128 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'qh_buf_0'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1666 \
    name qh_buf_1 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename qh_buf_1 \
    op interface \
    ports { qh_buf_1_address0 { O 4 vector } qh_buf_1_ce0 { O 1 bit } qh_buf_1_we0 { O 1 bit } qh_buf_1_d0 { O 128 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'qh_buf_1'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1667 \
    name qh_buf_2 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename qh_buf_2 \
    op interface \
    ports { qh_buf_2_address0 { O 4 vector } qh_buf_2_ce0 { O 1 bit } qh_buf_2_we0 { O 1 bit } qh_buf_2_d0 { O 128 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'qh_buf_2'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1668 \
    name qh_buf_3 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename qh_buf_3 \
    op interface \
    ports { qh_buf_3_address0 { O 4 vector } qh_buf_3_ce0 { O 1 bit } qh_buf_3_we0 { O 1 bit } qh_buf_3_d0 { O 128 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'qh_buf_3'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1669 \
    name qh_buf_4 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename qh_buf_4 \
    op interface \
    ports { qh_buf_4_address0 { O 4 vector } qh_buf_4_ce0 { O 1 bit } qh_buf_4_we0 { O 1 bit } qh_buf_4_d0 { O 128 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'qh_buf_4'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1670 \
    name qh_buf_5 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename qh_buf_5 \
    op interface \
    ports { qh_buf_5_address0 { O 4 vector } qh_buf_5_ce0 { O 1 bit } qh_buf_5_we0 { O 1 bit } qh_buf_5_d0 { O 128 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'qh_buf_5'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1671 \
    name qh_buf_6 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename qh_buf_6 \
    op interface \
    ports { qh_buf_6_address0 { O 4 vector } qh_buf_6_ce0 { O 1 bit } qh_buf_6_we0 { O 1 bit } qh_buf_6_d0 { O 128 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'qh_buf_6'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1672 \
    name qh_buf_7 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename qh_buf_7 \
    op interface \
    ports { qh_buf_7_address0 { O 4 vector } qh_buf_7_ce0 { O 1 bit } qh_buf_7_we0 { O 1 bit } qh_buf_7_d0 { O 128 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'qh_buf_7'"
}
}


# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1654 \
    name gmem_Wd \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_gmem_Wd \
    op interface \
    ports { m_axi_gmem_Wd_0_AWVALID { O 1 bit } m_axi_gmem_Wd_0_AWREADY { I 1 bit } m_axi_gmem_Wd_0_AWADDR { O 64 vector } m_axi_gmem_Wd_0_AWID { O 1 vector } m_axi_gmem_Wd_0_AWLEN { O 32 vector } m_axi_gmem_Wd_0_AWSIZE { O 3 vector } m_axi_gmem_Wd_0_AWBURST { O 2 vector } m_axi_gmem_Wd_0_AWLOCK { O 2 vector } m_axi_gmem_Wd_0_AWCACHE { O 4 vector } m_axi_gmem_Wd_0_AWPROT { O 3 vector } m_axi_gmem_Wd_0_AWQOS { O 4 vector } m_axi_gmem_Wd_0_AWREGION { O 4 vector } m_axi_gmem_Wd_0_AWUSER { O 1 vector } m_axi_gmem_Wd_0_WVALID { O 1 bit } m_axi_gmem_Wd_0_WREADY { I 1 bit } m_axi_gmem_Wd_0_WDATA { O 128 vector } m_axi_gmem_Wd_0_WSTRB { O 16 vector } m_axi_gmem_Wd_0_WLAST { O 1 bit } m_axi_gmem_Wd_0_WID { O 1 vector } m_axi_gmem_Wd_0_WUSER { O 1 vector } m_axi_gmem_Wd_0_ARVALID { O 1 bit } m_axi_gmem_Wd_0_ARREADY { I 1 bit } m_axi_gmem_Wd_0_ARADDR { O 64 vector } m_axi_gmem_Wd_0_ARID { O 1 vector } m_axi_gmem_Wd_0_ARLEN { O 32 vector } m_axi_gmem_Wd_0_ARSIZE { O 3 vector } m_axi_gmem_Wd_0_ARBURST { O 2 vector } m_axi_gmem_Wd_0_ARLOCK { O 2 vector } m_axi_gmem_Wd_0_ARCACHE { O 4 vector } m_axi_gmem_Wd_0_ARPROT { O 3 vector } m_axi_gmem_Wd_0_ARQOS { O 4 vector } m_axi_gmem_Wd_0_ARREGION { O 4 vector } m_axi_gmem_Wd_0_ARUSER { O 1 vector } m_axi_gmem_Wd_0_RVALID { I 1 bit } m_axi_gmem_Wd_0_RREADY { O 1 bit } m_axi_gmem_Wd_0_RDATA { I 128 vector } m_axi_gmem_Wd_0_RLAST { I 1 bit } m_axi_gmem_Wd_0_RID { I 1 vector } m_axi_gmem_Wd_0_RFIFONUM { I 10 vector } m_axi_gmem_Wd_0_RUSER { I 1 vector } m_axi_gmem_Wd_0_RRESP { I 2 vector } m_axi_gmem_Wd_0_BVALID { I 1 bit } m_axi_gmem_Wd_0_BREADY { O 1 bit } m_axi_gmem_Wd_0_BRESP { I 2 vector } m_axi_gmem_Wd_0_BID { I 1 vector } m_axi_gmem_Wd_0_BUSER { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1655 \
    name W_down_wide \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_W_down_wide \
    op interface \
    ports { W_down_wide { I 64 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1656 \
    name out_i \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_out_i \
    op interface \
    ports { out_i { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1673 \
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
    id 1674 \
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
    id 1675 \
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
    id 1676 \
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
    id 1677 \
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
    id 1678 \
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
    id 1679 \
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
    id 1680 \
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
    id 1681 \
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
    id 1682 \
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
    id 1683 \
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
    id 1684 \
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
    id 1685 \
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
    id 1686 \
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
    id 1687 \
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
    id 1688 \
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
    id 1689 \
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
    id 1690 \
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
    id 1691 \
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
    id 1692 \
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
    id 1693 \
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
    id 1694 \
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
    id 1695 \
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
    id 1696 \
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
    id 1697 \
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
    id 1698 \
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
    id 1699 \
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
    id 1700 \
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
    id 1701 \
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
    id 1702 \
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
    id 1703 \
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
    id 1704 \
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
    id 1705 \
    name d_buf_0 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_d_buf_0 \
    op interface \
    ports { d_buf_0 { O 32 vector } d_buf_0_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1706 \
    name d_buf_1 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_d_buf_1 \
    op interface \
    ports { d_buf_1 { O 32 vector } d_buf_1_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1707 \
    name d_buf_2 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_d_buf_2 \
    op interface \
    ports { d_buf_2 { O 32 vector } d_buf_2_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1708 \
    name d_buf_3 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_d_buf_3 \
    op interface \
    ports { d_buf_3 { O 32 vector } d_buf_3_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1709 \
    name d_buf_4 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_d_buf_4 \
    op interface \
    ports { d_buf_4 { O 32 vector } d_buf_4_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1710 \
    name d_buf_5 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_d_buf_5 \
    op interface \
    ports { d_buf_5 { O 32 vector } d_buf_5_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1711 \
    name d_buf_6 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_d_buf_6 \
    op interface \
    ports { d_buf_6 { O 32 vector } d_buf_6_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1712 \
    name d_buf_7 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_d_buf_7 \
    op interface \
    ports { d_buf_7 { O 32 vector } d_buf_7_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1713 \
    name d_buf_8 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_d_buf_8 \
    op interface \
    ports { d_buf_8 { O 32 vector } d_buf_8_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1714 \
    name d_buf_9 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_d_buf_9 \
    op interface \
    ports { d_buf_9 { O 32 vector } d_buf_9_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1715 \
    name d_buf_10 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_d_buf_10 \
    op interface \
    ports { d_buf_10 { O 32 vector } d_buf_10_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1716 \
    name d_buf_11 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_d_buf_11 \
    op interface \
    ports { d_buf_11 { O 32 vector } d_buf_11_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1717 \
    name d_buf_12 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_d_buf_12 \
    op interface \
    ports { d_buf_12 { O 32 vector } d_buf_12_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1718 \
    name d_buf_13 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_d_buf_13 \
    op interface \
    ports { d_buf_13 { O 32 vector } d_buf_13_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1719 \
    name d_buf_14 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_d_buf_14 \
    op interface \
    ports { d_buf_14 { O 32 vector } d_buf_14_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1720 \
    name d_buf_15 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_d_buf_15 \
    op interface \
    ports { d_buf_15 { O 32 vector } d_buf_15_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1721 \
    name d_buf_16 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_d_buf_16 \
    op interface \
    ports { d_buf_16 { O 32 vector } d_buf_16_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1722 \
    name d_buf_17 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_d_buf_17 \
    op interface \
    ports { d_buf_17 { O 32 vector } d_buf_17_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1723 \
    name d_buf_18 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_d_buf_18 \
    op interface \
    ports { d_buf_18 { O 32 vector } d_buf_18_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1724 \
    name d_buf_19 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_d_buf_19 \
    op interface \
    ports { d_buf_19 { O 32 vector } d_buf_19_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1725 \
    name d_buf_20 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_d_buf_20 \
    op interface \
    ports { d_buf_20 { O 32 vector } d_buf_20_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1726 \
    name d_buf_21 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_d_buf_21 \
    op interface \
    ports { d_buf_21 { O 32 vector } d_buf_21_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1727 \
    name d_buf_22 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_d_buf_22 \
    op interface \
    ports { d_buf_22 { O 32 vector } d_buf_22_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1728 \
    name d_buf_23 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_d_buf_23 \
    op interface \
    ports { d_buf_23 { O 32 vector } d_buf_23_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1729 \
    name d_buf_24 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_d_buf_24 \
    op interface \
    ports { d_buf_24 { O 32 vector } d_buf_24_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1730 \
    name d_buf_25 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_d_buf_25 \
    op interface \
    ports { d_buf_25 { O 32 vector } d_buf_25_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1731 \
    name d_buf_26 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_d_buf_26 \
    op interface \
    ports { d_buf_26 { O 32 vector } d_buf_26_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1732 \
    name d_buf_27 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_d_buf_27 \
    op interface \
    ports { d_buf_27 { O 32 vector } d_buf_27_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1733 \
    name d_buf_28 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_d_buf_28 \
    op interface \
    ports { d_buf_28 { O 32 vector } d_buf_28_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1734 \
    name d_buf_29 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_d_buf_29 \
    op interface \
    ports { d_buf_29 { O 32 vector } d_buf_29_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1735 \
    name d_buf_30 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_d_buf_30 \
    op interface \
    ports { d_buf_30 { O 32 vector } d_buf_30_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1736 \
    name d_buf_31 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_d_buf_31 \
    op interface \
    ports { d_buf_31 { O 32 vector } d_buf_31_ap_vld { O 1 bit } } \
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
    ports { ap_start { I 1 bit } ap_ready { O 1 bit } ap_done { O 1 bit } ap_idle { O 1 bit } ap_continue { I 1 bit } } \
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


