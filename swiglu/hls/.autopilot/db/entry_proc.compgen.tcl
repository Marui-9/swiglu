# This script segment is generated automatically by AutoPilot

# clear list
if {${::AESL::PGuard_autoexp_gen}} {
    cg_default_interface_gen_dc_begin
    cg_default_interface_gen_bundle_begin
    AESL_LIB_XILADAPTER::native_axis_begin
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1 \
    name W \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_W \
    op interface \
    ports { W { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2 \
    name W_c \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_W_c \
    op interface \
    ports { W_c_din { O 8 vector } W_c_full_n { I 1 bit } W_c_write { O 1 bit } W_c_num_data_valid { I 3 vector } W_c_fifo_cap { I 3 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3 \
    name V \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_V \
    op interface \
    ports { V { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4 \
    name V_c \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_V_c \
    op interface \
    ports { V_c_din { O 8 vector } V_c_full_n { I 1 bit } V_c_write { O 1 bit } V_c_num_data_valid { I 3 vector } V_c_fifo_cap { I 3 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5 \
    name W_down \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_W_down \
    op interface \
    ports { W_down { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 6 \
    name W_down_c \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_W_down_c \
    op interface \
    ports { W_down_c_din { O 8 vector } W_down_c_full_n { I 1 bit } W_down_c_write { O 1 bit } W_down_c_num_data_valid { I 4 vector } W_down_c_fifo_cap { I 4 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 7 \
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
    id 8 \
    name out_batch_c \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_out_batch_c \
    op interface \
    ports { out_batch_c_din { O 64 vector } out_batch_c_full_n { I 1 bit } out_batch_c_write { O 1 bit } out_batch_c_num_data_valid { I 4 vector } out_batch_c_fifo_cap { I 4 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 9 \
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
    id 10 \
    name down_quant_mode_c \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_down_quant_mode_c \
    op interface \
    ports { down_quant_mode_c_din { O 32 vector } down_quant_mode_c_full_n { I 1 bit } down_quant_mode_c_write { O 1 bit } down_quant_mode_c_num_data_valid { I 4 vector } down_quant_mode_c_fifo_cap { I 4 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 11 \
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
    id 12 \
    name x_scale_c \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_x_scale_c \
    op interface \
    ports { x_scale_c_din { O 32 vector } x_scale_c_full_n { I 1 bit } x_scale_c_write { O 1 bit } x_scale_c_num_data_valid { I 3 vector } x_scale_c_fifo_cap { I 3 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 13 \
    name x_scale_c1 \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_x_scale_c1 \
    op interface \
    ports { x_scale_c1_din { O 32 vector } x_scale_c1_full_n { I 1 bit } x_scale_c1_write { O 1 bit } x_scale_c1_num_data_valid { I 3 vector } x_scale_c1_fifo_cap { I 3 vector } } \
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


