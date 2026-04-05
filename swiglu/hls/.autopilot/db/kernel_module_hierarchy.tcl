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
		{"Name" : "grp_load_row_wv_fu_449", "RefName" : "load_row_wv","ID" : "5","Type" : "sequential",
				"SubInsts" : [
				{"Name" : "grp_load_row_wv_Pipeline_LOAD_WV_VITIS_LOOP_95_1_fu_97", "RefName" : "load_row_wv_Pipeline_LOAD_WV_VITIS_LOOP_95_1","ID" : "6","Type" : "sequential",
					"SubLoops" : [
					{"Name" : "LOAD_WV_VITIS_LOOP_95_1","RefName" : "LOAD_WV_VITIS_LOOP_95_1","ID" : "7","Type" : "pipeline"},]},]},
		{"Name" : "grp_mac_blocks_wv_k1_fu_465", "RefName" : "mac_blocks_wv_k1","ID" : "8","Type" : "sequential",
				"SubInsts" : [
				{"Name" : "grp_mac_blocks_wv_k1_Pipeline_UNPACK_HDR_WV_K1_fu_1568", "RefName" : "mac_blocks_wv_k1_Pipeline_UNPACK_HDR_WV_K1","ID" : "9","Type" : "sequential",
					"SubLoops" : [
					{"Name" : "UNPACK_HDR_WV_K1","RefName" : "UNPACK_HDR_WV_K1","ID" : "10","Type" : "pipeline",
					"SubInsts" : [
					{"Name" : "grp_fp16_to_fp32_fu_2100", "RefName" : "fp16_to_fp32","ID" : "11","Type" : "pipeline"},
					{"Name" : "grp_fp16_to_fp32_fu_2105", "RefName" : "fp16_to_fp32","ID" : "12","Type" : "pipeline"},]},]},
				{"Name" : "grp_mac_blocks_wv_k1_Pipeline_MAC_ALL_K1_fu_1732", "RefName" : "mac_blocks_wv_k1_Pipeline_MAC_ALL_K1","ID" : "13","Type" : "sequential",
					"SubLoops" : [
					{"Name" : "MAC_ALL_K1","RefName" : "MAC_ALL_K1","ID" : "14","Type" : "pipeline"},]},
				{"Name" : "grp_mac_blocks_wv_k1_Pipeline_REDUCE_WV_K1_fu_2264", "RefName" : "mac_blocks_wv_k1_Pipeline_REDUCE_WV_K1","ID" : "15","Type" : "sequential",
					"SubLoops" : [
					{"Name" : "REDUCE_WV_K1","RefName" : "REDUCE_WV_K1","ID" : "16","Type" : "pipeline"},]},]},]},]},
	{"Name" : "compute_X2_U0", "RefName" : "compute_X2","ID" : "17","Type" : "sequential",
		"SubLoops" : [
		{"Name" : "COMPUTE_X2","RefName" : "COMPUTE_X2","ID" : "18","Type" : "no",
		"SubInsts" : [
		{"Name" : "grp_load_row_wv_fu_449", "RefName" : "load_row_wv","ID" : "19","Type" : "sequential",
				"SubInsts" : [
				{"Name" : "grp_load_row_wv_Pipeline_LOAD_WV_VITIS_LOOP_95_1_fu_97", "RefName" : "load_row_wv_Pipeline_LOAD_WV_VITIS_LOOP_95_1","ID" : "20","Type" : "sequential",
					"SubLoops" : [
					{"Name" : "LOAD_WV_VITIS_LOOP_95_1","RefName" : "LOAD_WV_VITIS_LOOP_95_1","ID" : "21","Type" : "pipeline"},]},]},
		{"Name" : "grp_mac_blocks_wv_k1_fu_465", "RefName" : "mac_blocks_wv_k1","ID" : "22","Type" : "sequential",
				"SubInsts" : [
				{"Name" : "grp_mac_blocks_wv_k1_Pipeline_UNPACK_HDR_WV_K1_fu_1568", "RefName" : "mac_blocks_wv_k1_Pipeline_UNPACK_HDR_WV_K1","ID" : "23","Type" : "sequential",
					"SubLoops" : [
					{"Name" : "UNPACK_HDR_WV_K1","RefName" : "UNPACK_HDR_WV_K1","ID" : "24","Type" : "pipeline",
					"SubInsts" : [
					{"Name" : "grp_fp16_to_fp32_fu_2100", "RefName" : "fp16_to_fp32","ID" : "25","Type" : "pipeline"},
					{"Name" : "grp_fp16_to_fp32_fu_2105", "RefName" : "fp16_to_fp32","ID" : "26","Type" : "pipeline"},]},]},
				{"Name" : "grp_mac_blocks_wv_k1_Pipeline_MAC_ALL_K1_fu_1732", "RefName" : "mac_blocks_wv_k1_Pipeline_MAC_ALL_K1","ID" : "27","Type" : "sequential",
					"SubLoops" : [
					{"Name" : "MAC_ALL_K1","RefName" : "MAC_ALL_K1","ID" : "28","Type" : "pipeline"},]},
				{"Name" : "grp_mac_blocks_wv_k1_Pipeline_REDUCE_WV_K1_fu_2264", "RefName" : "mac_blocks_wv_k1_Pipeline_REDUCE_WV_K1","ID" : "29","Type" : "sequential",
					"SubLoops" : [
					{"Name" : "REDUCE_WV_K1","RefName" : "REDUCE_WV_K1","ID" : "30","Type" : "pipeline"},]},]},]},]},
	{"Name" : "gate_scale_U", "RefName" : "compute_gate","ID" : "31","Type" : "sequential",
		"SubInsts" : [
		{"Name" : "grp_compute_gate_Pipeline_GATE_PASS1_fu_88", "RefName" : "compute_gate_Pipeline_GATE_PASS1","ID" : "32","Type" : "sequential",
			"SubLoops" : [
			{"Name" : "GATE_PASS1","RefName" : "GATE_PASS1","ID" : "33","Type" : "pipeline"},]},
		{"Name" : "grp_compute_gate_Pipeline_GATE_PASS2_fu_106", "RefName" : "compute_gate_Pipeline_GATE_PASS2","ID" : "34","Type" : "sequential",
			"SubLoops" : [
			{"Name" : "GATE_PASS2","RefName" : "GATE_PASS2","ID" : "35","Type" : "pipeline"},]},]},
	{"Name" : "compute_output_U0", "RefName" : "compute_output","ID" : "36","Type" : "sequential",
		"SubInsts" : [
		{"Name" : "grp_compute_output_Pipeline_1_fu_1201", "RefName" : "compute_output_Pipeline_1","ID" : "37","Type" : "sequential",
			"SubLoops" : [
			{"Name" : "Loop 1","RefName" : "Loop 1","ID" : "38","Type" : "pipeline"},]},
		{"Name" : "grp_compute_output_Pipeline_2_fu_1255", "RefName" : "compute_output_Pipeline_2","ID" : "39","Type" : "sequential",
			"SubLoops" : [
			{"Name" : "Loop 1","RefName" : "Loop 1","ID" : "40","Type" : "pipeline"},]},],
		"SubLoops" : [
		{"Name" : "DOWN_Q6K","RefName" : "DOWN_Q6K","ID" : "41","Type" : "no",
		"SubInsts" : [
		{"Name" : "grp_load_pair_q6k_fu_928", "RefName" : "load_pair_q6k","ID" : "42","Type" : "dataflow",
				"SubInsts" : [
				{"Name" : "load_row_down_q6k_U0", "RefName" : "load_row_down_q6k","ID" : "43","Type" : "sequential",
					"SubInsts" : [
					{"Name" : "grp_load_row_down_q6k_Pipeline_LOAD_QL_fu_262", "RefName" : "load_row_down_q6k_Pipeline_LOAD_QL","ID" : "44","Type" : "sequential",
						"SubLoops" : [
						{"Name" : "LOAD_QL","RefName" : "LOAD_QL","ID" : "45","Type" : "pipeline"},]},
					{"Name" : "grp_load_row_down_q6k_Pipeline_LOAD_QH_fu_285", "RefName" : "load_row_down_q6k_Pipeline_LOAD_QH","ID" : "46","Type" : "sequential",
						"SubLoops" : [
						{"Name" : "LOAD_QH","RefName" : "LOAD_QH","ID" : "47","Type" : "pipeline"},]},
					{"Name" : "grp_load_row_down_q6k_Pipeline_LOAD_SC_fu_308", "RefName" : "load_row_down_q6k_Pipeline_LOAD_SC","ID" : "48","Type" : "sequential",
						"SubLoops" : [
						{"Name" : "LOAD_SC","RefName" : "LOAD_SC","ID" : "49","Type" : "pipeline"},]},
					{"Name" : "grp_load_row_down_q6k_Pipeline_LOAD_D_fu_379", "RefName" : "load_row_down_q6k_Pipeline_LOAD_D","ID" : "50","Type" : "sequential",
						"SubLoops" : [
						{"Name" : "LOAD_D","RefName" : "LOAD_D","ID" : "51","Type" : "pipeline",
						"SubInsts" : [
						{"Name" : "grp_fp16_to_fp32_fu_381", "RefName" : "fp16_to_fp32","ID" : "52","Type" : "pipeline"},
						{"Name" : "grp_fp16_to_fp32_fu_390", "RefName" : "fp16_to_fp32","ID" : "53","Type" : "pipeline"},
						{"Name" : "grp_fp16_to_fp32_fu_399", "RefName" : "fp16_to_fp32","ID" : "54","Type" : "pipeline"},
						{"Name" : "grp_fp16_to_fp32_fu_408", "RefName" : "fp16_to_fp32","ID" : "55","Type" : "pipeline"},
						{"Name" : "grp_fp16_to_fp32_fu_417", "RefName" : "fp16_to_fp32","ID" : "56","Type" : "pipeline"},
						{"Name" : "grp_fp16_to_fp32_fu_426", "RefName" : "fp16_to_fp32","ID" : "57","Type" : "pipeline"},
						{"Name" : "grp_fp16_to_fp32_fu_435", "RefName" : "fp16_to_fp32","ID" : "58","Type" : "pipeline"},
						{"Name" : "grp_fp16_to_fp32_fu_444", "RefName" : "fp16_to_fp32","ID" : "59","Type" : "pipeline"},]},]},]},
				{"Name" : "load_row_down_q6k_1_U0", "RefName" : "load_row_down_q6k_1","ID" : "60","Type" : "sequential",
					"SubInsts" : [
					{"Name" : "grp_load_row_down_q6k_1_Pipeline_LOAD_QL_fu_262", "RefName" : "load_row_down_q6k_1_Pipeline_LOAD_QL","ID" : "61","Type" : "sequential",
						"SubLoops" : [
						{"Name" : "LOAD_QL","RefName" : "LOAD_QL","ID" : "62","Type" : "pipeline"},]},
					{"Name" : "grp_load_row_down_q6k_1_Pipeline_LOAD_QH_fu_285", "RefName" : "load_row_down_q6k_1_Pipeline_LOAD_QH","ID" : "63","Type" : "sequential",
						"SubLoops" : [
						{"Name" : "LOAD_QH","RefName" : "LOAD_QH","ID" : "64","Type" : "pipeline"},]},
					{"Name" : "grp_load_row_down_q6k_1_Pipeline_LOAD_SC_fu_308", "RefName" : "load_row_down_q6k_1_Pipeline_LOAD_SC","ID" : "65","Type" : "sequential",
						"SubLoops" : [
						{"Name" : "LOAD_SC","RefName" : "LOAD_SC","ID" : "66","Type" : "pipeline"},]},
					{"Name" : "grp_load_row_down_q6k_1_Pipeline_LOAD_D_fu_379", "RefName" : "load_row_down_q6k_1_Pipeline_LOAD_D","ID" : "67","Type" : "sequential",
						"SubLoops" : [
						{"Name" : "LOAD_D","RefName" : "LOAD_D","ID" : "68","Type" : "pipeline",
						"SubInsts" : [
						{"Name" : "grp_fp16_to_fp32_fu_381", "RefName" : "fp16_to_fp32","ID" : "69","Type" : "pipeline"},
						{"Name" : "grp_fp16_to_fp32_fu_390", "RefName" : "fp16_to_fp32","ID" : "70","Type" : "pipeline"},
						{"Name" : "grp_fp16_to_fp32_fu_399", "RefName" : "fp16_to_fp32","ID" : "71","Type" : "pipeline"},
						{"Name" : "grp_fp16_to_fp32_fu_408", "RefName" : "fp16_to_fp32","ID" : "72","Type" : "pipeline"},
						{"Name" : "grp_fp16_to_fp32_fu_417", "RefName" : "fp16_to_fp32","ID" : "73","Type" : "pipeline"},
						{"Name" : "grp_fp16_to_fp32_fu_426", "RefName" : "fp16_to_fp32","ID" : "74","Type" : "pipeline"},
						{"Name" : "grp_fp16_to_fp32_fu_435", "RefName" : "fp16_to_fp32","ID" : "75","Type" : "pipeline"},
						{"Name" : "grp_fp16_to_fp32_fu_444", "RefName" : "fp16_to_fp32","ID" : "76","Type" : "pipeline"},]},]},]},]},
		{"Name" : "grp_mac_blocks_down_q6k5_fu_1100", "RefName" : "mac_blocks_down_q6k5","ID" : "77","Type" : "sequential",
				"SubLoops" : [
				{"Name" : "VITIS_LOOP_576_1","RefName" : "VITIS_LOOP_576_1","ID" : "78","Type" : "no",
				"SubInsts" : [
				{"Name" : "grp_mac_blocks_down_q6k5_Pipeline_Q6K_MAC_GROUP_fu_842", "RefName" : "mac_blocks_down_q6k5_Pipeline_Q6K_MAC_GROUP","ID" : "79","Type" : "sequential",
						"SubLoops" : [
						{"Name" : "Q6K_MAC_GROUP","RefName" : "Q6K_MAC_GROUP","ID" : "80","Type" : "pipeline"},]},
				{"Name" : "grp_mac_blocks_down_q6k5_Pipeline_VITIS_LOOP_614_4_fu_933", "RefName" : "mac_blocks_down_q6k5_Pipeline_VITIS_LOOP_614_4","ID" : "81","Type" : "sequential",
						"SubLoops" : [
						{"Name" : "VITIS_LOOP_614_4","RefName" : "VITIS_LOOP_614_4","ID" : "82","Type" : "pipeline"},]},]},]},]},
		{"Name" : "DOWN_Q4K","RefName" : "DOWN_Q4K","ID" : "83","Type" : "no",
		"SubInsts" : [
		{"Name" : "grp_load_row_down_q4k_fu_1209", "RefName" : "load_row_down_q4k","ID" : "84","Type" : "sequential",
				"SubInsts" : [
				{"Name" : "grp_load_row_down_q4k_Pipeline_LOAD_DOWN_Q4K_VITIS_LOOP_337_1_fu_97", "RefName" : "load_row_down_q4k_Pipeline_LOAD_DOWN_Q4K_VITIS_LOOP_337_1","ID" : "85","Type" : "sequential",
					"SubLoops" : [
					{"Name" : "LOAD_DOWN_Q4K_VITIS_LOOP_337_1","RefName" : "LOAD_DOWN_Q4K_VITIS_LOOP_337_1","ID" : "86","Type" : "pipeline"},]},]},
		{"Name" : "grp_mac_blocks_down_q4k7_fu_1226", "RefName" : "mac_blocks_down_q4k7","ID" : "87","Type" : "sequential",
				"SubInsts" : [
				{"Name" : "grp_mac_blocks_down_q4k7_Pipeline_UNPACK_HDR_DOWN_fu_2978", "RefName" : "mac_blocks_down_q4k7_Pipeline_UNPACK_HDR_DOWN","ID" : "88","Type" : "sequential",
					"SubLoops" : [
					{"Name" : "UNPACK_HDR_DOWN","RefName" : "UNPACK_HDR_DOWN","ID" : "89","Type" : "pipeline",
					"SubInsts" : [
					{"Name" : "grp_fp16_to_fp32_fu_7852", "RefName" : "fp16_to_fp32","ID" : "90","Type" : "pipeline"},
					{"Name" : "grp_fp16_to_fp32_fu_7857", "RefName" : "fp16_to_fp32","ID" : "91","Type" : "pipeline"},]},]},],
				"SubLoops" : [
				{"Name" : "VITIS_LOOP_402_1","RefName" : "VITIS_LOOP_402_1","ID" : "92","Type" : "no",
				"SubInsts" : [
				{"Name" : "grp_mac_blocks_down_q4k7_Pipeline_MAC_GROUP_fu_3574", "RefName" : "mac_blocks_down_q4k7_Pipeline_MAC_GROUP","ID" : "93","Type" : "sequential",
						"SubLoops" : [
						{"Name" : "MAC_GROUP","RefName" : "MAC_GROUP","ID" : "94","Type" : "pipeline"},]},
				{"Name" : "grp_mac_blocks_down_q4k7_Pipeline_REDUCE_G_fu_4253", "RefName" : "mac_blocks_down_q4k7_Pipeline_REDUCE_G","ID" : "95","Type" : "sequential",
						"SubLoops" : [
						{"Name" : "REDUCE_G","RefName" : "REDUCE_G","ID" : "96","Type" : "pipeline"},]},]},]},]},]},]
}]}