# This script segment is generated automatically by AutoPilot

if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler swiglu_compute_X2_row_buf_RAM_AUTO_1R1W BINDTYPE {storage} TYPE {ram} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
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
    id 897 \
    name x_local_2_0_0 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_0_0 \
    op interface \
    ports { x_local_2_0_0_address0 { O 4 vector } x_local_2_0_0_ce0 { O 1 bit } x_local_2_0_0_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_0_0'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 898 \
    name x_local_2_0_1 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_0_1 \
    op interface \
    ports { x_local_2_0_1_address0 { O 4 vector } x_local_2_0_1_ce0 { O 1 bit } x_local_2_0_1_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_0_1'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 899 \
    name x_local_2_0_2 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_0_2 \
    op interface \
    ports { x_local_2_0_2_address0 { O 4 vector } x_local_2_0_2_ce0 { O 1 bit } x_local_2_0_2_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_0_2'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 900 \
    name x_local_2_0_3 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_0_3 \
    op interface \
    ports { x_local_2_0_3_address0 { O 4 vector } x_local_2_0_3_ce0 { O 1 bit } x_local_2_0_3_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_0_3'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 901 \
    name x_local_2_0_4 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_0_4 \
    op interface \
    ports { x_local_2_0_4_address0 { O 4 vector } x_local_2_0_4_ce0 { O 1 bit } x_local_2_0_4_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_0_4'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 902 \
    name x_local_2_0_5 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_0_5 \
    op interface \
    ports { x_local_2_0_5_address0 { O 4 vector } x_local_2_0_5_ce0 { O 1 bit } x_local_2_0_5_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_0_5'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 903 \
    name x_local_2_0_6 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_0_6 \
    op interface \
    ports { x_local_2_0_6_address0 { O 4 vector } x_local_2_0_6_ce0 { O 1 bit } x_local_2_0_6_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_0_6'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 904 \
    name x_local_2_0_7 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_0_7 \
    op interface \
    ports { x_local_2_0_7_address0 { O 4 vector } x_local_2_0_7_ce0 { O 1 bit } x_local_2_0_7_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_0_7'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 905 \
    name x_local_2_0_8 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_0_8 \
    op interface \
    ports { x_local_2_0_8_address0 { O 4 vector } x_local_2_0_8_ce0 { O 1 bit } x_local_2_0_8_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_0_8'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 906 \
    name x_local_2_0_9 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_0_9 \
    op interface \
    ports { x_local_2_0_9_address0 { O 4 vector } x_local_2_0_9_ce0 { O 1 bit } x_local_2_0_9_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_0_9'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 907 \
    name x_local_2_0_10 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_0_10 \
    op interface \
    ports { x_local_2_0_10_address0 { O 4 vector } x_local_2_0_10_ce0 { O 1 bit } x_local_2_0_10_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_0_10'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 908 \
    name x_local_2_0_11 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_0_11 \
    op interface \
    ports { x_local_2_0_11_address0 { O 4 vector } x_local_2_0_11_ce0 { O 1 bit } x_local_2_0_11_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_0_11'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 909 \
    name x_local_2_0_12 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_0_12 \
    op interface \
    ports { x_local_2_0_12_address0 { O 4 vector } x_local_2_0_12_ce0 { O 1 bit } x_local_2_0_12_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_0_12'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 910 \
    name x_local_2_0_13 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_0_13 \
    op interface \
    ports { x_local_2_0_13_address0 { O 4 vector } x_local_2_0_13_ce0 { O 1 bit } x_local_2_0_13_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_0_13'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 911 \
    name x_local_2_0_14 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_0_14 \
    op interface \
    ports { x_local_2_0_14_address0 { O 4 vector } x_local_2_0_14_ce0 { O 1 bit } x_local_2_0_14_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_0_14'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 912 \
    name x_local_2_0_15 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_0_15 \
    op interface \
    ports { x_local_2_0_15_address0 { O 4 vector } x_local_2_0_15_ce0 { O 1 bit } x_local_2_0_15_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_0_15'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 913 \
    name x_local_2_1_0 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_1_0 \
    op interface \
    ports { x_local_2_1_0_address0 { O 4 vector } x_local_2_1_0_ce0 { O 1 bit } x_local_2_1_0_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_1_0'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 914 \
    name x_local_2_1_1 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_1_1 \
    op interface \
    ports { x_local_2_1_1_address0 { O 4 vector } x_local_2_1_1_ce0 { O 1 bit } x_local_2_1_1_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_1_1'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 915 \
    name x_local_2_1_2 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_1_2 \
    op interface \
    ports { x_local_2_1_2_address0 { O 4 vector } x_local_2_1_2_ce0 { O 1 bit } x_local_2_1_2_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_1_2'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 916 \
    name x_local_2_1_3 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_1_3 \
    op interface \
    ports { x_local_2_1_3_address0 { O 4 vector } x_local_2_1_3_ce0 { O 1 bit } x_local_2_1_3_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_1_3'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 917 \
    name x_local_2_1_4 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_1_4 \
    op interface \
    ports { x_local_2_1_4_address0 { O 4 vector } x_local_2_1_4_ce0 { O 1 bit } x_local_2_1_4_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_1_4'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 918 \
    name x_local_2_1_5 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_1_5 \
    op interface \
    ports { x_local_2_1_5_address0 { O 4 vector } x_local_2_1_5_ce0 { O 1 bit } x_local_2_1_5_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_1_5'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 919 \
    name x_local_2_1_6 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_1_6 \
    op interface \
    ports { x_local_2_1_6_address0 { O 4 vector } x_local_2_1_6_ce0 { O 1 bit } x_local_2_1_6_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_1_6'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 920 \
    name x_local_2_1_7 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_1_7 \
    op interface \
    ports { x_local_2_1_7_address0 { O 4 vector } x_local_2_1_7_ce0 { O 1 bit } x_local_2_1_7_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_1_7'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 921 \
    name x_local_2_1_8 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_1_8 \
    op interface \
    ports { x_local_2_1_8_address0 { O 4 vector } x_local_2_1_8_ce0 { O 1 bit } x_local_2_1_8_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_1_8'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 922 \
    name x_local_2_1_9 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_1_9 \
    op interface \
    ports { x_local_2_1_9_address0 { O 4 vector } x_local_2_1_9_ce0 { O 1 bit } x_local_2_1_9_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_1_9'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 923 \
    name x_local_2_1_10 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_1_10 \
    op interface \
    ports { x_local_2_1_10_address0 { O 4 vector } x_local_2_1_10_ce0 { O 1 bit } x_local_2_1_10_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_1_10'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 924 \
    name x_local_2_1_11 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_1_11 \
    op interface \
    ports { x_local_2_1_11_address0 { O 4 vector } x_local_2_1_11_ce0 { O 1 bit } x_local_2_1_11_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_1_11'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 925 \
    name x_local_2_1_12 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_1_12 \
    op interface \
    ports { x_local_2_1_12_address0 { O 4 vector } x_local_2_1_12_ce0 { O 1 bit } x_local_2_1_12_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_1_12'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 926 \
    name x_local_2_1_13 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_1_13 \
    op interface \
    ports { x_local_2_1_13_address0 { O 4 vector } x_local_2_1_13_ce0 { O 1 bit } x_local_2_1_13_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_1_13'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 927 \
    name x_local_2_1_14 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_1_14 \
    op interface \
    ports { x_local_2_1_14_address0 { O 4 vector } x_local_2_1_14_ce0 { O 1 bit } x_local_2_1_14_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_1_14'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 928 \
    name x_local_2_1_15 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_1_15 \
    op interface \
    ports { x_local_2_1_15_address0 { O 4 vector } x_local_2_1_15_ce0 { O 1 bit } x_local_2_1_15_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_1_15'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 929 \
    name x_local_2_2_0 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_2_0 \
    op interface \
    ports { x_local_2_2_0_address0 { O 4 vector } x_local_2_2_0_ce0 { O 1 bit } x_local_2_2_0_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_2_0'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 930 \
    name x_local_2_2_1 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_2_1 \
    op interface \
    ports { x_local_2_2_1_address0 { O 4 vector } x_local_2_2_1_ce0 { O 1 bit } x_local_2_2_1_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_2_1'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 931 \
    name x_local_2_2_2 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_2_2 \
    op interface \
    ports { x_local_2_2_2_address0 { O 4 vector } x_local_2_2_2_ce0 { O 1 bit } x_local_2_2_2_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_2_2'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 932 \
    name x_local_2_2_3 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_2_3 \
    op interface \
    ports { x_local_2_2_3_address0 { O 4 vector } x_local_2_2_3_ce0 { O 1 bit } x_local_2_2_3_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_2_3'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 933 \
    name x_local_2_2_4 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_2_4 \
    op interface \
    ports { x_local_2_2_4_address0 { O 4 vector } x_local_2_2_4_ce0 { O 1 bit } x_local_2_2_4_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_2_4'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 934 \
    name x_local_2_2_5 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_2_5 \
    op interface \
    ports { x_local_2_2_5_address0 { O 4 vector } x_local_2_2_5_ce0 { O 1 bit } x_local_2_2_5_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_2_5'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 935 \
    name x_local_2_2_6 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_2_6 \
    op interface \
    ports { x_local_2_2_6_address0 { O 4 vector } x_local_2_2_6_ce0 { O 1 bit } x_local_2_2_6_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_2_6'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 936 \
    name x_local_2_2_7 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_2_7 \
    op interface \
    ports { x_local_2_2_7_address0 { O 4 vector } x_local_2_2_7_ce0 { O 1 bit } x_local_2_2_7_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_2_7'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 937 \
    name x_local_2_2_8 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_2_8 \
    op interface \
    ports { x_local_2_2_8_address0 { O 4 vector } x_local_2_2_8_ce0 { O 1 bit } x_local_2_2_8_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_2_8'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 938 \
    name x_local_2_2_9 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_2_9 \
    op interface \
    ports { x_local_2_2_9_address0 { O 4 vector } x_local_2_2_9_ce0 { O 1 bit } x_local_2_2_9_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_2_9'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 939 \
    name x_local_2_2_10 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_2_10 \
    op interface \
    ports { x_local_2_2_10_address0 { O 4 vector } x_local_2_2_10_ce0 { O 1 bit } x_local_2_2_10_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_2_10'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 940 \
    name x_local_2_2_11 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_2_11 \
    op interface \
    ports { x_local_2_2_11_address0 { O 4 vector } x_local_2_2_11_ce0 { O 1 bit } x_local_2_2_11_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_2_11'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 941 \
    name x_local_2_2_12 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_2_12 \
    op interface \
    ports { x_local_2_2_12_address0 { O 4 vector } x_local_2_2_12_ce0 { O 1 bit } x_local_2_2_12_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_2_12'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 942 \
    name x_local_2_2_13 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_2_13 \
    op interface \
    ports { x_local_2_2_13_address0 { O 4 vector } x_local_2_2_13_ce0 { O 1 bit } x_local_2_2_13_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_2_13'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 943 \
    name x_local_2_2_14 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_2_14 \
    op interface \
    ports { x_local_2_2_14_address0 { O 4 vector } x_local_2_2_14_ce0 { O 1 bit } x_local_2_2_14_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_2_14'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 944 \
    name x_local_2_2_15 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_2_15 \
    op interface \
    ports { x_local_2_2_15_address0 { O 4 vector } x_local_2_2_15_ce0 { O 1 bit } x_local_2_2_15_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_2_15'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 945 \
    name x_local_2_3_0 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_3_0 \
    op interface \
    ports { x_local_2_3_0_address0 { O 4 vector } x_local_2_3_0_ce0 { O 1 bit } x_local_2_3_0_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_3_0'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 946 \
    name x_local_2_3_1 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_3_1 \
    op interface \
    ports { x_local_2_3_1_address0 { O 4 vector } x_local_2_3_1_ce0 { O 1 bit } x_local_2_3_1_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_3_1'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 947 \
    name x_local_2_3_2 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_3_2 \
    op interface \
    ports { x_local_2_3_2_address0 { O 4 vector } x_local_2_3_2_ce0 { O 1 bit } x_local_2_3_2_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_3_2'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 948 \
    name x_local_2_3_3 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_3_3 \
    op interface \
    ports { x_local_2_3_3_address0 { O 4 vector } x_local_2_3_3_ce0 { O 1 bit } x_local_2_3_3_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_3_3'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 949 \
    name x_local_2_3_4 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_3_4 \
    op interface \
    ports { x_local_2_3_4_address0 { O 4 vector } x_local_2_3_4_ce0 { O 1 bit } x_local_2_3_4_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_3_4'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 950 \
    name x_local_2_3_5 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_3_5 \
    op interface \
    ports { x_local_2_3_5_address0 { O 4 vector } x_local_2_3_5_ce0 { O 1 bit } x_local_2_3_5_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_3_5'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 951 \
    name x_local_2_3_6 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_3_6 \
    op interface \
    ports { x_local_2_3_6_address0 { O 4 vector } x_local_2_3_6_ce0 { O 1 bit } x_local_2_3_6_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_3_6'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 952 \
    name x_local_2_3_7 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_3_7 \
    op interface \
    ports { x_local_2_3_7_address0 { O 4 vector } x_local_2_3_7_ce0 { O 1 bit } x_local_2_3_7_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_3_7'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 953 \
    name x_local_2_3_8 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_3_8 \
    op interface \
    ports { x_local_2_3_8_address0 { O 4 vector } x_local_2_3_8_ce0 { O 1 bit } x_local_2_3_8_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_3_8'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 954 \
    name x_local_2_3_9 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_3_9 \
    op interface \
    ports { x_local_2_3_9_address0 { O 4 vector } x_local_2_3_9_ce0 { O 1 bit } x_local_2_3_9_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_3_9'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 955 \
    name x_local_2_3_10 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_3_10 \
    op interface \
    ports { x_local_2_3_10_address0 { O 4 vector } x_local_2_3_10_ce0 { O 1 bit } x_local_2_3_10_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_3_10'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 956 \
    name x_local_2_3_11 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_3_11 \
    op interface \
    ports { x_local_2_3_11_address0 { O 4 vector } x_local_2_3_11_ce0 { O 1 bit } x_local_2_3_11_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_3_11'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 957 \
    name x_local_2_3_12 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_3_12 \
    op interface \
    ports { x_local_2_3_12_address0 { O 4 vector } x_local_2_3_12_ce0 { O 1 bit } x_local_2_3_12_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_3_12'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 958 \
    name x_local_2_3_13 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_3_13 \
    op interface \
    ports { x_local_2_3_13_address0 { O 4 vector } x_local_2_3_13_ce0 { O 1 bit } x_local_2_3_13_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_3_13'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 959 \
    name x_local_2_3_14 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_3_14 \
    op interface \
    ports { x_local_2_3_14_address0 { O 4 vector } x_local_2_3_14_ce0 { O 1 bit } x_local_2_3_14_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_3_14'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 960 \
    name x_local_2_3_15 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_3_15 \
    op interface \
    ports { x_local_2_3_15_address0 { O 4 vector } x_local_2_3_15_ce0 { O 1 bit } x_local_2_3_15_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_3_15'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 961 \
    name x_local_2_4_0 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_4_0 \
    op interface \
    ports { x_local_2_4_0_address0 { O 4 vector } x_local_2_4_0_ce0 { O 1 bit } x_local_2_4_0_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_4_0'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 962 \
    name x_local_2_4_1 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_4_1 \
    op interface \
    ports { x_local_2_4_1_address0 { O 4 vector } x_local_2_4_1_ce0 { O 1 bit } x_local_2_4_1_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_4_1'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 963 \
    name x_local_2_4_2 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_4_2 \
    op interface \
    ports { x_local_2_4_2_address0 { O 4 vector } x_local_2_4_2_ce0 { O 1 bit } x_local_2_4_2_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_4_2'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 964 \
    name x_local_2_4_3 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_4_3 \
    op interface \
    ports { x_local_2_4_3_address0 { O 4 vector } x_local_2_4_3_ce0 { O 1 bit } x_local_2_4_3_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_4_3'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 965 \
    name x_local_2_4_4 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_4_4 \
    op interface \
    ports { x_local_2_4_4_address0 { O 4 vector } x_local_2_4_4_ce0 { O 1 bit } x_local_2_4_4_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_4_4'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 966 \
    name x_local_2_4_5 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_4_5 \
    op interface \
    ports { x_local_2_4_5_address0 { O 4 vector } x_local_2_4_5_ce0 { O 1 bit } x_local_2_4_5_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_4_5'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 967 \
    name x_local_2_4_6 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_4_6 \
    op interface \
    ports { x_local_2_4_6_address0 { O 4 vector } x_local_2_4_6_ce0 { O 1 bit } x_local_2_4_6_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_4_6'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 968 \
    name x_local_2_4_7 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_4_7 \
    op interface \
    ports { x_local_2_4_7_address0 { O 4 vector } x_local_2_4_7_ce0 { O 1 bit } x_local_2_4_7_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_4_7'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 969 \
    name x_local_2_4_8 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_4_8 \
    op interface \
    ports { x_local_2_4_8_address0 { O 4 vector } x_local_2_4_8_ce0 { O 1 bit } x_local_2_4_8_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_4_8'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 970 \
    name x_local_2_4_9 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_4_9 \
    op interface \
    ports { x_local_2_4_9_address0 { O 4 vector } x_local_2_4_9_ce0 { O 1 bit } x_local_2_4_9_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_4_9'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 971 \
    name x_local_2_4_10 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_4_10 \
    op interface \
    ports { x_local_2_4_10_address0 { O 4 vector } x_local_2_4_10_ce0 { O 1 bit } x_local_2_4_10_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_4_10'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 972 \
    name x_local_2_4_11 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_4_11 \
    op interface \
    ports { x_local_2_4_11_address0 { O 4 vector } x_local_2_4_11_ce0 { O 1 bit } x_local_2_4_11_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_4_11'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 973 \
    name x_local_2_4_12 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_4_12 \
    op interface \
    ports { x_local_2_4_12_address0 { O 4 vector } x_local_2_4_12_ce0 { O 1 bit } x_local_2_4_12_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_4_12'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 974 \
    name x_local_2_4_13 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_4_13 \
    op interface \
    ports { x_local_2_4_13_address0 { O 4 vector } x_local_2_4_13_ce0 { O 1 bit } x_local_2_4_13_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_4_13'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 975 \
    name x_local_2_4_14 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_4_14 \
    op interface \
    ports { x_local_2_4_14_address0 { O 4 vector } x_local_2_4_14_ce0 { O 1 bit } x_local_2_4_14_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_4_14'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 976 \
    name x_local_2_4_15 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_4_15 \
    op interface \
    ports { x_local_2_4_15_address0 { O 4 vector } x_local_2_4_15_ce0 { O 1 bit } x_local_2_4_15_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_4_15'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 977 \
    name x_local_2_5_0 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_5_0 \
    op interface \
    ports { x_local_2_5_0_address0 { O 4 vector } x_local_2_5_0_ce0 { O 1 bit } x_local_2_5_0_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_5_0'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 978 \
    name x_local_2_5_1 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_5_1 \
    op interface \
    ports { x_local_2_5_1_address0 { O 4 vector } x_local_2_5_1_ce0 { O 1 bit } x_local_2_5_1_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_5_1'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 979 \
    name x_local_2_5_2 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_5_2 \
    op interface \
    ports { x_local_2_5_2_address0 { O 4 vector } x_local_2_5_2_ce0 { O 1 bit } x_local_2_5_2_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_5_2'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 980 \
    name x_local_2_5_3 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_5_3 \
    op interface \
    ports { x_local_2_5_3_address0 { O 4 vector } x_local_2_5_3_ce0 { O 1 bit } x_local_2_5_3_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_5_3'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 981 \
    name x_local_2_5_4 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_5_4 \
    op interface \
    ports { x_local_2_5_4_address0 { O 4 vector } x_local_2_5_4_ce0 { O 1 bit } x_local_2_5_4_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_5_4'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 982 \
    name x_local_2_5_5 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_5_5 \
    op interface \
    ports { x_local_2_5_5_address0 { O 4 vector } x_local_2_5_5_ce0 { O 1 bit } x_local_2_5_5_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_5_5'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 983 \
    name x_local_2_5_6 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_5_6 \
    op interface \
    ports { x_local_2_5_6_address0 { O 4 vector } x_local_2_5_6_ce0 { O 1 bit } x_local_2_5_6_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_5_6'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 984 \
    name x_local_2_5_7 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_5_7 \
    op interface \
    ports { x_local_2_5_7_address0 { O 4 vector } x_local_2_5_7_ce0 { O 1 bit } x_local_2_5_7_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_5_7'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 985 \
    name x_local_2_5_8 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_5_8 \
    op interface \
    ports { x_local_2_5_8_address0 { O 4 vector } x_local_2_5_8_ce0 { O 1 bit } x_local_2_5_8_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_5_8'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 986 \
    name x_local_2_5_9 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_5_9 \
    op interface \
    ports { x_local_2_5_9_address0 { O 4 vector } x_local_2_5_9_ce0 { O 1 bit } x_local_2_5_9_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_5_9'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 987 \
    name x_local_2_5_10 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_5_10 \
    op interface \
    ports { x_local_2_5_10_address0 { O 4 vector } x_local_2_5_10_ce0 { O 1 bit } x_local_2_5_10_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_5_10'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 988 \
    name x_local_2_5_11 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_5_11 \
    op interface \
    ports { x_local_2_5_11_address0 { O 4 vector } x_local_2_5_11_ce0 { O 1 bit } x_local_2_5_11_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_5_11'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 989 \
    name x_local_2_5_12 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_5_12 \
    op interface \
    ports { x_local_2_5_12_address0 { O 4 vector } x_local_2_5_12_ce0 { O 1 bit } x_local_2_5_12_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_5_12'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 990 \
    name x_local_2_5_13 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_5_13 \
    op interface \
    ports { x_local_2_5_13_address0 { O 4 vector } x_local_2_5_13_ce0 { O 1 bit } x_local_2_5_13_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_5_13'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 991 \
    name x_local_2_5_14 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_5_14 \
    op interface \
    ports { x_local_2_5_14_address0 { O 4 vector } x_local_2_5_14_ce0 { O 1 bit } x_local_2_5_14_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_5_14'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 992 \
    name x_local_2_5_15 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_5_15 \
    op interface \
    ports { x_local_2_5_15_address0 { O 4 vector } x_local_2_5_15_ce0 { O 1 bit } x_local_2_5_15_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_5_15'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 993 \
    name x_local_2_6_0 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_6_0 \
    op interface \
    ports { x_local_2_6_0_address0 { O 4 vector } x_local_2_6_0_ce0 { O 1 bit } x_local_2_6_0_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_6_0'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 994 \
    name x_local_2_6_1 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_6_1 \
    op interface \
    ports { x_local_2_6_1_address0 { O 4 vector } x_local_2_6_1_ce0 { O 1 bit } x_local_2_6_1_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_6_1'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 995 \
    name x_local_2_6_2 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_6_2 \
    op interface \
    ports { x_local_2_6_2_address0 { O 4 vector } x_local_2_6_2_ce0 { O 1 bit } x_local_2_6_2_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_6_2'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 996 \
    name x_local_2_6_3 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_6_3 \
    op interface \
    ports { x_local_2_6_3_address0 { O 4 vector } x_local_2_6_3_ce0 { O 1 bit } x_local_2_6_3_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_6_3'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 997 \
    name x_local_2_6_4 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_6_4 \
    op interface \
    ports { x_local_2_6_4_address0 { O 4 vector } x_local_2_6_4_ce0 { O 1 bit } x_local_2_6_4_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_6_4'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 998 \
    name x_local_2_6_5 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_6_5 \
    op interface \
    ports { x_local_2_6_5_address0 { O 4 vector } x_local_2_6_5_ce0 { O 1 bit } x_local_2_6_5_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_6_5'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 999 \
    name x_local_2_6_6 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_6_6 \
    op interface \
    ports { x_local_2_6_6_address0 { O 4 vector } x_local_2_6_6_ce0 { O 1 bit } x_local_2_6_6_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_6_6'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1000 \
    name x_local_2_6_7 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_6_7 \
    op interface \
    ports { x_local_2_6_7_address0 { O 4 vector } x_local_2_6_7_ce0 { O 1 bit } x_local_2_6_7_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_6_7'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1001 \
    name x_local_2_6_8 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_6_8 \
    op interface \
    ports { x_local_2_6_8_address0 { O 4 vector } x_local_2_6_8_ce0 { O 1 bit } x_local_2_6_8_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_6_8'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1002 \
    name x_local_2_6_9 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_6_9 \
    op interface \
    ports { x_local_2_6_9_address0 { O 4 vector } x_local_2_6_9_ce0 { O 1 bit } x_local_2_6_9_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_6_9'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1003 \
    name x_local_2_6_10 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_6_10 \
    op interface \
    ports { x_local_2_6_10_address0 { O 4 vector } x_local_2_6_10_ce0 { O 1 bit } x_local_2_6_10_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_6_10'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1004 \
    name x_local_2_6_11 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_6_11 \
    op interface \
    ports { x_local_2_6_11_address0 { O 4 vector } x_local_2_6_11_ce0 { O 1 bit } x_local_2_6_11_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_6_11'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1005 \
    name x_local_2_6_12 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_6_12 \
    op interface \
    ports { x_local_2_6_12_address0 { O 4 vector } x_local_2_6_12_ce0 { O 1 bit } x_local_2_6_12_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_6_12'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1006 \
    name x_local_2_6_13 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_6_13 \
    op interface \
    ports { x_local_2_6_13_address0 { O 4 vector } x_local_2_6_13_ce0 { O 1 bit } x_local_2_6_13_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_6_13'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1007 \
    name x_local_2_6_14 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_6_14 \
    op interface \
    ports { x_local_2_6_14_address0 { O 4 vector } x_local_2_6_14_ce0 { O 1 bit } x_local_2_6_14_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_6_14'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1008 \
    name x_local_2_6_15 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_6_15 \
    op interface \
    ports { x_local_2_6_15_address0 { O 4 vector } x_local_2_6_15_ce0 { O 1 bit } x_local_2_6_15_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_6_15'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1009 \
    name x_local_2_7_0 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_7_0 \
    op interface \
    ports { x_local_2_7_0_address0 { O 4 vector } x_local_2_7_0_ce0 { O 1 bit } x_local_2_7_0_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_7_0'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1010 \
    name x_local_2_7_1 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_7_1 \
    op interface \
    ports { x_local_2_7_1_address0 { O 4 vector } x_local_2_7_1_ce0 { O 1 bit } x_local_2_7_1_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_7_1'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1011 \
    name x_local_2_7_2 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_7_2 \
    op interface \
    ports { x_local_2_7_2_address0 { O 4 vector } x_local_2_7_2_ce0 { O 1 bit } x_local_2_7_2_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_7_2'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1012 \
    name x_local_2_7_3 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_7_3 \
    op interface \
    ports { x_local_2_7_3_address0 { O 4 vector } x_local_2_7_3_ce0 { O 1 bit } x_local_2_7_3_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_7_3'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1013 \
    name x_local_2_7_4 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_7_4 \
    op interface \
    ports { x_local_2_7_4_address0 { O 4 vector } x_local_2_7_4_ce0 { O 1 bit } x_local_2_7_4_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_7_4'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1014 \
    name x_local_2_7_5 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_7_5 \
    op interface \
    ports { x_local_2_7_5_address0 { O 4 vector } x_local_2_7_5_ce0 { O 1 bit } x_local_2_7_5_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_7_5'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1015 \
    name x_local_2_7_6 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_7_6 \
    op interface \
    ports { x_local_2_7_6_address0 { O 4 vector } x_local_2_7_6_ce0 { O 1 bit } x_local_2_7_6_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_7_6'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1016 \
    name x_local_2_7_7 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_7_7 \
    op interface \
    ports { x_local_2_7_7_address0 { O 4 vector } x_local_2_7_7_ce0 { O 1 bit } x_local_2_7_7_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_7_7'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1017 \
    name x_local_2_7_8 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_7_8 \
    op interface \
    ports { x_local_2_7_8_address0 { O 4 vector } x_local_2_7_8_ce0 { O 1 bit } x_local_2_7_8_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_7_8'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1018 \
    name x_local_2_7_9 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_7_9 \
    op interface \
    ports { x_local_2_7_9_address0 { O 4 vector } x_local_2_7_9_ce0 { O 1 bit } x_local_2_7_9_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_7_9'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1019 \
    name x_local_2_7_10 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_7_10 \
    op interface \
    ports { x_local_2_7_10_address0 { O 4 vector } x_local_2_7_10_ce0 { O 1 bit } x_local_2_7_10_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_7_10'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1020 \
    name x_local_2_7_11 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_7_11 \
    op interface \
    ports { x_local_2_7_11_address0 { O 4 vector } x_local_2_7_11_ce0 { O 1 bit } x_local_2_7_11_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_7_11'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1021 \
    name x_local_2_7_12 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_7_12 \
    op interface \
    ports { x_local_2_7_12_address0 { O 4 vector } x_local_2_7_12_ce0 { O 1 bit } x_local_2_7_12_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_7_12'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1022 \
    name x_local_2_7_13 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_7_13 \
    op interface \
    ports { x_local_2_7_13_address0 { O 4 vector } x_local_2_7_13_ce0 { O 1 bit } x_local_2_7_13_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_7_13'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1023 \
    name x_local_2_7_14 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_7_14 \
    op interface \
    ports { x_local_2_7_14_address0 { O 4 vector } x_local_2_7_14_ce0 { O 1 bit } x_local_2_7_14_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_7_14'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1024 \
    name x_local_2_7_15 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_7_15 \
    op interface \
    ports { x_local_2_7_15_address0 { O 4 vector } x_local_2_7_15_ce0 { O 1 bit } x_local_2_7_15_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_7_15'"
}
}


# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 896 \
    name V \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_V \
    op interface \
    ports { V_dout { I 8 vector } V_empty_n { I 1 bit } V_read { O 1 bit } V_num_data_valid { I 3 vector } V_fifo_cap { I 3 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1025 \
    name x_scale \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_x_scale \
    op interface \
    ports { x_scale_dout { I 32 vector } x_scale_empty_n { I 1 bit } x_scale_read { O 1 bit } x_scale_num_data_valid { I 3 vector } x_scale_fifo_cap { I 3 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1026 \
    name X2_cache \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_X2_cache \
    op interface \
    ports { X2_cache_din { O 32 vector } X2_cache_full_n { I 1 bit } X2_cache_write { O 1 bit } X2_cache_num_data_valid { I 5 vector } X2_cache_fifo_cap { I 5 vector } } \
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


