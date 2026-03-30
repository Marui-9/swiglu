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
		{"Name" : "grp_load_row_wv_fu_391", "RefName" : "load_row_wv","ID" : "5","Type" : "sequential",
				"SubInsts" : [
				{"Name" : "grp_load_row_wv_Pipeline_LOAD_WV_VITIS_LOOP_102_1_fu_97", "RefName" : "load_row_wv_Pipeline_LOAD_WV_VITIS_LOOP_102_1","ID" : "6","Type" : "sequential",
					"SubLoops" : [
					{"Name" : "LOAD_WV_VITIS_LOOP_102_1","RefName" : "LOAD_WV_VITIS_LOOP_102_1","ID" : "7","Type" : "pipeline"},]},]},
		{"Name" : "grp_mac_blocks_wv_fu_407", "RefName" : "mac_blocks_wv","ID" : "8","Type" : "sequential",
				"SubInsts" : [
				{"Name" : "grp_mac_blocks_wv_Pipeline_UNPACK_HDR_WV_fu_1500", "RefName" : "mac_blocks_wv_Pipeline_UNPACK_HDR_WV","ID" : "9","Type" : "sequential",
					"SubLoops" : [
					{"Name" : "UNPACK_HDR_WV","RefName" : "UNPACK_HDR_WV","ID" : "10","Type" : "pipeline",
					"SubInsts" : [
					{"Name" : "grp_fp16_to_fp32_fu_2102", "RefName" : "fp16_to_fp32","ID" : "11","Type" : "pipeline"},
					{"Name" : "grp_fp16_to_fp32_fu_2107", "RefName" : "fp16_to_fp32","ID" : "12","Type" : "pipeline"},]},]},
				{"Name" : "grp_mac_blocks_wv_Pipeline_MAC_ALL_BLOCKS_fu_1664", "RefName" : "mac_blocks_wv_Pipeline_MAC_ALL_BLOCKS","ID" : "13","Type" : "sequential",
					"SubLoops" : [
					{"Name" : "MAC_ALL_BLOCKS","RefName" : "MAC_ALL_BLOCKS","ID" : "14","Type" : "pipeline"},]},]},]},]},
	{"Name" : "compute_X2_U0", "RefName" : "compute_X2","ID" : "15","Type" : "sequential",
		"SubLoops" : [
		{"Name" : "COMPUTE_X2","RefName" : "COMPUTE_X2","ID" : "16","Type" : "no",
		"SubInsts" : [
		{"Name" : "grp_load_row_wv_fu_391", "RefName" : "load_row_wv","ID" : "17","Type" : "sequential",
				"SubInsts" : [
				{"Name" : "grp_load_row_wv_Pipeline_LOAD_WV_VITIS_LOOP_102_1_fu_97", "RefName" : "load_row_wv_Pipeline_LOAD_WV_VITIS_LOOP_102_1","ID" : "18","Type" : "sequential",
					"SubLoops" : [
					{"Name" : "LOAD_WV_VITIS_LOOP_102_1","RefName" : "LOAD_WV_VITIS_LOOP_102_1","ID" : "19","Type" : "pipeline"},]},]},
		{"Name" : "grp_mac_blocks_wv_fu_407", "RefName" : "mac_blocks_wv","ID" : "20","Type" : "sequential",
				"SubInsts" : [
				{"Name" : "grp_mac_blocks_wv_Pipeline_UNPACK_HDR_WV_fu_1500", "RefName" : "mac_blocks_wv_Pipeline_UNPACK_HDR_WV","ID" : "21","Type" : "sequential",
					"SubLoops" : [
					{"Name" : "UNPACK_HDR_WV","RefName" : "UNPACK_HDR_WV","ID" : "22","Type" : "pipeline",
					"SubInsts" : [
					{"Name" : "grp_fp16_to_fp32_fu_2102", "RefName" : "fp16_to_fp32","ID" : "23","Type" : "pipeline"},
					{"Name" : "grp_fp16_to_fp32_fu_2107", "RefName" : "fp16_to_fp32","ID" : "24","Type" : "pipeline"},]},]},
				{"Name" : "grp_mac_blocks_wv_Pipeline_MAC_ALL_BLOCKS_fu_1664", "RefName" : "mac_blocks_wv_Pipeline_MAC_ALL_BLOCKS","ID" : "25","Type" : "sequential",
					"SubLoops" : [
					{"Name" : "MAC_ALL_BLOCKS","RefName" : "MAC_ALL_BLOCKS","ID" : "26","Type" : "pipeline"},]},]},]},]},
	{"Name" : "gate_scale_U", "RefName" : "compute_gate","ID" : "27","Type" : "sequential",
		"SubInsts" : [
		{"Name" : "grp_compute_gate_Pipeline_GATE_PASS1_fu_86", "RefName" : "compute_gate_Pipeline_GATE_PASS1","ID" : "28","Type" : "sequential",
			"SubLoops" : [
			{"Name" : "GATE_PASS1","RefName" : "GATE_PASS1","ID" : "29","Type" : "pipeline"},]},
		{"Name" : "grp_compute_gate_Pipeline_GATE_PASS2_fu_104", "RefName" : "compute_gate_Pipeline_GATE_PASS2","ID" : "30","Type" : "sequential",
			"SubLoops" : [
			{"Name" : "GATE_PASS2","RefName" : "GATE_PASS2","ID" : "31","Type" : "pipeline"},]},]},
	{"Name" : "compute_output_U0", "RefName" : "compute_output","ID" : "32","Type" : "sequential",
		"SubInsts" : [
		{"Name" : "grp_compute_output_Pipeline_1_fu_377", "RefName" : "compute_output_Pipeline_1","ID" : "33","Type" : "sequential",
			"SubLoops" : [
			{"Name" : "Loop 1","RefName" : "Loop 1","ID" : "34","Type" : "pipeline"},]},],
		"SubLoops" : [
		{"Name" : "DOWN_Q4K","RefName" : "DOWN_Q4K","ID" : "35","Type" : "no",
		"SubInsts" : [
		{"Name" : "grp_load_row_down_q4k_fu_332", "RefName" : "load_row_down_q4k","ID" : "36","Type" : "sequential",
				"SubInsts" : [
				{"Name" : "grp_load_row_down_q4k_Pipeline_LOAD_DOWN_Q4K_VITIS_LOOP_326_1_fu_97", "RefName" : "load_row_down_q4k_Pipeline_LOAD_DOWN_Q4K_VITIS_LOOP_326_1","ID" : "37","Type" : "sequential",
					"SubLoops" : [
					{"Name" : "LOAD_DOWN_Q4K_VITIS_LOOP_326_1","RefName" : "LOAD_DOWN_Q4K_VITIS_LOOP_326_1","ID" : "38","Type" : "pipeline"},]},]},
		{"Name" : "grp_mac_blocks_down_q4k5_fu_348", "RefName" : "mac_blocks_down_q4k5","ID" : "39","Type" : "sequential",
				"SubInsts" : [
				{"Name" : "grp_mac_blocks_down_q4k5_Pipeline_UNPACK_HDR_DOWN_fu_4420", "RefName" : "mac_blocks_down_q4k5_Pipeline_UNPACK_HDR_DOWN","ID" : "40","Type" : "sequential",
					"SubLoops" : [
					{"Name" : "UNPACK_HDR_DOWN","RefName" : "UNPACK_HDR_DOWN","ID" : "41","Type" : "pipeline",
					"SubInsts" : [
					{"Name" : "fp16_to_fp32", "RefName" : "fp16_to_fp32","ID" : "42","Type" : "pipeline"},
					{"Name" : "grp_fp16_to_fp32_fu_7859", "RefName" : "fp16_to_fp32","ID" : "43","Type" : "pipeline"},]},]},
				{"Name" : "grp_mac_blocks_down_q4k5_Pipeline_MAC_BLOCKS_G0_fu_5016", "RefName" : "mac_blocks_down_q4k5_Pipeline_MAC_BLOCKS_G0","ID" : "44","Type" : "sequential",
					"SubLoops" : [
					{"Name" : "MAC_BLOCKS_G0","RefName" : "MAC_BLOCKS_G0","ID" : "45","Type" : "pipeline"},]},
				{"Name" : "grp_mac_blocks_down_q4k5_Pipeline_MAC_BLOCKS_G1_fu_5308", "RefName" : "mac_blocks_down_q4k5_Pipeline_MAC_BLOCKS_G1","ID" : "46","Type" : "sequential",
					"SubLoops" : [
					{"Name" : "MAC_BLOCKS_G1","RefName" : "MAC_BLOCKS_G1","ID" : "47","Type" : "pipeline"},]},
				{"Name" : "grp_mac_blocks_down_q4k5_Pipeline_MAC_BLOCKS_G2_fu_5600", "RefName" : "mac_blocks_down_q4k5_Pipeline_MAC_BLOCKS_G2","ID" : "48","Type" : "sequential",
					"SubLoops" : [
					{"Name" : "MAC_BLOCKS_G2","RefName" : "MAC_BLOCKS_G2","ID" : "49","Type" : "pipeline"},]},
				{"Name" : "grp_mac_blocks_down_q4k5_Pipeline_MAC_BLOCKS_G3_fu_5892", "RefName" : "mac_blocks_down_q4k5_Pipeline_MAC_BLOCKS_G3","ID" : "50","Type" : "sequential",
					"SubLoops" : [
					{"Name" : "MAC_BLOCKS_G3","RefName" : "MAC_BLOCKS_G3","ID" : "51","Type" : "pipeline"},]},]},]},
		{"Name" : "DOWN_Q6K","RefName" : "DOWN_Q6K","ID" : "52","Type" : "no",
		"SubInsts" : [
		{"Name" : "grp_load_row_down_q6k_fu_271", "RefName" : "load_row_down_q6k","ID" : "53","Type" : "sequential",
				"SubInsts" : [
				{"Name" : "grp_load_row_down_q6k_Pipeline_LOAD_DOWN_Q6K_fu_107", "RefName" : "load_row_down_q6k_Pipeline_LOAD_DOWN_Q6K","ID" : "54","Type" : "sequential",
					"SubLoops" : [
					{"Name" : "LOAD_DOWN_Q6K","RefName" : "LOAD_DOWN_Q6K","ID" : "55","Type" : "pipeline"},]},]},
		{"Name" : "grp_mac_blocks_down_q6k_fu_295", "RefName" : "mac_blocks_down_q6k","ID" : "56","Type" : "sequential",
				"SubLoops" : [
				{"Name" : "VITIS_LOOP_485_1","RefName" : "VITIS_LOOP_485_1","ID" : "57","Type" : "no",
				"SubInsts" : [
				{"Name" : "grp_mac_blocks_down_q6k_Pipeline_MAC_Q6K_fu_706", "RefName" : "mac_blocks_down_q6k_Pipeline_MAC_Q6K","ID" : "58","Type" : "sequential",
						"SubLoops" : [
						{"Name" : "MAC_Q6K","RefName" : "MAC_Q6K","ID" : "59","Type" : "pipeline"},]},
				{"Name" : "fp16_to_fp32", "RefName" : "fp16_to_fp32","ID" : "60","Type" : "pipeline"},
				{"Name" : "grp_mac_blocks_down_q6k_Pipeline_MAC_Q6K9_fu_767", "RefName" : "mac_blocks_down_q6k_Pipeline_MAC_Q6K9","ID" : "61","Type" : "sequential",
						"SubLoops" : [
						{"Name" : "MAC_Q6K","RefName" : "MAC_Q6K","ID" : "62","Type" : "pipeline"},]},]},]},]},]},]
}]}