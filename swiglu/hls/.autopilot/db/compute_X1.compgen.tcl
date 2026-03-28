# This script segment is generated automatically by AutoPilot

if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler swiglu_compute_X1_row_buf_RAM_AUTO_1R1W BINDTYPE {storage} TYPE {ram} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
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
    id 765 \
    name x_local_1_0_0 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_0_0 \
    op interface \
    ports { x_local_1_0_0_address0 { O 4 vector } x_local_1_0_0_ce0 { O 1 bit } x_local_1_0_0_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_0_0'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 766 \
    name x_local_1_0_1 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_0_1 \
    op interface \
    ports { x_local_1_0_1_address0 { O 4 vector } x_local_1_0_1_ce0 { O 1 bit } x_local_1_0_1_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_0_1'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 767 \
    name x_local_1_0_2 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_0_2 \
    op interface \
    ports { x_local_1_0_2_address0 { O 4 vector } x_local_1_0_2_ce0 { O 1 bit } x_local_1_0_2_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_0_2'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 768 \
    name x_local_1_0_3 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_0_3 \
    op interface \
    ports { x_local_1_0_3_address0 { O 4 vector } x_local_1_0_3_ce0 { O 1 bit } x_local_1_0_3_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_0_3'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 769 \
    name x_local_1_0_4 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_0_4 \
    op interface \
    ports { x_local_1_0_4_address0 { O 4 vector } x_local_1_0_4_ce0 { O 1 bit } x_local_1_0_4_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_0_4'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 770 \
    name x_local_1_0_5 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_0_5 \
    op interface \
    ports { x_local_1_0_5_address0 { O 4 vector } x_local_1_0_5_ce0 { O 1 bit } x_local_1_0_5_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_0_5'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 771 \
    name x_local_1_0_6 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_0_6 \
    op interface \
    ports { x_local_1_0_6_address0 { O 4 vector } x_local_1_0_6_ce0 { O 1 bit } x_local_1_0_6_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_0_6'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 772 \
    name x_local_1_0_7 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_0_7 \
    op interface \
    ports { x_local_1_0_7_address0 { O 4 vector } x_local_1_0_7_ce0 { O 1 bit } x_local_1_0_7_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_0_7'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 773 \
    name x_local_1_0_8 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_0_8 \
    op interface \
    ports { x_local_1_0_8_address0 { O 4 vector } x_local_1_0_8_ce0 { O 1 bit } x_local_1_0_8_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_0_8'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 774 \
    name x_local_1_0_9 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_0_9 \
    op interface \
    ports { x_local_1_0_9_address0 { O 4 vector } x_local_1_0_9_ce0 { O 1 bit } x_local_1_0_9_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_0_9'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 775 \
    name x_local_1_0_10 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_0_10 \
    op interface \
    ports { x_local_1_0_10_address0 { O 4 vector } x_local_1_0_10_ce0 { O 1 bit } x_local_1_0_10_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_0_10'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 776 \
    name x_local_1_0_11 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_0_11 \
    op interface \
    ports { x_local_1_0_11_address0 { O 4 vector } x_local_1_0_11_ce0 { O 1 bit } x_local_1_0_11_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_0_11'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 777 \
    name x_local_1_0_12 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_0_12 \
    op interface \
    ports { x_local_1_0_12_address0 { O 4 vector } x_local_1_0_12_ce0 { O 1 bit } x_local_1_0_12_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_0_12'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 778 \
    name x_local_1_0_13 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_0_13 \
    op interface \
    ports { x_local_1_0_13_address0 { O 4 vector } x_local_1_0_13_ce0 { O 1 bit } x_local_1_0_13_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_0_13'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 779 \
    name x_local_1_0_14 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_0_14 \
    op interface \
    ports { x_local_1_0_14_address0 { O 4 vector } x_local_1_0_14_ce0 { O 1 bit } x_local_1_0_14_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_0_14'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 780 \
    name x_local_1_0_15 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_0_15 \
    op interface \
    ports { x_local_1_0_15_address0 { O 4 vector } x_local_1_0_15_ce0 { O 1 bit } x_local_1_0_15_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_0_15'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 781 \
    name x_local_1_1_0 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_1_0 \
    op interface \
    ports { x_local_1_1_0_address0 { O 4 vector } x_local_1_1_0_ce0 { O 1 bit } x_local_1_1_0_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_1_0'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 782 \
    name x_local_1_1_1 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_1_1 \
    op interface \
    ports { x_local_1_1_1_address0 { O 4 vector } x_local_1_1_1_ce0 { O 1 bit } x_local_1_1_1_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_1_1'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 783 \
    name x_local_1_1_2 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_1_2 \
    op interface \
    ports { x_local_1_1_2_address0 { O 4 vector } x_local_1_1_2_ce0 { O 1 bit } x_local_1_1_2_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_1_2'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 784 \
    name x_local_1_1_3 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_1_3 \
    op interface \
    ports { x_local_1_1_3_address0 { O 4 vector } x_local_1_1_3_ce0 { O 1 bit } x_local_1_1_3_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_1_3'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 785 \
    name x_local_1_1_4 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_1_4 \
    op interface \
    ports { x_local_1_1_4_address0 { O 4 vector } x_local_1_1_4_ce0 { O 1 bit } x_local_1_1_4_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_1_4'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 786 \
    name x_local_1_1_5 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_1_5 \
    op interface \
    ports { x_local_1_1_5_address0 { O 4 vector } x_local_1_1_5_ce0 { O 1 bit } x_local_1_1_5_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_1_5'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 787 \
    name x_local_1_1_6 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_1_6 \
    op interface \
    ports { x_local_1_1_6_address0 { O 4 vector } x_local_1_1_6_ce0 { O 1 bit } x_local_1_1_6_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_1_6'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 788 \
    name x_local_1_1_7 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_1_7 \
    op interface \
    ports { x_local_1_1_7_address0 { O 4 vector } x_local_1_1_7_ce0 { O 1 bit } x_local_1_1_7_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_1_7'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 789 \
    name x_local_1_1_8 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_1_8 \
    op interface \
    ports { x_local_1_1_8_address0 { O 4 vector } x_local_1_1_8_ce0 { O 1 bit } x_local_1_1_8_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_1_8'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 790 \
    name x_local_1_1_9 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_1_9 \
    op interface \
    ports { x_local_1_1_9_address0 { O 4 vector } x_local_1_1_9_ce0 { O 1 bit } x_local_1_1_9_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_1_9'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 791 \
    name x_local_1_1_10 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_1_10 \
    op interface \
    ports { x_local_1_1_10_address0 { O 4 vector } x_local_1_1_10_ce0 { O 1 bit } x_local_1_1_10_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_1_10'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 792 \
    name x_local_1_1_11 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_1_11 \
    op interface \
    ports { x_local_1_1_11_address0 { O 4 vector } x_local_1_1_11_ce0 { O 1 bit } x_local_1_1_11_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_1_11'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 793 \
    name x_local_1_1_12 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_1_12 \
    op interface \
    ports { x_local_1_1_12_address0 { O 4 vector } x_local_1_1_12_ce0 { O 1 bit } x_local_1_1_12_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_1_12'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 794 \
    name x_local_1_1_13 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_1_13 \
    op interface \
    ports { x_local_1_1_13_address0 { O 4 vector } x_local_1_1_13_ce0 { O 1 bit } x_local_1_1_13_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_1_13'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 795 \
    name x_local_1_1_14 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_1_14 \
    op interface \
    ports { x_local_1_1_14_address0 { O 4 vector } x_local_1_1_14_ce0 { O 1 bit } x_local_1_1_14_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_1_14'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 796 \
    name x_local_1_1_15 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_1_15 \
    op interface \
    ports { x_local_1_1_15_address0 { O 4 vector } x_local_1_1_15_ce0 { O 1 bit } x_local_1_1_15_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_1_15'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 797 \
    name x_local_1_2_0 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_2_0 \
    op interface \
    ports { x_local_1_2_0_address0 { O 4 vector } x_local_1_2_0_ce0 { O 1 bit } x_local_1_2_0_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_2_0'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 798 \
    name x_local_1_2_1 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_2_1 \
    op interface \
    ports { x_local_1_2_1_address0 { O 4 vector } x_local_1_2_1_ce0 { O 1 bit } x_local_1_2_1_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_2_1'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 799 \
    name x_local_1_2_2 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_2_2 \
    op interface \
    ports { x_local_1_2_2_address0 { O 4 vector } x_local_1_2_2_ce0 { O 1 bit } x_local_1_2_2_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_2_2'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 800 \
    name x_local_1_2_3 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_2_3 \
    op interface \
    ports { x_local_1_2_3_address0 { O 4 vector } x_local_1_2_3_ce0 { O 1 bit } x_local_1_2_3_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_2_3'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 801 \
    name x_local_1_2_4 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_2_4 \
    op interface \
    ports { x_local_1_2_4_address0 { O 4 vector } x_local_1_2_4_ce0 { O 1 bit } x_local_1_2_4_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_2_4'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 802 \
    name x_local_1_2_5 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_2_5 \
    op interface \
    ports { x_local_1_2_5_address0 { O 4 vector } x_local_1_2_5_ce0 { O 1 bit } x_local_1_2_5_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_2_5'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 803 \
    name x_local_1_2_6 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_2_6 \
    op interface \
    ports { x_local_1_2_6_address0 { O 4 vector } x_local_1_2_6_ce0 { O 1 bit } x_local_1_2_6_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_2_6'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 804 \
    name x_local_1_2_7 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_2_7 \
    op interface \
    ports { x_local_1_2_7_address0 { O 4 vector } x_local_1_2_7_ce0 { O 1 bit } x_local_1_2_7_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_2_7'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 805 \
    name x_local_1_2_8 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_2_8 \
    op interface \
    ports { x_local_1_2_8_address0 { O 4 vector } x_local_1_2_8_ce0 { O 1 bit } x_local_1_2_8_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_2_8'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 806 \
    name x_local_1_2_9 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_2_9 \
    op interface \
    ports { x_local_1_2_9_address0 { O 4 vector } x_local_1_2_9_ce0 { O 1 bit } x_local_1_2_9_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_2_9'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 807 \
    name x_local_1_2_10 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_2_10 \
    op interface \
    ports { x_local_1_2_10_address0 { O 4 vector } x_local_1_2_10_ce0 { O 1 bit } x_local_1_2_10_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_2_10'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 808 \
    name x_local_1_2_11 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_2_11 \
    op interface \
    ports { x_local_1_2_11_address0 { O 4 vector } x_local_1_2_11_ce0 { O 1 bit } x_local_1_2_11_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_2_11'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 809 \
    name x_local_1_2_12 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_2_12 \
    op interface \
    ports { x_local_1_2_12_address0 { O 4 vector } x_local_1_2_12_ce0 { O 1 bit } x_local_1_2_12_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_2_12'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 810 \
    name x_local_1_2_13 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_2_13 \
    op interface \
    ports { x_local_1_2_13_address0 { O 4 vector } x_local_1_2_13_ce0 { O 1 bit } x_local_1_2_13_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_2_13'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 811 \
    name x_local_1_2_14 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_2_14 \
    op interface \
    ports { x_local_1_2_14_address0 { O 4 vector } x_local_1_2_14_ce0 { O 1 bit } x_local_1_2_14_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_2_14'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 812 \
    name x_local_1_2_15 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_2_15 \
    op interface \
    ports { x_local_1_2_15_address0 { O 4 vector } x_local_1_2_15_ce0 { O 1 bit } x_local_1_2_15_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_2_15'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 813 \
    name x_local_1_3_0 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_3_0 \
    op interface \
    ports { x_local_1_3_0_address0 { O 4 vector } x_local_1_3_0_ce0 { O 1 bit } x_local_1_3_0_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_3_0'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 814 \
    name x_local_1_3_1 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_3_1 \
    op interface \
    ports { x_local_1_3_1_address0 { O 4 vector } x_local_1_3_1_ce0 { O 1 bit } x_local_1_3_1_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_3_1'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 815 \
    name x_local_1_3_2 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_3_2 \
    op interface \
    ports { x_local_1_3_2_address0 { O 4 vector } x_local_1_3_2_ce0 { O 1 bit } x_local_1_3_2_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_3_2'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 816 \
    name x_local_1_3_3 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_3_3 \
    op interface \
    ports { x_local_1_3_3_address0 { O 4 vector } x_local_1_3_3_ce0 { O 1 bit } x_local_1_3_3_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_3_3'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 817 \
    name x_local_1_3_4 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_3_4 \
    op interface \
    ports { x_local_1_3_4_address0 { O 4 vector } x_local_1_3_4_ce0 { O 1 bit } x_local_1_3_4_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_3_4'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 818 \
    name x_local_1_3_5 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_3_5 \
    op interface \
    ports { x_local_1_3_5_address0 { O 4 vector } x_local_1_3_5_ce0 { O 1 bit } x_local_1_3_5_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_3_5'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 819 \
    name x_local_1_3_6 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_3_6 \
    op interface \
    ports { x_local_1_3_6_address0 { O 4 vector } x_local_1_3_6_ce0 { O 1 bit } x_local_1_3_6_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_3_6'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 820 \
    name x_local_1_3_7 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_3_7 \
    op interface \
    ports { x_local_1_3_7_address0 { O 4 vector } x_local_1_3_7_ce0 { O 1 bit } x_local_1_3_7_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_3_7'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 821 \
    name x_local_1_3_8 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_3_8 \
    op interface \
    ports { x_local_1_3_8_address0 { O 4 vector } x_local_1_3_8_ce0 { O 1 bit } x_local_1_3_8_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_3_8'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 822 \
    name x_local_1_3_9 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_3_9 \
    op interface \
    ports { x_local_1_3_9_address0 { O 4 vector } x_local_1_3_9_ce0 { O 1 bit } x_local_1_3_9_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_3_9'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 823 \
    name x_local_1_3_10 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_3_10 \
    op interface \
    ports { x_local_1_3_10_address0 { O 4 vector } x_local_1_3_10_ce0 { O 1 bit } x_local_1_3_10_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_3_10'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 824 \
    name x_local_1_3_11 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_3_11 \
    op interface \
    ports { x_local_1_3_11_address0 { O 4 vector } x_local_1_3_11_ce0 { O 1 bit } x_local_1_3_11_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_3_11'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 825 \
    name x_local_1_3_12 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_3_12 \
    op interface \
    ports { x_local_1_3_12_address0 { O 4 vector } x_local_1_3_12_ce0 { O 1 bit } x_local_1_3_12_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_3_12'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 826 \
    name x_local_1_3_13 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_3_13 \
    op interface \
    ports { x_local_1_3_13_address0 { O 4 vector } x_local_1_3_13_ce0 { O 1 bit } x_local_1_3_13_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_3_13'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 827 \
    name x_local_1_3_14 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_3_14 \
    op interface \
    ports { x_local_1_3_14_address0 { O 4 vector } x_local_1_3_14_ce0 { O 1 bit } x_local_1_3_14_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_3_14'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 828 \
    name x_local_1_3_15 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_3_15 \
    op interface \
    ports { x_local_1_3_15_address0 { O 4 vector } x_local_1_3_15_ce0 { O 1 bit } x_local_1_3_15_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_3_15'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 829 \
    name x_local_1_4_0 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_4_0 \
    op interface \
    ports { x_local_1_4_0_address0 { O 4 vector } x_local_1_4_0_ce0 { O 1 bit } x_local_1_4_0_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_4_0'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 830 \
    name x_local_1_4_1 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_4_1 \
    op interface \
    ports { x_local_1_4_1_address0 { O 4 vector } x_local_1_4_1_ce0 { O 1 bit } x_local_1_4_1_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_4_1'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 831 \
    name x_local_1_4_2 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_4_2 \
    op interface \
    ports { x_local_1_4_2_address0 { O 4 vector } x_local_1_4_2_ce0 { O 1 bit } x_local_1_4_2_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_4_2'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 832 \
    name x_local_1_4_3 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_4_3 \
    op interface \
    ports { x_local_1_4_3_address0 { O 4 vector } x_local_1_4_3_ce0 { O 1 bit } x_local_1_4_3_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_4_3'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 833 \
    name x_local_1_4_4 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_4_4 \
    op interface \
    ports { x_local_1_4_4_address0 { O 4 vector } x_local_1_4_4_ce0 { O 1 bit } x_local_1_4_4_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_4_4'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 834 \
    name x_local_1_4_5 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_4_5 \
    op interface \
    ports { x_local_1_4_5_address0 { O 4 vector } x_local_1_4_5_ce0 { O 1 bit } x_local_1_4_5_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_4_5'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 835 \
    name x_local_1_4_6 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_4_6 \
    op interface \
    ports { x_local_1_4_6_address0 { O 4 vector } x_local_1_4_6_ce0 { O 1 bit } x_local_1_4_6_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_4_6'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 836 \
    name x_local_1_4_7 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_4_7 \
    op interface \
    ports { x_local_1_4_7_address0 { O 4 vector } x_local_1_4_7_ce0 { O 1 bit } x_local_1_4_7_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_4_7'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 837 \
    name x_local_1_4_8 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_4_8 \
    op interface \
    ports { x_local_1_4_8_address0 { O 4 vector } x_local_1_4_8_ce0 { O 1 bit } x_local_1_4_8_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_4_8'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 838 \
    name x_local_1_4_9 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_4_9 \
    op interface \
    ports { x_local_1_4_9_address0 { O 4 vector } x_local_1_4_9_ce0 { O 1 bit } x_local_1_4_9_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_4_9'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 839 \
    name x_local_1_4_10 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_4_10 \
    op interface \
    ports { x_local_1_4_10_address0 { O 4 vector } x_local_1_4_10_ce0 { O 1 bit } x_local_1_4_10_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_4_10'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 840 \
    name x_local_1_4_11 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_4_11 \
    op interface \
    ports { x_local_1_4_11_address0 { O 4 vector } x_local_1_4_11_ce0 { O 1 bit } x_local_1_4_11_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_4_11'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 841 \
    name x_local_1_4_12 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_4_12 \
    op interface \
    ports { x_local_1_4_12_address0 { O 4 vector } x_local_1_4_12_ce0 { O 1 bit } x_local_1_4_12_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_4_12'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 842 \
    name x_local_1_4_13 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_4_13 \
    op interface \
    ports { x_local_1_4_13_address0 { O 4 vector } x_local_1_4_13_ce0 { O 1 bit } x_local_1_4_13_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_4_13'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 843 \
    name x_local_1_4_14 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_4_14 \
    op interface \
    ports { x_local_1_4_14_address0 { O 4 vector } x_local_1_4_14_ce0 { O 1 bit } x_local_1_4_14_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_4_14'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 844 \
    name x_local_1_4_15 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_4_15 \
    op interface \
    ports { x_local_1_4_15_address0 { O 4 vector } x_local_1_4_15_ce0 { O 1 bit } x_local_1_4_15_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_4_15'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 845 \
    name x_local_1_5_0 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_5_0 \
    op interface \
    ports { x_local_1_5_0_address0 { O 4 vector } x_local_1_5_0_ce0 { O 1 bit } x_local_1_5_0_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_5_0'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 846 \
    name x_local_1_5_1 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_5_1 \
    op interface \
    ports { x_local_1_5_1_address0 { O 4 vector } x_local_1_5_1_ce0 { O 1 bit } x_local_1_5_1_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_5_1'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 847 \
    name x_local_1_5_2 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_5_2 \
    op interface \
    ports { x_local_1_5_2_address0 { O 4 vector } x_local_1_5_2_ce0 { O 1 bit } x_local_1_5_2_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_5_2'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 848 \
    name x_local_1_5_3 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_5_3 \
    op interface \
    ports { x_local_1_5_3_address0 { O 4 vector } x_local_1_5_3_ce0 { O 1 bit } x_local_1_5_3_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_5_3'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 849 \
    name x_local_1_5_4 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_5_4 \
    op interface \
    ports { x_local_1_5_4_address0 { O 4 vector } x_local_1_5_4_ce0 { O 1 bit } x_local_1_5_4_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_5_4'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 850 \
    name x_local_1_5_5 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_5_5 \
    op interface \
    ports { x_local_1_5_5_address0 { O 4 vector } x_local_1_5_5_ce0 { O 1 bit } x_local_1_5_5_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_5_5'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 851 \
    name x_local_1_5_6 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_5_6 \
    op interface \
    ports { x_local_1_5_6_address0 { O 4 vector } x_local_1_5_6_ce0 { O 1 bit } x_local_1_5_6_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_5_6'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 852 \
    name x_local_1_5_7 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_5_7 \
    op interface \
    ports { x_local_1_5_7_address0 { O 4 vector } x_local_1_5_7_ce0 { O 1 bit } x_local_1_5_7_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_5_7'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 853 \
    name x_local_1_5_8 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_5_8 \
    op interface \
    ports { x_local_1_5_8_address0 { O 4 vector } x_local_1_5_8_ce0 { O 1 bit } x_local_1_5_8_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_5_8'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 854 \
    name x_local_1_5_9 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_5_9 \
    op interface \
    ports { x_local_1_5_9_address0 { O 4 vector } x_local_1_5_9_ce0 { O 1 bit } x_local_1_5_9_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_5_9'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 855 \
    name x_local_1_5_10 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_5_10 \
    op interface \
    ports { x_local_1_5_10_address0 { O 4 vector } x_local_1_5_10_ce0 { O 1 bit } x_local_1_5_10_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_5_10'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 856 \
    name x_local_1_5_11 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_5_11 \
    op interface \
    ports { x_local_1_5_11_address0 { O 4 vector } x_local_1_5_11_ce0 { O 1 bit } x_local_1_5_11_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_5_11'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 857 \
    name x_local_1_5_12 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_5_12 \
    op interface \
    ports { x_local_1_5_12_address0 { O 4 vector } x_local_1_5_12_ce0 { O 1 bit } x_local_1_5_12_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_5_12'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 858 \
    name x_local_1_5_13 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_5_13 \
    op interface \
    ports { x_local_1_5_13_address0 { O 4 vector } x_local_1_5_13_ce0 { O 1 bit } x_local_1_5_13_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_5_13'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 859 \
    name x_local_1_5_14 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_5_14 \
    op interface \
    ports { x_local_1_5_14_address0 { O 4 vector } x_local_1_5_14_ce0 { O 1 bit } x_local_1_5_14_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_5_14'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 860 \
    name x_local_1_5_15 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_5_15 \
    op interface \
    ports { x_local_1_5_15_address0 { O 4 vector } x_local_1_5_15_ce0 { O 1 bit } x_local_1_5_15_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_5_15'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 861 \
    name x_local_1_6_0 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_6_0 \
    op interface \
    ports { x_local_1_6_0_address0 { O 4 vector } x_local_1_6_0_ce0 { O 1 bit } x_local_1_6_0_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_6_0'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 862 \
    name x_local_1_6_1 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_6_1 \
    op interface \
    ports { x_local_1_6_1_address0 { O 4 vector } x_local_1_6_1_ce0 { O 1 bit } x_local_1_6_1_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_6_1'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 863 \
    name x_local_1_6_2 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_6_2 \
    op interface \
    ports { x_local_1_6_2_address0 { O 4 vector } x_local_1_6_2_ce0 { O 1 bit } x_local_1_6_2_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_6_2'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 864 \
    name x_local_1_6_3 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_6_3 \
    op interface \
    ports { x_local_1_6_3_address0 { O 4 vector } x_local_1_6_3_ce0 { O 1 bit } x_local_1_6_3_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_6_3'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 865 \
    name x_local_1_6_4 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_6_4 \
    op interface \
    ports { x_local_1_6_4_address0 { O 4 vector } x_local_1_6_4_ce0 { O 1 bit } x_local_1_6_4_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_6_4'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 866 \
    name x_local_1_6_5 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_6_5 \
    op interface \
    ports { x_local_1_6_5_address0 { O 4 vector } x_local_1_6_5_ce0 { O 1 bit } x_local_1_6_5_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_6_5'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 867 \
    name x_local_1_6_6 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_6_6 \
    op interface \
    ports { x_local_1_6_6_address0 { O 4 vector } x_local_1_6_6_ce0 { O 1 bit } x_local_1_6_6_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_6_6'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 868 \
    name x_local_1_6_7 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_6_7 \
    op interface \
    ports { x_local_1_6_7_address0 { O 4 vector } x_local_1_6_7_ce0 { O 1 bit } x_local_1_6_7_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_6_7'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 869 \
    name x_local_1_6_8 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_6_8 \
    op interface \
    ports { x_local_1_6_8_address0 { O 4 vector } x_local_1_6_8_ce0 { O 1 bit } x_local_1_6_8_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_6_8'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 870 \
    name x_local_1_6_9 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_6_9 \
    op interface \
    ports { x_local_1_6_9_address0 { O 4 vector } x_local_1_6_9_ce0 { O 1 bit } x_local_1_6_9_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_6_9'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 871 \
    name x_local_1_6_10 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_6_10 \
    op interface \
    ports { x_local_1_6_10_address0 { O 4 vector } x_local_1_6_10_ce0 { O 1 bit } x_local_1_6_10_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_6_10'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 872 \
    name x_local_1_6_11 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_6_11 \
    op interface \
    ports { x_local_1_6_11_address0 { O 4 vector } x_local_1_6_11_ce0 { O 1 bit } x_local_1_6_11_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_6_11'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 873 \
    name x_local_1_6_12 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_6_12 \
    op interface \
    ports { x_local_1_6_12_address0 { O 4 vector } x_local_1_6_12_ce0 { O 1 bit } x_local_1_6_12_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_6_12'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 874 \
    name x_local_1_6_13 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_6_13 \
    op interface \
    ports { x_local_1_6_13_address0 { O 4 vector } x_local_1_6_13_ce0 { O 1 bit } x_local_1_6_13_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_6_13'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 875 \
    name x_local_1_6_14 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_6_14 \
    op interface \
    ports { x_local_1_6_14_address0 { O 4 vector } x_local_1_6_14_ce0 { O 1 bit } x_local_1_6_14_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_6_14'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 876 \
    name x_local_1_6_15 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_6_15 \
    op interface \
    ports { x_local_1_6_15_address0 { O 4 vector } x_local_1_6_15_ce0 { O 1 bit } x_local_1_6_15_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_6_15'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 877 \
    name x_local_1_7_0 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_7_0 \
    op interface \
    ports { x_local_1_7_0_address0 { O 4 vector } x_local_1_7_0_ce0 { O 1 bit } x_local_1_7_0_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_7_0'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 878 \
    name x_local_1_7_1 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_7_1 \
    op interface \
    ports { x_local_1_7_1_address0 { O 4 vector } x_local_1_7_1_ce0 { O 1 bit } x_local_1_7_1_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_7_1'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 879 \
    name x_local_1_7_2 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_7_2 \
    op interface \
    ports { x_local_1_7_2_address0 { O 4 vector } x_local_1_7_2_ce0 { O 1 bit } x_local_1_7_2_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_7_2'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 880 \
    name x_local_1_7_3 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_7_3 \
    op interface \
    ports { x_local_1_7_3_address0 { O 4 vector } x_local_1_7_3_ce0 { O 1 bit } x_local_1_7_3_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_7_3'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 881 \
    name x_local_1_7_4 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_7_4 \
    op interface \
    ports { x_local_1_7_4_address0 { O 4 vector } x_local_1_7_4_ce0 { O 1 bit } x_local_1_7_4_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_7_4'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 882 \
    name x_local_1_7_5 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_7_5 \
    op interface \
    ports { x_local_1_7_5_address0 { O 4 vector } x_local_1_7_5_ce0 { O 1 bit } x_local_1_7_5_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_7_5'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 883 \
    name x_local_1_7_6 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_7_6 \
    op interface \
    ports { x_local_1_7_6_address0 { O 4 vector } x_local_1_7_6_ce0 { O 1 bit } x_local_1_7_6_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_7_6'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 884 \
    name x_local_1_7_7 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_7_7 \
    op interface \
    ports { x_local_1_7_7_address0 { O 4 vector } x_local_1_7_7_ce0 { O 1 bit } x_local_1_7_7_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_7_7'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 885 \
    name x_local_1_7_8 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_7_8 \
    op interface \
    ports { x_local_1_7_8_address0 { O 4 vector } x_local_1_7_8_ce0 { O 1 bit } x_local_1_7_8_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_7_8'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 886 \
    name x_local_1_7_9 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_7_9 \
    op interface \
    ports { x_local_1_7_9_address0 { O 4 vector } x_local_1_7_9_ce0 { O 1 bit } x_local_1_7_9_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_7_9'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 887 \
    name x_local_1_7_10 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_7_10 \
    op interface \
    ports { x_local_1_7_10_address0 { O 4 vector } x_local_1_7_10_ce0 { O 1 bit } x_local_1_7_10_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_7_10'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 888 \
    name x_local_1_7_11 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_7_11 \
    op interface \
    ports { x_local_1_7_11_address0 { O 4 vector } x_local_1_7_11_ce0 { O 1 bit } x_local_1_7_11_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_7_11'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 889 \
    name x_local_1_7_12 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_7_12 \
    op interface \
    ports { x_local_1_7_12_address0 { O 4 vector } x_local_1_7_12_ce0 { O 1 bit } x_local_1_7_12_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_7_12'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 890 \
    name x_local_1_7_13 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_7_13 \
    op interface \
    ports { x_local_1_7_13_address0 { O 4 vector } x_local_1_7_13_ce0 { O 1 bit } x_local_1_7_13_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_7_13'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 891 \
    name x_local_1_7_14 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_7_14 \
    op interface \
    ports { x_local_1_7_14_address0 { O 4 vector } x_local_1_7_14_ce0 { O 1 bit } x_local_1_7_14_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_7_14'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 892 \
    name x_local_1_7_15 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_1_7_15 \
    op interface \
    ports { x_local_1_7_15_address0 { O 4 vector } x_local_1_7_15_ce0 { O 1 bit } x_local_1_7_15_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_1_7_15'"
}
}


# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 764 \
    name W \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_W \
    op interface \
    ports { W_dout { I 8 vector } W_empty_n { I 1 bit } W_read { O 1 bit } W_num_data_valid { I 3 vector } W_fifo_cap { I 3 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 893 \
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
    id 894 \
    name X1_cache \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_X1_cache \
    op interface \
    ports { X1_cache_din { O 32 vector } X1_cache_full_n { I 1 bit } X1_cache_write { O 1 bit } X1_cache_num_data_valid { I 5 vector } X1_cache_fifo_cap { I 5 vector } } \
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


