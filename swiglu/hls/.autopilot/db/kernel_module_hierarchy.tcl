set ModuleHierarchy {[{
"Name" : "swiglu", "RefName" : "swiglu","ID" : "0","Type" : "dataflow",
"SubInsts" : [
	{"Name" : "load_x_local_U0", "RefName" : "load_x_local","ID" : "1","Type" : "sequential",
		"SubLoops" : [
		{"Name" : "LOAD_X_VEC","RefName" : "LOAD_X_VEC","ID" : "2","Type" : "pipeline"},]},
	{"Name" : "compute_X1_U0", "RefName" : "compute_X1","ID" : "3","Type" : "sequential",
		"SubLoops" : [
		{"Name" : "COMPUTE_X1","RefName" : "COMPUTE_X1","ID" : "4","Type" : "no",
		"SubInsts" : [
		{"Name" : "grp_load_row_wv_fu_495", "RefName" : "load_row_wv","ID" : "5","Type" : "sequential",
				"SubInsts" : [
				{"Name" : "grp_load_row_wv_Pipeline_LOAD_BLOCK_LOAD_WORD_fu_97", "RefName" : "load_row_wv_Pipeline_LOAD_BLOCK_LOAD_WORD","ID" : "6","Type" : "sequential",
					"SubLoops" : [
					{"Name" : "LOAD_BLOCK_LOAD_WORD","RefName" : "LOAD_BLOCK_LOAD_WORD","ID" : "7","Type" : "pipeline"},]},]},
		{"Name" : "grp_mac_blocks_wv_k2_fu_511", "RefName" : "mac_blocks_wv_k2","ID" : "8","Type" : "sequential",
				"SubInsts" : [
				{"Name" : "grp_mac_blocks_wv_k2_Pipeline_UNPACK_HDR_K2_fu_2278", "RefName" : "mac_blocks_wv_k2_Pipeline_UNPACK_HDR_K2","ID" : "9","Type" : "sequential",
					"SubLoops" : [
					{"Name" : "UNPACK_HDR_K2","RefName" : "UNPACK_HDR_K2","ID" : "10","Type" : "pipeline",
					"SubInsts" : [
					{"Name" : "grp_fp16_to_fp32_fu_4036", "RefName" : "fp16_to_fp32","ID" : "11","Type" : "pipeline"},
					{"Name" : "grp_fp16_to_fp32_fu_4041", "RefName" : "fp16_to_fp32","ID" : "12","Type" : "pipeline"},
					{"Name" : "grp_fp16_to_fp32_fu_4046", "RefName" : "fp16_to_fp32","ID" : "13","Type" : "pipeline"},
					{"Name" : "grp_fp16_to_fp32_fu_4051", "RefName" : "fp16_to_fp32","ID" : "14","Type" : "pipeline"},]},]},
				{"Name" : "grp_mac_blocks_wv_k2_Pipeline_MAC_ALL_K2_fu_2602", "RefName" : "mac_blocks_wv_k2_Pipeline_MAC_ALL_K2","ID" : "15","Type" : "sequential",
					"SubLoops" : [
					{"Name" : "MAC_ALL_K2","RefName" : "MAC_ALL_K2","ID" : "16","Type" : "pipeline"},]},
				{"Name" : "grp_mac_blocks_wv_k2_Pipeline_REDUCE_K2_fu_3278", "RefName" : "mac_blocks_wv_k2_Pipeline_REDUCE_K2","ID" : "17","Type" : "sequential",
					"SubLoops" : [
					{"Name" : "REDUCE_K2","RefName" : "REDUCE_K2","ID" : "18","Type" : "pipeline"},]},]},]},]},
	{"Name" : "compute_X2_U0", "RefName" : "compute_X2","ID" : "19","Type" : "sequential",
		"SubLoops" : [
		{"Name" : "COMPUTE_X2","RefName" : "COMPUTE_X2","ID" : "20","Type" : "no",
		"SubInsts" : [
		{"Name" : "grp_load_row_wv_fu_495", "RefName" : "load_row_wv","ID" : "21","Type" : "sequential",
				"SubInsts" : [
				{"Name" : "grp_load_row_wv_Pipeline_LOAD_BLOCK_LOAD_WORD_fu_97", "RefName" : "load_row_wv_Pipeline_LOAD_BLOCK_LOAD_WORD","ID" : "22","Type" : "sequential",
					"SubLoops" : [
					{"Name" : "LOAD_BLOCK_LOAD_WORD","RefName" : "LOAD_BLOCK_LOAD_WORD","ID" : "23","Type" : "pipeline"},]},]},
		{"Name" : "grp_mac_blocks_wv_k2_fu_511", "RefName" : "mac_blocks_wv_k2","ID" : "24","Type" : "sequential",
				"SubInsts" : [
				{"Name" : "grp_mac_blocks_wv_k2_Pipeline_UNPACK_HDR_K2_fu_2278", "RefName" : "mac_blocks_wv_k2_Pipeline_UNPACK_HDR_K2","ID" : "25","Type" : "sequential",
					"SubLoops" : [
					{"Name" : "UNPACK_HDR_K2","RefName" : "UNPACK_HDR_K2","ID" : "26","Type" : "pipeline",
					"SubInsts" : [
					{"Name" : "grp_fp16_to_fp32_fu_4036", "RefName" : "fp16_to_fp32","ID" : "27","Type" : "pipeline"},
					{"Name" : "grp_fp16_to_fp32_fu_4041", "RefName" : "fp16_to_fp32","ID" : "28","Type" : "pipeline"},
					{"Name" : "grp_fp16_to_fp32_fu_4046", "RefName" : "fp16_to_fp32","ID" : "29","Type" : "pipeline"},
					{"Name" : "grp_fp16_to_fp32_fu_4051", "RefName" : "fp16_to_fp32","ID" : "30","Type" : "pipeline"},]},]},
				{"Name" : "grp_mac_blocks_wv_k2_Pipeline_MAC_ALL_K2_fu_2602", "RefName" : "mac_blocks_wv_k2_Pipeline_MAC_ALL_K2","ID" : "31","Type" : "sequential",
					"SubLoops" : [
					{"Name" : "MAC_ALL_K2","RefName" : "MAC_ALL_K2","ID" : "32","Type" : "pipeline"},]},
				{"Name" : "grp_mac_blocks_wv_k2_Pipeline_REDUCE_K2_fu_3278", "RefName" : "mac_blocks_wv_k2_Pipeline_REDUCE_K2","ID" : "33","Type" : "sequential",
					"SubLoops" : [
					{"Name" : "REDUCE_K2","RefName" : "REDUCE_K2","ID" : "34","Type" : "pipeline"},]},]},]},]},
	{"Name" : "gate_scale_U", "RefName" : "compute_gate","ID" : "35","Type" : "sequential",
		"SubInsts" : [
		{"Name" : "grp_compute_gate_Pipeline_GATE_PASS1_fu_88", "RefName" : "compute_gate_Pipeline_GATE_PASS1","ID" : "36","Type" : "sequential",
			"SubLoops" : [
			{"Name" : "GATE_PASS1","RefName" : "GATE_PASS1","ID" : "37","Type" : "pipeline"},]},
		{"Name" : "grp_compute_gate_Pipeline_GATE_PASS2_fu_106", "RefName" : "compute_gate_Pipeline_GATE_PASS2","ID" : "38","Type" : "sequential",
			"SubLoops" : [
			{"Name" : "GATE_PASS2","RefName" : "GATE_PASS2","ID" : "39","Type" : "pipeline"},]},]},
	{"Name" : "compute_output_U0", "RefName" : "compute_output","ID" : "40","Type" : "sequential",
		"SubInsts" : [
		{"Name" : "grp_compute_output_Pipeline_1_fu_564", "RefName" : "compute_output_Pipeline_1","ID" : "41","Type" : "sequential",
			"SubLoops" : [
			{"Name" : "Loop 1","RefName" : "Loop 1","ID" : "42","Type" : "pipeline"},]},],
		"SubLoops" : [
		{"Name" : "DOWN_Q4K","RefName" : "DOWN_Q4K","ID" : "43","Type" : "no",
		"SubInsts" : [
		{"Name" : "grp_load_row_down_q4k_fu_439", "RefName" : "load_row_down_q4k","ID" : "44","Type" : "sequential",
				"SubInsts" : [
				{"Name" : "grp_load_row_down_q4k_Pipeline_LOAD_DOWN_Q4K_fu_145", "RefName" : "load_row_down_q4k_Pipeline_LOAD_DOWN_Q4K","ID" : "45","Type" : "sequential",
					"SubLoops" : [
					{"Name" : "LOAD_DOWN_Q4K","RefName" : "LOAD_DOWN_Q4K","ID" : "46","Type" : "pipeline"},]},]},
		{"Name" : "grp_mac_blocks_down_q4k_k2_fu_479", "RefName" : "mac_blocks_down_q4k_k2","ID" : "47","Type" : "sequential",
				"SubInsts" : [
				{"Name" : "grp_mac_blocks_down_q4k_k2_Pipeline_UNPACK_HDR_K2_fu_6300", "RefName" : "mac_blocks_down_q4k_k2_Pipeline_UNPACK_HDR_K2","ID" : "48","Type" : "sequential",
					"SubLoops" : [
					{"Name" : "UNPACK_HDR_K2","RefName" : "UNPACK_HDR_K2","ID" : "49","Type" : "pipeline",
					"SubInsts" : [
					{"Name" : "grp_fp16_to_fp32_fu_15700", "RefName" : "fp16_to_fp32","ID" : "50","Type" : "pipeline"},
					{"Name" : "grp_fp16_to_fp32_fu_15705", "RefName" : "fp16_to_fp32","ID" : "51","Type" : "pipeline"},
					{"Name" : "grp_fp16_to_fp32_fu_15710", "RefName" : "fp16_to_fp32","ID" : "52","Type" : "pipeline"},
					{"Name" : "grp_fp16_to_fp32_fu_15715", "RefName" : "fp16_to_fp32","ID" : "53","Type" : "pipeline"},]},]},
				{"Name" : "grp_mac_blocks_down_q4k_k2_Pipeline_MAC_GRP_fu_7584", "RefName" : "mac_blocks_down_q4k_k2_Pipeline_MAC_GRP","ID" : "54","Type" : "sequential",
					"SubLoops" : [
					{"Name" : "MAC_GRP","RefName" : "MAC_GRP","ID" : "55","Type" : "pipeline"},]},
				{"Name" : "grp_mac_blocks_down_q4k_k2_Pipeline_REDUCE_GRP_fu_8020", "RefName" : "mac_blocks_down_q4k_k2_Pipeline_REDUCE_GRP","ID" : "56","Type" : "sequential",
					"SubLoops" : [
					{"Name" : "REDUCE_GRP","RefName" : "REDUCE_GRP","ID" : "57","Type" : "pipeline"},]},
				{"Name" : "grp_mac_blocks_down_q4k_k2_Pipeline_MAC_GRP6_fu_8186", "RefName" : "mac_blocks_down_q4k_k2_Pipeline_MAC_GRP6","ID" : "58","Type" : "sequential",
					"SubLoops" : [
					{"Name" : "MAC_GRP","RefName" : "MAC_GRP","ID" : "59","Type" : "pipeline"},]},
				{"Name" : "grp_mac_blocks_down_q4k_k2_Pipeline_REDUCE_GRP7_fu_8622", "RefName" : "mac_blocks_down_q4k_k2_Pipeline_REDUCE_GRP7","ID" : "60","Type" : "sequential",
					"SubLoops" : [
					{"Name" : "REDUCE_GRP","RefName" : "REDUCE_GRP","ID" : "61","Type" : "pipeline"},]},
				{"Name" : "grp_mac_blocks_down_q4k_k2_Pipeline_MAC_GRP8_fu_8790", "RefName" : "mac_blocks_down_q4k_k2_Pipeline_MAC_GRP8","ID" : "62","Type" : "sequential",
					"SubLoops" : [
					{"Name" : "MAC_GRP","RefName" : "MAC_GRP","ID" : "63","Type" : "pipeline"},]},
				{"Name" : "grp_mac_blocks_down_q4k_k2_Pipeline_REDUCE_GRP9_fu_9226", "RefName" : "mac_blocks_down_q4k_k2_Pipeline_REDUCE_GRP9","ID" : "64","Type" : "sequential",
					"SubLoops" : [
					{"Name" : "REDUCE_GRP","RefName" : "REDUCE_GRP","ID" : "65","Type" : "pipeline"},]},
				{"Name" : "grp_mac_blocks_down_q4k_k2_Pipeline_MAC_GRP10_fu_9394", "RefName" : "mac_blocks_down_q4k_k2_Pipeline_MAC_GRP10","ID" : "66","Type" : "sequential",
					"SubLoops" : [
					{"Name" : "MAC_GRP","RefName" : "MAC_GRP","ID" : "67","Type" : "pipeline"},]},
				{"Name" : "grp_mac_blocks_down_q4k_k2_Pipeline_REDUCE_GRP11_fu_9830", "RefName" : "mac_blocks_down_q4k_k2_Pipeline_REDUCE_GRP11","ID" : "68","Type" : "sequential",
					"SubLoops" : [
					{"Name" : "REDUCE_GRP","RefName" : "REDUCE_GRP","ID" : "69","Type" : "pipeline"},]},]},]},]},]
}]}