# This script segment is generated automatically by AutoPilot

set name swiglu_fpext_32ns_64_2_no_dsp_1
if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $name BINDTYPE {op} TYPE {fpext} IMPL {auto} LATENCY 1 ALLOW_PRAGMA 1
}


set name swiglu_mul_50s_32s_80_5_1
if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $name BINDTYPE {op} TYPE {mul} IMPL {auto} LATENCY 4 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler swiglu_sparsemux_17_3_32_1_1 BINDTYPE {op} TYPE {sparsemux} IMPL {compactencoding_dontcare}
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
    id 1296 \
    name int_acc_w0_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_w0_load_reload \
    op interface \
    ports { int_acc_w0_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1297 \
    name int_acc_w0_4_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_w0_4_load_reload \
    op interface \
    ports { int_acc_w0_4_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1298 \
    name int_acc_w0_8_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_w0_8_load_reload \
    op interface \
    ports { int_acc_w0_8_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1299 \
    name int_acc_w0_12_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_w0_12_load_reload \
    op interface \
    ports { int_acc_w0_12_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1300 \
    name int_acc_w0_16_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_w0_16_load_reload \
    op interface \
    ports { int_acc_w0_16_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1301 \
    name int_acc_w0_20_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_w0_20_load_reload \
    op interface \
    ports { int_acc_w0_20_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1302 \
    name int_acc_w0_24_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_w0_24_load_reload \
    op interface \
    ports { int_acc_w0_24_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1303 \
    name int_acc_w0_28_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_w0_28_load_reload \
    op interface \
    ports { int_acc_w0_28_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1304 \
    name int_acc_m0_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_m0_load_reload \
    op interface \
    ports { int_acc_m0_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1305 \
    name int_acc_m0_4_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_m0_4_load_reload \
    op interface \
    ports { int_acc_m0_4_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1306 \
    name int_acc_m0_8_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_m0_8_load_reload \
    op interface \
    ports { int_acc_m0_8_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1307 \
    name int_acc_m0_12_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_m0_12_load_reload \
    op interface \
    ports { int_acc_m0_12_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1308 \
    name int_acc_m0_16_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_m0_16_load_reload \
    op interface \
    ports { int_acc_m0_16_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1309 \
    name int_acc_m0_20_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_m0_20_load_reload \
    op interface \
    ports { int_acc_m0_20_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1310 \
    name int_acc_m0_24_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_m0_24_load_reload \
    op interface \
    ports { int_acc_m0_24_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1311 \
    name int_acc_m0_28_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_m0_28_load_reload \
    op interface \
    ports { int_acc_m0_28_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1312 \
    name int_acc_w1_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_w1_load_reload \
    op interface \
    ports { int_acc_w1_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1313 \
    name int_acc_w1_4_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_w1_4_load_reload \
    op interface \
    ports { int_acc_w1_4_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1314 \
    name int_acc_w1_8_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_w1_8_load_reload \
    op interface \
    ports { int_acc_w1_8_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1315 \
    name int_acc_w1_12_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_w1_12_load_reload \
    op interface \
    ports { int_acc_w1_12_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1316 \
    name int_acc_w1_16_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_w1_16_load_reload \
    op interface \
    ports { int_acc_w1_16_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1317 \
    name int_acc_w1_20_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_w1_20_load_reload \
    op interface \
    ports { int_acc_w1_20_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1318 \
    name int_acc_w1_24_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_w1_24_load_reload \
    op interface \
    ports { int_acc_w1_24_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1319 \
    name int_acc_w1_28_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_w1_28_load_reload \
    op interface \
    ports { int_acc_w1_28_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1320 \
    name int_acc_m1_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_m1_load_reload \
    op interface \
    ports { int_acc_m1_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1321 \
    name int_acc_m1_4_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_m1_4_load_reload \
    op interface \
    ports { int_acc_m1_4_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1322 \
    name int_acc_m1_8_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_m1_8_load_reload \
    op interface \
    ports { int_acc_m1_8_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1323 \
    name int_acc_m1_12_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_m1_12_load_reload \
    op interface \
    ports { int_acc_m1_12_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1324 \
    name int_acc_m1_16_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_m1_16_load_reload \
    op interface \
    ports { int_acc_m1_16_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1325 \
    name int_acc_m1_20_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_m1_20_load_reload \
    op interface \
    ports { int_acc_m1_20_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1326 \
    name int_acc_m1_24_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_m1_24_load_reload \
    op interface \
    ports { int_acc_m1_24_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1327 \
    name int_acc_m1_28_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_m1_28_load_reload \
    op interface \
    ports { int_acc_m1_28_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1328 \
    name int_acc_w0_1_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_w0_1_load_reload \
    op interface \
    ports { int_acc_w0_1_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1329 \
    name int_acc_w0_5_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_w0_5_load_reload \
    op interface \
    ports { int_acc_w0_5_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1330 \
    name int_acc_w0_9_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_w0_9_load_reload \
    op interface \
    ports { int_acc_w0_9_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1331 \
    name int_acc_w0_13_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_w0_13_load_reload \
    op interface \
    ports { int_acc_w0_13_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1332 \
    name int_acc_w0_17_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_w0_17_load_reload \
    op interface \
    ports { int_acc_w0_17_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1333 \
    name int_acc_w0_21_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_w0_21_load_reload \
    op interface \
    ports { int_acc_w0_21_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1334 \
    name int_acc_w0_25_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_w0_25_load_reload \
    op interface \
    ports { int_acc_w0_25_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1335 \
    name int_acc_w0_29_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_w0_29_load_reload \
    op interface \
    ports { int_acc_w0_29_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1336 \
    name int_acc_m0_1_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_m0_1_load_reload \
    op interface \
    ports { int_acc_m0_1_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1337 \
    name int_acc_m0_5_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_m0_5_load_reload \
    op interface \
    ports { int_acc_m0_5_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1338 \
    name int_acc_m0_9_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_m0_9_load_reload \
    op interface \
    ports { int_acc_m0_9_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1339 \
    name int_acc_m0_13_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_m0_13_load_reload \
    op interface \
    ports { int_acc_m0_13_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1340 \
    name int_acc_m0_17_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_m0_17_load_reload \
    op interface \
    ports { int_acc_m0_17_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1341 \
    name int_acc_m0_21_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_m0_21_load_reload \
    op interface \
    ports { int_acc_m0_21_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1342 \
    name int_acc_m0_25_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_m0_25_load_reload \
    op interface \
    ports { int_acc_m0_25_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1343 \
    name int_acc_m0_29_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_m0_29_load_reload \
    op interface \
    ports { int_acc_m0_29_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1344 \
    name int_acc_w1_1_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_w1_1_load_reload \
    op interface \
    ports { int_acc_w1_1_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1345 \
    name int_acc_w1_5_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_w1_5_load_reload \
    op interface \
    ports { int_acc_w1_5_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1346 \
    name int_acc_w1_9_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_w1_9_load_reload \
    op interface \
    ports { int_acc_w1_9_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1347 \
    name int_acc_w1_13_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_w1_13_load_reload \
    op interface \
    ports { int_acc_w1_13_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1348 \
    name int_acc_w1_17_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_w1_17_load_reload \
    op interface \
    ports { int_acc_w1_17_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1349 \
    name int_acc_w1_21_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_w1_21_load_reload \
    op interface \
    ports { int_acc_w1_21_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1350 \
    name int_acc_w1_25_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_w1_25_load_reload \
    op interface \
    ports { int_acc_w1_25_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1351 \
    name int_acc_w1_29_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_w1_29_load_reload \
    op interface \
    ports { int_acc_w1_29_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1352 \
    name int_acc_m1_1_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_m1_1_load_reload \
    op interface \
    ports { int_acc_m1_1_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1353 \
    name int_acc_m1_5_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_m1_5_load_reload \
    op interface \
    ports { int_acc_m1_5_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1354 \
    name int_acc_m1_9_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_m1_9_load_reload \
    op interface \
    ports { int_acc_m1_9_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1355 \
    name int_acc_m1_13_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_m1_13_load_reload \
    op interface \
    ports { int_acc_m1_13_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1356 \
    name int_acc_m1_17_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_m1_17_load_reload \
    op interface \
    ports { int_acc_m1_17_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1357 \
    name int_acc_m1_21_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_m1_21_load_reload \
    op interface \
    ports { int_acc_m1_21_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1358 \
    name int_acc_m1_25_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_m1_25_load_reload \
    op interface \
    ports { int_acc_m1_25_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1359 \
    name int_acc_m1_29_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_m1_29_load_reload \
    op interface \
    ports { int_acc_m1_29_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1360 \
    name int_acc_w0_2_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_w0_2_load_reload \
    op interface \
    ports { int_acc_w0_2_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1361 \
    name int_acc_w0_6_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_w0_6_load_reload \
    op interface \
    ports { int_acc_w0_6_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1362 \
    name int_acc_w0_10_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_w0_10_load_reload \
    op interface \
    ports { int_acc_w0_10_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1363 \
    name int_acc_w0_14_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_w0_14_load_reload \
    op interface \
    ports { int_acc_w0_14_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1364 \
    name int_acc_w0_18_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_w0_18_load_reload \
    op interface \
    ports { int_acc_w0_18_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1365 \
    name int_acc_w0_22_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_w0_22_load_reload \
    op interface \
    ports { int_acc_w0_22_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1366 \
    name int_acc_w0_26_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_w0_26_load_reload \
    op interface \
    ports { int_acc_w0_26_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1367 \
    name int_acc_w0_30_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_w0_30_load_reload \
    op interface \
    ports { int_acc_w0_30_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1368 \
    name int_acc_m0_2_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_m0_2_load_reload \
    op interface \
    ports { int_acc_m0_2_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1369 \
    name int_acc_m0_6_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_m0_6_load_reload \
    op interface \
    ports { int_acc_m0_6_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1370 \
    name int_acc_m0_10_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_m0_10_load_reload \
    op interface \
    ports { int_acc_m0_10_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1371 \
    name int_acc_m0_14_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_m0_14_load_reload \
    op interface \
    ports { int_acc_m0_14_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1372 \
    name int_acc_m0_18_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_m0_18_load_reload \
    op interface \
    ports { int_acc_m0_18_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1373 \
    name int_acc_m0_22_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_m0_22_load_reload \
    op interface \
    ports { int_acc_m0_22_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1374 \
    name int_acc_m0_26_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_m0_26_load_reload \
    op interface \
    ports { int_acc_m0_26_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1375 \
    name int_acc_m0_30_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_m0_30_load_reload \
    op interface \
    ports { int_acc_m0_30_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1376 \
    name int_acc_w1_2_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_w1_2_load_reload \
    op interface \
    ports { int_acc_w1_2_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1377 \
    name int_acc_w1_6_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_w1_6_load_reload \
    op interface \
    ports { int_acc_w1_6_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1378 \
    name int_acc_w1_10_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_w1_10_load_reload \
    op interface \
    ports { int_acc_w1_10_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1379 \
    name int_acc_w1_14_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_w1_14_load_reload \
    op interface \
    ports { int_acc_w1_14_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1380 \
    name int_acc_w1_18_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_w1_18_load_reload \
    op interface \
    ports { int_acc_w1_18_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1381 \
    name int_acc_w1_22_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_w1_22_load_reload \
    op interface \
    ports { int_acc_w1_22_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1382 \
    name int_acc_w1_26_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_w1_26_load_reload \
    op interface \
    ports { int_acc_w1_26_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1383 \
    name int_acc_w1_30_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_w1_30_load_reload \
    op interface \
    ports { int_acc_w1_30_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1384 \
    name int_acc_m1_2_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_m1_2_load_reload \
    op interface \
    ports { int_acc_m1_2_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1385 \
    name int_acc_m1_6_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_m1_6_load_reload \
    op interface \
    ports { int_acc_m1_6_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1386 \
    name int_acc_m1_10_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_m1_10_load_reload \
    op interface \
    ports { int_acc_m1_10_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1387 \
    name int_acc_m1_14_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_m1_14_load_reload \
    op interface \
    ports { int_acc_m1_14_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1388 \
    name int_acc_m1_18_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_m1_18_load_reload \
    op interface \
    ports { int_acc_m1_18_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1389 \
    name int_acc_m1_22_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_m1_22_load_reload \
    op interface \
    ports { int_acc_m1_22_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1390 \
    name int_acc_m1_26_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_m1_26_load_reload \
    op interface \
    ports { int_acc_m1_26_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1391 \
    name int_acc_m1_30_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_m1_30_load_reload \
    op interface \
    ports { int_acc_m1_30_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1392 \
    name int_acc_w0_3_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_w0_3_load_reload \
    op interface \
    ports { int_acc_w0_3_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1393 \
    name int_acc_w0_7_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_w0_7_load_reload \
    op interface \
    ports { int_acc_w0_7_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1394 \
    name int_acc_w0_11_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_w0_11_load_reload \
    op interface \
    ports { int_acc_w0_11_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1395 \
    name int_acc_w0_15_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_w0_15_load_reload \
    op interface \
    ports { int_acc_w0_15_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1396 \
    name int_acc_w0_19_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_w0_19_load_reload \
    op interface \
    ports { int_acc_w0_19_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1397 \
    name int_acc_w0_23_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_w0_23_load_reload \
    op interface \
    ports { int_acc_w0_23_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1398 \
    name int_acc_w0_27_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_w0_27_load_reload \
    op interface \
    ports { int_acc_w0_27_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1399 \
    name int_acc_w0_31_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_w0_31_load_reload \
    op interface \
    ports { int_acc_w0_31_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1400 \
    name int_acc_m0_3_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_m0_3_load_reload \
    op interface \
    ports { int_acc_m0_3_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1401 \
    name int_acc_m0_7_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_m0_7_load_reload \
    op interface \
    ports { int_acc_m0_7_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1402 \
    name int_acc_m0_11_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_m0_11_load_reload \
    op interface \
    ports { int_acc_m0_11_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1403 \
    name int_acc_m0_15_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_m0_15_load_reload \
    op interface \
    ports { int_acc_m0_15_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1404 \
    name int_acc_m0_19_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_m0_19_load_reload \
    op interface \
    ports { int_acc_m0_19_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1405 \
    name int_acc_m0_23_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_m0_23_load_reload \
    op interface \
    ports { int_acc_m0_23_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1406 \
    name int_acc_m0_27_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_m0_27_load_reload \
    op interface \
    ports { int_acc_m0_27_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1407 \
    name int_acc_m0_31_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_m0_31_load_reload \
    op interface \
    ports { int_acc_m0_31_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1408 \
    name int_acc_w1_3_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_w1_3_load_reload \
    op interface \
    ports { int_acc_w1_3_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1409 \
    name int_acc_w1_7_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_w1_7_load_reload \
    op interface \
    ports { int_acc_w1_7_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1410 \
    name int_acc_w1_11_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_w1_11_load_reload \
    op interface \
    ports { int_acc_w1_11_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1411 \
    name int_acc_w1_15_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_w1_15_load_reload \
    op interface \
    ports { int_acc_w1_15_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1412 \
    name int_acc_w1_19_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_w1_19_load_reload \
    op interface \
    ports { int_acc_w1_19_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1413 \
    name int_acc_w1_23_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_w1_23_load_reload \
    op interface \
    ports { int_acc_w1_23_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1414 \
    name int_acc_w1_27_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_w1_27_load_reload \
    op interface \
    ports { int_acc_w1_27_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1415 \
    name int_acc_w1_31_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_w1_31_load_reload \
    op interface \
    ports { int_acc_w1_31_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1416 \
    name int_acc_m1_3_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_m1_3_load_reload \
    op interface \
    ports { int_acc_m1_3_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1417 \
    name int_acc_m1_7_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_m1_7_load_reload \
    op interface \
    ports { int_acc_m1_7_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1418 \
    name int_acc_m1_11_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_m1_11_load_reload \
    op interface \
    ports { int_acc_m1_11_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1419 \
    name int_acc_m1_15_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_m1_15_load_reload \
    op interface \
    ports { int_acc_m1_15_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1420 \
    name int_acc_m1_19_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_m1_19_load_reload \
    op interface \
    ports { int_acc_m1_19_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1421 \
    name int_acc_m1_23_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_m1_23_load_reload \
    op interface \
    ports { int_acc_m1_23_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1422 \
    name int_acc_m1_27_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_m1_27_load_reload \
    op interface \
    ports { int_acc_m1_27_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1423 \
    name int_acc_m1_31_load_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_int_acc_m1_31_load_reload \
    op interface \
    ports { int_acc_m1_31_load_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1424 \
    name mux_case_09851_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_09851_reload \
    op interface \
    ports { mux_case_09851_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1425 \
    name mux_case_19864_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_19864_reload \
    op interface \
    ports { mux_case_19864_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1426 \
    name mux_case_29877_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_29877_reload \
    op interface \
    ports { mux_case_29877_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1427 \
    name mux_case_398810_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_398810_reload \
    op interface \
    ports { mux_case_398810_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1428 \
    name mux_case_498913_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_498913_reload \
    op interface \
    ports { mux_case_498913_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1429 \
    name mux_case_599016_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_599016_reload \
    op interface \
    ports { mux_case_599016_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1430 \
    name mux_case_699119_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_699119_reload \
    op interface \
    ports { mux_case_699119_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1431 \
    name mux_case_799222_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_799222_reload \
    op interface \
    ports { mux_case_799222_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1432 \
    name mux_case_099326_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_099326_reload \
    op interface \
    ports { mux_case_099326_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1433 \
    name mux_case_199429_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_199429_reload \
    op interface \
    ports { mux_case_199429_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1434 \
    name mux_case_299532_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_299532_reload \
    op interface \
    ports { mux_case_299532_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1435 \
    name mux_case_399635_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_399635_reload \
    op interface \
    ports { mux_case_399635_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1436 \
    name mux_case_499738_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_499738_reload \
    op interface \
    ports { mux_case_499738_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1437 \
    name mux_case_599841_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_599841_reload \
    op interface \
    ports { mux_case_599841_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1438 \
    name mux_case_699944_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_699944_reload \
    op interface \
    ports { mux_case_699944_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1439 \
    name mux_case_7100047_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_7100047_reload \
    op interface \
    ports { mux_case_7100047_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1440 \
    name mux_case_0100150_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_0100150_reload \
    op interface \
    ports { mux_case_0100150_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1441 \
    name mux_case_1100253_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_1100253_reload \
    op interface \
    ports { mux_case_1100253_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1442 \
    name mux_case_2100356_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_2100356_reload \
    op interface \
    ports { mux_case_2100356_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1443 \
    name mux_case_3100459_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_3100459_reload \
    op interface \
    ports { mux_case_3100459_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1444 \
    name mux_case_4100562_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_4100562_reload \
    op interface \
    ports { mux_case_4100562_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1445 \
    name mux_case_5100665_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_5100665_reload \
    op interface \
    ports { mux_case_5100665_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1446 \
    name mux_case_6100768_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_6100768_reload \
    op interface \
    ports { mux_case_6100768_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1447 \
    name mux_case_7100871_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_7100871_reload \
    op interface \
    ports { mux_case_7100871_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1448 \
    name mux_case_0100974_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_0100974_reload \
    op interface \
    ports { mux_case_0100974_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1449 \
    name mux_case_1101077_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_1101077_reload \
    op interface \
    ports { mux_case_1101077_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1450 \
    name mux_case_2101180_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_2101180_reload \
    op interface \
    ports { mux_case_2101180_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1451 \
    name mux_case_3101283_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_3101283_reload \
    op interface \
    ports { mux_case_3101283_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1452 \
    name mux_case_4101386_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_4101386_reload \
    op interface \
    ports { mux_case_4101386_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1453 \
    name mux_case_5101489_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_5101489_reload \
    op interface \
    ports { mux_case_5101489_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1454 \
    name mux_case_6101592_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_6101592_reload \
    op interface \
    ports { mux_case_6101592_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1455 \
    name mux_case_7101695_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_7101695_reload \
    op interface \
    ports { mux_case_7101695_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1456 \
    name total1_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_total1_out \
    op interface \
    ports { total1_out { O 56 vector } total1_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1457 \
    name total0_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_total0_out \
    op interface \
    ports { total0_out { O 56 vector } total0_out_ap_vld { O 1 bit } } \
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


