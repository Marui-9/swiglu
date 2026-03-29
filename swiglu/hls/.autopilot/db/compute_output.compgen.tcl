# This script segment is generated automatically by AutoPilot

if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler swiglu_compute_output_out_local_RAM_AUTO_1R1W BINDTYPE {storage} TYPE {ram} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler swiglu_compute_output_row_buf_32_RAM_1WNR_AUTO_1R1W BINDTYPE {storage} TYPE {ram_1wnr} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
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
    id 3871 \
    name gate_cache_0 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename gate_cache_0 \
    op interface \
    ports { gate_cache_0_address0 { O 8 vector } gate_cache_0_ce0 { O 1 bit } gate_cache_0_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'gate_cache_0'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 3872 \
    name gate_cache_1 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename gate_cache_1 \
    op interface \
    ports { gate_cache_1_address0 { O 8 vector } gate_cache_1_ce0 { O 1 bit } gate_cache_1_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'gate_cache_1'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 3873 \
    name gate_cache_2 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename gate_cache_2 \
    op interface \
    ports { gate_cache_2_address0 { O 8 vector } gate_cache_2_ce0 { O 1 bit } gate_cache_2_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'gate_cache_2'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 3874 \
    name gate_cache_3 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename gate_cache_3 \
    op interface \
    ports { gate_cache_3_address0 { O 8 vector } gate_cache_3_ce0 { O 1 bit } gate_cache_3_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'gate_cache_3'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 3875 \
    name gate_cache_4 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename gate_cache_4 \
    op interface \
    ports { gate_cache_4_address0 { O 8 vector } gate_cache_4_ce0 { O 1 bit } gate_cache_4_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'gate_cache_4'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 3876 \
    name gate_cache_5 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename gate_cache_5 \
    op interface \
    ports { gate_cache_5_address0 { O 8 vector } gate_cache_5_ce0 { O 1 bit } gate_cache_5_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'gate_cache_5'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 3877 \
    name gate_cache_6 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename gate_cache_6 \
    op interface \
    ports { gate_cache_6_address0 { O 8 vector } gate_cache_6_ce0 { O 1 bit } gate_cache_6_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'gate_cache_6'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 3878 \
    name gate_cache_7 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename gate_cache_7 \
    op interface \
    ports { gate_cache_7_address0 { O 8 vector } gate_cache_7_ce0 { O 1 bit } gate_cache_7_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'gate_cache_7'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 3879 \
    name gate_cache_8 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename gate_cache_8 \
    op interface \
    ports { gate_cache_8_address0 { O 8 vector } gate_cache_8_ce0 { O 1 bit } gate_cache_8_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'gate_cache_8'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 3880 \
    name gate_cache_9 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename gate_cache_9 \
    op interface \
    ports { gate_cache_9_address0 { O 8 vector } gate_cache_9_ce0 { O 1 bit } gate_cache_9_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'gate_cache_9'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 3881 \
    name gate_cache_10 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename gate_cache_10 \
    op interface \
    ports { gate_cache_10_address0 { O 8 vector } gate_cache_10_ce0 { O 1 bit } gate_cache_10_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'gate_cache_10'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 3882 \
    name gate_cache_11 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename gate_cache_11 \
    op interface \
    ports { gate_cache_11_address0 { O 8 vector } gate_cache_11_ce0 { O 1 bit } gate_cache_11_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'gate_cache_11'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 3883 \
    name gate_cache_12 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename gate_cache_12 \
    op interface \
    ports { gate_cache_12_address0 { O 8 vector } gate_cache_12_ce0 { O 1 bit } gate_cache_12_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'gate_cache_12'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 3884 \
    name gate_cache_13 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename gate_cache_13 \
    op interface \
    ports { gate_cache_13_address0 { O 8 vector } gate_cache_13_ce0 { O 1 bit } gate_cache_13_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'gate_cache_13'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 3885 \
    name gate_cache_14 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename gate_cache_14 \
    op interface \
    ports { gate_cache_14_address0 { O 8 vector } gate_cache_14_ce0 { O 1 bit } gate_cache_14_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'gate_cache_14'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 3886 \
    name gate_cache_15 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename gate_cache_15 \
    op interface \
    ports { gate_cache_15_address0 { O 8 vector } gate_cache_15_ce0 { O 1 bit } gate_cache_15_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'gate_cache_15'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 3887 \
    name gate_cache_16 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename gate_cache_16 \
    op interface \
    ports { gate_cache_16_address0 { O 8 vector } gate_cache_16_ce0 { O 1 bit } gate_cache_16_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'gate_cache_16'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 3888 \
    name gate_cache_17 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename gate_cache_17 \
    op interface \
    ports { gate_cache_17_address0 { O 8 vector } gate_cache_17_ce0 { O 1 bit } gate_cache_17_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'gate_cache_17'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 3889 \
    name gate_cache_18 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename gate_cache_18 \
    op interface \
    ports { gate_cache_18_address0 { O 8 vector } gate_cache_18_ce0 { O 1 bit } gate_cache_18_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'gate_cache_18'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 3890 \
    name gate_cache_19 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename gate_cache_19 \
    op interface \
    ports { gate_cache_19_address0 { O 8 vector } gate_cache_19_ce0 { O 1 bit } gate_cache_19_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'gate_cache_19'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 3891 \
    name gate_cache_20 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename gate_cache_20 \
    op interface \
    ports { gate_cache_20_address0 { O 8 vector } gate_cache_20_ce0 { O 1 bit } gate_cache_20_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'gate_cache_20'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 3892 \
    name gate_cache_21 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename gate_cache_21 \
    op interface \
    ports { gate_cache_21_address0 { O 8 vector } gate_cache_21_ce0 { O 1 bit } gate_cache_21_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'gate_cache_21'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 3893 \
    name gate_cache_22 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename gate_cache_22 \
    op interface \
    ports { gate_cache_22_address0 { O 8 vector } gate_cache_22_ce0 { O 1 bit } gate_cache_22_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'gate_cache_22'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 3894 \
    name gate_cache_23 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename gate_cache_23 \
    op interface \
    ports { gate_cache_23_address0 { O 8 vector } gate_cache_23_ce0 { O 1 bit } gate_cache_23_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'gate_cache_23'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 3895 \
    name gate_cache_24 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename gate_cache_24 \
    op interface \
    ports { gate_cache_24_address0 { O 8 vector } gate_cache_24_ce0 { O 1 bit } gate_cache_24_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'gate_cache_24'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 3896 \
    name gate_cache_25 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename gate_cache_25 \
    op interface \
    ports { gate_cache_25_address0 { O 8 vector } gate_cache_25_ce0 { O 1 bit } gate_cache_25_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'gate_cache_25'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 3897 \
    name gate_cache_26 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename gate_cache_26 \
    op interface \
    ports { gate_cache_26_address0 { O 8 vector } gate_cache_26_ce0 { O 1 bit } gate_cache_26_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'gate_cache_26'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 3898 \
    name gate_cache_27 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename gate_cache_27 \
    op interface \
    ports { gate_cache_27_address0 { O 8 vector } gate_cache_27_ce0 { O 1 bit } gate_cache_27_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'gate_cache_27'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 3899 \
    name gate_cache_28 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename gate_cache_28 \
    op interface \
    ports { gate_cache_28_address0 { O 8 vector } gate_cache_28_ce0 { O 1 bit } gate_cache_28_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'gate_cache_28'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 3900 \
    name gate_cache_29 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename gate_cache_29 \
    op interface \
    ports { gate_cache_29_address0 { O 8 vector } gate_cache_29_ce0 { O 1 bit } gate_cache_29_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'gate_cache_29'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 3901 \
    name gate_cache_30 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename gate_cache_30 \
    op interface \
    ports { gate_cache_30_address0 { O 8 vector } gate_cache_30_ce0 { O 1 bit } gate_cache_30_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'gate_cache_30'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 3902 \
    name gate_cache_31 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename gate_cache_31 \
    op interface \
    ports { gate_cache_31_address0 { O 8 vector } gate_cache_31_ce0 { O 1 bit } gate_cache_31_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'gate_cache_31'"
}
}


# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3868 \
    name p_read \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_p_read \
    op interface \
    ports { p_read { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3869 \
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
    id 3870 \
    name W_down \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_W_down \
    op interface \
    ports { W_down { I 64 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3903 \
    name gmem_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_gmem_out \
    op interface \
    ports { m_axi_gmem_out_0_AWVALID { O 1 bit } m_axi_gmem_out_0_AWREADY { I 1 bit } m_axi_gmem_out_0_AWADDR { O 64 vector } m_axi_gmem_out_0_AWID { O 1 vector } m_axi_gmem_out_0_AWLEN { O 32 vector } m_axi_gmem_out_0_AWSIZE { O 3 vector } m_axi_gmem_out_0_AWBURST { O 2 vector } m_axi_gmem_out_0_AWLOCK { O 2 vector } m_axi_gmem_out_0_AWCACHE { O 4 vector } m_axi_gmem_out_0_AWPROT { O 3 vector } m_axi_gmem_out_0_AWQOS { O 4 vector } m_axi_gmem_out_0_AWREGION { O 4 vector } m_axi_gmem_out_0_AWUSER { O 1 vector } m_axi_gmem_out_0_WVALID { O 1 bit } m_axi_gmem_out_0_WREADY { I 1 bit } m_axi_gmem_out_0_WDATA { O 32 vector } m_axi_gmem_out_0_WSTRB { O 4 vector } m_axi_gmem_out_0_WLAST { O 1 bit } m_axi_gmem_out_0_WID { O 1 vector } m_axi_gmem_out_0_WUSER { O 1 vector } m_axi_gmem_out_0_ARVALID { O 1 bit } m_axi_gmem_out_0_ARREADY { I 1 bit } m_axi_gmem_out_0_ARADDR { O 64 vector } m_axi_gmem_out_0_ARID { O 1 vector } m_axi_gmem_out_0_ARLEN { O 32 vector } m_axi_gmem_out_0_ARSIZE { O 3 vector } m_axi_gmem_out_0_ARBURST { O 2 vector } m_axi_gmem_out_0_ARLOCK { O 2 vector } m_axi_gmem_out_0_ARCACHE { O 4 vector } m_axi_gmem_out_0_ARPROT { O 3 vector } m_axi_gmem_out_0_ARQOS { O 4 vector } m_axi_gmem_out_0_ARREGION { O 4 vector } m_axi_gmem_out_0_ARUSER { O 1 vector } m_axi_gmem_out_0_RVALID { I 1 bit } m_axi_gmem_out_0_RREADY { O 1 bit } m_axi_gmem_out_0_RDATA { I 32 vector } m_axi_gmem_out_0_RLAST { I 1 bit } m_axi_gmem_out_0_RID { I 1 vector } m_axi_gmem_out_0_RFIFONUM { I 9 vector } m_axi_gmem_out_0_RUSER { I 1 vector } m_axi_gmem_out_0_RRESP { I 2 vector } m_axi_gmem_out_0_BVALID { I 1 bit } m_axi_gmem_out_0_BREADY { O 1 bit } m_axi_gmem_out_0_BRESP { I 2 vector } m_axi_gmem_out_0_BID { I 1 vector } m_axi_gmem_out_0_BUSER { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3904 \
    name out_batch \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_out_batch \
    op interface \
    ports { out_batch { I 64 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3905 \
    name down_quant_mode \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_down_quant_mode \
    op interface \
    ports { down_quant_mode { I 32 vector } } \
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


