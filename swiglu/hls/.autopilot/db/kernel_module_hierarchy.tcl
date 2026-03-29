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
		{"Name" : "grp_load_row_wv_fu_393", "RefName" : "load_row_wv","ID" : "5","Type" : "sequential",
				"SubInsts" : [
				{"Name" : "grp_load_row_wv_Pipeline_LOAD_WV_VITIS_LOOP_101_1_fu_97", "RefName" : "load_row_wv_Pipeline_LOAD_WV_VITIS_LOOP_101_1","ID" : "6","Type" : "sequential",
					"SubLoops" : [
					{"Name" : "LOAD_WV_VITIS_LOOP_101_1","RefName" : "LOAD_WV_VITIS_LOOP_101_1","ID" : "7","Type" : "pipeline"},]},]},
		{"Name" : "grp_mac_blocks_wv_fu_409", "RefName" : "mac_blocks_wv","ID" : "8","Type" : "sequential",
				"SubInsts" : [
				{"Name" : "grp_mac_blocks_wv_Pipeline_UNPACK_HDR_WV_fu_1502", "RefName" : "mac_blocks_wv_Pipeline_UNPACK_HDR_WV","ID" : "9","Type" : "sequential",
					"SubLoops" : [
					{"Name" : "UNPACK_HDR_WV","RefName" : "UNPACK_HDR_WV","ID" : "10","Type" : "pipeline",
					"SubInsts" : [
					{"Name" : "grp_fp16_to_fp32_fu_2102", "RefName" : "fp16_to_fp32","ID" : "11","Type" : "pipeline"},
					{"Name" : "grp_fp16_to_fp32_fu_2107", "RefName" : "fp16_to_fp32","ID" : "12","Type" : "pipeline"},]},]},
				{"Name" : "grp_mac_blocks_wv_Pipeline_MAC_ALL_BLOCKS_fu_1666", "RefName" : "mac_blocks_wv_Pipeline_MAC_ALL_BLOCKS","ID" : "13","Type" : "sequential",
					"SubLoops" : [
					{"Name" : "MAC_ALL_BLOCKS","RefName" : "MAC_ALL_BLOCKS","ID" : "14","Type" : "pipeline"},]},]},]},]},
	{"Name" : "compute_X2_U0", "RefName" : "compute_X2","ID" : "15","Type" : "sequential",
		"SubLoops" : [
		{"Name" : "COMPUTE_X2","RefName" : "COMPUTE_X2","ID" : "16","Type" : "no",
		"SubInsts" : [
		{"Name" : "grp_load_row_wv_fu_393", "RefName" : "load_row_wv","ID" : "17","Type" : "sequential",
				"SubInsts" : [
				{"Name" : "grp_load_row_wv_Pipeline_LOAD_WV_VITIS_LOOP_101_1_fu_97", "RefName" : "load_row_wv_Pipeline_LOAD_WV_VITIS_LOOP_101_1","ID" : "18","Type" : "sequential",
					"SubLoops" : [
					{"Name" : "LOAD_WV_VITIS_LOOP_101_1","RefName" : "LOAD_WV_VITIS_LOOP_101_1","ID" : "19","Type" : "pipeline"},]},]},
		{"Name" : "grp_mac_blocks_wv_fu_409", "RefName" : "mac_blocks_wv","ID" : "20","Type" : "sequential",
				"SubInsts" : [
				{"Name" : "grp_mac_blocks_wv_Pipeline_UNPACK_HDR_WV_fu_1502", "RefName" : "mac_blocks_wv_Pipeline_UNPACK_HDR_WV","ID" : "21","Type" : "sequential",
					"SubLoops" : [
					{"Name" : "UNPACK_HDR_WV","RefName" : "UNPACK_HDR_WV","ID" : "22","Type" : "pipeline",
					"SubInsts" : [
					{"Name" : "grp_fp16_to_fp32_fu_2102", "RefName" : "fp16_to_fp32","ID" : "23","Type" : "pipeline"},
					{"Name" : "grp_fp16_to_fp32_fu_2107", "RefName" : "fp16_to_fp32","ID" : "24","Type" : "pipeline"},]},]},
				{"Name" : "grp_mac_blocks_wv_Pipeline_MAC_ALL_BLOCKS_fu_1666", "RefName" : "mac_blocks_wv_Pipeline_MAC_ALL_BLOCKS","ID" : "25","Type" : "sequential",
					"SubLoops" : [
					{"Name" : "MAC_ALL_BLOCKS","RefName" : "MAC_ALL_BLOCKS","ID" : "26","Type" : "pipeline"},]},]},]},]},
	{"Name" : "gate_scale_U", "RefName" : "compute_gate","ID" : "27","Type" : "sequential",
		"SubInsts" : [
		{"Name" : "grp_compute_gate_Pipeline_GATE_PASS1_fu_142", "RefName" : "compute_gate_Pipeline_GATE_PASS1","ID" : "28","Type" : "sequential",
			"SubLoops" : [
			{"Name" : "GATE_PASS1","RefName" : "GATE_PASS1","ID" : "29","Type" : "pipeline"},]},
		{"Name" : "grp_compute_gate_Pipeline_GATE_PASS2_fu_162", "RefName" : "compute_gate_Pipeline_GATE_PASS2","ID" : "30","Type" : "sequential",
			"SubLoops" : [
			{"Name" : "GATE_PASS2","RefName" : "GATE_PASS2","ID" : "31","Type" : "pipeline"},]},]},
	{"Name" : "compute_output_U0", "RefName" : "compute_output","ID" : "32","Type" : "sequential",
		"SubInsts" : [
		{"Name" : "grp_compute_output_Pipeline_1_fu_665", "RefName" : "compute_output_Pipeline_1","ID" : "33","Type" : "sequential",
			"SubLoops" : [
			{"Name" : "Loop 1","RefName" : "Loop 1","ID" : "34","Type" : "pipeline"},]},],
		"SubLoops" : [
		{"Name" : "DOWN_Q4K","RefName" : "DOWN_Q4K","ID" : "35","Type" : "no",
		"SubInsts" : [
		{"Name" : "grp_load_row_down_q4k_fu_524", "RefName" : "load_row_down_q4k","ID" : "36","Type" : "sequential",
				"SubInsts" : [
				{"Name" : "grp_load_row_down_q4k_Pipeline_LOAD_DOWN_Q4K_VITIS_LOOP_318_1_fu_145", "RefName" : "load_row_down_q4k_Pipeline_LOAD_DOWN_Q4K_VITIS_LOOP_318_1","ID" : "37","Type" : "sequential",
					"SubLoops" : [
					{"Name" : "LOAD_DOWN_Q4K_VITIS_LOOP_318_1","RefName" : "LOAD_DOWN_Q4K_VITIS_LOOP_318_1","ID" : "38","Type" : "pipeline"},]},]},
		{"Name" : "grp_mac_blocks_down_q4k_fu_564", "RefName" : "mac_blocks_down_q4k","ID" : "39","Type" : "sequential",
				"SubInsts" : [
				{"Name" : "grp_mac_blocks_down_q4k_Pipeline_UNPACK_HDR_DOWN_fu_4966", "RefName" : "mac_blocks_down_q4k_Pipeline_UNPACK_HDR_DOWN","ID" : "40","Type" : "sequential",
					"SubLoops" : [
					{"Name" : "UNPACK_HDR_DOWN","RefName" : "UNPACK_HDR_DOWN","ID" : "41","Type" : "pipeline",
					"SubInsts" : [
					{"Name" : "fp16_to_fp32", "RefName" : "fp16_to_fp32","ID" : "42","Type" : "pipeline"},
					{"Name" : "grp_fp16_to_fp32_fu_7963", "RefName" : "fp16_to_fp32","ID" : "43","Type" : "pipeline"},]},]},
				{"Name" : "grp_mac_blocks_down_q4k_Pipeline_MAC_BLOCKS_G0_fu_5610", "RefName" : "mac_blocks_down_q4k_Pipeline_MAC_BLOCKS_G0","ID" : "44","Type" : "sequential",
					"SubLoops" : [
					{"Name" : "MAC_BLOCKS_G0","RefName" : "MAC_BLOCKS_G0","ID" : "45","Type" : "pipeline"},]},
				{"Name" : "grp_mac_blocks_down_q4k_Pipeline_MAC_BLOCKS_G1_fu_5902", "RefName" : "mac_blocks_down_q4k_Pipeline_MAC_BLOCKS_G1","ID" : "46","Type" : "sequential",
					"SubLoops" : [
					{"Name" : "MAC_BLOCKS_G1","RefName" : "MAC_BLOCKS_G1","ID" : "47","Type" : "pipeline"},]},
				{"Name" : "grp_mac_blocks_down_q4k_Pipeline_MAC_BLOCKS_G2_fu_6194", "RefName" : "mac_blocks_down_q4k_Pipeline_MAC_BLOCKS_G2","ID" : "48","Type" : "sequential",
					"SubLoops" : [
					{"Name" : "MAC_BLOCKS_G2","RefName" : "MAC_BLOCKS_G2","ID" : "49","Type" : "pipeline"},]},
				{"Name" : "grp_mac_blocks_down_q4k_Pipeline_MAC_BLOCKS_G3_fu_6486", "RefName" : "mac_blocks_down_q4k_Pipeline_MAC_BLOCKS_G3","ID" : "50","Type" : "sequential",
					"SubLoops" : [
					{"Name" : "MAC_BLOCKS_G3","RefName" : "MAC_BLOCKS_G3","ID" : "51","Type" : "pipeline"},]},]},]},
		{"Name" : "DOWN_Q6K","RefName" : "DOWN_Q6K","ID" : "52","Type" : "no",
		"SubInsts" : [
		{"Name" : "grp_load_row_down_q6k_fu_415", "RefName" : "load_row_down_q6k","ID" : "53","Type" : "sequential",
				"SubInsts" : [
				{"Name" : "grp_load_row_down_q6k_Pipeline_LOAD_DOWN_Q6K_fu_99", "RefName" : "load_row_down_q6k_Pipeline_LOAD_DOWN_Q6K","ID" : "54","Type" : "sequential",
					"SubLoops" : [
					{"Name" : "LOAD_DOWN_Q6K","RefName" : "LOAD_DOWN_Q6K","ID" : "55","Type" : "pipeline"},]},]},
		{"Name" : "grp_mac_blocks_down_q6k_fu_439", "RefName" : "mac_blocks_down_q6k","ID" : "56","Type" : "sequential",
				"SubLoops" : [
				{"Name" : "VITIS_LOOP_468_1","RefName" : "VITIS_LOOP_468_1","ID" : "57","Type" : "no",
				"SubInsts" : [
				{"Name" : "grp_mac_blocks_down_q6k_Pipeline_1_fu_1016", "RefName" : "mac_blocks_down_q6k_Pipeline_1","ID" : "58","Type" : "sequential",
						"SubLoops" : [
						{"Name" : "Loop 1","RefName" : "Loop 1","ID" : "59","Type" : "pipeline"},]},
				{"Name" : "grp_mac_blocks_down_q6k_Pipeline_MAC_Q6K_fu_1028", "RefName" : "mac_blocks_down_q6k_Pipeline_MAC_Q6K","ID" : "60","Type" : "sequential",
						"SubLoops" : [
						{"Name" : "MAC_Q6K","RefName" : "MAC_Q6K","ID" : "61","Type" : "pipeline"},]},
				{"Name" : "fp16_to_fp32", "RefName" : "fp16_to_fp32","ID" : "62","Type" : "pipeline"},
				{"Name" : "grp_mac_blocks_down_q6k_Pipeline_3_fu_1096", "RefName" : "mac_blocks_down_q6k_Pipeline_3","ID" : "63","Type" : "sequential",
						"SubLoops" : [
						{"Name" : "Loop 1","RefName" : "Loop 1","ID" : "64","Type" : "pipeline"},]},
				{"Name" : "grp_mac_blocks_down_q6k_Pipeline_MAC_Q6K1_fu_1108", "RefName" : "mac_blocks_down_q6k_Pipeline_MAC_Q6K1","ID" : "65","Type" : "sequential",
						"SubLoops" : [
						{"Name" : "MAC_Q6K","RefName" : "MAC_Q6K","ID" : "66","Type" : "pipeline"},]},
				{"Name" : "grp_mac_blocks_down_q6k_Pipeline_5_fu_1171", "RefName" : "mac_blocks_down_q6k_Pipeline_5","ID" : "67","Type" : "sequential",
						"SubLoops" : [
						{"Name" : "Loop 1","RefName" : "Loop 1","ID" : "68","Type" : "pipeline"},]},
				{"Name" : "grp_mac_blocks_down_q6k_Pipeline_MAC_Q6K2_fu_1183", "RefName" : "mac_blocks_down_q6k_Pipeline_MAC_Q6K2","ID" : "69","Type" : "sequential",
						"SubLoops" : [
						{"Name" : "MAC_Q6K","RefName" : "MAC_Q6K","ID" : "70","Type" : "pipeline"},]},
				{"Name" : "grp_mac_blocks_down_q6k_Pipeline_7_fu_1246", "RefName" : "mac_blocks_down_q6k_Pipeline_7","ID" : "71","Type" : "sequential",
						"SubLoops" : [
						{"Name" : "Loop 1","RefName" : "Loop 1","ID" : "72","Type" : "pipeline"},]},
				{"Name" : "grp_mac_blocks_down_q6k_Pipeline_MAC_Q6K3_fu_1258", "RefName" : "mac_blocks_down_q6k_Pipeline_MAC_Q6K3","ID" : "73","Type" : "sequential",
						"SubLoops" : [
						{"Name" : "MAC_Q6K","RefName" : "MAC_Q6K","ID" : "74","Type" : "pipeline"},]},]},]},]},]},]
}]}