# This script segment is generated automatically by AutoPilot

set name swiglu_faddfsub_32ns_32ns_32_10_full_dsp_1
if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $name BINDTYPE {op} TYPE {fsub} IMPL {fulldsp} LATENCY 9 ALLOW_PRAGMA 1
}


set name swiglu_fadd_32ns_32ns_32_10_full_dsp_1
if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $name BINDTYPE {op} TYPE {fadd} IMPL {fulldsp} LATENCY 9 ALLOW_PRAGMA 1
}


set name swiglu_fmul_32ns_32ns_32_6_max_dsp_1
if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $name BINDTYPE {op} TYPE {fmul} IMPL {maxdsp} LATENCY 5 ALLOW_PRAGMA 1
}


set name swiglu_sitofp_32ns_32_7_no_dsp_1
if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $name BINDTYPE {op} TYPE {sitofp} IMPL {auto} LATENCY 6 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler swiglu_sparsemux_9_3_32_1_1_x BINDTYPE {op} TYPE {sparsemux} IMPL {compactencoding_dontcare}
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
    id 1756 \
    name results \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename results \
    op interface \
    ports { results_address0 { O 1 vector } results_ce0 { O 1 bit } results_we0 { O 1 bit } results_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'results'"
}
}


# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1467 \
    name int_acc_w_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_w_load_reload \
    op interface \
    ports { int_acc_w_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1468 \
    name int_acc_w_16_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_w_16_load_reload \
    op interface \
    ports { int_acc_w_16_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1469 \
    name int_acc_w_32_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_w_32_load_reload \
    op interface \
    ports { int_acc_w_32_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1470 \
    name int_acc_w_48_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_w_48_load_reload \
    op interface \
    ports { int_acc_w_48_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1471 \
    name int_acc_w_64_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_w_64_load_reload \
    op interface \
    ports { int_acc_w_64_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1472 \
    name int_acc_w_80_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_w_80_load_reload \
    op interface \
    ports { int_acc_w_80_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1473 \
    name int_acc_w_96_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_w_96_load_reload \
    op interface \
    ports { int_acc_w_96_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1474 \
    name int_acc_w_112_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_w_112_load_reload \
    op interface \
    ports { int_acc_w_112_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1475 \
    name int_acc_m_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_m_load_reload \
    op interface \
    ports { int_acc_m_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1476 \
    name int_acc_m_16_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_m_16_load_reload \
    op interface \
    ports { int_acc_m_16_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1477 \
    name int_acc_m_32_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_m_32_load_reload \
    op interface \
    ports { int_acc_m_32_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1478 \
    name int_acc_m_48_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_m_48_load_reload \
    op interface \
    ports { int_acc_m_48_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1479 \
    name int_acc_m_64_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_m_64_load_reload \
    op interface \
    ports { int_acc_m_64_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1480 \
    name int_acc_m_80_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_m_80_load_reload \
    op interface \
    ports { int_acc_m_80_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1481 \
    name int_acc_m_96_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_m_96_load_reload \
    op interface \
    ports { int_acc_m_96_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1482 \
    name int_acc_m_112_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_m_112_load_reload \
    op interface \
    ports { int_acc_m_112_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1483 \
    name int_acc_w_1_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_w_1_load_reload \
    op interface \
    ports { int_acc_w_1_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1484 \
    name int_acc_w_17_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_w_17_load_reload \
    op interface \
    ports { int_acc_w_17_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1485 \
    name int_acc_w_33_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_w_33_load_reload \
    op interface \
    ports { int_acc_w_33_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1486 \
    name int_acc_w_49_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_w_49_load_reload \
    op interface \
    ports { int_acc_w_49_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1487 \
    name int_acc_w_65_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_w_65_load_reload \
    op interface \
    ports { int_acc_w_65_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1488 \
    name int_acc_w_81_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_w_81_load_reload \
    op interface \
    ports { int_acc_w_81_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1489 \
    name int_acc_w_97_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_w_97_load_reload \
    op interface \
    ports { int_acc_w_97_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1490 \
    name int_acc_w_113_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_w_113_load_reload \
    op interface \
    ports { int_acc_w_113_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1491 \
    name int_acc_m_1_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_m_1_load_reload \
    op interface \
    ports { int_acc_m_1_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1492 \
    name int_acc_m_17_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_m_17_load_reload \
    op interface \
    ports { int_acc_m_17_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1493 \
    name int_acc_m_33_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_m_33_load_reload \
    op interface \
    ports { int_acc_m_33_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1494 \
    name int_acc_m_49_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_m_49_load_reload \
    op interface \
    ports { int_acc_m_49_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1495 \
    name int_acc_m_65_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_m_65_load_reload \
    op interface \
    ports { int_acc_m_65_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1496 \
    name int_acc_m_81_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_m_81_load_reload \
    op interface \
    ports { int_acc_m_81_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1497 \
    name int_acc_m_97_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_m_97_load_reload \
    op interface \
    ports { int_acc_m_97_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1498 \
    name int_acc_m_113_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_m_113_load_reload \
    op interface \
    ports { int_acc_m_113_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1499 \
    name int_acc_w_2_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_w_2_load_reload \
    op interface \
    ports { int_acc_w_2_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1500 \
    name int_acc_w_18_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_w_18_load_reload \
    op interface \
    ports { int_acc_w_18_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1501 \
    name int_acc_w_34_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_w_34_load_reload \
    op interface \
    ports { int_acc_w_34_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1502 \
    name int_acc_w_50_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_w_50_load_reload \
    op interface \
    ports { int_acc_w_50_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1503 \
    name int_acc_w_66_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_w_66_load_reload \
    op interface \
    ports { int_acc_w_66_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1504 \
    name int_acc_w_82_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_w_82_load_reload \
    op interface \
    ports { int_acc_w_82_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1505 \
    name int_acc_w_98_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_w_98_load_reload \
    op interface \
    ports { int_acc_w_98_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1506 \
    name int_acc_w_114_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_w_114_load_reload \
    op interface \
    ports { int_acc_w_114_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1507 \
    name int_acc_m_2_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_m_2_load_reload \
    op interface \
    ports { int_acc_m_2_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1508 \
    name int_acc_m_18_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_m_18_load_reload \
    op interface \
    ports { int_acc_m_18_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1509 \
    name int_acc_m_34_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_m_34_load_reload \
    op interface \
    ports { int_acc_m_34_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1510 \
    name int_acc_m_50_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_m_50_load_reload \
    op interface \
    ports { int_acc_m_50_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1511 \
    name int_acc_m_66_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_m_66_load_reload \
    op interface \
    ports { int_acc_m_66_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1512 \
    name int_acc_m_82_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_m_82_load_reload \
    op interface \
    ports { int_acc_m_82_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1513 \
    name int_acc_m_98_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_m_98_load_reload \
    op interface \
    ports { int_acc_m_98_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1514 \
    name int_acc_m_114_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_m_114_load_reload \
    op interface \
    ports { int_acc_m_114_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1515 \
    name int_acc_w_3_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_w_3_load_reload \
    op interface \
    ports { int_acc_w_3_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1516 \
    name int_acc_w_19_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_w_19_load_reload \
    op interface \
    ports { int_acc_w_19_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1517 \
    name int_acc_w_35_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_w_35_load_reload \
    op interface \
    ports { int_acc_w_35_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1518 \
    name int_acc_w_51_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_w_51_load_reload \
    op interface \
    ports { int_acc_w_51_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1519 \
    name int_acc_w_67_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_w_67_load_reload \
    op interface \
    ports { int_acc_w_67_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1520 \
    name int_acc_w_83_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_w_83_load_reload \
    op interface \
    ports { int_acc_w_83_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1521 \
    name int_acc_w_99_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_w_99_load_reload \
    op interface \
    ports { int_acc_w_99_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1522 \
    name int_acc_w_115_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_w_115_load_reload \
    op interface \
    ports { int_acc_w_115_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1523 \
    name int_acc_m_3_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_m_3_load_reload \
    op interface \
    ports { int_acc_m_3_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1524 \
    name int_acc_m_19_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_m_19_load_reload \
    op interface \
    ports { int_acc_m_19_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1525 \
    name int_acc_m_35_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_m_35_load_reload \
    op interface \
    ports { int_acc_m_35_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1526 \
    name int_acc_m_51_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_m_51_load_reload \
    op interface \
    ports { int_acc_m_51_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1527 \
    name int_acc_m_67_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_m_67_load_reload \
    op interface \
    ports { int_acc_m_67_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1528 \
    name int_acc_m_83_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_m_83_load_reload \
    op interface \
    ports { int_acc_m_83_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1529 \
    name int_acc_m_99_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_m_99_load_reload \
    op interface \
    ports { int_acc_m_99_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1530 \
    name int_acc_m_115_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_m_115_load_reload \
    op interface \
    ports { int_acc_m_115_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1531 \
    name int_acc_w_4_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_w_4_load_reload \
    op interface \
    ports { int_acc_w_4_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1532 \
    name int_acc_w_20_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_w_20_load_reload \
    op interface \
    ports { int_acc_w_20_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1533 \
    name int_acc_w_36_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_w_36_load_reload \
    op interface \
    ports { int_acc_w_36_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1534 \
    name int_acc_w_52_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_w_52_load_reload \
    op interface \
    ports { int_acc_w_52_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1535 \
    name int_acc_w_68_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_w_68_load_reload \
    op interface \
    ports { int_acc_w_68_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1536 \
    name int_acc_w_84_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_w_84_load_reload \
    op interface \
    ports { int_acc_w_84_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1537 \
    name int_acc_w_100_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_w_100_load_reload \
    op interface \
    ports { int_acc_w_100_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1538 \
    name int_acc_w_116_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_w_116_load_reload \
    op interface \
    ports { int_acc_w_116_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1539 \
    name int_acc_m_4_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_m_4_load_reload \
    op interface \
    ports { int_acc_m_4_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1540 \
    name int_acc_m_20_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_m_20_load_reload \
    op interface \
    ports { int_acc_m_20_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1541 \
    name int_acc_m_36_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_m_36_load_reload \
    op interface \
    ports { int_acc_m_36_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1542 \
    name int_acc_m_52_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_m_52_load_reload \
    op interface \
    ports { int_acc_m_52_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1543 \
    name int_acc_m_68_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_m_68_load_reload \
    op interface \
    ports { int_acc_m_68_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1544 \
    name int_acc_m_84_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_m_84_load_reload \
    op interface \
    ports { int_acc_m_84_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1545 \
    name int_acc_m_100_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_m_100_load_reload \
    op interface \
    ports { int_acc_m_100_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1546 \
    name int_acc_m_116_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_m_116_load_reload \
    op interface \
    ports { int_acc_m_116_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1547 \
    name int_acc_w_5_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_w_5_load_reload \
    op interface \
    ports { int_acc_w_5_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1548 \
    name int_acc_w_21_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_w_21_load_reload \
    op interface \
    ports { int_acc_w_21_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1549 \
    name int_acc_w_37_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_w_37_load_reload \
    op interface \
    ports { int_acc_w_37_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1550 \
    name int_acc_w_53_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_w_53_load_reload \
    op interface \
    ports { int_acc_w_53_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1551 \
    name int_acc_w_69_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_w_69_load_reload \
    op interface \
    ports { int_acc_w_69_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1552 \
    name int_acc_w_85_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_w_85_load_reload \
    op interface \
    ports { int_acc_w_85_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1553 \
    name int_acc_w_101_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_w_101_load_reload \
    op interface \
    ports { int_acc_w_101_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1554 \
    name int_acc_w_117_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_w_117_load_reload \
    op interface \
    ports { int_acc_w_117_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1555 \
    name int_acc_m_5_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_m_5_load_reload \
    op interface \
    ports { int_acc_m_5_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1556 \
    name int_acc_m_21_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_m_21_load_reload \
    op interface \
    ports { int_acc_m_21_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1557 \
    name int_acc_m_37_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_m_37_load_reload \
    op interface \
    ports { int_acc_m_37_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1558 \
    name int_acc_m_53_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_m_53_load_reload \
    op interface \
    ports { int_acc_m_53_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1559 \
    name int_acc_m_69_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_m_69_load_reload \
    op interface \
    ports { int_acc_m_69_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1560 \
    name int_acc_m_85_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_m_85_load_reload \
    op interface \
    ports { int_acc_m_85_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1561 \
    name int_acc_m_101_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_m_101_load_reload \
    op interface \
    ports { int_acc_m_101_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1562 \
    name int_acc_m_117_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_m_117_load_reload \
    op interface \
    ports { int_acc_m_117_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1563 \
    name int_acc_w_6_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_w_6_load_reload \
    op interface \
    ports { int_acc_w_6_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1564 \
    name int_acc_w_22_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_w_22_load_reload \
    op interface \
    ports { int_acc_w_22_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1565 \
    name int_acc_w_38_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_w_38_load_reload \
    op interface \
    ports { int_acc_w_38_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1566 \
    name int_acc_w_54_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_w_54_load_reload \
    op interface \
    ports { int_acc_w_54_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1567 \
    name int_acc_w_70_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_w_70_load_reload \
    op interface \
    ports { int_acc_w_70_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1568 \
    name int_acc_w_86_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_w_86_load_reload \
    op interface \
    ports { int_acc_w_86_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1569 \
    name int_acc_w_102_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_w_102_load_reload \
    op interface \
    ports { int_acc_w_102_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1570 \
    name int_acc_w_118_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_w_118_load_reload \
    op interface \
    ports { int_acc_w_118_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1571 \
    name int_acc_m_6_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_m_6_load_reload \
    op interface \
    ports { int_acc_m_6_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1572 \
    name int_acc_m_22_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_m_22_load_reload \
    op interface \
    ports { int_acc_m_22_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1573 \
    name int_acc_m_38_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_m_38_load_reload \
    op interface \
    ports { int_acc_m_38_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1574 \
    name int_acc_m_54_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_m_54_load_reload \
    op interface \
    ports { int_acc_m_54_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1575 \
    name int_acc_m_70_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_m_70_load_reload \
    op interface \
    ports { int_acc_m_70_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1576 \
    name int_acc_m_86_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_m_86_load_reload \
    op interface \
    ports { int_acc_m_86_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1577 \
    name int_acc_m_102_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_m_102_load_reload \
    op interface \
    ports { int_acc_m_102_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1578 \
    name int_acc_m_118_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_m_118_load_reload \
    op interface \
    ports { int_acc_m_118_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1579 \
    name int_acc_w_7_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_w_7_load_reload \
    op interface \
    ports { int_acc_w_7_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1580 \
    name int_acc_w_23_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_w_23_load_reload \
    op interface \
    ports { int_acc_w_23_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1581 \
    name int_acc_w_39_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_w_39_load_reload \
    op interface \
    ports { int_acc_w_39_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1582 \
    name int_acc_w_55_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_w_55_load_reload \
    op interface \
    ports { int_acc_w_55_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1583 \
    name int_acc_w_71_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_w_71_load_reload \
    op interface \
    ports { int_acc_w_71_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1584 \
    name int_acc_w_87_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_w_87_load_reload \
    op interface \
    ports { int_acc_w_87_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1585 \
    name int_acc_w_103_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_w_103_load_reload \
    op interface \
    ports { int_acc_w_103_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1586 \
    name int_acc_w_119_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_w_119_load_reload \
    op interface \
    ports { int_acc_w_119_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1587 \
    name int_acc_m_7_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_m_7_load_reload \
    op interface \
    ports { int_acc_m_7_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1588 \
    name int_acc_m_23_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_m_23_load_reload \
    op interface \
    ports { int_acc_m_23_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1589 \
    name int_acc_m_39_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_m_39_load_reload \
    op interface \
    ports { int_acc_m_39_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1590 \
    name int_acc_m_55_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_m_55_load_reload \
    op interface \
    ports { int_acc_m_55_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1591 \
    name int_acc_m_71_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_m_71_load_reload \
    op interface \
    ports { int_acc_m_71_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1592 \
    name int_acc_m_87_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_m_87_load_reload \
    op interface \
    ports { int_acc_m_87_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1593 \
    name int_acc_m_103_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_m_103_load_reload \
    op interface \
    ports { int_acc_m_103_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1594 \
    name int_acc_m_119_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_m_119_load_reload \
    op interface \
    ports { int_acc_m_119_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1595 \
    name d_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_d_reload \
    op interface \
    ports { d_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1596 \
    name d_2_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_d_2_reload \
    op interface \
    ports { d_2_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1597 \
    name d_4_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_d_4_reload \
    op interface \
    ports { d_4_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1598 \
    name d_6_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_d_6_reload \
    op interface \
    ports { d_6_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1599 \
    name d_8_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_d_8_reload \
    op interface \
    ports { d_8_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1600 \
    name d_10_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_d_10_reload \
    op interface \
    ports { d_10_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1601 \
    name d_12_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_d_12_reload \
    op interface \
    ports { d_12_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1602 \
    name d_14_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_d_14_reload \
    op interface \
    ports { d_14_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1603 \
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
    id 1604 \
    name dmin_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_dmin_reload \
    op interface \
    ports { dmin_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1605 \
    name dmin_2_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_dmin_2_reload \
    op interface \
    ports { dmin_2_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1606 \
    name dmin_4_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_dmin_4_reload \
    op interface \
    ports { dmin_4_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1607 \
    name dmin_6_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_dmin_6_reload \
    op interface \
    ports { dmin_6_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1608 \
    name dmin_8_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_dmin_8_reload \
    op interface \
    ports { dmin_8_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1609 \
    name dmin_10_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_dmin_10_reload \
    op interface \
    ports { dmin_10_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1610 \
    name dmin_12_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_dmin_12_reload \
    op interface \
    ports { dmin_12_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1611 \
    name dmin_14_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_dmin_14_reload \
    op interface \
    ports { dmin_14_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1612 \
    name int_acc_w_8_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_w_8_load_reload \
    op interface \
    ports { int_acc_w_8_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1613 \
    name int_acc_w_24_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_w_24_load_reload \
    op interface \
    ports { int_acc_w_24_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1614 \
    name int_acc_w_40_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_w_40_load_reload \
    op interface \
    ports { int_acc_w_40_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1615 \
    name int_acc_w_56_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_w_56_load_reload \
    op interface \
    ports { int_acc_w_56_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1616 \
    name int_acc_w_72_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_w_72_load_reload \
    op interface \
    ports { int_acc_w_72_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1617 \
    name int_acc_w_88_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_w_88_load_reload \
    op interface \
    ports { int_acc_w_88_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1618 \
    name int_acc_w_104_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_w_104_load_reload \
    op interface \
    ports { int_acc_w_104_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1619 \
    name int_acc_w_120_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_w_120_load_reload \
    op interface \
    ports { int_acc_w_120_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1620 \
    name int_acc_m_8_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_m_8_load_reload \
    op interface \
    ports { int_acc_m_8_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1621 \
    name int_acc_m_24_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_m_24_load_reload \
    op interface \
    ports { int_acc_m_24_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1622 \
    name int_acc_m_40_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_m_40_load_reload \
    op interface \
    ports { int_acc_m_40_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1623 \
    name int_acc_m_56_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_m_56_load_reload \
    op interface \
    ports { int_acc_m_56_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1624 \
    name int_acc_m_72_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_m_72_load_reload \
    op interface \
    ports { int_acc_m_72_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1625 \
    name int_acc_m_88_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_m_88_load_reload \
    op interface \
    ports { int_acc_m_88_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1626 \
    name int_acc_m_104_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_m_104_load_reload \
    op interface \
    ports { int_acc_m_104_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1627 \
    name int_acc_m_120_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_m_120_load_reload \
    op interface \
    ports { int_acc_m_120_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1628 \
    name int_acc_w_9_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_w_9_load_reload \
    op interface \
    ports { int_acc_w_9_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1629 \
    name int_acc_w_25_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_w_25_load_reload \
    op interface \
    ports { int_acc_w_25_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1630 \
    name int_acc_w_41_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_w_41_load_reload \
    op interface \
    ports { int_acc_w_41_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1631 \
    name int_acc_w_57_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_w_57_load_reload \
    op interface \
    ports { int_acc_w_57_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1632 \
    name int_acc_w_73_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_w_73_load_reload \
    op interface \
    ports { int_acc_w_73_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1633 \
    name int_acc_w_89_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_w_89_load_reload \
    op interface \
    ports { int_acc_w_89_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1634 \
    name int_acc_w_105_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_w_105_load_reload \
    op interface \
    ports { int_acc_w_105_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1635 \
    name int_acc_w_121_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_w_121_load_reload \
    op interface \
    ports { int_acc_w_121_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1636 \
    name int_acc_m_9_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_m_9_load_reload \
    op interface \
    ports { int_acc_m_9_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1637 \
    name int_acc_m_25_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_m_25_load_reload \
    op interface \
    ports { int_acc_m_25_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1638 \
    name int_acc_m_41_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_m_41_load_reload \
    op interface \
    ports { int_acc_m_41_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1639 \
    name int_acc_m_57_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_m_57_load_reload \
    op interface \
    ports { int_acc_m_57_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1640 \
    name int_acc_m_73_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_m_73_load_reload \
    op interface \
    ports { int_acc_m_73_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1641 \
    name int_acc_m_89_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_m_89_load_reload \
    op interface \
    ports { int_acc_m_89_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1642 \
    name int_acc_m_105_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_m_105_load_reload \
    op interface \
    ports { int_acc_m_105_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1643 \
    name int_acc_m_121_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_m_121_load_reload \
    op interface \
    ports { int_acc_m_121_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1644 \
    name int_acc_w_10_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_w_10_load_reload \
    op interface \
    ports { int_acc_w_10_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1645 \
    name int_acc_w_26_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_w_26_load_reload \
    op interface \
    ports { int_acc_w_26_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1646 \
    name int_acc_w_42_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_w_42_load_reload \
    op interface \
    ports { int_acc_w_42_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1647 \
    name int_acc_w_58_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_w_58_load_reload \
    op interface \
    ports { int_acc_w_58_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1648 \
    name int_acc_w_74_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_w_74_load_reload \
    op interface \
    ports { int_acc_w_74_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1649 \
    name int_acc_w_90_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_w_90_load_reload \
    op interface \
    ports { int_acc_w_90_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1650 \
    name int_acc_w_106_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_w_106_load_reload \
    op interface \
    ports { int_acc_w_106_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1651 \
    name int_acc_w_122_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_w_122_load_reload \
    op interface \
    ports { int_acc_w_122_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1652 \
    name int_acc_m_10_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_m_10_load_reload \
    op interface \
    ports { int_acc_m_10_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1653 \
    name int_acc_m_26_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_m_26_load_reload \
    op interface \
    ports { int_acc_m_26_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1654 \
    name int_acc_m_42_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_m_42_load_reload \
    op interface \
    ports { int_acc_m_42_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1655 \
    name int_acc_m_58_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_m_58_load_reload \
    op interface \
    ports { int_acc_m_58_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1656 \
    name int_acc_m_74_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_m_74_load_reload \
    op interface \
    ports { int_acc_m_74_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1657 \
    name int_acc_m_90_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_m_90_load_reload \
    op interface \
    ports { int_acc_m_90_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1658 \
    name int_acc_m_106_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_m_106_load_reload \
    op interface \
    ports { int_acc_m_106_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1659 \
    name int_acc_m_122_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_m_122_load_reload \
    op interface \
    ports { int_acc_m_122_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1660 \
    name int_acc_w_11_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_w_11_load_reload \
    op interface \
    ports { int_acc_w_11_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1661 \
    name int_acc_w_27_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_w_27_load_reload \
    op interface \
    ports { int_acc_w_27_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1662 \
    name int_acc_w_43_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_w_43_load_reload \
    op interface \
    ports { int_acc_w_43_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1663 \
    name int_acc_w_59_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_w_59_load_reload \
    op interface \
    ports { int_acc_w_59_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1664 \
    name int_acc_w_75_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_w_75_load_reload \
    op interface \
    ports { int_acc_w_75_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1665 \
    name int_acc_w_91_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_w_91_load_reload \
    op interface \
    ports { int_acc_w_91_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1666 \
    name int_acc_w_107_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_w_107_load_reload \
    op interface \
    ports { int_acc_w_107_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1667 \
    name int_acc_w_123_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_w_123_load_reload \
    op interface \
    ports { int_acc_w_123_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1668 \
    name int_acc_m_11_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_m_11_load_reload \
    op interface \
    ports { int_acc_m_11_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1669 \
    name int_acc_m_27_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_m_27_load_reload \
    op interface \
    ports { int_acc_m_27_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1670 \
    name int_acc_m_43_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_m_43_load_reload \
    op interface \
    ports { int_acc_m_43_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1671 \
    name int_acc_m_59_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_m_59_load_reload \
    op interface \
    ports { int_acc_m_59_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1672 \
    name int_acc_m_75_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_m_75_load_reload \
    op interface \
    ports { int_acc_m_75_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1673 \
    name int_acc_m_91_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_m_91_load_reload \
    op interface \
    ports { int_acc_m_91_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1674 \
    name int_acc_m_107_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_m_107_load_reload \
    op interface \
    ports { int_acc_m_107_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1675 \
    name int_acc_m_123_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_m_123_load_reload \
    op interface \
    ports { int_acc_m_123_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1676 \
    name int_acc_w_12_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_w_12_load_reload \
    op interface \
    ports { int_acc_w_12_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1677 \
    name int_acc_w_28_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_w_28_load_reload \
    op interface \
    ports { int_acc_w_28_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1678 \
    name int_acc_w_44_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_w_44_load_reload \
    op interface \
    ports { int_acc_w_44_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1679 \
    name int_acc_w_60_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_w_60_load_reload \
    op interface \
    ports { int_acc_w_60_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1680 \
    name int_acc_w_76_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_w_76_load_reload \
    op interface \
    ports { int_acc_w_76_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1681 \
    name int_acc_w_92_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_w_92_load_reload \
    op interface \
    ports { int_acc_w_92_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1682 \
    name int_acc_w_108_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_w_108_load_reload \
    op interface \
    ports { int_acc_w_108_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1683 \
    name int_acc_w_124_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_w_124_load_reload \
    op interface \
    ports { int_acc_w_124_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1684 \
    name int_acc_m_12_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_m_12_load_reload \
    op interface \
    ports { int_acc_m_12_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1685 \
    name int_acc_m_28_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_m_28_load_reload \
    op interface \
    ports { int_acc_m_28_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1686 \
    name int_acc_m_44_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_m_44_load_reload \
    op interface \
    ports { int_acc_m_44_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1687 \
    name int_acc_m_60_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_m_60_load_reload \
    op interface \
    ports { int_acc_m_60_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1688 \
    name int_acc_m_76_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_m_76_load_reload \
    op interface \
    ports { int_acc_m_76_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1689 \
    name int_acc_m_92_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_m_92_load_reload \
    op interface \
    ports { int_acc_m_92_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1690 \
    name int_acc_m_108_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_m_108_load_reload \
    op interface \
    ports { int_acc_m_108_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1691 \
    name int_acc_m_124_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_m_124_load_reload \
    op interface \
    ports { int_acc_m_124_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1692 \
    name int_acc_w_13_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_w_13_load_reload \
    op interface \
    ports { int_acc_w_13_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1693 \
    name int_acc_w_29_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_w_29_load_reload \
    op interface \
    ports { int_acc_w_29_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1694 \
    name int_acc_w_45_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_w_45_load_reload \
    op interface \
    ports { int_acc_w_45_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1695 \
    name int_acc_w_61_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_w_61_load_reload \
    op interface \
    ports { int_acc_w_61_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1696 \
    name int_acc_w_77_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_w_77_load_reload \
    op interface \
    ports { int_acc_w_77_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1697 \
    name int_acc_w_93_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_w_93_load_reload \
    op interface \
    ports { int_acc_w_93_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1698 \
    name int_acc_w_109_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_w_109_load_reload \
    op interface \
    ports { int_acc_w_109_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1699 \
    name int_acc_w_125_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_w_125_load_reload \
    op interface \
    ports { int_acc_w_125_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1700 \
    name int_acc_m_13_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_m_13_load_reload \
    op interface \
    ports { int_acc_m_13_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1701 \
    name int_acc_m_29_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_m_29_load_reload \
    op interface \
    ports { int_acc_m_29_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1702 \
    name int_acc_m_45_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_m_45_load_reload \
    op interface \
    ports { int_acc_m_45_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1703 \
    name int_acc_m_61_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_m_61_load_reload \
    op interface \
    ports { int_acc_m_61_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1704 \
    name int_acc_m_77_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_m_77_load_reload \
    op interface \
    ports { int_acc_m_77_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1705 \
    name int_acc_m_93_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_m_93_load_reload \
    op interface \
    ports { int_acc_m_93_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1706 \
    name int_acc_m_109_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_m_109_load_reload \
    op interface \
    ports { int_acc_m_109_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1707 \
    name int_acc_m_125_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_m_125_load_reload \
    op interface \
    ports { int_acc_m_125_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1708 \
    name int_acc_w_14_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_w_14_load_reload \
    op interface \
    ports { int_acc_w_14_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1709 \
    name int_acc_w_30_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_w_30_load_reload \
    op interface \
    ports { int_acc_w_30_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1710 \
    name int_acc_w_46_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_w_46_load_reload \
    op interface \
    ports { int_acc_w_46_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1711 \
    name int_acc_w_62_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_w_62_load_reload \
    op interface \
    ports { int_acc_w_62_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1712 \
    name int_acc_w_78_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_w_78_load_reload \
    op interface \
    ports { int_acc_w_78_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1713 \
    name int_acc_w_94_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_w_94_load_reload \
    op interface \
    ports { int_acc_w_94_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1714 \
    name int_acc_w_110_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_w_110_load_reload \
    op interface \
    ports { int_acc_w_110_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1715 \
    name int_acc_w_126_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_w_126_load_reload \
    op interface \
    ports { int_acc_w_126_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1716 \
    name int_acc_m_14_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_m_14_load_reload \
    op interface \
    ports { int_acc_m_14_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1717 \
    name int_acc_m_30_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_m_30_load_reload \
    op interface \
    ports { int_acc_m_30_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1718 \
    name int_acc_m_46_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_m_46_load_reload \
    op interface \
    ports { int_acc_m_46_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1719 \
    name int_acc_m_62_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_m_62_load_reload \
    op interface \
    ports { int_acc_m_62_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1720 \
    name int_acc_m_78_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_m_78_load_reload \
    op interface \
    ports { int_acc_m_78_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1721 \
    name int_acc_m_94_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_m_94_load_reload \
    op interface \
    ports { int_acc_m_94_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1722 \
    name int_acc_m_110_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_m_110_load_reload \
    op interface \
    ports { int_acc_m_110_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1723 \
    name int_acc_m_126_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_m_126_load_reload \
    op interface \
    ports { int_acc_m_126_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1724 \
    name int_acc_w_15_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_w_15_load_reload \
    op interface \
    ports { int_acc_w_15_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1725 \
    name int_acc_w_31_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_w_31_load_reload \
    op interface \
    ports { int_acc_w_31_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1726 \
    name int_acc_w_47_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_w_47_load_reload \
    op interface \
    ports { int_acc_w_47_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1727 \
    name int_acc_w_63_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_w_63_load_reload \
    op interface \
    ports { int_acc_w_63_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1728 \
    name int_acc_w_79_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_w_79_load_reload \
    op interface \
    ports { int_acc_w_79_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1729 \
    name int_acc_w_95_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_w_95_load_reload \
    op interface \
    ports { int_acc_w_95_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1730 \
    name int_acc_w_111_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_w_111_load_reload \
    op interface \
    ports { int_acc_w_111_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1731 \
    name int_acc_w_127_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_w_127_load_reload \
    op interface \
    ports { int_acc_w_127_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1732 \
    name int_acc_m_15_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_m_15_load_reload \
    op interface \
    ports { int_acc_m_15_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1733 \
    name int_acc_m_31_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_m_31_load_reload \
    op interface \
    ports { int_acc_m_31_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1734 \
    name int_acc_m_47_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_m_47_load_reload \
    op interface \
    ports { int_acc_m_47_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1735 \
    name int_acc_m_63_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_m_63_load_reload \
    op interface \
    ports { int_acc_m_63_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1736 \
    name int_acc_m_79_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_m_79_load_reload \
    op interface \
    ports { int_acc_m_79_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1737 \
    name int_acc_m_95_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_m_95_load_reload \
    op interface \
    ports { int_acc_m_95_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1738 \
    name int_acc_m_111_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_m_111_load_reload \
    op interface \
    ports { int_acc_m_111_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1739 \
    name int_acc_m_127_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_m_127_load_reload \
    op interface \
    ports { int_acc_m_127_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1740 \
    name d_1_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_d_1_reload \
    op interface \
    ports { d_1_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1741 \
    name d_3_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_d_3_reload \
    op interface \
    ports { d_3_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1742 \
    name d_5_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_d_5_reload \
    op interface \
    ports { d_5_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1743 \
    name d_7_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_d_7_reload \
    op interface \
    ports { d_7_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1744 \
    name d_9_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_d_9_reload \
    op interface \
    ports { d_9_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1745 \
    name d_11_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_d_11_reload \
    op interface \
    ports { d_11_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1746 \
    name d_13_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_d_13_reload \
    op interface \
    ports { d_13_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1747 \
    name d_15_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_d_15_reload \
    op interface \
    ports { d_15_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1748 \
    name dmin_1_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_dmin_1_reload \
    op interface \
    ports { dmin_1_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1749 \
    name dmin_3_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_dmin_3_reload \
    op interface \
    ports { dmin_3_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1750 \
    name dmin_5_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_dmin_5_reload \
    op interface \
    ports { dmin_5_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1751 \
    name dmin_7_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_dmin_7_reload \
    op interface \
    ports { dmin_7_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1752 \
    name dmin_9_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_dmin_9_reload \
    op interface \
    ports { dmin_9_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1753 \
    name dmin_11_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_dmin_11_reload \
    op interface \
    ports { dmin_11_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1754 \
    name dmin_13_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_dmin_13_reload \
    op interface \
    ports { dmin_13_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1755 \
    name dmin_15_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_dmin_15_reload \
    op interface \
    ports { dmin_15_reload { I 32 vector } } \
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


