set SynModuleInfo {
  {SRCNAME load_x_local MODELNAME load_x_local RTLNAME swiglu_load_x_local
    SUBMODULES {
      {MODELNAME swiglu_flow_control_loop_pipe RTLNAME swiglu_flow_control_loop_pipe BINDTYPE interface TYPE internal_upc_flow_control INSTNAME swiglu_flow_control_loop_pipe_U}
    }
  }
  {SRCNAME load_row_wv_Pipeline_LOAD_WV_VITIS_LOOP_102_1 MODELNAME load_row_wv_Pipeline_LOAD_WV_VITIS_LOOP_102_1 RTLNAME swiglu_load_row_wv_Pipeline_LOAD_WV_VITIS_LOOP_102_1
    SUBMODULES {
      {MODELNAME swiglu_flow_control_loop_pipe_sequential_init RTLNAME swiglu_flow_control_loop_pipe_sequential_init BINDTYPE interface TYPE internal_upc_flow_control INSTNAME swiglu_flow_control_loop_pipe_sequential_init_U}
    }
  }
  {SRCNAME load_row_wv MODELNAME load_row_wv RTLNAME swiglu_load_row_wv}
  {SRCNAME fp16_to_fp32 MODELNAME fp16_to_fp32 RTLNAME swiglu_fp16_to_fp32
    SUBMODULES {
      {MODELNAME swiglu_sparsemux_9_3_32_1_1 RTLNAME swiglu_sparsemux_9_3_32_1_1 BINDTYPE op TYPE sparsemux IMPL onehotencoding_realdef}
    }
  }
  {SRCNAME mac_blocks_wv_Pipeline_UNPACK_HDR_WV MODELNAME mac_blocks_wv_Pipeline_UNPACK_HDR_WV RTLNAME swiglu_mac_blocks_wv_Pipeline_UNPACK_HDR_WV
    SUBMODULES {
      {MODELNAME swiglu_sparsemux_17_3_128_1_1 RTLNAME swiglu_sparsemux_17_3_128_1_1 BINDTYPE op TYPE sparsemux IMPL compactencoding_dontcare}
    }
  }
  {SRCNAME mac_blocks_wv_Pipeline_MAC_ALL_BLOCKS MODELNAME mac_blocks_wv_Pipeline_MAC_ALL_BLOCKS RTLNAME swiglu_mac_blocks_wv_Pipeline_MAC_ALL_BLOCKS
    SUBMODULES {
      {MODELNAME swiglu_sparsemux_17_3_6_1_1 RTLNAME swiglu_sparsemux_17_3_6_1_1 BINDTYPE op TYPE sparsemux IMPL compactencoding_dontcare}
      {MODELNAME swiglu_sparsemux_33_4_8_1_1 RTLNAME swiglu_sparsemux_33_4_8_1_1 BINDTYPE op TYPE sparsemux IMPL compactencoding_dontcare}
      {MODELNAME swiglu_partselect_8ns_128ns_7ns_8_1_1 RTLNAME swiglu_partselect_8ns_128ns_7ns_8_1_1 BINDTYPE op TYPE partselect IMPL auto}
      {MODELNAME swiglu_mul_8s_4ns_12_1_1 RTLNAME swiglu_mul_8s_4ns_12_1_1 BINDTYPE op TYPE mul IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME swiglu_sparsemux_17_3_32_1_1 RTLNAME swiglu_sparsemux_17_3_32_1_1 BINDTYPE op TYPE sparsemux IMPL compactencoding_dontcare}
      {MODELNAME swiglu_mac_muladd_12s_6ns_32s_32_4_1 RTLNAME swiglu_mac_muladd_12s_6ns_32s_32_4_1 BINDTYPE op TYPE all IMPL dsp_slice LATENCY 3}
      {MODELNAME swiglu_mac_muladd_8s_6ns_32s_32_4_1 RTLNAME swiglu_mac_muladd_8s_6ns_32s_32_4_1 BINDTYPE op TYPE all IMPL dsp_slice LATENCY 3}
    }
  }
  {SRCNAME mac_blocks_wv MODELNAME mac_blocks_wv RTLNAME swiglu_mac_blocks_wv
    SUBMODULES {
      {MODELNAME swiglu_faddfsub_32ns_32ns_32_4_full_dsp_1 RTLNAME swiglu_faddfsub_32ns_32ns_32_4_full_dsp_1 BINDTYPE op TYPE fsub IMPL fulldsp LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME swiglu_fsub_32ns_32ns_32_4_full_dsp_1 RTLNAME swiglu_fsub_32ns_32ns_32_4_full_dsp_1 BINDTYPE op TYPE fsub IMPL fulldsp LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME swiglu_fmul_32ns_32ns_32_3_max_dsp_1 RTLNAME swiglu_fmul_32ns_32ns_32_3_max_dsp_1 BINDTYPE op TYPE fmul IMPL maxdsp LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME swiglu_sitofp_32ns_32_3_no_dsp_1 RTLNAME swiglu_sitofp_32ns_32_3_no_dsp_1 BINDTYPE op TYPE sitofp IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME compute_X1 MODELNAME compute_X1 RTLNAME swiglu_compute_X1
    SUBMODULES {
      {MODELNAME swiglu_compute_X1_row_buf_RAM_1P_LUTRAM_1R1W RTLNAME swiglu_compute_X1_row_buf_RAM_1P_LUTRAM_1R1W BINDTYPE storage TYPE ram_1p IMPL lutram LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME compute_X2 MODELNAME compute_X2 RTLNAME swiglu_compute_X2}
  {SRCNAME compute_gate_Pipeline_GATE_PASS1 MODELNAME compute_gate_Pipeline_GATE_PASS1 RTLNAME swiglu_compute_gate_Pipeline_GATE_PASS1
    SUBMODULES {
      {MODELNAME swiglu_fcmp_32ns_32ns_1_2_no_dsp_1 RTLNAME swiglu_fcmp_32ns_32ns_1_2_no_dsp_1 BINDTYPE op TYPE fcmp IMPL auto LATENCY 1 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME compute_gate_Pipeline_GATE_PASS2 MODELNAME compute_gate_Pipeline_GATE_PASS2 RTLNAME swiglu_compute_gate_Pipeline_GATE_PASS2}
  {SRCNAME compute_gate MODELNAME compute_gate RTLNAME swiglu_compute_gate
    SUBMODULES {
      {MODELNAME swiglu_fdiv_32ns_32ns_32_9_no_dsp_1 RTLNAME swiglu_fdiv_32ns_32ns_32_9_no_dsp_1 BINDTYPE op TYPE fdiv IMPL fabric LATENCY 8 ALLOW_PRAGMA 1}
      {MODELNAME swiglu_fadd_32ns_32ns_32_4_full_dsp_1 RTLNAME swiglu_fadd_32ns_32ns_32_4_full_dsp_1 BINDTYPE op TYPE fadd IMPL fulldsp LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME swiglu_compute_gate_sigmoid_lut_ROM_1P_LUTRAM_1R RTLNAME swiglu_compute_gate_sigmoid_lut_ROM_1P_LUTRAM_1R BINDTYPE storage TYPE rom_1p IMPL lutram LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME load_row_down_q6k_Pipeline_LOAD_DOWN_Q6K MODELNAME load_row_down_q6k_Pipeline_LOAD_DOWN_Q6K RTLNAME swiglu_load_row_down_q6k_Pipeline_LOAD_DOWN_Q6K}
  {SRCNAME load_row_down_q6k MODELNAME load_row_down_q6k RTLNAME swiglu_load_row_down_q6k
    SUBMODULES {
      {MODELNAME swiglu_mul_11ns_14ns_24_1_1 RTLNAME swiglu_mul_11ns_14ns_24_1_1 BINDTYPE op TYPE mul IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME mac_blocks_down_q6k_Pipeline_MAC_Q6K MODELNAME mac_blocks_down_q6k_Pipeline_MAC_Q6K RTLNAME swiglu_mac_blocks_down_q6k_Pipeline_MAC_Q6K
    SUBMODULES {
      {MODELNAME swiglu_sparsemux_9_3_8_1_1 RTLNAME swiglu_sparsemux_9_3_8_1_1 BINDTYPE op TYPE sparsemux IMPL compactencoding_dontcare}
      {MODELNAME swiglu_sparsemux_33_4_128_1_1 RTLNAME swiglu_sparsemux_33_4_128_1_1 BINDTYPE op TYPE sparsemux IMPL compactencoding_dontcare}
    }
  }
  {SRCNAME mac_blocks_down_q6k_Pipeline_MAC_Q6K9 MODELNAME mac_blocks_down_q6k_Pipeline_MAC_Q6K9 RTLNAME swiglu_mac_blocks_down_q6k_Pipeline_MAC_Q6K9}
  {SRCNAME mac_blocks_down_q6k MODELNAME mac_blocks_down_q6k RTLNAME swiglu_mac_blocks_down_q6k
    SUBMODULES {
      {MODELNAME swiglu_mul_5ns_9ns_13_1_1 RTLNAME swiglu_mul_5ns_9ns_13_1_1 BINDTYPE op TYPE mul IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME swiglu_sitofp_32s_32_3_no_dsp_1 RTLNAME swiglu_sitofp_32s_32_3_no_dsp_1 BINDTYPE op TYPE sitofp IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME load_row_down_q4k_Pipeline_LOAD_DOWN_Q4K_VITIS_LOOP_332_1 MODELNAME load_row_down_q4k_Pipeline_LOAD_DOWN_Q4K_VITIS_LOOP_332_1 RTLNAME swiglu_load_row_down_q4k_Pipeline_LOAD_DOWN_Q4K_VITIS_LOOP_332_1}
  {SRCNAME load_row_down_q4k MODELNAME load_row_down_q4k RTLNAME swiglu_load_row_down_q4k}
  {SRCNAME mac_blocks_down_q4k5_Pipeline_UNPACK_HDR_DOWN MODELNAME mac_blocks_down_q4k5_Pipeline_UNPACK_HDR_DOWN RTLNAME swiglu_mac_blocks_down_q4k5_Pipeline_UNPACK_HDR_DOWN}
  {SRCNAME mac_blocks_down_q4k5_Pipeline_VITIS_LOOP_400_2_MAC_GROUP MODELNAME mac_blocks_down_q4k5_Pipeline_VITIS_LOOP_400_2_MAC_GROUP RTLNAME swiglu_mac_blocks_down_q4k5_Pipeline_VITIS_LOOP_400_2_MAC_GROUP
    SUBMODULES {
      {MODELNAME swiglu_sparsemux_9_2_6_1_1 RTLNAME swiglu_sparsemux_9_2_6_1_1 BINDTYPE op TYPE sparsemux IMPL compactencoding_dontcare}
      {MODELNAME swiglu_sparsemux_9_2_32_1_1 RTLNAME swiglu_sparsemux_9_2_32_1_1 BINDTYPE op TYPE sparsemux IMPL compactencoding_dontcare}
    }
  }
  {SRCNAME mac_blocks_down_q4k5_Pipeline_REDUCE_DOWN_Q4K MODELNAME mac_blocks_down_q4k5_Pipeline_REDUCE_DOWN_Q4K RTLNAME swiglu_mac_blocks_down_q4k5_Pipeline_REDUCE_DOWN_Q4K
    SUBMODULES {
      {MODELNAME swiglu_sparsemux_9_5_32_1_1 RTLNAME swiglu_sparsemux_9_5_32_1_1 BINDTYPE op TYPE sparsemux IMPL compactencoding_dontcare}
    }
  }
  {SRCNAME mac_blocks_down_q4k5 MODELNAME mac_blocks_down_q4k5 RTLNAME swiglu_mac_blocks_down_q4k5}
  {SRCNAME compute_output_Pipeline_1 MODELNAME compute_output_Pipeline_1 RTLNAME swiglu_compute_output_Pipeline_1}
  {SRCNAME compute_output MODELNAME compute_output RTLNAME swiglu_compute_output
    SUBMODULES {
      {MODELNAME swiglu_compute_output_out_local_RAM_1P_LUTRAM_1R1W RTLNAME swiglu_compute_output_out_local_RAM_1P_LUTRAM_1R1W BINDTYPE storage TYPE ram_1p IMPL lutram LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME swiglu_compute_output_row_buf_RAM_1P_LUTRAM_1R1W RTLNAME swiglu_compute_output_row_buf_RAM_1P_LUTRAM_1R1W BINDTYPE storage TYPE ram_1p IMPL lutram LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME swiglu_compute_output_row_buf_8_RAM_1P_LUTRAM_1R1W RTLNAME swiglu_compute_output_row_buf_8_RAM_1P_LUTRAM_1R1W BINDTYPE storage TYPE ram_1p IMPL lutram LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME swiglu MODELNAME swiglu RTLNAME swiglu IS_TOP 1
    SUBMODULES {
      {MODELNAME swiglu_x_local_1_RAM_1P_LUTRAM_1R1W_memcore RTLNAME swiglu_x_local_1_RAM_1P_LUTRAM_1R1W_memcore BINDTYPE storage TYPE ram_1p IMPL lutram LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME swiglu_x_local_1_RAM_1P_LUTRAM_1R1W RTLNAME swiglu_x_local_1_RAM_1P_LUTRAM_1R1W BINDTYPE storage TYPE ram_1p IMPL lutram LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME swiglu_X1_cache_RAM_2P_URAM_1R1W_memcore RTLNAME swiglu_X1_cache_RAM_2P_URAM_1R1W_memcore BINDTYPE storage TYPE ram_2p IMPL uram LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME swiglu_X1_cache_RAM_2P_URAM_1R1W RTLNAME swiglu_X1_cache_RAM_2P_URAM_1R1W BINDTYPE storage TYPE ram_2p IMPL uram LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME swiglu_gate_cache_RAM_2P_URAM_1R1W_memcore RTLNAME swiglu_gate_cache_RAM_2P_URAM_1R1W_memcore BINDTYPE storage TYPE ram_2p IMPL uram LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME swiglu_gate_cache_RAM_2P_URAM_1R1W RTLNAME swiglu_gate_cache_RAM_2P_URAM_1R1W BINDTYPE storage TYPE ram_2p IMPL uram LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME swiglu_fifo_w32_d2_S RTLNAME swiglu_fifo_w32_d2_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME gate_scale_U}
      {MODELNAME swiglu_gmem_W_m_axi RTLNAME swiglu_gmem_W_m_axi BINDTYPE interface TYPE adapter IMPL m_axi}
      {MODELNAME swiglu_gmem_V_m_axi RTLNAME swiglu_gmem_V_m_axi BINDTYPE interface TYPE adapter IMPL m_axi}
      {MODELNAME swiglu_gmem_Wd_m_axi RTLNAME swiglu_gmem_Wd_m_axi BINDTYPE interface TYPE adapter IMPL m_axi}
      {MODELNAME swiglu_gmem_x_m_axi RTLNAME swiglu_gmem_x_m_axi BINDTYPE interface TYPE adapter IMPL m_axi}
      {MODELNAME swiglu_gmem_out_m_axi RTLNAME swiglu_gmem_out_m_axi BINDTYPE interface TYPE adapter IMPL m_axi}
      {MODELNAME swiglu_CTRL_s_axi RTLNAME swiglu_CTRL_s_axi BINDTYPE interface TYPE interface_s_axilite}
    }
  }
}
