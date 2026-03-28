# This script segment is generated automatically by AutoPilot

if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler swiglu_sparsemux_701_9_8_1_1 BINDTYPE {op} TYPE {sparsemux} IMPL {compactencoding_dontcare}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler swiglu_sparsemux_693_9_8_1_1 BINDTYPE {op} TYPE {sparsemux} IMPL {compactencoding_dontcare}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler swiglu_sparsemux_687_9_8_1_1 BINDTYPE {op} TYPE {sparsemux} IMPL {compactencoding_dontcare}
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
    id 3837 \
    name gate_5 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename gate_5 \
    op interface \
    ports { gate_5_address0 { O 8 vector } gate_5_ce0 { O 1 bit } gate_5_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'gate_5'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 3838 \
    name gate_13 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename gate_13 \
    op interface \
    ports { gate_13_address0 { O 8 vector } gate_13_ce0 { O 1 bit } gate_13_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'gate_13'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 3839 \
    name gate_21 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename gate_21 \
    op interface \
    ports { gate_21_address0 { O 8 vector } gate_21_ce0 { O 1 bit } gate_21_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'gate_21'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 3840 \
    name gate_29 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename gate_29 \
    op interface \
    ports { gate_29_address0 { O 8 vector } gate_29_ce0 { O 1 bit } gate_29_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'gate_29'"
}
}


# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3473 \
    name acc \
    type other \
    dir IO \
    reset_level 1 \
    sync_rst true \
    corename dc_acc \
    op interface \
    ports { acc_i { I 32 vector } acc_o { O 32 vector } acc_o_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3474 \
    name acc_7 \
    type other \
    dir IO \
    reset_level 1 \
    sync_rst true \
    corename dc_acc_7 \
    op interface \
    ports { acc_7_i { I 32 vector } acc_7_o { O 32 vector } acc_7_o_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3475 \
    name acc_6 \
    type other \
    dir IO \
    reset_level 1 \
    sync_rst true \
    corename dc_acc_6 \
    op interface \
    ports { acc_6_i { I 32 vector } acc_6_o { O 32 vector } acc_6_o_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3476 \
    name acc_5 \
    type other \
    dir IO \
    reset_level 1 \
    sync_rst true \
    corename dc_acc_5 \
    op interface \
    ports { acc_5_i { I 32 vector } acc_5_o { O 32 vector } acc_5_o_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3477 \
    name acc_4 \
    type other \
    dir IO \
    reset_level 1 \
    sync_rst true \
    corename dc_acc_4 \
    op interface \
    ports { acc_4_i { I 32 vector } acc_4_o { O 32 vector } acc_4_o_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3478 \
    name acc_3 \
    type other \
    dir IO \
    reset_level 1 \
    sync_rst true \
    corename dc_acc_3 \
    op interface \
    ports { acc_3_i { I 32 vector } acc_3_o { O 32 vector } acc_3_o_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3479 \
    name acc_2 \
    type other \
    dir IO \
    reset_level 1 \
    sync_rst true \
    corename dc_acc_2 \
    op interface \
    ports { acc_2_i { I 32 vector } acc_2_o { O 32 vector } acc_2_o_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3480 \
    name acc_1 \
    type other \
    dir IO \
    reset_level 1 \
    sync_rst true \
    corename dc_acc_1 \
    op interface \
    ports { acc_1_i { I 32 vector } acc_1_o { O 32 vector } acc_1_o_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3481 \
    name empty_32 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_empty_32 \
    op interface \
    ports { empty_32 { I 13 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3482 \
    name rb_65_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_65_val \
    op interface \
    ports { rb_65_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3483 \
    name rb_66_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_66_val \
    op interface \
    ports { rb_66_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3484 \
    name rb_67_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_67_val \
    op interface \
    ports { rb_67_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3485 \
    name rb_68_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_68_val \
    op interface \
    ports { rb_68_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3486 \
    name rb_69_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_69_val \
    op interface \
    ports { rb_69_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3487 \
    name rb_70_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_70_val \
    op interface \
    ports { rb_70_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3488 \
    name rb_71_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_71_val \
    op interface \
    ports { rb_71_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3489 \
    name rb_72_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_72_val \
    op interface \
    ports { rb_72_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3490 \
    name rb_73_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_73_val \
    op interface \
    ports { rb_73_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3491 \
    name rb_74_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_74_val \
    op interface \
    ports { rb_74_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3492 \
    name rb_75_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_75_val \
    op interface \
    ports { rb_75_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3493 \
    name rb_76_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_76_val \
    op interface \
    ports { rb_76_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3494 \
    name rb_77_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_77_val \
    op interface \
    ports { rb_77_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3495 \
    name rb_78_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_78_val \
    op interface \
    ports { rb_78_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3496 \
    name rb_79_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_79_val \
    op interface \
    ports { rb_79_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3497 \
    name rb_80_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_80_val \
    op interface \
    ports { rb_80_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3498 \
    name rb_81_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_81_val \
    op interface \
    ports { rb_81_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3499 \
    name rb_82_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_82_val \
    op interface \
    ports { rb_82_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3500 \
    name rb_83_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_83_val \
    op interface \
    ports { rb_83_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3501 \
    name rb_84_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_84_val \
    op interface \
    ports { rb_84_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3502 \
    name rb_85_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_85_val \
    op interface \
    ports { rb_85_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3503 \
    name rb_86_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_86_val \
    op interface \
    ports { rb_86_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3504 \
    name rb_87_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_87_val \
    op interface \
    ports { rb_87_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3505 \
    name rb_88_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_88_val \
    op interface \
    ports { rb_88_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3506 \
    name rb_89_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_89_val \
    op interface \
    ports { rb_89_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3507 \
    name rb_90_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_90_val \
    op interface \
    ports { rb_90_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3508 \
    name rb_91_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_91_val \
    op interface \
    ports { rb_91_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3509 \
    name rb_92_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_92_val \
    op interface \
    ports { rb_92_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3510 \
    name rb_93_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_93_val \
    op interface \
    ports { rb_93_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3511 \
    name rb_94_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_94_val \
    op interface \
    ports { rb_94_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3512 \
    name rb_95_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_95_val \
    op interface \
    ports { rb_95_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3513 \
    name rb_96_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_96_val \
    op interface \
    ports { rb_96_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3514 \
    name rb_97_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_97_val \
    op interface \
    ports { rb_97_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3515 \
    name rb_98_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_98_val \
    op interface \
    ports { rb_98_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3516 \
    name rb_99_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_99_val \
    op interface \
    ports { rb_99_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3517 \
    name rb_100_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_100_val \
    op interface \
    ports { rb_100_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3518 \
    name rb_101_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_101_val \
    op interface \
    ports { rb_101_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3519 \
    name rb_102_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_102_val \
    op interface \
    ports { rb_102_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3520 \
    name rb_103_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_103_val \
    op interface \
    ports { rb_103_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3521 \
    name rb_104_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_104_val \
    op interface \
    ports { rb_104_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3522 \
    name rb_105_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_105_val \
    op interface \
    ports { rb_105_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3523 \
    name rb_106_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_106_val \
    op interface \
    ports { rb_106_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3524 \
    name rb_107_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_107_val \
    op interface \
    ports { rb_107_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3525 \
    name rb_108_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_108_val \
    op interface \
    ports { rb_108_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3526 \
    name rb_109_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_109_val \
    op interface \
    ports { rb_109_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3527 \
    name rb_110_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_110_val \
    op interface \
    ports { rb_110_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3528 \
    name rb_111_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_111_val \
    op interface \
    ports { rb_111_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3529 \
    name rb_112_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_112_val \
    op interface \
    ports { rb_112_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3530 \
    name rb_113_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_113_val \
    op interface \
    ports { rb_113_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3531 \
    name rb_114_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_114_val \
    op interface \
    ports { rb_114_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3532 \
    name rb_115_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_115_val \
    op interface \
    ports { rb_115_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3533 \
    name rb_116_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_116_val \
    op interface \
    ports { rb_116_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3534 \
    name rb_117_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_117_val \
    op interface \
    ports { rb_117_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3535 \
    name rb_118_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_118_val \
    op interface \
    ports { rb_118_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3536 \
    name rb_119_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_119_val \
    op interface \
    ports { rb_119_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3537 \
    name rb_120_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_120_val \
    op interface \
    ports { rb_120_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3538 \
    name rb_121_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_121_val \
    op interface \
    ports { rb_121_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3539 \
    name rb_122_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_122_val \
    op interface \
    ports { rb_122_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3540 \
    name rb_123_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_123_val \
    op interface \
    ports { rb_123_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3541 \
    name rb_124_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_124_val \
    op interface \
    ports { rb_124_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3542 \
    name rb_125_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_125_val \
    op interface \
    ports { rb_125_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3543 \
    name rb_126_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_126_val \
    op interface \
    ports { rb_126_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3544 \
    name rb_127_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_127_val \
    op interface \
    ports { rb_127_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3545 \
    name rb_128_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_128_val \
    op interface \
    ports { rb_128_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3546 \
    name rb_129_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_129_val \
    op interface \
    ports { rb_129_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3547 \
    name rb_130_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_130_val \
    op interface \
    ports { rb_130_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3548 \
    name rb_131_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_131_val \
    op interface \
    ports { rb_131_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3549 \
    name rb_132_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_132_val \
    op interface \
    ports { rb_132_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3550 \
    name rb_133_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_133_val \
    op interface \
    ports { rb_133_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3551 \
    name rb_134_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_134_val \
    op interface \
    ports { rb_134_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3552 \
    name rb_135_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_135_val \
    op interface \
    ports { rb_135_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3553 \
    name rb_136_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_136_val \
    op interface \
    ports { rb_136_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3554 \
    name rb_137_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_137_val \
    op interface \
    ports { rb_137_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3555 \
    name rb_138_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_138_val \
    op interface \
    ports { rb_138_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3556 \
    name rb_139_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_139_val \
    op interface \
    ports { rb_139_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3557 \
    name rb_140_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_140_val \
    op interface \
    ports { rb_140_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3558 \
    name rb_141_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_141_val \
    op interface \
    ports { rb_141_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3559 \
    name rb_142_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_142_val \
    op interface \
    ports { rb_142_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3560 \
    name rb_143_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_143_val \
    op interface \
    ports { rb_143_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3561 \
    name rb_144_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_144_val \
    op interface \
    ports { rb_144_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3562 \
    name rb_145_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_145_val \
    op interface \
    ports { rb_145_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3563 \
    name rb_146_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_146_val \
    op interface \
    ports { rb_146_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3564 \
    name rb_147_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_147_val \
    op interface \
    ports { rb_147_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3565 \
    name rb_148_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_148_val \
    op interface \
    ports { rb_148_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3566 \
    name rb_149_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_149_val \
    op interface \
    ports { rb_149_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3567 \
    name rb_150_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_150_val \
    op interface \
    ports { rb_150_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3568 \
    name rb_151_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_151_val \
    op interface \
    ports { rb_151_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3569 \
    name rb_152_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_152_val \
    op interface \
    ports { rb_152_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3570 \
    name rb_153_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_153_val \
    op interface \
    ports { rb_153_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3571 \
    name rb_154_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_154_val \
    op interface \
    ports { rb_154_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3572 \
    name rb_155_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_155_val \
    op interface \
    ports { rb_155_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3573 \
    name rb_156_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_156_val \
    op interface \
    ports { rb_156_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3574 \
    name rb_157_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_157_val \
    op interface \
    ports { rb_157_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3575 \
    name rb_158_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_158_val \
    op interface \
    ports { rb_158_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3576 \
    name rb_159_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_159_val \
    op interface \
    ports { rb_159_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3577 \
    name rb_160_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_160_val \
    op interface \
    ports { rb_160_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3578 \
    name rb_161_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_161_val \
    op interface \
    ports { rb_161_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3579 \
    name rb_162_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_162_val \
    op interface \
    ports { rb_162_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3580 \
    name rb_163_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_163_val \
    op interface \
    ports { rb_163_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3581 \
    name rb_164_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_164_val \
    op interface \
    ports { rb_164_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3582 \
    name rb_165_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_165_val \
    op interface \
    ports { rb_165_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3583 \
    name rb_166_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_166_val \
    op interface \
    ports { rb_166_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3584 \
    name rb_167_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_167_val \
    op interface \
    ports { rb_167_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3585 \
    name rb_168_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_168_val \
    op interface \
    ports { rb_168_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3586 \
    name rb_169_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_169_val \
    op interface \
    ports { rb_169_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3587 \
    name rb_170_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_170_val \
    op interface \
    ports { rb_170_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3588 \
    name rb_171_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_171_val \
    op interface \
    ports { rb_171_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3589 \
    name rb_172_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_172_val \
    op interface \
    ports { rb_172_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3590 \
    name rb_173_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_173_val \
    op interface \
    ports { rb_173_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3591 \
    name rb_174_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_174_val \
    op interface \
    ports { rb_174_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3592 \
    name rb_175_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_175_val \
    op interface \
    ports { rb_175_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3593 \
    name rb_176_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_176_val \
    op interface \
    ports { rb_176_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3594 \
    name rb_177_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_177_val \
    op interface \
    ports { rb_177_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3595 \
    name rb_178_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_178_val \
    op interface \
    ports { rb_178_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3596 \
    name rb_179_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_179_val \
    op interface \
    ports { rb_179_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3597 \
    name rb_180_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_180_val \
    op interface \
    ports { rb_180_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3598 \
    name rb_181_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_181_val \
    op interface \
    ports { rb_181_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3599 \
    name rb_182_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_182_val \
    op interface \
    ports { rb_182_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3600 \
    name rb_183_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_183_val \
    op interface \
    ports { rb_183_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3601 \
    name rb_184_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_184_val \
    op interface \
    ports { rb_184_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3602 \
    name rb_185_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_185_val \
    op interface \
    ports { rb_185_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3603 \
    name rb_186_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_186_val \
    op interface \
    ports { rb_186_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3604 \
    name rb_187_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_187_val \
    op interface \
    ports { rb_187_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3605 \
    name rb_188_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_188_val \
    op interface \
    ports { rb_188_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3606 \
    name rb_189_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_189_val \
    op interface \
    ports { rb_189_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3607 \
    name rb_190_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_190_val \
    op interface \
    ports { rb_190_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3608 \
    name rb_191_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_191_val \
    op interface \
    ports { rb_191_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3609 \
    name rb_192_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_192_val \
    op interface \
    ports { rb_192_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3610 \
    name rb_193_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_193_val \
    op interface \
    ports { rb_193_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3611 \
    name rb_194_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_194_val \
    op interface \
    ports { rb_194_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3612 \
    name rb_195_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_195_val \
    op interface \
    ports { rb_195_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3613 \
    name rb_196_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_196_val \
    op interface \
    ports { rb_196_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3614 \
    name rb_197_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_197_val \
    op interface \
    ports { rb_197_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3615 \
    name rb_198_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_198_val \
    op interface \
    ports { rb_198_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3616 \
    name rb_199_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_199_val \
    op interface \
    ports { rb_199_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3617 \
    name rb_200_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_200_val \
    op interface \
    ports { rb_200_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3618 \
    name rb_201_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_201_val \
    op interface \
    ports { rb_201_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3619 \
    name rb_202_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_202_val \
    op interface \
    ports { rb_202_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3620 \
    name rb_203_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_203_val \
    op interface \
    ports { rb_203_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3621 \
    name rb_204_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_204_val \
    op interface \
    ports { rb_204_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3622 \
    name rb_205_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_205_val \
    op interface \
    ports { rb_205_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3623 \
    name rb_206_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_206_val \
    op interface \
    ports { rb_206_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3624 \
    name rb_207_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_207_val \
    op interface \
    ports { rb_207_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3625 \
    name rb_208_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_208_val \
    op interface \
    ports { rb_208_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3626 \
    name rb_209_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_209_val \
    op interface \
    ports { rb_209_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3627 \
    name rb_210_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_210_val \
    op interface \
    ports { rb_210_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3628 \
    name rb_211_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_211_val \
    op interface \
    ports { rb_211_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3629 \
    name rb_212_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_212_val \
    op interface \
    ports { rb_212_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3630 \
    name rb_213_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_213_val \
    op interface \
    ports { rb_213_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3631 \
    name rb_214_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_214_val \
    op interface \
    ports { rb_214_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3632 \
    name rb_215_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_215_val \
    op interface \
    ports { rb_215_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3633 \
    name rb_216_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_216_val \
    op interface \
    ports { rb_216_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3634 \
    name rb_217_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_217_val \
    op interface \
    ports { rb_217_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3635 \
    name rb_218_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_218_val \
    op interface \
    ports { rb_218_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3636 \
    name rb_219_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_219_val \
    op interface \
    ports { rb_219_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3637 \
    name rb_220_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_220_val \
    op interface \
    ports { rb_220_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3638 \
    name rb_221_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_221_val \
    op interface \
    ports { rb_221_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3639 \
    name rb_222_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_222_val \
    op interface \
    ports { rb_222_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3640 \
    name rb_223_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_223_val \
    op interface \
    ports { rb_223_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3641 \
    name rb_224_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_224_val \
    op interface \
    ports { rb_224_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3642 \
    name rb_225_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_225_val \
    op interface \
    ports { rb_225_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3643 \
    name rb_226_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_226_val \
    op interface \
    ports { rb_226_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3644 \
    name rb_227_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_227_val \
    op interface \
    ports { rb_227_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3645 \
    name rb_228_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_228_val \
    op interface \
    ports { rb_228_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3646 \
    name rb_229_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_229_val \
    op interface \
    ports { rb_229_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3647 \
    name rb_230_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_230_val \
    op interface \
    ports { rb_230_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3648 \
    name rb_231_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_231_val \
    op interface \
    ports { rb_231_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3649 \
    name rb_232_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_232_val \
    op interface \
    ports { rb_232_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3650 \
    name rb_233_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_233_val \
    op interface \
    ports { rb_233_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3651 \
    name rb_234_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_234_val \
    op interface \
    ports { rb_234_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3652 \
    name rb_235_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_235_val \
    op interface \
    ports { rb_235_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3653 \
    name rb_236_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_236_val \
    op interface \
    ports { rb_236_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3654 \
    name rb_237_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_237_val \
    op interface \
    ports { rb_237_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3655 \
    name rb_238_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_238_val \
    op interface \
    ports { rb_238_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3656 \
    name rb_239_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_239_val \
    op interface \
    ports { rb_239_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3657 \
    name rb_240_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_240_val \
    op interface \
    ports { rb_240_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3658 \
    name rb_241_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_241_val \
    op interface \
    ports { rb_241_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3659 \
    name rb_242_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_242_val \
    op interface \
    ports { rb_242_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3660 \
    name rb_243_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_243_val \
    op interface \
    ports { rb_243_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3661 \
    name rb_244_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_244_val \
    op interface \
    ports { rb_244_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3662 \
    name rb_245_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_245_val \
    op interface \
    ports { rb_245_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3663 \
    name rb_246_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_246_val \
    op interface \
    ports { rb_246_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3664 \
    name rb_247_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_247_val \
    op interface \
    ports { rb_247_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3665 \
    name rb_248_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_248_val \
    op interface \
    ports { rb_248_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3666 \
    name rb_249_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_249_val \
    op interface \
    ports { rb_249_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3667 \
    name rb_250_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_250_val \
    op interface \
    ports { rb_250_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3668 \
    name rb_251_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_251_val \
    op interface \
    ports { rb_251_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3669 \
    name rb_252_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_252_val \
    op interface \
    ports { rb_252_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3670 \
    name rb_253_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_253_val \
    op interface \
    ports { rb_253_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3671 \
    name rb_254_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_254_val \
    op interface \
    ports { rb_254_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3672 \
    name rb_255_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_255_val \
    op interface \
    ports { rb_255_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3673 \
    name rb_256_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_256_val \
    op interface \
    ports { rb_256_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3674 \
    name rb_257_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_257_val \
    op interface \
    ports { rb_257_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3675 \
    name rb_258_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_258_val \
    op interface \
    ports { rb_258_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3676 \
    name rb_259_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_259_val \
    op interface \
    ports { rb_259_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3677 \
    name rb_260_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_260_val \
    op interface \
    ports { rb_260_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3678 \
    name rb_261_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_261_val \
    op interface \
    ports { rb_261_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3679 \
    name rb_262_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_262_val \
    op interface \
    ports { rb_262_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3680 \
    name rb_263_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_263_val \
    op interface \
    ports { rb_263_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3681 \
    name rb_264_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_264_val \
    op interface \
    ports { rb_264_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3682 \
    name rb_265_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_265_val \
    op interface \
    ports { rb_265_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3683 \
    name rb_266_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_266_val \
    op interface \
    ports { rb_266_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3684 \
    name rb_267_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_267_val \
    op interface \
    ports { rb_267_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3685 \
    name rb_268_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_268_val \
    op interface \
    ports { rb_268_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3686 \
    name rb_269_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_269_val \
    op interface \
    ports { rb_269_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3687 \
    name rb_270_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_270_val \
    op interface \
    ports { rb_270_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3688 \
    name rb_271_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_271_val \
    op interface \
    ports { rb_271_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3689 \
    name rb_272_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_272_val \
    op interface \
    ports { rb_272_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3690 \
    name rb_273_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_273_val \
    op interface \
    ports { rb_273_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3691 \
    name rb_274_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_274_val \
    op interface \
    ports { rb_274_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3692 \
    name rb_275_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_275_val \
    op interface \
    ports { rb_275_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3693 \
    name rb_276_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_276_val \
    op interface \
    ports { rb_276_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3694 \
    name rb_277_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_277_val \
    op interface \
    ports { rb_277_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3695 \
    name rb_278_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_278_val \
    op interface \
    ports { rb_278_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3696 \
    name rb_279_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_279_val \
    op interface \
    ports { rb_279_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3697 \
    name rb_280_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_280_val \
    op interface \
    ports { rb_280_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3698 \
    name rb_281_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_281_val \
    op interface \
    ports { rb_281_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3699 \
    name rb_282_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_282_val \
    op interface \
    ports { rb_282_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3700 \
    name rb_283_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_283_val \
    op interface \
    ports { rb_283_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3701 \
    name rb_284_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_284_val \
    op interface \
    ports { rb_284_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3702 \
    name rb_285_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_285_val \
    op interface \
    ports { rb_285_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3703 \
    name rb_286_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_286_val \
    op interface \
    ports { rb_286_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3704 \
    name rb_287_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_287_val \
    op interface \
    ports { rb_287_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3705 \
    name rb_288_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_288_val \
    op interface \
    ports { rb_288_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3706 \
    name rb_289_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_289_val \
    op interface \
    ports { rb_289_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3707 \
    name rb_290_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_290_val \
    op interface \
    ports { rb_290_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3708 \
    name rb_291_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_291_val \
    op interface \
    ports { rb_291_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3709 \
    name rb_292_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_292_val \
    op interface \
    ports { rb_292_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3710 \
    name rb_293_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_293_val \
    op interface \
    ports { rb_293_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3711 \
    name rb_294_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_294_val \
    op interface \
    ports { rb_294_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3712 \
    name rb_295_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_295_val \
    op interface \
    ports { rb_295_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3713 \
    name rb_296_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_296_val \
    op interface \
    ports { rb_296_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3714 \
    name rb_297_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_297_val \
    op interface \
    ports { rb_297_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3715 \
    name rb_298_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_298_val \
    op interface \
    ports { rb_298_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3716 \
    name rb_299_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_299_val \
    op interface \
    ports { rb_299_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3717 \
    name rb_300_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_300_val \
    op interface \
    ports { rb_300_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3718 \
    name rb_301_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_301_val \
    op interface \
    ports { rb_301_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3719 \
    name rb_302_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_302_val \
    op interface \
    ports { rb_302_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3720 \
    name rb_303_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_303_val \
    op interface \
    ports { rb_303_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3721 \
    name rb_304_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_304_val \
    op interface \
    ports { rb_304_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3722 \
    name rb_305_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_305_val \
    op interface \
    ports { rb_305_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3723 \
    name rb_306_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_306_val \
    op interface \
    ports { rb_306_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3724 \
    name rb_307_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_307_val \
    op interface \
    ports { rb_307_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3725 \
    name rb_308_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_308_val \
    op interface \
    ports { rb_308_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3726 \
    name rb_309_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_309_val \
    op interface \
    ports { rb_309_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3727 \
    name rb_310_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_310_val \
    op interface \
    ports { rb_310_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3728 \
    name rb_311_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_311_val \
    op interface \
    ports { rb_311_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3729 \
    name rb_312_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_312_val \
    op interface \
    ports { rb_312_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3730 \
    name rb_313_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_313_val \
    op interface \
    ports { rb_313_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3731 \
    name rb_314_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_314_val \
    op interface \
    ports { rb_314_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3732 \
    name rb_315_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_315_val \
    op interface \
    ports { rb_315_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3733 \
    name rb_316_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_316_val \
    op interface \
    ports { rb_316_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3734 \
    name rb_317_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_317_val \
    op interface \
    ports { rb_317_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3735 \
    name rb_318_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_318_val \
    op interface \
    ports { rb_318_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3736 \
    name rb_319_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_319_val \
    op interface \
    ports { rb_319_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3737 \
    name rb_320_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_320_val \
    op interface \
    ports { rb_320_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3738 \
    name rb_321_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_321_val \
    op interface \
    ports { rb_321_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3739 \
    name rb_322_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_322_val \
    op interface \
    ports { rb_322_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3740 \
    name rb_323_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_323_val \
    op interface \
    ports { rb_323_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3741 \
    name rb_324_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_324_val \
    op interface \
    ports { rb_324_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3742 \
    name rb_325_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_325_val \
    op interface \
    ports { rb_325_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3743 \
    name rb_326_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_326_val \
    op interface \
    ports { rb_326_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3744 \
    name rb_327_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_327_val \
    op interface \
    ports { rb_327_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3745 \
    name rb_328_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_328_val \
    op interface \
    ports { rb_328_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3746 \
    name rb_329_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_329_val \
    op interface \
    ports { rb_329_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3747 \
    name rb_330_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_330_val \
    op interface \
    ports { rb_330_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3748 \
    name rb_331_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_331_val \
    op interface \
    ports { rb_331_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3749 \
    name rb_332_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_332_val \
    op interface \
    ports { rb_332_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3750 \
    name rb_333_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_333_val \
    op interface \
    ports { rb_333_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3751 \
    name rb_334_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_334_val \
    op interface \
    ports { rb_334_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3752 \
    name rb_335_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_335_val \
    op interface \
    ports { rb_335_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3753 \
    name rb_336_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_336_val \
    op interface \
    ports { rb_336_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3754 \
    name rb_337_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_337_val \
    op interface \
    ports { rb_337_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3755 \
    name rb_338_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_338_val \
    op interface \
    ports { rb_338_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3756 \
    name rb_339_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_339_val \
    op interface \
    ports { rb_339_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3757 \
    name rb_340_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_340_val \
    op interface \
    ports { rb_340_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3758 \
    name rb_341_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_341_val \
    op interface \
    ports { rb_341_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3759 \
    name rb_342_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_342_val \
    op interface \
    ports { rb_342_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3760 \
    name rb_343_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_343_val \
    op interface \
    ports { rb_343_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3761 \
    name rb_344_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_344_val \
    op interface \
    ports { rb_344_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3762 \
    name rb_345_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_345_val \
    op interface \
    ports { rb_345_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3763 \
    name rb_346_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_346_val \
    op interface \
    ports { rb_346_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3764 \
    name rb_347_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_347_val \
    op interface \
    ports { rb_347_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3765 \
    name rb_348_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_348_val \
    op interface \
    ports { rb_348_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3766 \
    name rb_349_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_349_val \
    op interface \
    ports { rb_349_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3767 \
    name rb_350_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_350_val \
    op interface \
    ports { rb_350_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3768 \
    name rb_351_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_351_val \
    op interface \
    ports { rb_351_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3769 \
    name rb_352_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_352_val \
    op interface \
    ports { rb_352_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3770 \
    name rb_353_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_353_val \
    op interface \
    ports { rb_353_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3771 \
    name rb_354_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_354_val \
    op interface \
    ports { rb_354_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3772 \
    name rb_355_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_355_val \
    op interface \
    ports { rb_355_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3773 \
    name rb_356_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_356_val \
    op interface \
    ports { rb_356_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3774 \
    name rb_357_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_357_val \
    op interface \
    ports { rb_357_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3775 \
    name rb_358_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_358_val \
    op interface \
    ports { rb_358_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3776 \
    name rb_359_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_359_val \
    op interface \
    ports { rb_359_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3777 \
    name rb_360_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_360_val \
    op interface \
    ports { rb_360_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3778 \
    name rb_361_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_361_val \
    op interface \
    ports { rb_361_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3779 \
    name rb_362_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_362_val \
    op interface \
    ports { rb_362_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3780 \
    name rb_363_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_363_val \
    op interface \
    ports { rb_363_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3781 \
    name rb_364_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_364_val \
    op interface \
    ports { rb_364_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3782 \
    name rb_365_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_365_val \
    op interface \
    ports { rb_365_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3783 \
    name rb_366_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_366_val \
    op interface \
    ports { rb_366_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3784 \
    name rb_367_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_367_val \
    op interface \
    ports { rb_367_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3785 \
    name rb_368_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_368_val \
    op interface \
    ports { rb_368_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3786 \
    name rb_369_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_369_val \
    op interface \
    ports { rb_369_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3787 \
    name rb_370_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_370_val \
    op interface \
    ports { rb_370_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3788 \
    name rb_371_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_371_val \
    op interface \
    ports { rb_371_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3789 \
    name rb_372_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_372_val \
    op interface \
    ports { rb_372_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3790 \
    name rb_373_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_373_val \
    op interface \
    ports { rb_373_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3791 \
    name rb_374_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_374_val \
    op interface \
    ports { rb_374_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3792 \
    name rb_375_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_375_val \
    op interface \
    ports { rb_375_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3793 \
    name rb_376_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_376_val \
    op interface \
    ports { rb_376_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3794 \
    name rb_377_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_377_val \
    op interface \
    ports { rb_377_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3795 \
    name rb_378_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_378_val \
    op interface \
    ports { rb_378_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3796 \
    name rb_379_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_379_val \
    op interface \
    ports { rb_379_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3797 \
    name rb_380_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_380_val \
    op interface \
    ports { rb_380_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3798 \
    name rb_381_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_381_val \
    op interface \
    ports { rb_381_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3799 \
    name rb_382_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_382_val \
    op interface \
    ports { rb_382_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3800 \
    name rb_383_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_383_val \
    op interface \
    ports { rb_383_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3801 \
    name rb_384_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_384_val \
    op interface \
    ports { rb_384_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3802 \
    name rb_385_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_385_val \
    op interface \
    ports { rb_385_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3803 \
    name rb_386_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_386_val \
    op interface \
    ports { rb_386_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3804 \
    name rb_387_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_387_val \
    op interface \
    ports { rb_387_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3805 \
    name rb_388_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_388_val \
    op interface \
    ports { rb_388_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3806 \
    name rb_389_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_389_val \
    op interface \
    ports { rb_389_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3807 \
    name rb_390_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_390_val \
    op interface \
    ports { rb_390_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3808 \
    name rb_391_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_391_val \
    op interface \
    ports { rb_391_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3809 \
    name rb_392_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_392_val \
    op interface \
    ports { rb_392_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3810 \
    name rb_393_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_393_val \
    op interface \
    ports { rb_393_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3811 \
    name rb_394_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_394_val \
    op interface \
    ports { rb_394_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3812 \
    name rb_395_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_395_val \
    op interface \
    ports { rb_395_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3813 \
    name rb_396_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_396_val \
    op interface \
    ports { rb_396_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3814 \
    name rb_397_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_397_val \
    op interface \
    ports { rb_397_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3815 \
    name rb_398_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_398_val \
    op interface \
    ports { rb_398_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3816 \
    name rb_399_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_399_val \
    op interface \
    ports { rb_399_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3817 \
    name rb_400_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_400_val \
    op interface \
    ports { rb_400_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3818 \
    name rb_401_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_401_val \
    op interface \
    ports { rb_401_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3819 \
    name rb_402_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_402_val \
    op interface \
    ports { rb_402_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3820 \
    name rb_403_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_403_val \
    op interface \
    ports { rb_403_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3821 \
    name rb_404_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_404_val \
    op interface \
    ports { rb_404_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3822 \
    name rb_405_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_405_val \
    op interface \
    ports { rb_405_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3823 \
    name rb_406_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_406_val \
    op interface \
    ports { rb_406_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3824 \
    name rb_407_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_407_val \
    op interface \
    ports { rb_407_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3825 \
    name rb_408_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_408_val \
    op interface \
    ports { rb_408_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3826 \
    name rb_409_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_409_val \
    op interface \
    ports { rb_409_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3827 \
    name rb_410_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_410_val \
    op interface \
    ports { rb_410_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3828 \
    name rb_411_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_411_val \
    op interface \
    ports { rb_411_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3829 \
    name rb_412_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_412_val \
    op interface \
    ports { rb_412_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3830 \
    name rb_413_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_413_val \
    op interface \
    ports { rb_413_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3831 \
    name rb_414_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_414_val \
    op interface \
    ports { rb_414_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3832 \
    name rb_415_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_415_val \
    op interface \
    ports { rb_415_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3833 \
    name rb_416_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_416_val \
    op interface \
    ports { rb_416_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3834 \
    name rb_417_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_417_val \
    op interface \
    ports { rb_417_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3835 \
    name rb_418_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_418_val \
    op interface \
    ports { rb_418_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3836 \
    name rb_419_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_419_val \
    op interface \
    ports { rb_419_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3841 \
    name empty \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_empty \
    op interface \
    ports { empty { I 5 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3842 \
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


