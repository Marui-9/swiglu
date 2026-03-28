
    wire dl_reset;
    wire dl_clock;
    assign dl_reset = ap_rst_n;
    assign dl_clock = ap_clk;
    wire [3:0] proc_0_data_FIFO_blk;
    wire [3:0] proc_0_data_PIPO_blk;
    wire [3:0] proc_0_start_FIFO_blk;
    wire [3:0] proc_0_TLF_FIFO_blk;
    wire [3:0] proc_0_input_sync_blk;
    wire [3:0] proc_0_output_sync_blk;
    wire [3:0] proc_dep_vld_vec_0;
    reg [3:0] proc_dep_vld_vec_0_reg;
    wire [3:0] in_chan_dep_vld_vec_0;
    wire [23:0] in_chan_dep_data_vec_0;
    wire [3:0] token_in_vec_0;
    wire [3:0] out_chan_dep_vld_vec_0;
    wire [5:0] out_chan_dep_data_0;
    wire [3:0] token_out_vec_0;
    wire dl_detect_out_0;
    wire dep_chan_vld_1_0;
    wire [5:0] dep_chan_data_1_0;
    wire token_1_0;
    wire dep_chan_vld_2_0;
    wire [5:0] dep_chan_data_2_0;
    wire token_2_0;
    wire dep_chan_vld_3_0;
    wire [5:0] dep_chan_data_3_0;
    wire token_3_0;
    wire dep_chan_vld_5_0;
    wire [5:0] dep_chan_data_5_0;
    wire token_5_0;
    wire [2:0] proc_1_data_FIFO_blk;
    wire [2:0] proc_1_data_PIPO_blk;
    wire [2:0] proc_1_start_FIFO_blk;
    wire [2:0] proc_1_TLF_FIFO_blk;
    wire [2:0] proc_1_input_sync_blk;
    wire [2:0] proc_1_output_sync_blk;
    wire [2:0] proc_dep_vld_vec_1;
    reg [2:0] proc_dep_vld_vec_1_reg;
    wire [2:0] in_chan_dep_vld_vec_1;
    wire [17:0] in_chan_dep_data_vec_1;
    wire [2:0] token_in_vec_1;
    wire [2:0] out_chan_dep_vld_vec_1;
    wire [5:0] out_chan_dep_data_1;
    wire [2:0] token_out_vec_1;
    wire dl_detect_out_1;
    wire dep_chan_vld_0_1;
    wire [5:0] dep_chan_data_0_1;
    wire token_0_1;
    wire dep_chan_vld_2_1;
    wire [5:0] dep_chan_data_2_1;
    wire token_2_1;
    wire dep_chan_vld_3_1;
    wire [5:0] dep_chan_data_3_1;
    wire token_3_1;
    wire [2:0] proc_2_data_FIFO_blk;
    wire [2:0] proc_2_data_PIPO_blk;
    wire [2:0] proc_2_start_FIFO_blk;
    wire [2:0] proc_2_TLF_FIFO_blk;
    wire [2:0] proc_2_input_sync_blk;
    wire [2:0] proc_2_output_sync_blk;
    wire [2:0] proc_dep_vld_vec_2;
    reg [2:0] proc_dep_vld_vec_2_reg;
    wire [2:0] in_chan_dep_vld_vec_2;
    wire [17:0] in_chan_dep_data_vec_2;
    wire [2:0] token_in_vec_2;
    wire [2:0] out_chan_dep_vld_vec_2;
    wire [5:0] out_chan_dep_data_2;
    wire [2:0] token_out_vec_2;
    wire dl_detect_out_2;
    wire dep_chan_vld_0_2;
    wire [5:0] dep_chan_data_0_2;
    wire token_0_2;
    wire dep_chan_vld_1_2;
    wire [5:0] dep_chan_data_1_2;
    wire token_1_2;
    wire dep_chan_vld_4_2;
    wire [5:0] dep_chan_data_4_2;
    wire token_4_2;
    wire [2:0] proc_3_data_FIFO_blk;
    wire [2:0] proc_3_data_PIPO_blk;
    wire [2:0] proc_3_start_FIFO_blk;
    wire [2:0] proc_3_TLF_FIFO_blk;
    wire [2:0] proc_3_input_sync_blk;
    wire [2:0] proc_3_output_sync_blk;
    wire [2:0] proc_dep_vld_vec_3;
    reg [2:0] proc_dep_vld_vec_3_reg;
    wire [2:0] in_chan_dep_vld_vec_3;
    wire [17:0] in_chan_dep_data_vec_3;
    wire [2:0] token_in_vec_3;
    wire [2:0] out_chan_dep_vld_vec_3;
    wire [5:0] out_chan_dep_data_3;
    wire [2:0] token_out_vec_3;
    wire dl_detect_out_3;
    wire dep_chan_vld_0_3;
    wire [5:0] dep_chan_data_0_3;
    wire token_0_3;
    wire dep_chan_vld_1_3;
    wire [5:0] dep_chan_data_1_3;
    wire token_1_3;
    wire dep_chan_vld_4_3;
    wire [5:0] dep_chan_data_4_3;
    wire token_4_3;
    wire [2:0] proc_4_data_FIFO_blk;
    wire [2:0] proc_4_data_PIPO_blk;
    wire [2:0] proc_4_start_FIFO_blk;
    wire [2:0] proc_4_TLF_FIFO_blk;
    wire [2:0] proc_4_input_sync_blk;
    wire [2:0] proc_4_output_sync_blk;
    wire [2:0] proc_dep_vld_vec_4;
    reg [2:0] proc_dep_vld_vec_4_reg;
    wire [2:0] in_chan_dep_vld_vec_4;
    wire [17:0] in_chan_dep_data_vec_4;
    wire [2:0] token_in_vec_4;
    wire [2:0] out_chan_dep_vld_vec_4;
    wire [5:0] out_chan_dep_data_4;
    wire [2:0] token_out_vec_4;
    wire dl_detect_out_4;
    wire dep_chan_vld_2_4;
    wire [5:0] dep_chan_data_2_4;
    wire token_2_4;
    wire dep_chan_vld_3_4;
    wire [5:0] dep_chan_data_3_4;
    wire token_3_4;
    wire dep_chan_vld_5_4;
    wire [5:0] dep_chan_data_5_4;
    wire token_5_4;
    wire [1:0] proc_5_data_FIFO_blk;
    wire [1:0] proc_5_data_PIPO_blk;
    wire [1:0] proc_5_start_FIFO_blk;
    wire [1:0] proc_5_TLF_FIFO_blk;
    wire [1:0] proc_5_input_sync_blk;
    wire [1:0] proc_5_output_sync_blk;
    wire [1:0] proc_dep_vld_vec_5;
    reg [1:0] proc_dep_vld_vec_5_reg;
    wire [1:0] in_chan_dep_vld_vec_5;
    wire [11:0] in_chan_dep_data_vec_5;
    wire [1:0] token_in_vec_5;
    wire [1:0] out_chan_dep_vld_vec_5;
    wire [5:0] out_chan_dep_data_5;
    wire [1:0] token_out_vec_5;
    wire dl_detect_out_5;
    wire dep_chan_vld_0_5;
    wire [5:0] dep_chan_data_0_5;
    wire token_0_5;
    wire dep_chan_vld_4_5;
    wire [5:0] dep_chan_data_4_5;
    wire token_4_5;
    wire [5:0] dl_in_vec;
    wire dl_detect_out;
    wire token_clear;
    reg [5:0] origin;

    reg ap_done_reg_0;// for module load_x_local_U0
    always @ (negedge dl_reset or posedge dl_clock) begin
        if (~dl_reset) begin
            ap_done_reg_0 <= 'b0;
        end
        else begin
            ap_done_reg_0 <= load_x_local_U0.ap_done & ~load_x_local_U0.ap_continue;
        end
    end

    reg ap_done_reg_1;// for module compute_X1_U0
    always @ (negedge dl_reset or posedge dl_clock) begin
        if (~dl_reset) begin
            ap_done_reg_1 <= 'b0;
        end
        else begin
            ap_done_reg_1 <= compute_X1_U0.ap_done & ~compute_X1_U0.ap_continue;
        end
    end

    reg ap_done_reg_2;// for module compute_X2_U0
    always @ (negedge dl_reset or posedge dl_clock) begin
        if (~dl_reset) begin
            ap_done_reg_2 <= 'b0;
        end
        else begin
            ap_done_reg_2 <= compute_X2_U0.ap_done & ~compute_X2_U0.ap_continue;
        end
    end

    reg ap_done_reg_3;// for module compute_gate_U0
    always @ (negedge dl_reset or posedge dl_clock) begin
        if (~dl_reset) begin
            ap_done_reg_3 <= 'b0;
        end
        else begin
            ap_done_reg_3 <= compute_gate_U0.ap_done & ~compute_gate_U0.ap_continue;
        end
    end

    reg ap_done_reg_4;// for module compute_output_U0
    always @ (negedge dl_reset or posedge dl_clock) begin
        if (~dl_reset) begin
            ap_done_reg_4 <= 'b0;
        end
        else begin
            ap_done_reg_4 <= compute_output_U0.ap_done & ~compute_output_U0.ap_continue;
        end
    end

reg [15:0] trans_in_cnt_0;// for process compute_X1_U0
always @(negedge dl_reset or posedge dl_clock) begin
    if (~dl_reset) begin
         trans_in_cnt_0 <= 16'h0;
    end
    else if (compute_X1_U0.start_write == 1'b1) begin
        trans_in_cnt_0 <= trans_in_cnt_0 + 16'h1;
    end
    else begin
        trans_in_cnt_0 <= trans_in_cnt_0;
    end
end

reg [15:0] trans_out_cnt_0;// for process compute_X1_U0
always @(negedge dl_reset or posedge dl_clock) begin
    if (~dl_reset) begin
         trans_out_cnt_0 <= 16'h0;
    end
    else if (compute_X1_U0.ap_done == 1'b1 && compute_X1_U0.ap_continue == 1'b1) begin
        trans_out_cnt_0 <= trans_out_cnt_0 + 16'h1;
    end
    else begin
        trans_out_cnt_0 <= trans_out_cnt_0;
    end
end

    // Process: entry_proc_U0
    swiglu_hls_deadlock_detect_unit #(6, 0, 4, 4) swiglu_hls_deadlock_detect_unit_0 (
        .reset(dl_reset),
        .clock(dl_clock),
        .proc_dep_vld_vec(proc_dep_vld_vec_0),
        .in_chan_dep_vld_vec(in_chan_dep_vld_vec_0),
        .in_chan_dep_data_vec(in_chan_dep_data_vec_0),
        .token_in_vec(token_in_vec_0),
        .dl_detect_in(dl_detect_out),
        .origin(origin[0]),
        .token_clear(token_clear),
        .out_chan_dep_vld_vec(out_chan_dep_vld_vec_0),
        .out_chan_dep_data(out_chan_dep_data_0),
        .token_out_vec(token_out_vec_0),
        .dl_detect_out(dl_in_vec[0]));

    assign proc_0_data_FIFO_blk[0] = 1'b0 | (~entry_proc_U0.W_c_blk_n) | (~entry_proc_U0.x_scale_c1_blk_n);
    assign proc_0_data_PIPO_blk[0] = 1'b0;
    assign proc_0_start_FIFO_blk[0] = 1'b0;
    assign proc_0_TLF_FIFO_blk[0] = 1'b0;
    assign proc_0_input_sync_blk[0] = 1'b0;
    assign proc_0_output_sync_blk[0] = 1'b0;
    assign proc_dep_vld_vec_0[0] = dl_detect_out ? proc_dep_vld_vec_0_reg[0] : (proc_0_data_FIFO_blk[0] | proc_0_data_PIPO_blk[0] | proc_0_start_FIFO_blk[0] | proc_0_TLF_FIFO_blk[0] | proc_0_input_sync_blk[0] | proc_0_output_sync_blk[0]);
    assign proc_0_data_FIFO_blk[1] = 1'b0 | (~entry_proc_U0.V_c_blk_n) | (~entry_proc_U0.x_scale_c_blk_n);
    assign proc_0_data_PIPO_blk[1] = 1'b0;
    assign proc_0_start_FIFO_blk[1] = 1'b0;
    assign proc_0_TLF_FIFO_blk[1] = 1'b0;
    assign proc_0_input_sync_blk[1] = 1'b0;
    assign proc_0_output_sync_blk[1] = 1'b0;
    assign proc_dep_vld_vec_0[1] = dl_detect_out ? proc_dep_vld_vec_0_reg[1] : (proc_0_data_FIFO_blk[1] | proc_0_data_PIPO_blk[1] | proc_0_start_FIFO_blk[1] | proc_0_TLF_FIFO_blk[1] | proc_0_input_sync_blk[1] | proc_0_output_sync_blk[1]);
    assign proc_0_data_FIFO_blk[2] = 1'b0 | (~entry_proc_U0.W_down_c_blk_n) | (~entry_proc_U0.out_batch_c_blk_n) | (~entry_proc_U0.down_quant_mode_c_blk_n);
    assign proc_0_data_PIPO_blk[2] = 1'b0;
    assign proc_0_start_FIFO_blk[2] = 1'b0;
    assign proc_0_TLF_FIFO_blk[2] = 1'b0;
    assign proc_0_input_sync_blk[2] = 1'b0;
    assign proc_0_output_sync_blk[2] = 1'b0;
    assign proc_dep_vld_vec_0[2] = dl_detect_out ? proc_dep_vld_vec_0_reg[2] : (proc_0_data_FIFO_blk[2] | proc_0_data_PIPO_blk[2] | proc_0_start_FIFO_blk[2] | proc_0_TLF_FIFO_blk[2] | proc_0_input_sync_blk[2] | proc_0_output_sync_blk[2]);
    assign proc_0_data_FIFO_blk[3] = 1'b0;
    assign proc_0_data_PIPO_blk[3] = 1'b0;
    assign proc_0_start_FIFO_blk[3] = 1'b0;
    assign proc_0_TLF_FIFO_blk[3] = 1'b0;
    assign proc_0_input_sync_blk[3] = 1'b0 | (ap_sync_entry_proc_U0_ap_ready & entry_proc_U0.ap_idle & ~ap_sync_load_x_local_U0_ap_ready);
    assign proc_0_output_sync_blk[3] = 1'b0;
    assign proc_dep_vld_vec_0[3] = dl_detect_out ? proc_dep_vld_vec_0_reg[3] : (proc_0_data_FIFO_blk[3] | proc_0_data_PIPO_blk[3] | proc_0_start_FIFO_blk[3] | proc_0_TLF_FIFO_blk[3] | proc_0_input_sync_blk[3] | proc_0_output_sync_blk[3]);
    always @ (negedge dl_reset or posedge dl_clock) begin
        if (~dl_reset) begin
            proc_dep_vld_vec_0_reg <= 'b0;
        end
        else begin
            proc_dep_vld_vec_0_reg <= proc_dep_vld_vec_0;
        end
    end
    assign in_chan_dep_vld_vec_0[0] = dep_chan_vld_1_0;
    assign in_chan_dep_data_vec_0[5 : 0] = dep_chan_data_1_0;
    assign token_in_vec_0[0] = token_1_0;
    assign in_chan_dep_vld_vec_0[1] = dep_chan_vld_2_0;
    assign in_chan_dep_data_vec_0[11 : 6] = dep_chan_data_2_0;
    assign token_in_vec_0[1] = token_2_0;
    assign in_chan_dep_vld_vec_0[2] = dep_chan_vld_3_0;
    assign in_chan_dep_data_vec_0[17 : 12] = dep_chan_data_3_0;
    assign token_in_vec_0[2] = token_3_0;
    assign in_chan_dep_vld_vec_0[3] = dep_chan_vld_5_0;
    assign in_chan_dep_data_vec_0[23 : 18] = dep_chan_data_5_0;
    assign token_in_vec_0[3] = token_5_0;
    assign dep_chan_vld_0_2 = out_chan_dep_vld_vec_0[0];
    assign dep_chan_data_0_2 = out_chan_dep_data_0;
    assign token_0_2 = token_out_vec_0[0];
    assign dep_chan_vld_0_3 = out_chan_dep_vld_vec_0[1];
    assign dep_chan_data_0_3 = out_chan_dep_data_0;
    assign token_0_3 = token_out_vec_0[1];
    assign dep_chan_vld_0_5 = out_chan_dep_vld_vec_0[2];
    assign dep_chan_data_0_5 = out_chan_dep_data_0;
    assign token_0_5 = token_out_vec_0[2];
    assign dep_chan_vld_0_1 = out_chan_dep_vld_vec_0[3];
    assign dep_chan_data_0_1 = out_chan_dep_data_0;
    assign token_0_1 = token_out_vec_0[3];

    // Process: load_x_local_U0
    swiglu_hls_deadlock_detect_unit #(6, 1, 3, 3) swiglu_hls_deadlock_detect_unit_1 (
        .reset(dl_reset),
        .clock(dl_clock),
        .proc_dep_vld_vec(proc_dep_vld_vec_1),
        .in_chan_dep_vld_vec(in_chan_dep_vld_vec_1),
        .in_chan_dep_data_vec(in_chan_dep_data_vec_1),
        .token_in_vec(token_in_vec_1),
        .dl_detect_in(dl_detect_out),
        .origin(origin[1]),
        .token_clear(token_clear),
        .out_chan_dep_vld_vec(out_chan_dep_vld_vec_1),
        .out_chan_dep_data(out_chan_dep_data_1),
        .token_out_vec(token_out_vec_1),
        .dl_detect_out(dl_in_vec[1]));

    assign proc_1_data_FIFO_blk[0] = 1'b0;
    assign proc_1_data_PIPO_blk[0] = 1'b0 | (~x_local_1_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_U.t_read) | (~x_local_1_1_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_1_U.t_read) | (~x_local_1_2_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_2_U.t_read) | (~x_local_1_3_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_3_U.t_read) | (~x_local_1_4_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_4_U.t_read) | (~x_local_1_5_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_5_U.t_read) | (~x_local_1_6_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_6_U.t_read) | (~x_local_1_7_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_7_U.t_read) | (~x_local_1_8_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_8_U.t_read) | (~x_local_1_9_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_9_U.t_read) | (~x_local_1_10_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_10_U.t_read) | (~x_local_1_11_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_11_U.t_read) | (~x_local_1_12_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_12_U.t_read) | (~x_local_1_13_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_13_U.t_read) | (~x_local_1_14_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_14_U.t_read) | (~x_local_1_15_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_15_U.t_read) | (~x_local_1_16_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_16_U.t_read) | (~x_local_1_17_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_17_U.t_read) | (~x_local_1_18_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_18_U.t_read) | (~x_local_1_19_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_19_U.t_read) | (~x_local_1_20_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_20_U.t_read) | (~x_local_1_21_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_21_U.t_read) | (~x_local_1_22_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_22_U.t_read) | (~x_local_1_23_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_23_U.t_read) | (~x_local_1_24_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_24_U.t_read) | (~x_local_1_25_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_25_U.t_read) | (~x_local_1_26_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_26_U.t_read) | (~x_local_1_27_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_27_U.t_read) | (~x_local_1_28_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_28_U.t_read) | (~x_local_1_29_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_29_U.t_read) | (~x_local_1_30_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_30_U.t_read) | (~x_local_1_31_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_31_U.t_read) | (~x_local_1_32_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_32_U.t_read) | (~x_local_1_33_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_33_U.t_read) | (~x_local_1_34_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_34_U.t_read) | (~x_local_1_35_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_35_U.t_read) | (~x_local_1_36_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_36_U.t_read) | (~x_local_1_37_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_37_U.t_read) | (~x_local_1_38_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_38_U.t_read) | (~x_local_1_39_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_39_U.t_read) | (~x_local_1_40_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_40_U.t_read) | (~x_local_1_41_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_41_U.t_read) | (~x_local_1_42_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_42_U.t_read) | (~x_local_1_43_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_43_U.t_read) | (~x_local_1_44_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_44_U.t_read) | (~x_local_1_45_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_45_U.t_read) | (~x_local_1_46_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_46_U.t_read) | (~x_local_1_47_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_47_U.t_read) | (~x_local_1_48_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_48_U.t_read) | (~x_local_1_49_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_49_U.t_read) | (~x_local_1_50_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_50_U.t_read) | (~x_local_1_51_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_51_U.t_read) | (~x_local_1_52_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_52_U.t_read) | (~x_local_1_53_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_53_U.t_read) | (~x_local_1_54_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_54_U.t_read) | (~x_local_1_55_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_55_U.t_read) | (~x_local_1_56_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_56_U.t_read) | (~x_local_1_57_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_57_U.t_read) | (~x_local_1_58_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_58_U.t_read) | (~x_local_1_59_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_59_U.t_read) | (~x_local_1_60_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_60_U.t_read) | (~x_local_1_61_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_61_U.t_read) | (~x_local_1_62_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_62_U.t_read) | (~x_local_1_63_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_63_U.t_read) | (~x_local_1_64_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_64_U.t_read) | (~x_local_1_65_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_65_U.t_read) | (~x_local_1_66_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_66_U.t_read) | (~x_local_1_67_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_67_U.t_read) | (~x_local_1_68_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_68_U.t_read) | (~x_local_1_69_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_69_U.t_read) | (~x_local_1_70_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_70_U.t_read) | (~x_local_1_71_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_71_U.t_read) | (~x_local_1_72_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_72_U.t_read) | (~x_local_1_73_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_73_U.t_read) | (~x_local_1_74_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_74_U.t_read) | (~x_local_1_75_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_75_U.t_read) | (~x_local_1_76_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_76_U.t_read) | (~x_local_1_77_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_77_U.t_read) | (~x_local_1_78_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_78_U.t_read) | (~x_local_1_79_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_79_U.t_read) | (~x_local_1_80_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_80_U.t_read) | (~x_local_1_81_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_81_U.t_read) | (~x_local_1_82_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_82_U.t_read) | (~x_local_1_83_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_83_U.t_read) | (~x_local_1_84_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_84_U.t_read) | (~x_local_1_85_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_85_U.t_read) | (~x_local_1_86_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_86_U.t_read) | (~x_local_1_87_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_87_U.t_read) | (~x_local_1_88_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_88_U.t_read) | (~x_local_1_89_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_89_U.t_read) | (~x_local_1_90_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_90_U.t_read) | (~x_local_1_91_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_91_U.t_read) | (~x_local_1_92_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_92_U.t_read) | (~x_local_1_93_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_93_U.t_read) | (~x_local_1_94_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_94_U.t_read) | (~x_local_1_95_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_95_U.t_read) | (~x_local_1_96_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_96_U.t_read) | (~x_local_1_97_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_97_U.t_read) | (~x_local_1_98_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_98_U.t_read) | (~x_local_1_99_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_99_U.t_read) | (~x_local_1_100_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_100_U.t_read) | (~x_local_1_101_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_101_U.t_read) | (~x_local_1_102_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_102_U.t_read) | (~x_local_1_103_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_103_U.t_read) | (~x_local_1_104_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_104_U.t_read) | (~x_local_1_105_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_105_U.t_read) | (~x_local_1_106_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_106_U.t_read) | (~x_local_1_107_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_107_U.t_read) | (~x_local_1_108_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_108_U.t_read) | (~x_local_1_109_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_109_U.t_read) | (~x_local_1_110_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_110_U.t_read) | (~x_local_1_111_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_111_U.t_read) | (~x_local_1_112_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_112_U.t_read) | (~x_local_1_113_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_113_U.t_read) | (~x_local_1_114_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_114_U.t_read) | (~x_local_1_115_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_115_U.t_read) | (~x_local_1_116_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_116_U.t_read) | (~x_local_1_117_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_117_U.t_read) | (~x_local_1_118_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_118_U.t_read) | (~x_local_1_119_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_119_U.t_read) | (~x_local_1_120_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_120_U.t_read) | (~x_local_1_121_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_121_U.t_read) | (~x_local_1_122_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_122_U.t_read) | (~x_local_1_123_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_123_U.t_read) | (~x_local_1_124_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_124_U.t_read) | (~x_local_1_125_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_125_U.t_read) | (~x_local_1_126_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_126_U.t_read) | (~x_local_1_127_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_127_U.t_read);
    assign proc_1_start_FIFO_blk[0] = 1'b0;
    assign proc_1_TLF_FIFO_blk[0] = 1'b0;
    assign proc_1_input_sync_blk[0] = 1'b0;
    assign proc_1_output_sync_blk[0] = 1'b0;
    assign proc_dep_vld_vec_1[0] = dl_detect_out ? proc_dep_vld_vec_1_reg[0] : (proc_1_data_FIFO_blk[0] | proc_1_data_PIPO_blk[0] | proc_1_start_FIFO_blk[0] | proc_1_TLF_FIFO_blk[0] | proc_1_input_sync_blk[0] | proc_1_output_sync_blk[0]);
    assign proc_1_data_FIFO_blk[1] = 1'b0;
    assign proc_1_data_PIPO_blk[1] = 1'b0 | (~x_local_2_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_U.t_read) | (~x_local_2_1_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_1_U.t_read) | (~x_local_2_2_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_2_U.t_read) | (~x_local_2_3_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_3_U.t_read) | (~x_local_2_4_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_4_U.t_read) | (~x_local_2_5_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_5_U.t_read) | (~x_local_2_6_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_6_U.t_read) | (~x_local_2_7_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_7_U.t_read) | (~x_local_2_8_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_8_U.t_read) | (~x_local_2_9_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_9_U.t_read) | (~x_local_2_10_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_10_U.t_read) | (~x_local_2_11_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_11_U.t_read) | (~x_local_2_12_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_12_U.t_read) | (~x_local_2_13_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_13_U.t_read) | (~x_local_2_14_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_14_U.t_read) | (~x_local_2_15_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_15_U.t_read) | (~x_local_2_16_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_16_U.t_read) | (~x_local_2_17_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_17_U.t_read) | (~x_local_2_18_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_18_U.t_read) | (~x_local_2_19_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_19_U.t_read) | (~x_local_2_20_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_20_U.t_read) | (~x_local_2_21_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_21_U.t_read) | (~x_local_2_22_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_22_U.t_read) | (~x_local_2_23_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_23_U.t_read) | (~x_local_2_24_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_24_U.t_read) | (~x_local_2_25_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_25_U.t_read) | (~x_local_2_26_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_26_U.t_read) | (~x_local_2_27_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_27_U.t_read) | (~x_local_2_28_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_28_U.t_read) | (~x_local_2_29_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_29_U.t_read) | (~x_local_2_30_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_30_U.t_read) | (~x_local_2_31_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_31_U.t_read) | (~x_local_2_32_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_32_U.t_read) | (~x_local_2_33_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_33_U.t_read) | (~x_local_2_34_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_34_U.t_read) | (~x_local_2_35_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_35_U.t_read) | (~x_local_2_36_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_36_U.t_read) | (~x_local_2_37_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_37_U.t_read) | (~x_local_2_38_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_38_U.t_read) | (~x_local_2_39_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_39_U.t_read) | (~x_local_2_40_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_40_U.t_read) | (~x_local_2_41_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_41_U.t_read) | (~x_local_2_42_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_42_U.t_read) | (~x_local_2_43_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_43_U.t_read) | (~x_local_2_44_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_44_U.t_read) | (~x_local_2_45_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_45_U.t_read) | (~x_local_2_46_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_46_U.t_read) | (~x_local_2_47_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_47_U.t_read) | (~x_local_2_48_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_48_U.t_read) | (~x_local_2_49_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_49_U.t_read) | (~x_local_2_50_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_50_U.t_read) | (~x_local_2_51_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_51_U.t_read) | (~x_local_2_52_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_52_U.t_read) | (~x_local_2_53_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_53_U.t_read) | (~x_local_2_54_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_54_U.t_read) | (~x_local_2_55_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_55_U.t_read) | (~x_local_2_56_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_56_U.t_read) | (~x_local_2_57_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_57_U.t_read) | (~x_local_2_58_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_58_U.t_read) | (~x_local_2_59_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_59_U.t_read) | (~x_local_2_60_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_60_U.t_read) | (~x_local_2_61_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_61_U.t_read) | (~x_local_2_62_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_62_U.t_read) | (~x_local_2_63_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_63_U.t_read) | (~x_local_2_64_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_64_U.t_read) | (~x_local_2_65_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_65_U.t_read) | (~x_local_2_66_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_66_U.t_read) | (~x_local_2_67_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_67_U.t_read) | (~x_local_2_68_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_68_U.t_read) | (~x_local_2_69_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_69_U.t_read) | (~x_local_2_70_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_70_U.t_read) | (~x_local_2_71_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_71_U.t_read) | (~x_local_2_72_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_72_U.t_read) | (~x_local_2_73_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_73_U.t_read) | (~x_local_2_74_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_74_U.t_read) | (~x_local_2_75_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_75_U.t_read) | (~x_local_2_76_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_76_U.t_read) | (~x_local_2_77_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_77_U.t_read) | (~x_local_2_78_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_78_U.t_read) | (~x_local_2_79_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_79_U.t_read) | (~x_local_2_80_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_80_U.t_read) | (~x_local_2_81_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_81_U.t_read) | (~x_local_2_82_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_82_U.t_read) | (~x_local_2_83_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_83_U.t_read) | (~x_local_2_84_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_84_U.t_read) | (~x_local_2_85_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_85_U.t_read) | (~x_local_2_86_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_86_U.t_read) | (~x_local_2_87_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_87_U.t_read) | (~x_local_2_88_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_88_U.t_read) | (~x_local_2_89_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_89_U.t_read) | (~x_local_2_90_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_90_U.t_read) | (~x_local_2_91_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_91_U.t_read) | (~x_local_2_92_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_92_U.t_read) | (~x_local_2_93_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_93_U.t_read) | (~x_local_2_94_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_94_U.t_read) | (~x_local_2_95_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_95_U.t_read) | (~x_local_2_96_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_96_U.t_read) | (~x_local_2_97_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_97_U.t_read) | (~x_local_2_98_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_98_U.t_read) | (~x_local_2_99_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_99_U.t_read) | (~x_local_2_100_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_100_U.t_read) | (~x_local_2_101_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_101_U.t_read) | (~x_local_2_102_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_102_U.t_read) | (~x_local_2_103_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_103_U.t_read) | (~x_local_2_104_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_104_U.t_read) | (~x_local_2_105_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_105_U.t_read) | (~x_local_2_106_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_106_U.t_read) | (~x_local_2_107_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_107_U.t_read) | (~x_local_2_108_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_108_U.t_read) | (~x_local_2_109_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_109_U.t_read) | (~x_local_2_110_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_110_U.t_read) | (~x_local_2_111_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_111_U.t_read) | (~x_local_2_112_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_112_U.t_read) | (~x_local_2_113_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_113_U.t_read) | (~x_local_2_114_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_114_U.t_read) | (~x_local_2_115_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_115_U.t_read) | (~x_local_2_116_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_116_U.t_read) | (~x_local_2_117_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_117_U.t_read) | (~x_local_2_118_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_118_U.t_read) | (~x_local_2_119_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_119_U.t_read) | (~x_local_2_120_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_120_U.t_read) | (~x_local_2_121_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_121_U.t_read) | (~x_local_2_122_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_122_U.t_read) | (~x_local_2_123_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_123_U.t_read) | (~x_local_2_124_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_124_U.t_read) | (~x_local_2_125_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_125_U.t_read) | (~x_local_2_126_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_126_U.t_read) | (~x_local_2_127_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_127_U.t_read);
    assign proc_1_start_FIFO_blk[1] = 1'b0;
    assign proc_1_TLF_FIFO_blk[1] = 1'b0;
    assign proc_1_input_sync_blk[1] = 1'b0;
    assign proc_1_output_sync_blk[1] = 1'b0;
    assign proc_dep_vld_vec_1[1] = dl_detect_out ? proc_dep_vld_vec_1_reg[1] : (proc_1_data_FIFO_blk[1] | proc_1_data_PIPO_blk[1] | proc_1_start_FIFO_blk[1] | proc_1_TLF_FIFO_blk[1] | proc_1_input_sync_blk[1] | proc_1_output_sync_blk[1]);
    assign proc_1_data_FIFO_blk[2] = 1'b0;
    assign proc_1_data_PIPO_blk[2] = 1'b0;
    assign proc_1_start_FIFO_blk[2] = 1'b0;
    assign proc_1_TLF_FIFO_blk[2] = 1'b0;
    assign proc_1_input_sync_blk[2] = 1'b0 | (ap_sync_load_x_local_U0_ap_ready & load_x_local_U0.ap_idle & ~ap_sync_entry_proc_U0_ap_ready);
    assign proc_1_output_sync_blk[2] = 1'b0;
    assign proc_dep_vld_vec_1[2] = dl_detect_out ? proc_dep_vld_vec_1_reg[2] : (proc_1_data_FIFO_blk[2] | proc_1_data_PIPO_blk[2] | proc_1_start_FIFO_blk[2] | proc_1_TLF_FIFO_blk[2] | proc_1_input_sync_blk[2] | proc_1_output_sync_blk[2]);
    always @ (negedge dl_reset or posedge dl_clock) begin
        if (~dl_reset) begin
            proc_dep_vld_vec_1_reg <= 'b0;
        end
        else begin
            proc_dep_vld_vec_1_reg <= proc_dep_vld_vec_1;
        end
    end
    assign in_chan_dep_vld_vec_1[0] = dep_chan_vld_0_1;
    assign in_chan_dep_data_vec_1[5 : 0] = dep_chan_data_0_1;
    assign token_in_vec_1[0] = token_0_1;
    assign in_chan_dep_vld_vec_1[1] = dep_chan_vld_2_1;
    assign in_chan_dep_data_vec_1[11 : 6] = dep_chan_data_2_1;
    assign token_in_vec_1[1] = token_2_1;
    assign in_chan_dep_vld_vec_1[2] = dep_chan_vld_3_1;
    assign in_chan_dep_data_vec_1[17 : 12] = dep_chan_data_3_1;
    assign token_in_vec_1[2] = token_3_1;
    assign dep_chan_vld_1_2 = out_chan_dep_vld_vec_1[0];
    assign dep_chan_data_1_2 = out_chan_dep_data_1;
    assign token_1_2 = token_out_vec_1[0];
    assign dep_chan_vld_1_3 = out_chan_dep_vld_vec_1[1];
    assign dep_chan_data_1_3 = out_chan_dep_data_1;
    assign token_1_3 = token_out_vec_1[1];
    assign dep_chan_vld_1_0 = out_chan_dep_vld_vec_1[2];
    assign dep_chan_data_1_0 = out_chan_dep_data_1;
    assign token_1_0 = token_out_vec_1[2];

    // Process: compute_X1_U0
    swiglu_hls_deadlock_detect_unit #(6, 2, 3, 3) swiglu_hls_deadlock_detect_unit_2 (
        .reset(dl_reset),
        .clock(dl_clock),
        .proc_dep_vld_vec(proc_dep_vld_vec_2),
        .in_chan_dep_vld_vec(in_chan_dep_vld_vec_2),
        .in_chan_dep_data_vec(in_chan_dep_data_vec_2),
        .token_in_vec(token_in_vec_2),
        .dl_detect_in(dl_detect_out),
        .origin(origin[2]),
        .token_clear(token_clear),
        .out_chan_dep_vld_vec(out_chan_dep_vld_vec_2),
        .out_chan_dep_data(out_chan_dep_data_2),
        .token_out_vec(token_out_vec_2),
        .dl_detect_out(dl_in_vec[2]));

    assign proc_2_data_FIFO_blk[0] = 1'b0 | (~compute_X1_U0.W_blk_n) | (~compute_X1_U0.x_scale_blk_n);
    assign proc_2_data_PIPO_blk[0] = 1'b0;
    assign proc_2_start_FIFO_blk[0] = 1'b0;
    assign proc_2_TLF_FIFO_blk[0] = 1'b0;
    assign proc_2_input_sync_blk[0] = 1'b0;
    assign proc_2_output_sync_blk[0] = 1'b0;
    assign proc_dep_vld_vec_2[0] = dl_detect_out ? proc_dep_vld_vec_2_reg[0] : (proc_2_data_FIFO_blk[0] | proc_2_data_PIPO_blk[0] | proc_2_start_FIFO_blk[0] | proc_2_TLF_FIFO_blk[0] | proc_2_input_sync_blk[0] | proc_2_output_sync_blk[0]);
    assign proc_2_data_FIFO_blk[1] = 1'b0;
    assign proc_2_data_PIPO_blk[1] = 1'b0 | (~x_local_1_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_U.i_write) | (~x_local_1_1_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_1_U.i_write) | (~x_local_1_2_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_2_U.i_write) | (~x_local_1_3_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_3_U.i_write) | (~x_local_1_4_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_4_U.i_write) | (~x_local_1_5_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_5_U.i_write) | (~x_local_1_6_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_6_U.i_write) | (~x_local_1_7_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_7_U.i_write) | (~x_local_1_8_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_8_U.i_write) | (~x_local_1_9_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_9_U.i_write) | (~x_local_1_10_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_10_U.i_write) | (~x_local_1_11_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_11_U.i_write) | (~x_local_1_12_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_12_U.i_write) | (~x_local_1_13_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_13_U.i_write) | (~x_local_1_14_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_14_U.i_write) | (~x_local_1_15_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_15_U.i_write) | (~x_local_1_16_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_16_U.i_write) | (~x_local_1_17_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_17_U.i_write) | (~x_local_1_18_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_18_U.i_write) | (~x_local_1_19_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_19_U.i_write) | (~x_local_1_20_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_20_U.i_write) | (~x_local_1_21_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_21_U.i_write) | (~x_local_1_22_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_22_U.i_write) | (~x_local_1_23_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_23_U.i_write) | (~x_local_1_24_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_24_U.i_write) | (~x_local_1_25_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_25_U.i_write) | (~x_local_1_26_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_26_U.i_write) | (~x_local_1_27_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_27_U.i_write) | (~x_local_1_28_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_28_U.i_write) | (~x_local_1_29_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_29_U.i_write) | (~x_local_1_30_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_30_U.i_write) | (~x_local_1_31_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_31_U.i_write) | (~x_local_1_32_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_32_U.i_write) | (~x_local_1_33_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_33_U.i_write) | (~x_local_1_34_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_34_U.i_write) | (~x_local_1_35_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_35_U.i_write) | (~x_local_1_36_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_36_U.i_write) | (~x_local_1_37_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_37_U.i_write) | (~x_local_1_38_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_38_U.i_write) | (~x_local_1_39_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_39_U.i_write) | (~x_local_1_40_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_40_U.i_write) | (~x_local_1_41_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_41_U.i_write) | (~x_local_1_42_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_42_U.i_write) | (~x_local_1_43_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_43_U.i_write) | (~x_local_1_44_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_44_U.i_write) | (~x_local_1_45_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_45_U.i_write) | (~x_local_1_46_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_46_U.i_write) | (~x_local_1_47_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_47_U.i_write) | (~x_local_1_48_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_48_U.i_write) | (~x_local_1_49_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_49_U.i_write) | (~x_local_1_50_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_50_U.i_write) | (~x_local_1_51_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_51_U.i_write) | (~x_local_1_52_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_52_U.i_write) | (~x_local_1_53_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_53_U.i_write) | (~x_local_1_54_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_54_U.i_write) | (~x_local_1_55_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_55_U.i_write) | (~x_local_1_56_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_56_U.i_write) | (~x_local_1_57_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_57_U.i_write) | (~x_local_1_58_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_58_U.i_write) | (~x_local_1_59_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_59_U.i_write) | (~x_local_1_60_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_60_U.i_write) | (~x_local_1_61_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_61_U.i_write) | (~x_local_1_62_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_62_U.i_write) | (~x_local_1_63_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_63_U.i_write) | (~x_local_1_64_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_64_U.i_write) | (~x_local_1_65_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_65_U.i_write) | (~x_local_1_66_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_66_U.i_write) | (~x_local_1_67_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_67_U.i_write) | (~x_local_1_68_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_68_U.i_write) | (~x_local_1_69_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_69_U.i_write) | (~x_local_1_70_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_70_U.i_write) | (~x_local_1_71_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_71_U.i_write) | (~x_local_1_72_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_72_U.i_write) | (~x_local_1_73_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_73_U.i_write) | (~x_local_1_74_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_74_U.i_write) | (~x_local_1_75_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_75_U.i_write) | (~x_local_1_76_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_76_U.i_write) | (~x_local_1_77_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_77_U.i_write) | (~x_local_1_78_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_78_U.i_write) | (~x_local_1_79_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_79_U.i_write) | (~x_local_1_80_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_80_U.i_write) | (~x_local_1_81_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_81_U.i_write) | (~x_local_1_82_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_82_U.i_write) | (~x_local_1_83_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_83_U.i_write) | (~x_local_1_84_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_84_U.i_write) | (~x_local_1_85_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_85_U.i_write) | (~x_local_1_86_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_86_U.i_write) | (~x_local_1_87_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_87_U.i_write) | (~x_local_1_88_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_88_U.i_write) | (~x_local_1_89_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_89_U.i_write) | (~x_local_1_90_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_90_U.i_write) | (~x_local_1_91_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_91_U.i_write) | (~x_local_1_92_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_92_U.i_write) | (~x_local_1_93_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_93_U.i_write) | (~x_local_1_94_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_94_U.i_write) | (~x_local_1_95_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_95_U.i_write) | (~x_local_1_96_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_96_U.i_write) | (~x_local_1_97_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_97_U.i_write) | (~x_local_1_98_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_98_U.i_write) | (~x_local_1_99_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_99_U.i_write) | (~x_local_1_100_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_100_U.i_write) | (~x_local_1_101_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_101_U.i_write) | (~x_local_1_102_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_102_U.i_write) | (~x_local_1_103_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_103_U.i_write) | (~x_local_1_104_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_104_U.i_write) | (~x_local_1_105_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_105_U.i_write) | (~x_local_1_106_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_106_U.i_write) | (~x_local_1_107_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_107_U.i_write) | (~x_local_1_108_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_108_U.i_write) | (~x_local_1_109_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_109_U.i_write) | (~x_local_1_110_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_110_U.i_write) | (~x_local_1_111_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_111_U.i_write) | (~x_local_1_112_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_112_U.i_write) | (~x_local_1_113_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_113_U.i_write) | (~x_local_1_114_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_114_U.i_write) | (~x_local_1_115_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_115_U.i_write) | (~x_local_1_116_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_116_U.i_write) | (~x_local_1_117_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_117_U.i_write) | (~x_local_1_118_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_118_U.i_write) | (~x_local_1_119_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_119_U.i_write) | (~x_local_1_120_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_120_U.i_write) | (~x_local_1_121_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_121_U.i_write) | (~x_local_1_122_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_122_U.i_write) | (~x_local_1_123_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_123_U.i_write) | (~x_local_1_124_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_124_U.i_write) | (~x_local_1_125_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_125_U.i_write) | (~x_local_1_126_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_126_U.i_write) | (~x_local_1_127_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_127_U.i_write);
    assign proc_2_start_FIFO_blk[1] = 1'b0;
    assign proc_2_TLF_FIFO_blk[1] = 1'b0;
    assign proc_2_input_sync_blk[1] = 1'b0;
    assign proc_2_output_sync_blk[1] = 1'b0;
    assign proc_dep_vld_vec_2[1] = dl_detect_out ? proc_dep_vld_vec_2_reg[1] : (proc_2_data_FIFO_blk[1] | proc_2_data_PIPO_blk[1] | proc_2_start_FIFO_blk[1] | proc_2_TLF_FIFO_blk[1] | proc_2_input_sync_blk[1] | proc_2_output_sync_blk[1]);
    assign proc_2_data_FIFO_blk[2] = 1'b0 | (~compute_X1_U0.X1_cache_blk_n);
    assign proc_2_data_PIPO_blk[2] = 1'b0;
    assign proc_2_start_FIFO_blk[2] = 1'b0 | (~start_for_compute_gate_U0_U.if_full_n & compute_X1_U0.ap_start & ~compute_X1_U0.real_start & (trans_in_cnt_0 == trans_out_cnt_0) & ~start_for_compute_gate_U0_U.if_read);
    assign proc_2_TLF_FIFO_blk[2] = 1'b0;
    assign proc_2_input_sync_blk[2] = 1'b0;
    assign proc_2_output_sync_blk[2] = 1'b0;
    assign proc_dep_vld_vec_2[2] = dl_detect_out ? proc_dep_vld_vec_2_reg[2] : (proc_2_data_FIFO_blk[2] | proc_2_data_PIPO_blk[2] | proc_2_start_FIFO_blk[2] | proc_2_TLF_FIFO_blk[2] | proc_2_input_sync_blk[2] | proc_2_output_sync_blk[2]);
    always @ (negedge dl_reset or posedge dl_clock) begin
        if (~dl_reset) begin
            proc_dep_vld_vec_2_reg <= 'b0;
        end
        else begin
            proc_dep_vld_vec_2_reg <= proc_dep_vld_vec_2;
        end
    end
    assign in_chan_dep_vld_vec_2[0] = dep_chan_vld_0_2;
    assign in_chan_dep_data_vec_2[5 : 0] = dep_chan_data_0_2;
    assign token_in_vec_2[0] = token_0_2;
    assign in_chan_dep_vld_vec_2[1] = dep_chan_vld_1_2;
    assign in_chan_dep_data_vec_2[11 : 6] = dep_chan_data_1_2;
    assign token_in_vec_2[1] = token_1_2;
    assign in_chan_dep_vld_vec_2[2] = dep_chan_vld_4_2;
    assign in_chan_dep_data_vec_2[17 : 12] = dep_chan_data_4_2;
    assign token_in_vec_2[2] = token_4_2;
    assign dep_chan_vld_2_0 = out_chan_dep_vld_vec_2[0];
    assign dep_chan_data_2_0 = out_chan_dep_data_2;
    assign token_2_0 = token_out_vec_2[0];
    assign dep_chan_vld_2_1 = out_chan_dep_vld_vec_2[1];
    assign dep_chan_data_2_1 = out_chan_dep_data_2;
    assign token_2_1 = token_out_vec_2[1];
    assign dep_chan_vld_2_4 = out_chan_dep_vld_vec_2[2];
    assign dep_chan_data_2_4 = out_chan_dep_data_2;
    assign token_2_4 = token_out_vec_2[2];

    // Process: compute_X2_U0
    swiglu_hls_deadlock_detect_unit #(6, 3, 3, 3) swiglu_hls_deadlock_detect_unit_3 (
        .reset(dl_reset),
        .clock(dl_clock),
        .proc_dep_vld_vec(proc_dep_vld_vec_3),
        .in_chan_dep_vld_vec(in_chan_dep_vld_vec_3),
        .in_chan_dep_data_vec(in_chan_dep_data_vec_3),
        .token_in_vec(token_in_vec_3),
        .dl_detect_in(dl_detect_out),
        .origin(origin[3]),
        .token_clear(token_clear),
        .out_chan_dep_vld_vec(out_chan_dep_vld_vec_3),
        .out_chan_dep_data(out_chan_dep_data_3),
        .token_out_vec(token_out_vec_3),
        .dl_detect_out(dl_in_vec[3]));

    assign proc_3_data_FIFO_blk[0] = 1'b0 | (~compute_X2_U0.V_blk_n) | (~compute_X2_U0.x_scale_blk_n);
    assign proc_3_data_PIPO_blk[0] = 1'b0;
    assign proc_3_start_FIFO_blk[0] = 1'b0;
    assign proc_3_TLF_FIFO_blk[0] = 1'b0;
    assign proc_3_input_sync_blk[0] = 1'b0;
    assign proc_3_output_sync_blk[0] = 1'b0;
    assign proc_dep_vld_vec_3[0] = dl_detect_out ? proc_dep_vld_vec_3_reg[0] : (proc_3_data_FIFO_blk[0] | proc_3_data_PIPO_blk[0] | proc_3_start_FIFO_blk[0] | proc_3_TLF_FIFO_blk[0] | proc_3_input_sync_blk[0] | proc_3_output_sync_blk[0]);
    assign proc_3_data_FIFO_blk[1] = 1'b0;
    assign proc_3_data_PIPO_blk[1] = 1'b0 | (~x_local_2_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_U.i_write) | (~x_local_2_1_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_1_U.i_write) | (~x_local_2_2_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_2_U.i_write) | (~x_local_2_3_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_3_U.i_write) | (~x_local_2_4_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_4_U.i_write) | (~x_local_2_5_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_5_U.i_write) | (~x_local_2_6_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_6_U.i_write) | (~x_local_2_7_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_7_U.i_write) | (~x_local_2_8_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_8_U.i_write) | (~x_local_2_9_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_9_U.i_write) | (~x_local_2_10_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_10_U.i_write) | (~x_local_2_11_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_11_U.i_write) | (~x_local_2_12_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_12_U.i_write) | (~x_local_2_13_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_13_U.i_write) | (~x_local_2_14_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_14_U.i_write) | (~x_local_2_15_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_15_U.i_write) | (~x_local_2_16_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_16_U.i_write) | (~x_local_2_17_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_17_U.i_write) | (~x_local_2_18_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_18_U.i_write) | (~x_local_2_19_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_19_U.i_write) | (~x_local_2_20_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_20_U.i_write) | (~x_local_2_21_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_21_U.i_write) | (~x_local_2_22_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_22_U.i_write) | (~x_local_2_23_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_23_U.i_write) | (~x_local_2_24_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_24_U.i_write) | (~x_local_2_25_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_25_U.i_write) | (~x_local_2_26_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_26_U.i_write) | (~x_local_2_27_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_27_U.i_write) | (~x_local_2_28_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_28_U.i_write) | (~x_local_2_29_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_29_U.i_write) | (~x_local_2_30_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_30_U.i_write) | (~x_local_2_31_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_31_U.i_write) | (~x_local_2_32_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_32_U.i_write) | (~x_local_2_33_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_33_U.i_write) | (~x_local_2_34_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_34_U.i_write) | (~x_local_2_35_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_35_U.i_write) | (~x_local_2_36_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_36_U.i_write) | (~x_local_2_37_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_37_U.i_write) | (~x_local_2_38_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_38_U.i_write) | (~x_local_2_39_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_39_U.i_write) | (~x_local_2_40_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_40_U.i_write) | (~x_local_2_41_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_41_U.i_write) | (~x_local_2_42_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_42_U.i_write) | (~x_local_2_43_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_43_U.i_write) | (~x_local_2_44_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_44_U.i_write) | (~x_local_2_45_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_45_U.i_write) | (~x_local_2_46_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_46_U.i_write) | (~x_local_2_47_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_47_U.i_write) | (~x_local_2_48_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_48_U.i_write) | (~x_local_2_49_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_49_U.i_write) | (~x_local_2_50_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_50_U.i_write) | (~x_local_2_51_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_51_U.i_write) | (~x_local_2_52_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_52_U.i_write) | (~x_local_2_53_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_53_U.i_write) | (~x_local_2_54_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_54_U.i_write) | (~x_local_2_55_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_55_U.i_write) | (~x_local_2_56_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_56_U.i_write) | (~x_local_2_57_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_57_U.i_write) | (~x_local_2_58_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_58_U.i_write) | (~x_local_2_59_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_59_U.i_write) | (~x_local_2_60_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_60_U.i_write) | (~x_local_2_61_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_61_U.i_write) | (~x_local_2_62_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_62_U.i_write) | (~x_local_2_63_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_63_U.i_write) | (~x_local_2_64_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_64_U.i_write) | (~x_local_2_65_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_65_U.i_write) | (~x_local_2_66_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_66_U.i_write) | (~x_local_2_67_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_67_U.i_write) | (~x_local_2_68_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_68_U.i_write) | (~x_local_2_69_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_69_U.i_write) | (~x_local_2_70_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_70_U.i_write) | (~x_local_2_71_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_71_U.i_write) | (~x_local_2_72_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_72_U.i_write) | (~x_local_2_73_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_73_U.i_write) | (~x_local_2_74_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_74_U.i_write) | (~x_local_2_75_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_75_U.i_write) | (~x_local_2_76_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_76_U.i_write) | (~x_local_2_77_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_77_U.i_write) | (~x_local_2_78_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_78_U.i_write) | (~x_local_2_79_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_79_U.i_write) | (~x_local_2_80_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_80_U.i_write) | (~x_local_2_81_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_81_U.i_write) | (~x_local_2_82_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_82_U.i_write) | (~x_local_2_83_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_83_U.i_write) | (~x_local_2_84_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_84_U.i_write) | (~x_local_2_85_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_85_U.i_write) | (~x_local_2_86_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_86_U.i_write) | (~x_local_2_87_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_87_U.i_write) | (~x_local_2_88_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_88_U.i_write) | (~x_local_2_89_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_89_U.i_write) | (~x_local_2_90_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_90_U.i_write) | (~x_local_2_91_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_91_U.i_write) | (~x_local_2_92_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_92_U.i_write) | (~x_local_2_93_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_93_U.i_write) | (~x_local_2_94_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_94_U.i_write) | (~x_local_2_95_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_95_U.i_write) | (~x_local_2_96_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_96_U.i_write) | (~x_local_2_97_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_97_U.i_write) | (~x_local_2_98_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_98_U.i_write) | (~x_local_2_99_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_99_U.i_write) | (~x_local_2_100_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_100_U.i_write) | (~x_local_2_101_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_101_U.i_write) | (~x_local_2_102_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_102_U.i_write) | (~x_local_2_103_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_103_U.i_write) | (~x_local_2_104_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_104_U.i_write) | (~x_local_2_105_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_105_U.i_write) | (~x_local_2_106_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_106_U.i_write) | (~x_local_2_107_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_107_U.i_write) | (~x_local_2_108_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_108_U.i_write) | (~x_local_2_109_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_109_U.i_write) | (~x_local_2_110_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_110_U.i_write) | (~x_local_2_111_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_111_U.i_write) | (~x_local_2_112_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_112_U.i_write) | (~x_local_2_113_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_113_U.i_write) | (~x_local_2_114_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_114_U.i_write) | (~x_local_2_115_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_115_U.i_write) | (~x_local_2_116_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_116_U.i_write) | (~x_local_2_117_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_117_U.i_write) | (~x_local_2_118_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_118_U.i_write) | (~x_local_2_119_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_119_U.i_write) | (~x_local_2_120_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_120_U.i_write) | (~x_local_2_121_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_121_U.i_write) | (~x_local_2_122_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_122_U.i_write) | (~x_local_2_123_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_123_U.i_write) | (~x_local_2_124_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_124_U.i_write) | (~x_local_2_125_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_125_U.i_write) | (~x_local_2_126_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_126_U.i_write) | (~x_local_2_127_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_127_U.i_write);
    assign proc_3_start_FIFO_blk[1] = 1'b0;
    assign proc_3_TLF_FIFO_blk[1] = 1'b0;
    assign proc_3_input_sync_blk[1] = 1'b0;
    assign proc_3_output_sync_blk[1] = 1'b0;
    assign proc_dep_vld_vec_3[1] = dl_detect_out ? proc_dep_vld_vec_3_reg[1] : (proc_3_data_FIFO_blk[1] | proc_3_data_PIPO_blk[1] | proc_3_start_FIFO_blk[1] | proc_3_TLF_FIFO_blk[1] | proc_3_input_sync_blk[1] | proc_3_output_sync_blk[1]);
    assign proc_3_data_FIFO_blk[2] = 1'b0 | (~compute_X2_U0.X2_cache_blk_n);
    assign proc_3_data_PIPO_blk[2] = 1'b0;
    assign proc_3_start_FIFO_blk[2] = 1'b0;
    assign proc_3_TLF_FIFO_blk[2] = 1'b0;
    assign proc_3_input_sync_blk[2] = 1'b0;
    assign proc_3_output_sync_blk[2] = 1'b0;
    assign proc_dep_vld_vec_3[2] = dl_detect_out ? proc_dep_vld_vec_3_reg[2] : (proc_3_data_FIFO_blk[2] | proc_3_data_PIPO_blk[2] | proc_3_start_FIFO_blk[2] | proc_3_TLF_FIFO_blk[2] | proc_3_input_sync_blk[2] | proc_3_output_sync_blk[2]);
    always @ (negedge dl_reset or posedge dl_clock) begin
        if (~dl_reset) begin
            proc_dep_vld_vec_3_reg <= 'b0;
        end
        else begin
            proc_dep_vld_vec_3_reg <= proc_dep_vld_vec_3;
        end
    end
    assign in_chan_dep_vld_vec_3[0] = dep_chan_vld_0_3;
    assign in_chan_dep_data_vec_3[5 : 0] = dep_chan_data_0_3;
    assign token_in_vec_3[0] = token_0_3;
    assign in_chan_dep_vld_vec_3[1] = dep_chan_vld_1_3;
    assign in_chan_dep_data_vec_3[11 : 6] = dep_chan_data_1_3;
    assign token_in_vec_3[1] = token_1_3;
    assign in_chan_dep_vld_vec_3[2] = dep_chan_vld_4_3;
    assign in_chan_dep_data_vec_3[17 : 12] = dep_chan_data_4_3;
    assign token_in_vec_3[2] = token_4_3;
    assign dep_chan_vld_3_0 = out_chan_dep_vld_vec_3[0];
    assign dep_chan_data_3_0 = out_chan_dep_data_3;
    assign token_3_0 = token_out_vec_3[0];
    assign dep_chan_vld_3_1 = out_chan_dep_vld_vec_3[1];
    assign dep_chan_data_3_1 = out_chan_dep_data_3;
    assign token_3_1 = token_out_vec_3[1];
    assign dep_chan_vld_3_4 = out_chan_dep_vld_vec_3[2];
    assign dep_chan_data_3_4 = out_chan_dep_data_3;
    assign token_3_4 = token_out_vec_3[2];

    // Process: compute_gate_U0
    swiglu_hls_deadlock_detect_unit #(6, 4, 3, 3) swiglu_hls_deadlock_detect_unit_4 (
        .reset(dl_reset),
        .clock(dl_clock),
        .proc_dep_vld_vec(proc_dep_vld_vec_4),
        .in_chan_dep_vld_vec(in_chan_dep_vld_vec_4),
        .in_chan_dep_data_vec(in_chan_dep_data_vec_4),
        .token_in_vec(token_in_vec_4),
        .dl_detect_in(dl_detect_out),
        .origin(origin[4]),
        .token_clear(token_clear),
        .out_chan_dep_vld_vec(out_chan_dep_vld_vec_4),
        .out_chan_dep_data(out_chan_dep_data_4),
        .token_out_vec(token_out_vec_4),
        .dl_detect_out(dl_in_vec[4]));

    assign proc_4_data_FIFO_blk[0] = 1'b0 | (~compute_gate_U0.grp_compute_gate_Pipeline_GATE_PASS1_fu_150.X1_cache_blk_n);
    assign proc_4_data_PIPO_blk[0] = 1'b0;
    assign proc_4_start_FIFO_blk[0] = 1'b0 | (~start_for_compute_gate_U0_U.if_empty_n & compute_gate_U0.ap_idle & ~start_for_compute_gate_U0_U.if_write);
    assign proc_4_TLF_FIFO_blk[0] = 1'b0;
    assign proc_4_input_sync_blk[0] = 1'b0;
    assign proc_4_output_sync_blk[0] = 1'b0;
    assign proc_dep_vld_vec_4[0] = dl_detect_out ? proc_dep_vld_vec_4_reg[0] : (proc_4_data_FIFO_blk[0] | proc_4_data_PIPO_blk[0] | proc_4_start_FIFO_blk[0] | proc_4_TLF_FIFO_blk[0] | proc_4_input_sync_blk[0] | proc_4_output_sync_blk[0]);
    assign proc_4_data_FIFO_blk[1] = 1'b0 | (~compute_gate_U0.grp_compute_gate_Pipeline_GATE_PASS1_fu_150.X2_cache_blk_n);
    assign proc_4_data_PIPO_blk[1] = 1'b0;
    assign proc_4_start_FIFO_blk[1] = 1'b0;
    assign proc_4_TLF_FIFO_blk[1] = 1'b0;
    assign proc_4_input_sync_blk[1] = 1'b0;
    assign proc_4_output_sync_blk[1] = 1'b0;
    assign proc_dep_vld_vec_4[1] = dl_detect_out ? proc_dep_vld_vec_4_reg[1] : (proc_4_data_FIFO_blk[1] | proc_4_data_PIPO_blk[1] | proc_4_start_FIFO_blk[1] | proc_4_TLF_FIFO_blk[1] | proc_4_input_sync_blk[1] | proc_4_output_sync_blk[1]);
    assign proc_4_data_FIFO_blk[2] = 1'b0;
    assign proc_4_data_PIPO_blk[2] = 1'b0 | (~gate_cache_U.i_full_n & compute_gate_U0.ap_done & ap_done_reg_3 & ~gate_cache_U.t_read) | (~gate_cache_1_U.i_full_n & compute_gate_U0.ap_done & ap_done_reg_3 & ~gate_cache_1_U.t_read) | (~gate_cache_2_U.i_full_n & compute_gate_U0.ap_done & ap_done_reg_3 & ~gate_cache_2_U.t_read) | (~gate_cache_3_U.i_full_n & compute_gate_U0.ap_done & ap_done_reg_3 & ~gate_cache_3_U.t_read) | (~gate_cache_4_U.i_full_n & compute_gate_U0.ap_done & ap_done_reg_3 & ~gate_cache_4_U.t_read) | (~gate_cache_5_U.i_full_n & compute_gate_U0.ap_done & ap_done_reg_3 & ~gate_cache_5_U.t_read) | (~gate_cache_6_U.i_full_n & compute_gate_U0.ap_done & ap_done_reg_3 & ~gate_cache_6_U.t_read) | (~gate_cache_7_U.i_full_n & compute_gate_U0.ap_done & ap_done_reg_3 & ~gate_cache_7_U.t_read) | (~gate_cache_8_U.i_full_n & compute_gate_U0.ap_done & ap_done_reg_3 & ~gate_cache_8_U.t_read) | (~gate_cache_9_U.i_full_n & compute_gate_U0.ap_done & ap_done_reg_3 & ~gate_cache_9_U.t_read) | (~gate_cache_10_U.i_full_n & compute_gate_U0.ap_done & ap_done_reg_3 & ~gate_cache_10_U.t_read) | (~gate_cache_11_U.i_full_n & compute_gate_U0.ap_done & ap_done_reg_3 & ~gate_cache_11_U.t_read) | (~gate_cache_12_U.i_full_n & compute_gate_U0.ap_done & ap_done_reg_3 & ~gate_cache_12_U.t_read) | (~gate_cache_13_U.i_full_n & compute_gate_U0.ap_done & ap_done_reg_3 & ~gate_cache_13_U.t_read) | (~gate_cache_14_U.i_full_n & compute_gate_U0.ap_done & ap_done_reg_3 & ~gate_cache_14_U.t_read) | (~gate_cache_15_U.i_full_n & compute_gate_U0.ap_done & ap_done_reg_3 & ~gate_cache_15_U.t_read) | (~gate_cache_16_U.i_full_n & compute_gate_U0.ap_done & ap_done_reg_3 & ~gate_cache_16_U.t_read) | (~gate_cache_17_U.i_full_n & compute_gate_U0.ap_done & ap_done_reg_3 & ~gate_cache_17_U.t_read) | (~gate_cache_18_U.i_full_n & compute_gate_U0.ap_done & ap_done_reg_3 & ~gate_cache_18_U.t_read) | (~gate_cache_19_U.i_full_n & compute_gate_U0.ap_done & ap_done_reg_3 & ~gate_cache_19_U.t_read) | (~gate_cache_20_U.i_full_n & compute_gate_U0.ap_done & ap_done_reg_3 & ~gate_cache_20_U.t_read) | (~gate_cache_21_U.i_full_n & compute_gate_U0.ap_done & ap_done_reg_3 & ~gate_cache_21_U.t_read) | (~gate_cache_22_U.i_full_n & compute_gate_U0.ap_done & ap_done_reg_3 & ~gate_cache_22_U.t_read) | (~gate_cache_23_U.i_full_n & compute_gate_U0.ap_done & ap_done_reg_3 & ~gate_cache_23_U.t_read) | (~gate_cache_24_U.i_full_n & compute_gate_U0.ap_done & ap_done_reg_3 & ~gate_cache_24_U.t_read) | (~gate_cache_25_U.i_full_n & compute_gate_U0.ap_done & ap_done_reg_3 & ~gate_cache_25_U.t_read) | (~gate_cache_26_U.i_full_n & compute_gate_U0.ap_done & ap_done_reg_3 & ~gate_cache_26_U.t_read) | (~gate_cache_27_U.i_full_n & compute_gate_U0.ap_done & ap_done_reg_3 & ~gate_cache_27_U.t_read) | (~gate_cache_28_U.i_full_n & compute_gate_U0.ap_done & ap_done_reg_3 & ~gate_cache_28_U.t_read) | (~gate_cache_29_U.i_full_n & compute_gate_U0.ap_done & ap_done_reg_3 & ~gate_cache_29_U.t_read) | (~gate_cache_30_U.i_full_n & compute_gate_U0.ap_done & ap_done_reg_3 & ~gate_cache_30_U.t_read) | (~gate_cache_31_U.i_full_n & compute_gate_U0.ap_done & ap_done_reg_3 & ~gate_cache_31_U.t_read);
    assign proc_4_start_FIFO_blk[2] = 1'b0;
    assign proc_4_TLF_FIFO_blk[2] = 1'b0;
    assign proc_4_input_sync_blk[2] = 1'b0;
    assign proc_4_output_sync_blk[2] = 1'b0;
    assign proc_dep_vld_vec_4[2] = dl_detect_out ? proc_dep_vld_vec_4_reg[2] : (proc_4_data_FIFO_blk[2] | proc_4_data_PIPO_blk[2] | proc_4_start_FIFO_blk[2] | proc_4_TLF_FIFO_blk[2] | proc_4_input_sync_blk[2] | proc_4_output_sync_blk[2]);
    always @ (negedge dl_reset or posedge dl_clock) begin
        if (~dl_reset) begin
            proc_dep_vld_vec_4_reg <= 'b0;
        end
        else begin
            proc_dep_vld_vec_4_reg <= proc_dep_vld_vec_4;
        end
    end
    assign in_chan_dep_vld_vec_4[0] = dep_chan_vld_2_4;
    assign in_chan_dep_data_vec_4[5 : 0] = dep_chan_data_2_4;
    assign token_in_vec_4[0] = token_2_4;
    assign in_chan_dep_vld_vec_4[1] = dep_chan_vld_3_4;
    assign in_chan_dep_data_vec_4[11 : 6] = dep_chan_data_3_4;
    assign token_in_vec_4[1] = token_3_4;
    assign in_chan_dep_vld_vec_4[2] = dep_chan_vld_5_4;
    assign in_chan_dep_data_vec_4[17 : 12] = dep_chan_data_5_4;
    assign token_in_vec_4[2] = token_5_4;
    assign dep_chan_vld_4_2 = out_chan_dep_vld_vec_4[0];
    assign dep_chan_data_4_2 = out_chan_dep_data_4;
    assign token_4_2 = token_out_vec_4[0];
    assign dep_chan_vld_4_3 = out_chan_dep_vld_vec_4[1];
    assign dep_chan_data_4_3 = out_chan_dep_data_4;
    assign token_4_3 = token_out_vec_4[1];
    assign dep_chan_vld_4_5 = out_chan_dep_vld_vec_4[2];
    assign dep_chan_data_4_5 = out_chan_dep_data_4;
    assign token_4_5 = token_out_vec_4[2];

    // Process: compute_output_U0
    swiglu_hls_deadlock_detect_unit #(6, 5, 2, 2) swiglu_hls_deadlock_detect_unit_5 (
        .reset(dl_reset),
        .clock(dl_clock),
        .proc_dep_vld_vec(proc_dep_vld_vec_5),
        .in_chan_dep_vld_vec(in_chan_dep_vld_vec_5),
        .in_chan_dep_data_vec(in_chan_dep_data_vec_5),
        .token_in_vec(token_in_vec_5),
        .dl_detect_in(dl_detect_out),
        .origin(origin[5]),
        .token_clear(token_clear),
        .out_chan_dep_vld_vec(out_chan_dep_vld_vec_5),
        .out_chan_dep_data(out_chan_dep_data_5),
        .token_out_vec(token_out_vec_5),
        .dl_detect_out(dl_in_vec[5]));

    assign proc_5_data_FIFO_blk[0] = 1'b0;
    assign proc_5_data_PIPO_blk[0] = 1'b0 | (~gate_cache_U.t_empty_n & compute_output_U0.ap_idle & ~gate_cache_U.i_write) | (~gate_cache_1_U.t_empty_n & compute_output_U0.ap_idle & ~gate_cache_1_U.i_write) | (~gate_cache_2_U.t_empty_n & compute_output_U0.ap_idle & ~gate_cache_2_U.i_write) | (~gate_cache_3_U.t_empty_n & compute_output_U0.ap_idle & ~gate_cache_3_U.i_write) | (~gate_cache_4_U.t_empty_n & compute_output_U0.ap_idle & ~gate_cache_4_U.i_write) | (~gate_cache_5_U.t_empty_n & compute_output_U0.ap_idle & ~gate_cache_5_U.i_write) | (~gate_cache_6_U.t_empty_n & compute_output_U0.ap_idle & ~gate_cache_6_U.i_write) | (~gate_cache_7_U.t_empty_n & compute_output_U0.ap_idle & ~gate_cache_7_U.i_write) | (~gate_cache_8_U.t_empty_n & compute_output_U0.ap_idle & ~gate_cache_8_U.i_write) | (~gate_cache_9_U.t_empty_n & compute_output_U0.ap_idle & ~gate_cache_9_U.i_write) | (~gate_cache_10_U.t_empty_n & compute_output_U0.ap_idle & ~gate_cache_10_U.i_write) | (~gate_cache_11_U.t_empty_n & compute_output_U0.ap_idle & ~gate_cache_11_U.i_write) | (~gate_cache_12_U.t_empty_n & compute_output_U0.ap_idle & ~gate_cache_12_U.i_write) | (~gate_cache_13_U.t_empty_n & compute_output_U0.ap_idle & ~gate_cache_13_U.i_write) | (~gate_cache_14_U.t_empty_n & compute_output_U0.ap_idle & ~gate_cache_14_U.i_write) | (~gate_cache_15_U.t_empty_n & compute_output_U0.ap_idle & ~gate_cache_15_U.i_write) | (~gate_cache_16_U.t_empty_n & compute_output_U0.ap_idle & ~gate_cache_16_U.i_write) | (~gate_cache_17_U.t_empty_n & compute_output_U0.ap_idle & ~gate_cache_17_U.i_write) | (~gate_cache_18_U.t_empty_n & compute_output_U0.ap_idle & ~gate_cache_18_U.i_write) | (~gate_cache_19_U.t_empty_n & compute_output_U0.ap_idle & ~gate_cache_19_U.i_write) | (~gate_cache_20_U.t_empty_n & compute_output_U0.ap_idle & ~gate_cache_20_U.i_write) | (~gate_cache_21_U.t_empty_n & compute_output_U0.ap_idle & ~gate_cache_21_U.i_write) | (~gate_cache_22_U.t_empty_n & compute_output_U0.ap_idle & ~gate_cache_22_U.i_write) | (~gate_cache_23_U.t_empty_n & compute_output_U0.ap_idle & ~gate_cache_23_U.i_write) | (~gate_cache_24_U.t_empty_n & compute_output_U0.ap_idle & ~gate_cache_24_U.i_write) | (~gate_cache_25_U.t_empty_n & compute_output_U0.ap_idle & ~gate_cache_25_U.i_write) | (~gate_cache_26_U.t_empty_n & compute_output_U0.ap_idle & ~gate_cache_26_U.i_write) | (~gate_cache_27_U.t_empty_n & compute_output_U0.ap_idle & ~gate_cache_27_U.i_write) | (~gate_cache_28_U.t_empty_n & compute_output_U0.ap_idle & ~gate_cache_28_U.i_write) | (~gate_cache_29_U.t_empty_n & compute_output_U0.ap_idle & ~gate_cache_29_U.i_write) | (~gate_cache_30_U.t_empty_n & compute_output_U0.ap_idle & ~gate_cache_30_U.i_write) | (~gate_cache_31_U.t_empty_n & compute_output_U0.ap_idle & ~gate_cache_31_U.i_write);
    assign proc_5_start_FIFO_blk[0] = 1'b0;
    assign proc_5_TLF_FIFO_blk[0] = 1'b0 | (~gate_scale_U.if_empty_n & compute_output_U0.ap_idle & ~gate_scale_U.if_write);
    assign proc_5_input_sync_blk[0] = 1'b0;
    assign proc_5_output_sync_blk[0] = 1'b0;
    assign proc_dep_vld_vec_5[0] = dl_detect_out ? proc_dep_vld_vec_5_reg[0] : (proc_5_data_FIFO_blk[0] | proc_5_data_PIPO_blk[0] | proc_5_start_FIFO_blk[0] | proc_5_TLF_FIFO_blk[0] | proc_5_input_sync_blk[0] | proc_5_output_sync_blk[0]);
    assign proc_5_data_FIFO_blk[1] = 1'b0 | (~compute_output_U0.W_down_blk_n) | (~compute_output_U0.out_batch_blk_n) | (~compute_output_U0.down_quant_mode_blk_n);
    assign proc_5_data_PIPO_blk[1] = 1'b0;
    assign proc_5_start_FIFO_blk[1] = 1'b0;
    assign proc_5_TLF_FIFO_blk[1] = 1'b0;
    assign proc_5_input_sync_blk[1] = 1'b0;
    assign proc_5_output_sync_blk[1] = 1'b0;
    assign proc_dep_vld_vec_5[1] = dl_detect_out ? proc_dep_vld_vec_5_reg[1] : (proc_5_data_FIFO_blk[1] | proc_5_data_PIPO_blk[1] | proc_5_start_FIFO_blk[1] | proc_5_TLF_FIFO_blk[1] | proc_5_input_sync_blk[1] | proc_5_output_sync_blk[1]);
    always @ (negedge dl_reset or posedge dl_clock) begin
        if (~dl_reset) begin
            proc_dep_vld_vec_5_reg <= 'b0;
        end
        else begin
            proc_dep_vld_vec_5_reg <= proc_dep_vld_vec_5;
        end
    end
    assign in_chan_dep_vld_vec_5[0] = dep_chan_vld_0_5;
    assign in_chan_dep_data_vec_5[5 : 0] = dep_chan_data_0_5;
    assign token_in_vec_5[0] = token_0_5;
    assign in_chan_dep_vld_vec_5[1] = dep_chan_vld_4_5;
    assign in_chan_dep_data_vec_5[11 : 6] = dep_chan_data_4_5;
    assign token_in_vec_5[1] = token_4_5;
    assign dep_chan_vld_5_4 = out_chan_dep_vld_vec_5[0];
    assign dep_chan_data_5_4 = out_chan_dep_data_5;
    assign token_5_4 = token_out_vec_5[0];
    assign dep_chan_vld_5_0 = out_chan_dep_vld_vec_5[1];
    assign dep_chan_data_5_0 = out_chan_dep_data_5;
    assign token_5_0 = token_out_vec_5[1];


`include "swiglu_hls_deadlock_report_unit.vh"
