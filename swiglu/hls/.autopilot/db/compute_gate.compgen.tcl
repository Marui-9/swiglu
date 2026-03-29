# This script segment is generated automatically by AutoPilot

set name swiglu_fdiv_32ns_32ns_32_30_no_dsp_1
if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $name BINDTYPE {op} TYPE {fdiv} IMPL {fabric} LATENCY 29 ALLOW_PRAGMA 1
}


set name swiglu_fcmp_32ns_32ns_1_3_no_dsp_1
if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $name BINDTYPE {op} TYPE {fcmp} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler swiglu_compute_gate_gate_fp_RAM_1P_URAM_1R1W BINDTYPE {storage} TYPE {ram_1p} IMPL {uram} LATENCY 2 ALLOW_PRAGMA 1
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
    id 1384 \
    name X1_cache \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename X1_cache \
    op interface \
    ports { X1_cache_address0 { O 13 vector } X1_cache_ce0 { O 1 bit } X1_cache_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'X1_cache'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1385 \
    name X2_cache \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename X2_cache \
    op interface \
    ports { X2_cache_address0 { O 13 vector } X2_cache_ce0 { O 1 bit } X2_cache_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'X2_cache'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1386 \
    name gate_cache_0 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename gate_cache_0 \
    op interface \
    ports { gate_cache_0_address1 { O 8 vector } gate_cache_0_ce1 { O 1 bit } gate_cache_0_we1 { O 1 bit } gate_cache_0_d1 { O 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'gate_cache_0'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1387 \
    name gate_cache_1 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename gate_cache_1 \
    op interface \
    ports { gate_cache_1_address1 { O 8 vector } gate_cache_1_ce1 { O 1 bit } gate_cache_1_we1 { O 1 bit } gate_cache_1_d1 { O 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'gate_cache_1'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1388 \
    name gate_cache_2 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename gate_cache_2 \
    op interface \
    ports { gate_cache_2_address1 { O 8 vector } gate_cache_2_ce1 { O 1 bit } gate_cache_2_we1 { O 1 bit } gate_cache_2_d1 { O 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'gate_cache_2'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1389 \
    name gate_cache_3 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename gate_cache_3 \
    op interface \
    ports { gate_cache_3_address1 { O 8 vector } gate_cache_3_ce1 { O 1 bit } gate_cache_3_we1 { O 1 bit } gate_cache_3_d1 { O 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'gate_cache_3'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1390 \
    name gate_cache_4 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename gate_cache_4 \
    op interface \
    ports { gate_cache_4_address1 { O 8 vector } gate_cache_4_ce1 { O 1 bit } gate_cache_4_we1 { O 1 bit } gate_cache_4_d1 { O 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'gate_cache_4'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1391 \
    name gate_cache_5 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename gate_cache_5 \
    op interface \
    ports { gate_cache_5_address1 { O 8 vector } gate_cache_5_ce1 { O 1 bit } gate_cache_5_we1 { O 1 bit } gate_cache_5_d1 { O 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'gate_cache_5'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1392 \
    name gate_cache_6 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename gate_cache_6 \
    op interface \
    ports { gate_cache_6_address1 { O 8 vector } gate_cache_6_ce1 { O 1 bit } gate_cache_6_we1 { O 1 bit } gate_cache_6_d1 { O 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'gate_cache_6'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1393 \
    name gate_cache_7 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename gate_cache_7 \
    op interface \
    ports { gate_cache_7_address1 { O 8 vector } gate_cache_7_ce1 { O 1 bit } gate_cache_7_we1 { O 1 bit } gate_cache_7_d1 { O 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'gate_cache_7'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1394 \
    name gate_cache_8 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename gate_cache_8 \
    op interface \
    ports { gate_cache_8_address1 { O 8 vector } gate_cache_8_ce1 { O 1 bit } gate_cache_8_we1 { O 1 bit } gate_cache_8_d1 { O 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'gate_cache_8'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1395 \
    name gate_cache_9 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename gate_cache_9 \
    op interface \
    ports { gate_cache_9_address1 { O 8 vector } gate_cache_9_ce1 { O 1 bit } gate_cache_9_we1 { O 1 bit } gate_cache_9_d1 { O 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'gate_cache_9'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1396 \
    name gate_cache_10 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename gate_cache_10 \
    op interface \
    ports { gate_cache_10_address1 { O 8 vector } gate_cache_10_ce1 { O 1 bit } gate_cache_10_we1 { O 1 bit } gate_cache_10_d1 { O 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'gate_cache_10'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1397 \
    name gate_cache_11 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename gate_cache_11 \
    op interface \
    ports { gate_cache_11_address1 { O 8 vector } gate_cache_11_ce1 { O 1 bit } gate_cache_11_we1 { O 1 bit } gate_cache_11_d1 { O 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'gate_cache_11'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1398 \
    name gate_cache_12 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename gate_cache_12 \
    op interface \
    ports { gate_cache_12_address1 { O 8 vector } gate_cache_12_ce1 { O 1 bit } gate_cache_12_we1 { O 1 bit } gate_cache_12_d1 { O 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'gate_cache_12'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1399 \
    name gate_cache_13 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename gate_cache_13 \
    op interface \
    ports { gate_cache_13_address1 { O 8 vector } gate_cache_13_ce1 { O 1 bit } gate_cache_13_we1 { O 1 bit } gate_cache_13_d1 { O 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'gate_cache_13'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1400 \
    name gate_cache_14 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename gate_cache_14 \
    op interface \
    ports { gate_cache_14_address1 { O 8 vector } gate_cache_14_ce1 { O 1 bit } gate_cache_14_we1 { O 1 bit } gate_cache_14_d1 { O 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'gate_cache_14'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1401 \
    name gate_cache_15 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename gate_cache_15 \
    op interface \
    ports { gate_cache_15_address1 { O 8 vector } gate_cache_15_ce1 { O 1 bit } gate_cache_15_we1 { O 1 bit } gate_cache_15_d1 { O 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'gate_cache_15'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1402 \
    name gate_cache_16 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename gate_cache_16 \
    op interface \
    ports { gate_cache_16_address1 { O 8 vector } gate_cache_16_ce1 { O 1 bit } gate_cache_16_we1 { O 1 bit } gate_cache_16_d1 { O 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'gate_cache_16'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1403 \
    name gate_cache_17 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename gate_cache_17 \
    op interface \
    ports { gate_cache_17_address1 { O 8 vector } gate_cache_17_ce1 { O 1 bit } gate_cache_17_we1 { O 1 bit } gate_cache_17_d1 { O 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'gate_cache_17'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1404 \
    name gate_cache_18 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename gate_cache_18 \
    op interface \
    ports { gate_cache_18_address1 { O 8 vector } gate_cache_18_ce1 { O 1 bit } gate_cache_18_we1 { O 1 bit } gate_cache_18_d1 { O 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'gate_cache_18'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1405 \
    name gate_cache_19 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename gate_cache_19 \
    op interface \
    ports { gate_cache_19_address1 { O 8 vector } gate_cache_19_ce1 { O 1 bit } gate_cache_19_we1 { O 1 bit } gate_cache_19_d1 { O 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'gate_cache_19'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1406 \
    name gate_cache_20 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename gate_cache_20 \
    op interface \
    ports { gate_cache_20_address1 { O 8 vector } gate_cache_20_ce1 { O 1 bit } gate_cache_20_we1 { O 1 bit } gate_cache_20_d1 { O 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'gate_cache_20'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1407 \
    name gate_cache_21 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename gate_cache_21 \
    op interface \
    ports { gate_cache_21_address1 { O 8 vector } gate_cache_21_ce1 { O 1 bit } gate_cache_21_we1 { O 1 bit } gate_cache_21_d1 { O 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'gate_cache_21'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1408 \
    name gate_cache_22 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename gate_cache_22 \
    op interface \
    ports { gate_cache_22_address1 { O 8 vector } gate_cache_22_ce1 { O 1 bit } gate_cache_22_we1 { O 1 bit } gate_cache_22_d1 { O 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'gate_cache_22'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1409 \
    name gate_cache_23 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename gate_cache_23 \
    op interface \
    ports { gate_cache_23_address1 { O 8 vector } gate_cache_23_ce1 { O 1 bit } gate_cache_23_we1 { O 1 bit } gate_cache_23_d1 { O 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'gate_cache_23'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1410 \
    name gate_cache_24 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename gate_cache_24 \
    op interface \
    ports { gate_cache_24_address1 { O 8 vector } gate_cache_24_ce1 { O 1 bit } gate_cache_24_we1 { O 1 bit } gate_cache_24_d1 { O 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'gate_cache_24'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1411 \
    name gate_cache_25 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename gate_cache_25 \
    op interface \
    ports { gate_cache_25_address1 { O 8 vector } gate_cache_25_ce1 { O 1 bit } gate_cache_25_we1 { O 1 bit } gate_cache_25_d1 { O 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'gate_cache_25'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1412 \
    name gate_cache_26 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename gate_cache_26 \
    op interface \
    ports { gate_cache_26_address1 { O 8 vector } gate_cache_26_ce1 { O 1 bit } gate_cache_26_we1 { O 1 bit } gate_cache_26_d1 { O 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'gate_cache_26'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1413 \
    name gate_cache_27 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename gate_cache_27 \
    op interface \
    ports { gate_cache_27_address1 { O 8 vector } gate_cache_27_ce1 { O 1 bit } gate_cache_27_we1 { O 1 bit } gate_cache_27_d1 { O 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'gate_cache_27'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1414 \
    name gate_cache_28 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename gate_cache_28 \
    op interface \
    ports { gate_cache_28_address1 { O 8 vector } gate_cache_28_ce1 { O 1 bit } gate_cache_28_we1 { O 1 bit } gate_cache_28_d1 { O 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'gate_cache_28'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1415 \
    name gate_cache_29 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename gate_cache_29 \
    op interface \
    ports { gate_cache_29_address1 { O 8 vector } gate_cache_29_ce1 { O 1 bit } gate_cache_29_we1 { O 1 bit } gate_cache_29_d1 { O 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'gate_cache_29'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1416 \
    name gate_cache_30 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename gate_cache_30 \
    op interface \
    ports { gate_cache_30_address1 { O 8 vector } gate_cache_30_ce1 { O 1 bit } gate_cache_30_we1 { O 1 bit } gate_cache_30_d1 { O 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'gate_cache_30'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1417 \
    name gate_cache_31 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename gate_cache_31 \
    op interface \
    ports { gate_cache_31_address1 { O 8 vector } gate_cache_31_ce1 { O 1 bit } gate_cache_31_we1 { O 1 bit } gate_cache_31_d1 { O 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'gate_cache_31'"
}
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


