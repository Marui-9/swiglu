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
	::AP::rtl_comp_handler swiglu_sparsemux_9_3_32_1_1 BINDTYPE {op} TYPE {sparsemux} IMPL {compactencoding_dontcare}
}


# clear list
if {${::AESL::PGuard_autoexp_gen}} {
    cg_default_interface_gen_dc_begin
    cg_default_interface_gen_bundle_begin
    AESL_LIB_XILADAPTER::native_axis_begin
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 799 \
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
    id 800 \
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
    id 801 \
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
    id 802 \
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
    id 803 \
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
    id 804 \
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
    id 805 \
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
    id 806 \
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
    id 807 \
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
    id 808 \
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
    id 809 \
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
    id 810 \
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
    id 811 \
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
    id 812 \
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
    id 813 \
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
    id 814 \
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
    id 815 \
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
    id 816 \
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
    id 817 \
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
    id 818 \
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
    id 819 \
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
    id 820 \
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
    id 821 \
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
    id 822 \
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
    id 823 \
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
    id 824 \
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
    id 825 \
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
    id 826 \
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
    id 827 \
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
    id 828 \
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
    id 829 \
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
    id 830 \
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
    id 831 \
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
    id 832 \
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
    id 833 \
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
    id 834 \
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
    id 835 \
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
    id 836 \
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
    id 837 \
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
    id 838 \
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
    id 839 \
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
    id 840 \
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
    id 841 \
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
    id 842 \
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
    id 843 \
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
    id 844 \
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
    id 845 \
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
    id 846 \
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
    id 847 \
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
    id 848 \
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
    id 849 \
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
    id 850 \
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
    id 851 \
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
    id 852 \
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
    id 853 \
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
    id 854 \
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
    id 855 \
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
    id 856 \
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
    id 857 \
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
    id 858 \
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
    id 859 \
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
    id 860 \
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
    id 861 \
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
    id 862 \
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
    id 863 \
    name d \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_d \
    op interface \
    ports { d { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 864 \
    name d_2 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_d_2 \
    op interface \
    ports { d_2 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 865 \
    name d_4 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_d_4 \
    op interface \
    ports { d_4 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 866 \
    name d_6 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_d_6 \
    op interface \
    ports { d_6 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 867 \
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
    id 868 \
    name dmin \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_dmin \
    op interface \
    ports { dmin { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 869 \
    name dmin_2 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_dmin_2 \
    op interface \
    ports { dmin_2 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 870 \
    name dmin_4 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_dmin_4 \
    op interface \
    ports { dmin_4 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 871 \
    name dmin_6 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_dmin_6 \
    op interface \
    ports { dmin_6 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 872 \
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
    id 873 \
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
    id 874 \
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
    id 875 \
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
    id 876 \
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
    id 877 \
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
    id 878 \
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
    id 879 \
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
    id 880 \
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
    id 881 \
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
    id 882 \
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
    id 883 \
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
    id 884 \
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
    id 885 \
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
    id 886 \
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
    id 887 \
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
    id 888 \
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
    id 889 \
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
    id 890 \
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
    id 891 \
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
    id 892 \
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
    id 893 \
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
    id 894 \
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
    id 895 \
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
    id 896 \
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
    id 897 \
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
    id 898 \
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
    id 899 \
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
    id 900 \
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
    id 901 \
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
    id 902 \
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
    id 903 \
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
    id 904 \
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
    id 905 \
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
    id 906 \
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
    id 907 \
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
    id 908 \
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
    id 909 \
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
    id 910 \
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
    id 911 \
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
    id 912 \
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
    id 913 \
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
    id 914 \
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
    id 915 \
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
    id 916 \
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
    id 917 \
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
    id 918 \
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
    id 919 \
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
    id 920 \
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
    id 921 \
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
    id 922 \
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
    id 923 \
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
    id 924 \
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
    id 925 \
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
    id 926 \
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
    id 927 \
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
    id 928 \
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
    id 929 \
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
    id 930 \
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
    id 931 \
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
    id 932 \
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
    id 933 \
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
    id 934 \
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
    id 935 \
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
    id 936 \
    name d_1 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_d_1 \
    op interface \
    ports { d_1 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 937 \
    name d_3 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_d_3 \
    op interface \
    ports { d_3 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 938 \
    name d_5 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_d_5 \
    op interface \
    ports { d_5 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 939 \
    name d_7 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_d_7 \
    op interface \
    ports { d_7 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 940 \
    name dmin_1 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_dmin_1 \
    op interface \
    ports { dmin_1 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 941 \
    name dmin_3 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_dmin_3 \
    op interface \
    ports { dmin_3 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 942 \
    name dmin_5 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_dmin_5 \
    op interface \
    ports { dmin_5 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 943 \
    name dmin_7 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_dmin_7 \
    op interface \
    ports { dmin_7 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 944 \
    name total_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_total_out \
    op interface \
    ports { total_out { O 32 vector } total_out_ap_vld { O 1 bit } } \
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


