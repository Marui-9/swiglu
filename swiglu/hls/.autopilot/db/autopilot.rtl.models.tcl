set SynModuleInfo {
  {SRCNAME entry_proc MODELNAME entry_proc RTLNAME swiglu_entry_proc}
  {SRCNAME load_x_local MODELNAME load_x_local RTLNAME swiglu_load_x_local
    SUBMODULES {
      {MODELNAME swiglu_flow_control_loop_pipe RTLNAME swiglu_flow_control_loop_pipe BINDTYPE interface TYPE internal_upc_flow_control INSTNAME swiglu_flow_control_loop_pipe_U}
    }
  }
  {SRCNAME load_row_wv MODELNAME load_row_wv RTLNAME swiglu_load_row_wv
    SUBMODULES {
      {MODELNAME swiglu_flow_control_loop_pipe_sequential_init RTLNAME swiglu_flow_control_loop_pipe_sequential_init BINDTYPE interface TYPE internal_upc_flow_control INSTNAME swiglu_flow_control_loop_pipe_sequential_init_U}
    }
  }
  {SRCNAME mac_blocks_wv_Pipeline_MAC_ALL_BLOCKS MODELNAME mac_blocks_wv_Pipeline_MAC_ALL_BLOCKS RTLNAME swiglu_mac_blocks_wv_Pipeline_MAC_ALL_BLOCKS
    SUBMODULES {
      {MODELNAME swiglu_sparsemux_33_4_1_1_1 RTLNAME swiglu_sparsemux_33_4_1_1_1 BINDTYPE op TYPE sparsemux IMPL compactencoding_dontcare}
      {MODELNAME swiglu_sparsemux_17_3_1_1_1 RTLNAME swiglu_sparsemux_17_3_1_1_1 BINDTYPE op TYPE sparsemux IMPL compactencoding_dontcare}
      {MODELNAME swiglu_partselect_8ns_128ns_7ns_8_1_1 RTLNAME swiglu_partselect_8ns_128ns_7ns_8_1_1 BINDTYPE op TYPE partselect IMPL auto}
      {MODELNAME swiglu_sparsemux_17_3_32_1_1 RTLNAME swiglu_sparsemux_17_3_32_1_1 BINDTYPE op TYPE sparsemux IMPL compactencoding_dontcare}
    }
  }
  {SRCNAME fp16_to_fp32 MODELNAME fp16_to_fp32 RTLNAME swiglu_fp16_to_fp32}
  {SRCNAME mac_blocks_wv MODELNAME mac_blocks_wv RTLNAME swiglu_mac_blocks_wv
    SUBMODULES {
      {MODELNAME swiglu_faddfsub_32ns_32ns_32_11_full_dsp_1 RTLNAME swiglu_faddfsub_32ns_32ns_32_11_full_dsp_1 BINDTYPE op TYPE fsub IMPL fulldsp LATENCY 10 ALLOW_PRAGMA 1}
      {MODELNAME swiglu_fsub_32ns_32ns_32_11_full_dsp_1 RTLNAME swiglu_fsub_32ns_32ns_32_11_full_dsp_1 BINDTYPE op TYPE fsub IMPL fulldsp LATENCY 10 ALLOW_PRAGMA 1}
      {MODELNAME swiglu_fmul_32ns_32ns_32_7_max_dsp_1 RTLNAME swiglu_fmul_32ns_32ns_32_7_max_dsp_1 BINDTYPE op TYPE fmul IMPL maxdsp LATENCY 6 ALLOW_PRAGMA 1}
      {MODELNAME swiglu_sitofp_32ns_32_7_no_dsp_1 RTLNAME swiglu_sitofp_32ns_32_7_no_dsp_1 BINDTYPE op TYPE sitofp IMPL auto LATENCY 6 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME compute_X1 MODELNAME compute_X1 RTLNAME swiglu_compute_X1
    SUBMODULES {
      {MODELNAME swiglu_compute_X1_row_buf_RAM_AUTO_1R1W RTLNAME swiglu_compute_X1_row_buf_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME compute_X2 MODELNAME compute_X2 RTLNAME swiglu_compute_X2
    SUBMODULES {
      {MODELNAME swiglu_compute_X2_row_buf_RAM_AUTO_1R1W RTLNAME swiglu_compute_X2_row_buf_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME compute_gate_Pipeline_GATE_PASS1 MODELNAME compute_gate_Pipeline_GATE_PASS1 RTLNAME swiglu_compute_gate_Pipeline_GATE_PASS1
    SUBMODULES {
      {MODELNAME swiglu_fadd_32ns_32ns_32_11_full_dsp_1 RTLNAME swiglu_fadd_32ns_32ns_32_11_full_dsp_1 BINDTYPE op TYPE fadd IMPL fulldsp LATENCY 10 ALLOW_PRAGMA 1}
      {MODELNAME swiglu_fcmp_32ns_32ns_1_3_no_dsp_1 RTLNAME swiglu_fcmp_32ns_32ns_1_3_no_dsp_1 BINDTYPE op TYPE fcmp IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME swiglu_compute_gate_Pipeline_GATE_PASS1_sigmoid_lut_ROM_1P_BRAM_1R RTLNAME swiglu_compute_gate_Pipeline_GATE_PASS1_sigmoid_lut_ROM_1P_BRAM_1R BINDTYPE storage TYPE rom_1p IMPL bram LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME compute_gate_Pipeline_GATE_PASS2 MODELNAME compute_gate_Pipeline_GATE_PASS2 RTLNAME swiglu_compute_gate_Pipeline_GATE_PASS2}
  {SRCNAME compute_gate MODELNAME compute_gate RTLNAME swiglu_compute_gate
    SUBMODULES {
      {MODELNAME swiglu_fdiv_32ns_32ns_32_30_no_dsp_1 RTLNAME swiglu_fdiv_32ns_32ns_32_30_no_dsp_1 BINDTYPE op TYPE fdiv IMPL fabric LATENCY 29 ALLOW_PRAGMA 1}
      {MODELNAME swiglu_compute_gate_gate_fp_RAM_1P_BRAM_1R1W RTLNAME swiglu_compute_gate_gate_fp_RAM_1P_BRAM_1R1W BINDTYPE storage TYPE ram_1p IMPL bram LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME load_row_down_q6k MODELNAME load_row_down_q6k RTLNAME swiglu_load_row_down_q6k}
  {SRCNAME mac_blocks_down_q6k_Pipeline_1 MODELNAME mac_blocks_down_q6k_Pipeline_1 RTLNAME swiglu_mac_blocks_down_q6k_Pipeline_1}
  {SRCNAME mac_blocks_down_q6k_Pipeline_MAC_Q6K MODELNAME mac_blocks_down_q6k_Pipeline_MAC_Q6K RTLNAME swiglu_mac_blocks_down_q6k_Pipeline_MAC_Q6K
    SUBMODULES {
      {MODELNAME swiglu_sparsemux_647_9_8_1_1 RTLNAME swiglu_sparsemux_647_9_8_1_1 BINDTYPE op TYPE sparsemux IMPL compactencoding_dontcare}
      {MODELNAME swiglu_sparsemux_639_9_8_1_1 RTLNAME swiglu_sparsemux_639_9_8_1_1 BINDTYPE op TYPE sparsemux IMPL compactencoding_dontcare}
      {MODELNAME swiglu_sparsemux_633_9_8_1_1 RTLNAME swiglu_sparsemux_633_9_8_1_1 BINDTYPE op TYPE sparsemux IMPL compactencoding_dontcare}
      {MODELNAME swiglu_sparsemux_9_5_8_1_1 RTLNAME swiglu_sparsemux_9_5_8_1_1 BINDTYPE op TYPE sparsemux IMPL compactencoding_dontcare}
    }
  }
  {SRCNAME mac_blocks_down_q6k_Pipeline_3 MODELNAME mac_blocks_down_q6k_Pipeline_3 RTLNAME swiglu_mac_blocks_down_q6k_Pipeline_3}
  {SRCNAME mac_blocks_down_q6k_Pipeline_MAC_Q6K1 MODELNAME mac_blocks_down_q6k_Pipeline_MAC_Q6K1 RTLNAME swiglu_mac_blocks_down_q6k_Pipeline_MAC_Q6K1
    SUBMODULES {
      {MODELNAME swiglu_sparsemux_649_9_8_1_1 RTLNAME swiglu_sparsemux_649_9_8_1_1 BINDTYPE op TYPE sparsemux IMPL compactencoding_dontcare}
      {MODELNAME swiglu_sparsemux_641_9_8_1_1 RTLNAME swiglu_sparsemux_641_9_8_1_1 BINDTYPE op TYPE sparsemux IMPL compactencoding_dontcare}
      {MODELNAME swiglu_sparsemux_635_9_8_1_1 RTLNAME swiglu_sparsemux_635_9_8_1_1 BINDTYPE op TYPE sparsemux IMPL compactencoding_dontcare}
    }
  }
  {SRCNAME mac_blocks_down_q6k_Pipeline_5 MODELNAME mac_blocks_down_q6k_Pipeline_5 RTLNAME swiglu_mac_blocks_down_q6k_Pipeline_5}
  {SRCNAME mac_blocks_down_q6k_Pipeline_MAC_Q6K2 MODELNAME mac_blocks_down_q6k_Pipeline_MAC_Q6K2 RTLNAME swiglu_mac_blocks_down_q6k_Pipeline_MAC_Q6K2
    SUBMODULES {
      {MODELNAME swiglu_sparsemux_675_9_8_1_1 RTLNAME swiglu_sparsemux_675_9_8_1_1 BINDTYPE op TYPE sparsemux IMPL compactencoding_dontcare}
      {MODELNAME swiglu_sparsemux_667_9_8_1_1 RTLNAME swiglu_sparsemux_667_9_8_1_1 BINDTYPE op TYPE sparsemux IMPL compactencoding_dontcare}
      {MODELNAME swiglu_sparsemux_661_9_8_1_1 RTLNAME swiglu_sparsemux_661_9_8_1_1 BINDTYPE op TYPE sparsemux IMPL compactencoding_dontcare}
    }
  }
  {SRCNAME mac_blocks_down_q6k_Pipeline_7 MODELNAME mac_blocks_down_q6k_Pipeline_7 RTLNAME swiglu_mac_blocks_down_q6k_Pipeline_7}
  {SRCNAME mac_blocks_down_q6k_Pipeline_MAC_Q6K3 MODELNAME mac_blocks_down_q6k_Pipeline_MAC_Q6K3 RTLNAME swiglu_mac_blocks_down_q6k_Pipeline_MAC_Q6K3
    SUBMODULES {
      {MODELNAME swiglu_sparsemux_649_9_8_1_1_x RTLNAME swiglu_sparsemux_649_9_8_1_1_x BINDTYPE op TYPE sparsemux IMPL compactencoding_dontcare}
      {MODELNAME swiglu_sparsemux_641_9_8_1_1_x RTLNAME swiglu_sparsemux_641_9_8_1_1_x BINDTYPE op TYPE sparsemux IMPL compactencoding_dontcare}
      {MODELNAME swiglu_sparsemux_635_9_8_1_1_x RTLNAME swiglu_sparsemux_635_9_8_1_1_x BINDTYPE op TYPE sparsemux IMPL compactencoding_dontcare}
    }
  }
  {SRCNAME mac_blocks_down_q6k_Pipeline_9 MODELNAME mac_blocks_down_q6k_Pipeline_9 RTLNAME swiglu_mac_blocks_down_q6k_Pipeline_9}
  {SRCNAME mac_blocks_down_q6k_Pipeline_MAC_Q6K4 MODELNAME mac_blocks_down_q6k_Pipeline_MAC_Q6K4 RTLNAME swiglu_mac_blocks_down_q6k_Pipeline_MAC_Q6K4
    SUBMODULES {
      {MODELNAME swiglu_sparsemux_727_9_8_1_1 RTLNAME swiglu_sparsemux_727_9_8_1_1 BINDTYPE op TYPE sparsemux IMPL compactencoding_dontcare}
      {MODELNAME swiglu_sparsemux_719_9_8_1_1 RTLNAME swiglu_sparsemux_719_9_8_1_1 BINDTYPE op TYPE sparsemux IMPL compactencoding_dontcare}
      {MODELNAME swiglu_sparsemux_713_9_8_1_1 RTLNAME swiglu_sparsemux_713_9_8_1_1 BINDTYPE op TYPE sparsemux IMPL compactencoding_dontcare}
    }
  }
  {SRCNAME mac_blocks_down_q6k_Pipeline_11 MODELNAME mac_blocks_down_q6k_Pipeline_11 RTLNAME swiglu_mac_blocks_down_q6k_Pipeline_11}
  {SRCNAME mac_blocks_down_q6k_Pipeline_MAC_Q6K5 MODELNAME mac_blocks_down_q6k_Pipeline_MAC_Q6K5 RTLNAME swiglu_mac_blocks_down_q6k_Pipeline_MAC_Q6K5
    SUBMODULES {
      {MODELNAME swiglu_sparsemux_701_9_8_1_1 RTLNAME swiglu_sparsemux_701_9_8_1_1 BINDTYPE op TYPE sparsemux IMPL compactencoding_dontcare}
      {MODELNAME swiglu_sparsemux_693_9_8_1_1 RTLNAME swiglu_sparsemux_693_9_8_1_1 BINDTYPE op TYPE sparsemux IMPL compactencoding_dontcare}
      {MODELNAME swiglu_sparsemux_687_9_8_1_1 RTLNAME swiglu_sparsemux_687_9_8_1_1 BINDTYPE op TYPE sparsemux IMPL compactencoding_dontcare}
    }
  }
  {SRCNAME mac_blocks_down_q6k_Pipeline_13 MODELNAME mac_blocks_down_q6k_Pipeline_13 RTLNAME swiglu_mac_blocks_down_q6k_Pipeline_13}
  {SRCNAME mac_blocks_down_q6k_Pipeline_MAC_Q6K6 MODELNAME mac_blocks_down_q6k_Pipeline_MAC_Q6K6 RTLNAME swiglu_mac_blocks_down_q6k_Pipeline_MAC_Q6K6
    SUBMODULES {
      {MODELNAME swiglu_sparsemux_675_9_8_1_1_x RTLNAME swiglu_sparsemux_675_9_8_1_1_x BINDTYPE op TYPE sparsemux IMPL compactencoding_dontcare}
      {MODELNAME swiglu_sparsemux_667_9_8_1_1_x RTLNAME swiglu_sparsemux_667_9_8_1_1_x BINDTYPE op TYPE sparsemux IMPL compactencoding_dontcare}
      {MODELNAME swiglu_sparsemux_661_9_8_1_1_x RTLNAME swiglu_sparsemux_661_9_8_1_1_x BINDTYPE op TYPE sparsemux IMPL compactencoding_dontcare}
    }
  }
  {SRCNAME mac_blocks_down_q6k_Pipeline_15 MODELNAME mac_blocks_down_q6k_Pipeline_15 RTLNAME swiglu_mac_blocks_down_q6k_Pipeline_15}
  {SRCNAME mac_blocks_down_q6k_Pipeline_MAC_Q6K7 MODELNAME mac_blocks_down_q6k_Pipeline_MAC_Q6K7 RTLNAME swiglu_mac_blocks_down_q6k_Pipeline_MAC_Q6K7
    SUBMODULES {
      {MODELNAME swiglu_sparsemux_649_9_8_1_1_x0 RTLNAME swiglu_sparsemux_649_9_8_1_1_x0 BINDTYPE op TYPE sparsemux IMPL compactencoding_dontcare}
      {MODELNAME swiglu_sparsemux_641_9_8_1_1_x0 RTLNAME swiglu_sparsemux_641_9_8_1_1_x0 BINDTYPE op TYPE sparsemux IMPL compactencoding_dontcare}
      {MODELNAME swiglu_sparsemux_635_9_8_1_1_x0 RTLNAME swiglu_sparsemux_635_9_8_1_1_x0 BINDTYPE op TYPE sparsemux IMPL compactencoding_dontcare}
    }
  }
  {SRCNAME mac_blocks_down_q6k MODELNAME mac_blocks_down_q6k RTLNAME swiglu_mac_blocks_down_q6k
    SUBMODULES {
      {MODELNAME swiglu_mul_5ns_9ns_13_1_1 RTLNAME swiglu_mul_5ns_9ns_13_1_1 BINDTYPE op TYPE mul IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME swiglu_sparsemux_9_2_8_1_1 RTLNAME swiglu_sparsemux_9_2_8_1_1 BINDTYPE op TYPE sparsemux IMPL compactencoding_dontcare}
      {MODELNAME swiglu_fadd_32ns_32ns_32_8_no_dsp_1 RTLNAME swiglu_fadd_32ns_32ns_32_8_no_dsp_1 BINDTYPE op TYPE fadd IMPL fabric LATENCY 7 ALLOW_PRAGMA 1}
      {MODELNAME swiglu_sitofp_32s_32_7_no_dsp_1 RTLNAME swiglu_sitofp_32s_32_7_no_dsp_1 BINDTYPE op TYPE sitofp IMPL auto LATENCY 6 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME load_row_down_q4k MODELNAME load_row_down_q4k RTLNAME swiglu_load_row_down_q4k}
  {SRCNAME mac_blocks_down_q4k_Pipeline_MAC_BLOCKS_G0 MODELNAME mac_blocks_down_q4k_Pipeline_MAC_BLOCKS_G0 RTLNAME swiglu_mac_blocks_down_q4k_Pipeline_MAC_BLOCKS_G0}
  {SRCNAME mac_blocks_down_q4k_Pipeline_MAC_BLOCKS_G1 MODELNAME mac_blocks_down_q4k_Pipeline_MAC_BLOCKS_G1 RTLNAME swiglu_mac_blocks_down_q4k_Pipeline_MAC_BLOCKS_G1}
  {SRCNAME mac_blocks_down_q4k MODELNAME mac_blocks_down_q4k RTLNAME swiglu_mac_blocks_down_q4k}
  {SRCNAME compute_output_Pipeline_1 MODELNAME compute_output_Pipeline_1 RTLNAME swiglu_compute_output_Pipeline_1}
  {SRCNAME compute_output MODELNAME compute_output RTLNAME swiglu_compute_output
    SUBMODULES {
      {MODELNAME swiglu_compute_output_out_local_RAM_AUTO_1R1W RTLNAME swiglu_compute_output_out_local_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME swiglu_compute_output_row_buf_RAM_AUTO_1R1W RTLNAME swiglu_compute_output_row_buf_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME swiglu MODELNAME swiglu RTLNAME swiglu IS_TOP 1
    SUBMODULES {
      {MODELNAME swiglu_x_local_1_RAM_1P_BRAM_1R1W_memcore RTLNAME swiglu_x_local_1_RAM_1P_BRAM_1R1W_memcore BINDTYPE storage TYPE ram_1p IMPL bram LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME swiglu_x_local_1_RAM_1P_BRAM_1R1W RTLNAME swiglu_x_local_1_RAM_1P_BRAM_1R1W BINDTYPE storage TYPE ram_1p IMPL bram LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME swiglu_gate_cache_RAM_2P_BRAM_1R1W_memcore RTLNAME swiglu_gate_cache_RAM_2P_BRAM_1R1W_memcore BINDTYPE storage TYPE ram_2p IMPL bram LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME swiglu_gate_cache_RAM_2P_BRAM_1R1W RTLNAME swiglu_gate_cache_RAM_2P_BRAM_1R1W BINDTYPE storage TYPE ram_2p IMPL bram LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME swiglu_fifo_w8_d3_S RTLNAME swiglu_fifo_w8_d3_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME W_c_U}
      {MODELNAME swiglu_fifo_w8_d3_S RTLNAME swiglu_fifo_w8_d3_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME V_c_U}
      {MODELNAME swiglu_fifo_w8_d5_S RTLNAME swiglu_fifo_w8_d5_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME W_down_c_U}
      {MODELNAME swiglu_fifo_w64_d5_S RTLNAME swiglu_fifo_w64_d5_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME out_batch_c_U}
      {MODELNAME swiglu_fifo_w32_d5_S RTLNAME swiglu_fifo_w32_d5_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME down_quant_mode_c_U}
      {MODELNAME swiglu_fifo_w32_d3_S RTLNAME swiglu_fifo_w32_d3_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME x_scale_c_U}
      {MODELNAME swiglu_fifo_w32_d3_S RTLNAME swiglu_fifo_w32_d3_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME x_scale_c1_U}
      {MODELNAME swiglu_fifo_w32_d16_S RTLNAME swiglu_fifo_w32_d16_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME X1_cache_U}
      {MODELNAME swiglu_fifo_w32_d16_S RTLNAME swiglu_fifo_w32_d16_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME X2_cache_U}
      {MODELNAME swiglu_fifo_w32_d2_S RTLNAME swiglu_fifo_w32_d2_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME gate_scale_U}
      {MODELNAME swiglu_start_for_compute_gate_U0 RTLNAME swiglu_start_for_compute_gate_U0 BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME start_for_compute_gate_U0_U}
      {MODELNAME swiglu_gmem_out_m_axi RTLNAME swiglu_gmem_out_m_axi BINDTYPE interface TYPE adapter IMPL m_axi}
      {MODELNAME swiglu_CTRL_s_axi RTLNAME swiglu_CTRL_s_axi BINDTYPE interface TYPE interface_s_axilite}
    }
  }
}
