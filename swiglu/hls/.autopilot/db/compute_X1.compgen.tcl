# This script segment is generated automatically by AutoPilot

if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler swiglu_compute_X1_row_buf_RAM_1P_BRAM_1R1W BINDTYPE {storage} TYPE {ram_1p} IMPL {bram} LATENCY 2 ALLOW_PRAGMA 1
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
    id 1058 \
    name x_local_1_0_0 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_0_0 \
    op interface \
    ports { x_local_1_0_0_address0 { O 4 vector } x_local_1_0_0_ce0 { O 1 bit } x_local_1_0_0_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_0_0'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1059 \
    name x_local_1_0_1 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_0_1 \
    op interface \
    ports { x_local_1_0_1_address0 { O 4 vector } x_local_1_0_1_ce0 { O 1 bit } x_local_1_0_1_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_0_1'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1060 \
    name x_local_1_0_2 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_0_2 \
    op interface \
    ports { x_local_1_0_2_address0 { O 4 vector } x_local_1_0_2_ce0 { O 1 bit } x_local_1_0_2_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_0_2'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1061 \
    name x_local_1_0_3 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_0_3 \
    op interface \
    ports { x_local_1_0_3_address0 { O 4 vector } x_local_1_0_3_ce0 { O 1 bit } x_local_1_0_3_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_0_3'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1062 \
    name x_local_1_0_4 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_0_4 \
    op interface \
    ports { x_local_1_0_4_address0 { O 4 vector } x_local_1_0_4_ce0 { O 1 bit } x_local_1_0_4_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_0_4'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1063 \
    name x_local_1_0_5 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_0_5 \
    op interface \
    ports { x_local_1_0_5_address0 { O 4 vector } x_local_1_0_5_ce0 { O 1 bit } x_local_1_0_5_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_0_5'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1064 \
    name x_local_1_0_6 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_0_6 \
    op interface \
    ports { x_local_1_0_6_address0 { O 4 vector } x_local_1_0_6_ce0 { O 1 bit } x_local_1_0_6_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_0_6'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1065 \
    name x_local_1_0_7 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_0_7 \
    op interface \
    ports { x_local_1_0_7_address0 { O 4 vector } x_local_1_0_7_ce0 { O 1 bit } x_local_1_0_7_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_0_7'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1066 \
    name x_local_1_0_8 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_0_8 \
    op interface \
    ports { x_local_1_0_8_address0 { O 4 vector } x_local_1_0_8_ce0 { O 1 bit } x_local_1_0_8_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_0_8'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1067 \
    name x_local_1_0_9 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_0_9 \
    op interface \
    ports { x_local_1_0_9_address0 { O 4 vector } x_local_1_0_9_ce0 { O 1 bit } x_local_1_0_9_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_0_9'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1068 \
    name x_local_1_0_10 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_0_10 \
    op interface \
    ports { x_local_1_0_10_address0 { O 4 vector } x_local_1_0_10_ce0 { O 1 bit } x_local_1_0_10_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_0_10'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1069 \
    name x_local_1_0_11 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_0_11 \
    op interface \
    ports { x_local_1_0_11_address0 { O 4 vector } x_local_1_0_11_ce0 { O 1 bit } x_local_1_0_11_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_0_11'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1070 \
    name x_local_1_0_12 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_0_12 \
    op interface \
    ports { x_local_1_0_12_address0 { O 4 vector } x_local_1_0_12_ce0 { O 1 bit } x_local_1_0_12_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_0_12'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1071 \
    name x_local_1_0_13 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_0_13 \
    op interface \
    ports { x_local_1_0_13_address0 { O 4 vector } x_local_1_0_13_ce0 { O 1 bit } x_local_1_0_13_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_0_13'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1072 \
    name x_local_1_0_14 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_0_14 \
    op interface \
    ports { x_local_1_0_14_address0 { O 4 vector } x_local_1_0_14_ce0 { O 1 bit } x_local_1_0_14_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_0_14'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1073 \
    name x_local_1_0_15 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_0_15 \
    op interface \
    ports { x_local_1_0_15_address0 { O 4 vector } x_local_1_0_15_ce0 { O 1 bit } x_local_1_0_15_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_0_15'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1074 \
    name x_local_1_1_0 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_1_0 \
    op interface \
    ports { x_local_1_1_0_address0 { O 4 vector } x_local_1_1_0_ce0 { O 1 bit } x_local_1_1_0_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_1_0'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1075 \
    name x_local_1_1_1 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_1_1 \
    op interface \
    ports { x_local_1_1_1_address0 { O 4 vector } x_local_1_1_1_ce0 { O 1 bit } x_local_1_1_1_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_1_1'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1076 \
    name x_local_1_1_2 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_1_2 \
    op interface \
    ports { x_local_1_1_2_address0 { O 4 vector } x_local_1_1_2_ce0 { O 1 bit } x_local_1_1_2_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_1_2'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1077 \
    name x_local_1_1_3 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_1_3 \
    op interface \
    ports { x_local_1_1_3_address0 { O 4 vector } x_local_1_1_3_ce0 { O 1 bit } x_local_1_1_3_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_1_3'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1078 \
    name x_local_1_1_4 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_1_4 \
    op interface \
    ports { x_local_1_1_4_address0 { O 4 vector } x_local_1_1_4_ce0 { O 1 bit } x_local_1_1_4_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_1_4'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1079 \
    name x_local_1_1_5 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_1_5 \
    op interface \
    ports { x_local_1_1_5_address0 { O 4 vector } x_local_1_1_5_ce0 { O 1 bit } x_local_1_1_5_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_1_5'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1080 \
    name x_local_1_1_6 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_1_6 \
    op interface \
    ports { x_local_1_1_6_address0 { O 4 vector } x_local_1_1_6_ce0 { O 1 bit } x_local_1_1_6_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_1_6'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1081 \
    name x_local_1_1_7 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_1_7 \
    op interface \
    ports { x_local_1_1_7_address0 { O 4 vector } x_local_1_1_7_ce0 { O 1 bit } x_local_1_1_7_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_1_7'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1082 \
    name x_local_1_1_8 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_1_8 \
    op interface \
    ports { x_local_1_1_8_address0 { O 4 vector } x_local_1_1_8_ce0 { O 1 bit } x_local_1_1_8_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_1_8'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1083 \
    name x_local_1_1_9 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_1_9 \
    op interface \
    ports { x_local_1_1_9_address0 { O 4 vector } x_local_1_1_9_ce0 { O 1 bit } x_local_1_1_9_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_1_9'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1084 \
    name x_local_1_1_10 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_1_10 \
    op interface \
    ports { x_local_1_1_10_address0 { O 4 vector } x_local_1_1_10_ce0 { O 1 bit } x_local_1_1_10_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_1_10'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1085 \
    name x_local_1_1_11 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_1_11 \
    op interface \
    ports { x_local_1_1_11_address0 { O 4 vector } x_local_1_1_11_ce0 { O 1 bit } x_local_1_1_11_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_1_11'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1086 \
    name x_local_1_1_12 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_1_12 \
    op interface \
    ports { x_local_1_1_12_address0 { O 4 vector } x_local_1_1_12_ce0 { O 1 bit } x_local_1_1_12_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_1_12'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1087 \
    name x_local_1_1_13 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_1_13 \
    op interface \
    ports { x_local_1_1_13_address0 { O 4 vector } x_local_1_1_13_ce0 { O 1 bit } x_local_1_1_13_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_1_13'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1088 \
    name x_local_1_1_14 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_1_14 \
    op interface \
    ports { x_local_1_1_14_address0 { O 4 vector } x_local_1_1_14_ce0 { O 1 bit } x_local_1_1_14_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_1_14'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1089 \
    name x_local_1_1_15 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_1_15 \
    op interface \
    ports { x_local_1_1_15_address0 { O 4 vector } x_local_1_1_15_ce0 { O 1 bit } x_local_1_1_15_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_1_15'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1090 \
    name x_local_1_2_0 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_2_0 \
    op interface \
    ports { x_local_1_2_0_address0 { O 4 vector } x_local_1_2_0_ce0 { O 1 bit } x_local_1_2_0_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_2_0'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1091 \
    name x_local_1_2_1 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_2_1 \
    op interface \
    ports { x_local_1_2_1_address0 { O 4 vector } x_local_1_2_1_ce0 { O 1 bit } x_local_1_2_1_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_2_1'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1092 \
    name x_local_1_2_2 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_2_2 \
    op interface \
    ports { x_local_1_2_2_address0 { O 4 vector } x_local_1_2_2_ce0 { O 1 bit } x_local_1_2_2_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_2_2'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1093 \
    name x_local_1_2_3 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_2_3 \
    op interface \
    ports { x_local_1_2_3_address0 { O 4 vector } x_local_1_2_3_ce0 { O 1 bit } x_local_1_2_3_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_2_3'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1094 \
    name x_local_1_2_4 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_2_4 \
    op interface \
    ports { x_local_1_2_4_address0 { O 4 vector } x_local_1_2_4_ce0 { O 1 bit } x_local_1_2_4_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_2_4'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1095 \
    name x_local_1_2_5 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_2_5 \
    op interface \
    ports { x_local_1_2_5_address0 { O 4 vector } x_local_1_2_5_ce0 { O 1 bit } x_local_1_2_5_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_2_5'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1096 \
    name x_local_1_2_6 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_2_6 \
    op interface \
    ports { x_local_1_2_6_address0 { O 4 vector } x_local_1_2_6_ce0 { O 1 bit } x_local_1_2_6_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_2_6'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1097 \
    name x_local_1_2_7 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_2_7 \
    op interface \
    ports { x_local_1_2_7_address0 { O 4 vector } x_local_1_2_7_ce0 { O 1 bit } x_local_1_2_7_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_2_7'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1098 \
    name x_local_1_2_8 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_2_8 \
    op interface \
    ports { x_local_1_2_8_address0 { O 4 vector } x_local_1_2_8_ce0 { O 1 bit } x_local_1_2_8_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_2_8'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1099 \
    name x_local_1_2_9 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_2_9 \
    op interface \
    ports { x_local_1_2_9_address0 { O 4 vector } x_local_1_2_9_ce0 { O 1 bit } x_local_1_2_9_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_2_9'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1100 \
    name x_local_1_2_10 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_2_10 \
    op interface \
    ports { x_local_1_2_10_address0 { O 4 vector } x_local_1_2_10_ce0 { O 1 bit } x_local_1_2_10_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_2_10'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1101 \
    name x_local_1_2_11 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_2_11 \
    op interface \
    ports { x_local_1_2_11_address0 { O 4 vector } x_local_1_2_11_ce0 { O 1 bit } x_local_1_2_11_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_2_11'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1102 \
    name x_local_1_2_12 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_2_12 \
    op interface \
    ports { x_local_1_2_12_address0 { O 4 vector } x_local_1_2_12_ce0 { O 1 bit } x_local_1_2_12_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_2_12'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1103 \
    name x_local_1_2_13 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_2_13 \
    op interface \
    ports { x_local_1_2_13_address0 { O 4 vector } x_local_1_2_13_ce0 { O 1 bit } x_local_1_2_13_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_2_13'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1104 \
    name x_local_1_2_14 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_2_14 \
    op interface \
    ports { x_local_1_2_14_address0 { O 4 vector } x_local_1_2_14_ce0 { O 1 bit } x_local_1_2_14_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_2_14'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1105 \
    name x_local_1_2_15 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_2_15 \
    op interface \
    ports { x_local_1_2_15_address0 { O 4 vector } x_local_1_2_15_ce0 { O 1 bit } x_local_1_2_15_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_2_15'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1106 \
    name x_local_1_3_0 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_3_0 \
    op interface \
    ports { x_local_1_3_0_address0 { O 4 vector } x_local_1_3_0_ce0 { O 1 bit } x_local_1_3_0_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_3_0'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1107 \
    name x_local_1_3_1 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_3_1 \
    op interface \
    ports { x_local_1_3_1_address0 { O 4 vector } x_local_1_3_1_ce0 { O 1 bit } x_local_1_3_1_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_3_1'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1108 \
    name x_local_1_3_2 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_3_2 \
    op interface \
    ports { x_local_1_3_2_address0 { O 4 vector } x_local_1_3_2_ce0 { O 1 bit } x_local_1_3_2_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_3_2'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1109 \
    name x_local_1_3_3 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_3_3 \
    op interface \
    ports { x_local_1_3_3_address0 { O 4 vector } x_local_1_3_3_ce0 { O 1 bit } x_local_1_3_3_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_3_3'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1110 \
    name x_local_1_3_4 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_3_4 \
    op interface \
    ports { x_local_1_3_4_address0 { O 4 vector } x_local_1_3_4_ce0 { O 1 bit } x_local_1_3_4_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_3_4'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1111 \
    name x_local_1_3_5 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_3_5 \
    op interface \
    ports { x_local_1_3_5_address0 { O 4 vector } x_local_1_3_5_ce0 { O 1 bit } x_local_1_3_5_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_3_5'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1112 \
    name x_local_1_3_6 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_3_6 \
    op interface \
    ports { x_local_1_3_6_address0 { O 4 vector } x_local_1_3_6_ce0 { O 1 bit } x_local_1_3_6_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_3_6'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1113 \
    name x_local_1_3_7 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_3_7 \
    op interface \
    ports { x_local_1_3_7_address0 { O 4 vector } x_local_1_3_7_ce0 { O 1 bit } x_local_1_3_7_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_3_7'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1114 \
    name x_local_1_3_8 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_3_8 \
    op interface \
    ports { x_local_1_3_8_address0 { O 4 vector } x_local_1_3_8_ce0 { O 1 bit } x_local_1_3_8_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_3_8'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1115 \
    name x_local_1_3_9 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_3_9 \
    op interface \
    ports { x_local_1_3_9_address0 { O 4 vector } x_local_1_3_9_ce0 { O 1 bit } x_local_1_3_9_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_3_9'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1116 \
    name x_local_1_3_10 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_3_10 \
    op interface \
    ports { x_local_1_3_10_address0 { O 4 vector } x_local_1_3_10_ce0 { O 1 bit } x_local_1_3_10_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_3_10'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1117 \
    name x_local_1_3_11 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_3_11 \
    op interface \
    ports { x_local_1_3_11_address0 { O 4 vector } x_local_1_3_11_ce0 { O 1 bit } x_local_1_3_11_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_3_11'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1118 \
    name x_local_1_3_12 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_3_12 \
    op interface \
    ports { x_local_1_3_12_address0 { O 4 vector } x_local_1_3_12_ce0 { O 1 bit } x_local_1_3_12_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_3_12'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1119 \
    name x_local_1_3_13 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_3_13 \
    op interface \
    ports { x_local_1_3_13_address0 { O 4 vector } x_local_1_3_13_ce0 { O 1 bit } x_local_1_3_13_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_3_13'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1120 \
    name x_local_1_3_14 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_3_14 \
    op interface \
    ports { x_local_1_3_14_address0 { O 4 vector } x_local_1_3_14_ce0 { O 1 bit } x_local_1_3_14_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_3_14'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1121 \
    name x_local_1_3_15 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_3_15 \
    op interface \
    ports { x_local_1_3_15_address0 { O 4 vector } x_local_1_3_15_ce0 { O 1 bit } x_local_1_3_15_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_3_15'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1122 \
    name x_local_1_4_0 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_4_0 \
    op interface \
    ports { x_local_1_4_0_address0 { O 4 vector } x_local_1_4_0_ce0 { O 1 bit } x_local_1_4_0_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_4_0'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1123 \
    name x_local_1_4_1 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_4_1 \
    op interface \
    ports { x_local_1_4_1_address0 { O 4 vector } x_local_1_4_1_ce0 { O 1 bit } x_local_1_4_1_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_4_1'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1124 \
    name x_local_1_4_2 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_4_2 \
    op interface \
    ports { x_local_1_4_2_address0 { O 4 vector } x_local_1_4_2_ce0 { O 1 bit } x_local_1_4_2_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_4_2'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1125 \
    name x_local_1_4_3 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_4_3 \
    op interface \
    ports { x_local_1_4_3_address0 { O 4 vector } x_local_1_4_3_ce0 { O 1 bit } x_local_1_4_3_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_4_3'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1126 \
    name x_local_1_4_4 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_4_4 \
    op interface \
    ports { x_local_1_4_4_address0 { O 4 vector } x_local_1_4_4_ce0 { O 1 bit } x_local_1_4_4_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_4_4'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1127 \
    name x_local_1_4_5 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_4_5 \
    op interface \
    ports { x_local_1_4_5_address0 { O 4 vector } x_local_1_4_5_ce0 { O 1 bit } x_local_1_4_5_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_4_5'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1128 \
    name x_local_1_4_6 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_4_6 \
    op interface \
    ports { x_local_1_4_6_address0 { O 4 vector } x_local_1_4_6_ce0 { O 1 bit } x_local_1_4_6_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_4_6'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1129 \
    name x_local_1_4_7 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_4_7 \
    op interface \
    ports { x_local_1_4_7_address0 { O 4 vector } x_local_1_4_7_ce0 { O 1 bit } x_local_1_4_7_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_4_7'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1130 \
    name x_local_1_4_8 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_4_8 \
    op interface \
    ports { x_local_1_4_8_address0 { O 4 vector } x_local_1_4_8_ce0 { O 1 bit } x_local_1_4_8_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_4_8'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1131 \
    name x_local_1_4_9 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_4_9 \
    op interface \
    ports { x_local_1_4_9_address0 { O 4 vector } x_local_1_4_9_ce0 { O 1 bit } x_local_1_4_9_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_4_9'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1132 \
    name x_local_1_4_10 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_4_10 \
    op interface \
    ports { x_local_1_4_10_address0 { O 4 vector } x_local_1_4_10_ce0 { O 1 bit } x_local_1_4_10_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_4_10'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1133 \
    name x_local_1_4_11 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_4_11 \
    op interface \
    ports { x_local_1_4_11_address0 { O 4 vector } x_local_1_4_11_ce0 { O 1 bit } x_local_1_4_11_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_4_11'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1134 \
    name x_local_1_4_12 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_4_12 \
    op interface \
    ports { x_local_1_4_12_address0 { O 4 vector } x_local_1_4_12_ce0 { O 1 bit } x_local_1_4_12_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_4_12'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1135 \
    name x_local_1_4_13 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_4_13 \
    op interface \
    ports { x_local_1_4_13_address0 { O 4 vector } x_local_1_4_13_ce0 { O 1 bit } x_local_1_4_13_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_4_13'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1136 \
    name x_local_1_4_14 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_4_14 \
    op interface \
    ports { x_local_1_4_14_address0 { O 4 vector } x_local_1_4_14_ce0 { O 1 bit } x_local_1_4_14_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_4_14'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1137 \
    name x_local_1_4_15 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_4_15 \
    op interface \
    ports { x_local_1_4_15_address0 { O 4 vector } x_local_1_4_15_ce0 { O 1 bit } x_local_1_4_15_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_4_15'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1138 \
    name x_local_1_5_0 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_5_0 \
    op interface \
    ports { x_local_1_5_0_address0 { O 4 vector } x_local_1_5_0_ce0 { O 1 bit } x_local_1_5_0_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_5_0'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1139 \
    name x_local_1_5_1 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_5_1 \
    op interface \
    ports { x_local_1_5_1_address0 { O 4 vector } x_local_1_5_1_ce0 { O 1 bit } x_local_1_5_1_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_5_1'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1140 \
    name x_local_1_5_2 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_5_2 \
    op interface \
    ports { x_local_1_5_2_address0 { O 4 vector } x_local_1_5_2_ce0 { O 1 bit } x_local_1_5_2_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_5_2'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1141 \
    name x_local_1_5_3 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_5_3 \
    op interface \
    ports { x_local_1_5_3_address0 { O 4 vector } x_local_1_5_3_ce0 { O 1 bit } x_local_1_5_3_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_5_3'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1142 \
    name x_local_1_5_4 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_5_4 \
    op interface \
    ports { x_local_1_5_4_address0 { O 4 vector } x_local_1_5_4_ce0 { O 1 bit } x_local_1_5_4_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_5_4'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1143 \
    name x_local_1_5_5 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_5_5 \
    op interface \
    ports { x_local_1_5_5_address0 { O 4 vector } x_local_1_5_5_ce0 { O 1 bit } x_local_1_5_5_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_5_5'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1144 \
    name x_local_1_5_6 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_5_6 \
    op interface \
    ports { x_local_1_5_6_address0 { O 4 vector } x_local_1_5_6_ce0 { O 1 bit } x_local_1_5_6_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_5_6'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1145 \
    name x_local_1_5_7 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_5_7 \
    op interface \
    ports { x_local_1_5_7_address0 { O 4 vector } x_local_1_5_7_ce0 { O 1 bit } x_local_1_5_7_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_5_7'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1146 \
    name x_local_1_5_8 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_5_8 \
    op interface \
    ports { x_local_1_5_8_address0 { O 4 vector } x_local_1_5_8_ce0 { O 1 bit } x_local_1_5_8_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_5_8'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1147 \
    name x_local_1_5_9 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_5_9 \
    op interface \
    ports { x_local_1_5_9_address0 { O 4 vector } x_local_1_5_9_ce0 { O 1 bit } x_local_1_5_9_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_5_9'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1148 \
    name x_local_1_5_10 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_5_10 \
    op interface \
    ports { x_local_1_5_10_address0 { O 4 vector } x_local_1_5_10_ce0 { O 1 bit } x_local_1_5_10_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_5_10'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1149 \
    name x_local_1_5_11 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_5_11 \
    op interface \
    ports { x_local_1_5_11_address0 { O 4 vector } x_local_1_5_11_ce0 { O 1 bit } x_local_1_5_11_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_5_11'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1150 \
    name x_local_1_5_12 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_5_12 \
    op interface \
    ports { x_local_1_5_12_address0 { O 4 vector } x_local_1_5_12_ce0 { O 1 bit } x_local_1_5_12_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_5_12'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1151 \
    name x_local_1_5_13 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_5_13 \
    op interface \
    ports { x_local_1_5_13_address0 { O 4 vector } x_local_1_5_13_ce0 { O 1 bit } x_local_1_5_13_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_5_13'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1152 \
    name x_local_1_5_14 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_5_14 \
    op interface \
    ports { x_local_1_5_14_address0 { O 4 vector } x_local_1_5_14_ce0 { O 1 bit } x_local_1_5_14_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_5_14'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1153 \
    name x_local_1_5_15 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_5_15 \
    op interface \
    ports { x_local_1_5_15_address0 { O 4 vector } x_local_1_5_15_ce0 { O 1 bit } x_local_1_5_15_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_5_15'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1154 \
    name x_local_1_6_0 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_6_0 \
    op interface \
    ports { x_local_1_6_0_address0 { O 4 vector } x_local_1_6_0_ce0 { O 1 bit } x_local_1_6_0_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_6_0'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1155 \
    name x_local_1_6_1 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_6_1 \
    op interface \
    ports { x_local_1_6_1_address0 { O 4 vector } x_local_1_6_1_ce0 { O 1 bit } x_local_1_6_1_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_6_1'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1156 \
    name x_local_1_6_2 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_6_2 \
    op interface \
    ports { x_local_1_6_2_address0 { O 4 vector } x_local_1_6_2_ce0 { O 1 bit } x_local_1_6_2_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_6_2'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1157 \
    name x_local_1_6_3 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_6_3 \
    op interface \
    ports { x_local_1_6_3_address0 { O 4 vector } x_local_1_6_3_ce0 { O 1 bit } x_local_1_6_3_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_6_3'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1158 \
    name x_local_1_6_4 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_6_4 \
    op interface \
    ports { x_local_1_6_4_address0 { O 4 vector } x_local_1_6_4_ce0 { O 1 bit } x_local_1_6_4_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_6_4'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1159 \
    name x_local_1_6_5 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_6_5 \
    op interface \
    ports { x_local_1_6_5_address0 { O 4 vector } x_local_1_6_5_ce0 { O 1 bit } x_local_1_6_5_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_6_5'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1160 \
    name x_local_1_6_6 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_6_6 \
    op interface \
    ports { x_local_1_6_6_address0 { O 4 vector } x_local_1_6_6_ce0 { O 1 bit } x_local_1_6_6_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_6_6'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1161 \
    name x_local_1_6_7 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_6_7 \
    op interface \
    ports { x_local_1_6_7_address0 { O 4 vector } x_local_1_6_7_ce0 { O 1 bit } x_local_1_6_7_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_6_7'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1162 \
    name x_local_1_6_8 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_6_8 \
    op interface \
    ports { x_local_1_6_8_address0 { O 4 vector } x_local_1_6_8_ce0 { O 1 bit } x_local_1_6_8_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_6_8'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1163 \
    name x_local_1_6_9 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_6_9 \
    op interface \
    ports { x_local_1_6_9_address0 { O 4 vector } x_local_1_6_9_ce0 { O 1 bit } x_local_1_6_9_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_6_9'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1164 \
    name x_local_1_6_10 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_6_10 \
    op interface \
    ports { x_local_1_6_10_address0 { O 4 vector } x_local_1_6_10_ce0 { O 1 bit } x_local_1_6_10_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_6_10'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1165 \
    name x_local_1_6_11 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_6_11 \
    op interface \
    ports { x_local_1_6_11_address0 { O 4 vector } x_local_1_6_11_ce0 { O 1 bit } x_local_1_6_11_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_6_11'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1166 \
    name x_local_1_6_12 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_6_12 \
    op interface \
    ports { x_local_1_6_12_address0 { O 4 vector } x_local_1_6_12_ce0 { O 1 bit } x_local_1_6_12_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_6_12'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1167 \
    name x_local_1_6_13 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_6_13 \
    op interface \
    ports { x_local_1_6_13_address0 { O 4 vector } x_local_1_6_13_ce0 { O 1 bit } x_local_1_6_13_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_6_13'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1168 \
    name x_local_1_6_14 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_6_14 \
    op interface \
    ports { x_local_1_6_14_address0 { O 4 vector } x_local_1_6_14_ce0 { O 1 bit } x_local_1_6_14_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_6_14'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1169 \
    name x_local_1_6_15 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_6_15 \
    op interface \
    ports { x_local_1_6_15_address0 { O 4 vector } x_local_1_6_15_ce0 { O 1 bit } x_local_1_6_15_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_6_15'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1170 \
    name x_local_1_7_0 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_7_0 \
    op interface \
    ports { x_local_1_7_0_address0 { O 4 vector } x_local_1_7_0_ce0 { O 1 bit } x_local_1_7_0_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_7_0'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1171 \
    name x_local_1_7_1 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_7_1 \
    op interface \
    ports { x_local_1_7_1_address0 { O 4 vector } x_local_1_7_1_ce0 { O 1 bit } x_local_1_7_1_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_7_1'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1172 \
    name x_local_1_7_2 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_7_2 \
    op interface \
    ports { x_local_1_7_2_address0 { O 4 vector } x_local_1_7_2_ce0 { O 1 bit } x_local_1_7_2_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_7_2'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1173 \
    name x_local_1_7_3 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_7_3 \
    op interface \
    ports { x_local_1_7_3_address0 { O 4 vector } x_local_1_7_3_ce0 { O 1 bit } x_local_1_7_3_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_7_3'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1174 \
    name x_local_1_7_4 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_7_4 \
    op interface \
    ports { x_local_1_7_4_address0 { O 4 vector } x_local_1_7_4_ce0 { O 1 bit } x_local_1_7_4_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_7_4'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1175 \
    name x_local_1_7_5 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_7_5 \
    op interface \
    ports { x_local_1_7_5_address0 { O 4 vector } x_local_1_7_5_ce0 { O 1 bit } x_local_1_7_5_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_7_5'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1176 \
    name x_local_1_7_6 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_7_6 \
    op interface \
    ports { x_local_1_7_6_address0 { O 4 vector } x_local_1_7_6_ce0 { O 1 bit } x_local_1_7_6_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_7_6'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1177 \
    name x_local_1_7_7 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_7_7 \
    op interface \
    ports { x_local_1_7_7_address0 { O 4 vector } x_local_1_7_7_ce0 { O 1 bit } x_local_1_7_7_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_7_7'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1178 \
    name x_local_1_7_8 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_7_8 \
    op interface \
    ports { x_local_1_7_8_address0 { O 4 vector } x_local_1_7_8_ce0 { O 1 bit } x_local_1_7_8_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_7_8'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1179 \
    name x_local_1_7_9 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_7_9 \
    op interface \
    ports { x_local_1_7_9_address0 { O 4 vector } x_local_1_7_9_ce0 { O 1 bit } x_local_1_7_9_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_7_9'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1180 \
    name x_local_1_7_10 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_7_10 \
    op interface \
    ports { x_local_1_7_10_address0 { O 4 vector } x_local_1_7_10_ce0 { O 1 bit } x_local_1_7_10_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_7_10'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1181 \
    name x_local_1_7_11 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_7_11 \
    op interface \
    ports { x_local_1_7_11_address0 { O 4 vector } x_local_1_7_11_ce0 { O 1 bit } x_local_1_7_11_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_7_11'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1182 \
    name x_local_1_7_12 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_7_12 \
    op interface \
    ports { x_local_1_7_12_address0 { O 4 vector } x_local_1_7_12_ce0 { O 1 bit } x_local_1_7_12_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_7_12'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1183 \
    name x_local_1_7_13 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_7_13 \
    op interface \
    ports { x_local_1_7_13_address0 { O 4 vector } x_local_1_7_13_ce0 { O 1 bit } x_local_1_7_13_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_7_13'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1184 \
    name x_local_1_7_14 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_7_14 \
    op interface \
    ports { x_local_1_7_14_address0 { O 4 vector } x_local_1_7_14_ce0 { O 1 bit } x_local_1_7_14_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_7_14'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1185 \
    name x_local_1_7_15 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_7_15 \
    op interface \
    ports { x_local_1_7_15_address0 { O 4 vector } x_local_1_7_15_ce0 { O 1 bit } x_local_1_7_15_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_7_15'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1187 \
    name X1_cache \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename X1_cache \
    op interface \
    ports { X1_cache_address1 { O 13 vector } X1_cache_ce1 { O 1 bit } X1_cache_we1 { O 1 bit } X1_cache_d1 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'X1_cache'"
}
}


# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1056 \
    name gmem_W \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_gmem_W \
    op interface \
    ports { m_axi_gmem_W_0_AWVALID { O 1 bit } m_axi_gmem_W_0_AWREADY { I 1 bit } m_axi_gmem_W_0_AWADDR { O 64 vector } m_axi_gmem_W_0_AWID { O 1 vector } m_axi_gmem_W_0_AWLEN { O 32 vector } m_axi_gmem_W_0_AWSIZE { O 3 vector } m_axi_gmem_W_0_AWBURST { O 2 vector } m_axi_gmem_W_0_AWLOCK { O 2 vector } m_axi_gmem_W_0_AWCACHE { O 4 vector } m_axi_gmem_W_0_AWPROT { O 3 vector } m_axi_gmem_W_0_AWQOS { O 4 vector } m_axi_gmem_W_0_AWREGION { O 4 vector } m_axi_gmem_W_0_AWUSER { O 1 vector } m_axi_gmem_W_0_WVALID { O 1 bit } m_axi_gmem_W_0_WREADY { I 1 bit } m_axi_gmem_W_0_WDATA { O 128 vector } m_axi_gmem_W_0_WSTRB { O 16 vector } m_axi_gmem_W_0_WLAST { O 1 bit } m_axi_gmem_W_0_WID { O 1 vector } m_axi_gmem_W_0_WUSER { O 1 vector } m_axi_gmem_W_0_ARVALID { O 1 bit } m_axi_gmem_W_0_ARREADY { I 1 bit } m_axi_gmem_W_0_ARADDR { O 64 vector } m_axi_gmem_W_0_ARID { O 1 vector } m_axi_gmem_W_0_ARLEN { O 32 vector } m_axi_gmem_W_0_ARSIZE { O 3 vector } m_axi_gmem_W_0_ARBURST { O 2 vector } m_axi_gmem_W_0_ARLOCK { O 2 vector } m_axi_gmem_W_0_ARCACHE { O 4 vector } m_axi_gmem_W_0_ARPROT { O 3 vector } m_axi_gmem_W_0_ARQOS { O 4 vector } m_axi_gmem_W_0_ARREGION { O 4 vector } m_axi_gmem_W_0_ARUSER { O 1 vector } m_axi_gmem_W_0_RVALID { I 1 bit } m_axi_gmem_W_0_RREADY { O 1 bit } m_axi_gmem_W_0_RDATA { I 128 vector } m_axi_gmem_W_0_RLAST { I 1 bit } m_axi_gmem_W_0_RID { I 1 vector } m_axi_gmem_W_0_RFIFONUM { I 10 vector } m_axi_gmem_W_0_RUSER { I 1 vector } m_axi_gmem_W_0_RRESP { I 2 vector } m_axi_gmem_W_0_BVALID { I 1 bit } m_axi_gmem_W_0_BREADY { O 1 bit } m_axi_gmem_W_0_BRESP { I 2 vector } m_axi_gmem_W_0_BID { I 1 vector } m_axi_gmem_W_0_BUSER { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1057 \
    name W \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_W \
    op interface \
    ports { W { I 64 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1186 \
    name x_scale \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_x_scale \
    op interface \
    ports { x_scale { I 32 vector } } \
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


