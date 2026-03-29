# This script segment is generated automatically by AutoPilot

set name swiglu_mul_5ns_9ns_13_1_1
if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $name BINDTYPE {op} TYPE {mul} IMPL {auto} LATENCY 0 ALLOW_PRAGMA 1
}


set name swiglu_fadd_32ns_32ns_32_8_no_dsp_1
if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $name BINDTYPE {op} TYPE {fadd} IMPL {fabric} LATENCY 7 ALLOW_PRAGMA 1
}


set name swiglu_sitofp_32s_32_7_no_dsp_1
if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $name BINDTYPE {op} TYPE {sitofp} IMPL {auto} LATENCY 6 ALLOW_PRAGMA 1
}


set name swiglu_sitofp_32s_32_7_no_dsp_1
if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $name BINDTYPE {op} TYPE {sitofp} IMPL {auto} LATENCY 6 ALLOW_PRAGMA 1
}


set name swiglu_sitofp_32s_32_7_no_dsp_1
if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $name BINDTYPE {op} TYPE {sitofp} IMPL {auto} LATENCY 6 ALLOW_PRAGMA 1
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
    id 1645 \
    name rb_0 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename rb_0 \
    op interface \
    ports { rb_0_address0 { O 5 vector } rb_0_ce0 { O 1 bit } rb_0_q0 { I 128 vector } rb_0_address1 { O 5 vector } rb_0_ce1 { O 1 bit } rb_0_q1 { I 128 vector } rb_0_address2 { O 5 vector } rb_0_ce2 { O 1 bit } rb_0_q2 { I 128 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'rb_0'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1646 \
    name rb_1 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename rb_1 \
    op interface \
    ports { rb_1_address0 { O 5 vector } rb_1_ce0 { O 1 bit } rb_1_q0 { I 128 vector } rb_1_address1 { O 5 vector } rb_1_ce1 { O 1 bit } rb_1_q1 { I 128 vector } rb_1_address2 { O 5 vector } rb_1_ce2 { O 1 bit } rb_1_q2 { I 128 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'rb_1'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1647 \
    name rb_2 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename rb_2 \
    op interface \
    ports { rb_2_address0 { O 5 vector } rb_2_ce0 { O 1 bit } rb_2_q0 { I 128 vector } rb_2_address1 { O 5 vector } rb_2_ce1 { O 1 bit } rb_2_q1 { I 128 vector } rb_2_address2 { O 5 vector } rb_2_ce2 { O 1 bit } rb_2_q2 { I 128 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'rb_2'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1648 \
    name rb_3 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename rb_3 \
    op interface \
    ports { rb_3_address0 { O 5 vector } rb_3_ce0 { O 1 bit } rb_3_q0 { I 128 vector } rb_3_address1 { O 5 vector } rb_3_ce1 { O 1 bit } rb_3_q1 { I 128 vector } rb_3_address2 { O 5 vector } rb_3_ce2 { O 1 bit } rb_3_q2 { I 128 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'rb_3'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1649 \
    name rb_4 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename rb_4 \
    op interface \
    ports { rb_4_address0 { O 5 vector } rb_4_ce0 { O 1 bit } rb_4_q0 { I 128 vector } rb_4_address1 { O 5 vector } rb_4_ce1 { O 1 bit } rb_4_q1 { I 128 vector } rb_4_address2 { O 5 vector } rb_4_ce2 { O 1 bit } rb_4_q2 { I 128 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'rb_4'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1650 \
    name rb_5 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename rb_5 \
    op interface \
    ports { rb_5_address0 { O 5 vector } rb_5_ce0 { O 1 bit } rb_5_q0 { I 128 vector } rb_5_address1 { O 5 vector } rb_5_ce1 { O 1 bit } rb_5_q1 { I 128 vector } rb_5_address2 { O 5 vector } rb_5_ce2 { O 1 bit } rb_5_q2 { I 128 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'rb_5'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1651 \
    name rb_6 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename rb_6 \
    op interface \
    ports { rb_6_address0 { O 5 vector } rb_6_ce0 { O 1 bit } rb_6_q0 { I 128 vector } rb_6_address1 { O 5 vector } rb_6_ce1 { O 1 bit } rb_6_q1 { I 128 vector } rb_6_address2 { O 5 vector } rb_6_ce2 { O 1 bit } rb_6_q2 { I 128 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'rb_6'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1652 \
    name rb_7 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename rb_7 \
    op interface \
    ports { rb_7_address0 { O 5 vector } rb_7_ce0 { O 1 bit } rb_7_q0 { I 128 vector } rb_7_address1 { O 5 vector } rb_7_ce1 { O 1 bit } rb_7_q1 { I 128 vector } rb_7_address2 { O 5 vector } rb_7_ce2 { O 1 bit } rb_7_q2 { I 128 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'rb_7'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1653 \
    name rb_8 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename rb_8 \
    op interface \
    ports { rb_8_address0 { O 5 vector } rb_8_ce0 { O 1 bit } rb_8_q0 { I 128 vector } rb_8_address1 { O 5 vector } rb_8_ce1 { O 1 bit } rb_8_q1 { I 128 vector } rb_8_address2 { O 5 vector } rb_8_ce2 { O 1 bit } rb_8_q2 { I 128 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'rb_8'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1654 \
    name rb_9 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename rb_9 \
    op interface \
    ports { rb_9_address0 { O 5 vector } rb_9_ce0 { O 1 bit } rb_9_q0 { I 128 vector } rb_9_address1 { O 5 vector } rb_9_ce1 { O 1 bit } rb_9_q1 { I 128 vector } rb_9_address2 { O 5 vector } rb_9_ce2 { O 1 bit } rb_9_q2 { I 128 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'rb_9'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1655 \
    name rb_10 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename rb_10 \
    op interface \
    ports { rb_10_address0 { O 5 vector } rb_10_ce0 { O 1 bit } rb_10_q0 { I 128 vector } rb_10_address1 { O 5 vector } rb_10_ce1 { O 1 bit } rb_10_q1 { I 128 vector } rb_10_address2 { O 5 vector } rb_10_ce2 { O 1 bit } rb_10_q2 { I 128 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'rb_10'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1656 \
    name rb_11 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename rb_11 \
    op interface \
    ports { rb_11_address0 { O 5 vector } rb_11_ce0 { O 1 bit } rb_11_q0 { I 128 vector } rb_11_address1 { O 5 vector } rb_11_ce1 { O 1 bit } rb_11_q1 { I 128 vector } rb_11_address2 { O 5 vector } rb_11_ce2 { O 1 bit } rb_11_q2 { I 128 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'rb_11'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1657 \
    name rb_12 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename rb_12 \
    op interface \
    ports { rb_12_address0 { O 5 vector } rb_12_ce0 { O 1 bit } rb_12_q0 { I 128 vector } rb_12_address1 { O 5 vector } rb_12_ce1 { O 1 bit } rb_12_q1 { I 128 vector } rb_12_address2 { O 5 vector } rb_12_ce2 { O 1 bit } rb_12_q2 { I 128 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'rb_12'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1658 \
    name rb_13 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename rb_13 \
    op interface \
    ports { rb_13_address0 { O 5 vector } rb_13_ce0 { O 1 bit } rb_13_q0 { I 128 vector } rb_13_address1 { O 5 vector } rb_13_ce1 { O 1 bit } rb_13_q1 { I 128 vector } rb_13_address2 { O 5 vector } rb_13_ce2 { O 1 bit } rb_13_q2 { I 128 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'rb_13'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1659 \
    name rb_14 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename rb_14 \
    op interface \
    ports { rb_14_address0 { O 5 vector } rb_14_ce0 { O 1 bit } rb_14_q0 { I 128 vector } rb_14_address1 { O 5 vector } rb_14_ce1 { O 1 bit } rb_14_q1 { I 128 vector } rb_14_address2 { O 5 vector } rb_14_ce2 { O 1 bit } rb_14_q2 { I 128 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'rb_14'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1660 \
    name rb_15 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename rb_15 \
    op interface \
    ports { rb_15_address0 { O 5 vector } rb_15_ce0 { O 1 bit } rb_15_q0 { I 128 vector } rb_15_address1 { O 5 vector } rb_15_ce1 { O 1 bit } rb_15_q1 { I 128 vector } rb_15_address2 { O 5 vector } rb_15_ce2 { O 1 bit } rb_15_q2 { I 128 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'rb_15'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1661 \
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
    id 1662 \
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
    id 1663 \
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
    id 1664 \
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
    id 1665 \
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
    id 1666 \
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
    id 1667 \
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
    id 1668 \
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


# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1669 \
    name gate_scale \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_gate_scale \
    op interface \
    ports { gate_scale { I 32 vector } } \
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

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id -2 \
    name ap_return \
    type ap_return \
    reset_level 1 \
    sync_rst true \
    corename ap_return \
    op interface \
    ports { ap_return { O 32 vector } } \
} "
}


# Adapter definition:
set PortName ap_clk
set DataWd 1 
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc cg_default_interface_gen_clock] == "cg_default_interface_gen_clock"} {
eval "cg_default_interface_gen_clock { \
    id -3 \
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
    id -4 \
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


