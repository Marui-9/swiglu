# This script segment is generated automatically by AutoPilot

if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler swiglu_sparsemux_649_9_8_1_1 BINDTYPE {op} TYPE {sparsemux} IMPL {compactencoding_dontcare}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler swiglu_sparsemux_641_9_8_1_1 BINDTYPE {op} TYPE {sparsemux} IMPL {compactencoding_dontcare}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler swiglu_sparsemux_635_9_8_1_1 BINDTYPE {op} TYPE {sparsemux} IMPL {compactencoding_dontcare}
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
    id 2279 \
    name gate_1 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename gate_1 \
    op interface \
    ports { gate_1_address0 { O 8 vector } gate_1_ce0 { O 1 bit } gate_1_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'gate_1'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2280 \
    name gate_9 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename gate_9 \
    op interface \
    ports { gate_9_address0 { O 8 vector } gate_9_ce0 { O 1 bit } gate_9_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'gate_9'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2281 \
    name gate_17 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename gate_17 \
    op interface \
    ports { gate_17_address0 { O 8 vector } gate_17_ce0 { O 1 bit } gate_17_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'gate_17'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2282 \
    name gate_25 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename gate_25 \
    op interface \
    ports { gate_25_address0 { O 8 vector } gate_25_ce0 { O 1 bit } gate_25_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'gate_25'"
}
}


# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1941 \
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
    id 1942 \
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
    id 1943 \
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
    id 1944 \
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
    id 1945 \
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
    id 1946 \
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
    id 1947 \
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
    id 1948 \
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
    id 1949 \
    name empty_36 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_empty_36 \
    op interface \
    ports { empty_36 { I 13 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1950 \
    name rb_13_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_13_val \
    op interface \
    ports { rb_13_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1951 \
    name rb_14_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_14_val \
    op interface \
    ports { rb_14_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1952 \
    name rb_15_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_15_val \
    op interface \
    ports { rb_15_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1953 \
    name rb_16_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_16_val \
    op interface \
    ports { rb_16_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1954 \
    name rb_17_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_17_val \
    op interface \
    ports { rb_17_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1955 \
    name rb_18_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_18_val \
    op interface \
    ports { rb_18_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1956 \
    name rb_19_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_19_val \
    op interface \
    ports { rb_19_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1957 \
    name rb_20_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_20_val \
    op interface \
    ports { rb_20_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1958 \
    name rb_21_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_21_val \
    op interface \
    ports { rb_21_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1959 \
    name rb_22_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_22_val \
    op interface \
    ports { rb_22_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1960 \
    name rb_23_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_23_val \
    op interface \
    ports { rb_23_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1961 \
    name rb_24_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_24_val \
    op interface \
    ports { rb_24_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1962 \
    name rb_25_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_25_val \
    op interface \
    ports { rb_25_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1963 \
    name rb_26_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_26_val \
    op interface \
    ports { rb_26_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1964 \
    name rb_27_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_27_val \
    op interface \
    ports { rb_27_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1965 \
    name rb_28_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_28_val \
    op interface \
    ports { rb_28_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1966 \
    name rb_29_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_29_val \
    op interface \
    ports { rb_29_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1967 \
    name rb_30_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_30_val \
    op interface \
    ports { rb_30_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1968 \
    name rb_31_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_31_val \
    op interface \
    ports { rb_31_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1969 \
    name rb_32_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_32_val \
    op interface \
    ports { rb_32_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1970 \
    name rb_33_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_33_val \
    op interface \
    ports { rb_33_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1971 \
    name rb_34_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_34_val \
    op interface \
    ports { rb_34_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1972 \
    name rb_35_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_35_val \
    op interface \
    ports { rb_35_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1973 \
    name rb_36_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_36_val \
    op interface \
    ports { rb_36_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1974 \
    name rb_37_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_37_val \
    op interface \
    ports { rb_37_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1975 \
    name rb_38_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_rb_38_val \
    op interface \
    ports { rb_38_val { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1976 \
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
    id 1977 \
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
    id 1978 \
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
    id 1979 \
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
    id 1980 \
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
    id 1981 \
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
    id 1982 \
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
    id 1983 \
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
    id 1984 \
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
    id 1985 \
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
    id 1986 \
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
    id 1987 \
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
    id 1988 \
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
    id 1989 \
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
    id 1990 \
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
    id 1991 \
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
    id 1992 \
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
    id 1993 \
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
    id 1994 \
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
    id 1995 \
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
    id 1996 \
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
    id 1997 \
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
    id 1998 \
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
    id 1999 \
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
    id 2000 \
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
    id 2001 \
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
    id 2002 \
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
    id 2003 \
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
    id 2004 \
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
    id 2005 \
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
    id 2006 \
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
    id 2007 \
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
    id 2008 \
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
    id 2009 \
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
    id 2010 \
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
    id 2011 \
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
    id 2012 \
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
    id 2013 \
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
    id 2014 \
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
    id 2015 \
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
    id 2016 \
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
    id 2017 \
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
    id 2018 \
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
    id 2019 \
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
    id 2020 \
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
    id 2021 \
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
    id 2022 \
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
    id 2023 \
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
    id 2024 \
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
    id 2025 \
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
    id 2026 \
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
    id 2027 \
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
    id 2028 \
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
    id 2029 \
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
    id 2030 \
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
    id 2031 \
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
    id 2032 \
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
    id 2033 \
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
    id 2034 \
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
    id 2035 \
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
    id 2036 \
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
    id 2037 \
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
    id 2038 \
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
    id 2039 \
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
    id 2040 \
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
    id 2041 \
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
    id 2042 \
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
    id 2043 \
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
    id 2044 \
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
    id 2045 \
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
    id 2046 \
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
    id 2047 \
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
    id 2048 \
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
    id 2049 \
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
    id 2050 \
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
    id 2051 \
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
    id 2052 \
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
    id 2053 \
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
    id 2054 \
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
    id 2055 \
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
    id 2056 \
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
    id 2057 \
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
    id 2058 \
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
    id 2059 \
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
    id 2060 \
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
    id 2061 \
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
    id 2062 \
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
    id 2063 \
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
    id 2064 \
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
    id 2065 \
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
    id 2066 \
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
    id 2067 \
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
    id 2068 \
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
    id 2069 \
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
    id 2070 \
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
    id 2071 \
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
    id 2072 \
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
    id 2073 \
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
    id 2074 \
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
    id 2075 \
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
    id 2076 \
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
    id 2077 \
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
    id 2078 \
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
    id 2079 \
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
    id 2080 \
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
    id 2081 \
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
    id 2082 \
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
    id 2083 \
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
    id 2084 \
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
    id 2085 \
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
    id 2086 \
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
    id 2087 \
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
    id 2088 \
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
    id 2089 \
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
    id 2090 \
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
    id 2091 \
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
    id 2092 \
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
    id 2093 \
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
    id 2094 \
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
    id 2095 \
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
    id 2096 \
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
    id 2097 \
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
    id 2098 \
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
    id 2099 \
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
    id 2100 \
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
    id 2101 \
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
    id 2102 \
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
    id 2103 \
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
    id 2104 \
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
    id 2105 \
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
    id 2106 \
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
    id 2107 \
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
    id 2108 \
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
    id 2109 \
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
    id 2110 \
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
    id 2111 \
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
    id 2112 \
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
    id 2113 \
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
    id 2114 \
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
    id 2115 \
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
    id 2116 \
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
    id 2117 \
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
    id 2118 \
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
    id 2119 \
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
    id 2120 \
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
    id 2121 \
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
    id 2122 \
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
    id 2123 \
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
    id 2124 \
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
    id 2125 \
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
    id 2126 \
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
    id 2127 \
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
    id 2128 \
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
    id 2129 \
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
    id 2130 \
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
    id 2131 \
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
    id 2132 \
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
    id 2133 \
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
    id 2134 \
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
    id 2135 \
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
    id 2136 \
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
    id 2137 \
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
    id 2138 \
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
    id 2139 \
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
    id 2140 \
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
    id 2141 \
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
    id 2142 \
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
    id 2143 \
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
    id 2144 \
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
    id 2145 \
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
    id 2146 \
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
    id 2147 \
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
    id 2148 \
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
    id 2149 \
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
    id 2150 \
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
    id 2151 \
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
    id 2152 \
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
    id 2153 \
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
    id 2154 \
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
    id 2155 \
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
    id 2156 \
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
    id 2157 \
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
    id 2158 \
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
    id 2159 \
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
    id 2160 \
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
    id 2161 \
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
    id 2162 \
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
    id 2163 \
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
    id 2164 \
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
    id 2165 \
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
    id 2166 \
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
    id 2167 \
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
    id 2168 \
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
    id 2169 \
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
    id 2170 \
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
    id 2171 \
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
    id 2172 \
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
    id 2173 \
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
    id 2174 \
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
    id 2175 \
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
    id 2176 \
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
    id 2177 \
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
    id 2178 \
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
    id 2179 \
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
    id 2180 \
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
    id 2181 \
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
    id 2182 \
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
    id 2183 \
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
    id 2184 \
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
    id 2185 \
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
    id 2186 \
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
    id 2187 \
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
    id 2188 \
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
    id 2189 \
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
    id 2190 \
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
    id 2191 \
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
    id 2192 \
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
    id 2193 \
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
    id 2194 \
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
    id 2195 \
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
    id 2196 \
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
    id 2197 \
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
    id 2198 \
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
    id 2199 \
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
    id 2200 \
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
    id 2201 \
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
    id 2202 \
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
    id 2203 \
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
    id 2204 \
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
    id 2205 \
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
    id 2206 \
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
    id 2207 \
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
    id 2208 \
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
    id 2209 \
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
    id 2210 \
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
    id 2211 \
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
    id 2212 \
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
    id 2213 \
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
    id 2214 \
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
    id 2215 \
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
    id 2216 \
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
    id 2217 \
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
    id 2218 \
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
    id 2219 \
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
    id 2220 \
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
    id 2221 \
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
    id 2222 \
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
    id 2223 \
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
    id 2224 \
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
    id 2225 \
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
    id 2226 \
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
    id 2227 \
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
    id 2228 \
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
    id 2229 \
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
    id 2230 \
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
    id 2231 \
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
    id 2232 \
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
    id 2233 \
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
    id 2234 \
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
    id 2235 \
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
    id 2236 \
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
    id 2237 \
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
    id 2238 \
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
    id 2239 \
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
    id 2240 \
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
    id 2241 \
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
    id 2242 \
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
    id 2243 \
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
    id 2244 \
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
    id 2245 \
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
    id 2246 \
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
    id 2247 \
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
    id 2248 \
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
    id 2249 \
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
    id 2250 \
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
    id 2251 \
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
    id 2252 \
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
    id 2253 \
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
    id 2254 \
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
    id 2255 \
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
    id 2256 \
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
    id 2257 \
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
    id 2258 \
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
    id 2259 \
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
    id 2260 \
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
    id 2261 \
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
    id 2262 \
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
    id 2263 \
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
    id 2264 \
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
    id 2265 \
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
    id 2266 \
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
    id 2267 \
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
    id 2268 \
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
    id 2269 \
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
    id 2270 \
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
    id 2271 \
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
    id 2272 \
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
    id 2273 \
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
    id 2274 \
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
    id 2275 \
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
    id 2276 \
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
    id 2277 \
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
    id 2278 \
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
    id 2283 \
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
    id 2284 \
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


