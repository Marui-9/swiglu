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
    id 1193 \
    name x_local_2_0_0 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_0_0 \
    op interface \
    ports { x_local_2_0_0_address0 { O 4 vector } x_local_2_0_0_ce0 { O 1 bit } x_local_2_0_0_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_0_0'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1194 \
    name x_local_2_0_1 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_0_1 \
    op interface \
    ports { x_local_2_0_1_address0 { O 4 vector } x_local_2_0_1_ce0 { O 1 bit } x_local_2_0_1_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_0_1'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1195 \
    name x_local_2_0_2 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_0_2 \
    op interface \
    ports { x_local_2_0_2_address0 { O 4 vector } x_local_2_0_2_ce0 { O 1 bit } x_local_2_0_2_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_0_2'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1196 \
    name x_local_2_0_3 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_0_3 \
    op interface \
    ports { x_local_2_0_3_address0 { O 4 vector } x_local_2_0_3_ce0 { O 1 bit } x_local_2_0_3_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_0_3'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1197 \
    name x_local_2_0_4 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_0_4 \
    op interface \
    ports { x_local_2_0_4_address0 { O 4 vector } x_local_2_0_4_ce0 { O 1 bit } x_local_2_0_4_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_0_4'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1198 \
    name x_local_2_0_5 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_0_5 \
    op interface \
    ports { x_local_2_0_5_address0 { O 4 vector } x_local_2_0_5_ce0 { O 1 bit } x_local_2_0_5_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_0_5'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1199 \
    name x_local_2_0_6 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_0_6 \
    op interface \
    ports { x_local_2_0_6_address0 { O 4 vector } x_local_2_0_6_ce0 { O 1 bit } x_local_2_0_6_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_0_6'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1200 \
    name x_local_2_0_7 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_0_7 \
    op interface \
    ports { x_local_2_0_7_address0 { O 4 vector } x_local_2_0_7_ce0 { O 1 bit } x_local_2_0_7_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_0_7'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1201 \
    name x_local_2_0_8 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_0_8 \
    op interface \
    ports { x_local_2_0_8_address0 { O 4 vector } x_local_2_0_8_ce0 { O 1 bit } x_local_2_0_8_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_0_8'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1202 \
    name x_local_2_0_9 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_0_9 \
    op interface \
    ports { x_local_2_0_9_address0 { O 4 vector } x_local_2_0_9_ce0 { O 1 bit } x_local_2_0_9_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_0_9'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1203 \
    name x_local_2_0_10 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_0_10 \
    op interface \
    ports { x_local_2_0_10_address0 { O 4 vector } x_local_2_0_10_ce0 { O 1 bit } x_local_2_0_10_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_0_10'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1204 \
    name x_local_2_0_11 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_0_11 \
    op interface \
    ports { x_local_2_0_11_address0 { O 4 vector } x_local_2_0_11_ce0 { O 1 bit } x_local_2_0_11_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_0_11'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1205 \
    name x_local_2_0_12 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_0_12 \
    op interface \
    ports { x_local_2_0_12_address0 { O 4 vector } x_local_2_0_12_ce0 { O 1 bit } x_local_2_0_12_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_0_12'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1206 \
    name x_local_2_0_13 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_0_13 \
    op interface \
    ports { x_local_2_0_13_address0 { O 4 vector } x_local_2_0_13_ce0 { O 1 bit } x_local_2_0_13_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_0_13'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1207 \
    name x_local_2_0_14 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_0_14 \
    op interface \
    ports { x_local_2_0_14_address0 { O 4 vector } x_local_2_0_14_ce0 { O 1 bit } x_local_2_0_14_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_0_14'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1208 \
    name x_local_2_0_15 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_0_15 \
    op interface \
    ports { x_local_2_0_15_address0 { O 4 vector } x_local_2_0_15_ce0 { O 1 bit } x_local_2_0_15_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_0_15'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1209 \
    name x_local_2_1_0 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_1_0 \
    op interface \
    ports { x_local_2_1_0_address0 { O 4 vector } x_local_2_1_0_ce0 { O 1 bit } x_local_2_1_0_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_1_0'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1210 \
    name x_local_2_1_1 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_1_1 \
    op interface \
    ports { x_local_2_1_1_address0 { O 4 vector } x_local_2_1_1_ce0 { O 1 bit } x_local_2_1_1_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_1_1'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1211 \
    name x_local_2_1_2 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_1_2 \
    op interface \
    ports { x_local_2_1_2_address0 { O 4 vector } x_local_2_1_2_ce0 { O 1 bit } x_local_2_1_2_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_1_2'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1212 \
    name x_local_2_1_3 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_1_3 \
    op interface \
    ports { x_local_2_1_3_address0 { O 4 vector } x_local_2_1_3_ce0 { O 1 bit } x_local_2_1_3_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_1_3'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1213 \
    name x_local_2_1_4 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_1_4 \
    op interface \
    ports { x_local_2_1_4_address0 { O 4 vector } x_local_2_1_4_ce0 { O 1 bit } x_local_2_1_4_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_1_4'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1214 \
    name x_local_2_1_5 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_1_5 \
    op interface \
    ports { x_local_2_1_5_address0 { O 4 vector } x_local_2_1_5_ce0 { O 1 bit } x_local_2_1_5_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_1_5'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1215 \
    name x_local_2_1_6 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_1_6 \
    op interface \
    ports { x_local_2_1_6_address0 { O 4 vector } x_local_2_1_6_ce0 { O 1 bit } x_local_2_1_6_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_1_6'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1216 \
    name x_local_2_1_7 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_1_7 \
    op interface \
    ports { x_local_2_1_7_address0 { O 4 vector } x_local_2_1_7_ce0 { O 1 bit } x_local_2_1_7_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_1_7'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1217 \
    name x_local_2_1_8 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_1_8 \
    op interface \
    ports { x_local_2_1_8_address0 { O 4 vector } x_local_2_1_8_ce0 { O 1 bit } x_local_2_1_8_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_1_8'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1218 \
    name x_local_2_1_9 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_1_9 \
    op interface \
    ports { x_local_2_1_9_address0 { O 4 vector } x_local_2_1_9_ce0 { O 1 bit } x_local_2_1_9_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_1_9'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1219 \
    name x_local_2_1_10 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_1_10 \
    op interface \
    ports { x_local_2_1_10_address0 { O 4 vector } x_local_2_1_10_ce0 { O 1 bit } x_local_2_1_10_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_1_10'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1220 \
    name x_local_2_1_11 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_1_11 \
    op interface \
    ports { x_local_2_1_11_address0 { O 4 vector } x_local_2_1_11_ce0 { O 1 bit } x_local_2_1_11_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_1_11'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1221 \
    name x_local_2_1_12 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_1_12 \
    op interface \
    ports { x_local_2_1_12_address0 { O 4 vector } x_local_2_1_12_ce0 { O 1 bit } x_local_2_1_12_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_1_12'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1222 \
    name x_local_2_1_13 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_1_13 \
    op interface \
    ports { x_local_2_1_13_address0 { O 4 vector } x_local_2_1_13_ce0 { O 1 bit } x_local_2_1_13_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_1_13'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1223 \
    name x_local_2_1_14 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_1_14 \
    op interface \
    ports { x_local_2_1_14_address0 { O 4 vector } x_local_2_1_14_ce0 { O 1 bit } x_local_2_1_14_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_1_14'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1224 \
    name x_local_2_1_15 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_1_15 \
    op interface \
    ports { x_local_2_1_15_address0 { O 4 vector } x_local_2_1_15_ce0 { O 1 bit } x_local_2_1_15_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_1_15'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1225 \
    name x_local_2_2_0 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_2_0 \
    op interface \
    ports { x_local_2_2_0_address0 { O 4 vector } x_local_2_2_0_ce0 { O 1 bit } x_local_2_2_0_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_2_0'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1226 \
    name x_local_2_2_1 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_2_1 \
    op interface \
    ports { x_local_2_2_1_address0 { O 4 vector } x_local_2_2_1_ce0 { O 1 bit } x_local_2_2_1_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_2_1'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1227 \
    name x_local_2_2_2 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_2_2 \
    op interface \
    ports { x_local_2_2_2_address0 { O 4 vector } x_local_2_2_2_ce0 { O 1 bit } x_local_2_2_2_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_2_2'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1228 \
    name x_local_2_2_3 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_2_3 \
    op interface \
    ports { x_local_2_2_3_address0 { O 4 vector } x_local_2_2_3_ce0 { O 1 bit } x_local_2_2_3_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_2_3'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1229 \
    name x_local_2_2_4 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_2_4 \
    op interface \
    ports { x_local_2_2_4_address0 { O 4 vector } x_local_2_2_4_ce0 { O 1 bit } x_local_2_2_4_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_2_4'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1230 \
    name x_local_2_2_5 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_2_5 \
    op interface \
    ports { x_local_2_2_5_address0 { O 4 vector } x_local_2_2_5_ce0 { O 1 bit } x_local_2_2_5_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_2_5'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1231 \
    name x_local_2_2_6 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_2_6 \
    op interface \
    ports { x_local_2_2_6_address0 { O 4 vector } x_local_2_2_6_ce0 { O 1 bit } x_local_2_2_6_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_2_6'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1232 \
    name x_local_2_2_7 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_2_7 \
    op interface \
    ports { x_local_2_2_7_address0 { O 4 vector } x_local_2_2_7_ce0 { O 1 bit } x_local_2_2_7_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_2_7'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1233 \
    name x_local_2_2_8 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_2_8 \
    op interface \
    ports { x_local_2_2_8_address0 { O 4 vector } x_local_2_2_8_ce0 { O 1 bit } x_local_2_2_8_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_2_8'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1234 \
    name x_local_2_2_9 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_2_9 \
    op interface \
    ports { x_local_2_2_9_address0 { O 4 vector } x_local_2_2_9_ce0 { O 1 bit } x_local_2_2_9_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_2_9'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1235 \
    name x_local_2_2_10 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_2_10 \
    op interface \
    ports { x_local_2_2_10_address0 { O 4 vector } x_local_2_2_10_ce0 { O 1 bit } x_local_2_2_10_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_2_10'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1236 \
    name x_local_2_2_11 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_2_11 \
    op interface \
    ports { x_local_2_2_11_address0 { O 4 vector } x_local_2_2_11_ce0 { O 1 bit } x_local_2_2_11_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_2_11'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1237 \
    name x_local_2_2_12 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_2_12 \
    op interface \
    ports { x_local_2_2_12_address0 { O 4 vector } x_local_2_2_12_ce0 { O 1 bit } x_local_2_2_12_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_2_12'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1238 \
    name x_local_2_2_13 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_2_13 \
    op interface \
    ports { x_local_2_2_13_address0 { O 4 vector } x_local_2_2_13_ce0 { O 1 bit } x_local_2_2_13_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_2_13'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1239 \
    name x_local_2_2_14 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_2_14 \
    op interface \
    ports { x_local_2_2_14_address0 { O 4 vector } x_local_2_2_14_ce0 { O 1 bit } x_local_2_2_14_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_2_14'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1240 \
    name x_local_2_2_15 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_2_15 \
    op interface \
    ports { x_local_2_2_15_address0 { O 4 vector } x_local_2_2_15_ce0 { O 1 bit } x_local_2_2_15_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_2_15'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1241 \
    name x_local_2_3_0 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_3_0 \
    op interface \
    ports { x_local_2_3_0_address0 { O 4 vector } x_local_2_3_0_ce0 { O 1 bit } x_local_2_3_0_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_3_0'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1242 \
    name x_local_2_3_1 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_3_1 \
    op interface \
    ports { x_local_2_3_1_address0 { O 4 vector } x_local_2_3_1_ce0 { O 1 bit } x_local_2_3_1_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_3_1'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1243 \
    name x_local_2_3_2 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_3_2 \
    op interface \
    ports { x_local_2_3_2_address0 { O 4 vector } x_local_2_3_2_ce0 { O 1 bit } x_local_2_3_2_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_3_2'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1244 \
    name x_local_2_3_3 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_3_3 \
    op interface \
    ports { x_local_2_3_3_address0 { O 4 vector } x_local_2_3_3_ce0 { O 1 bit } x_local_2_3_3_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_3_3'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1245 \
    name x_local_2_3_4 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_3_4 \
    op interface \
    ports { x_local_2_3_4_address0 { O 4 vector } x_local_2_3_4_ce0 { O 1 bit } x_local_2_3_4_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_3_4'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1246 \
    name x_local_2_3_5 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_3_5 \
    op interface \
    ports { x_local_2_3_5_address0 { O 4 vector } x_local_2_3_5_ce0 { O 1 bit } x_local_2_3_5_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_3_5'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1247 \
    name x_local_2_3_6 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_3_6 \
    op interface \
    ports { x_local_2_3_6_address0 { O 4 vector } x_local_2_3_6_ce0 { O 1 bit } x_local_2_3_6_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_3_6'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1248 \
    name x_local_2_3_7 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_3_7 \
    op interface \
    ports { x_local_2_3_7_address0 { O 4 vector } x_local_2_3_7_ce0 { O 1 bit } x_local_2_3_7_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_3_7'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1249 \
    name x_local_2_3_8 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_3_8 \
    op interface \
    ports { x_local_2_3_8_address0 { O 4 vector } x_local_2_3_8_ce0 { O 1 bit } x_local_2_3_8_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_3_8'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1250 \
    name x_local_2_3_9 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_3_9 \
    op interface \
    ports { x_local_2_3_9_address0 { O 4 vector } x_local_2_3_9_ce0 { O 1 bit } x_local_2_3_9_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_3_9'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1251 \
    name x_local_2_3_10 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_3_10 \
    op interface \
    ports { x_local_2_3_10_address0 { O 4 vector } x_local_2_3_10_ce0 { O 1 bit } x_local_2_3_10_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_3_10'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1252 \
    name x_local_2_3_11 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_3_11 \
    op interface \
    ports { x_local_2_3_11_address0 { O 4 vector } x_local_2_3_11_ce0 { O 1 bit } x_local_2_3_11_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_3_11'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1253 \
    name x_local_2_3_12 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_3_12 \
    op interface \
    ports { x_local_2_3_12_address0 { O 4 vector } x_local_2_3_12_ce0 { O 1 bit } x_local_2_3_12_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_3_12'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1254 \
    name x_local_2_3_13 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_3_13 \
    op interface \
    ports { x_local_2_3_13_address0 { O 4 vector } x_local_2_3_13_ce0 { O 1 bit } x_local_2_3_13_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_3_13'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1255 \
    name x_local_2_3_14 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_3_14 \
    op interface \
    ports { x_local_2_3_14_address0 { O 4 vector } x_local_2_3_14_ce0 { O 1 bit } x_local_2_3_14_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_3_14'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1256 \
    name x_local_2_3_15 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_3_15 \
    op interface \
    ports { x_local_2_3_15_address0 { O 4 vector } x_local_2_3_15_ce0 { O 1 bit } x_local_2_3_15_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_3_15'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1257 \
    name x_local_2_4_0 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_4_0 \
    op interface \
    ports { x_local_2_4_0_address0 { O 4 vector } x_local_2_4_0_ce0 { O 1 bit } x_local_2_4_0_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_4_0'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1258 \
    name x_local_2_4_1 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_4_1 \
    op interface \
    ports { x_local_2_4_1_address0 { O 4 vector } x_local_2_4_1_ce0 { O 1 bit } x_local_2_4_1_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_4_1'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1259 \
    name x_local_2_4_2 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_4_2 \
    op interface \
    ports { x_local_2_4_2_address0 { O 4 vector } x_local_2_4_2_ce0 { O 1 bit } x_local_2_4_2_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_4_2'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1260 \
    name x_local_2_4_3 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_4_3 \
    op interface \
    ports { x_local_2_4_3_address0 { O 4 vector } x_local_2_4_3_ce0 { O 1 bit } x_local_2_4_3_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_4_3'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1261 \
    name x_local_2_4_4 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_4_4 \
    op interface \
    ports { x_local_2_4_4_address0 { O 4 vector } x_local_2_4_4_ce0 { O 1 bit } x_local_2_4_4_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_4_4'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1262 \
    name x_local_2_4_5 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_4_5 \
    op interface \
    ports { x_local_2_4_5_address0 { O 4 vector } x_local_2_4_5_ce0 { O 1 bit } x_local_2_4_5_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_4_5'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1263 \
    name x_local_2_4_6 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_4_6 \
    op interface \
    ports { x_local_2_4_6_address0 { O 4 vector } x_local_2_4_6_ce0 { O 1 bit } x_local_2_4_6_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_4_6'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1264 \
    name x_local_2_4_7 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_4_7 \
    op interface \
    ports { x_local_2_4_7_address0 { O 4 vector } x_local_2_4_7_ce0 { O 1 bit } x_local_2_4_7_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_4_7'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1265 \
    name x_local_2_4_8 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_4_8 \
    op interface \
    ports { x_local_2_4_8_address0 { O 4 vector } x_local_2_4_8_ce0 { O 1 bit } x_local_2_4_8_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_4_8'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1266 \
    name x_local_2_4_9 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_4_9 \
    op interface \
    ports { x_local_2_4_9_address0 { O 4 vector } x_local_2_4_9_ce0 { O 1 bit } x_local_2_4_9_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_4_9'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1267 \
    name x_local_2_4_10 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_4_10 \
    op interface \
    ports { x_local_2_4_10_address0 { O 4 vector } x_local_2_4_10_ce0 { O 1 bit } x_local_2_4_10_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_4_10'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1268 \
    name x_local_2_4_11 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_4_11 \
    op interface \
    ports { x_local_2_4_11_address0 { O 4 vector } x_local_2_4_11_ce0 { O 1 bit } x_local_2_4_11_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_4_11'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1269 \
    name x_local_2_4_12 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_4_12 \
    op interface \
    ports { x_local_2_4_12_address0 { O 4 vector } x_local_2_4_12_ce0 { O 1 bit } x_local_2_4_12_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_4_12'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1270 \
    name x_local_2_4_13 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_4_13 \
    op interface \
    ports { x_local_2_4_13_address0 { O 4 vector } x_local_2_4_13_ce0 { O 1 bit } x_local_2_4_13_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_4_13'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1271 \
    name x_local_2_4_14 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_4_14 \
    op interface \
    ports { x_local_2_4_14_address0 { O 4 vector } x_local_2_4_14_ce0 { O 1 bit } x_local_2_4_14_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_4_14'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1272 \
    name x_local_2_4_15 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_4_15 \
    op interface \
    ports { x_local_2_4_15_address0 { O 4 vector } x_local_2_4_15_ce0 { O 1 bit } x_local_2_4_15_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_4_15'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1273 \
    name x_local_2_5_0 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_5_0 \
    op interface \
    ports { x_local_2_5_0_address0 { O 4 vector } x_local_2_5_0_ce0 { O 1 bit } x_local_2_5_0_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_5_0'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1274 \
    name x_local_2_5_1 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_5_1 \
    op interface \
    ports { x_local_2_5_1_address0 { O 4 vector } x_local_2_5_1_ce0 { O 1 bit } x_local_2_5_1_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_5_1'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1275 \
    name x_local_2_5_2 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_5_2 \
    op interface \
    ports { x_local_2_5_2_address0 { O 4 vector } x_local_2_5_2_ce0 { O 1 bit } x_local_2_5_2_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_5_2'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1276 \
    name x_local_2_5_3 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_5_3 \
    op interface \
    ports { x_local_2_5_3_address0 { O 4 vector } x_local_2_5_3_ce0 { O 1 bit } x_local_2_5_3_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_5_3'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1277 \
    name x_local_2_5_4 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_5_4 \
    op interface \
    ports { x_local_2_5_4_address0 { O 4 vector } x_local_2_5_4_ce0 { O 1 bit } x_local_2_5_4_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_5_4'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1278 \
    name x_local_2_5_5 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_5_5 \
    op interface \
    ports { x_local_2_5_5_address0 { O 4 vector } x_local_2_5_5_ce0 { O 1 bit } x_local_2_5_5_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_5_5'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1279 \
    name x_local_2_5_6 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_5_6 \
    op interface \
    ports { x_local_2_5_6_address0 { O 4 vector } x_local_2_5_6_ce0 { O 1 bit } x_local_2_5_6_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_5_6'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1280 \
    name x_local_2_5_7 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_5_7 \
    op interface \
    ports { x_local_2_5_7_address0 { O 4 vector } x_local_2_5_7_ce0 { O 1 bit } x_local_2_5_7_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_5_7'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1281 \
    name x_local_2_5_8 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_5_8 \
    op interface \
    ports { x_local_2_5_8_address0 { O 4 vector } x_local_2_5_8_ce0 { O 1 bit } x_local_2_5_8_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_5_8'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1282 \
    name x_local_2_5_9 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_5_9 \
    op interface \
    ports { x_local_2_5_9_address0 { O 4 vector } x_local_2_5_9_ce0 { O 1 bit } x_local_2_5_9_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_5_9'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1283 \
    name x_local_2_5_10 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_5_10 \
    op interface \
    ports { x_local_2_5_10_address0 { O 4 vector } x_local_2_5_10_ce0 { O 1 bit } x_local_2_5_10_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_5_10'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1284 \
    name x_local_2_5_11 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_5_11 \
    op interface \
    ports { x_local_2_5_11_address0 { O 4 vector } x_local_2_5_11_ce0 { O 1 bit } x_local_2_5_11_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_5_11'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1285 \
    name x_local_2_5_12 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_5_12 \
    op interface \
    ports { x_local_2_5_12_address0 { O 4 vector } x_local_2_5_12_ce0 { O 1 bit } x_local_2_5_12_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_5_12'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1286 \
    name x_local_2_5_13 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_5_13 \
    op interface \
    ports { x_local_2_5_13_address0 { O 4 vector } x_local_2_5_13_ce0 { O 1 bit } x_local_2_5_13_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_5_13'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1287 \
    name x_local_2_5_14 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_5_14 \
    op interface \
    ports { x_local_2_5_14_address0 { O 4 vector } x_local_2_5_14_ce0 { O 1 bit } x_local_2_5_14_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_5_14'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1288 \
    name x_local_2_5_15 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_5_15 \
    op interface \
    ports { x_local_2_5_15_address0 { O 4 vector } x_local_2_5_15_ce0 { O 1 bit } x_local_2_5_15_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_5_15'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1289 \
    name x_local_2_6_0 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_6_0 \
    op interface \
    ports { x_local_2_6_0_address0 { O 4 vector } x_local_2_6_0_ce0 { O 1 bit } x_local_2_6_0_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_6_0'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1290 \
    name x_local_2_6_1 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_6_1 \
    op interface \
    ports { x_local_2_6_1_address0 { O 4 vector } x_local_2_6_1_ce0 { O 1 bit } x_local_2_6_1_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_6_1'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1291 \
    name x_local_2_6_2 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_6_2 \
    op interface \
    ports { x_local_2_6_2_address0 { O 4 vector } x_local_2_6_2_ce0 { O 1 bit } x_local_2_6_2_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_6_2'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1292 \
    name x_local_2_6_3 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_6_3 \
    op interface \
    ports { x_local_2_6_3_address0 { O 4 vector } x_local_2_6_3_ce0 { O 1 bit } x_local_2_6_3_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_6_3'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1293 \
    name x_local_2_6_4 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_6_4 \
    op interface \
    ports { x_local_2_6_4_address0 { O 4 vector } x_local_2_6_4_ce0 { O 1 bit } x_local_2_6_4_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_6_4'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1294 \
    name x_local_2_6_5 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_6_5 \
    op interface \
    ports { x_local_2_6_5_address0 { O 4 vector } x_local_2_6_5_ce0 { O 1 bit } x_local_2_6_5_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_6_5'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1295 \
    name x_local_2_6_6 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_6_6 \
    op interface \
    ports { x_local_2_6_6_address0 { O 4 vector } x_local_2_6_6_ce0 { O 1 bit } x_local_2_6_6_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_6_6'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1296 \
    name x_local_2_6_7 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_6_7 \
    op interface \
    ports { x_local_2_6_7_address0 { O 4 vector } x_local_2_6_7_ce0 { O 1 bit } x_local_2_6_7_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_6_7'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1297 \
    name x_local_2_6_8 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_6_8 \
    op interface \
    ports { x_local_2_6_8_address0 { O 4 vector } x_local_2_6_8_ce0 { O 1 bit } x_local_2_6_8_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_6_8'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1298 \
    name x_local_2_6_9 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_6_9 \
    op interface \
    ports { x_local_2_6_9_address0 { O 4 vector } x_local_2_6_9_ce0 { O 1 bit } x_local_2_6_9_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_6_9'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1299 \
    name x_local_2_6_10 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_6_10 \
    op interface \
    ports { x_local_2_6_10_address0 { O 4 vector } x_local_2_6_10_ce0 { O 1 bit } x_local_2_6_10_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_6_10'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1300 \
    name x_local_2_6_11 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_6_11 \
    op interface \
    ports { x_local_2_6_11_address0 { O 4 vector } x_local_2_6_11_ce0 { O 1 bit } x_local_2_6_11_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_6_11'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1301 \
    name x_local_2_6_12 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_6_12 \
    op interface \
    ports { x_local_2_6_12_address0 { O 4 vector } x_local_2_6_12_ce0 { O 1 bit } x_local_2_6_12_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_6_12'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1302 \
    name x_local_2_6_13 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_6_13 \
    op interface \
    ports { x_local_2_6_13_address0 { O 4 vector } x_local_2_6_13_ce0 { O 1 bit } x_local_2_6_13_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_6_13'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1303 \
    name x_local_2_6_14 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_6_14 \
    op interface \
    ports { x_local_2_6_14_address0 { O 4 vector } x_local_2_6_14_ce0 { O 1 bit } x_local_2_6_14_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_6_14'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1304 \
    name x_local_2_6_15 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_6_15 \
    op interface \
    ports { x_local_2_6_15_address0 { O 4 vector } x_local_2_6_15_ce0 { O 1 bit } x_local_2_6_15_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_6_15'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1305 \
    name x_local_2_7_0 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_7_0 \
    op interface \
    ports { x_local_2_7_0_address0 { O 4 vector } x_local_2_7_0_ce0 { O 1 bit } x_local_2_7_0_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_7_0'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1306 \
    name x_local_2_7_1 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_7_1 \
    op interface \
    ports { x_local_2_7_1_address0 { O 4 vector } x_local_2_7_1_ce0 { O 1 bit } x_local_2_7_1_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_7_1'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1307 \
    name x_local_2_7_2 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_7_2 \
    op interface \
    ports { x_local_2_7_2_address0 { O 4 vector } x_local_2_7_2_ce0 { O 1 bit } x_local_2_7_2_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_7_2'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1308 \
    name x_local_2_7_3 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_7_3 \
    op interface \
    ports { x_local_2_7_3_address0 { O 4 vector } x_local_2_7_3_ce0 { O 1 bit } x_local_2_7_3_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_7_3'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1309 \
    name x_local_2_7_4 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_7_4 \
    op interface \
    ports { x_local_2_7_4_address0 { O 4 vector } x_local_2_7_4_ce0 { O 1 bit } x_local_2_7_4_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_7_4'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1310 \
    name x_local_2_7_5 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_7_5 \
    op interface \
    ports { x_local_2_7_5_address0 { O 4 vector } x_local_2_7_5_ce0 { O 1 bit } x_local_2_7_5_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_7_5'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1311 \
    name x_local_2_7_6 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_7_6 \
    op interface \
    ports { x_local_2_7_6_address0 { O 4 vector } x_local_2_7_6_ce0 { O 1 bit } x_local_2_7_6_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_7_6'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1312 \
    name x_local_2_7_7 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_7_7 \
    op interface \
    ports { x_local_2_7_7_address0 { O 4 vector } x_local_2_7_7_ce0 { O 1 bit } x_local_2_7_7_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_7_7'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1313 \
    name x_local_2_7_8 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_7_8 \
    op interface \
    ports { x_local_2_7_8_address0 { O 4 vector } x_local_2_7_8_ce0 { O 1 bit } x_local_2_7_8_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_7_8'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1314 \
    name x_local_2_7_9 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_7_9 \
    op interface \
    ports { x_local_2_7_9_address0 { O 4 vector } x_local_2_7_9_ce0 { O 1 bit } x_local_2_7_9_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_7_9'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1315 \
    name x_local_2_7_10 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_7_10 \
    op interface \
    ports { x_local_2_7_10_address0 { O 4 vector } x_local_2_7_10_ce0 { O 1 bit } x_local_2_7_10_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_7_10'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1316 \
    name x_local_2_7_11 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_7_11 \
    op interface \
    ports { x_local_2_7_11_address0 { O 4 vector } x_local_2_7_11_ce0 { O 1 bit } x_local_2_7_11_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_7_11'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1317 \
    name x_local_2_7_12 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_7_12 \
    op interface \
    ports { x_local_2_7_12_address0 { O 4 vector } x_local_2_7_12_ce0 { O 1 bit } x_local_2_7_12_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_7_12'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1318 \
    name x_local_2_7_13 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_7_13 \
    op interface \
    ports { x_local_2_7_13_address0 { O 4 vector } x_local_2_7_13_ce0 { O 1 bit } x_local_2_7_13_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_7_13'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1319 \
    name x_local_2_7_14 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_7_14 \
    op interface \
    ports { x_local_2_7_14_address0 { O 4 vector } x_local_2_7_14_ce0 { O 1 bit } x_local_2_7_14_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_7_14'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1320 \
    name x_local_2_7_15 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename x_local_2_7_15 \
    op interface \
    ports { x_local_2_7_15_address0 { O 4 vector } x_local_2_7_15_ce0 { O 1 bit } x_local_2_7_15_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_local_2_7_15'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1322 \
    name X2_cache \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename X2_cache \
    op interface \
    ports { X2_cache_address1 { O 13 vector } X2_cache_ce1 { O 1 bit } X2_cache_we1 { O 1 bit } X2_cache_d1 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'X2_cache'"
}
}


# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1191 \
    name gmem_V \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_gmem_V \
    op interface \
    ports { m_axi_gmem_V_0_AWVALID { O 1 bit } m_axi_gmem_V_0_AWREADY { I 1 bit } m_axi_gmem_V_0_AWADDR { O 64 vector } m_axi_gmem_V_0_AWID { O 1 vector } m_axi_gmem_V_0_AWLEN { O 32 vector } m_axi_gmem_V_0_AWSIZE { O 3 vector } m_axi_gmem_V_0_AWBURST { O 2 vector } m_axi_gmem_V_0_AWLOCK { O 2 vector } m_axi_gmem_V_0_AWCACHE { O 4 vector } m_axi_gmem_V_0_AWPROT { O 3 vector } m_axi_gmem_V_0_AWQOS { O 4 vector } m_axi_gmem_V_0_AWREGION { O 4 vector } m_axi_gmem_V_0_AWUSER { O 1 vector } m_axi_gmem_V_0_WVALID { O 1 bit } m_axi_gmem_V_0_WREADY { I 1 bit } m_axi_gmem_V_0_WDATA { O 128 vector } m_axi_gmem_V_0_WSTRB { O 16 vector } m_axi_gmem_V_0_WLAST { O 1 bit } m_axi_gmem_V_0_WID { O 1 vector } m_axi_gmem_V_0_WUSER { O 1 vector } m_axi_gmem_V_0_ARVALID { O 1 bit } m_axi_gmem_V_0_ARREADY { I 1 bit } m_axi_gmem_V_0_ARADDR { O 64 vector } m_axi_gmem_V_0_ARID { O 1 vector } m_axi_gmem_V_0_ARLEN { O 32 vector } m_axi_gmem_V_0_ARSIZE { O 3 vector } m_axi_gmem_V_0_ARBURST { O 2 vector } m_axi_gmem_V_0_ARLOCK { O 2 vector } m_axi_gmem_V_0_ARCACHE { O 4 vector } m_axi_gmem_V_0_ARPROT { O 3 vector } m_axi_gmem_V_0_ARQOS { O 4 vector } m_axi_gmem_V_0_ARREGION { O 4 vector } m_axi_gmem_V_0_ARUSER { O 1 vector } m_axi_gmem_V_0_RVALID { I 1 bit } m_axi_gmem_V_0_RREADY { O 1 bit } m_axi_gmem_V_0_RDATA { I 128 vector } m_axi_gmem_V_0_RLAST { I 1 bit } m_axi_gmem_V_0_RID { I 1 vector } m_axi_gmem_V_0_RFIFONUM { I 13 vector } m_axi_gmem_V_0_RUSER { I 1 vector } m_axi_gmem_V_0_RRESP { I 2 vector } m_axi_gmem_V_0_BVALID { I 1 bit } m_axi_gmem_V_0_BREADY { O 1 bit } m_axi_gmem_V_0_BRESP { I 2 vector } m_axi_gmem_V_0_BID { I 1 vector } m_axi_gmem_V_0_BUSER { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1192 \
    name V \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_V \
    op interface \
    ports { V { I 64 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1321 \
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


