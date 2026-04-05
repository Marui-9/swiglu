set SynModuleInfo {
  {SRCNAME load_x_local MODELNAME load_x_local RTLNAME swiglu_load_x_local
    SUBMODULES {
      {MODELNAME swiglu_flow_control_loop_pipe RTLNAME swiglu_flow_control_loop_pipe BINDTYPE interface TYPE internal_upc_flow_control INSTNAME swiglu_flow_control_loop_pipe_U}
    }
  }
  {SRCNAME load_row_wv_Pipeline_LOAD_WV_VITIS_LOOP_95_1 MODELNAME load_row_wv_Pipeline_LOAD_WV_VITIS_LOOP_95_1 RTLNAME swiglu_load_row_wv_Pipeline_LOAD_WV_VITIS_LOOP_95_1
    SUBMODULES {
      {MODELNAME swiglu_flow_control_loop_pipe_sequential_init RTLNAME swiglu_flow_control_loop_pipe_sequential_init BINDTYPE interface TYPE internal_upc_flow_control INSTNAME swiglu_flow_control_loop_pipe_sequential_init_U}
    }
  }
  {SRCNAME load_row_wv MODELNAME load_row_wv RTLNAME swiglu_load_row_wv}
  {SRCNAME fp16_to_fp32 MODELNAME fp16_to_fp32 RTLNAME swiglu_fp16_to_fp32
    SUBMODULES {
      {MODELNAME swiglu_sparsemux_9_3_32_1_0 RTLNAME swiglu_sparsemux_9_3_32_1_0 BINDTYPE op TYPE sparsemux IMPL onehotencoding_realdef}
    }
  }
  {SRCNAME mac_blocks_wv_k1_Pipeline_UNPACK_HDR_WV_K1 MODELNAME mac_blocks_wv_k1_Pipeline_UNPACK_HDR_WV_K1 RTLNAME swiglu_mac_blocks_wv_k1_Pipeline_UNPACK_HDR_WV_K1
    SUBMODULES {
      {MODELNAME swiglu_sparsemux_17_3_128_1_1 RTLNAME swiglu_sparsemux_17_3_128_1_1 BINDTYPE op TYPE sparsemux IMPL compactencoding_dontcare}
    }
  }
  {SRCNAME mac_blocks_wv_k1_Pipeline_MAC_ALL_K1 MODELNAME mac_blocks_wv_k1_Pipeline_MAC_ALL_K1 RTLNAME swiglu_mac_blocks_wv_k1_Pipeline_MAC_ALL_K1
    SUBMODULES {
      {MODELNAME swiglu_sparsemux_33_4_8_1_1 RTLNAME swiglu_sparsemux_33_4_8_1_1 BINDTYPE op TYPE sparsemux IMPL compactencoding_dontcare}
      {MODELNAME swiglu_partselect_8ns_128ns_7ns_8_1_1 RTLNAME swiglu_partselect_8ns_128ns_7ns_8_1_1 BINDTYPE op TYPE partselect IMPL auto}
      {MODELNAME swiglu_sparsemux_17_3_6_1_1 RTLNAME swiglu_sparsemux_17_3_6_1_1 BINDTYPE op TYPE sparsemux IMPL compactencoding_dontcare}
      {MODELNAME swiglu_mul_8s_4ns_12_1_1 RTLNAME swiglu_mul_8s_4ns_12_1_1 BINDTYPE op TYPE mul IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME swiglu_sparsemux_17_3_32_1_1 RTLNAME swiglu_sparsemux_17_3_32_1_1 BINDTYPE op TYPE sparsemux IMPL compactencoding_dontcare}
      {MODELNAME swiglu_mac_muladd_8s_6ns_32s_32_4_1 RTLNAME swiglu_mac_muladd_8s_6ns_32s_32_4_1 BINDTYPE op TYPE all IMPL dsp_slice LATENCY 3}
      {MODELNAME swiglu_mac_muladd_12s_6ns_32s_32_4_1 RTLNAME swiglu_mac_muladd_12s_6ns_32s_32_4_1 BINDTYPE op TYPE all IMPL dsp_slice LATENCY 3}
    }
  }
  {SRCNAME mac_blocks_wv_k1_Pipeline_REDUCE_WV_K1 MODELNAME mac_blocks_wv_k1_Pipeline_REDUCE_WV_K1 RTLNAME swiglu_mac_blocks_wv_k1_Pipeline_REDUCE_WV_K1
    SUBMODULES {
      {MODELNAME swiglu_fpext_32ns_64_2_no_dsp_1 RTLNAME swiglu_fpext_32ns_64_2_no_dsp_1 BINDTYPE op TYPE fpext IMPL auto LATENCY 1 ALLOW_PRAGMA 1}
      {MODELNAME swiglu_mul_50s_32s_80_5_1 RTLNAME swiglu_mul_50s_32s_80_5_1 BINDTYPE op TYPE mul IMPL auto LATENCY 4 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME mac_blocks_wv_k1 MODELNAME mac_blocks_wv_k1 RTLNAME swiglu_mac_blocks_wv_k1
    SUBMODULES {
      {MODELNAME swiglu_fmul_32ns_32ns_32_7_max_dsp_1 RTLNAME swiglu_fmul_32ns_32ns_32_7_max_dsp_1 BINDTYPE op TYPE fmul IMPL maxdsp LATENCY 6 ALLOW_PRAGMA 1}
      {MODELNAME swiglu_ctlz_56_56_1_1 RTLNAME swiglu_ctlz_56_56_1_1 BINDTYPE op TYPE ctlz IMPL auto}
      {MODELNAME swiglu_bitselect_1ns_56ns_6ns_1_1_1 RTLNAME swiglu_bitselect_1ns_56ns_6ns_1_1_1 BINDTYPE op TYPE bitselect IMPL auto}
    }
  }
  {SRCNAME compute_X1 MODELNAME compute_X1 RTLNAME swiglu_compute_X1
    SUBMODULES {
      {MODELNAME swiglu_fadd_32ns_32ns_32_11_full_dsp_1 RTLNAME swiglu_fadd_32ns_32ns_32_11_full_dsp_1 BINDTYPE op TYPE fadd IMPL fulldsp LATENCY 10 ALLOW_PRAGMA 1}
      {MODELNAME swiglu_fcmp_32ns_32ns_1_3_no_dsp_1 RTLNAME swiglu_fcmp_32ns_32ns_1_3_no_dsp_1 BINDTYPE op TYPE fcmp IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME swiglu_compute_X1_row_buf_RAM_1P_BRAM_1R1W RTLNAME swiglu_compute_X1_row_buf_RAM_1P_BRAM_1R1W BINDTYPE storage TYPE ram_1p IMPL bram LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME compute_X2 MODELNAME compute_X2 RTLNAME swiglu_compute_X2}
  {SRCNAME compute_gate_Pipeline_GATE_PASS1 MODELNAME compute_gate_Pipeline_GATE_PASS1 RTLNAME swiglu_compute_gate_Pipeline_GATE_PASS1}
  {SRCNAME compute_gate_Pipeline_GATE_PASS2 MODELNAME compute_gate_Pipeline_GATE_PASS2 RTLNAME swiglu_compute_gate_Pipeline_GATE_PASS2}
  {SRCNAME compute_gate MODELNAME compute_gate RTLNAME swiglu_compute_gate
    SUBMODULES {
      {MODELNAME swiglu_fdiv_32ns_32ns_32_30_no_dsp_1 RTLNAME swiglu_fdiv_32ns_32ns_32_30_no_dsp_1 BINDTYPE op TYPE fdiv IMPL fabric LATENCY 29 ALLOW_PRAGMA 1}
      {MODELNAME swiglu_sitofp_32s_32_7_no_dsp_1 RTLNAME swiglu_sitofp_32s_32_7_no_dsp_1 BINDTYPE op TYPE sitofp IMPL auto LATENCY 6 ALLOW_PRAGMA 1}
      {MODELNAME swiglu_compute_gate_sigmoid_lut_ROM_1P_BRAM_1R RTLNAME swiglu_compute_gate_sigmoid_lut_ROM_1P_BRAM_1R BINDTYPE storage TYPE rom_1p IMPL bram LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME load_row_down_q6k_Pipeline_LOAD_QL MODELNAME load_row_down_q6k_Pipeline_LOAD_QL RTLNAME swiglu_load_row_down_q6k_Pipeline_LOAD_QL}
  {SRCNAME load_row_down_q6k_Pipeline_LOAD_QH MODELNAME load_row_down_q6k_Pipeline_LOAD_QH RTLNAME swiglu_load_row_down_q6k_Pipeline_LOAD_QH}
  {SRCNAME load_row_down_q6k_Pipeline_LOAD_SC MODELNAME load_row_down_q6k_Pipeline_LOAD_SC RTLNAME swiglu_load_row_down_q6k_Pipeline_LOAD_SC}
  {SRCNAME load_row_down_q6k_Pipeline_LOAD_D MODELNAME load_row_down_q6k_Pipeline_LOAD_D RTLNAME swiglu_load_row_down_q6k_Pipeline_LOAD_D}
  {SRCNAME load_row_down_q6k MODELNAME load_row_down_q6k RTLNAME swiglu_load_row_down_q6k
    SUBMODULES {
      {MODELNAME swiglu_mul_11ns_14ns_24_1_1 RTLNAME swiglu_mul_11ns_14ns_24_1_1 BINDTYPE op TYPE mul IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME load_row_down_q6k.1_Pipeline_LOAD_QL MODELNAME load_row_down_q6k_1_Pipeline_LOAD_QL RTLNAME swiglu_load_row_down_q6k_1_Pipeline_LOAD_QL}
  {SRCNAME load_row_down_q6k.1_Pipeline_LOAD_QH MODELNAME load_row_down_q6k_1_Pipeline_LOAD_QH RTLNAME swiglu_load_row_down_q6k_1_Pipeline_LOAD_QH}
  {SRCNAME load_row_down_q6k.1_Pipeline_LOAD_SC MODELNAME load_row_down_q6k_1_Pipeline_LOAD_SC RTLNAME swiglu_load_row_down_q6k_1_Pipeline_LOAD_SC}
  {SRCNAME load_row_down_q6k.1_Pipeline_LOAD_D MODELNAME load_row_down_q6k_1_Pipeline_LOAD_D RTLNAME swiglu_load_row_down_q6k_1_Pipeline_LOAD_D}
  {SRCNAME load_row_down_q6k.1 MODELNAME load_row_down_q6k_1 RTLNAME swiglu_load_row_down_q6k_1}
  {SRCNAME load_pair_q6k MODELNAME load_pair_q6k RTLNAME swiglu_load_pair_q6k}
  {SRCNAME mac_blocks_down_q6k5_Pipeline_Q6K_MAC_GROUP MODELNAME mac_blocks_down_q6k5_Pipeline_Q6K_MAC_GROUP RTLNAME swiglu_mac_blocks_down_q6k5_Pipeline_Q6K_MAC_GROUP
    SUBMODULES {
      {MODELNAME swiglu_mul_8s_8s_16_1_1 RTLNAME swiglu_mul_8s_8s_16_1_1 BINDTYPE op TYPE mul IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME swiglu_mul_8s_6s_14_1_1 RTLNAME swiglu_mul_8s_6s_14_1_1 BINDTYPE op TYPE mul IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME swiglu_mac_muladd_16s_6s_32s_32_4_1 RTLNAME swiglu_mac_muladd_16s_6s_32s_32_4_1 BINDTYPE op TYPE all IMPL dsp_slice LATENCY 3}
      {MODELNAME swiglu_mac_muladd_14s_8s_32s_32_4_1 RTLNAME swiglu_mac_muladd_14s_8s_32s_32_4_1 BINDTYPE op TYPE all IMPL dsp_slice LATENCY 3}
    }
  }
  {SRCNAME mac_blocks_down_q6k5_Pipeline_VITIS_LOOP_614_4 MODELNAME mac_blocks_down_q6k5_Pipeline_VITIS_LOOP_614_4 RTLNAME swiglu_mac_blocks_down_q6k5_Pipeline_VITIS_LOOP_614_4
    SUBMODULES {
      {MODELNAME swiglu_mul_50s_32s_82_5_1 RTLNAME swiglu_mul_50s_32s_82_5_1 BINDTYPE op TYPE mul IMPL auto LATENCY 4 ALLOW_PRAGMA 1}
      {MODELNAME swiglu_sparsemux_9_2_32_1_1 RTLNAME swiglu_sparsemux_9_2_32_1_1 BINDTYPE op TYPE sparsemux IMPL compactencoding_dontcare}
      {MODELNAME swiglu_sparsemux_65_5_32_1_1 RTLNAME swiglu_sparsemux_65_5_32_1_1 BINDTYPE op TYPE sparsemux IMPL compactencoding_dontcare}
    }
  }
  {SRCNAME mac_blocks_down_q6k5 MODELNAME mac_blocks_down_q6k5 RTLNAME swiglu_mac_blocks_down_q6k5}
  {SRCNAME compute_output_Pipeline_1 MODELNAME compute_output_Pipeline_1 RTLNAME swiglu_compute_output_Pipeline_1}
  {SRCNAME load_row_down_q4k_Pipeline_LOAD_DOWN_Q4K_VITIS_LOOP_337_1 MODELNAME load_row_down_q4k_Pipeline_LOAD_DOWN_Q4K_VITIS_LOOP_337_1 RTLNAME swiglu_load_row_down_q4k_Pipeline_LOAD_DOWN_Q4K_VITIS_LOOP_337_1}
  {SRCNAME load_row_down_q4k MODELNAME load_row_down_q4k RTLNAME swiglu_load_row_down_q4k}
  {SRCNAME mac_blocks_down_q4k7_Pipeline_UNPACK_HDR_DOWN MODELNAME mac_blocks_down_q4k7_Pipeline_UNPACK_HDR_DOWN RTLNAME swiglu_mac_blocks_down_q4k7_Pipeline_UNPACK_HDR_DOWN}
  {SRCNAME mac_blocks_down_q4k7_Pipeline_MAC_GROUP MODELNAME mac_blocks_down_q4k7_Pipeline_MAC_GROUP RTLNAME swiglu_mac_blocks_down_q4k7_Pipeline_MAC_GROUP
    SUBMODULES {
      {MODELNAME swiglu_sparsemux_9_2_6_1_1 RTLNAME swiglu_sparsemux_9_2_6_1_1 BINDTYPE op TYPE sparsemux IMPL compactencoding_dontcare}
    }
  }
  {SRCNAME mac_blocks_down_q4k7_Pipeline_REDUCE_G MODELNAME mac_blocks_down_q4k7_Pipeline_REDUCE_G RTLNAME swiglu_mac_blocks_down_q4k7_Pipeline_REDUCE_G}
  {SRCNAME mac_blocks_down_q4k7 MODELNAME mac_blocks_down_q4k7 RTLNAME swiglu_mac_blocks_down_q4k7}
  {SRCNAME compute_output_Pipeline_2 MODELNAME compute_output_Pipeline_2 RTLNAME swiglu_compute_output_Pipeline_2}
  {SRCNAME compute_output MODELNAME compute_output RTLNAME swiglu_compute_output
    SUBMODULES {
      {MODELNAME swiglu_compute_output_out_local_RAM_1P_BRAM_1R1W RTLNAME swiglu_compute_output_out_local_RAM_1P_BRAM_1R1W BINDTYPE storage TYPE ram_1p IMPL bram LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME swiglu_compute_output_rb0_RAM_1P_BRAM_1R1W RTLNAME swiglu_compute_output_rb0_RAM_1P_BRAM_1R1W BINDTYPE storage TYPE ram_1p IMPL bram LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME swiglu_compute_output_ql_buf0_RAM_1P_URAM_1R1W RTLNAME swiglu_compute_output_ql_buf0_RAM_1P_URAM_1R1W BINDTYPE storage TYPE ram_1p IMPL uram LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME swiglu_compute_output_qh_buf0_RAM_1P_URAM_1R1W RTLNAME swiglu_compute_output_qh_buf0_RAM_1P_URAM_1R1W BINDTYPE storage TYPE ram_1p IMPL uram LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME swiglu MODELNAME swiglu RTLNAME swiglu IS_TOP 1
    SUBMODULES {
      {MODELNAME swiglu_x_local_1_RAM_1P_LUTRAM_1R1W_memcore RTLNAME swiglu_x_local_1_RAM_1P_LUTRAM_1R1W_memcore BINDTYPE storage TYPE ram_1p IMPL lutram LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME swiglu_x_local_1_RAM_1P_LUTRAM_1R1W RTLNAME swiglu_x_local_1_RAM_1P_LUTRAM_1R1W BINDTYPE storage TYPE ram_1p IMPL lutram LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME swiglu_X1_cache_RAM_2P_BRAM_1R1W_memcore RTLNAME swiglu_X1_cache_RAM_2P_BRAM_1R1W_memcore BINDTYPE storage TYPE ram_2p IMPL bram LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME swiglu_X1_cache_RAM_2P_BRAM_1R1W RTLNAME swiglu_X1_cache_RAM_2P_BRAM_1R1W BINDTYPE storage TYPE ram_2p IMPL bram LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME swiglu_gate_cache_RAM_1P_URAM_1R1W_memcore RTLNAME swiglu_gate_cache_RAM_1P_URAM_1R1W_memcore BINDTYPE storage TYPE ram_1p IMPL uram LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME swiglu_gate_cache_RAM_1P_URAM_1R1W RTLNAME swiglu_gate_cache_RAM_1P_URAM_1R1W BINDTYPE storage TYPE ram_1p IMPL uram LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME swiglu_fifo_w32_d2_S RTLNAME swiglu_fifo_w32_d2_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME gate_scale_U}
      {MODELNAME swiglu_gmem_W_m_axi RTLNAME swiglu_gmem_W_m_axi BINDTYPE interface TYPE adapter IMPL m_axi}
      {MODELNAME swiglu_gmem_V_m_axi RTLNAME swiglu_gmem_V_m_axi BINDTYPE interface TYPE adapter IMPL m_axi}
      {MODELNAME swiglu_gmem_Wd_m_axi RTLNAME swiglu_gmem_Wd_m_axi BINDTYPE interface TYPE adapter IMPL m_axi}
      {MODELNAME swiglu_gmem_Wd2_m_axi RTLNAME swiglu_gmem_Wd2_m_axi BINDTYPE interface TYPE adapter IMPL m_axi}
      {MODELNAME swiglu_gmem_x_m_axi RTLNAME swiglu_gmem_x_m_axi BINDTYPE interface TYPE adapter IMPL m_axi}
      {MODELNAME swiglu_gmem_out_m_axi RTLNAME swiglu_gmem_out_m_axi BINDTYPE interface TYPE adapter IMPL m_axi}
      {MODELNAME swiglu_CTRL_s_axi RTLNAME swiglu_CTRL_s_axi BINDTYPE interface TYPE interface_s_axilite}
    }
  }
}
