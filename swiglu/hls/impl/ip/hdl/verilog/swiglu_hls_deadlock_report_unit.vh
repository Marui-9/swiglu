   
    parameter PROC_NUM = 6;
    parameter ST_IDLE = 3'b000;
    parameter ST_FILTER_FAKE = 3'b001;
    parameter ST_DL_DETECTED = 3'b010;
    parameter ST_DL_REPORT = 3'b100;
   

    reg [2:0] CS_fsm;
    reg [2:0] NS_fsm;
    reg [PROC_NUM - 1:0] dl_detect_reg;
    reg [PROC_NUM - 1:0] dl_done_reg;
    reg [PROC_NUM - 1:0] origin_reg;
    reg [PROC_NUM - 1:0] dl_in_vec_reg;
    reg [31:0] dl_keep_cnt;
    reg stop_report_path;
    reg [PROC_NUM - 1:0] reported_proc;
    integer i;
    integer fp;

    always @ (negedge dl_reset or posedge dl_clock) begin
        if (~dl_reset) begin
            reported_proc <= 'b0;
        end
        else if (CS_fsm == ST_DL_REPORT) begin
            reported_proc <= reported_proc | dl_in_vec;
        end
        else if (CS_fsm == ST_DL_DETECTED) begin
            reported_proc <= 'b0;
        end
    end

    always @ (negedge dl_reset or posedge dl_clock) begin
        if (~dl_reset) begin
            stop_report_path <= 1'b0;
        end
        else if (CS_fsm == ST_DL_REPORT && (|(dl_in_vec & reported_proc))) begin
            stop_report_path <= 1'b1;
        end
        else if (CS_fsm == ST_IDLE) begin
            stop_report_path <= 1'b0;
        end
    end

    // FSM State machine
    always @ (negedge dl_reset or posedge dl_clock) begin
        if (~dl_reset) begin
            CS_fsm <= ST_IDLE;
        end
        else begin
            CS_fsm <= NS_fsm;
        end
    end

    always @ (CS_fsm or dl_in_vec or dl_detect_reg or dl_done_reg or dl_in_vec or origin_reg or dl_keep_cnt) begin
        case (CS_fsm)
            ST_IDLE : begin
                if (|dl_in_vec) begin
                    NS_fsm = ST_FILTER_FAKE;
                end
                else begin
                    NS_fsm = ST_IDLE;
                end
            end
            ST_FILTER_FAKE: begin
                if (dl_keep_cnt >= 32'd1000) begin
                    NS_fsm = ST_DL_DETECTED;
                end
                else if (dl_detect_reg != (dl_detect_reg & dl_in_vec)) begin
                    NS_fsm = ST_IDLE;
                end
                else begin
                    NS_fsm = ST_FILTER_FAKE;
                end
            end
            ST_DL_DETECTED: begin
                // has unreported deadlock cycle
                if ((dl_detect_reg != dl_done_reg) && stop_report_path == 1'b0) begin
                    NS_fsm = ST_DL_REPORT;
                end
                else begin
                    NS_fsm = ST_DL_DETECTED;
                end
            end
            ST_DL_REPORT: begin
                if (|(dl_in_vec & origin_reg)) begin
                    NS_fsm = ST_DL_DETECTED;
                end
                // avoid report deadlock ring.
                else if (|(dl_in_vec & reported_proc)) begin
                    NS_fsm = ST_DL_DETECTED;
                end
                else begin
                    NS_fsm = ST_DL_REPORT;
                end
            end
            default: NS_fsm = ST_IDLE;
        endcase
    end

    // dl_detect_reg record the procs that first detect deadlock
    always @ (negedge dl_reset or posedge dl_clock) begin
        if (~dl_reset) begin
            dl_detect_reg <= 'b0;
        end
        else begin
            if (CS_fsm == ST_IDLE) begin
                dl_detect_reg <= dl_in_vec;
            end
        end
    end

    always @ (negedge dl_reset or posedge dl_clock) begin
        if (~dl_reset) begin
            dl_keep_cnt <= 32'h0;
        end
        else begin
            if (CS_fsm == ST_FILTER_FAKE && (dl_detect_reg == (dl_detect_reg & dl_in_vec))) begin
                dl_keep_cnt <= dl_keep_cnt + 32'h1;
            end
            else if (CS_fsm == ST_FILTER_FAKE && (dl_detect_reg != (dl_detect_reg & dl_in_vec))) begin
                dl_keep_cnt <= 32'h0;
            end
        end
    end

    // dl_detect_out keeps in high after deadlock detected
    assign dl_detect_out = (|dl_detect_reg) && (CS_fsm == ST_DL_DETECTED || CS_fsm == ST_DL_REPORT);

    // dl_done_reg record the cycles has been reported
    always @ (negedge dl_reset or posedge dl_clock) begin
        if (~dl_reset) begin
            dl_done_reg <= 'b0;
        end
        else begin
            if ((CS_fsm == ST_DL_REPORT) && (|(dl_in_vec & dl_detect_reg) == 'b1)) begin
                dl_done_reg <= dl_done_reg | dl_in_vec;
            end
        end
    end

    // clear token once a cycle is done
    assign token_clear = (CS_fsm == ST_DL_REPORT) ? ((|(dl_in_vec & origin_reg)) ? 'b1 : 'b0) : 'b0;

    // origin_reg record the current cycle start id
    always @ (negedge dl_reset or posedge dl_clock) begin
        if (~dl_reset) begin
            origin_reg <= 'b0;
        end
        else begin
            if (CS_fsm == ST_DL_DETECTED) begin
                origin_reg <= origin;
            end
        end
    end
   
    // origin will be valid for only one cycle
    wire [PROC_NUM*PROC_NUM - 1:0] origin_tmp;
    assign origin_tmp[PROC_NUM - 1:0] = (dl_detect_reg[0] & ~dl_done_reg[0]) ? 'b1 : 'b0;
    genvar j;
    generate
    for(j = 1;j < PROC_NUM;j = j + 1) begin: F1
        assign origin_tmp[j*PROC_NUM +: PROC_NUM] = (dl_detect_reg[j] & ~dl_done_reg[j]) ? ('b1 << j) : origin_tmp[(j - 1)*PROC_NUM +: PROC_NUM];
    end
    endgenerate
    always @ (CS_fsm or origin_tmp) begin
        if (CS_fsm == ST_DL_DETECTED) begin
            origin = origin_tmp[(PROC_NUM - 1)*PROC_NUM +: PROC_NUM];
        end
        else begin
            origin = 'b0;
        end
    end

    
    // dl_in_vec_reg record the current cycle dl_in_vec
    always @ (negedge dl_reset or posedge dl_clock) begin
        if (~dl_reset) begin
            dl_in_vec_reg <= 'b0;
        end
        else begin
            if (CS_fsm == ST_DL_DETECTED) begin
                dl_in_vec_reg <= origin;
            end
            else if (CS_fsm == ST_DL_REPORT) begin
                dl_in_vec_reg <= dl_in_vec;
            end
        end
    end
    
    // find_df_deadlock to report the deadlock
    always @ (negedge dl_reset or posedge dl_clock) begin
        if (~dl_reset) begin
            find_df_deadlock <= 1'b0;
        end
        else begin
            if (CS_fsm == ST_DL_DETECTED && ((dl_detect_reg == dl_done_reg) || (stop_report_path == 1'b1))) begin
                find_df_deadlock <= 1'b1;
            end
            else if (CS_fsm == ST_IDLE) begin
                find_df_deadlock <= 1'b0;
            end
        end
    end
    
    // get the first valid proc index in dl vector
    function integer proc_index(input [PROC_NUM - 1:0] dl_vec);
        begin
            proc_index = 0;
            for (i = 0; i < PROC_NUM; i = i + 1) begin
                if (dl_vec[i]) begin
                    proc_index = i;
                end
            end
        end
    endfunction

    // get the proc path based on dl vector
    function [288:0] proc_path(input [PROC_NUM - 1:0] dl_vec);
        integer index;
        begin
            index = proc_index(dl_vec);
            case (index)
                0 : begin
                    proc_path = "swiglu_swiglu.entry_proc_U0";
                end
                1 : begin
                    proc_path = "swiglu_swiglu.load_x_local_U0";
                end
                2 : begin
                    proc_path = "swiglu_swiglu.compute_X1_U0";
                end
                3 : begin
                    proc_path = "swiglu_swiglu.compute_X2_U0";
                end
                4 : begin
                    proc_path = "swiglu_swiglu.compute_gate_U0";
                end
                5 : begin
                    proc_path = "swiglu_swiglu.compute_output_U0";
                end
                default : begin
                    proc_path = "unknown";
                end
            endcase
        end
    endfunction

    // print the headlines of deadlock detection
    task print_dl_head;
        begin
            $display("\n//////////////////////////////////////////////////////////////////////////////");
            $display("// ERROR!!! DEADLOCK DETECTED at %0t ns! SIMULATION WILL BE STOPPED! //", $time);
            $display("//////////////////////////////////////////////////////////////////////////////");
            fp = $fopen("deadlock_db.dat", "w");
        end
    endtask

    // print the start of a cycle
    task print_cycle_start(input reg [288:0] proc_path, input integer cycle_id);
        begin
            $display("/////////////////////////");
            $display("// Dependence cycle %0d:", cycle_id);
            $display("// (1): Process: %0s", proc_path);
            $fdisplay(fp, "Dependence_Cycle_ID %0d", cycle_id);
            $fdisplay(fp, "Dependence_Process_ID 1");
            $fdisplay(fp, "Dependence_Process_path %0s", proc_path);
        end
    endtask

    // print the end of deadlock detection
    task print_dl_end(input integer num, input integer record_time);
        begin
            $display("////////////////////////////////////////////////////////////////////////");
            $display("// Totally %0d cycles detected!", num);
            $display("////////////////////////////////////////////////////////////////////////");
            $display("// ERROR!!! DEADLOCK DETECTED at %0t ns! SIMULATION WILL BE STOPPED! //", record_time);
            $display("//////////////////////////////////////////////////////////////////////////////");
            $fdisplay(fp, "Dependence_Cycle_Number %0d", num);
            $fclose(fp);
        end
    endtask

    // print one proc component in the cycle
    task print_cycle_proc_comp(input reg [288:0] proc_path, input integer cycle_comp_id);
        begin
            $display("// (%0d): Process: %0s", cycle_comp_id, proc_path);
            $fdisplay(fp, "Dependence_Process_ID %0d", cycle_comp_id);
            $fdisplay(fp, "Dependence_Process_path %0s", proc_path);
        end
    endtask

    // print one channel component in the cycle
    task print_cycle_chan_comp(input [PROC_NUM - 1:0] dl_vec1, input [PROC_NUM - 1:0] dl_vec2);
        reg [368:0] chan_path;
        integer index1;
        integer index2;
        begin
            index1 = proc_index(dl_vec1);
            index2 = proc_index(dl_vec2);
            case (index1)
                0 : begin // for proc 'swiglu_swiglu.entry_proc_U0'
                    case(index2)
                    2: begin //  for dep proc 'swiglu_swiglu.compute_X1_U0'
// for dep channel 'swiglu_swiglu.W_c_U' info is :
// blk sig is {~swiglu_swiglu_inst.entry_proc_U0.W_c_blk_n data_FIFO}
                        if ((~entry_proc_U0.W_c_blk_n)) begin
                            if (~W_c_U.if_empty_n) begin
                                $display("//      Blocked by empty input FIFO 'swiglu_swiglu.W_c_U' written by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.W_c_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~W_c_U.if_full_n) begin
                                $display("//      Blocked by full output FIFO 'swiglu_swiglu.W_c_U' read by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.W_c_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_scale_c1_U' info is :
// blk sig is {~swiglu_swiglu_inst.entry_proc_U0.x_scale_c1_blk_n data_FIFO}
                        if ((~entry_proc_U0.x_scale_c1_blk_n)) begin
                            if (~x_scale_c1_U.if_empty_n) begin
                                $display("//      Blocked by empty input FIFO 'swiglu_swiglu.x_scale_c1_U' written by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_scale_c1_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_scale_c1_U.if_full_n) begin
                                $display("//      Blocked by full output FIFO 'swiglu_swiglu.x_scale_c1_U' read by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_scale_c1_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
                    end
                    3: begin //  for dep proc 'swiglu_swiglu.compute_X2_U0'
// for dep channel 'swiglu_swiglu.V_c_U' info is :
// blk sig is {~swiglu_swiglu_inst.entry_proc_U0.V_c_blk_n data_FIFO}
                        if ((~entry_proc_U0.V_c_blk_n)) begin
                            if (~V_c_U.if_empty_n) begin
                                $display("//      Blocked by empty input FIFO 'swiglu_swiglu.V_c_U' written by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.V_c_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~V_c_U.if_full_n) begin
                                $display("//      Blocked by full output FIFO 'swiglu_swiglu.V_c_U' read by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.V_c_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_scale_c_U' info is :
// blk sig is {~swiglu_swiglu_inst.entry_proc_U0.x_scale_c_blk_n data_FIFO}
                        if ((~entry_proc_U0.x_scale_c_blk_n)) begin
                            if (~x_scale_c_U.if_empty_n) begin
                                $display("//      Blocked by empty input FIFO 'swiglu_swiglu.x_scale_c_U' written by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_scale_c_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_scale_c_U.if_full_n) begin
                                $display("//      Blocked by full output FIFO 'swiglu_swiglu.x_scale_c_U' read by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_scale_c_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
                    end
                    5: begin //  for dep proc 'swiglu_swiglu.compute_output_U0'
// for dep channel 'swiglu_swiglu.W_down_c_U' info is :
// blk sig is {~swiglu_swiglu_inst.entry_proc_U0.W_down_c_blk_n data_FIFO}
                        if ((~entry_proc_U0.W_down_c_blk_n)) begin
                            if (~W_down_c_U.if_empty_n) begin
                                $display("//      Blocked by empty input FIFO 'swiglu_swiglu.W_down_c_U' written by process 'swiglu_swiglu.compute_output_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.W_down_c_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~W_down_c_U.if_full_n) begin
                                $display("//      Blocked by full output FIFO 'swiglu_swiglu.W_down_c_U' read by process 'swiglu_swiglu.compute_output_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.W_down_c_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.out_batch_c_U' info is :
// blk sig is {~swiglu_swiglu_inst.entry_proc_U0.out_batch_c_blk_n data_FIFO}
                        if ((~entry_proc_U0.out_batch_c_blk_n)) begin
                            if (~out_batch_c_U.if_empty_n) begin
                                $display("//      Blocked by empty input FIFO 'swiglu_swiglu.out_batch_c_U' written by process 'swiglu_swiglu.compute_output_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.out_batch_c_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~out_batch_c_U.if_full_n) begin
                                $display("//      Blocked by full output FIFO 'swiglu_swiglu.out_batch_c_U' read by process 'swiglu_swiglu.compute_output_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.out_batch_c_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.down_quant_mode_c_U' info is :
// blk sig is {~swiglu_swiglu_inst.entry_proc_U0.down_quant_mode_c_blk_n data_FIFO}
                        if ((~entry_proc_U0.down_quant_mode_c_blk_n)) begin
                            if (~down_quant_mode_c_U.if_empty_n) begin
                                $display("//      Blocked by empty input FIFO 'swiglu_swiglu.down_quant_mode_c_U' written by process 'swiglu_swiglu.compute_output_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.down_quant_mode_c_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~down_quant_mode_c_U.if_full_n) begin
                                $display("//      Blocked by full output FIFO 'swiglu_swiglu.down_quant_mode_c_U' read by process 'swiglu_swiglu.compute_output_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.down_quant_mode_c_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
                    end
                    1: begin //  for dep proc 'swiglu_swiglu.load_x_local_U0'
// for dep channel '' info is :
// blk sig is {{swiglu_swiglu_inst.ap_sync_entry_proc_U0_ap_ready & swiglu_swiglu_inst.entry_proc_U0.ap_idle & ~swiglu_swiglu_inst.ap_sync_load_x_local_U0_ap_ready} input_sync}
                        if ((ap_sync_entry_proc_U0_ap_ready & entry_proc_U0.ap_idle & ~ap_sync_load_x_local_U0_ap_ready)) begin
                            $display("//      Blocked by input sync logic with process : 'swiglu_swiglu.load_x_local_U0'");
                        end
                    end
                    endcase
                end
                1 : begin // for proc 'swiglu_swiglu.load_x_local_U0'
                    case(index2)
                    2: begin //  for dep proc 'swiglu_swiglu.compute_X1_U0'
// for dep channel 'swiglu_swiglu.x_local_1_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_1_U.t_read} data_PIPO}
                        if ((~x_local_1_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_U.t_read)) begin
                            if (~x_local_1_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_U' written by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_U' read by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_1_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_1_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_1_1_U.t_read} data_PIPO}
                        if ((~x_local_1_1_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_1_U.t_read)) begin
                            if (~x_local_1_1_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_1_U' written by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_1_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_1_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_1_U' read by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_1_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_2_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_2_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_1_2_U.t_read} data_PIPO}
                        if ((~x_local_1_2_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_2_U.t_read)) begin
                            if (~x_local_1_2_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_2_U' written by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_2_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_2_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_2_U' read by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_2_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_3_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_3_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_1_3_U.t_read} data_PIPO}
                        if ((~x_local_1_3_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_3_U.t_read)) begin
                            if (~x_local_1_3_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_3_U' written by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_3_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_3_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_3_U' read by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_3_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_4_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_4_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_1_4_U.t_read} data_PIPO}
                        if ((~x_local_1_4_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_4_U.t_read)) begin
                            if (~x_local_1_4_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_4_U' written by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_4_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_4_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_4_U' read by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_4_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_5_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_5_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_1_5_U.t_read} data_PIPO}
                        if ((~x_local_1_5_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_5_U.t_read)) begin
                            if (~x_local_1_5_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_5_U' written by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_5_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_5_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_5_U' read by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_5_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_6_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_6_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_1_6_U.t_read} data_PIPO}
                        if ((~x_local_1_6_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_6_U.t_read)) begin
                            if (~x_local_1_6_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_6_U' written by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_6_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_6_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_6_U' read by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_6_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_7_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_7_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_1_7_U.t_read} data_PIPO}
                        if ((~x_local_1_7_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_7_U.t_read)) begin
                            if (~x_local_1_7_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_7_U' written by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_7_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_7_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_7_U' read by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_7_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_8_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_8_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_1_8_U.t_read} data_PIPO}
                        if ((~x_local_1_8_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_8_U.t_read)) begin
                            if (~x_local_1_8_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_8_U' written by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_8_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_8_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_8_U' read by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_8_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_9_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_9_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_1_9_U.t_read} data_PIPO}
                        if ((~x_local_1_9_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_9_U.t_read)) begin
                            if (~x_local_1_9_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_9_U' written by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_9_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_9_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_9_U' read by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_9_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_10_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_10_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_1_10_U.t_read} data_PIPO}
                        if ((~x_local_1_10_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_10_U.t_read)) begin
                            if (~x_local_1_10_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_10_U' written by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_10_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_10_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_10_U' read by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_10_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_11_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_11_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_1_11_U.t_read} data_PIPO}
                        if ((~x_local_1_11_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_11_U.t_read)) begin
                            if (~x_local_1_11_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_11_U' written by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_11_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_11_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_11_U' read by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_11_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_12_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_12_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_1_12_U.t_read} data_PIPO}
                        if ((~x_local_1_12_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_12_U.t_read)) begin
                            if (~x_local_1_12_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_12_U' written by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_12_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_12_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_12_U' read by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_12_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_13_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_13_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_1_13_U.t_read} data_PIPO}
                        if ((~x_local_1_13_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_13_U.t_read)) begin
                            if (~x_local_1_13_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_13_U' written by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_13_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_13_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_13_U' read by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_13_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_14_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_14_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_1_14_U.t_read} data_PIPO}
                        if ((~x_local_1_14_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_14_U.t_read)) begin
                            if (~x_local_1_14_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_14_U' written by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_14_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_14_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_14_U' read by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_14_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_15_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_15_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_1_15_U.t_read} data_PIPO}
                        if ((~x_local_1_15_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_15_U.t_read)) begin
                            if (~x_local_1_15_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_15_U' written by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_15_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_15_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_15_U' read by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_15_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_16_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_16_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_1_16_U.t_read} data_PIPO}
                        if ((~x_local_1_16_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_16_U.t_read)) begin
                            if (~x_local_1_16_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_16_U' written by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_16_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_16_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_16_U' read by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_16_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_17_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_17_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_1_17_U.t_read} data_PIPO}
                        if ((~x_local_1_17_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_17_U.t_read)) begin
                            if (~x_local_1_17_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_17_U' written by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_17_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_17_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_17_U' read by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_17_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_18_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_18_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_1_18_U.t_read} data_PIPO}
                        if ((~x_local_1_18_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_18_U.t_read)) begin
                            if (~x_local_1_18_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_18_U' written by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_18_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_18_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_18_U' read by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_18_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_19_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_19_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_1_19_U.t_read} data_PIPO}
                        if ((~x_local_1_19_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_19_U.t_read)) begin
                            if (~x_local_1_19_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_19_U' written by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_19_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_19_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_19_U' read by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_19_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_20_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_20_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_1_20_U.t_read} data_PIPO}
                        if ((~x_local_1_20_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_20_U.t_read)) begin
                            if (~x_local_1_20_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_20_U' written by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_20_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_20_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_20_U' read by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_20_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_21_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_21_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_1_21_U.t_read} data_PIPO}
                        if ((~x_local_1_21_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_21_U.t_read)) begin
                            if (~x_local_1_21_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_21_U' written by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_21_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_21_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_21_U' read by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_21_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_22_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_22_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_1_22_U.t_read} data_PIPO}
                        if ((~x_local_1_22_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_22_U.t_read)) begin
                            if (~x_local_1_22_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_22_U' written by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_22_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_22_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_22_U' read by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_22_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_23_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_23_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_1_23_U.t_read} data_PIPO}
                        if ((~x_local_1_23_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_23_U.t_read)) begin
                            if (~x_local_1_23_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_23_U' written by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_23_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_23_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_23_U' read by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_23_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_24_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_24_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_1_24_U.t_read} data_PIPO}
                        if ((~x_local_1_24_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_24_U.t_read)) begin
                            if (~x_local_1_24_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_24_U' written by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_24_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_24_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_24_U' read by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_24_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_25_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_25_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_1_25_U.t_read} data_PIPO}
                        if ((~x_local_1_25_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_25_U.t_read)) begin
                            if (~x_local_1_25_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_25_U' written by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_25_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_25_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_25_U' read by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_25_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_26_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_26_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_1_26_U.t_read} data_PIPO}
                        if ((~x_local_1_26_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_26_U.t_read)) begin
                            if (~x_local_1_26_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_26_U' written by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_26_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_26_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_26_U' read by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_26_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_27_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_27_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_1_27_U.t_read} data_PIPO}
                        if ((~x_local_1_27_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_27_U.t_read)) begin
                            if (~x_local_1_27_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_27_U' written by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_27_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_27_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_27_U' read by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_27_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_28_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_28_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_1_28_U.t_read} data_PIPO}
                        if ((~x_local_1_28_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_28_U.t_read)) begin
                            if (~x_local_1_28_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_28_U' written by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_28_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_28_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_28_U' read by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_28_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_29_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_29_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_1_29_U.t_read} data_PIPO}
                        if ((~x_local_1_29_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_29_U.t_read)) begin
                            if (~x_local_1_29_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_29_U' written by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_29_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_29_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_29_U' read by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_29_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_30_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_30_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_1_30_U.t_read} data_PIPO}
                        if ((~x_local_1_30_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_30_U.t_read)) begin
                            if (~x_local_1_30_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_30_U' written by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_30_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_30_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_30_U' read by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_30_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_31_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_31_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_1_31_U.t_read} data_PIPO}
                        if ((~x_local_1_31_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_31_U.t_read)) begin
                            if (~x_local_1_31_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_31_U' written by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_31_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_31_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_31_U' read by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_31_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_32_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_32_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_1_32_U.t_read} data_PIPO}
                        if ((~x_local_1_32_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_32_U.t_read)) begin
                            if (~x_local_1_32_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_32_U' written by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_32_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_32_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_32_U' read by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_32_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_33_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_33_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_1_33_U.t_read} data_PIPO}
                        if ((~x_local_1_33_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_33_U.t_read)) begin
                            if (~x_local_1_33_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_33_U' written by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_33_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_33_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_33_U' read by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_33_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_34_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_34_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_1_34_U.t_read} data_PIPO}
                        if ((~x_local_1_34_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_34_U.t_read)) begin
                            if (~x_local_1_34_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_34_U' written by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_34_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_34_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_34_U' read by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_34_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_35_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_35_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_1_35_U.t_read} data_PIPO}
                        if ((~x_local_1_35_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_35_U.t_read)) begin
                            if (~x_local_1_35_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_35_U' written by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_35_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_35_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_35_U' read by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_35_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_36_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_36_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_1_36_U.t_read} data_PIPO}
                        if ((~x_local_1_36_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_36_U.t_read)) begin
                            if (~x_local_1_36_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_36_U' written by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_36_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_36_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_36_U' read by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_36_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_37_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_37_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_1_37_U.t_read} data_PIPO}
                        if ((~x_local_1_37_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_37_U.t_read)) begin
                            if (~x_local_1_37_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_37_U' written by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_37_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_37_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_37_U' read by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_37_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_38_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_38_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_1_38_U.t_read} data_PIPO}
                        if ((~x_local_1_38_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_38_U.t_read)) begin
                            if (~x_local_1_38_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_38_U' written by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_38_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_38_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_38_U' read by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_38_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_39_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_39_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_1_39_U.t_read} data_PIPO}
                        if ((~x_local_1_39_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_39_U.t_read)) begin
                            if (~x_local_1_39_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_39_U' written by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_39_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_39_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_39_U' read by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_39_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_40_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_40_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_1_40_U.t_read} data_PIPO}
                        if ((~x_local_1_40_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_40_U.t_read)) begin
                            if (~x_local_1_40_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_40_U' written by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_40_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_40_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_40_U' read by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_40_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_41_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_41_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_1_41_U.t_read} data_PIPO}
                        if ((~x_local_1_41_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_41_U.t_read)) begin
                            if (~x_local_1_41_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_41_U' written by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_41_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_41_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_41_U' read by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_41_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_42_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_42_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_1_42_U.t_read} data_PIPO}
                        if ((~x_local_1_42_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_42_U.t_read)) begin
                            if (~x_local_1_42_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_42_U' written by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_42_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_42_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_42_U' read by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_42_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_43_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_43_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_1_43_U.t_read} data_PIPO}
                        if ((~x_local_1_43_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_43_U.t_read)) begin
                            if (~x_local_1_43_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_43_U' written by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_43_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_43_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_43_U' read by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_43_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_44_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_44_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_1_44_U.t_read} data_PIPO}
                        if ((~x_local_1_44_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_44_U.t_read)) begin
                            if (~x_local_1_44_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_44_U' written by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_44_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_44_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_44_U' read by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_44_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_45_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_45_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_1_45_U.t_read} data_PIPO}
                        if ((~x_local_1_45_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_45_U.t_read)) begin
                            if (~x_local_1_45_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_45_U' written by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_45_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_45_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_45_U' read by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_45_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_46_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_46_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_1_46_U.t_read} data_PIPO}
                        if ((~x_local_1_46_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_46_U.t_read)) begin
                            if (~x_local_1_46_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_46_U' written by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_46_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_46_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_46_U' read by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_46_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_47_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_47_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_1_47_U.t_read} data_PIPO}
                        if ((~x_local_1_47_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_47_U.t_read)) begin
                            if (~x_local_1_47_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_47_U' written by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_47_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_47_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_47_U' read by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_47_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_48_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_48_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_1_48_U.t_read} data_PIPO}
                        if ((~x_local_1_48_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_48_U.t_read)) begin
                            if (~x_local_1_48_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_48_U' written by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_48_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_48_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_48_U' read by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_48_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_49_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_49_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_1_49_U.t_read} data_PIPO}
                        if ((~x_local_1_49_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_49_U.t_read)) begin
                            if (~x_local_1_49_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_49_U' written by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_49_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_49_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_49_U' read by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_49_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_50_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_50_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_1_50_U.t_read} data_PIPO}
                        if ((~x_local_1_50_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_50_U.t_read)) begin
                            if (~x_local_1_50_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_50_U' written by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_50_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_50_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_50_U' read by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_50_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_51_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_51_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_1_51_U.t_read} data_PIPO}
                        if ((~x_local_1_51_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_51_U.t_read)) begin
                            if (~x_local_1_51_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_51_U' written by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_51_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_51_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_51_U' read by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_51_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_52_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_52_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_1_52_U.t_read} data_PIPO}
                        if ((~x_local_1_52_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_52_U.t_read)) begin
                            if (~x_local_1_52_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_52_U' written by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_52_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_52_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_52_U' read by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_52_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_53_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_53_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_1_53_U.t_read} data_PIPO}
                        if ((~x_local_1_53_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_53_U.t_read)) begin
                            if (~x_local_1_53_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_53_U' written by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_53_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_53_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_53_U' read by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_53_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_54_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_54_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_1_54_U.t_read} data_PIPO}
                        if ((~x_local_1_54_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_54_U.t_read)) begin
                            if (~x_local_1_54_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_54_U' written by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_54_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_54_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_54_U' read by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_54_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_55_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_55_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_1_55_U.t_read} data_PIPO}
                        if ((~x_local_1_55_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_55_U.t_read)) begin
                            if (~x_local_1_55_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_55_U' written by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_55_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_55_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_55_U' read by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_55_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_56_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_56_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_1_56_U.t_read} data_PIPO}
                        if ((~x_local_1_56_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_56_U.t_read)) begin
                            if (~x_local_1_56_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_56_U' written by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_56_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_56_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_56_U' read by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_56_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_57_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_57_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_1_57_U.t_read} data_PIPO}
                        if ((~x_local_1_57_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_57_U.t_read)) begin
                            if (~x_local_1_57_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_57_U' written by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_57_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_57_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_57_U' read by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_57_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_58_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_58_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_1_58_U.t_read} data_PIPO}
                        if ((~x_local_1_58_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_58_U.t_read)) begin
                            if (~x_local_1_58_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_58_U' written by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_58_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_58_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_58_U' read by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_58_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_59_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_59_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_1_59_U.t_read} data_PIPO}
                        if ((~x_local_1_59_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_59_U.t_read)) begin
                            if (~x_local_1_59_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_59_U' written by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_59_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_59_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_59_U' read by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_59_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_60_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_60_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_1_60_U.t_read} data_PIPO}
                        if ((~x_local_1_60_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_60_U.t_read)) begin
                            if (~x_local_1_60_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_60_U' written by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_60_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_60_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_60_U' read by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_60_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_61_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_61_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_1_61_U.t_read} data_PIPO}
                        if ((~x_local_1_61_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_61_U.t_read)) begin
                            if (~x_local_1_61_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_61_U' written by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_61_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_61_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_61_U' read by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_61_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_62_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_62_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_1_62_U.t_read} data_PIPO}
                        if ((~x_local_1_62_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_62_U.t_read)) begin
                            if (~x_local_1_62_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_62_U' written by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_62_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_62_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_62_U' read by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_62_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_63_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_63_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_1_63_U.t_read} data_PIPO}
                        if ((~x_local_1_63_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_63_U.t_read)) begin
                            if (~x_local_1_63_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_63_U' written by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_63_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_63_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_63_U' read by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_63_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_64_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_64_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_1_64_U.t_read} data_PIPO}
                        if ((~x_local_1_64_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_64_U.t_read)) begin
                            if (~x_local_1_64_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_64_U' written by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_64_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_64_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_64_U' read by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_64_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_65_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_65_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_1_65_U.t_read} data_PIPO}
                        if ((~x_local_1_65_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_65_U.t_read)) begin
                            if (~x_local_1_65_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_65_U' written by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_65_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_65_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_65_U' read by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_65_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_66_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_66_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_1_66_U.t_read} data_PIPO}
                        if ((~x_local_1_66_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_66_U.t_read)) begin
                            if (~x_local_1_66_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_66_U' written by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_66_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_66_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_66_U' read by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_66_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_67_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_67_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_1_67_U.t_read} data_PIPO}
                        if ((~x_local_1_67_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_67_U.t_read)) begin
                            if (~x_local_1_67_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_67_U' written by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_67_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_67_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_67_U' read by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_67_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_68_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_68_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_1_68_U.t_read} data_PIPO}
                        if ((~x_local_1_68_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_68_U.t_read)) begin
                            if (~x_local_1_68_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_68_U' written by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_68_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_68_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_68_U' read by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_68_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_69_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_69_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_1_69_U.t_read} data_PIPO}
                        if ((~x_local_1_69_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_69_U.t_read)) begin
                            if (~x_local_1_69_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_69_U' written by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_69_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_69_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_69_U' read by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_69_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_70_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_70_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_1_70_U.t_read} data_PIPO}
                        if ((~x_local_1_70_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_70_U.t_read)) begin
                            if (~x_local_1_70_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_70_U' written by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_70_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_70_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_70_U' read by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_70_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_71_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_71_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_1_71_U.t_read} data_PIPO}
                        if ((~x_local_1_71_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_71_U.t_read)) begin
                            if (~x_local_1_71_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_71_U' written by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_71_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_71_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_71_U' read by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_71_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_72_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_72_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_1_72_U.t_read} data_PIPO}
                        if ((~x_local_1_72_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_72_U.t_read)) begin
                            if (~x_local_1_72_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_72_U' written by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_72_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_72_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_72_U' read by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_72_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_73_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_73_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_1_73_U.t_read} data_PIPO}
                        if ((~x_local_1_73_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_73_U.t_read)) begin
                            if (~x_local_1_73_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_73_U' written by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_73_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_73_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_73_U' read by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_73_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_74_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_74_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_1_74_U.t_read} data_PIPO}
                        if ((~x_local_1_74_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_74_U.t_read)) begin
                            if (~x_local_1_74_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_74_U' written by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_74_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_74_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_74_U' read by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_74_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_75_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_75_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_1_75_U.t_read} data_PIPO}
                        if ((~x_local_1_75_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_75_U.t_read)) begin
                            if (~x_local_1_75_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_75_U' written by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_75_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_75_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_75_U' read by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_75_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_76_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_76_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_1_76_U.t_read} data_PIPO}
                        if ((~x_local_1_76_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_76_U.t_read)) begin
                            if (~x_local_1_76_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_76_U' written by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_76_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_76_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_76_U' read by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_76_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_77_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_77_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_1_77_U.t_read} data_PIPO}
                        if ((~x_local_1_77_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_77_U.t_read)) begin
                            if (~x_local_1_77_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_77_U' written by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_77_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_77_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_77_U' read by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_77_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_78_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_78_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_1_78_U.t_read} data_PIPO}
                        if ((~x_local_1_78_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_78_U.t_read)) begin
                            if (~x_local_1_78_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_78_U' written by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_78_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_78_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_78_U' read by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_78_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_79_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_79_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_1_79_U.t_read} data_PIPO}
                        if ((~x_local_1_79_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_79_U.t_read)) begin
                            if (~x_local_1_79_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_79_U' written by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_79_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_79_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_79_U' read by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_79_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_80_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_80_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_1_80_U.t_read} data_PIPO}
                        if ((~x_local_1_80_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_80_U.t_read)) begin
                            if (~x_local_1_80_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_80_U' written by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_80_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_80_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_80_U' read by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_80_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_81_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_81_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_1_81_U.t_read} data_PIPO}
                        if ((~x_local_1_81_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_81_U.t_read)) begin
                            if (~x_local_1_81_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_81_U' written by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_81_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_81_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_81_U' read by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_81_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_82_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_82_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_1_82_U.t_read} data_PIPO}
                        if ((~x_local_1_82_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_82_U.t_read)) begin
                            if (~x_local_1_82_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_82_U' written by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_82_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_82_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_82_U' read by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_82_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_83_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_83_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_1_83_U.t_read} data_PIPO}
                        if ((~x_local_1_83_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_83_U.t_read)) begin
                            if (~x_local_1_83_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_83_U' written by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_83_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_83_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_83_U' read by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_83_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_84_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_84_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_1_84_U.t_read} data_PIPO}
                        if ((~x_local_1_84_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_84_U.t_read)) begin
                            if (~x_local_1_84_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_84_U' written by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_84_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_84_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_84_U' read by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_84_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_85_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_85_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_1_85_U.t_read} data_PIPO}
                        if ((~x_local_1_85_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_85_U.t_read)) begin
                            if (~x_local_1_85_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_85_U' written by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_85_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_85_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_85_U' read by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_85_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_86_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_86_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_1_86_U.t_read} data_PIPO}
                        if ((~x_local_1_86_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_86_U.t_read)) begin
                            if (~x_local_1_86_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_86_U' written by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_86_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_86_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_86_U' read by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_86_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_87_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_87_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_1_87_U.t_read} data_PIPO}
                        if ((~x_local_1_87_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_87_U.t_read)) begin
                            if (~x_local_1_87_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_87_U' written by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_87_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_87_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_87_U' read by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_87_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_88_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_88_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_1_88_U.t_read} data_PIPO}
                        if ((~x_local_1_88_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_88_U.t_read)) begin
                            if (~x_local_1_88_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_88_U' written by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_88_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_88_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_88_U' read by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_88_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_89_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_89_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_1_89_U.t_read} data_PIPO}
                        if ((~x_local_1_89_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_89_U.t_read)) begin
                            if (~x_local_1_89_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_89_U' written by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_89_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_89_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_89_U' read by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_89_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_90_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_90_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_1_90_U.t_read} data_PIPO}
                        if ((~x_local_1_90_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_90_U.t_read)) begin
                            if (~x_local_1_90_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_90_U' written by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_90_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_90_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_90_U' read by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_90_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_91_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_91_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_1_91_U.t_read} data_PIPO}
                        if ((~x_local_1_91_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_91_U.t_read)) begin
                            if (~x_local_1_91_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_91_U' written by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_91_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_91_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_91_U' read by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_91_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_92_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_92_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_1_92_U.t_read} data_PIPO}
                        if ((~x_local_1_92_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_92_U.t_read)) begin
                            if (~x_local_1_92_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_92_U' written by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_92_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_92_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_92_U' read by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_92_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_93_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_93_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_1_93_U.t_read} data_PIPO}
                        if ((~x_local_1_93_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_93_U.t_read)) begin
                            if (~x_local_1_93_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_93_U' written by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_93_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_93_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_93_U' read by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_93_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_94_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_94_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_1_94_U.t_read} data_PIPO}
                        if ((~x_local_1_94_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_94_U.t_read)) begin
                            if (~x_local_1_94_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_94_U' written by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_94_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_94_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_94_U' read by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_94_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_95_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_95_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_1_95_U.t_read} data_PIPO}
                        if ((~x_local_1_95_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_95_U.t_read)) begin
                            if (~x_local_1_95_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_95_U' written by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_95_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_95_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_95_U' read by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_95_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_96_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_96_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_1_96_U.t_read} data_PIPO}
                        if ((~x_local_1_96_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_96_U.t_read)) begin
                            if (~x_local_1_96_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_96_U' written by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_96_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_96_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_96_U' read by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_96_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_97_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_97_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_1_97_U.t_read} data_PIPO}
                        if ((~x_local_1_97_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_97_U.t_read)) begin
                            if (~x_local_1_97_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_97_U' written by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_97_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_97_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_97_U' read by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_97_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_98_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_98_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_1_98_U.t_read} data_PIPO}
                        if ((~x_local_1_98_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_98_U.t_read)) begin
                            if (~x_local_1_98_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_98_U' written by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_98_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_98_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_98_U' read by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_98_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_99_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_99_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_1_99_U.t_read} data_PIPO}
                        if ((~x_local_1_99_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_99_U.t_read)) begin
                            if (~x_local_1_99_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_99_U' written by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_99_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_99_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_99_U' read by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_99_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_100_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_100_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_1_100_U.t_read} data_PIPO}
                        if ((~x_local_1_100_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_100_U.t_read)) begin
                            if (~x_local_1_100_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_100_U' written by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_100_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_100_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_100_U' read by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_100_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_101_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_101_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_1_101_U.t_read} data_PIPO}
                        if ((~x_local_1_101_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_101_U.t_read)) begin
                            if (~x_local_1_101_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_101_U' written by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_101_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_101_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_101_U' read by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_101_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_102_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_102_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_1_102_U.t_read} data_PIPO}
                        if ((~x_local_1_102_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_102_U.t_read)) begin
                            if (~x_local_1_102_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_102_U' written by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_102_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_102_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_102_U' read by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_102_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_103_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_103_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_1_103_U.t_read} data_PIPO}
                        if ((~x_local_1_103_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_103_U.t_read)) begin
                            if (~x_local_1_103_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_103_U' written by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_103_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_103_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_103_U' read by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_103_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_104_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_104_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_1_104_U.t_read} data_PIPO}
                        if ((~x_local_1_104_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_104_U.t_read)) begin
                            if (~x_local_1_104_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_104_U' written by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_104_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_104_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_104_U' read by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_104_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_105_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_105_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_1_105_U.t_read} data_PIPO}
                        if ((~x_local_1_105_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_105_U.t_read)) begin
                            if (~x_local_1_105_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_105_U' written by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_105_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_105_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_105_U' read by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_105_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_106_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_106_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_1_106_U.t_read} data_PIPO}
                        if ((~x_local_1_106_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_106_U.t_read)) begin
                            if (~x_local_1_106_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_106_U' written by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_106_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_106_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_106_U' read by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_106_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_107_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_107_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_1_107_U.t_read} data_PIPO}
                        if ((~x_local_1_107_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_107_U.t_read)) begin
                            if (~x_local_1_107_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_107_U' written by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_107_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_107_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_107_U' read by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_107_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_108_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_108_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_1_108_U.t_read} data_PIPO}
                        if ((~x_local_1_108_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_108_U.t_read)) begin
                            if (~x_local_1_108_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_108_U' written by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_108_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_108_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_108_U' read by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_108_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_109_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_109_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_1_109_U.t_read} data_PIPO}
                        if ((~x_local_1_109_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_109_U.t_read)) begin
                            if (~x_local_1_109_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_109_U' written by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_109_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_109_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_109_U' read by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_109_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_110_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_110_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_1_110_U.t_read} data_PIPO}
                        if ((~x_local_1_110_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_110_U.t_read)) begin
                            if (~x_local_1_110_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_110_U' written by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_110_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_110_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_110_U' read by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_110_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_111_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_111_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_1_111_U.t_read} data_PIPO}
                        if ((~x_local_1_111_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_111_U.t_read)) begin
                            if (~x_local_1_111_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_111_U' written by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_111_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_111_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_111_U' read by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_111_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_112_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_112_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_1_112_U.t_read} data_PIPO}
                        if ((~x_local_1_112_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_112_U.t_read)) begin
                            if (~x_local_1_112_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_112_U' written by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_112_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_112_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_112_U' read by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_112_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_113_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_113_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_1_113_U.t_read} data_PIPO}
                        if ((~x_local_1_113_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_113_U.t_read)) begin
                            if (~x_local_1_113_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_113_U' written by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_113_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_113_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_113_U' read by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_113_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_114_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_114_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_1_114_U.t_read} data_PIPO}
                        if ((~x_local_1_114_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_114_U.t_read)) begin
                            if (~x_local_1_114_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_114_U' written by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_114_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_114_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_114_U' read by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_114_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_115_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_115_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_1_115_U.t_read} data_PIPO}
                        if ((~x_local_1_115_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_115_U.t_read)) begin
                            if (~x_local_1_115_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_115_U' written by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_115_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_115_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_115_U' read by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_115_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_116_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_116_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_1_116_U.t_read} data_PIPO}
                        if ((~x_local_1_116_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_116_U.t_read)) begin
                            if (~x_local_1_116_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_116_U' written by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_116_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_116_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_116_U' read by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_116_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_117_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_117_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_1_117_U.t_read} data_PIPO}
                        if ((~x_local_1_117_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_117_U.t_read)) begin
                            if (~x_local_1_117_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_117_U' written by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_117_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_117_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_117_U' read by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_117_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_118_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_118_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_1_118_U.t_read} data_PIPO}
                        if ((~x_local_1_118_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_118_U.t_read)) begin
                            if (~x_local_1_118_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_118_U' written by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_118_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_118_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_118_U' read by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_118_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_119_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_119_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_1_119_U.t_read} data_PIPO}
                        if ((~x_local_1_119_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_119_U.t_read)) begin
                            if (~x_local_1_119_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_119_U' written by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_119_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_119_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_119_U' read by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_119_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_120_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_120_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_1_120_U.t_read} data_PIPO}
                        if ((~x_local_1_120_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_120_U.t_read)) begin
                            if (~x_local_1_120_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_120_U' written by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_120_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_120_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_120_U' read by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_120_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_121_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_121_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_1_121_U.t_read} data_PIPO}
                        if ((~x_local_1_121_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_121_U.t_read)) begin
                            if (~x_local_1_121_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_121_U' written by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_121_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_121_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_121_U' read by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_121_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_122_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_122_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_1_122_U.t_read} data_PIPO}
                        if ((~x_local_1_122_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_122_U.t_read)) begin
                            if (~x_local_1_122_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_122_U' written by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_122_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_122_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_122_U' read by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_122_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_123_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_123_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_1_123_U.t_read} data_PIPO}
                        if ((~x_local_1_123_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_123_U.t_read)) begin
                            if (~x_local_1_123_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_123_U' written by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_123_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_123_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_123_U' read by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_123_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_124_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_124_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_1_124_U.t_read} data_PIPO}
                        if ((~x_local_1_124_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_124_U.t_read)) begin
                            if (~x_local_1_124_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_124_U' written by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_124_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_124_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_124_U' read by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_124_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_125_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_125_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_1_125_U.t_read} data_PIPO}
                        if ((~x_local_1_125_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_125_U.t_read)) begin
                            if (~x_local_1_125_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_125_U' written by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_125_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_125_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_125_U' read by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_125_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_126_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_126_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_1_126_U.t_read} data_PIPO}
                        if ((~x_local_1_126_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_126_U.t_read)) begin
                            if (~x_local_1_126_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_126_U' written by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_126_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_126_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_126_U' read by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_126_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_127_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_127_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_1_127_U.t_read} data_PIPO}
                        if ((~x_local_1_127_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_1_127_U.t_read)) begin
                            if (~x_local_1_127_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_127_U' written by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_127_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_127_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_127_U' read by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_127_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
                    end
                    3: begin //  for dep proc 'swiglu_swiglu.compute_X2_U0'
// for dep channel 'swiglu_swiglu.x_local_2_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_2_U.t_read} data_PIPO}
                        if ((~x_local_2_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_U.t_read)) begin
                            if (~x_local_2_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_U' written by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_U' read by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_1_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_1_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_2_1_U.t_read} data_PIPO}
                        if ((~x_local_2_1_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_1_U.t_read)) begin
                            if (~x_local_2_1_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_1_U' written by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_1_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_1_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_1_U' read by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_1_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_2_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_2_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_2_2_U.t_read} data_PIPO}
                        if ((~x_local_2_2_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_2_U.t_read)) begin
                            if (~x_local_2_2_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_2_U' written by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_2_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_2_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_2_U' read by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_2_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_3_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_3_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_2_3_U.t_read} data_PIPO}
                        if ((~x_local_2_3_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_3_U.t_read)) begin
                            if (~x_local_2_3_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_3_U' written by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_3_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_3_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_3_U' read by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_3_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_4_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_4_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_2_4_U.t_read} data_PIPO}
                        if ((~x_local_2_4_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_4_U.t_read)) begin
                            if (~x_local_2_4_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_4_U' written by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_4_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_4_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_4_U' read by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_4_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_5_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_5_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_2_5_U.t_read} data_PIPO}
                        if ((~x_local_2_5_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_5_U.t_read)) begin
                            if (~x_local_2_5_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_5_U' written by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_5_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_5_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_5_U' read by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_5_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_6_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_6_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_2_6_U.t_read} data_PIPO}
                        if ((~x_local_2_6_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_6_U.t_read)) begin
                            if (~x_local_2_6_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_6_U' written by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_6_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_6_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_6_U' read by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_6_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_7_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_7_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_2_7_U.t_read} data_PIPO}
                        if ((~x_local_2_7_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_7_U.t_read)) begin
                            if (~x_local_2_7_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_7_U' written by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_7_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_7_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_7_U' read by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_7_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_8_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_8_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_2_8_U.t_read} data_PIPO}
                        if ((~x_local_2_8_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_8_U.t_read)) begin
                            if (~x_local_2_8_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_8_U' written by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_8_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_8_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_8_U' read by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_8_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_9_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_9_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_2_9_U.t_read} data_PIPO}
                        if ((~x_local_2_9_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_9_U.t_read)) begin
                            if (~x_local_2_9_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_9_U' written by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_9_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_9_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_9_U' read by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_9_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_10_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_10_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_2_10_U.t_read} data_PIPO}
                        if ((~x_local_2_10_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_10_U.t_read)) begin
                            if (~x_local_2_10_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_10_U' written by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_10_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_10_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_10_U' read by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_10_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_11_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_11_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_2_11_U.t_read} data_PIPO}
                        if ((~x_local_2_11_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_11_U.t_read)) begin
                            if (~x_local_2_11_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_11_U' written by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_11_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_11_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_11_U' read by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_11_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_12_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_12_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_2_12_U.t_read} data_PIPO}
                        if ((~x_local_2_12_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_12_U.t_read)) begin
                            if (~x_local_2_12_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_12_U' written by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_12_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_12_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_12_U' read by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_12_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_13_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_13_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_2_13_U.t_read} data_PIPO}
                        if ((~x_local_2_13_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_13_U.t_read)) begin
                            if (~x_local_2_13_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_13_U' written by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_13_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_13_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_13_U' read by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_13_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_14_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_14_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_2_14_U.t_read} data_PIPO}
                        if ((~x_local_2_14_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_14_U.t_read)) begin
                            if (~x_local_2_14_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_14_U' written by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_14_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_14_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_14_U' read by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_14_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_15_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_15_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_2_15_U.t_read} data_PIPO}
                        if ((~x_local_2_15_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_15_U.t_read)) begin
                            if (~x_local_2_15_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_15_U' written by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_15_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_15_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_15_U' read by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_15_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_16_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_16_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_2_16_U.t_read} data_PIPO}
                        if ((~x_local_2_16_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_16_U.t_read)) begin
                            if (~x_local_2_16_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_16_U' written by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_16_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_16_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_16_U' read by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_16_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_17_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_17_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_2_17_U.t_read} data_PIPO}
                        if ((~x_local_2_17_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_17_U.t_read)) begin
                            if (~x_local_2_17_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_17_U' written by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_17_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_17_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_17_U' read by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_17_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_18_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_18_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_2_18_U.t_read} data_PIPO}
                        if ((~x_local_2_18_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_18_U.t_read)) begin
                            if (~x_local_2_18_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_18_U' written by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_18_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_18_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_18_U' read by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_18_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_19_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_19_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_2_19_U.t_read} data_PIPO}
                        if ((~x_local_2_19_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_19_U.t_read)) begin
                            if (~x_local_2_19_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_19_U' written by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_19_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_19_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_19_U' read by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_19_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_20_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_20_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_2_20_U.t_read} data_PIPO}
                        if ((~x_local_2_20_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_20_U.t_read)) begin
                            if (~x_local_2_20_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_20_U' written by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_20_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_20_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_20_U' read by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_20_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_21_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_21_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_2_21_U.t_read} data_PIPO}
                        if ((~x_local_2_21_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_21_U.t_read)) begin
                            if (~x_local_2_21_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_21_U' written by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_21_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_21_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_21_U' read by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_21_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_22_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_22_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_2_22_U.t_read} data_PIPO}
                        if ((~x_local_2_22_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_22_U.t_read)) begin
                            if (~x_local_2_22_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_22_U' written by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_22_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_22_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_22_U' read by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_22_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_23_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_23_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_2_23_U.t_read} data_PIPO}
                        if ((~x_local_2_23_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_23_U.t_read)) begin
                            if (~x_local_2_23_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_23_U' written by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_23_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_23_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_23_U' read by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_23_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_24_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_24_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_2_24_U.t_read} data_PIPO}
                        if ((~x_local_2_24_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_24_U.t_read)) begin
                            if (~x_local_2_24_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_24_U' written by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_24_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_24_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_24_U' read by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_24_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_25_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_25_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_2_25_U.t_read} data_PIPO}
                        if ((~x_local_2_25_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_25_U.t_read)) begin
                            if (~x_local_2_25_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_25_U' written by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_25_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_25_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_25_U' read by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_25_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_26_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_26_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_2_26_U.t_read} data_PIPO}
                        if ((~x_local_2_26_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_26_U.t_read)) begin
                            if (~x_local_2_26_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_26_U' written by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_26_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_26_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_26_U' read by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_26_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_27_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_27_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_2_27_U.t_read} data_PIPO}
                        if ((~x_local_2_27_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_27_U.t_read)) begin
                            if (~x_local_2_27_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_27_U' written by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_27_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_27_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_27_U' read by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_27_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_28_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_28_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_2_28_U.t_read} data_PIPO}
                        if ((~x_local_2_28_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_28_U.t_read)) begin
                            if (~x_local_2_28_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_28_U' written by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_28_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_28_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_28_U' read by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_28_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_29_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_29_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_2_29_U.t_read} data_PIPO}
                        if ((~x_local_2_29_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_29_U.t_read)) begin
                            if (~x_local_2_29_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_29_U' written by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_29_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_29_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_29_U' read by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_29_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_30_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_30_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_2_30_U.t_read} data_PIPO}
                        if ((~x_local_2_30_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_30_U.t_read)) begin
                            if (~x_local_2_30_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_30_U' written by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_30_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_30_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_30_U' read by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_30_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_31_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_31_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_2_31_U.t_read} data_PIPO}
                        if ((~x_local_2_31_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_31_U.t_read)) begin
                            if (~x_local_2_31_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_31_U' written by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_31_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_31_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_31_U' read by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_31_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_32_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_32_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_2_32_U.t_read} data_PIPO}
                        if ((~x_local_2_32_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_32_U.t_read)) begin
                            if (~x_local_2_32_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_32_U' written by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_32_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_32_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_32_U' read by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_32_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_33_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_33_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_2_33_U.t_read} data_PIPO}
                        if ((~x_local_2_33_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_33_U.t_read)) begin
                            if (~x_local_2_33_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_33_U' written by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_33_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_33_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_33_U' read by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_33_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_34_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_34_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_2_34_U.t_read} data_PIPO}
                        if ((~x_local_2_34_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_34_U.t_read)) begin
                            if (~x_local_2_34_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_34_U' written by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_34_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_34_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_34_U' read by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_34_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_35_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_35_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_2_35_U.t_read} data_PIPO}
                        if ((~x_local_2_35_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_35_U.t_read)) begin
                            if (~x_local_2_35_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_35_U' written by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_35_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_35_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_35_U' read by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_35_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_36_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_36_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_2_36_U.t_read} data_PIPO}
                        if ((~x_local_2_36_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_36_U.t_read)) begin
                            if (~x_local_2_36_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_36_U' written by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_36_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_36_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_36_U' read by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_36_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_37_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_37_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_2_37_U.t_read} data_PIPO}
                        if ((~x_local_2_37_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_37_U.t_read)) begin
                            if (~x_local_2_37_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_37_U' written by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_37_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_37_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_37_U' read by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_37_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_38_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_38_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_2_38_U.t_read} data_PIPO}
                        if ((~x_local_2_38_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_38_U.t_read)) begin
                            if (~x_local_2_38_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_38_U' written by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_38_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_38_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_38_U' read by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_38_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_39_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_39_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_2_39_U.t_read} data_PIPO}
                        if ((~x_local_2_39_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_39_U.t_read)) begin
                            if (~x_local_2_39_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_39_U' written by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_39_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_39_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_39_U' read by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_39_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_40_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_40_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_2_40_U.t_read} data_PIPO}
                        if ((~x_local_2_40_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_40_U.t_read)) begin
                            if (~x_local_2_40_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_40_U' written by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_40_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_40_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_40_U' read by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_40_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_41_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_41_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_2_41_U.t_read} data_PIPO}
                        if ((~x_local_2_41_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_41_U.t_read)) begin
                            if (~x_local_2_41_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_41_U' written by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_41_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_41_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_41_U' read by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_41_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_42_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_42_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_2_42_U.t_read} data_PIPO}
                        if ((~x_local_2_42_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_42_U.t_read)) begin
                            if (~x_local_2_42_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_42_U' written by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_42_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_42_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_42_U' read by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_42_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_43_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_43_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_2_43_U.t_read} data_PIPO}
                        if ((~x_local_2_43_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_43_U.t_read)) begin
                            if (~x_local_2_43_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_43_U' written by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_43_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_43_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_43_U' read by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_43_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_44_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_44_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_2_44_U.t_read} data_PIPO}
                        if ((~x_local_2_44_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_44_U.t_read)) begin
                            if (~x_local_2_44_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_44_U' written by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_44_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_44_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_44_U' read by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_44_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_45_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_45_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_2_45_U.t_read} data_PIPO}
                        if ((~x_local_2_45_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_45_U.t_read)) begin
                            if (~x_local_2_45_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_45_U' written by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_45_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_45_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_45_U' read by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_45_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_46_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_46_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_2_46_U.t_read} data_PIPO}
                        if ((~x_local_2_46_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_46_U.t_read)) begin
                            if (~x_local_2_46_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_46_U' written by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_46_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_46_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_46_U' read by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_46_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_47_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_47_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_2_47_U.t_read} data_PIPO}
                        if ((~x_local_2_47_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_47_U.t_read)) begin
                            if (~x_local_2_47_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_47_U' written by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_47_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_47_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_47_U' read by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_47_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_48_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_48_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_2_48_U.t_read} data_PIPO}
                        if ((~x_local_2_48_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_48_U.t_read)) begin
                            if (~x_local_2_48_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_48_U' written by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_48_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_48_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_48_U' read by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_48_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_49_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_49_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_2_49_U.t_read} data_PIPO}
                        if ((~x_local_2_49_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_49_U.t_read)) begin
                            if (~x_local_2_49_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_49_U' written by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_49_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_49_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_49_U' read by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_49_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_50_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_50_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_2_50_U.t_read} data_PIPO}
                        if ((~x_local_2_50_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_50_U.t_read)) begin
                            if (~x_local_2_50_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_50_U' written by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_50_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_50_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_50_U' read by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_50_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_51_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_51_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_2_51_U.t_read} data_PIPO}
                        if ((~x_local_2_51_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_51_U.t_read)) begin
                            if (~x_local_2_51_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_51_U' written by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_51_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_51_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_51_U' read by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_51_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_52_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_52_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_2_52_U.t_read} data_PIPO}
                        if ((~x_local_2_52_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_52_U.t_read)) begin
                            if (~x_local_2_52_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_52_U' written by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_52_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_52_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_52_U' read by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_52_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_53_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_53_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_2_53_U.t_read} data_PIPO}
                        if ((~x_local_2_53_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_53_U.t_read)) begin
                            if (~x_local_2_53_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_53_U' written by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_53_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_53_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_53_U' read by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_53_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_54_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_54_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_2_54_U.t_read} data_PIPO}
                        if ((~x_local_2_54_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_54_U.t_read)) begin
                            if (~x_local_2_54_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_54_U' written by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_54_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_54_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_54_U' read by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_54_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_55_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_55_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_2_55_U.t_read} data_PIPO}
                        if ((~x_local_2_55_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_55_U.t_read)) begin
                            if (~x_local_2_55_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_55_U' written by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_55_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_55_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_55_U' read by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_55_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_56_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_56_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_2_56_U.t_read} data_PIPO}
                        if ((~x_local_2_56_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_56_U.t_read)) begin
                            if (~x_local_2_56_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_56_U' written by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_56_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_56_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_56_U' read by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_56_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_57_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_57_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_2_57_U.t_read} data_PIPO}
                        if ((~x_local_2_57_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_57_U.t_read)) begin
                            if (~x_local_2_57_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_57_U' written by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_57_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_57_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_57_U' read by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_57_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_58_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_58_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_2_58_U.t_read} data_PIPO}
                        if ((~x_local_2_58_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_58_U.t_read)) begin
                            if (~x_local_2_58_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_58_U' written by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_58_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_58_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_58_U' read by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_58_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_59_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_59_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_2_59_U.t_read} data_PIPO}
                        if ((~x_local_2_59_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_59_U.t_read)) begin
                            if (~x_local_2_59_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_59_U' written by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_59_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_59_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_59_U' read by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_59_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_60_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_60_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_2_60_U.t_read} data_PIPO}
                        if ((~x_local_2_60_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_60_U.t_read)) begin
                            if (~x_local_2_60_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_60_U' written by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_60_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_60_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_60_U' read by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_60_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_61_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_61_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_2_61_U.t_read} data_PIPO}
                        if ((~x_local_2_61_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_61_U.t_read)) begin
                            if (~x_local_2_61_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_61_U' written by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_61_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_61_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_61_U' read by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_61_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_62_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_62_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_2_62_U.t_read} data_PIPO}
                        if ((~x_local_2_62_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_62_U.t_read)) begin
                            if (~x_local_2_62_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_62_U' written by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_62_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_62_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_62_U' read by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_62_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_63_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_63_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_2_63_U.t_read} data_PIPO}
                        if ((~x_local_2_63_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_63_U.t_read)) begin
                            if (~x_local_2_63_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_63_U' written by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_63_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_63_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_63_U' read by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_63_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_64_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_64_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_2_64_U.t_read} data_PIPO}
                        if ((~x_local_2_64_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_64_U.t_read)) begin
                            if (~x_local_2_64_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_64_U' written by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_64_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_64_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_64_U' read by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_64_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_65_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_65_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_2_65_U.t_read} data_PIPO}
                        if ((~x_local_2_65_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_65_U.t_read)) begin
                            if (~x_local_2_65_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_65_U' written by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_65_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_65_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_65_U' read by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_65_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_66_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_66_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_2_66_U.t_read} data_PIPO}
                        if ((~x_local_2_66_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_66_U.t_read)) begin
                            if (~x_local_2_66_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_66_U' written by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_66_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_66_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_66_U' read by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_66_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_67_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_67_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_2_67_U.t_read} data_PIPO}
                        if ((~x_local_2_67_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_67_U.t_read)) begin
                            if (~x_local_2_67_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_67_U' written by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_67_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_67_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_67_U' read by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_67_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_68_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_68_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_2_68_U.t_read} data_PIPO}
                        if ((~x_local_2_68_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_68_U.t_read)) begin
                            if (~x_local_2_68_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_68_U' written by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_68_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_68_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_68_U' read by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_68_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_69_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_69_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_2_69_U.t_read} data_PIPO}
                        if ((~x_local_2_69_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_69_U.t_read)) begin
                            if (~x_local_2_69_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_69_U' written by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_69_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_69_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_69_U' read by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_69_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_70_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_70_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_2_70_U.t_read} data_PIPO}
                        if ((~x_local_2_70_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_70_U.t_read)) begin
                            if (~x_local_2_70_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_70_U' written by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_70_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_70_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_70_U' read by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_70_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_71_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_71_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_2_71_U.t_read} data_PIPO}
                        if ((~x_local_2_71_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_71_U.t_read)) begin
                            if (~x_local_2_71_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_71_U' written by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_71_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_71_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_71_U' read by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_71_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_72_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_72_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_2_72_U.t_read} data_PIPO}
                        if ((~x_local_2_72_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_72_U.t_read)) begin
                            if (~x_local_2_72_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_72_U' written by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_72_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_72_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_72_U' read by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_72_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_73_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_73_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_2_73_U.t_read} data_PIPO}
                        if ((~x_local_2_73_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_73_U.t_read)) begin
                            if (~x_local_2_73_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_73_U' written by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_73_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_73_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_73_U' read by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_73_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_74_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_74_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_2_74_U.t_read} data_PIPO}
                        if ((~x_local_2_74_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_74_U.t_read)) begin
                            if (~x_local_2_74_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_74_U' written by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_74_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_74_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_74_U' read by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_74_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_75_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_75_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_2_75_U.t_read} data_PIPO}
                        if ((~x_local_2_75_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_75_U.t_read)) begin
                            if (~x_local_2_75_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_75_U' written by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_75_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_75_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_75_U' read by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_75_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_76_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_76_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_2_76_U.t_read} data_PIPO}
                        if ((~x_local_2_76_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_76_U.t_read)) begin
                            if (~x_local_2_76_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_76_U' written by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_76_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_76_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_76_U' read by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_76_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_77_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_77_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_2_77_U.t_read} data_PIPO}
                        if ((~x_local_2_77_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_77_U.t_read)) begin
                            if (~x_local_2_77_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_77_U' written by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_77_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_77_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_77_U' read by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_77_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_78_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_78_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_2_78_U.t_read} data_PIPO}
                        if ((~x_local_2_78_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_78_U.t_read)) begin
                            if (~x_local_2_78_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_78_U' written by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_78_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_78_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_78_U' read by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_78_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_79_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_79_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_2_79_U.t_read} data_PIPO}
                        if ((~x_local_2_79_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_79_U.t_read)) begin
                            if (~x_local_2_79_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_79_U' written by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_79_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_79_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_79_U' read by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_79_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_80_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_80_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_2_80_U.t_read} data_PIPO}
                        if ((~x_local_2_80_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_80_U.t_read)) begin
                            if (~x_local_2_80_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_80_U' written by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_80_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_80_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_80_U' read by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_80_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_81_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_81_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_2_81_U.t_read} data_PIPO}
                        if ((~x_local_2_81_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_81_U.t_read)) begin
                            if (~x_local_2_81_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_81_U' written by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_81_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_81_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_81_U' read by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_81_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_82_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_82_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_2_82_U.t_read} data_PIPO}
                        if ((~x_local_2_82_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_82_U.t_read)) begin
                            if (~x_local_2_82_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_82_U' written by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_82_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_82_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_82_U' read by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_82_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_83_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_83_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_2_83_U.t_read} data_PIPO}
                        if ((~x_local_2_83_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_83_U.t_read)) begin
                            if (~x_local_2_83_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_83_U' written by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_83_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_83_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_83_U' read by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_83_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_84_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_84_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_2_84_U.t_read} data_PIPO}
                        if ((~x_local_2_84_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_84_U.t_read)) begin
                            if (~x_local_2_84_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_84_U' written by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_84_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_84_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_84_U' read by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_84_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_85_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_85_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_2_85_U.t_read} data_PIPO}
                        if ((~x_local_2_85_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_85_U.t_read)) begin
                            if (~x_local_2_85_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_85_U' written by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_85_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_85_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_85_U' read by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_85_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_86_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_86_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_2_86_U.t_read} data_PIPO}
                        if ((~x_local_2_86_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_86_U.t_read)) begin
                            if (~x_local_2_86_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_86_U' written by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_86_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_86_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_86_U' read by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_86_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_87_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_87_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_2_87_U.t_read} data_PIPO}
                        if ((~x_local_2_87_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_87_U.t_read)) begin
                            if (~x_local_2_87_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_87_U' written by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_87_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_87_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_87_U' read by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_87_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_88_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_88_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_2_88_U.t_read} data_PIPO}
                        if ((~x_local_2_88_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_88_U.t_read)) begin
                            if (~x_local_2_88_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_88_U' written by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_88_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_88_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_88_U' read by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_88_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_89_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_89_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_2_89_U.t_read} data_PIPO}
                        if ((~x_local_2_89_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_89_U.t_read)) begin
                            if (~x_local_2_89_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_89_U' written by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_89_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_89_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_89_U' read by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_89_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_90_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_90_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_2_90_U.t_read} data_PIPO}
                        if ((~x_local_2_90_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_90_U.t_read)) begin
                            if (~x_local_2_90_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_90_U' written by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_90_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_90_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_90_U' read by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_90_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_91_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_91_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_2_91_U.t_read} data_PIPO}
                        if ((~x_local_2_91_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_91_U.t_read)) begin
                            if (~x_local_2_91_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_91_U' written by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_91_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_91_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_91_U' read by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_91_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_92_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_92_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_2_92_U.t_read} data_PIPO}
                        if ((~x_local_2_92_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_92_U.t_read)) begin
                            if (~x_local_2_92_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_92_U' written by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_92_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_92_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_92_U' read by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_92_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_93_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_93_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_2_93_U.t_read} data_PIPO}
                        if ((~x_local_2_93_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_93_U.t_read)) begin
                            if (~x_local_2_93_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_93_U' written by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_93_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_93_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_93_U' read by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_93_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_94_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_94_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_2_94_U.t_read} data_PIPO}
                        if ((~x_local_2_94_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_94_U.t_read)) begin
                            if (~x_local_2_94_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_94_U' written by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_94_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_94_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_94_U' read by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_94_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_95_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_95_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_2_95_U.t_read} data_PIPO}
                        if ((~x_local_2_95_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_95_U.t_read)) begin
                            if (~x_local_2_95_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_95_U' written by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_95_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_95_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_95_U' read by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_95_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_96_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_96_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_2_96_U.t_read} data_PIPO}
                        if ((~x_local_2_96_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_96_U.t_read)) begin
                            if (~x_local_2_96_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_96_U' written by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_96_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_96_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_96_U' read by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_96_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_97_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_97_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_2_97_U.t_read} data_PIPO}
                        if ((~x_local_2_97_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_97_U.t_read)) begin
                            if (~x_local_2_97_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_97_U' written by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_97_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_97_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_97_U' read by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_97_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_98_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_98_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_2_98_U.t_read} data_PIPO}
                        if ((~x_local_2_98_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_98_U.t_read)) begin
                            if (~x_local_2_98_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_98_U' written by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_98_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_98_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_98_U' read by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_98_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_99_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_99_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_2_99_U.t_read} data_PIPO}
                        if ((~x_local_2_99_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_99_U.t_read)) begin
                            if (~x_local_2_99_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_99_U' written by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_99_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_99_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_99_U' read by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_99_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_100_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_100_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_2_100_U.t_read} data_PIPO}
                        if ((~x_local_2_100_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_100_U.t_read)) begin
                            if (~x_local_2_100_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_100_U' written by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_100_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_100_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_100_U' read by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_100_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_101_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_101_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_2_101_U.t_read} data_PIPO}
                        if ((~x_local_2_101_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_101_U.t_read)) begin
                            if (~x_local_2_101_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_101_U' written by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_101_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_101_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_101_U' read by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_101_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_102_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_102_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_2_102_U.t_read} data_PIPO}
                        if ((~x_local_2_102_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_102_U.t_read)) begin
                            if (~x_local_2_102_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_102_U' written by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_102_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_102_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_102_U' read by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_102_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_103_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_103_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_2_103_U.t_read} data_PIPO}
                        if ((~x_local_2_103_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_103_U.t_read)) begin
                            if (~x_local_2_103_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_103_U' written by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_103_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_103_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_103_U' read by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_103_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_104_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_104_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_2_104_U.t_read} data_PIPO}
                        if ((~x_local_2_104_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_104_U.t_read)) begin
                            if (~x_local_2_104_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_104_U' written by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_104_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_104_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_104_U' read by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_104_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_105_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_105_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_2_105_U.t_read} data_PIPO}
                        if ((~x_local_2_105_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_105_U.t_read)) begin
                            if (~x_local_2_105_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_105_U' written by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_105_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_105_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_105_U' read by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_105_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_106_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_106_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_2_106_U.t_read} data_PIPO}
                        if ((~x_local_2_106_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_106_U.t_read)) begin
                            if (~x_local_2_106_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_106_U' written by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_106_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_106_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_106_U' read by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_106_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_107_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_107_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_2_107_U.t_read} data_PIPO}
                        if ((~x_local_2_107_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_107_U.t_read)) begin
                            if (~x_local_2_107_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_107_U' written by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_107_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_107_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_107_U' read by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_107_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_108_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_108_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_2_108_U.t_read} data_PIPO}
                        if ((~x_local_2_108_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_108_U.t_read)) begin
                            if (~x_local_2_108_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_108_U' written by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_108_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_108_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_108_U' read by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_108_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_109_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_109_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_2_109_U.t_read} data_PIPO}
                        if ((~x_local_2_109_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_109_U.t_read)) begin
                            if (~x_local_2_109_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_109_U' written by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_109_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_109_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_109_U' read by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_109_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_110_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_110_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_2_110_U.t_read} data_PIPO}
                        if ((~x_local_2_110_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_110_U.t_read)) begin
                            if (~x_local_2_110_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_110_U' written by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_110_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_110_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_110_U' read by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_110_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_111_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_111_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_2_111_U.t_read} data_PIPO}
                        if ((~x_local_2_111_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_111_U.t_read)) begin
                            if (~x_local_2_111_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_111_U' written by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_111_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_111_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_111_U' read by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_111_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_112_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_112_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_2_112_U.t_read} data_PIPO}
                        if ((~x_local_2_112_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_112_U.t_read)) begin
                            if (~x_local_2_112_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_112_U' written by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_112_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_112_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_112_U' read by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_112_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_113_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_113_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_2_113_U.t_read} data_PIPO}
                        if ((~x_local_2_113_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_113_U.t_read)) begin
                            if (~x_local_2_113_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_113_U' written by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_113_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_113_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_113_U' read by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_113_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_114_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_114_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_2_114_U.t_read} data_PIPO}
                        if ((~x_local_2_114_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_114_U.t_read)) begin
                            if (~x_local_2_114_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_114_U' written by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_114_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_114_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_114_U' read by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_114_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_115_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_115_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_2_115_U.t_read} data_PIPO}
                        if ((~x_local_2_115_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_115_U.t_read)) begin
                            if (~x_local_2_115_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_115_U' written by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_115_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_115_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_115_U' read by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_115_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_116_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_116_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_2_116_U.t_read} data_PIPO}
                        if ((~x_local_2_116_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_116_U.t_read)) begin
                            if (~x_local_2_116_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_116_U' written by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_116_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_116_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_116_U' read by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_116_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_117_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_117_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_2_117_U.t_read} data_PIPO}
                        if ((~x_local_2_117_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_117_U.t_read)) begin
                            if (~x_local_2_117_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_117_U' written by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_117_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_117_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_117_U' read by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_117_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_118_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_118_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_2_118_U.t_read} data_PIPO}
                        if ((~x_local_2_118_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_118_U.t_read)) begin
                            if (~x_local_2_118_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_118_U' written by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_118_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_118_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_118_U' read by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_118_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_119_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_119_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_2_119_U.t_read} data_PIPO}
                        if ((~x_local_2_119_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_119_U.t_read)) begin
                            if (~x_local_2_119_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_119_U' written by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_119_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_119_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_119_U' read by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_119_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_120_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_120_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_2_120_U.t_read} data_PIPO}
                        if ((~x_local_2_120_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_120_U.t_read)) begin
                            if (~x_local_2_120_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_120_U' written by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_120_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_120_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_120_U' read by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_120_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_121_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_121_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_2_121_U.t_read} data_PIPO}
                        if ((~x_local_2_121_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_121_U.t_read)) begin
                            if (~x_local_2_121_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_121_U' written by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_121_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_121_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_121_U' read by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_121_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_122_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_122_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_2_122_U.t_read} data_PIPO}
                        if ((~x_local_2_122_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_122_U.t_read)) begin
                            if (~x_local_2_122_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_122_U' written by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_122_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_122_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_122_U' read by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_122_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_123_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_123_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_2_123_U.t_read} data_PIPO}
                        if ((~x_local_2_123_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_123_U.t_read)) begin
                            if (~x_local_2_123_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_123_U' written by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_123_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_123_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_123_U' read by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_123_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_124_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_124_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_2_124_U.t_read} data_PIPO}
                        if ((~x_local_2_124_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_124_U.t_read)) begin
                            if (~x_local_2_124_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_124_U' written by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_124_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_124_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_124_U' read by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_124_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_125_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_125_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_2_125_U.t_read} data_PIPO}
                        if ((~x_local_2_125_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_125_U.t_read)) begin
                            if (~x_local_2_125_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_125_U' written by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_125_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_125_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_125_U' read by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_125_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_126_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_126_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_2_126_U.t_read} data_PIPO}
                        if ((~x_local_2_126_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_126_U.t_read)) begin
                            if (~x_local_2_126_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_126_U' written by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_126_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_126_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_126_U' read by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_126_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_127_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_127_U.i_full_n & swiglu_swiglu_inst.load_x_local_U0.ap_done & ap_done_reg_0 & ~swiglu_swiglu_inst.x_local_2_127_U.t_read} data_PIPO}
                        if ((~x_local_2_127_U.i_full_n & load_x_local_U0.ap_done & ap_done_reg_0 & ~x_local_2_127_U.t_read)) begin
                            if (~x_local_2_127_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_127_U' written by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_127_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_127_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_127_U' read by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_127_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
                    end
                    0: begin //  for dep proc 'swiglu_swiglu.entry_proc_U0'
// for dep channel '' info is :
// blk sig is {{swiglu_swiglu_inst.ap_sync_load_x_local_U0_ap_ready & swiglu_swiglu_inst.load_x_local_U0.ap_idle & ~swiglu_swiglu_inst.ap_sync_entry_proc_U0_ap_ready} input_sync}
                        if ((ap_sync_load_x_local_U0_ap_ready & load_x_local_U0.ap_idle & ~ap_sync_entry_proc_U0_ap_ready)) begin
                            $display("//      Blocked by input sync logic with process : 'swiglu_swiglu.entry_proc_U0'");
                        end
                    end
                    endcase
                end
                2 : begin // for proc 'swiglu_swiglu.compute_X1_U0'
                    case(index2)
                    0: begin //  for dep proc 'swiglu_swiglu.entry_proc_U0'
// for dep channel 'swiglu_swiglu.W_c_U' info is :
// blk sig is {~swiglu_swiglu_inst.compute_X1_U0.W_blk_n data_FIFO}
                        if ((~compute_X1_U0.W_blk_n)) begin
                            if (~W_c_U.if_empty_n) begin
                                $display("//      Blocked by empty input FIFO 'swiglu_swiglu.W_c_U' written by process 'swiglu_swiglu.entry_proc_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.W_c_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~W_c_U.if_full_n) begin
                                $display("//      Blocked by full output FIFO 'swiglu_swiglu.W_c_U' read by process 'swiglu_swiglu.entry_proc_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.W_c_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_scale_c1_U' info is :
// blk sig is {~swiglu_swiglu_inst.compute_X1_U0.x_scale_blk_n data_FIFO}
                        if ((~compute_X1_U0.x_scale_blk_n)) begin
                            if (~x_scale_c1_U.if_empty_n) begin
                                $display("//      Blocked by empty input FIFO 'swiglu_swiglu.x_scale_c1_U' written by process 'swiglu_swiglu.entry_proc_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_scale_c1_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_scale_c1_U.if_full_n) begin
                                $display("//      Blocked by full output FIFO 'swiglu_swiglu.x_scale_c1_U' read by process 'swiglu_swiglu.entry_proc_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_scale_c1_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
                    end
                    1: begin //  for dep proc 'swiglu_swiglu.load_x_local_U0'
// for dep channel 'swiglu_swiglu.x_local_1_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_U.t_empty_n & swiglu_swiglu_inst.compute_X1_U0.ap_idle & ~swiglu_swiglu_inst.x_local_1_U.i_write} data_PIPO}
                        if ((~x_local_1_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_U.i_write)) begin
                            if (~x_local_1_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_1_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_1_U.t_empty_n & swiglu_swiglu_inst.compute_X1_U0.ap_idle & ~swiglu_swiglu_inst.x_local_1_1_U.i_write} data_PIPO}
                        if ((~x_local_1_1_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_1_U.i_write)) begin
                            if (~x_local_1_1_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_1_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_1_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_1_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_1_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_1_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_2_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_2_U.t_empty_n & swiglu_swiglu_inst.compute_X1_U0.ap_idle & ~swiglu_swiglu_inst.x_local_1_2_U.i_write} data_PIPO}
                        if ((~x_local_1_2_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_2_U.i_write)) begin
                            if (~x_local_1_2_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_2_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_2_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_2_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_2_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_2_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_3_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_3_U.t_empty_n & swiglu_swiglu_inst.compute_X1_U0.ap_idle & ~swiglu_swiglu_inst.x_local_1_3_U.i_write} data_PIPO}
                        if ((~x_local_1_3_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_3_U.i_write)) begin
                            if (~x_local_1_3_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_3_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_3_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_3_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_3_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_3_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_4_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_4_U.t_empty_n & swiglu_swiglu_inst.compute_X1_U0.ap_idle & ~swiglu_swiglu_inst.x_local_1_4_U.i_write} data_PIPO}
                        if ((~x_local_1_4_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_4_U.i_write)) begin
                            if (~x_local_1_4_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_4_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_4_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_4_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_4_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_4_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_5_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_5_U.t_empty_n & swiglu_swiglu_inst.compute_X1_U0.ap_idle & ~swiglu_swiglu_inst.x_local_1_5_U.i_write} data_PIPO}
                        if ((~x_local_1_5_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_5_U.i_write)) begin
                            if (~x_local_1_5_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_5_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_5_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_5_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_5_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_5_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_6_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_6_U.t_empty_n & swiglu_swiglu_inst.compute_X1_U0.ap_idle & ~swiglu_swiglu_inst.x_local_1_6_U.i_write} data_PIPO}
                        if ((~x_local_1_6_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_6_U.i_write)) begin
                            if (~x_local_1_6_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_6_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_6_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_6_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_6_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_6_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_7_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_7_U.t_empty_n & swiglu_swiglu_inst.compute_X1_U0.ap_idle & ~swiglu_swiglu_inst.x_local_1_7_U.i_write} data_PIPO}
                        if ((~x_local_1_7_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_7_U.i_write)) begin
                            if (~x_local_1_7_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_7_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_7_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_7_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_7_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_7_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_8_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_8_U.t_empty_n & swiglu_swiglu_inst.compute_X1_U0.ap_idle & ~swiglu_swiglu_inst.x_local_1_8_U.i_write} data_PIPO}
                        if ((~x_local_1_8_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_8_U.i_write)) begin
                            if (~x_local_1_8_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_8_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_8_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_8_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_8_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_8_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_9_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_9_U.t_empty_n & swiglu_swiglu_inst.compute_X1_U0.ap_idle & ~swiglu_swiglu_inst.x_local_1_9_U.i_write} data_PIPO}
                        if ((~x_local_1_9_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_9_U.i_write)) begin
                            if (~x_local_1_9_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_9_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_9_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_9_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_9_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_9_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_10_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_10_U.t_empty_n & swiglu_swiglu_inst.compute_X1_U0.ap_idle & ~swiglu_swiglu_inst.x_local_1_10_U.i_write} data_PIPO}
                        if ((~x_local_1_10_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_10_U.i_write)) begin
                            if (~x_local_1_10_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_10_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_10_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_10_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_10_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_10_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_11_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_11_U.t_empty_n & swiglu_swiglu_inst.compute_X1_U0.ap_idle & ~swiglu_swiglu_inst.x_local_1_11_U.i_write} data_PIPO}
                        if ((~x_local_1_11_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_11_U.i_write)) begin
                            if (~x_local_1_11_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_11_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_11_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_11_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_11_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_11_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_12_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_12_U.t_empty_n & swiglu_swiglu_inst.compute_X1_U0.ap_idle & ~swiglu_swiglu_inst.x_local_1_12_U.i_write} data_PIPO}
                        if ((~x_local_1_12_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_12_U.i_write)) begin
                            if (~x_local_1_12_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_12_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_12_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_12_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_12_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_12_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_13_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_13_U.t_empty_n & swiglu_swiglu_inst.compute_X1_U0.ap_idle & ~swiglu_swiglu_inst.x_local_1_13_U.i_write} data_PIPO}
                        if ((~x_local_1_13_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_13_U.i_write)) begin
                            if (~x_local_1_13_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_13_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_13_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_13_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_13_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_13_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_14_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_14_U.t_empty_n & swiglu_swiglu_inst.compute_X1_U0.ap_idle & ~swiglu_swiglu_inst.x_local_1_14_U.i_write} data_PIPO}
                        if ((~x_local_1_14_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_14_U.i_write)) begin
                            if (~x_local_1_14_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_14_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_14_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_14_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_14_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_14_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_15_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_15_U.t_empty_n & swiglu_swiglu_inst.compute_X1_U0.ap_idle & ~swiglu_swiglu_inst.x_local_1_15_U.i_write} data_PIPO}
                        if ((~x_local_1_15_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_15_U.i_write)) begin
                            if (~x_local_1_15_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_15_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_15_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_15_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_15_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_15_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_16_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_16_U.t_empty_n & swiglu_swiglu_inst.compute_X1_U0.ap_idle & ~swiglu_swiglu_inst.x_local_1_16_U.i_write} data_PIPO}
                        if ((~x_local_1_16_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_16_U.i_write)) begin
                            if (~x_local_1_16_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_16_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_16_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_16_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_16_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_16_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_17_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_17_U.t_empty_n & swiglu_swiglu_inst.compute_X1_U0.ap_idle & ~swiglu_swiglu_inst.x_local_1_17_U.i_write} data_PIPO}
                        if ((~x_local_1_17_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_17_U.i_write)) begin
                            if (~x_local_1_17_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_17_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_17_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_17_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_17_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_17_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_18_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_18_U.t_empty_n & swiglu_swiglu_inst.compute_X1_U0.ap_idle & ~swiglu_swiglu_inst.x_local_1_18_U.i_write} data_PIPO}
                        if ((~x_local_1_18_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_18_U.i_write)) begin
                            if (~x_local_1_18_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_18_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_18_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_18_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_18_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_18_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_19_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_19_U.t_empty_n & swiglu_swiglu_inst.compute_X1_U0.ap_idle & ~swiglu_swiglu_inst.x_local_1_19_U.i_write} data_PIPO}
                        if ((~x_local_1_19_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_19_U.i_write)) begin
                            if (~x_local_1_19_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_19_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_19_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_19_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_19_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_19_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_20_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_20_U.t_empty_n & swiglu_swiglu_inst.compute_X1_U0.ap_idle & ~swiglu_swiglu_inst.x_local_1_20_U.i_write} data_PIPO}
                        if ((~x_local_1_20_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_20_U.i_write)) begin
                            if (~x_local_1_20_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_20_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_20_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_20_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_20_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_20_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_21_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_21_U.t_empty_n & swiglu_swiglu_inst.compute_X1_U0.ap_idle & ~swiglu_swiglu_inst.x_local_1_21_U.i_write} data_PIPO}
                        if ((~x_local_1_21_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_21_U.i_write)) begin
                            if (~x_local_1_21_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_21_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_21_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_21_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_21_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_21_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_22_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_22_U.t_empty_n & swiglu_swiglu_inst.compute_X1_U0.ap_idle & ~swiglu_swiglu_inst.x_local_1_22_U.i_write} data_PIPO}
                        if ((~x_local_1_22_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_22_U.i_write)) begin
                            if (~x_local_1_22_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_22_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_22_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_22_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_22_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_22_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_23_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_23_U.t_empty_n & swiglu_swiglu_inst.compute_X1_U0.ap_idle & ~swiglu_swiglu_inst.x_local_1_23_U.i_write} data_PIPO}
                        if ((~x_local_1_23_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_23_U.i_write)) begin
                            if (~x_local_1_23_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_23_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_23_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_23_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_23_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_23_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_24_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_24_U.t_empty_n & swiglu_swiglu_inst.compute_X1_U0.ap_idle & ~swiglu_swiglu_inst.x_local_1_24_U.i_write} data_PIPO}
                        if ((~x_local_1_24_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_24_U.i_write)) begin
                            if (~x_local_1_24_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_24_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_24_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_24_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_24_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_24_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_25_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_25_U.t_empty_n & swiglu_swiglu_inst.compute_X1_U0.ap_idle & ~swiglu_swiglu_inst.x_local_1_25_U.i_write} data_PIPO}
                        if ((~x_local_1_25_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_25_U.i_write)) begin
                            if (~x_local_1_25_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_25_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_25_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_25_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_25_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_25_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_26_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_26_U.t_empty_n & swiglu_swiglu_inst.compute_X1_U0.ap_idle & ~swiglu_swiglu_inst.x_local_1_26_U.i_write} data_PIPO}
                        if ((~x_local_1_26_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_26_U.i_write)) begin
                            if (~x_local_1_26_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_26_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_26_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_26_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_26_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_26_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_27_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_27_U.t_empty_n & swiglu_swiglu_inst.compute_X1_U0.ap_idle & ~swiglu_swiglu_inst.x_local_1_27_U.i_write} data_PIPO}
                        if ((~x_local_1_27_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_27_U.i_write)) begin
                            if (~x_local_1_27_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_27_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_27_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_27_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_27_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_27_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_28_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_28_U.t_empty_n & swiglu_swiglu_inst.compute_X1_U0.ap_idle & ~swiglu_swiglu_inst.x_local_1_28_U.i_write} data_PIPO}
                        if ((~x_local_1_28_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_28_U.i_write)) begin
                            if (~x_local_1_28_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_28_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_28_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_28_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_28_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_28_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_29_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_29_U.t_empty_n & swiglu_swiglu_inst.compute_X1_U0.ap_idle & ~swiglu_swiglu_inst.x_local_1_29_U.i_write} data_PIPO}
                        if ((~x_local_1_29_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_29_U.i_write)) begin
                            if (~x_local_1_29_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_29_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_29_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_29_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_29_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_29_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_30_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_30_U.t_empty_n & swiglu_swiglu_inst.compute_X1_U0.ap_idle & ~swiglu_swiglu_inst.x_local_1_30_U.i_write} data_PIPO}
                        if ((~x_local_1_30_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_30_U.i_write)) begin
                            if (~x_local_1_30_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_30_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_30_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_30_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_30_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_30_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_31_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_31_U.t_empty_n & swiglu_swiglu_inst.compute_X1_U0.ap_idle & ~swiglu_swiglu_inst.x_local_1_31_U.i_write} data_PIPO}
                        if ((~x_local_1_31_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_31_U.i_write)) begin
                            if (~x_local_1_31_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_31_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_31_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_31_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_31_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_31_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_32_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_32_U.t_empty_n & swiglu_swiglu_inst.compute_X1_U0.ap_idle & ~swiglu_swiglu_inst.x_local_1_32_U.i_write} data_PIPO}
                        if ((~x_local_1_32_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_32_U.i_write)) begin
                            if (~x_local_1_32_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_32_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_32_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_32_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_32_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_32_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_33_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_33_U.t_empty_n & swiglu_swiglu_inst.compute_X1_U0.ap_idle & ~swiglu_swiglu_inst.x_local_1_33_U.i_write} data_PIPO}
                        if ((~x_local_1_33_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_33_U.i_write)) begin
                            if (~x_local_1_33_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_33_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_33_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_33_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_33_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_33_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_34_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_34_U.t_empty_n & swiglu_swiglu_inst.compute_X1_U0.ap_idle & ~swiglu_swiglu_inst.x_local_1_34_U.i_write} data_PIPO}
                        if ((~x_local_1_34_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_34_U.i_write)) begin
                            if (~x_local_1_34_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_34_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_34_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_34_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_34_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_34_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_35_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_35_U.t_empty_n & swiglu_swiglu_inst.compute_X1_U0.ap_idle & ~swiglu_swiglu_inst.x_local_1_35_U.i_write} data_PIPO}
                        if ((~x_local_1_35_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_35_U.i_write)) begin
                            if (~x_local_1_35_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_35_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_35_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_35_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_35_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_35_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_36_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_36_U.t_empty_n & swiglu_swiglu_inst.compute_X1_U0.ap_idle & ~swiglu_swiglu_inst.x_local_1_36_U.i_write} data_PIPO}
                        if ((~x_local_1_36_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_36_U.i_write)) begin
                            if (~x_local_1_36_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_36_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_36_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_36_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_36_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_36_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_37_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_37_U.t_empty_n & swiglu_swiglu_inst.compute_X1_U0.ap_idle & ~swiglu_swiglu_inst.x_local_1_37_U.i_write} data_PIPO}
                        if ((~x_local_1_37_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_37_U.i_write)) begin
                            if (~x_local_1_37_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_37_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_37_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_37_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_37_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_37_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_38_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_38_U.t_empty_n & swiglu_swiglu_inst.compute_X1_U0.ap_idle & ~swiglu_swiglu_inst.x_local_1_38_U.i_write} data_PIPO}
                        if ((~x_local_1_38_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_38_U.i_write)) begin
                            if (~x_local_1_38_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_38_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_38_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_38_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_38_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_38_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_39_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_39_U.t_empty_n & swiglu_swiglu_inst.compute_X1_U0.ap_idle & ~swiglu_swiglu_inst.x_local_1_39_U.i_write} data_PIPO}
                        if ((~x_local_1_39_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_39_U.i_write)) begin
                            if (~x_local_1_39_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_39_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_39_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_39_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_39_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_39_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_40_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_40_U.t_empty_n & swiglu_swiglu_inst.compute_X1_U0.ap_idle & ~swiglu_swiglu_inst.x_local_1_40_U.i_write} data_PIPO}
                        if ((~x_local_1_40_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_40_U.i_write)) begin
                            if (~x_local_1_40_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_40_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_40_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_40_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_40_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_40_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_41_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_41_U.t_empty_n & swiglu_swiglu_inst.compute_X1_U0.ap_idle & ~swiglu_swiglu_inst.x_local_1_41_U.i_write} data_PIPO}
                        if ((~x_local_1_41_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_41_U.i_write)) begin
                            if (~x_local_1_41_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_41_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_41_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_41_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_41_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_41_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_42_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_42_U.t_empty_n & swiglu_swiglu_inst.compute_X1_U0.ap_idle & ~swiglu_swiglu_inst.x_local_1_42_U.i_write} data_PIPO}
                        if ((~x_local_1_42_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_42_U.i_write)) begin
                            if (~x_local_1_42_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_42_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_42_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_42_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_42_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_42_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_43_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_43_U.t_empty_n & swiglu_swiglu_inst.compute_X1_U0.ap_idle & ~swiglu_swiglu_inst.x_local_1_43_U.i_write} data_PIPO}
                        if ((~x_local_1_43_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_43_U.i_write)) begin
                            if (~x_local_1_43_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_43_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_43_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_43_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_43_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_43_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_44_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_44_U.t_empty_n & swiglu_swiglu_inst.compute_X1_U0.ap_idle & ~swiglu_swiglu_inst.x_local_1_44_U.i_write} data_PIPO}
                        if ((~x_local_1_44_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_44_U.i_write)) begin
                            if (~x_local_1_44_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_44_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_44_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_44_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_44_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_44_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_45_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_45_U.t_empty_n & swiglu_swiglu_inst.compute_X1_U0.ap_idle & ~swiglu_swiglu_inst.x_local_1_45_U.i_write} data_PIPO}
                        if ((~x_local_1_45_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_45_U.i_write)) begin
                            if (~x_local_1_45_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_45_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_45_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_45_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_45_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_45_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_46_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_46_U.t_empty_n & swiglu_swiglu_inst.compute_X1_U0.ap_idle & ~swiglu_swiglu_inst.x_local_1_46_U.i_write} data_PIPO}
                        if ((~x_local_1_46_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_46_U.i_write)) begin
                            if (~x_local_1_46_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_46_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_46_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_46_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_46_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_46_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_47_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_47_U.t_empty_n & swiglu_swiglu_inst.compute_X1_U0.ap_idle & ~swiglu_swiglu_inst.x_local_1_47_U.i_write} data_PIPO}
                        if ((~x_local_1_47_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_47_U.i_write)) begin
                            if (~x_local_1_47_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_47_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_47_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_47_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_47_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_47_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_48_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_48_U.t_empty_n & swiglu_swiglu_inst.compute_X1_U0.ap_idle & ~swiglu_swiglu_inst.x_local_1_48_U.i_write} data_PIPO}
                        if ((~x_local_1_48_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_48_U.i_write)) begin
                            if (~x_local_1_48_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_48_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_48_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_48_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_48_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_48_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_49_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_49_U.t_empty_n & swiglu_swiglu_inst.compute_X1_U0.ap_idle & ~swiglu_swiglu_inst.x_local_1_49_U.i_write} data_PIPO}
                        if ((~x_local_1_49_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_49_U.i_write)) begin
                            if (~x_local_1_49_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_49_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_49_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_49_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_49_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_49_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_50_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_50_U.t_empty_n & swiglu_swiglu_inst.compute_X1_U0.ap_idle & ~swiglu_swiglu_inst.x_local_1_50_U.i_write} data_PIPO}
                        if ((~x_local_1_50_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_50_U.i_write)) begin
                            if (~x_local_1_50_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_50_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_50_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_50_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_50_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_50_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_51_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_51_U.t_empty_n & swiglu_swiglu_inst.compute_X1_U0.ap_idle & ~swiglu_swiglu_inst.x_local_1_51_U.i_write} data_PIPO}
                        if ((~x_local_1_51_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_51_U.i_write)) begin
                            if (~x_local_1_51_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_51_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_51_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_51_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_51_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_51_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_52_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_52_U.t_empty_n & swiglu_swiglu_inst.compute_X1_U0.ap_idle & ~swiglu_swiglu_inst.x_local_1_52_U.i_write} data_PIPO}
                        if ((~x_local_1_52_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_52_U.i_write)) begin
                            if (~x_local_1_52_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_52_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_52_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_52_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_52_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_52_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_53_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_53_U.t_empty_n & swiglu_swiglu_inst.compute_X1_U0.ap_idle & ~swiglu_swiglu_inst.x_local_1_53_U.i_write} data_PIPO}
                        if ((~x_local_1_53_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_53_U.i_write)) begin
                            if (~x_local_1_53_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_53_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_53_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_53_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_53_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_53_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_54_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_54_U.t_empty_n & swiglu_swiglu_inst.compute_X1_U0.ap_idle & ~swiglu_swiglu_inst.x_local_1_54_U.i_write} data_PIPO}
                        if ((~x_local_1_54_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_54_U.i_write)) begin
                            if (~x_local_1_54_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_54_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_54_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_54_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_54_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_54_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_55_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_55_U.t_empty_n & swiglu_swiglu_inst.compute_X1_U0.ap_idle & ~swiglu_swiglu_inst.x_local_1_55_U.i_write} data_PIPO}
                        if ((~x_local_1_55_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_55_U.i_write)) begin
                            if (~x_local_1_55_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_55_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_55_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_55_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_55_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_55_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_56_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_56_U.t_empty_n & swiglu_swiglu_inst.compute_X1_U0.ap_idle & ~swiglu_swiglu_inst.x_local_1_56_U.i_write} data_PIPO}
                        if ((~x_local_1_56_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_56_U.i_write)) begin
                            if (~x_local_1_56_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_56_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_56_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_56_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_56_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_56_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_57_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_57_U.t_empty_n & swiglu_swiglu_inst.compute_X1_U0.ap_idle & ~swiglu_swiglu_inst.x_local_1_57_U.i_write} data_PIPO}
                        if ((~x_local_1_57_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_57_U.i_write)) begin
                            if (~x_local_1_57_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_57_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_57_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_57_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_57_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_57_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_58_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_58_U.t_empty_n & swiglu_swiglu_inst.compute_X1_U0.ap_idle & ~swiglu_swiglu_inst.x_local_1_58_U.i_write} data_PIPO}
                        if ((~x_local_1_58_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_58_U.i_write)) begin
                            if (~x_local_1_58_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_58_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_58_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_58_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_58_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_58_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_59_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_59_U.t_empty_n & swiglu_swiglu_inst.compute_X1_U0.ap_idle & ~swiglu_swiglu_inst.x_local_1_59_U.i_write} data_PIPO}
                        if ((~x_local_1_59_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_59_U.i_write)) begin
                            if (~x_local_1_59_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_59_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_59_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_59_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_59_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_59_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_60_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_60_U.t_empty_n & swiglu_swiglu_inst.compute_X1_U0.ap_idle & ~swiglu_swiglu_inst.x_local_1_60_U.i_write} data_PIPO}
                        if ((~x_local_1_60_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_60_U.i_write)) begin
                            if (~x_local_1_60_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_60_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_60_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_60_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_60_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_60_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_61_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_61_U.t_empty_n & swiglu_swiglu_inst.compute_X1_U0.ap_idle & ~swiglu_swiglu_inst.x_local_1_61_U.i_write} data_PIPO}
                        if ((~x_local_1_61_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_61_U.i_write)) begin
                            if (~x_local_1_61_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_61_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_61_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_61_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_61_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_61_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_62_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_62_U.t_empty_n & swiglu_swiglu_inst.compute_X1_U0.ap_idle & ~swiglu_swiglu_inst.x_local_1_62_U.i_write} data_PIPO}
                        if ((~x_local_1_62_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_62_U.i_write)) begin
                            if (~x_local_1_62_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_62_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_62_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_62_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_62_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_62_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_63_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_63_U.t_empty_n & swiglu_swiglu_inst.compute_X1_U0.ap_idle & ~swiglu_swiglu_inst.x_local_1_63_U.i_write} data_PIPO}
                        if ((~x_local_1_63_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_63_U.i_write)) begin
                            if (~x_local_1_63_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_63_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_63_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_63_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_63_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_63_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_64_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_64_U.t_empty_n & swiglu_swiglu_inst.compute_X1_U0.ap_idle & ~swiglu_swiglu_inst.x_local_1_64_U.i_write} data_PIPO}
                        if ((~x_local_1_64_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_64_U.i_write)) begin
                            if (~x_local_1_64_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_64_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_64_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_64_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_64_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_64_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_65_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_65_U.t_empty_n & swiglu_swiglu_inst.compute_X1_U0.ap_idle & ~swiglu_swiglu_inst.x_local_1_65_U.i_write} data_PIPO}
                        if ((~x_local_1_65_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_65_U.i_write)) begin
                            if (~x_local_1_65_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_65_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_65_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_65_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_65_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_65_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_66_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_66_U.t_empty_n & swiglu_swiglu_inst.compute_X1_U0.ap_idle & ~swiglu_swiglu_inst.x_local_1_66_U.i_write} data_PIPO}
                        if ((~x_local_1_66_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_66_U.i_write)) begin
                            if (~x_local_1_66_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_66_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_66_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_66_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_66_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_66_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_67_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_67_U.t_empty_n & swiglu_swiglu_inst.compute_X1_U0.ap_idle & ~swiglu_swiglu_inst.x_local_1_67_U.i_write} data_PIPO}
                        if ((~x_local_1_67_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_67_U.i_write)) begin
                            if (~x_local_1_67_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_67_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_67_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_67_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_67_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_67_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_68_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_68_U.t_empty_n & swiglu_swiglu_inst.compute_X1_U0.ap_idle & ~swiglu_swiglu_inst.x_local_1_68_U.i_write} data_PIPO}
                        if ((~x_local_1_68_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_68_U.i_write)) begin
                            if (~x_local_1_68_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_68_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_68_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_68_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_68_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_68_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_69_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_69_U.t_empty_n & swiglu_swiglu_inst.compute_X1_U0.ap_idle & ~swiglu_swiglu_inst.x_local_1_69_U.i_write} data_PIPO}
                        if ((~x_local_1_69_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_69_U.i_write)) begin
                            if (~x_local_1_69_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_69_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_69_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_69_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_69_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_69_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_70_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_70_U.t_empty_n & swiglu_swiglu_inst.compute_X1_U0.ap_idle & ~swiglu_swiglu_inst.x_local_1_70_U.i_write} data_PIPO}
                        if ((~x_local_1_70_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_70_U.i_write)) begin
                            if (~x_local_1_70_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_70_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_70_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_70_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_70_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_70_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_71_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_71_U.t_empty_n & swiglu_swiglu_inst.compute_X1_U0.ap_idle & ~swiglu_swiglu_inst.x_local_1_71_U.i_write} data_PIPO}
                        if ((~x_local_1_71_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_71_U.i_write)) begin
                            if (~x_local_1_71_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_71_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_71_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_71_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_71_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_71_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_72_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_72_U.t_empty_n & swiglu_swiglu_inst.compute_X1_U0.ap_idle & ~swiglu_swiglu_inst.x_local_1_72_U.i_write} data_PIPO}
                        if ((~x_local_1_72_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_72_U.i_write)) begin
                            if (~x_local_1_72_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_72_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_72_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_72_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_72_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_72_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_73_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_73_U.t_empty_n & swiglu_swiglu_inst.compute_X1_U0.ap_idle & ~swiglu_swiglu_inst.x_local_1_73_U.i_write} data_PIPO}
                        if ((~x_local_1_73_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_73_U.i_write)) begin
                            if (~x_local_1_73_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_73_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_73_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_73_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_73_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_73_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_74_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_74_U.t_empty_n & swiglu_swiglu_inst.compute_X1_U0.ap_idle & ~swiglu_swiglu_inst.x_local_1_74_U.i_write} data_PIPO}
                        if ((~x_local_1_74_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_74_U.i_write)) begin
                            if (~x_local_1_74_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_74_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_74_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_74_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_74_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_74_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_75_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_75_U.t_empty_n & swiglu_swiglu_inst.compute_X1_U0.ap_idle & ~swiglu_swiglu_inst.x_local_1_75_U.i_write} data_PIPO}
                        if ((~x_local_1_75_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_75_U.i_write)) begin
                            if (~x_local_1_75_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_75_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_75_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_75_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_75_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_75_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_76_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_76_U.t_empty_n & swiglu_swiglu_inst.compute_X1_U0.ap_idle & ~swiglu_swiglu_inst.x_local_1_76_U.i_write} data_PIPO}
                        if ((~x_local_1_76_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_76_U.i_write)) begin
                            if (~x_local_1_76_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_76_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_76_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_76_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_76_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_76_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_77_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_77_U.t_empty_n & swiglu_swiglu_inst.compute_X1_U0.ap_idle & ~swiglu_swiglu_inst.x_local_1_77_U.i_write} data_PIPO}
                        if ((~x_local_1_77_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_77_U.i_write)) begin
                            if (~x_local_1_77_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_77_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_77_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_77_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_77_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_77_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_78_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_78_U.t_empty_n & swiglu_swiglu_inst.compute_X1_U0.ap_idle & ~swiglu_swiglu_inst.x_local_1_78_U.i_write} data_PIPO}
                        if ((~x_local_1_78_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_78_U.i_write)) begin
                            if (~x_local_1_78_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_78_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_78_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_78_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_78_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_78_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_79_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_79_U.t_empty_n & swiglu_swiglu_inst.compute_X1_U0.ap_idle & ~swiglu_swiglu_inst.x_local_1_79_U.i_write} data_PIPO}
                        if ((~x_local_1_79_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_79_U.i_write)) begin
                            if (~x_local_1_79_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_79_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_79_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_79_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_79_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_79_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_80_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_80_U.t_empty_n & swiglu_swiglu_inst.compute_X1_U0.ap_idle & ~swiglu_swiglu_inst.x_local_1_80_U.i_write} data_PIPO}
                        if ((~x_local_1_80_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_80_U.i_write)) begin
                            if (~x_local_1_80_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_80_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_80_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_80_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_80_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_80_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_81_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_81_U.t_empty_n & swiglu_swiglu_inst.compute_X1_U0.ap_idle & ~swiglu_swiglu_inst.x_local_1_81_U.i_write} data_PIPO}
                        if ((~x_local_1_81_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_81_U.i_write)) begin
                            if (~x_local_1_81_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_81_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_81_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_81_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_81_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_81_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_82_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_82_U.t_empty_n & swiglu_swiglu_inst.compute_X1_U0.ap_idle & ~swiglu_swiglu_inst.x_local_1_82_U.i_write} data_PIPO}
                        if ((~x_local_1_82_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_82_U.i_write)) begin
                            if (~x_local_1_82_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_82_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_82_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_82_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_82_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_82_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_83_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_83_U.t_empty_n & swiglu_swiglu_inst.compute_X1_U0.ap_idle & ~swiglu_swiglu_inst.x_local_1_83_U.i_write} data_PIPO}
                        if ((~x_local_1_83_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_83_U.i_write)) begin
                            if (~x_local_1_83_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_83_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_83_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_83_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_83_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_83_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_84_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_84_U.t_empty_n & swiglu_swiglu_inst.compute_X1_U0.ap_idle & ~swiglu_swiglu_inst.x_local_1_84_U.i_write} data_PIPO}
                        if ((~x_local_1_84_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_84_U.i_write)) begin
                            if (~x_local_1_84_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_84_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_84_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_84_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_84_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_84_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_85_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_85_U.t_empty_n & swiglu_swiglu_inst.compute_X1_U0.ap_idle & ~swiglu_swiglu_inst.x_local_1_85_U.i_write} data_PIPO}
                        if ((~x_local_1_85_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_85_U.i_write)) begin
                            if (~x_local_1_85_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_85_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_85_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_85_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_85_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_85_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_86_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_86_U.t_empty_n & swiglu_swiglu_inst.compute_X1_U0.ap_idle & ~swiglu_swiglu_inst.x_local_1_86_U.i_write} data_PIPO}
                        if ((~x_local_1_86_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_86_U.i_write)) begin
                            if (~x_local_1_86_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_86_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_86_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_86_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_86_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_86_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_87_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_87_U.t_empty_n & swiglu_swiglu_inst.compute_X1_U0.ap_idle & ~swiglu_swiglu_inst.x_local_1_87_U.i_write} data_PIPO}
                        if ((~x_local_1_87_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_87_U.i_write)) begin
                            if (~x_local_1_87_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_87_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_87_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_87_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_87_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_87_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_88_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_88_U.t_empty_n & swiglu_swiglu_inst.compute_X1_U0.ap_idle & ~swiglu_swiglu_inst.x_local_1_88_U.i_write} data_PIPO}
                        if ((~x_local_1_88_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_88_U.i_write)) begin
                            if (~x_local_1_88_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_88_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_88_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_88_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_88_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_88_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_89_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_89_U.t_empty_n & swiglu_swiglu_inst.compute_X1_U0.ap_idle & ~swiglu_swiglu_inst.x_local_1_89_U.i_write} data_PIPO}
                        if ((~x_local_1_89_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_89_U.i_write)) begin
                            if (~x_local_1_89_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_89_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_89_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_89_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_89_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_89_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_90_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_90_U.t_empty_n & swiglu_swiglu_inst.compute_X1_U0.ap_idle & ~swiglu_swiglu_inst.x_local_1_90_U.i_write} data_PIPO}
                        if ((~x_local_1_90_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_90_U.i_write)) begin
                            if (~x_local_1_90_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_90_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_90_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_90_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_90_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_90_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_91_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_91_U.t_empty_n & swiglu_swiglu_inst.compute_X1_U0.ap_idle & ~swiglu_swiglu_inst.x_local_1_91_U.i_write} data_PIPO}
                        if ((~x_local_1_91_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_91_U.i_write)) begin
                            if (~x_local_1_91_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_91_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_91_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_91_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_91_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_91_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_92_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_92_U.t_empty_n & swiglu_swiglu_inst.compute_X1_U0.ap_idle & ~swiglu_swiglu_inst.x_local_1_92_U.i_write} data_PIPO}
                        if ((~x_local_1_92_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_92_U.i_write)) begin
                            if (~x_local_1_92_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_92_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_92_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_92_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_92_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_92_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_93_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_93_U.t_empty_n & swiglu_swiglu_inst.compute_X1_U0.ap_idle & ~swiglu_swiglu_inst.x_local_1_93_U.i_write} data_PIPO}
                        if ((~x_local_1_93_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_93_U.i_write)) begin
                            if (~x_local_1_93_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_93_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_93_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_93_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_93_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_93_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_94_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_94_U.t_empty_n & swiglu_swiglu_inst.compute_X1_U0.ap_idle & ~swiglu_swiglu_inst.x_local_1_94_U.i_write} data_PIPO}
                        if ((~x_local_1_94_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_94_U.i_write)) begin
                            if (~x_local_1_94_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_94_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_94_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_94_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_94_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_94_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_95_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_95_U.t_empty_n & swiglu_swiglu_inst.compute_X1_U0.ap_idle & ~swiglu_swiglu_inst.x_local_1_95_U.i_write} data_PIPO}
                        if ((~x_local_1_95_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_95_U.i_write)) begin
                            if (~x_local_1_95_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_95_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_95_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_95_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_95_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_95_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_96_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_96_U.t_empty_n & swiglu_swiglu_inst.compute_X1_U0.ap_idle & ~swiglu_swiglu_inst.x_local_1_96_U.i_write} data_PIPO}
                        if ((~x_local_1_96_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_96_U.i_write)) begin
                            if (~x_local_1_96_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_96_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_96_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_96_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_96_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_96_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_97_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_97_U.t_empty_n & swiglu_swiglu_inst.compute_X1_U0.ap_idle & ~swiglu_swiglu_inst.x_local_1_97_U.i_write} data_PIPO}
                        if ((~x_local_1_97_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_97_U.i_write)) begin
                            if (~x_local_1_97_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_97_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_97_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_97_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_97_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_97_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_98_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_98_U.t_empty_n & swiglu_swiglu_inst.compute_X1_U0.ap_idle & ~swiglu_swiglu_inst.x_local_1_98_U.i_write} data_PIPO}
                        if ((~x_local_1_98_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_98_U.i_write)) begin
                            if (~x_local_1_98_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_98_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_98_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_98_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_98_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_98_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_99_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_99_U.t_empty_n & swiglu_swiglu_inst.compute_X1_U0.ap_idle & ~swiglu_swiglu_inst.x_local_1_99_U.i_write} data_PIPO}
                        if ((~x_local_1_99_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_99_U.i_write)) begin
                            if (~x_local_1_99_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_99_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_99_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_99_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_99_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_99_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_100_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_100_U.t_empty_n & swiglu_swiglu_inst.compute_X1_U0.ap_idle & ~swiglu_swiglu_inst.x_local_1_100_U.i_write} data_PIPO}
                        if ((~x_local_1_100_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_100_U.i_write)) begin
                            if (~x_local_1_100_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_100_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_100_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_100_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_100_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_100_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_101_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_101_U.t_empty_n & swiglu_swiglu_inst.compute_X1_U0.ap_idle & ~swiglu_swiglu_inst.x_local_1_101_U.i_write} data_PIPO}
                        if ((~x_local_1_101_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_101_U.i_write)) begin
                            if (~x_local_1_101_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_101_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_101_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_101_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_101_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_101_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_102_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_102_U.t_empty_n & swiglu_swiglu_inst.compute_X1_U0.ap_idle & ~swiglu_swiglu_inst.x_local_1_102_U.i_write} data_PIPO}
                        if ((~x_local_1_102_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_102_U.i_write)) begin
                            if (~x_local_1_102_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_102_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_102_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_102_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_102_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_102_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_103_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_103_U.t_empty_n & swiglu_swiglu_inst.compute_X1_U0.ap_idle & ~swiglu_swiglu_inst.x_local_1_103_U.i_write} data_PIPO}
                        if ((~x_local_1_103_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_103_U.i_write)) begin
                            if (~x_local_1_103_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_103_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_103_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_103_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_103_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_103_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_104_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_104_U.t_empty_n & swiglu_swiglu_inst.compute_X1_U0.ap_idle & ~swiglu_swiglu_inst.x_local_1_104_U.i_write} data_PIPO}
                        if ((~x_local_1_104_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_104_U.i_write)) begin
                            if (~x_local_1_104_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_104_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_104_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_104_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_104_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_104_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_105_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_105_U.t_empty_n & swiglu_swiglu_inst.compute_X1_U0.ap_idle & ~swiglu_swiglu_inst.x_local_1_105_U.i_write} data_PIPO}
                        if ((~x_local_1_105_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_105_U.i_write)) begin
                            if (~x_local_1_105_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_105_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_105_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_105_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_105_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_105_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_106_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_106_U.t_empty_n & swiglu_swiglu_inst.compute_X1_U0.ap_idle & ~swiglu_swiglu_inst.x_local_1_106_U.i_write} data_PIPO}
                        if ((~x_local_1_106_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_106_U.i_write)) begin
                            if (~x_local_1_106_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_106_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_106_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_106_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_106_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_106_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_107_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_107_U.t_empty_n & swiglu_swiglu_inst.compute_X1_U0.ap_idle & ~swiglu_swiglu_inst.x_local_1_107_U.i_write} data_PIPO}
                        if ((~x_local_1_107_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_107_U.i_write)) begin
                            if (~x_local_1_107_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_107_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_107_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_107_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_107_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_107_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_108_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_108_U.t_empty_n & swiglu_swiglu_inst.compute_X1_U0.ap_idle & ~swiglu_swiglu_inst.x_local_1_108_U.i_write} data_PIPO}
                        if ((~x_local_1_108_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_108_U.i_write)) begin
                            if (~x_local_1_108_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_108_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_108_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_108_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_108_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_108_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_109_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_109_U.t_empty_n & swiglu_swiglu_inst.compute_X1_U0.ap_idle & ~swiglu_swiglu_inst.x_local_1_109_U.i_write} data_PIPO}
                        if ((~x_local_1_109_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_109_U.i_write)) begin
                            if (~x_local_1_109_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_109_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_109_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_109_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_109_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_109_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_110_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_110_U.t_empty_n & swiglu_swiglu_inst.compute_X1_U0.ap_idle & ~swiglu_swiglu_inst.x_local_1_110_U.i_write} data_PIPO}
                        if ((~x_local_1_110_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_110_U.i_write)) begin
                            if (~x_local_1_110_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_110_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_110_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_110_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_110_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_110_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_111_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_111_U.t_empty_n & swiglu_swiglu_inst.compute_X1_U0.ap_idle & ~swiglu_swiglu_inst.x_local_1_111_U.i_write} data_PIPO}
                        if ((~x_local_1_111_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_111_U.i_write)) begin
                            if (~x_local_1_111_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_111_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_111_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_111_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_111_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_111_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_112_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_112_U.t_empty_n & swiglu_swiglu_inst.compute_X1_U0.ap_idle & ~swiglu_swiglu_inst.x_local_1_112_U.i_write} data_PIPO}
                        if ((~x_local_1_112_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_112_U.i_write)) begin
                            if (~x_local_1_112_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_112_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_112_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_112_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_112_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_112_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_113_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_113_U.t_empty_n & swiglu_swiglu_inst.compute_X1_U0.ap_idle & ~swiglu_swiglu_inst.x_local_1_113_U.i_write} data_PIPO}
                        if ((~x_local_1_113_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_113_U.i_write)) begin
                            if (~x_local_1_113_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_113_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_113_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_113_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_113_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_113_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_114_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_114_U.t_empty_n & swiglu_swiglu_inst.compute_X1_U0.ap_idle & ~swiglu_swiglu_inst.x_local_1_114_U.i_write} data_PIPO}
                        if ((~x_local_1_114_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_114_U.i_write)) begin
                            if (~x_local_1_114_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_114_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_114_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_114_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_114_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_114_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_115_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_115_U.t_empty_n & swiglu_swiglu_inst.compute_X1_U0.ap_idle & ~swiglu_swiglu_inst.x_local_1_115_U.i_write} data_PIPO}
                        if ((~x_local_1_115_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_115_U.i_write)) begin
                            if (~x_local_1_115_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_115_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_115_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_115_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_115_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_115_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_116_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_116_U.t_empty_n & swiglu_swiglu_inst.compute_X1_U0.ap_idle & ~swiglu_swiglu_inst.x_local_1_116_U.i_write} data_PIPO}
                        if ((~x_local_1_116_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_116_U.i_write)) begin
                            if (~x_local_1_116_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_116_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_116_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_116_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_116_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_116_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_117_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_117_U.t_empty_n & swiglu_swiglu_inst.compute_X1_U0.ap_idle & ~swiglu_swiglu_inst.x_local_1_117_U.i_write} data_PIPO}
                        if ((~x_local_1_117_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_117_U.i_write)) begin
                            if (~x_local_1_117_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_117_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_117_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_117_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_117_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_117_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_118_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_118_U.t_empty_n & swiglu_swiglu_inst.compute_X1_U0.ap_idle & ~swiglu_swiglu_inst.x_local_1_118_U.i_write} data_PIPO}
                        if ((~x_local_1_118_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_118_U.i_write)) begin
                            if (~x_local_1_118_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_118_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_118_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_118_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_118_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_118_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_119_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_119_U.t_empty_n & swiglu_swiglu_inst.compute_X1_U0.ap_idle & ~swiglu_swiglu_inst.x_local_1_119_U.i_write} data_PIPO}
                        if ((~x_local_1_119_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_119_U.i_write)) begin
                            if (~x_local_1_119_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_119_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_119_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_119_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_119_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_119_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_120_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_120_U.t_empty_n & swiglu_swiglu_inst.compute_X1_U0.ap_idle & ~swiglu_swiglu_inst.x_local_1_120_U.i_write} data_PIPO}
                        if ((~x_local_1_120_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_120_U.i_write)) begin
                            if (~x_local_1_120_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_120_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_120_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_120_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_120_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_120_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_121_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_121_U.t_empty_n & swiglu_swiglu_inst.compute_X1_U0.ap_idle & ~swiglu_swiglu_inst.x_local_1_121_U.i_write} data_PIPO}
                        if ((~x_local_1_121_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_121_U.i_write)) begin
                            if (~x_local_1_121_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_121_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_121_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_121_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_121_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_121_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_122_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_122_U.t_empty_n & swiglu_swiglu_inst.compute_X1_U0.ap_idle & ~swiglu_swiglu_inst.x_local_1_122_U.i_write} data_PIPO}
                        if ((~x_local_1_122_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_122_U.i_write)) begin
                            if (~x_local_1_122_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_122_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_122_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_122_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_122_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_122_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_123_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_123_U.t_empty_n & swiglu_swiglu_inst.compute_X1_U0.ap_idle & ~swiglu_swiglu_inst.x_local_1_123_U.i_write} data_PIPO}
                        if ((~x_local_1_123_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_123_U.i_write)) begin
                            if (~x_local_1_123_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_123_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_123_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_123_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_123_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_123_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_124_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_124_U.t_empty_n & swiglu_swiglu_inst.compute_X1_U0.ap_idle & ~swiglu_swiglu_inst.x_local_1_124_U.i_write} data_PIPO}
                        if ((~x_local_1_124_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_124_U.i_write)) begin
                            if (~x_local_1_124_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_124_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_124_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_124_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_124_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_124_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_125_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_125_U.t_empty_n & swiglu_swiglu_inst.compute_X1_U0.ap_idle & ~swiglu_swiglu_inst.x_local_1_125_U.i_write} data_PIPO}
                        if ((~x_local_1_125_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_125_U.i_write)) begin
                            if (~x_local_1_125_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_125_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_125_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_125_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_125_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_125_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_126_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_126_U.t_empty_n & swiglu_swiglu_inst.compute_X1_U0.ap_idle & ~swiglu_swiglu_inst.x_local_1_126_U.i_write} data_PIPO}
                        if ((~x_local_1_126_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_126_U.i_write)) begin
                            if (~x_local_1_126_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_126_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_126_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_126_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_126_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_126_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_1_127_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_1_127_U.t_empty_n & swiglu_swiglu_inst.compute_X1_U0.ap_idle & ~swiglu_swiglu_inst.x_local_1_127_U.i_write} data_PIPO}
                        if ((~x_local_1_127_U.t_empty_n & compute_X1_U0.ap_idle & ~x_local_1_127_U.i_write)) begin
                            if (~x_local_1_127_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_1_127_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_127_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_1_127_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_1_127_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_1_127_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
                    end
                    4: begin //  for dep proc 'swiglu_swiglu.compute_gate_U0'
// for dep channel 'swiglu_swiglu.X1_cache_U' info is :
// blk sig is {~swiglu_swiglu_inst.compute_X1_U0.X1_cache_blk_n data_FIFO}
                        if ((~compute_X1_U0.X1_cache_blk_n)) begin
                            if (~X1_cache_U.if_empty_n) begin
                                $display("//      Blocked by empty input FIFO 'swiglu_swiglu.X1_cache_U' written by process 'swiglu_swiglu.compute_gate_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.X1_cache_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~X1_cache_U.if_full_n) begin
                                $display("//      Blocked by full output FIFO 'swiglu_swiglu.X1_cache_U' read by process 'swiglu_swiglu.compute_gate_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.X1_cache_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.start_for_compute_gate_U0_U' info is :
// blk sig is {{~swiglu_swiglu_inst.start_for_compute_gate_U0_U.if_full_n & swiglu_swiglu_inst.compute_X1_U0.ap_start & ~swiglu_swiglu_inst.compute_X1_U0.real_start & (trans_in_cnt_0 == trans_out_cnt_0) & ~swiglu_swiglu_inst.start_for_compute_gate_U0_U.if_read} start_FIFO}
                        if ((~start_for_compute_gate_U0_U.if_full_n & compute_X1_U0.ap_start & ~compute_X1_U0.real_start & (trans_in_cnt_0 == trans_out_cnt_0) & ~start_for_compute_gate_U0_U.if_read)) begin
                            $display("//      Blocked by full output start propagation FIFO 'swiglu_swiglu.start_for_compute_gate_U0_U' read by process 'swiglu_swiglu.compute_gate_U0',");
                        end
                    end
                    endcase
                end
                3 : begin // for proc 'swiglu_swiglu.compute_X2_U0'
                    case(index2)
                    0: begin //  for dep proc 'swiglu_swiglu.entry_proc_U0'
// for dep channel 'swiglu_swiglu.V_c_U' info is :
// blk sig is {~swiglu_swiglu_inst.compute_X2_U0.V_blk_n data_FIFO}
                        if ((~compute_X2_U0.V_blk_n)) begin
                            if (~V_c_U.if_empty_n) begin
                                $display("//      Blocked by empty input FIFO 'swiglu_swiglu.V_c_U' written by process 'swiglu_swiglu.entry_proc_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.V_c_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~V_c_U.if_full_n) begin
                                $display("//      Blocked by full output FIFO 'swiglu_swiglu.V_c_U' read by process 'swiglu_swiglu.entry_proc_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.V_c_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_scale_c_U' info is :
// blk sig is {~swiglu_swiglu_inst.compute_X2_U0.x_scale_blk_n data_FIFO}
                        if ((~compute_X2_U0.x_scale_blk_n)) begin
                            if (~x_scale_c_U.if_empty_n) begin
                                $display("//      Blocked by empty input FIFO 'swiglu_swiglu.x_scale_c_U' written by process 'swiglu_swiglu.entry_proc_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_scale_c_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_scale_c_U.if_full_n) begin
                                $display("//      Blocked by full output FIFO 'swiglu_swiglu.x_scale_c_U' read by process 'swiglu_swiglu.entry_proc_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_scale_c_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
                    end
                    1: begin //  for dep proc 'swiglu_swiglu.load_x_local_U0'
// for dep channel 'swiglu_swiglu.x_local_2_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_U.t_empty_n & swiglu_swiglu_inst.compute_X2_U0.ap_idle & ~swiglu_swiglu_inst.x_local_2_U.i_write} data_PIPO}
                        if ((~x_local_2_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_U.i_write)) begin
                            if (~x_local_2_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_1_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_1_U.t_empty_n & swiglu_swiglu_inst.compute_X2_U0.ap_idle & ~swiglu_swiglu_inst.x_local_2_1_U.i_write} data_PIPO}
                        if ((~x_local_2_1_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_1_U.i_write)) begin
                            if (~x_local_2_1_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_1_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_1_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_1_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_1_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_1_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_2_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_2_U.t_empty_n & swiglu_swiglu_inst.compute_X2_U0.ap_idle & ~swiglu_swiglu_inst.x_local_2_2_U.i_write} data_PIPO}
                        if ((~x_local_2_2_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_2_U.i_write)) begin
                            if (~x_local_2_2_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_2_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_2_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_2_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_2_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_2_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_3_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_3_U.t_empty_n & swiglu_swiglu_inst.compute_X2_U0.ap_idle & ~swiglu_swiglu_inst.x_local_2_3_U.i_write} data_PIPO}
                        if ((~x_local_2_3_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_3_U.i_write)) begin
                            if (~x_local_2_3_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_3_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_3_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_3_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_3_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_3_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_4_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_4_U.t_empty_n & swiglu_swiglu_inst.compute_X2_U0.ap_idle & ~swiglu_swiglu_inst.x_local_2_4_U.i_write} data_PIPO}
                        if ((~x_local_2_4_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_4_U.i_write)) begin
                            if (~x_local_2_4_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_4_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_4_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_4_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_4_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_4_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_5_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_5_U.t_empty_n & swiglu_swiglu_inst.compute_X2_U0.ap_idle & ~swiglu_swiglu_inst.x_local_2_5_U.i_write} data_PIPO}
                        if ((~x_local_2_5_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_5_U.i_write)) begin
                            if (~x_local_2_5_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_5_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_5_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_5_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_5_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_5_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_6_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_6_U.t_empty_n & swiglu_swiglu_inst.compute_X2_U0.ap_idle & ~swiglu_swiglu_inst.x_local_2_6_U.i_write} data_PIPO}
                        if ((~x_local_2_6_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_6_U.i_write)) begin
                            if (~x_local_2_6_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_6_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_6_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_6_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_6_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_6_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_7_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_7_U.t_empty_n & swiglu_swiglu_inst.compute_X2_U0.ap_idle & ~swiglu_swiglu_inst.x_local_2_7_U.i_write} data_PIPO}
                        if ((~x_local_2_7_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_7_U.i_write)) begin
                            if (~x_local_2_7_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_7_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_7_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_7_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_7_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_7_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_8_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_8_U.t_empty_n & swiglu_swiglu_inst.compute_X2_U0.ap_idle & ~swiglu_swiglu_inst.x_local_2_8_U.i_write} data_PIPO}
                        if ((~x_local_2_8_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_8_U.i_write)) begin
                            if (~x_local_2_8_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_8_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_8_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_8_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_8_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_8_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_9_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_9_U.t_empty_n & swiglu_swiglu_inst.compute_X2_U0.ap_idle & ~swiglu_swiglu_inst.x_local_2_9_U.i_write} data_PIPO}
                        if ((~x_local_2_9_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_9_U.i_write)) begin
                            if (~x_local_2_9_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_9_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_9_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_9_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_9_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_9_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_10_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_10_U.t_empty_n & swiglu_swiglu_inst.compute_X2_U0.ap_idle & ~swiglu_swiglu_inst.x_local_2_10_U.i_write} data_PIPO}
                        if ((~x_local_2_10_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_10_U.i_write)) begin
                            if (~x_local_2_10_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_10_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_10_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_10_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_10_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_10_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_11_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_11_U.t_empty_n & swiglu_swiglu_inst.compute_X2_U0.ap_idle & ~swiglu_swiglu_inst.x_local_2_11_U.i_write} data_PIPO}
                        if ((~x_local_2_11_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_11_U.i_write)) begin
                            if (~x_local_2_11_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_11_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_11_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_11_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_11_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_11_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_12_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_12_U.t_empty_n & swiglu_swiglu_inst.compute_X2_U0.ap_idle & ~swiglu_swiglu_inst.x_local_2_12_U.i_write} data_PIPO}
                        if ((~x_local_2_12_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_12_U.i_write)) begin
                            if (~x_local_2_12_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_12_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_12_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_12_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_12_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_12_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_13_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_13_U.t_empty_n & swiglu_swiglu_inst.compute_X2_U0.ap_idle & ~swiglu_swiglu_inst.x_local_2_13_U.i_write} data_PIPO}
                        if ((~x_local_2_13_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_13_U.i_write)) begin
                            if (~x_local_2_13_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_13_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_13_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_13_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_13_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_13_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_14_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_14_U.t_empty_n & swiglu_swiglu_inst.compute_X2_U0.ap_idle & ~swiglu_swiglu_inst.x_local_2_14_U.i_write} data_PIPO}
                        if ((~x_local_2_14_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_14_U.i_write)) begin
                            if (~x_local_2_14_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_14_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_14_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_14_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_14_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_14_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_15_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_15_U.t_empty_n & swiglu_swiglu_inst.compute_X2_U0.ap_idle & ~swiglu_swiglu_inst.x_local_2_15_U.i_write} data_PIPO}
                        if ((~x_local_2_15_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_15_U.i_write)) begin
                            if (~x_local_2_15_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_15_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_15_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_15_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_15_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_15_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_16_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_16_U.t_empty_n & swiglu_swiglu_inst.compute_X2_U0.ap_idle & ~swiglu_swiglu_inst.x_local_2_16_U.i_write} data_PIPO}
                        if ((~x_local_2_16_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_16_U.i_write)) begin
                            if (~x_local_2_16_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_16_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_16_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_16_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_16_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_16_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_17_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_17_U.t_empty_n & swiglu_swiglu_inst.compute_X2_U0.ap_idle & ~swiglu_swiglu_inst.x_local_2_17_U.i_write} data_PIPO}
                        if ((~x_local_2_17_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_17_U.i_write)) begin
                            if (~x_local_2_17_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_17_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_17_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_17_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_17_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_17_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_18_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_18_U.t_empty_n & swiglu_swiglu_inst.compute_X2_U0.ap_idle & ~swiglu_swiglu_inst.x_local_2_18_U.i_write} data_PIPO}
                        if ((~x_local_2_18_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_18_U.i_write)) begin
                            if (~x_local_2_18_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_18_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_18_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_18_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_18_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_18_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_19_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_19_U.t_empty_n & swiglu_swiglu_inst.compute_X2_U0.ap_idle & ~swiglu_swiglu_inst.x_local_2_19_U.i_write} data_PIPO}
                        if ((~x_local_2_19_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_19_U.i_write)) begin
                            if (~x_local_2_19_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_19_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_19_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_19_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_19_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_19_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_20_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_20_U.t_empty_n & swiglu_swiglu_inst.compute_X2_U0.ap_idle & ~swiglu_swiglu_inst.x_local_2_20_U.i_write} data_PIPO}
                        if ((~x_local_2_20_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_20_U.i_write)) begin
                            if (~x_local_2_20_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_20_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_20_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_20_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_20_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_20_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_21_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_21_U.t_empty_n & swiglu_swiglu_inst.compute_X2_U0.ap_idle & ~swiglu_swiglu_inst.x_local_2_21_U.i_write} data_PIPO}
                        if ((~x_local_2_21_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_21_U.i_write)) begin
                            if (~x_local_2_21_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_21_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_21_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_21_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_21_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_21_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_22_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_22_U.t_empty_n & swiglu_swiglu_inst.compute_X2_U0.ap_idle & ~swiglu_swiglu_inst.x_local_2_22_U.i_write} data_PIPO}
                        if ((~x_local_2_22_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_22_U.i_write)) begin
                            if (~x_local_2_22_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_22_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_22_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_22_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_22_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_22_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_23_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_23_U.t_empty_n & swiglu_swiglu_inst.compute_X2_U0.ap_idle & ~swiglu_swiglu_inst.x_local_2_23_U.i_write} data_PIPO}
                        if ((~x_local_2_23_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_23_U.i_write)) begin
                            if (~x_local_2_23_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_23_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_23_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_23_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_23_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_23_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_24_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_24_U.t_empty_n & swiglu_swiglu_inst.compute_X2_U0.ap_idle & ~swiglu_swiglu_inst.x_local_2_24_U.i_write} data_PIPO}
                        if ((~x_local_2_24_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_24_U.i_write)) begin
                            if (~x_local_2_24_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_24_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_24_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_24_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_24_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_24_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_25_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_25_U.t_empty_n & swiglu_swiglu_inst.compute_X2_U0.ap_idle & ~swiglu_swiglu_inst.x_local_2_25_U.i_write} data_PIPO}
                        if ((~x_local_2_25_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_25_U.i_write)) begin
                            if (~x_local_2_25_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_25_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_25_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_25_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_25_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_25_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_26_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_26_U.t_empty_n & swiglu_swiglu_inst.compute_X2_U0.ap_idle & ~swiglu_swiglu_inst.x_local_2_26_U.i_write} data_PIPO}
                        if ((~x_local_2_26_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_26_U.i_write)) begin
                            if (~x_local_2_26_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_26_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_26_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_26_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_26_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_26_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_27_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_27_U.t_empty_n & swiglu_swiglu_inst.compute_X2_U0.ap_idle & ~swiglu_swiglu_inst.x_local_2_27_U.i_write} data_PIPO}
                        if ((~x_local_2_27_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_27_U.i_write)) begin
                            if (~x_local_2_27_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_27_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_27_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_27_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_27_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_27_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_28_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_28_U.t_empty_n & swiglu_swiglu_inst.compute_X2_U0.ap_idle & ~swiglu_swiglu_inst.x_local_2_28_U.i_write} data_PIPO}
                        if ((~x_local_2_28_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_28_U.i_write)) begin
                            if (~x_local_2_28_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_28_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_28_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_28_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_28_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_28_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_29_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_29_U.t_empty_n & swiglu_swiglu_inst.compute_X2_U0.ap_idle & ~swiglu_swiglu_inst.x_local_2_29_U.i_write} data_PIPO}
                        if ((~x_local_2_29_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_29_U.i_write)) begin
                            if (~x_local_2_29_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_29_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_29_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_29_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_29_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_29_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_30_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_30_U.t_empty_n & swiglu_swiglu_inst.compute_X2_U0.ap_idle & ~swiglu_swiglu_inst.x_local_2_30_U.i_write} data_PIPO}
                        if ((~x_local_2_30_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_30_U.i_write)) begin
                            if (~x_local_2_30_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_30_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_30_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_30_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_30_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_30_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_31_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_31_U.t_empty_n & swiglu_swiglu_inst.compute_X2_U0.ap_idle & ~swiglu_swiglu_inst.x_local_2_31_U.i_write} data_PIPO}
                        if ((~x_local_2_31_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_31_U.i_write)) begin
                            if (~x_local_2_31_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_31_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_31_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_31_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_31_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_31_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_32_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_32_U.t_empty_n & swiglu_swiglu_inst.compute_X2_U0.ap_idle & ~swiglu_swiglu_inst.x_local_2_32_U.i_write} data_PIPO}
                        if ((~x_local_2_32_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_32_U.i_write)) begin
                            if (~x_local_2_32_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_32_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_32_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_32_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_32_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_32_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_33_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_33_U.t_empty_n & swiglu_swiglu_inst.compute_X2_U0.ap_idle & ~swiglu_swiglu_inst.x_local_2_33_U.i_write} data_PIPO}
                        if ((~x_local_2_33_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_33_U.i_write)) begin
                            if (~x_local_2_33_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_33_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_33_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_33_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_33_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_33_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_34_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_34_U.t_empty_n & swiglu_swiglu_inst.compute_X2_U0.ap_idle & ~swiglu_swiglu_inst.x_local_2_34_U.i_write} data_PIPO}
                        if ((~x_local_2_34_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_34_U.i_write)) begin
                            if (~x_local_2_34_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_34_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_34_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_34_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_34_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_34_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_35_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_35_U.t_empty_n & swiglu_swiglu_inst.compute_X2_U0.ap_idle & ~swiglu_swiglu_inst.x_local_2_35_U.i_write} data_PIPO}
                        if ((~x_local_2_35_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_35_U.i_write)) begin
                            if (~x_local_2_35_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_35_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_35_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_35_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_35_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_35_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_36_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_36_U.t_empty_n & swiglu_swiglu_inst.compute_X2_U0.ap_idle & ~swiglu_swiglu_inst.x_local_2_36_U.i_write} data_PIPO}
                        if ((~x_local_2_36_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_36_U.i_write)) begin
                            if (~x_local_2_36_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_36_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_36_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_36_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_36_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_36_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_37_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_37_U.t_empty_n & swiglu_swiglu_inst.compute_X2_U0.ap_idle & ~swiglu_swiglu_inst.x_local_2_37_U.i_write} data_PIPO}
                        if ((~x_local_2_37_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_37_U.i_write)) begin
                            if (~x_local_2_37_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_37_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_37_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_37_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_37_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_37_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_38_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_38_U.t_empty_n & swiglu_swiglu_inst.compute_X2_U0.ap_idle & ~swiglu_swiglu_inst.x_local_2_38_U.i_write} data_PIPO}
                        if ((~x_local_2_38_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_38_U.i_write)) begin
                            if (~x_local_2_38_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_38_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_38_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_38_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_38_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_38_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_39_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_39_U.t_empty_n & swiglu_swiglu_inst.compute_X2_U0.ap_idle & ~swiglu_swiglu_inst.x_local_2_39_U.i_write} data_PIPO}
                        if ((~x_local_2_39_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_39_U.i_write)) begin
                            if (~x_local_2_39_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_39_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_39_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_39_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_39_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_39_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_40_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_40_U.t_empty_n & swiglu_swiglu_inst.compute_X2_U0.ap_idle & ~swiglu_swiglu_inst.x_local_2_40_U.i_write} data_PIPO}
                        if ((~x_local_2_40_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_40_U.i_write)) begin
                            if (~x_local_2_40_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_40_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_40_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_40_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_40_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_40_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_41_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_41_U.t_empty_n & swiglu_swiglu_inst.compute_X2_U0.ap_idle & ~swiglu_swiglu_inst.x_local_2_41_U.i_write} data_PIPO}
                        if ((~x_local_2_41_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_41_U.i_write)) begin
                            if (~x_local_2_41_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_41_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_41_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_41_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_41_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_41_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_42_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_42_U.t_empty_n & swiglu_swiglu_inst.compute_X2_U0.ap_idle & ~swiglu_swiglu_inst.x_local_2_42_U.i_write} data_PIPO}
                        if ((~x_local_2_42_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_42_U.i_write)) begin
                            if (~x_local_2_42_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_42_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_42_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_42_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_42_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_42_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_43_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_43_U.t_empty_n & swiglu_swiglu_inst.compute_X2_U0.ap_idle & ~swiglu_swiglu_inst.x_local_2_43_U.i_write} data_PIPO}
                        if ((~x_local_2_43_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_43_U.i_write)) begin
                            if (~x_local_2_43_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_43_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_43_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_43_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_43_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_43_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_44_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_44_U.t_empty_n & swiglu_swiglu_inst.compute_X2_U0.ap_idle & ~swiglu_swiglu_inst.x_local_2_44_U.i_write} data_PIPO}
                        if ((~x_local_2_44_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_44_U.i_write)) begin
                            if (~x_local_2_44_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_44_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_44_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_44_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_44_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_44_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_45_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_45_U.t_empty_n & swiglu_swiglu_inst.compute_X2_U0.ap_idle & ~swiglu_swiglu_inst.x_local_2_45_U.i_write} data_PIPO}
                        if ((~x_local_2_45_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_45_U.i_write)) begin
                            if (~x_local_2_45_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_45_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_45_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_45_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_45_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_45_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_46_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_46_U.t_empty_n & swiglu_swiglu_inst.compute_X2_U0.ap_idle & ~swiglu_swiglu_inst.x_local_2_46_U.i_write} data_PIPO}
                        if ((~x_local_2_46_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_46_U.i_write)) begin
                            if (~x_local_2_46_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_46_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_46_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_46_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_46_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_46_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_47_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_47_U.t_empty_n & swiglu_swiglu_inst.compute_X2_U0.ap_idle & ~swiglu_swiglu_inst.x_local_2_47_U.i_write} data_PIPO}
                        if ((~x_local_2_47_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_47_U.i_write)) begin
                            if (~x_local_2_47_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_47_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_47_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_47_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_47_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_47_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_48_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_48_U.t_empty_n & swiglu_swiglu_inst.compute_X2_U0.ap_idle & ~swiglu_swiglu_inst.x_local_2_48_U.i_write} data_PIPO}
                        if ((~x_local_2_48_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_48_U.i_write)) begin
                            if (~x_local_2_48_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_48_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_48_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_48_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_48_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_48_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_49_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_49_U.t_empty_n & swiglu_swiglu_inst.compute_X2_U0.ap_idle & ~swiglu_swiglu_inst.x_local_2_49_U.i_write} data_PIPO}
                        if ((~x_local_2_49_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_49_U.i_write)) begin
                            if (~x_local_2_49_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_49_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_49_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_49_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_49_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_49_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_50_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_50_U.t_empty_n & swiglu_swiglu_inst.compute_X2_U0.ap_idle & ~swiglu_swiglu_inst.x_local_2_50_U.i_write} data_PIPO}
                        if ((~x_local_2_50_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_50_U.i_write)) begin
                            if (~x_local_2_50_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_50_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_50_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_50_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_50_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_50_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_51_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_51_U.t_empty_n & swiglu_swiglu_inst.compute_X2_U0.ap_idle & ~swiglu_swiglu_inst.x_local_2_51_U.i_write} data_PIPO}
                        if ((~x_local_2_51_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_51_U.i_write)) begin
                            if (~x_local_2_51_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_51_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_51_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_51_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_51_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_51_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_52_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_52_U.t_empty_n & swiglu_swiglu_inst.compute_X2_U0.ap_idle & ~swiglu_swiglu_inst.x_local_2_52_U.i_write} data_PIPO}
                        if ((~x_local_2_52_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_52_U.i_write)) begin
                            if (~x_local_2_52_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_52_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_52_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_52_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_52_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_52_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_53_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_53_U.t_empty_n & swiglu_swiglu_inst.compute_X2_U0.ap_idle & ~swiglu_swiglu_inst.x_local_2_53_U.i_write} data_PIPO}
                        if ((~x_local_2_53_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_53_U.i_write)) begin
                            if (~x_local_2_53_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_53_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_53_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_53_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_53_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_53_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_54_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_54_U.t_empty_n & swiglu_swiglu_inst.compute_X2_U0.ap_idle & ~swiglu_swiglu_inst.x_local_2_54_U.i_write} data_PIPO}
                        if ((~x_local_2_54_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_54_U.i_write)) begin
                            if (~x_local_2_54_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_54_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_54_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_54_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_54_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_54_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_55_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_55_U.t_empty_n & swiglu_swiglu_inst.compute_X2_U0.ap_idle & ~swiglu_swiglu_inst.x_local_2_55_U.i_write} data_PIPO}
                        if ((~x_local_2_55_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_55_U.i_write)) begin
                            if (~x_local_2_55_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_55_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_55_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_55_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_55_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_55_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_56_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_56_U.t_empty_n & swiglu_swiglu_inst.compute_X2_U0.ap_idle & ~swiglu_swiglu_inst.x_local_2_56_U.i_write} data_PIPO}
                        if ((~x_local_2_56_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_56_U.i_write)) begin
                            if (~x_local_2_56_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_56_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_56_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_56_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_56_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_56_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_57_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_57_U.t_empty_n & swiglu_swiglu_inst.compute_X2_U0.ap_idle & ~swiglu_swiglu_inst.x_local_2_57_U.i_write} data_PIPO}
                        if ((~x_local_2_57_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_57_U.i_write)) begin
                            if (~x_local_2_57_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_57_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_57_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_57_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_57_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_57_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_58_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_58_U.t_empty_n & swiglu_swiglu_inst.compute_X2_U0.ap_idle & ~swiglu_swiglu_inst.x_local_2_58_U.i_write} data_PIPO}
                        if ((~x_local_2_58_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_58_U.i_write)) begin
                            if (~x_local_2_58_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_58_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_58_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_58_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_58_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_58_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_59_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_59_U.t_empty_n & swiglu_swiglu_inst.compute_X2_U0.ap_idle & ~swiglu_swiglu_inst.x_local_2_59_U.i_write} data_PIPO}
                        if ((~x_local_2_59_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_59_U.i_write)) begin
                            if (~x_local_2_59_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_59_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_59_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_59_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_59_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_59_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_60_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_60_U.t_empty_n & swiglu_swiglu_inst.compute_X2_U0.ap_idle & ~swiglu_swiglu_inst.x_local_2_60_U.i_write} data_PIPO}
                        if ((~x_local_2_60_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_60_U.i_write)) begin
                            if (~x_local_2_60_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_60_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_60_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_60_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_60_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_60_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_61_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_61_U.t_empty_n & swiglu_swiglu_inst.compute_X2_U0.ap_idle & ~swiglu_swiglu_inst.x_local_2_61_U.i_write} data_PIPO}
                        if ((~x_local_2_61_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_61_U.i_write)) begin
                            if (~x_local_2_61_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_61_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_61_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_61_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_61_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_61_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_62_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_62_U.t_empty_n & swiglu_swiglu_inst.compute_X2_U0.ap_idle & ~swiglu_swiglu_inst.x_local_2_62_U.i_write} data_PIPO}
                        if ((~x_local_2_62_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_62_U.i_write)) begin
                            if (~x_local_2_62_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_62_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_62_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_62_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_62_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_62_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_63_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_63_U.t_empty_n & swiglu_swiglu_inst.compute_X2_U0.ap_idle & ~swiglu_swiglu_inst.x_local_2_63_U.i_write} data_PIPO}
                        if ((~x_local_2_63_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_63_U.i_write)) begin
                            if (~x_local_2_63_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_63_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_63_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_63_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_63_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_63_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_64_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_64_U.t_empty_n & swiglu_swiglu_inst.compute_X2_U0.ap_idle & ~swiglu_swiglu_inst.x_local_2_64_U.i_write} data_PIPO}
                        if ((~x_local_2_64_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_64_U.i_write)) begin
                            if (~x_local_2_64_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_64_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_64_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_64_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_64_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_64_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_65_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_65_U.t_empty_n & swiglu_swiglu_inst.compute_X2_U0.ap_idle & ~swiglu_swiglu_inst.x_local_2_65_U.i_write} data_PIPO}
                        if ((~x_local_2_65_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_65_U.i_write)) begin
                            if (~x_local_2_65_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_65_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_65_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_65_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_65_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_65_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_66_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_66_U.t_empty_n & swiglu_swiglu_inst.compute_X2_U0.ap_idle & ~swiglu_swiglu_inst.x_local_2_66_U.i_write} data_PIPO}
                        if ((~x_local_2_66_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_66_U.i_write)) begin
                            if (~x_local_2_66_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_66_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_66_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_66_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_66_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_66_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_67_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_67_U.t_empty_n & swiglu_swiglu_inst.compute_X2_U0.ap_idle & ~swiglu_swiglu_inst.x_local_2_67_U.i_write} data_PIPO}
                        if ((~x_local_2_67_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_67_U.i_write)) begin
                            if (~x_local_2_67_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_67_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_67_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_67_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_67_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_67_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_68_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_68_U.t_empty_n & swiglu_swiglu_inst.compute_X2_U0.ap_idle & ~swiglu_swiglu_inst.x_local_2_68_U.i_write} data_PIPO}
                        if ((~x_local_2_68_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_68_U.i_write)) begin
                            if (~x_local_2_68_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_68_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_68_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_68_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_68_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_68_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_69_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_69_U.t_empty_n & swiglu_swiglu_inst.compute_X2_U0.ap_idle & ~swiglu_swiglu_inst.x_local_2_69_U.i_write} data_PIPO}
                        if ((~x_local_2_69_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_69_U.i_write)) begin
                            if (~x_local_2_69_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_69_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_69_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_69_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_69_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_69_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_70_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_70_U.t_empty_n & swiglu_swiglu_inst.compute_X2_U0.ap_idle & ~swiglu_swiglu_inst.x_local_2_70_U.i_write} data_PIPO}
                        if ((~x_local_2_70_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_70_U.i_write)) begin
                            if (~x_local_2_70_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_70_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_70_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_70_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_70_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_70_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_71_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_71_U.t_empty_n & swiglu_swiglu_inst.compute_X2_U0.ap_idle & ~swiglu_swiglu_inst.x_local_2_71_U.i_write} data_PIPO}
                        if ((~x_local_2_71_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_71_U.i_write)) begin
                            if (~x_local_2_71_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_71_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_71_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_71_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_71_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_71_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_72_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_72_U.t_empty_n & swiglu_swiglu_inst.compute_X2_U0.ap_idle & ~swiglu_swiglu_inst.x_local_2_72_U.i_write} data_PIPO}
                        if ((~x_local_2_72_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_72_U.i_write)) begin
                            if (~x_local_2_72_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_72_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_72_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_72_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_72_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_72_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_73_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_73_U.t_empty_n & swiglu_swiglu_inst.compute_X2_U0.ap_idle & ~swiglu_swiglu_inst.x_local_2_73_U.i_write} data_PIPO}
                        if ((~x_local_2_73_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_73_U.i_write)) begin
                            if (~x_local_2_73_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_73_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_73_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_73_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_73_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_73_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_74_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_74_U.t_empty_n & swiglu_swiglu_inst.compute_X2_U0.ap_idle & ~swiglu_swiglu_inst.x_local_2_74_U.i_write} data_PIPO}
                        if ((~x_local_2_74_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_74_U.i_write)) begin
                            if (~x_local_2_74_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_74_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_74_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_74_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_74_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_74_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_75_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_75_U.t_empty_n & swiglu_swiglu_inst.compute_X2_U0.ap_idle & ~swiglu_swiglu_inst.x_local_2_75_U.i_write} data_PIPO}
                        if ((~x_local_2_75_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_75_U.i_write)) begin
                            if (~x_local_2_75_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_75_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_75_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_75_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_75_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_75_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_76_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_76_U.t_empty_n & swiglu_swiglu_inst.compute_X2_U0.ap_idle & ~swiglu_swiglu_inst.x_local_2_76_U.i_write} data_PIPO}
                        if ((~x_local_2_76_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_76_U.i_write)) begin
                            if (~x_local_2_76_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_76_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_76_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_76_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_76_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_76_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_77_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_77_U.t_empty_n & swiglu_swiglu_inst.compute_X2_U0.ap_idle & ~swiglu_swiglu_inst.x_local_2_77_U.i_write} data_PIPO}
                        if ((~x_local_2_77_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_77_U.i_write)) begin
                            if (~x_local_2_77_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_77_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_77_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_77_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_77_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_77_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_78_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_78_U.t_empty_n & swiglu_swiglu_inst.compute_X2_U0.ap_idle & ~swiglu_swiglu_inst.x_local_2_78_U.i_write} data_PIPO}
                        if ((~x_local_2_78_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_78_U.i_write)) begin
                            if (~x_local_2_78_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_78_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_78_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_78_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_78_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_78_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_79_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_79_U.t_empty_n & swiglu_swiglu_inst.compute_X2_U0.ap_idle & ~swiglu_swiglu_inst.x_local_2_79_U.i_write} data_PIPO}
                        if ((~x_local_2_79_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_79_U.i_write)) begin
                            if (~x_local_2_79_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_79_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_79_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_79_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_79_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_79_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_80_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_80_U.t_empty_n & swiglu_swiglu_inst.compute_X2_U0.ap_idle & ~swiglu_swiglu_inst.x_local_2_80_U.i_write} data_PIPO}
                        if ((~x_local_2_80_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_80_U.i_write)) begin
                            if (~x_local_2_80_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_80_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_80_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_80_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_80_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_80_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_81_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_81_U.t_empty_n & swiglu_swiglu_inst.compute_X2_U0.ap_idle & ~swiglu_swiglu_inst.x_local_2_81_U.i_write} data_PIPO}
                        if ((~x_local_2_81_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_81_U.i_write)) begin
                            if (~x_local_2_81_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_81_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_81_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_81_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_81_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_81_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_82_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_82_U.t_empty_n & swiglu_swiglu_inst.compute_X2_U0.ap_idle & ~swiglu_swiglu_inst.x_local_2_82_U.i_write} data_PIPO}
                        if ((~x_local_2_82_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_82_U.i_write)) begin
                            if (~x_local_2_82_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_82_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_82_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_82_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_82_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_82_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_83_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_83_U.t_empty_n & swiglu_swiglu_inst.compute_X2_U0.ap_idle & ~swiglu_swiglu_inst.x_local_2_83_U.i_write} data_PIPO}
                        if ((~x_local_2_83_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_83_U.i_write)) begin
                            if (~x_local_2_83_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_83_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_83_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_83_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_83_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_83_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_84_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_84_U.t_empty_n & swiglu_swiglu_inst.compute_X2_U0.ap_idle & ~swiglu_swiglu_inst.x_local_2_84_U.i_write} data_PIPO}
                        if ((~x_local_2_84_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_84_U.i_write)) begin
                            if (~x_local_2_84_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_84_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_84_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_84_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_84_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_84_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_85_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_85_U.t_empty_n & swiglu_swiglu_inst.compute_X2_U0.ap_idle & ~swiglu_swiglu_inst.x_local_2_85_U.i_write} data_PIPO}
                        if ((~x_local_2_85_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_85_U.i_write)) begin
                            if (~x_local_2_85_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_85_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_85_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_85_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_85_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_85_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_86_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_86_U.t_empty_n & swiglu_swiglu_inst.compute_X2_U0.ap_idle & ~swiglu_swiglu_inst.x_local_2_86_U.i_write} data_PIPO}
                        if ((~x_local_2_86_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_86_U.i_write)) begin
                            if (~x_local_2_86_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_86_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_86_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_86_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_86_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_86_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_87_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_87_U.t_empty_n & swiglu_swiglu_inst.compute_X2_U0.ap_idle & ~swiglu_swiglu_inst.x_local_2_87_U.i_write} data_PIPO}
                        if ((~x_local_2_87_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_87_U.i_write)) begin
                            if (~x_local_2_87_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_87_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_87_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_87_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_87_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_87_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_88_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_88_U.t_empty_n & swiglu_swiglu_inst.compute_X2_U0.ap_idle & ~swiglu_swiglu_inst.x_local_2_88_U.i_write} data_PIPO}
                        if ((~x_local_2_88_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_88_U.i_write)) begin
                            if (~x_local_2_88_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_88_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_88_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_88_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_88_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_88_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_89_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_89_U.t_empty_n & swiglu_swiglu_inst.compute_X2_U0.ap_idle & ~swiglu_swiglu_inst.x_local_2_89_U.i_write} data_PIPO}
                        if ((~x_local_2_89_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_89_U.i_write)) begin
                            if (~x_local_2_89_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_89_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_89_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_89_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_89_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_89_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_90_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_90_U.t_empty_n & swiglu_swiglu_inst.compute_X2_U0.ap_idle & ~swiglu_swiglu_inst.x_local_2_90_U.i_write} data_PIPO}
                        if ((~x_local_2_90_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_90_U.i_write)) begin
                            if (~x_local_2_90_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_90_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_90_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_90_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_90_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_90_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_91_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_91_U.t_empty_n & swiglu_swiglu_inst.compute_X2_U0.ap_idle & ~swiglu_swiglu_inst.x_local_2_91_U.i_write} data_PIPO}
                        if ((~x_local_2_91_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_91_U.i_write)) begin
                            if (~x_local_2_91_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_91_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_91_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_91_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_91_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_91_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_92_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_92_U.t_empty_n & swiglu_swiglu_inst.compute_X2_U0.ap_idle & ~swiglu_swiglu_inst.x_local_2_92_U.i_write} data_PIPO}
                        if ((~x_local_2_92_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_92_U.i_write)) begin
                            if (~x_local_2_92_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_92_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_92_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_92_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_92_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_92_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_93_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_93_U.t_empty_n & swiglu_swiglu_inst.compute_X2_U0.ap_idle & ~swiglu_swiglu_inst.x_local_2_93_U.i_write} data_PIPO}
                        if ((~x_local_2_93_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_93_U.i_write)) begin
                            if (~x_local_2_93_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_93_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_93_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_93_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_93_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_93_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_94_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_94_U.t_empty_n & swiglu_swiglu_inst.compute_X2_U0.ap_idle & ~swiglu_swiglu_inst.x_local_2_94_U.i_write} data_PIPO}
                        if ((~x_local_2_94_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_94_U.i_write)) begin
                            if (~x_local_2_94_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_94_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_94_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_94_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_94_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_94_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_95_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_95_U.t_empty_n & swiglu_swiglu_inst.compute_X2_U0.ap_idle & ~swiglu_swiglu_inst.x_local_2_95_U.i_write} data_PIPO}
                        if ((~x_local_2_95_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_95_U.i_write)) begin
                            if (~x_local_2_95_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_95_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_95_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_95_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_95_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_95_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_96_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_96_U.t_empty_n & swiglu_swiglu_inst.compute_X2_U0.ap_idle & ~swiglu_swiglu_inst.x_local_2_96_U.i_write} data_PIPO}
                        if ((~x_local_2_96_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_96_U.i_write)) begin
                            if (~x_local_2_96_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_96_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_96_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_96_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_96_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_96_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_97_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_97_U.t_empty_n & swiglu_swiglu_inst.compute_X2_U0.ap_idle & ~swiglu_swiglu_inst.x_local_2_97_U.i_write} data_PIPO}
                        if ((~x_local_2_97_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_97_U.i_write)) begin
                            if (~x_local_2_97_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_97_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_97_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_97_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_97_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_97_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_98_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_98_U.t_empty_n & swiglu_swiglu_inst.compute_X2_U0.ap_idle & ~swiglu_swiglu_inst.x_local_2_98_U.i_write} data_PIPO}
                        if ((~x_local_2_98_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_98_U.i_write)) begin
                            if (~x_local_2_98_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_98_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_98_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_98_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_98_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_98_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_99_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_99_U.t_empty_n & swiglu_swiglu_inst.compute_X2_U0.ap_idle & ~swiglu_swiglu_inst.x_local_2_99_U.i_write} data_PIPO}
                        if ((~x_local_2_99_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_99_U.i_write)) begin
                            if (~x_local_2_99_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_99_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_99_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_99_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_99_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_99_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_100_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_100_U.t_empty_n & swiglu_swiglu_inst.compute_X2_U0.ap_idle & ~swiglu_swiglu_inst.x_local_2_100_U.i_write} data_PIPO}
                        if ((~x_local_2_100_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_100_U.i_write)) begin
                            if (~x_local_2_100_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_100_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_100_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_100_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_100_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_100_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_101_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_101_U.t_empty_n & swiglu_swiglu_inst.compute_X2_U0.ap_idle & ~swiglu_swiglu_inst.x_local_2_101_U.i_write} data_PIPO}
                        if ((~x_local_2_101_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_101_U.i_write)) begin
                            if (~x_local_2_101_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_101_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_101_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_101_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_101_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_101_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_102_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_102_U.t_empty_n & swiglu_swiglu_inst.compute_X2_U0.ap_idle & ~swiglu_swiglu_inst.x_local_2_102_U.i_write} data_PIPO}
                        if ((~x_local_2_102_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_102_U.i_write)) begin
                            if (~x_local_2_102_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_102_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_102_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_102_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_102_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_102_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_103_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_103_U.t_empty_n & swiglu_swiglu_inst.compute_X2_U0.ap_idle & ~swiglu_swiglu_inst.x_local_2_103_U.i_write} data_PIPO}
                        if ((~x_local_2_103_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_103_U.i_write)) begin
                            if (~x_local_2_103_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_103_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_103_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_103_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_103_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_103_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_104_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_104_U.t_empty_n & swiglu_swiglu_inst.compute_X2_U0.ap_idle & ~swiglu_swiglu_inst.x_local_2_104_U.i_write} data_PIPO}
                        if ((~x_local_2_104_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_104_U.i_write)) begin
                            if (~x_local_2_104_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_104_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_104_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_104_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_104_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_104_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_105_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_105_U.t_empty_n & swiglu_swiglu_inst.compute_X2_U0.ap_idle & ~swiglu_swiglu_inst.x_local_2_105_U.i_write} data_PIPO}
                        if ((~x_local_2_105_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_105_U.i_write)) begin
                            if (~x_local_2_105_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_105_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_105_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_105_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_105_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_105_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_106_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_106_U.t_empty_n & swiglu_swiglu_inst.compute_X2_U0.ap_idle & ~swiglu_swiglu_inst.x_local_2_106_U.i_write} data_PIPO}
                        if ((~x_local_2_106_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_106_U.i_write)) begin
                            if (~x_local_2_106_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_106_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_106_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_106_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_106_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_106_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_107_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_107_U.t_empty_n & swiglu_swiglu_inst.compute_X2_U0.ap_idle & ~swiglu_swiglu_inst.x_local_2_107_U.i_write} data_PIPO}
                        if ((~x_local_2_107_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_107_U.i_write)) begin
                            if (~x_local_2_107_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_107_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_107_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_107_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_107_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_107_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_108_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_108_U.t_empty_n & swiglu_swiglu_inst.compute_X2_U0.ap_idle & ~swiglu_swiglu_inst.x_local_2_108_U.i_write} data_PIPO}
                        if ((~x_local_2_108_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_108_U.i_write)) begin
                            if (~x_local_2_108_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_108_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_108_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_108_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_108_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_108_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_109_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_109_U.t_empty_n & swiglu_swiglu_inst.compute_X2_U0.ap_idle & ~swiglu_swiglu_inst.x_local_2_109_U.i_write} data_PIPO}
                        if ((~x_local_2_109_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_109_U.i_write)) begin
                            if (~x_local_2_109_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_109_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_109_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_109_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_109_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_109_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_110_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_110_U.t_empty_n & swiglu_swiglu_inst.compute_X2_U0.ap_idle & ~swiglu_swiglu_inst.x_local_2_110_U.i_write} data_PIPO}
                        if ((~x_local_2_110_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_110_U.i_write)) begin
                            if (~x_local_2_110_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_110_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_110_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_110_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_110_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_110_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_111_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_111_U.t_empty_n & swiglu_swiglu_inst.compute_X2_U0.ap_idle & ~swiglu_swiglu_inst.x_local_2_111_U.i_write} data_PIPO}
                        if ((~x_local_2_111_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_111_U.i_write)) begin
                            if (~x_local_2_111_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_111_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_111_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_111_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_111_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_111_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_112_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_112_U.t_empty_n & swiglu_swiglu_inst.compute_X2_U0.ap_idle & ~swiglu_swiglu_inst.x_local_2_112_U.i_write} data_PIPO}
                        if ((~x_local_2_112_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_112_U.i_write)) begin
                            if (~x_local_2_112_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_112_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_112_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_112_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_112_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_112_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_113_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_113_U.t_empty_n & swiglu_swiglu_inst.compute_X2_U0.ap_idle & ~swiglu_swiglu_inst.x_local_2_113_U.i_write} data_PIPO}
                        if ((~x_local_2_113_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_113_U.i_write)) begin
                            if (~x_local_2_113_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_113_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_113_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_113_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_113_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_113_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_114_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_114_U.t_empty_n & swiglu_swiglu_inst.compute_X2_U0.ap_idle & ~swiglu_swiglu_inst.x_local_2_114_U.i_write} data_PIPO}
                        if ((~x_local_2_114_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_114_U.i_write)) begin
                            if (~x_local_2_114_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_114_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_114_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_114_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_114_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_114_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_115_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_115_U.t_empty_n & swiglu_swiglu_inst.compute_X2_U0.ap_idle & ~swiglu_swiglu_inst.x_local_2_115_U.i_write} data_PIPO}
                        if ((~x_local_2_115_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_115_U.i_write)) begin
                            if (~x_local_2_115_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_115_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_115_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_115_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_115_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_115_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_116_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_116_U.t_empty_n & swiglu_swiglu_inst.compute_X2_U0.ap_idle & ~swiglu_swiglu_inst.x_local_2_116_U.i_write} data_PIPO}
                        if ((~x_local_2_116_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_116_U.i_write)) begin
                            if (~x_local_2_116_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_116_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_116_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_116_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_116_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_116_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_117_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_117_U.t_empty_n & swiglu_swiglu_inst.compute_X2_U0.ap_idle & ~swiglu_swiglu_inst.x_local_2_117_U.i_write} data_PIPO}
                        if ((~x_local_2_117_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_117_U.i_write)) begin
                            if (~x_local_2_117_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_117_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_117_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_117_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_117_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_117_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_118_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_118_U.t_empty_n & swiglu_swiglu_inst.compute_X2_U0.ap_idle & ~swiglu_swiglu_inst.x_local_2_118_U.i_write} data_PIPO}
                        if ((~x_local_2_118_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_118_U.i_write)) begin
                            if (~x_local_2_118_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_118_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_118_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_118_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_118_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_118_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_119_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_119_U.t_empty_n & swiglu_swiglu_inst.compute_X2_U0.ap_idle & ~swiglu_swiglu_inst.x_local_2_119_U.i_write} data_PIPO}
                        if ((~x_local_2_119_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_119_U.i_write)) begin
                            if (~x_local_2_119_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_119_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_119_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_119_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_119_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_119_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_120_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_120_U.t_empty_n & swiglu_swiglu_inst.compute_X2_U0.ap_idle & ~swiglu_swiglu_inst.x_local_2_120_U.i_write} data_PIPO}
                        if ((~x_local_2_120_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_120_U.i_write)) begin
                            if (~x_local_2_120_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_120_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_120_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_120_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_120_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_120_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_121_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_121_U.t_empty_n & swiglu_swiglu_inst.compute_X2_U0.ap_idle & ~swiglu_swiglu_inst.x_local_2_121_U.i_write} data_PIPO}
                        if ((~x_local_2_121_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_121_U.i_write)) begin
                            if (~x_local_2_121_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_121_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_121_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_121_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_121_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_121_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_122_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_122_U.t_empty_n & swiglu_swiglu_inst.compute_X2_U0.ap_idle & ~swiglu_swiglu_inst.x_local_2_122_U.i_write} data_PIPO}
                        if ((~x_local_2_122_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_122_U.i_write)) begin
                            if (~x_local_2_122_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_122_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_122_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_122_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_122_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_122_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_123_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_123_U.t_empty_n & swiglu_swiglu_inst.compute_X2_U0.ap_idle & ~swiglu_swiglu_inst.x_local_2_123_U.i_write} data_PIPO}
                        if ((~x_local_2_123_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_123_U.i_write)) begin
                            if (~x_local_2_123_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_123_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_123_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_123_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_123_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_123_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_124_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_124_U.t_empty_n & swiglu_swiglu_inst.compute_X2_U0.ap_idle & ~swiglu_swiglu_inst.x_local_2_124_U.i_write} data_PIPO}
                        if ((~x_local_2_124_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_124_U.i_write)) begin
                            if (~x_local_2_124_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_124_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_124_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_124_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_124_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_124_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_125_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_125_U.t_empty_n & swiglu_swiglu_inst.compute_X2_U0.ap_idle & ~swiglu_swiglu_inst.x_local_2_125_U.i_write} data_PIPO}
                        if ((~x_local_2_125_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_125_U.i_write)) begin
                            if (~x_local_2_125_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_125_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_125_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_125_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_125_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_125_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_126_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_126_U.t_empty_n & swiglu_swiglu_inst.compute_X2_U0.ap_idle & ~swiglu_swiglu_inst.x_local_2_126_U.i_write} data_PIPO}
                        if ((~x_local_2_126_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_126_U.i_write)) begin
                            if (~x_local_2_126_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_126_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_126_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_126_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_126_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_126_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.x_local_2_127_U' info is :
// blk sig is {{~swiglu_swiglu_inst.x_local_2_127_U.t_empty_n & swiglu_swiglu_inst.compute_X2_U0.ap_idle & ~swiglu_swiglu_inst.x_local_2_127_U.i_write} data_PIPO}
                        if ((~x_local_2_127_U.t_empty_n & compute_X2_U0.ap_idle & ~x_local_2_127_U.i_write)) begin
                            if (~x_local_2_127_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.x_local_2_127_U' written by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_127_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~x_local_2_127_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.x_local_2_127_U' read by process 'swiglu_swiglu.load_x_local_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.x_local_2_127_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
                    end
                    4: begin //  for dep proc 'swiglu_swiglu.compute_gate_U0'
// for dep channel 'swiglu_swiglu.X2_cache_U' info is :
// blk sig is {~swiglu_swiglu_inst.compute_X2_U0.X2_cache_blk_n data_FIFO}
                        if ((~compute_X2_U0.X2_cache_blk_n)) begin
                            if (~X2_cache_U.if_empty_n) begin
                                $display("//      Blocked by empty input FIFO 'swiglu_swiglu.X2_cache_U' written by process 'swiglu_swiglu.compute_gate_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.X2_cache_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~X2_cache_U.if_full_n) begin
                                $display("//      Blocked by full output FIFO 'swiglu_swiglu.X2_cache_U' read by process 'swiglu_swiglu.compute_gate_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.X2_cache_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
                    end
                    endcase
                end
                4 : begin // for proc 'swiglu_swiglu.compute_gate_U0'
                    case(index2)
                    2: begin //  for dep proc 'swiglu_swiglu.compute_X1_U0'
// for dep channel 'swiglu_swiglu.X1_cache_U' info is :
// blk sig is {~swiglu_swiglu_inst.compute_gate_U0.grp_compute_gate_Pipeline_GATE_PASS1_fu_150.X1_cache_blk_n data_FIFO}
                        if ((~compute_gate_U0.grp_compute_gate_Pipeline_GATE_PASS1_fu_150.X1_cache_blk_n)) begin
                            if (~X1_cache_U.if_empty_n) begin
                                $display("//      Blocked by empty input FIFO 'swiglu_swiglu.X1_cache_U' written by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.X1_cache_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~X1_cache_U.if_full_n) begin
                                $display("//      Blocked by full output FIFO 'swiglu_swiglu.X1_cache_U' read by process 'swiglu_swiglu.compute_X1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.X1_cache_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.start_for_compute_gate_U0_U' info is :
// blk sig is {{~swiglu_swiglu_inst.start_for_compute_gate_U0_U.if_empty_n & swiglu_swiglu_inst.compute_gate_U0.ap_idle & ~swiglu_swiglu_inst.start_for_compute_gate_U0_U.if_write} start_FIFO}
                        if ((~start_for_compute_gate_U0_U.if_empty_n & compute_gate_U0.ap_idle & ~start_for_compute_gate_U0_U.if_write)) begin
                            $display("//      Blocked by missing 'ap_start' from start propagation FIFO 'swiglu_swiglu.start_for_compute_gate_U0_U' written by process 'swiglu_swiglu.compute_X1_U0',");
                        end
                    end
                    3: begin //  for dep proc 'swiglu_swiglu.compute_X2_U0'
// for dep channel 'swiglu_swiglu.X2_cache_U' info is :
// blk sig is {~swiglu_swiglu_inst.compute_gate_U0.grp_compute_gate_Pipeline_GATE_PASS1_fu_150.X2_cache_blk_n data_FIFO}
                        if ((~compute_gate_U0.grp_compute_gate_Pipeline_GATE_PASS1_fu_150.X2_cache_blk_n)) begin
                            if (~X2_cache_U.if_empty_n) begin
                                $display("//      Blocked by empty input FIFO 'swiglu_swiglu.X2_cache_U' written by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.X2_cache_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~X2_cache_U.if_full_n) begin
                                $display("//      Blocked by full output FIFO 'swiglu_swiglu.X2_cache_U' read by process 'swiglu_swiglu.compute_X2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.X2_cache_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
                    end
                    5: begin //  for dep proc 'swiglu_swiglu.compute_output_U0'
// for dep channel 'swiglu_swiglu.gate_cache_U' info is :
// blk sig is {{~swiglu_swiglu_inst.gate_cache_U.i_full_n & swiglu_swiglu_inst.compute_gate_U0.ap_done & ap_done_reg_3 & ~swiglu_swiglu_inst.gate_cache_U.t_read} data_PIPO}
                        if ((~gate_cache_U.i_full_n & compute_gate_U0.ap_done & ap_done_reg_3 & ~gate_cache_U.t_read)) begin
                            if (~gate_cache_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.gate_cache_U' written by process 'swiglu_swiglu.compute_output_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.gate_cache_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~gate_cache_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.gate_cache_U' read by process 'swiglu_swiglu.compute_output_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.gate_cache_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.gate_cache_1_U' info is :
// blk sig is {{~swiglu_swiglu_inst.gate_cache_1_U.i_full_n & swiglu_swiglu_inst.compute_gate_U0.ap_done & ap_done_reg_3 & ~swiglu_swiglu_inst.gate_cache_1_U.t_read} data_PIPO}
                        if ((~gate_cache_1_U.i_full_n & compute_gate_U0.ap_done & ap_done_reg_3 & ~gate_cache_1_U.t_read)) begin
                            if (~gate_cache_1_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.gate_cache_1_U' written by process 'swiglu_swiglu.compute_output_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.gate_cache_1_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~gate_cache_1_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.gate_cache_1_U' read by process 'swiglu_swiglu.compute_output_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.gate_cache_1_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.gate_cache_2_U' info is :
// blk sig is {{~swiglu_swiglu_inst.gate_cache_2_U.i_full_n & swiglu_swiglu_inst.compute_gate_U0.ap_done & ap_done_reg_3 & ~swiglu_swiglu_inst.gate_cache_2_U.t_read} data_PIPO}
                        if ((~gate_cache_2_U.i_full_n & compute_gate_U0.ap_done & ap_done_reg_3 & ~gate_cache_2_U.t_read)) begin
                            if (~gate_cache_2_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.gate_cache_2_U' written by process 'swiglu_swiglu.compute_output_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.gate_cache_2_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~gate_cache_2_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.gate_cache_2_U' read by process 'swiglu_swiglu.compute_output_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.gate_cache_2_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.gate_cache_3_U' info is :
// blk sig is {{~swiglu_swiglu_inst.gate_cache_3_U.i_full_n & swiglu_swiglu_inst.compute_gate_U0.ap_done & ap_done_reg_3 & ~swiglu_swiglu_inst.gate_cache_3_U.t_read} data_PIPO}
                        if ((~gate_cache_3_U.i_full_n & compute_gate_U0.ap_done & ap_done_reg_3 & ~gate_cache_3_U.t_read)) begin
                            if (~gate_cache_3_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.gate_cache_3_U' written by process 'swiglu_swiglu.compute_output_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.gate_cache_3_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~gate_cache_3_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.gate_cache_3_U' read by process 'swiglu_swiglu.compute_output_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.gate_cache_3_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.gate_cache_4_U' info is :
// blk sig is {{~swiglu_swiglu_inst.gate_cache_4_U.i_full_n & swiglu_swiglu_inst.compute_gate_U0.ap_done & ap_done_reg_3 & ~swiglu_swiglu_inst.gate_cache_4_U.t_read} data_PIPO}
                        if ((~gate_cache_4_U.i_full_n & compute_gate_U0.ap_done & ap_done_reg_3 & ~gate_cache_4_U.t_read)) begin
                            if (~gate_cache_4_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.gate_cache_4_U' written by process 'swiglu_swiglu.compute_output_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.gate_cache_4_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~gate_cache_4_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.gate_cache_4_U' read by process 'swiglu_swiglu.compute_output_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.gate_cache_4_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.gate_cache_5_U' info is :
// blk sig is {{~swiglu_swiglu_inst.gate_cache_5_U.i_full_n & swiglu_swiglu_inst.compute_gate_U0.ap_done & ap_done_reg_3 & ~swiglu_swiglu_inst.gate_cache_5_U.t_read} data_PIPO}
                        if ((~gate_cache_5_U.i_full_n & compute_gate_U0.ap_done & ap_done_reg_3 & ~gate_cache_5_U.t_read)) begin
                            if (~gate_cache_5_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.gate_cache_5_U' written by process 'swiglu_swiglu.compute_output_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.gate_cache_5_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~gate_cache_5_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.gate_cache_5_U' read by process 'swiglu_swiglu.compute_output_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.gate_cache_5_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.gate_cache_6_U' info is :
// blk sig is {{~swiglu_swiglu_inst.gate_cache_6_U.i_full_n & swiglu_swiglu_inst.compute_gate_U0.ap_done & ap_done_reg_3 & ~swiglu_swiglu_inst.gate_cache_6_U.t_read} data_PIPO}
                        if ((~gate_cache_6_U.i_full_n & compute_gate_U0.ap_done & ap_done_reg_3 & ~gate_cache_6_U.t_read)) begin
                            if (~gate_cache_6_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.gate_cache_6_U' written by process 'swiglu_swiglu.compute_output_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.gate_cache_6_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~gate_cache_6_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.gate_cache_6_U' read by process 'swiglu_swiglu.compute_output_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.gate_cache_6_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.gate_cache_7_U' info is :
// blk sig is {{~swiglu_swiglu_inst.gate_cache_7_U.i_full_n & swiglu_swiglu_inst.compute_gate_U0.ap_done & ap_done_reg_3 & ~swiglu_swiglu_inst.gate_cache_7_U.t_read} data_PIPO}
                        if ((~gate_cache_7_U.i_full_n & compute_gate_U0.ap_done & ap_done_reg_3 & ~gate_cache_7_U.t_read)) begin
                            if (~gate_cache_7_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.gate_cache_7_U' written by process 'swiglu_swiglu.compute_output_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.gate_cache_7_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~gate_cache_7_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.gate_cache_7_U' read by process 'swiglu_swiglu.compute_output_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.gate_cache_7_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.gate_cache_8_U' info is :
// blk sig is {{~swiglu_swiglu_inst.gate_cache_8_U.i_full_n & swiglu_swiglu_inst.compute_gate_U0.ap_done & ap_done_reg_3 & ~swiglu_swiglu_inst.gate_cache_8_U.t_read} data_PIPO}
                        if ((~gate_cache_8_U.i_full_n & compute_gate_U0.ap_done & ap_done_reg_3 & ~gate_cache_8_U.t_read)) begin
                            if (~gate_cache_8_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.gate_cache_8_U' written by process 'swiglu_swiglu.compute_output_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.gate_cache_8_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~gate_cache_8_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.gate_cache_8_U' read by process 'swiglu_swiglu.compute_output_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.gate_cache_8_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.gate_cache_9_U' info is :
// blk sig is {{~swiglu_swiglu_inst.gate_cache_9_U.i_full_n & swiglu_swiglu_inst.compute_gate_U0.ap_done & ap_done_reg_3 & ~swiglu_swiglu_inst.gate_cache_9_U.t_read} data_PIPO}
                        if ((~gate_cache_9_U.i_full_n & compute_gate_U0.ap_done & ap_done_reg_3 & ~gate_cache_9_U.t_read)) begin
                            if (~gate_cache_9_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.gate_cache_9_U' written by process 'swiglu_swiglu.compute_output_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.gate_cache_9_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~gate_cache_9_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.gate_cache_9_U' read by process 'swiglu_swiglu.compute_output_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.gate_cache_9_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.gate_cache_10_U' info is :
// blk sig is {{~swiglu_swiglu_inst.gate_cache_10_U.i_full_n & swiglu_swiglu_inst.compute_gate_U0.ap_done & ap_done_reg_3 & ~swiglu_swiglu_inst.gate_cache_10_U.t_read} data_PIPO}
                        if ((~gate_cache_10_U.i_full_n & compute_gate_U0.ap_done & ap_done_reg_3 & ~gate_cache_10_U.t_read)) begin
                            if (~gate_cache_10_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.gate_cache_10_U' written by process 'swiglu_swiglu.compute_output_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.gate_cache_10_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~gate_cache_10_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.gate_cache_10_U' read by process 'swiglu_swiglu.compute_output_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.gate_cache_10_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.gate_cache_11_U' info is :
// blk sig is {{~swiglu_swiglu_inst.gate_cache_11_U.i_full_n & swiglu_swiglu_inst.compute_gate_U0.ap_done & ap_done_reg_3 & ~swiglu_swiglu_inst.gate_cache_11_U.t_read} data_PIPO}
                        if ((~gate_cache_11_U.i_full_n & compute_gate_U0.ap_done & ap_done_reg_3 & ~gate_cache_11_U.t_read)) begin
                            if (~gate_cache_11_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.gate_cache_11_U' written by process 'swiglu_swiglu.compute_output_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.gate_cache_11_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~gate_cache_11_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.gate_cache_11_U' read by process 'swiglu_swiglu.compute_output_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.gate_cache_11_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.gate_cache_12_U' info is :
// blk sig is {{~swiglu_swiglu_inst.gate_cache_12_U.i_full_n & swiglu_swiglu_inst.compute_gate_U0.ap_done & ap_done_reg_3 & ~swiglu_swiglu_inst.gate_cache_12_U.t_read} data_PIPO}
                        if ((~gate_cache_12_U.i_full_n & compute_gate_U0.ap_done & ap_done_reg_3 & ~gate_cache_12_U.t_read)) begin
                            if (~gate_cache_12_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.gate_cache_12_U' written by process 'swiglu_swiglu.compute_output_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.gate_cache_12_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~gate_cache_12_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.gate_cache_12_U' read by process 'swiglu_swiglu.compute_output_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.gate_cache_12_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.gate_cache_13_U' info is :
// blk sig is {{~swiglu_swiglu_inst.gate_cache_13_U.i_full_n & swiglu_swiglu_inst.compute_gate_U0.ap_done & ap_done_reg_3 & ~swiglu_swiglu_inst.gate_cache_13_U.t_read} data_PIPO}
                        if ((~gate_cache_13_U.i_full_n & compute_gate_U0.ap_done & ap_done_reg_3 & ~gate_cache_13_U.t_read)) begin
                            if (~gate_cache_13_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.gate_cache_13_U' written by process 'swiglu_swiglu.compute_output_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.gate_cache_13_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~gate_cache_13_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.gate_cache_13_U' read by process 'swiglu_swiglu.compute_output_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.gate_cache_13_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.gate_cache_14_U' info is :
// blk sig is {{~swiglu_swiglu_inst.gate_cache_14_U.i_full_n & swiglu_swiglu_inst.compute_gate_U0.ap_done & ap_done_reg_3 & ~swiglu_swiglu_inst.gate_cache_14_U.t_read} data_PIPO}
                        if ((~gate_cache_14_U.i_full_n & compute_gate_U0.ap_done & ap_done_reg_3 & ~gate_cache_14_U.t_read)) begin
                            if (~gate_cache_14_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.gate_cache_14_U' written by process 'swiglu_swiglu.compute_output_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.gate_cache_14_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~gate_cache_14_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.gate_cache_14_U' read by process 'swiglu_swiglu.compute_output_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.gate_cache_14_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.gate_cache_15_U' info is :
// blk sig is {{~swiglu_swiglu_inst.gate_cache_15_U.i_full_n & swiglu_swiglu_inst.compute_gate_U0.ap_done & ap_done_reg_3 & ~swiglu_swiglu_inst.gate_cache_15_U.t_read} data_PIPO}
                        if ((~gate_cache_15_U.i_full_n & compute_gate_U0.ap_done & ap_done_reg_3 & ~gate_cache_15_U.t_read)) begin
                            if (~gate_cache_15_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.gate_cache_15_U' written by process 'swiglu_swiglu.compute_output_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.gate_cache_15_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~gate_cache_15_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.gate_cache_15_U' read by process 'swiglu_swiglu.compute_output_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.gate_cache_15_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.gate_cache_16_U' info is :
// blk sig is {{~swiglu_swiglu_inst.gate_cache_16_U.i_full_n & swiglu_swiglu_inst.compute_gate_U0.ap_done & ap_done_reg_3 & ~swiglu_swiglu_inst.gate_cache_16_U.t_read} data_PIPO}
                        if ((~gate_cache_16_U.i_full_n & compute_gate_U0.ap_done & ap_done_reg_3 & ~gate_cache_16_U.t_read)) begin
                            if (~gate_cache_16_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.gate_cache_16_U' written by process 'swiglu_swiglu.compute_output_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.gate_cache_16_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~gate_cache_16_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.gate_cache_16_U' read by process 'swiglu_swiglu.compute_output_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.gate_cache_16_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.gate_cache_17_U' info is :
// blk sig is {{~swiglu_swiglu_inst.gate_cache_17_U.i_full_n & swiglu_swiglu_inst.compute_gate_U0.ap_done & ap_done_reg_3 & ~swiglu_swiglu_inst.gate_cache_17_U.t_read} data_PIPO}
                        if ((~gate_cache_17_U.i_full_n & compute_gate_U0.ap_done & ap_done_reg_3 & ~gate_cache_17_U.t_read)) begin
                            if (~gate_cache_17_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.gate_cache_17_U' written by process 'swiglu_swiglu.compute_output_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.gate_cache_17_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~gate_cache_17_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.gate_cache_17_U' read by process 'swiglu_swiglu.compute_output_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.gate_cache_17_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.gate_cache_18_U' info is :
// blk sig is {{~swiglu_swiglu_inst.gate_cache_18_U.i_full_n & swiglu_swiglu_inst.compute_gate_U0.ap_done & ap_done_reg_3 & ~swiglu_swiglu_inst.gate_cache_18_U.t_read} data_PIPO}
                        if ((~gate_cache_18_U.i_full_n & compute_gate_U0.ap_done & ap_done_reg_3 & ~gate_cache_18_U.t_read)) begin
                            if (~gate_cache_18_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.gate_cache_18_U' written by process 'swiglu_swiglu.compute_output_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.gate_cache_18_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~gate_cache_18_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.gate_cache_18_U' read by process 'swiglu_swiglu.compute_output_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.gate_cache_18_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.gate_cache_19_U' info is :
// blk sig is {{~swiglu_swiglu_inst.gate_cache_19_U.i_full_n & swiglu_swiglu_inst.compute_gate_U0.ap_done & ap_done_reg_3 & ~swiglu_swiglu_inst.gate_cache_19_U.t_read} data_PIPO}
                        if ((~gate_cache_19_U.i_full_n & compute_gate_U0.ap_done & ap_done_reg_3 & ~gate_cache_19_U.t_read)) begin
                            if (~gate_cache_19_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.gate_cache_19_U' written by process 'swiglu_swiglu.compute_output_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.gate_cache_19_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~gate_cache_19_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.gate_cache_19_U' read by process 'swiglu_swiglu.compute_output_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.gate_cache_19_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.gate_cache_20_U' info is :
// blk sig is {{~swiglu_swiglu_inst.gate_cache_20_U.i_full_n & swiglu_swiglu_inst.compute_gate_U0.ap_done & ap_done_reg_3 & ~swiglu_swiglu_inst.gate_cache_20_U.t_read} data_PIPO}
                        if ((~gate_cache_20_U.i_full_n & compute_gate_U0.ap_done & ap_done_reg_3 & ~gate_cache_20_U.t_read)) begin
                            if (~gate_cache_20_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.gate_cache_20_U' written by process 'swiglu_swiglu.compute_output_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.gate_cache_20_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~gate_cache_20_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.gate_cache_20_U' read by process 'swiglu_swiglu.compute_output_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.gate_cache_20_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.gate_cache_21_U' info is :
// blk sig is {{~swiglu_swiglu_inst.gate_cache_21_U.i_full_n & swiglu_swiglu_inst.compute_gate_U0.ap_done & ap_done_reg_3 & ~swiglu_swiglu_inst.gate_cache_21_U.t_read} data_PIPO}
                        if ((~gate_cache_21_U.i_full_n & compute_gate_U0.ap_done & ap_done_reg_3 & ~gate_cache_21_U.t_read)) begin
                            if (~gate_cache_21_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.gate_cache_21_U' written by process 'swiglu_swiglu.compute_output_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.gate_cache_21_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~gate_cache_21_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.gate_cache_21_U' read by process 'swiglu_swiglu.compute_output_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.gate_cache_21_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.gate_cache_22_U' info is :
// blk sig is {{~swiglu_swiglu_inst.gate_cache_22_U.i_full_n & swiglu_swiglu_inst.compute_gate_U0.ap_done & ap_done_reg_3 & ~swiglu_swiglu_inst.gate_cache_22_U.t_read} data_PIPO}
                        if ((~gate_cache_22_U.i_full_n & compute_gate_U0.ap_done & ap_done_reg_3 & ~gate_cache_22_U.t_read)) begin
                            if (~gate_cache_22_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.gate_cache_22_U' written by process 'swiglu_swiglu.compute_output_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.gate_cache_22_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~gate_cache_22_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.gate_cache_22_U' read by process 'swiglu_swiglu.compute_output_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.gate_cache_22_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.gate_cache_23_U' info is :
// blk sig is {{~swiglu_swiglu_inst.gate_cache_23_U.i_full_n & swiglu_swiglu_inst.compute_gate_U0.ap_done & ap_done_reg_3 & ~swiglu_swiglu_inst.gate_cache_23_U.t_read} data_PIPO}
                        if ((~gate_cache_23_U.i_full_n & compute_gate_U0.ap_done & ap_done_reg_3 & ~gate_cache_23_U.t_read)) begin
                            if (~gate_cache_23_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.gate_cache_23_U' written by process 'swiglu_swiglu.compute_output_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.gate_cache_23_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~gate_cache_23_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.gate_cache_23_U' read by process 'swiglu_swiglu.compute_output_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.gate_cache_23_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.gate_cache_24_U' info is :
// blk sig is {{~swiglu_swiglu_inst.gate_cache_24_U.i_full_n & swiglu_swiglu_inst.compute_gate_U0.ap_done & ap_done_reg_3 & ~swiglu_swiglu_inst.gate_cache_24_U.t_read} data_PIPO}
                        if ((~gate_cache_24_U.i_full_n & compute_gate_U0.ap_done & ap_done_reg_3 & ~gate_cache_24_U.t_read)) begin
                            if (~gate_cache_24_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.gate_cache_24_U' written by process 'swiglu_swiglu.compute_output_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.gate_cache_24_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~gate_cache_24_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.gate_cache_24_U' read by process 'swiglu_swiglu.compute_output_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.gate_cache_24_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.gate_cache_25_U' info is :
// blk sig is {{~swiglu_swiglu_inst.gate_cache_25_U.i_full_n & swiglu_swiglu_inst.compute_gate_U0.ap_done & ap_done_reg_3 & ~swiglu_swiglu_inst.gate_cache_25_U.t_read} data_PIPO}
                        if ((~gate_cache_25_U.i_full_n & compute_gate_U0.ap_done & ap_done_reg_3 & ~gate_cache_25_U.t_read)) begin
                            if (~gate_cache_25_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.gate_cache_25_U' written by process 'swiglu_swiglu.compute_output_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.gate_cache_25_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~gate_cache_25_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.gate_cache_25_U' read by process 'swiglu_swiglu.compute_output_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.gate_cache_25_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.gate_cache_26_U' info is :
// blk sig is {{~swiglu_swiglu_inst.gate_cache_26_U.i_full_n & swiglu_swiglu_inst.compute_gate_U0.ap_done & ap_done_reg_3 & ~swiglu_swiglu_inst.gate_cache_26_U.t_read} data_PIPO}
                        if ((~gate_cache_26_U.i_full_n & compute_gate_U0.ap_done & ap_done_reg_3 & ~gate_cache_26_U.t_read)) begin
                            if (~gate_cache_26_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.gate_cache_26_U' written by process 'swiglu_swiglu.compute_output_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.gate_cache_26_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~gate_cache_26_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.gate_cache_26_U' read by process 'swiglu_swiglu.compute_output_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.gate_cache_26_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.gate_cache_27_U' info is :
// blk sig is {{~swiglu_swiglu_inst.gate_cache_27_U.i_full_n & swiglu_swiglu_inst.compute_gate_U0.ap_done & ap_done_reg_3 & ~swiglu_swiglu_inst.gate_cache_27_U.t_read} data_PIPO}
                        if ((~gate_cache_27_U.i_full_n & compute_gate_U0.ap_done & ap_done_reg_3 & ~gate_cache_27_U.t_read)) begin
                            if (~gate_cache_27_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.gate_cache_27_U' written by process 'swiglu_swiglu.compute_output_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.gate_cache_27_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~gate_cache_27_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.gate_cache_27_U' read by process 'swiglu_swiglu.compute_output_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.gate_cache_27_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.gate_cache_28_U' info is :
// blk sig is {{~swiglu_swiglu_inst.gate_cache_28_U.i_full_n & swiglu_swiglu_inst.compute_gate_U0.ap_done & ap_done_reg_3 & ~swiglu_swiglu_inst.gate_cache_28_U.t_read} data_PIPO}
                        if ((~gate_cache_28_U.i_full_n & compute_gate_U0.ap_done & ap_done_reg_3 & ~gate_cache_28_U.t_read)) begin
                            if (~gate_cache_28_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.gate_cache_28_U' written by process 'swiglu_swiglu.compute_output_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.gate_cache_28_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~gate_cache_28_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.gate_cache_28_U' read by process 'swiglu_swiglu.compute_output_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.gate_cache_28_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.gate_cache_29_U' info is :
// blk sig is {{~swiglu_swiglu_inst.gate_cache_29_U.i_full_n & swiglu_swiglu_inst.compute_gate_U0.ap_done & ap_done_reg_3 & ~swiglu_swiglu_inst.gate_cache_29_U.t_read} data_PIPO}
                        if ((~gate_cache_29_U.i_full_n & compute_gate_U0.ap_done & ap_done_reg_3 & ~gate_cache_29_U.t_read)) begin
                            if (~gate_cache_29_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.gate_cache_29_U' written by process 'swiglu_swiglu.compute_output_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.gate_cache_29_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~gate_cache_29_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.gate_cache_29_U' read by process 'swiglu_swiglu.compute_output_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.gate_cache_29_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.gate_cache_30_U' info is :
// blk sig is {{~swiglu_swiglu_inst.gate_cache_30_U.i_full_n & swiglu_swiglu_inst.compute_gate_U0.ap_done & ap_done_reg_3 & ~swiglu_swiglu_inst.gate_cache_30_U.t_read} data_PIPO}
                        if ((~gate_cache_30_U.i_full_n & compute_gate_U0.ap_done & ap_done_reg_3 & ~gate_cache_30_U.t_read)) begin
                            if (~gate_cache_30_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.gate_cache_30_U' written by process 'swiglu_swiglu.compute_output_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.gate_cache_30_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~gate_cache_30_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.gate_cache_30_U' read by process 'swiglu_swiglu.compute_output_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.gate_cache_30_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.gate_cache_31_U' info is :
// blk sig is {{~swiglu_swiglu_inst.gate_cache_31_U.i_full_n & swiglu_swiglu_inst.compute_gate_U0.ap_done & ap_done_reg_3 & ~swiglu_swiglu_inst.gate_cache_31_U.t_read} data_PIPO}
                        if ((~gate_cache_31_U.i_full_n & compute_gate_U0.ap_done & ap_done_reg_3 & ~gate_cache_31_U.t_read)) begin
                            if (~gate_cache_31_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.gate_cache_31_U' written by process 'swiglu_swiglu.compute_output_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.gate_cache_31_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~gate_cache_31_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.gate_cache_31_U' read by process 'swiglu_swiglu.compute_output_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.gate_cache_31_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
                    end
                    endcase
                end
                5 : begin // for proc 'swiglu_swiglu.compute_output_U0'
                    case(index2)
                    4: begin //  for dep proc 'swiglu_swiglu.compute_gate_U0'
// for dep channel 'swiglu_swiglu.gate_scale_U' info is :
// blk sig is {{~swiglu_swiglu_inst.gate_scale_U.if_empty_n & swiglu_swiglu_inst.compute_output_U0.ap_idle & ~swiglu_swiglu_inst.gate_scale_U.if_write} TLF_FIFO}
                        if ((~gate_scale_U.if_empty_n & compute_output_U0.ap_idle & ~gate_scale_U.if_write)) begin
                            if (~gate_scale_U.if_empty_n) begin
                                $display("//      Blocked by empty input FIFO 'swiglu_swiglu.gate_scale_U' written by process 'swiglu_swiglu.compute_gate_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.gate_scale_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~gate_scale_U.if_full_n) begin
                                $display("//      Blocked by full output FIFO 'swiglu_swiglu.gate_scale_U' read by process 'swiglu_swiglu.compute_gate_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.gate_scale_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.gate_cache_U' info is :
// blk sig is {{~swiglu_swiglu_inst.gate_cache_U.t_empty_n & swiglu_swiglu_inst.compute_output_U0.ap_idle & ~swiglu_swiglu_inst.gate_cache_U.i_write} data_PIPO}
                        if ((~gate_cache_U.t_empty_n & compute_output_U0.ap_idle & ~gate_cache_U.i_write)) begin
                            if (~gate_cache_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.gate_cache_U' written by process 'swiglu_swiglu.compute_gate_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.gate_cache_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~gate_cache_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.gate_cache_U' read by process 'swiglu_swiglu.compute_gate_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.gate_cache_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.gate_cache_1_U' info is :
// blk sig is {{~swiglu_swiglu_inst.gate_cache_1_U.t_empty_n & swiglu_swiglu_inst.compute_output_U0.ap_idle & ~swiglu_swiglu_inst.gate_cache_1_U.i_write} data_PIPO}
                        if ((~gate_cache_1_U.t_empty_n & compute_output_U0.ap_idle & ~gate_cache_1_U.i_write)) begin
                            if (~gate_cache_1_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.gate_cache_1_U' written by process 'swiglu_swiglu.compute_gate_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.gate_cache_1_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~gate_cache_1_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.gate_cache_1_U' read by process 'swiglu_swiglu.compute_gate_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.gate_cache_1_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.gate_cache_2_U' info is :
// blk sig is {{~swiglu_swiglu_inst.gate_cache_2_U.t_empty_n & swiglu_swiglu_inst.compute_output_U0.ap_idle & ~swiglu_swiglu_inst.gate_cache_2_U.i_write} data_PIPO}
                        if ((~gate_cache_2_U.t_empty_n & compute_output_U0.ap_idle & ~gate_cache_2_U.i_write)) begin
                            if (~gate_cache_2_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.gate_cache_2_U' written by process 'swiglu_swiglu.compute_gate_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.gate_cache_2_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~gate_cache_2_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.gate_cache_2_U' read by process 'swiglu_swiglu.compute_gate_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.gate_cache_2_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.gate_cache_3_U' info is :
// blk sig is {{~swiglu_swiglu_inst.gate_cache_3_U.t_empty_n & swiglu_swiglu_inst.compute_output_U0.ap_idle & ~swiglu_swiglu_inst.gate_cache_3_U.i_write} data_PIPO}
                        if ((~gate_cache_3_U.t_empty_n & compute_output_U0.ap_idle & ~gate_cache_3_U.i_write)) begin
                            if (~gate_cache_3_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.gate_cache_3_U' written by process 'swiglu_swiglu.compute_gate_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.gate_cache_3_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~gate_cache_3_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.gate_cache_3_U' read by process 'swiglu_swiglu.compute_gate_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.gate_cache_3_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.gate_cache_4_U' info is :
// blk sig is {{~swiglu_swiglu_inst.gate_cache_4_U.t_empty_n & swiglu_swiglu_inst.compute_output_U0.ap_idle & ~swiglu_swiglu_inst.gate_cache_4_U.i_write} data_PIPO}
                        if ((~gate_cache_4_U.t_empty_n & compute_output_U0.ap_idle & ~gate_cache_4_U.i_write)) begin
                            if (~gate_cache_4_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.gate_cache_4_U' written by process 'swiglu_swiglu.compute_gate_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.gate_cache_4_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~gate_cache_4_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.gate_cache_4_U' read by process 'swiglu_swiglu.compute_gate_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.gate_cache_4_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.gate_cache_5_U' info is :
// blk sig is {{~swiglu_swiglu_inst.gate_cache_5_U.t_empty_n & swiglu_swiglu_inst.compute_output_U0.ap_idle & ~swiglu_swiglu_inst.gate_cache_5_U.i_write} data_PIPO}
                        if ((~gate_cache_5_U.t_empty_n & compute_output_U0.ap_idle & ~gate_cache_5_U.i_write)) begin
                            if (~gate_cache_5_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.gate_cache_5_U' written by process 'swiglu_swiglu.compute_gate_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.gate_cache_5_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~gate_cache_5_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.gate_cache_5_U' read by process 'swiglu_swiglu.compute_gate_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.gate_cache_5_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.gate_cache_6_U' info is :
// blk sig is {{~swiglu_swiglu_inst.gate_cache_6_U.t_empty_n & swiglu_swiglu_inst.compute_output_U0.ap_idle & ~swiglu_swiglu_inst.gate_cache_6_U.i_write} data_PIPO}
                        if ((~gate_cache_6_U.t_empty_n & compute_output_U0.ap_idle & ~gate_cache_6_U.i_write)) begin
                            if (~gate_cache_6_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.gate_cache_6_U' written by process 'swiglu_swiglu.compute_gate_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.gate_cache_6_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~gate_cache_6_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.gate_cache_6_U' read by process 'swiglu_swiglu.compute_gate_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.gate_cache_6_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.gate_cache_7_U' info is :
// blk sig is {{~swiglu_swiglu_inst.gate_cache_7_U.t_empty_n & swiglu_swiglu_inst.compute_output_U0.ap_idle & ~swiglu_swiglu_inst.gate_cache_7_U.i_write} data_PIPO}
                        if ((~gate_cache_7_U.t_empty_n & compute_output_U0.ap_idle & ~gate_cache_7_U.i_write)) begin
                            if (~gate_cache_7_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.gate_cache_7_U' written by process 'swiglu_swiglu.compute_gate_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.gate_cache_7_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~gate_cache_7_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.gate_cache_7_U' read by process 'swiglu_swiglu.compute_gate_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.gate_cache_7_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.gate_cache_8_U' info is :
// blk sig is {{~swiglu_swiglu_inst.gate_cache_8_U.t_empty_n & swiglu_swiglu_inst.compute_output_U0.ap_idle & ~swiglu_swiglu_inst.gate_cache_8_U.i_write} data_PIPO}
                        if ((~gate_cache_8_U.t_empty_n & compute_output_U0.ap_idle & ~gate_cache_8_U.i_write)) begin
                            if (~gate_cache_8_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.gate_cache_8_U' written by process 'swiglu_swiglu.compute_gate_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.gate_cache_8_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~gate_cache_8_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.gate_cache_8_U' read by process 'swiglu_swiglu.compute_gate_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.gate_cache_8_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.gate_cache_9_U' info is :
// blk sig is {{~swiglu_swiglu_inst.gate_cache_9_U.t_empty_n & swiglu_swiglu_inst.compute_output_U0.ap_idle & ~swiglu_swiglu_inst.gate_cache_9_U.i_write} data_PIPO}
                        if ((~gate_cache_9_U.t_empty_n & compute_output_U0.ap_idle & ~gate_cache_9_U.i_write)) begin
                            if (~gate_cache_9_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.gate_cache_9_U' written by process 'swiglu_swiglu.compute_gate_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.gate_cache_9_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~gate_cache_9_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.gate_cache_9_U' read by process 'swiglu_swiglu.compute_gate_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.gate_cache_9_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.gate_cache_10_U' info is :
// blk sig is {{~swiglu_swiglu_inst.gate_cache_10_U.t_empty_n & swiglu_swiglu_inst.compute_output_U0.ap_idle & ~swiglu_swiglu_inst.gate_cache_10_U.i_write} data_PIPO}
                        if ((~gate_cache_10_U.t_empty_n & compute_output_U0.ap_idle & ~gate_cache_10_U.i_write)) begin
                            if (~gate_cache_10_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.gate_cache_10_U' written by process 'swiglu_swiglu.compute_gate_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.gate_cache_10_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~gate_cache_10_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.gate_cache_10_U' read by process 'swiglu_swiglu.compute_gate_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.gate_cache_10_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.gate_cache_11_U' info is :
// blk sig is {{~swiglu_swiglu_inst.gate_cache_11_U.t_empty_n & swiglu_swiglu_inst.compute_output_U0.ap_idle & ~swiglu_swiglu_inst.gate_cache_11_U.i_write} data_PIPO}
                        if ((~gate_cache_11_U.t_empty_n & compute_output_U0.ap_idle & ~gate_cache_11_U.i_write)) begin
                            if (~gate_cache_11_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.gate_cache_11_U' written by process 'swiglu_swiglu.compute_gate_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.gate_cache_11_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~gate_cache_11_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.gate_cache_11_U' read by process 'swiglu_swiglu.compute_gate_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.gate_cache_11_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.gate_cache_12_U' info is :
// blk sig is {{~swiglu_swiglu_inst.gate_cache_12_U.t_empty_n & swiglu_swiglu_inst.compute_output_U0.ap_idle & ~swiglu_swiglu_inst.gate_cache_12_U.i_write} data_PIPO}
                        if ((~gate_cache_12_U.t_empty_n & compute_output_U0.ap_idle & ~gate_cache_12_U.i_write)) begin
                            if (~gate_cache_12_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.gate_cache_12_U' written by process 'swiglu_swiglu.compute_gate_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.gate_cache_12_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~gate_cache_12_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.gate_cache_12_U' read by process 'swiglu_swiglu.compute_gate_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.gate_cache_12_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.gate_cache_13_U' info is :
// blk sig is {{~swiglu_swiglu_inst.gate_cache_13_U.t_empty_n & swiglu_swiglu_inst.compute_output_U0.ap_idle & ~swiglu_swiglu_inst.gate_cache_13_U.i_write} data_PIPO}
                        if ((~gate_cache_13_U.t_empty_n & compute_output_U0.ap_idle & ~gate_cache_13_U.i_write)) begin
                            if (~gate_cache_13_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.gate_cache_13_U' written by process 'swiglu_swiglu.compute_gate_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.gate_cache_13_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~gate_cache_13_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.gate_cache_13_U' read by process 'swiglu_swiglu.compute_gate_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.gate_cache_13_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.gate_cache_14_U' info is :
// blk sig is {{~swiglu_swiglu_inst.gate_cache_14_U.t_empty_n & swiglu_swiglu_inst.compute_output_U0.ap_idle & ~swiglu_swiglu_inst.gate_cache_14_U.i_write} data_PIPO}
                        if ((~gate_cache_14_U.t_empty_n & compute_output_U0.ap_idle & ~gate_cache_14_U.i_write)) begin
                            if (~gate_cache_14_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.gate_cache_14_U' written by process 'swiglu_swiglu.compute_gate_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.gate_cache_14_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~gate_cache_14_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.gate_cache_14_U' read by process 'swiglu_swiglu.compute_gate_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.gate_cache_14_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.gate_cache_15_U' info is :
// blk sig is {{~swiglu_swiglu_inst.gate_cache_15_U.t_empty_n & swiglu_swiglu_inst.compute_output_U0.ap_idle & ~swiglu_swiglu_inst.gate_cache_15_U.i_write} data_PIPO}
                        if ((~gate_cache_15_U.t_empty_n & compute_output_U0.ap_idle & ~gate_cache_15_U.i_write)) begin
                            if (~gate_cache_15_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.gate_cache_15_U' written by process 'swiglu_swiglu.compute_gate_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.gate_cache_15_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~gate_cache_15_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.gate_cache_15_U' read by process 'swiglu_swiglu.compute_gate_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.gate_cache_15_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.gate_cache_16_U' info is :
// blk sig is {{~swiglu_swiglu_inst.gate_cache_16_U.t_empty_n & swiglu_swiglu_inst.compute_output_U0.ap_idle & ~swiglu_swiglu_inst.gate_cache_16_U.i_write} data_PIPO}
                        if ((~gate_cache_16_U.t_empty_n & compute_output_U0.ap_idle & ~gate_cache_16_U.i_write)) begin
                            if (~gate_cache_16_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.gate_cache_16_U' written by process 'swiglu_swiglu.compute_gate_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.gate_cache_16_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~gate_cache_16_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.gate_cache_16_U' read by process 'swiglu_swiglu.compute_gate_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.gate_cache_16_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.gate_cache_17_U' info is :
// blk sig is {{~swiglu_swiglu_inst.gate_cache_17_U.t_empty_n & swiglu_swiglu_inst.compute_output_U0.ap_idle & ~swiglu_swiglu_inst.gate_cache_17_U.i_write} data_PIPO}
                        if ((~gate_cache_17_U.t_empty_n & compute_output_U0.ap_idle & ~gate_cache_17_U.i_write)) begin
                            if (~gate_cache_17_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.gate_cache_17_U' written by process 'swiglu_swiglu.compute_gate_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.gate_cache_17_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~gate_cache_17_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.gate_cache_17_U' read by process 'swiglu_swiglu.compute_gate_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.gate_cache_17_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.gate_cache_18_U' info is :
// blk sig is {{~swiglu_swiglu_inst.gate_cache_18_U.t_empty_n & swiglu_swiglu_inst.compute_output_U0.ap_idle & ~swiglu_swiglu_inst.gate_cache_18_U.i_write} data_PIPO}
                        if ((~gate_cache_18_U.t_empty_n & compute_output_U0.ap_idle & ~gate_cache_18_U.i_write)) begin
                            if (~gate_cache_18_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.gate_cache_18_U' written by process 'swiglu_swiglu.compute_gate_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.gate_cache_18_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~gate_cache_18_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.gate_cache_18_U' read by process 'swiglu_swiglu.compute_gate_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.gate_cache_18_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.gate_cache_19_U' info is :
// blk sig is {{~swiglu_swiglu_inst.gate_cache_19_U.t_empty_n & swiglu_swiglu_inst.compute_output_U0.ap_idle & ~swiglu_swiglu_inst.gate_cache_19_U.i_write} data_PIPO}
                        if ((~gate_cache_19_U.t_empty_n & compute_output_U0.ap_idle & ~gate_cache_19_U.i_write)) begin
                            if (~gate_cache_19_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.gate_cache_19_U' written by process 'swiglu_swiglu.compute_gate_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.gate_cache_19_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~gate_cache_19_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.gate_cache_19_U' read by process 'swiglu_swiglu.compute_gate_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.gate_cache_19_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.gate_cache_20_U' info is :
// blk sig is {{~swiglu_swiglu_inst.gate_cache_20_U.t_empty_n & swiglu_swiglu_inst.compute_output_U0.ap_idle & ~swiglu_swiglu_inst.gate_cache_20_U.i_write} data_PIPO}
                        if ((~gate_cache_20_U.t_empty_n & compute_output_U0.ap_idle & ~gate_cache_20_U.i_write)) begin
                            if (~gate_cache_20_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.gate_cache_20_U' written by process 'swiglu_swiglu.compute_gate_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.gate_cache_20_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~gate_cache_20_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.gate_cache_20_U' read by process 'swiglu_swiglu.compute_gate_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.gate_cache_20_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.gate_cache_21_U' info is :
// blk sig is {{~swiglu_swiglu_inst.gate_cache_21_U.t_empty_n & swiglu_swiglu_inst.compute_output_U0.ap_idle & ~swiglu_swiglu_inst.gate_cache_21_U.i_write} data_PIPO}
                        if ((~gate_cache_21_U.t_empty_n & compute_output_U0.ap_idle & ~gate_cache_21_U.i_write)) begin
                            if (~gate_cache_21_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.gate_cache_21_U' written by process 'swiglu_swiglu.compute_gate_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.gate_cache_21_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~gate_cache_21_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.gate_cache_21_U' read by process 'swiglu_swiglu.compute_gate_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.gate_cache_21_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.gate_cache_22_U' info is :
// blk sig is {{~swiglu_swiglu_inst.gate_cache_22_U.t_empty_n & swiglu_swiglu_inst.compute_output_U0.ap_idle & ~swiglu_swiglu_inst.gate_cache_22_U.i_write} data_PIPO}
                        if ((~gate_cache_22_U.t_empty_n & compute_output_U0.ap_idle & ~gate_cache_22_U.i_write)) begin
                            if (~gate_cache_22_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.gate_cache_22_U' written by process 'swiglu_swiglu.compute_gate_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.gate_cache_22_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~gate_cache_22_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.gate_cache_22_U' read by process 'swiglu_swiglu.compute_gate_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.gate_cache_22_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.gate_cache_23_U' info is :
// blk sig is {{~swiglu_swiglu_inst.gate_cache_23_U.t_empty_n & swiglu_swiglu_inst.compute_output_U0.ap_idle & ~swiglu_swiglu_inst.gate_cache_23_U.i_write} data_PIPO}
                        if ((~gate_cache_23_U.t_empty_n & compute_output_U0.ap_idle & ~gate_cache_23_U.i_write)) begin
                            if (~gate_cache_23_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.gate_cache_23_U' written by process 'swiglu_swiglu.compute_gate_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.gate_cache_23_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~gate_cache_23_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.gate_cache_23_U' read by process 'swiglu_swiglu.compute_gate_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.gate_cache_23_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.gate_cache_24_U' info is :
// blk sig is {{~swiglu_swiglu_inst.gate_cache_24_U.t_empty_n & swiglu_swiglu_inst.compute_output_U0.ap_idle & ~swiglu_swiglu_inst.gate_cache_24_U.i_write} data_PIPO}
                        if ((~gate_cache_24_U.t_empty_n & compute_output_U0.ap_idle & ~gate_cache_24_U.i_write)) begin
                            if (~gate_cache_24_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.gate_cache_24_U' written by process 'swiglu_swiglu.compute_gate_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.gate_cache_24_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~gate_cache_24_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.gate_cache_24_U' read by process 'swiglu_swiglu.compute_gate_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.gate_cache_24_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.gate_cache_25_U' info is :
// blk sig is {{~swiglu_swiglu_inst.gate_cache_25_U.t_empty_n & swiglu_swiglu_inst.compute_output_U0.ap_idle & ~swiglu_swiglu_inst.gate_cache_25_U.i_write} data_PIPO}
                        if ((~gate_cache_25_U.t_empty_n & compute_output_U0.ap_idle & ~gate_cache_25_U.i_write)) begin
                            if (~gate_cache_25_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.gate_cache_25_U' written by process 'swiglu_swiglu.compute_gate_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.gate_cache_25_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~gate_cache_25_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.gate_cache_25_U' read by process 'swiglu_swiglu.compute_gate_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.gate_cache_25_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.gate_cache_26_U' info is :
// blk sig is {{~swiglu_swiglu_inst.gate_cache_26_U.t_empty_n & swiglu_swiglu_inst.compute_output_U0.ap_idle & ~swiglu_swiglu_inst.gate_cache_26_U.i_write} data_PIPO}
                        if ((~gate_cache_26_U.t_empty_n & compute_output_U0.ap_idle & ~gate_cache_26_U.i_write)) begin
                            if (~gate_cache_26_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.gate_cache_26_U' written by process 'swiglu_swiglu.compute_gate_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.gate_cache_26_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~gate_cache_26_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.gate_cache_26_U' read by process 'swiglu_swiglu.compute_gate_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.gate_cache_26_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.gate_cache_27_U' info is :
// blk sig is {{~swiglu_swiglu_inst.gate_cache_27_U.t_empty_n & swiglu_swiglu_inst.compute_output_U0.ap_idle & ~swiglu_swiglu_inst.gate_cache_27_U.i_write} data_PIPO}
                        if ((~gate_cache_27_U.t_empty_n & compute_output_U0.ap_idle & ~gate_cache_27_U.i_write)) begin
                            if (~gate_cache_27_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.gate_cache_27_U' written by process 'swiglu_swiglu.compute_gate_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.gate_cache_27_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~gate_cache_27_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.gate_cache_27_U' read by process 'swiglu_swiglu.compute_gate_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.gate_cache_27_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.gate_cache_28_U' info is :
// blk sig is {{~swiglu_swiglu_inst.gate_cache_28_U.t_empty_n & swiglu_swiglu_inst.compute_output_U0.ap_idle & ~swiglu_swiglu_inst.gate_cache_28_U.i_write} data_PIPO}
                        if ((~gate_cache_28_U.t_empty_n & compute_output_U0.ap_idle & ~gate_cache_28_U.i_write)) begin
                            if (~gate_cache_28_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.gate_cache_28_U' written by process 'swiglu_swiglu.compute_gate_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.gate_cache_28_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~gate_cache_28_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.gate_cache_28_U' read by process 'swiglu_swiglu.compute_gate_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.gate_cache_28_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.gate_cache_29_U' info is :
// blk sig is {{~swiglu_swiglu_inst.gate_cache_29_U.t_empty_n & swiglu_swiglu_inst.compute_output_U0.ap_idle & ~swiglu_swiglu_inst.gate_cache_29_U.i_write} data_PIPO}
                        if ((~gate_cache_29_U.t_empty_n & compute_output_U0.ap_idle & ~gate_cache_29_U.i_write)) begin
                            if (~gate_cache_29_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.gate_cache_29_U' written by process 'swiglu_swiglu.compute_gate_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.gate_cache_29_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~gate_cache_29_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.gate_cache_29_U' read by process 'swiglu_swiglu.compute_gate_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.gate_cache_29_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.gate_cache_30_U' info is :
// blk sig is {{~swiglu_swiglu_inst.gate_cache_30_U.t_empty_n & swiglu_swiglu_inst.compute_output_U0.ap_idle & ~swiglu_swiglu_inst.gate_cache_30_U.i_write} data_PIPO}
                        if ((~gate_cache_30_U.t_empty_n & compute_output_U0.ap_idle & ~gate_cache_30_U.i_write)) begin
                            if (~gate_cache_30_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.gate_cache_30_U' written by process 'swiglu_swiglu.compute_gate_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.gate_cache_30_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~gate_cache_30_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.gate_cache_30_U' read by process 'swiglu_swiglu.compute_gate_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.gate_cache_30_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.gate_cache_31_U' info is :
// blk sig is {{~swiglu_swiglu_inst.gate_cache_31_U.t_empty_n & swiglu_swiglu_inst.compute_output_U0.ap_idle & ~swiglu_swiglu_inst.gate_cache_31_U.i_write} data_PIPO}
                        if ((~gate_cache_31_U.t_empty_n & compute_output_U0.ap_idle & ~gate_cache_31_U.i_write)) begin
                            if (~gate_cache_31_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'swiglu_swiglu.gate_cache_31_U' written by process 'swiglu_swiglu.compute_gate_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.gate_cache_31_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~gate_cache_31_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'swiglu_swiglu.gate_cache_31_U' read by process 'swiglu_swiglu.compute_gate_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.gate_cache_31_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
                    end
                    0: begin //  for dep proc 'swiglu_swiglu.entry_proc_U0'
// for dep channel 'swiglu_swiglu.W_down_c_U' info is :
// blk sig is {~swiglu_swiglu_inst.compute_output_U0.W_down_blk_n data_FIFO}
                        if ((~compute_output_U0.W_down_blk_n)) begin
                            if (~W_down_c_U.if_empty_n) begin
                                $display("//      Blocked by empty input FIFO 'swiglu_swiglu.W_down_c_U' written by process 'swiglu_swiglu.entry_proc_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.W_down_c_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~W_down_c_U.if_full_n) begin
                                $display("//      Blocked by full output FIFO 'swiglu_swiglu.W_down_c_U' read by process 'swiglu_swiglu.entry_proc_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.W_down_c_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.out_batch_c_U' info is :
// blk sig is {~swiglu_swiglu_inst.compute_output_U0.out_batch_blk_n data_FIFO}
                        if ((~compute_output_U0.out_batch_blk_n)) begin
                            if (~out_batch_c_U.if_empty_n) begin
                                $display("//      Blocked by empty input FIFO 'swiglu_swiglu.out_batch_c_U' written by process 'swiglu_swiglu.entry_proc_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.out_batch_c_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~out_batch_c_U.if_full_n) begin
                                $display("//      Blocked by full output FIFO 'swiglu_swiglu.out_batch_c_U' read by process 'swiglu_swiglu.entry_proc_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.out_batch_c_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'swiglu_swiglu.down_quant_mode_c_U' info is :
// blk sig is {~swiglu_swiglu_inst.compute_output_U0.down_quant_mode_blk_n data_FIFO}
                        if ((~compute_output_U0.down_quant_mode_blk_n)) begin
                            if (~down_quant_mode_c_U.if_empty_n) begin
                                $display("//      Blocked by empty input FIFO 'swiglu_swiglu.down_quant_mode_c_U' written by process 'swiglu_swiglu.entry_proc_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.down_quant_mode_c_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~down_quant_mode_c_U.if_full_n) begin
                                $display("//      Blocked by full output FIFO 'swiglu_swiglu.down_quant_mode_c_U' read by process 'swiglu_swiglu.entry_proc_U0'");
                                $fdisplay(fp, "Dependence_Channel_path swiglu_swiglu.down_quant_mode_c_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
                    end
                    endcase
                end
            endcase
        end
    endtask

    // report
    initial begin : report_deadlock
        integer cycle_id;
        integer cycle_comp_id;
        integer record_time;
        wait (dl_reset == 1);
        cycle_id = 1;
        record_time = 0;
        while (1) begin
            @ (negedge dl_clock);
            case (CS_fsm)
                ST_DL_DETECTED: begin
                    cycle_comp_id = 2;
                    if (dl_detect_reg != dl_done_reg && stop_report_path == 1'b0) begin
                        if (dl_done_reg == 'b0) begin
                            print_dl_head;
                            record_time = $time;
                        end
                        print_cycle_start(proc_path(origin), cycle_id);
                        cycle_id = cycle_id + 1;
                    end
                    else begin
                        print_dl_end((cycle_id - 1),record_time);
                        @(negedge dl_clock);
                        @(negedge dl_clock);
                        $finish;
                    end
                end
                ST_DL_REPORT: begin
                    if ((|(dl_in_vec)) & ~(|(dl_in_vec & origin_reg)) & ~(|(reported_proc & dl_in_vec))) begin
                        print_cycle_chan_comp(dl_in_vec_reg, dl_in_vec);
                        print_cycle_proc_comp(proc_path(dl_in_vec), cycle_comp_id);
                        cycle_comp_id = cycle_comp_id + 1;
                    end
                    else begin
                        print_cycle_chan_comp(dl_in_vec_reg, dl_in_vec);
                    end
                end
            endcase
        end
    end
 
