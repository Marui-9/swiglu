# This script segment is generated automatically by AutoPilot

set name swiglu_mul_8s_8s_16_1_1
if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $name BINDTYPE {op} TYPE {mul} IMPL {auto} LATENCY 0 ALLOW_PRAGMA 1
}


set name swiglu_mul_8s_6s_14_1_1
if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $name BINDTYPE {op} TYPE {mul} IMPL {auto} LATENCY 0 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler swiglu_mac_muladd_16s_6s_32s_32_4_1 BINDTYPE {op} TYPE {all} IMPL {dsp_slice} LATENCY 3
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler swiglu_mac_muladd_14s_8s_32s_32_4_1 BINDTYPE {op} TYPE {all} IMPL {dsp_slice} LATENCY 3
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
    id 2104 \
    name gate_0 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename gate_0 \
    op interface \
    ports { gate_0_address0 { O 10 vector } gate_0_ce0 { O 1 bit } gate_0_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'gate_0'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2105 \
    name gate_1 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename gate_1 \
    op interface \
    ports { gate_1_address0 { O 10 vector } gate_1_ce0 { O 1 bit } gate_1_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'gate_1'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2106 \
    name gate_2 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename gate_2 \
    op interface \
    ports { gate_2_address0 { O 10 vector } gate_2_ce0 { O 1 bit } gate_2_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'gate_2'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2107 \
    name gate_3 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename gate_3 \
    op interface \
    ports { gate_3_address0 { O 10 vector } gate_3_ce0 { O 1 bit } gate_3_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'gate_3'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2108 \
    name gate_4 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename gate_4 \
    op interface \
    ports { gate_4_address0 { O 10 vector } gate_4_ce0 { O 1 bit } gate_4_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'gate_4'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2109 \
    name gate_5 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename gate_5 \
    op interface \
    ports { gate_5_address0 { O 10 vector } gate_5_ce0 { O 1 bit } gate_5_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'gate_5'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2110 \
    name gate_6 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename gate_6 \
    op interface \
    ports { gate_6_address0 { O 10 vector } gate_6_ce0 { O 1 bit } gate_6_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'gate_6'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2111 \
    name gate_7 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename gate_7 \
    op interface \
    ports { gate_7_address0 { O 10 vector } gate_7_ce0 { O 1 bit } gate_7_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'gate_7'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2113 \
    name ql_buf_0 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename ql_buf_0 \
    op interface \
    ports { ql_buf_0_address0 { O 5 vector } ql_buf_0_ce0 { O 1 bit } ql_buf_0_q0 { I 128 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'ql_buf_0'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2114 \
    name ql_buf_1 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename ql_buf_1 \
    op interface \
    ports { ql_buf_1_address0 { O 5 vector } ql_buf_1_ce0 { O 1 bit } ql_buf_1_q0 { I 128 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'ql_buf_1'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2115 \
    name ql_buf_2 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename ql_buf_2 \
    op interface \
    ports { ql_buf_2_address0 { O 5 vector } ql_buf_2_ce0 { O 1 bit } ql_buf_2_q0 { I 128 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'ql_buf_2'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2116 \
    name ql_buf_3 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename ql_buf_3 \
    op interface \
    ports { ql_buf_3_address0 { O 5 vector } ql_buf_3_ce0 { O 1 bit } ql_buf_3_q0 { I 128 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'ql_buf_3'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2117 \
    name ql_buf_4 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename ql_buf_4 \
    op interface \
    ports { ql_buf_4_address0 { O 5 vector } ql_buf_4_ce0 { O 1 bit } ql_buf_4_q0 { I 128 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'ql_buf_4'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2118 \
    name ql_buf_5 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename ql_buf_5 \
    op interface \
    ports { ql_buf_5_address0 { O 5 vector } ql_buf_5_ce0 { O 1 bit } ql_buf_5_q0 { I 128 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'ql_buf_5'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2119 \
    name ql_buf_6 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename ql_buf_6 \
    op interface \
    ports { ql_buf_6_address0 { O 5 vector } ql_buf_6_ce0 { O 1 bit } ql_buf_6_q0 { I 128 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'ql_buf_6'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2120 \
    name ql_buf_7 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename ql_buf_7 \
    op interface \
    ports { ql_buf_7_address0 { O 5 vector } ql_buf_7_ce0 { O 1 bit } ql_buf_7_q0 { I 128 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'ql_buf_7'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2121 \
    name qh_buf_0 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename qh_buf_0 \
    op interface \
    ports { qh_buf_0_address0 { O 4 vector } qh_buf_0_ce0 { O 1 bit } qh_buf_0_q0 { I 128 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'qh_buf_0'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2122 \
    name qh_buf_1 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename qh_buf_1 \
    op interface \
    ports { qh_buf_1_address0 { O 4 vector } qh_buf_1_ce0 { O 1 bit } qh_buf_1_q0 { I 128 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'qh_buf_1'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2123 \
    name qh_buf_2 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename qh_buf_2 \
    op interface \
    ports { qh_buf_2_address0 { O 4 vector } qh_buf_2_ce0 { O 1 bit } qh_buf_2_q0 { I 128 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'qh_buf_2'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2124 \
    name qh_buf_3 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename qh_buf_3 \
    op interface \
    ports { qh_buf_3_address0 { O 4 vector } qh_buf_3_ce0 { O 1 bit } qh_buf_3_q0 { I 128 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'qh_buf_3'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2125 \
    name qh_buf_4 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename qh_buf_4 \
    op interface \
    ports { qh_buf_4_address0 { O 4 vector } qh_buf_4_ce0 { O 1 bit } qh_buf_4_q0 { I 128 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'qh_buf_4'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2126 \
    name qh_buf_5 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename qh_buf_5 \
    op interface \
    ports { qh_buf_5_address0 { O 4 vector } qh_buf_5_ce0 { O 1 bit } qh_buf_5_q0 { I 128 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'qh_buf_5'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2127 \
    name qh_buf_6 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename qh_buf_6 \
    op interface \
    ports { qh_buf_6_address0 { O 4 vector } qh_buf_6_ce0 { O 1 bit } qh_buf_6_q0 { I 128 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'qh_buf_6'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2128 \
    name qh_buf_7 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename qh_buf_7 \
    op interface \
    ports { qh_buf_7_address0 { O 4 vector } qh_buf_7_ce0 { O 1 bit } qh_buf_7_q0 { I 128 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'qh_buf_7'"
}
}


# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2103 \
    name zext_ln607 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_zext_ln607 \
    op interface \
    ports { zext_ln607 { I 10 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2112 \
    name tmp_87 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_tmp_87 \
    op interface \
    ports { tmp_87 { I 2 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2129 \
    name empty \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_empty \
    op interface \
    ports { empty { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2130 \
    name tmp \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_tmp \
    op interface \
    ports { tmp { I 128 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2131 \
    name tmp_s \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_tmp_s \
    op interface \
    ports { tmp_s { I 128 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2132 \
    name tmp_65 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_tmp_65 \
    op interface \
    ports { tmp_65 { I 128 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2133 \
    name tmp_66 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_tmp_66 \
    op interface \
    ports { tmp_66 { I 128 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2134 \
    name acc_local_load_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_acc_local_load_out \
    op interface \
    ports { acc_local_load_out { O 32 vector } acc_local_load_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2135 \
    name acc_local_1_load_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_acc_local_1_load_out \
    op interface \
    ports { acc_local_1_load_out { O 32 vector } acc_local_1_load_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2136 \
    name acc_local_2_load_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_acc_local_2_load_out \
    op interface \
    ports { acc_local_2_load_out { O 32 vector } acc_local_2_load_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2137 \
    name acc_local_3_load_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_acc_local_3_load_out \
    op interface \
    ports { acc_local_3_load_out { O 32 vector } acc_local_3_load_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2138 \
    name acc_local_4_load_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_acc_local_4_load_out \
    op interface \
    ports { acc_local_4_load_out { O 32 vector } acc_local_4_load_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2139 \
    name acc_local_5_load_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_acc_local_5_load_out \
    op interface \
    ports { acc_local_5_load_out { O 32 vector } acc_local_5_load_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2140 \
    name acc_local_6_load_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_acc_local_6_load_out \
    op interface \
    ports { acc_local_6_load_out { O 32 vector } acc_local_6_load_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2141 \
    name acc_local_7_load_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_acc_local_7_load_out \
    op interface \
    ports { acc_local_7_load_out { O 32 vector } acc_local_7_load_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2142 \
    name acc_local_8_load_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_acc_local_8_load_out \
    op interface \
    ports { acc_local_8_load_out { O 32 vector } acc_local_8_load_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2143 \
    name acc_local_9_load_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_acc_local_9_load_out \
    op interface \
    ports { acc_local_9_load_out { O 32 vector } acc_local_9_load_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2144 \
    name acc_local_10_load_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_acc_local_10_load_out \
    op interface \
    ports { acc_local_10_load_out { O 32 vector } acc_local_10_load_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2145 \
    name acc_local_11_load_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_acc_local_11_load_out \
    op interface \
    ports { acc_local_11_load_out { O 32 vector } acc_local_11_load_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2146 \
    name acc_local_12_load_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_acc_local_12_load_out \
    op interface \
    ports { acc_local_12_load_out { O 32 vector } acc_local_12_load_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2147 \
    name acc_local_13_load_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_acc_local_13_load_out \
    op interface \
    ports { acc_local_13_load_out { O 32 vector } acc_local_13_load_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2148 \
    name acc_local_14_load_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_acc_local_14_load_out \
    op interface \
    ports { acc_local_14_load_out { O 32 vector } acc_local_14_load_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2149 \
    name acc_local_15_load_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_acc_local_15_load_out \
    op interface \
    ports { acc_local_15_load_out { O 32 vector } acc_local_15_load_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2150 \
    name acc_local_16_load_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_acc_local_16_load_out \
    op interface \
    ports { acc_local_16_load_out { O 32 vector } acc_local_16_load_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2151 \
    name acc_local_17_load_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_acc_local_17_load_out \
    op interface \
    ports { acc_local_17_load_out { O 32 vector } acc_local_17_load_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2152 \
    name acc_local_18_load_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_acc_local_18_load_out \
    op interface \
    ports { acc_local_18_load_out { O 32 vector } acc_local_18_load_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2153 \
    name acc_local_19_load_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_acc_local_19_load_out \
    op interface \
    ports { acc_local_19_load_out { O 32 vector } acc_local_19_load_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2154 \
    name acc_local_20_load_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_acc_local_20_load_out \
    op interface \
    ports { acc_local_20_load_out { O 32 vector } acc_local_20_load_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2155 \
    name acc_local_21_load_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_acc_local_21_load_out \
    op interface \
    ports { acc_local_21_load_out { O 32 vector } acc_local_21_load_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2156 \
    name acc_local_22_load_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_acc_local_22_load_out \
    op interface \
    ports { acc_local_22_load_out { O 32 vector } acc_local_22_load_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2157 \
    name acc_local_23_load_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_acc_local_23_load_out \
    op interface \
    ports { acc_local_23_load_out { O 32 vector } acc_local_23_load_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2158 \
    name acc_local_24_load_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_acc_local_24_load_out \
    op interface \
    ports { acc_local_24_load_out { O 32 vector } acc_local_24_load_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2159 \
    name acc_local_25_load_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_acc_local_25_load_out \
    op interface \
    ports { acc_local_25_load_out { O 32 vector } acc_local_25_load_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2160 \
    name acc_local_26_load_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_acc_local_26_load_out \
    op interface \
    ports { acc_local_26_load_out { O 32 vector } acc_local_26_load_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2161 \
    name acc_local_27_load_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_acc_local_27_load_out \
    op interface \
    ports { acc_local_27_load_out { O 32 vector } acc_local_27_load_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2162 \
    name acc_local_28_load_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_acc_local_28_load_out \
    op interface \
    ports { acc_local_28_load_out { O 32 vector } acc_local_28_load_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2163 \
    name acc_local_29_load_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_acc_local_29_load_out \
    op interface \
    ports { acc_local_29_load_out { O 32 vector } acc_local_29_load_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2164 \
    name acc_local_30_load_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_acc_local_30_load_out \
    op interface \
    ports { acc_local_30_load_out { O 32 vector } acc_local_30_load_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2165 \
    name acc_local_31_load_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_acc_local_31_load_out \
    op interface \
    ports { acc_local_31_load_out { O 32 vector } acc_local_31_load_out_ap_vld { O 1 bit } } \
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


