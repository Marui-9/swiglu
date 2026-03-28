# This script segment is generated automatically by AutoPilot

if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler swiglu_sparsemux_649_9_8_1_1_x BINDTYPE {op} TYPE {sparsemux} IMPL {compactencoding_dontcare}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler swiglu_sparsemux_641_9_8_1_1_x BINDTYPE {op} TYPE {sparsemux} IMPL {compactencoding_dontcare}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler swiglu_sparsemux_635_9_8_1_1_x BINDTYPE {op} TYPE {sparsemux} IMPL {compactencoding_dontcare}
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
    id 3032 \
    name gate_3 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename gate_3 \
    op interface \
    ports { gate_3_address0 { O 8 vector } gate_3_ce0 { O 1 bit } gate_3_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'gate_3'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 3033 \
    name gate_11 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename gate_11 \
    op interface \
    ports { gate_11_address0 { O 8 vector } gate_11_ce0 { O 1 bit } gate_11_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'gate_11'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 3034 \
    name gate_19 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename gate_19 \
    op interface \
    ports { gate_19_address0 { O 8 vector } gate_19_ce0 { O 1 bit } gate_19_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'gate_19'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 3035 \
    name gate_27 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename gate_27 \
    op interface \
    ports { gate_27_address0 { O 8 vector } gate_27_ce0 { O 1 bit } gate_27_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'gate_27'"
}
}


# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2694 \
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
    id 2695 \
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
    id 2696 \
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
    id 2697 \
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
    id 2698 \
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
    id 2699 \
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
    id 2700 \
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
    id 2701 \
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
    id 2702 \
    name empty_34 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_empty_34 \
    op interface \
    ports { empty_34 { I 13 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2703 \
    name rb_39_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_39_val \
    op interface \
    ports { rb_39_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2704 \
    name rb_40_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_40_val \
    op interface \
    ports { rb_40_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2705 \
    name rb_41_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_41_val \
    op interface \
    ports { rb_41_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2706 \
    name rb_42_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_42_val \
    op interface \
    ports { rb_42_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2707 \
    name rb_43_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_43_val \
    op interface \
    ports { rb_43_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2708 \
    name rb_44_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_44_val \
    op interface \
    ports { rb_44_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2709 \
    name rb_45_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_45_val \
    op interface \
    ports { rb_45_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2710 \
    name rb_46_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_46_val \
    op interface \
    ports { rb_46_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2711 \
    name rb_47_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_47_val \
    op interface \
    ports { rb_47_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2712 \
    name rb_48_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_48_val \
    op interface \
    ports { rb_48_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2713 \
    name rb_49_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_49_val \
    op interface \
    ports { rb_49_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2714 \
    name rb_50_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_50_val \
    op interface \
    ports { rb_50_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2715 \
    name rb_51_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_51_val \
    op interface \
    ports { rb_51_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2716 \
    name rb_52_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_52_val \
    op interface \
    ports { rb_52_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2717 \
    name rb_53_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_53_val \
    op interface \
    ports { rb_53_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2718 \
    name rb_54_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_54_val \
    op interface \
    ports { rb_54_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2719 \
    name rb_55_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_55_val \
    op interface \
    ports { rb_55_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2720 \
    name rb_56_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_56_val \
    op interface \
    ports { rb_56_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2721 \
    name rb_57_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_57_val \
    op interface \
    ports { rb_57_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2722 \
    name rb_58_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_58_val \
    op interface \
    ports { rb_58_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2723 \
    name rb_59_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_59_val \
    op interface \
    ports { rb_59_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2724 \
    name rb_60_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_60_val \
    op interface \
    ports { rb_60_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2725 \
    name rb_61_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_61_val \
    op interface \
    ports { rb_61_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2726 \
    name rb_62_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_62_val \
    op interface \
    ports { rb_62_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2727 \
    name rb_63_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_63_val \
    op interface \
    ports { rb_63_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2728 \
    name rb_64_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_64_val \
    op interface \
    ports { rb_64_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2729 \
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
    id 2730 \
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
    id 2731 \
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
    id 2732 \
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
    id 2733 \
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
    id 2734 \
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
    id 2735 \
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
    id 2736 \
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
    id 2737 \
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
    id 2738 \
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
    id 2739 \
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
    id 2740 \
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
    id 2741 \
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
    id 2742 \
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
    id 2743 \
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
    id 2744 \
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
    id 2745 \
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
    id 2746 \
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
    id 2747 \
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
    id 2748 \
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
    id 2749 \
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
    id 2750 \
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
    id 2751 \
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
    id 2752 \
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
    id 2753 \
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
    id 2754 \
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
    id 2755 \
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
    id 2756 \
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
    id 2757 \
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
    id 2758 \
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
    id 2759 \
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
    id 2760 \
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
    id 2761 \
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
    id 2762 \
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
    id 2763 \
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
    id 2764 \
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
    id 2765 \
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
    id 2766 \
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
    id 2767 \
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
    id 2768 \
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
    id 2769 \
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
    id 2770 \
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
    id 2771 \
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
    id 2772 \
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
    id 2773 \
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
    id 2774 \
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
    id 2775 \
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
    id 2776 \
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
    id 2777 \
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
    id 2778 \
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
    id 2779 \
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
    id 2780 \
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
    id 2781 \
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
    id 2782 \
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
    id 2783 \
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
    id 2784 \
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
    id 2785 \
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
    id 2786 \
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
    id 2787 \
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
    id 2788 \
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
    id 2789 \
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
    id 2790 \
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
    id 2791 \
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
    id 2792 \
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
    id 2793 \
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
    id 2794 \
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
    id 2795 \
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
    id 2796 \
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
    id 2797 \
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
    id 2798 \
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
    id 2799 \
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
    id 2800 \
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
    id 2801 \
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
    id 2802 \
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
    id 2803 \
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
    id 2804 \
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
    id 2805 \
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
    id 2806 \
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
    id 2807 \
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
    id 2808 \
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
    id 2809 \
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
    id 2810 \
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
    id 2811 \
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
    id 2812 \
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
    id 2813 \
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
    id 2814 \
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
    id 2815 \
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
    id 2816 \
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
    id 2817 \
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
    id 2818 \
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
    id 2819 \
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
    id 2820 \
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
    id 2821 \
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
    id 2822 \
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
    id 2823 \
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
    id 2824 \
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
    id 2825 \
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
    id 2826 \
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
    id 2827 \
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
    id 2828 \
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
    id 2829 \
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
    id 2830 \
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
    id 2831 \
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
    id 2832 \
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
    id 2833 \
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
    id 2834 \
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
    id 2835 \
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
    id 2836 \
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
    id 2837 \
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
    id 2838 \
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
    id 2839 \
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
    id 2840 \
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
    id 2841 \
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
    id 2842 \
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
    id 2843 \
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
    id 2844 \
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
    id 2845 \
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
    id 2846 \
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
    id 2847 \
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
    id 2848 \
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
    id 2849 \
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
    id 2850 \
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
    id 2851 \
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
    id 2852 \
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
    id 2853 \
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
    id 2854 \
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
    id 2855 \
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
    id 2856 \
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
    id 2857 \
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
    id 2858 \
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
    id 2859 \
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
    id 2860 \
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
    id 2861 \
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
    id 2862 \
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
    id 2863 \
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
    id 2864 \
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
    id 2865 \
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
    id 2866 \
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
    id 2867 \
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
    id 2868 \
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
    id 2869 \
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
    id 2870 \
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
    id 2871 \
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
    id 2872 \
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
    id 2873 \
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
    id 2874 \
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
    id 2875 \
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
    id 2876 \
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
    id 2877 \
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
    id 2878 \
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
    id 2879 \
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
    id 2880 \
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
    id 2881 \
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
    id 2882 \
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
    id 2883 \
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
    id 2884 \
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
    id 2885 \
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
    id 2886 \
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
    id 2887 \
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
    id 2888 \
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
    id 2889 \
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
    id 2890 \
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
    id 2891 \
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
    id 2892 \
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
    id 2893 \
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
    id 2894 \
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
    id 2895 \
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
    id 2896 \
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
    id 2897 \
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
    id 2898 \
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
    id 2899 \
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
    id 2900 \
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
    id 2901 \
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
    id 2902 \
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
    id 2903 \
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
    id 2904 \
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
    id 2905 \
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
    id 2906 \
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
    id 2907 \
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
    id 2908 \
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
    id 2909 \
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
    id 2910 \
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
    id 2911 \
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
    id 2912 \
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
    id 2913 \
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
    id 2914 \
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
    id 2915 \
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
    id 2916 \
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
    id 2917 \
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
    id 2918 \
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
    id 2919 \
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
    id 2920 \
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
    id 2921 \
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
    id 2922 \
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
    id 2923 \
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
    id 2924 \
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
    id 2925 \
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
    id 2926 \
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
    id 2927 \
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
    id 2928 \
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
    id 2929 \
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
    id 2930 \
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
    id 2931 \
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
    id 2932 \
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
    id 2933 \
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
    id 2934 \
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
    id 2935 \
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
    id 2936 \
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
    id 2937 \
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
    id 2938 \
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
    id 2939 \
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
    id 2940 \
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
    id 2941 \
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
    id 2942 \
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
    id 2943 \
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
    id 2944 \
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
    id 2945 \
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
    id 2946 \
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
    id 2947 \
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
    id 2948 \
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
    id 2949 \
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
    id 2950 \
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
    id 2951 \
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
    id 2952 \
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
    id 2953 \
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
    id 2954 \
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
    id 2955 \
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
    id 2956 \
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
    id 2957 \
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
    id 2958 \
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
    id 2959 \
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
    id 2960 \
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
    id 2961 \
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
    id 2962 \
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
    id 2963 \
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
    id 2964 \
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
    id 2965 \
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
    id 2966 \
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
    id 2967 \
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
    id 2968 \
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
    id 2969 \
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
    id 2970 \
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
    id 2971 \
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
    id 2972 \
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
    id 2973 \
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
    id 2974 \
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
    id 2975 \
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
    id 2976 \
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
    id 2977 \
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
    id 2978 \
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
    id 2979 \
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
    id 2980 \
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
    id 2981 \
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
    id 2982 \
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
    id 2983 \
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
    id 2984 \
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
    id 2985 \
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
    id 2986 \
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
    id 2987 \
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
    id 2988 \
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
    id 2989 \
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
    id 2990 \
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
    id 2991 \
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
    id 2992 \
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
    id 2993 \
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
    id 2994 \
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
    id 2995 \
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
    id 2996 \
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
    id 2997 \
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
    id 2998 \
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
    id 2999 \
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
    id 3000 \
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
    id 3001 \
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
    id 3002 \
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
    id 3003 \
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
    id 3004 \
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
    id 3005 \
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
    id 3006 \
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
    id 3007 \
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
    id 3008 \
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
    id 3009 \
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
    id 3010 \
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
    id 3011 \
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
    id 3012 \
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
    id 3013 \
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
    id 3014 \
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
    id 3015 \
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
    id 3016 \
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
    id 3017 \
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
    id 3018 \
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
    id 3019 \
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
    id 3020 \
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
    id 3021 \
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
    id 3022 \
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
    id 3023 \
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
    id 3024 \
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
    id 3025 \
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
    id 3026 \
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
    id 3027 \
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
    id 3028 \
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
    id 3029 \
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
    id 3030 \
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
    id 3031 \
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
    id 3036 \
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
    id 3037 \
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


