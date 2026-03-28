set ModuleHierarchy {[{
"Name" : "swiglu", "RefName" : "swiglu","ID" : "0","Type" : "dataflow",
"SubInsts" : [
	{"Name" : "load_x_local_U0", "RefName" : "load_x_local","ID" : "1","Type" : "sequential",
		"SubLoops" : [
		{"Name" : "LOAD_X_VEC","RefName" : "LOAD_X_VEC","ID" : "2","Type" : "pipeline"},]},
	{"Name" : "entry_proc_U0", "RefName" : "entry_proc","ID" : "3","Type" : "sequential"},
	{"Name" : "compute_X1_U0", "RefName" : "compute_X1","ID" : "4","Type" : "sequential",
		"SubLoops" : [
		{"Name" : "COMPUTE_X1","RefName" : "COMPUTE_X1","ID" : "5","Type" : "no",
		"SubInsts" : [
		{"Name" : "grp_load_row_wv_fu_373", "RefName" : "load_row_wv","ID" : "6","Type" : "sequential",
				"SubLoops" : [
				{"Name" : "LOAD_WV_VITIS_LOOP_100_1","RefName" : "LOAD_WV_VITIS_LOOP_100_1","ID" : "7","Type" : "pipeline"},]},
		{"Name" : "grp_mac_blocks_wv_fu_386", "RefName" : "mac_blocks_wv","ID" : "8","Type" : "sequential",
				"SubInsts" : [
				{"Name" : "grp_mac_blocks_wv_Pipeline_MAC_ALL_BLOCKS_fu_924", "RefName" : "mac_blocks_wv_Pipeline_MAC_ALL_BLOCKS","ID" : "9","Type" : "sequential",
					"SubLoops" : [
					{"Name" : "MAC_ALL_BLOCKS","RefName" : "MAC_ALL_BLOCKS","ID" : "10","Type" : "pipeline"},]},
				{"Name" : "grp_fp16_to_fp32_fu_1328", "RefName" : "fp16_to_fp32","ID" : "11","Type" : "sequential"},
				{"Name" : "grp_fp16_to_fp32_fu_1333", "RefName" : "fp16_to_fp32","ID" : "12","Type" : "sequential"},
				{"Name" : "grp_fp16_to_fp32_fu_1338", "RefName" : "fp16_to_fp32","ID" : "13","Type" : "sequential"},
				{"Name" : "grp_fp16_to_fp32_fu_1343", "RefName" : "fp16_to_fp32","ID" : "14","Type" : "sequential"},
				{"Name" : "grp_fp16_to_fp32_fu_1348", "RefName" : "fp16_to_fp32","ID" : "15","Type" : "sequential"},
				{"Name" : "grp_fp16_to_fp32_fu_1353", "RefName" : "fp16_to_fp32","ID" : "16","Type" : "sequential"},
				{"Name" : "grp_fp16_to_fp32_fu_1358", "RefName" : "fp16_to_fp32","ID" : "17","Type" : "sequential"},
				{"Name" : "grp_fp16_to_fp32_fu_1363", "RefName" : "fp16_to_fp32","ID" : "18","Type" : "sequential"},]},]},]},
	{"Name" : "compute_X2_U0", "RefName" : "compute_X2","ID" : "19","Type" : "sequential",
		"SubLoops" : [
		{"Name" : "COMPUTE_X2","RefName" : "COMPUTE_X2","ID" : "20","Type" : "no",
		"SubInsts" : [
		{"Name" : "grp_load_row_wv_fu_373", "RefName" : "load_row_wv","ID" : "21","Type" : "sequential",
				"SubLoops" : [
				{"Name" : "LOAD_WV_VITIS_LOOP_100_1","RefName" : "LOAD_WV_VITIS_LOOP_100_1","ID" : "22","Type" : "pipeline"},]},
		{"Name" : "grp_mac_blocks_wv_fu_386", "RefName" : "mac_blocks_wv","ID" : "23","Type" : "sequential",
				"SubInsts" : [
				{"Name" : "grp_mac_blocks_wv_Pipeline_MAC_ALL_BLOCKS_fu_924", "RefName" : "mac_blocks_wv_Pipeline_MAC_ALL_BLOCKS","ID" : "24","Type" : "sequential",
					"SubLoops" : [
					{"Name" : "MAC_ALL_BLOCKS","RefName" : "MAC_ALL_BLOCKS","ID" : "25","Type" : "pipeline"},]},
				{"Name" : "grp_fp16_to_fp32_fu_1328", "RefName" : "fp16_to_fp32","ID" : "26","Type" : "sequential"},
				{"Name" : "grp_fp16_to_fp32_fu_1333", "RefName" : "fp16_to_fp32","ID" : "27","Type" : "sequential"},
				{"Name" : "grp_fp16_to_fp32_fu_1338", "RefName" : "fp16_to_fp32","ID" : "28","Type" : "sequential"},
				{"Name" : "grp_fp16_to_fp32_fu_1343", "RefName" : "fp16_to_fp32","ID" : "29","Type" : "sequential"},
				{"Name" : "grp_fp16_to_fp32_fu_1348", "RefName" : "fp16_to_fp32","ID" : "30","Type" : "sequential"},
				{"Name" : "grp_fp16_to_fp32_fu_1353", "RefName" : "fp16_to_fp32","ID" : "31","Type" : "sequential"},
				{"Name" : "grp_fp16_to_fp32_fu_1358", "RefName" : "fp16_to_fp32","ID" : "32","Type" : "sequential"},
				{"Name" : "grp_fp16_to_fp32_fu_1363", "RefName" : "fp16_to_fp32","ID" : "33","Type" : "sequential"},]},]},]},
	{"Name" : "gate_scale_U", "RefName" : "compute_gate","ID" : "34","Type" : "sequential",
		"SubInsts" : [
		{"Name" : "grp_compute_gate_Pipeline_GATE_PASS1_fu_150", "RefName" : "compute_gate_Pipeline_GATE_PASS1","ID" : "35","Type" : "sequential",
			"SubLoops" : [
			{"Name" : "GATE_PASS1","RefName" : "GATE_PASS1","ID" : "36","Type" : "pipeline"},]},
		{"Name" : "grp_compute_gate_Pipeline_GATE_PASS2_fu_170", "RefName" : "compute_gate_Pipeline_GATE_PASS2","ID" : "37","Type" : "sequential",
			"SubLoops" : [
			{"Name" : "GATE_PASS2","RefName" : "GATE_PASS2","ID" : "38","Type" : "pipeline"},]},]},
	{"Name" : "compute_output_U0", "RefName" : "compute_output","ID" : "39","Type" : "sequential",
		"SubInsts" : [
		{"Name" : "grp_compute_output_Pipeline_1_fu_3083", "RefName" : "compute_output_Pipeline_1","ID" : "40","Type" : "sequential",
			"SubLoops" : [
			{"Name" : "Loop 1","RefName" : "Loop 1","ID" : "41","Type" : "pipeline"},]},],
		"SubLoops" : [
		{"Name" : "DOWN_Q4K","RefName" : "DOWN_Q4K","ID" : "42","Type" : "no",
		"SubInsts" : [
		{"Name" : "grp_load_row_down_q4k_fu_2456", "RefName" : "load_row_down_q4k","ID" : "43","Type" : "sequential",
				"SubLoops" : [
				{"Name" : "LOAD_DOWN_Q4K_VITIS_LOOP_315_1","RefName" : "LOAD_DOWN_Q4K_VITIS_LOOP_315_1","ID" : "44","Type" : "pipeline"},]},
		{"Name" : "grp_mac_blocks_down_q4k_fu_2982", "RefName" : "mac_blocks_down_q4k","ID" : "45","Type" : "sequential",
				"SubInsts" : [
				{"Name" : "grp_mac_blocks_down_q4k_Pipeline_MAC_BLOCKS_G0_fu_2656", "RefName" : "mac_blocks_down_q4k_Pipeline_MAC_BLOCKS_G0","ID" : "46","Type" : "sequential",
					"SubLoops" : [
					{"Name" : "MAC_BLOCKS_G0","RefName" : "MAC_BLOCKS_G0","ID" : "47","Type" : "pipeline"},]},
				{"Name" : "grp_fp16_to_fp32_fu_2980", "RefName" : "fp16_to_fp32","ID" : "48","Type" : "sequential"},
				{"Name" : "grp_fp16_to_fp32_fu_2985", "RefName" : "fp16_to_fp32","ID" : "49","Type" : "sequential"},
				{"Name" : "grp_fp16_to_fp32_fu_2990", "RefName" : "fp16_to_fp32","ID" : "50","Type" : "sequential"},
				{"Name" : "grp_fp16_to_fp32_fu_2995", "RefName" : "fp16_to_fp32","ID" : "51","Type" : "sequential"},
				{"Name" : "grp_fp16_to_fp32_fu_3000", "RefName" : "fp16_to_fp32","ID" : "52","Type" : "sequential"},
				{"Name" : "grp_fp16_to_fp32_fu_3005", "RefName" : "fp16_to_fp32","ID" : "53","Type" : "sequential"},
				{"Name" : "grp_fp16_to_fp32_fu_3010", "RefName" : "fp16_to_fp32","ID" : "54","Type" : "sequential"},
				{"Name" : "grp_fp16_to_fp32_fu_3015", "RefName" : "fp16_to_fp32","ID" : "55","Type" : "sequential"},
				{"Name" : "grp_fp16_to_fp32_fu_3020", "RefName" : "fp16_to_fp32","ID" : "56","Type" : "sequential"},
				{"Name" : "grp_fp16_to_fp32_fu_3025", "RefName" : "fp16_to_fp32","ID" : "57","Type" : "sequential"},
				{"Name" : "grp_fp16_to_fp32_fu_3030", "RefName" : "fp16_to_fp32","ID" : "58","Type" : "sequential"},
				{"Name" : "grp_fp16_to_fp32_fu_3035", "RefName" : "fp16_to_fp32","ID" : "59","Type" : "sequential"},
				{"Name" : "grp_fp16_to_fp32_fu_3040", "RefName" : "fp16_to_fp32","ID" : "60","Type" : "sequential"},
				{"Name" : "grp_fp16_to_fp32_fu_3045", "RefName" : "fp16_to_fp32","ID" : "61","Type" : "sequential"},
				{"Name" : "grp_fp16_to_fp32_fu_3050", "RefName" : "fp16_to_fp32","ID" : "62","Type" : "sequential"},
				{"Name" : "grp_fp16_to_fp32_fu_3055", "RefName" : "fp16_to_fp32","ID" : "63","Type" : "sequential"},
				{"Name" : "grp_fp16_to_fp32_fu_3060", "RefName" : "fp16_to_fp32","ID" : "64","Type" : "sequential"},
				{"Name" : "grp_fp16_to_fp32_fu_3065", "RefName" : "fp16_to_fp32","ID" : "65","Type" : "sequential"},
				{"Name" : "grp_fp16_to_fp32_fu_3070", "RefName" : "fp16_to_fp32","ID" : "66","Type" : "sequential"},
				{"Name" : "grp_fp16_to_fp32_fu_3075", "RefName" : "fp16_to_fp32","ID" : "67","Type" : "sequential"},
				{"Name" : "grp_fp16_to_fp32_fu_3080", "RefName" : "fp16_to_fp32","ID" : "68","Type" : "sequential"},
				{"Name" : "grp_fp16_to_fp32_fu_3085", "RefName" : "fp16_to_fp32","ID" : "69","Type" : "sequential"},
				{"Name" : "grp_fp16_to_fp32_fu_3090", "RefName" : "fp16_to_fp32","ID" : "70","Type" : "sequential"},
				{"Name" : "grp_fp16_to_fp32_fu_3095", "RefName" : "fp16_to_fp32","ID" : "71","Type" : "sequential"},
				{"Name" : "grp_fp16_to_fp32_fu_3100", "RefName" : "fp16_to_fp32","ID" : "72","Type" : "sequential"},
				{"Name" : "grp_fp16_to_fp32_fu_3105", "RefName" : "fp16_to_fp32","ID" : "73","Type" : "sequential"},
				{"Name" : "grp_fp16_to_fp32_fu_3110", "RefName" : "fp16_to_fp32","ID" : "74","Type" : "sequential"},
				{"Name" : "grp_fp16_to_fp32_fu_3115", "RefName" : "fp16_to_fp32","ID" : "75","Type" : "sequential"},
				{"Name" : "grp_fp16_to_fp32_fu_3120", "RefName" : "fp16_to_fp32","ID" : "76","Type" : "sequential"},
				{"Name" : "grp_fp16_to_fp32_fu_3125", "RefName" : "fp16_to_fp32","ID" : "77","Type" : "sequential"},
				{"Name" : "grp_fp16_to_fp32_fu_3130", "RefName" : "fp16_to_fp32","ID" : "78","Type" : "sequential"},
				{"Name" : "grp_fp16_to_fp32_fu_3135", "RefName" : "fp16_to_fp32","ID" : "79","Type" : "sequential"},
				{"Name" : "grp_mac_blocks_down_q4k_Pipeline_MAC_BLOCKS_G1_fu_3140", "RefName" : "mac_blocks_down_q4k_Pipeline_MAC_BLOCKS_G1","ID" : "80","Type" : "sequential",
					"SubLoops" : [
					{"Name" : "MAC_BLOCKS_G1","RefName" : "MAC_BLOCKS_G1","ID" : "81","Type" : "pipeline"},]},]},]},
		{"Name" : "DOWN_Q6K","RefName" : "DOWN_Q6K","ID" : "82","Type" : "no",
		"SubInsts" : [
		{"Name" : "grp_load_row_down_q6k_fu_2031", "RefName" : "load_row_down_q6k","ID" : "83","Type" : "sequential",
				"SubLoops" : [
				{"Name" : "LOAD_DOWN_Q6K","RefName" : "LOAD_DOWN_Q6K","ID" : "84","Type" : "pipeline"},]},
		{"Name" : "grp_mac_blocks_down_q6k_fu_2493", "RefName" : "mac_blocks_down_q6k","ID" : "85","Type" : "sequential",
				"SubLoops" : [
				{"Name" : "VITIS_LOOP_447_1","RefName" : "VITIS_LOOP_447_1","ID" : "86","Type" : "no",
				"SubInsts" : [
				{"Name" : "grp_mac_blocks_down_q6k_Pipeline_1_fu_3748", "RefName" : "mac_blocks_down_q6k_Pipeline_1","ID" : "87","Type" : "sequential",
						"SubLoops" : [
						{"Name" : "Loop 1","RefName" : "Loop 1","ID" : "88","Type" : "pipeline"},]},
				{"Name" : "grp_mac_blocks_down_q6k_Pipeline_MAC_Q6K_fu_3760", "RefName" : "mac_blocks_down_q6k_Pipeline_MAC_Q6K","ID" : "89","Type" : "sequential",
						"SubLoops" : [
						{"Name" : "MAC_Q6K","RefName" : "MAC_Q6K","ID" : "90","Type" : "pipeline"},]},
				{"Name" : "grp_mac_blocks_down_q6k_Pipeline_3_fu_4112", "RefName" : "mac_blocks_down_q6k_Pipeline_3","ID" : "91","Type" : "sequential",
						"SubLoops" : [
						{"Name" : "Loop 1","RefName" : "Loop 1","ID" : "92","Type" : "pipeline"},]},
				{"Name" : "grp_mac_blocks_down_q6k_Pipeline_MAC_Q6K1_fu_4124", "RefName" : "mac_blocks_down_q6k_Pipeline_MAC_Q6K1","ID" : "93","Type" : "sequential",
						"SubLoops" : [
						{"Name" : "MAC_Q6K","RefName" : "MAC_Q6K","ID" : "94","Type" : "pipeline"},]},
				{"Name" : "grp_mac_blocks_down_q6k_Pipeline_5_fu_4476", "RefName" : "mac_blocks_down_q6k_Pipeline_5","ID" : "95","Type" : "sequential",
						"SubLoops" : [
						{"Name" : "Loop 1","RefName" : "Loop 1","ID" : "96","Type" : "pipeline"},]},
				{"Name" : "grp_mac_blocks_down_q6k_Pipeline_MAC_Q6K2_fu_4488", "RefName" : "mac_blocks_down_q6k_Pipeline_MAC_Q6K2","ID" : "97","Type" : "sequential",
						"SubLoops" : [
						{"Name" : "MAC_Q6K","RefName" : "MAC_Q6K","ID" : "98","Type" : "pipeline"},]},
				{"Name" : "grp_mac_blocks_down_q6k_Pipeline_7_fu_4853", "RefName" : "mac_blocks_down_q6k_Pipeline_7","ID" : "99","Type" : "sequential",
						"SubLoops" : [
						{"Name" : "Loop 1","RefName" : "Loop 1","ID" : "100","Type" : "pipeline"},]},
				{"Name" : "grp_mac_blocks_down_q6k_Pipeline_MAC_Q6K3_fu_4865", "RefName" : "mac_blocks_down_q6k_Pipeline_MAC_Q6K3","ID" : "101","Type" : "sequential",
						"SubLoops" : [
						{"Name" : "MAC_Q6K","RefName" : "MAC_Q6K","ID" : "102","Type" : "pipeline"},]},
				{"Name" : "grp_mac_blocks_down_q6k_Pipeline_9_fu_5217", "RefName" : "mac_blocks_down_q6k_Pipeline_9","ID" : "103","Type" : "sequential",
						"SubLoops" : [
						{"Name" : "Loop 1","RefName" : "Loop 1","ID" : "104","Type" : "pipeline"},]},
				{"Name" : "grp_mac_blocks_down_q6k_Pipeline_MAC_Q6K4_fu_5229", "RefName" : "mac_blocks_down_q6k_Pipeline_MAC_Q6K4","ID" : "105","Type" : "sequential",
						"SubLoops" : [
						{"Name" : "MAC_Q6K","RefName" : "MAC_Q6K","ID" : "106","Type" : "pipeline"},]},
				{"Name" : "grp_mac_blocks_down_q6k_Pipeline_11_fu_5620", "RefName" : "mac_blocks_down_q6k_Pipeline_11","ID" : "107","Type" : "sequential",
						"SubLoops" : [
						{"Name" : "Loop 1","RefName" : "Loop 1","ID" : "108","Type" : "pipeline"},]},
				{"Name" : "grp_mac_blocks_down_q6k_Pipeline_MAC_Q6K5_fu_5632", "RefName" : "mac_blocks_down_q6k_Pipeline_MAC_Q6K5","ID" : "109","Type" : "sequential",
						"SubLoops" : [
						{"Name" : "MAC_Q6K","RefName" : "MAC_Q6K","ID" : "110","Type" : "pipeline"},]},
				{"Name" : "grp_mac_blocks_down_q6k_Pipeline_13_fu_6010", "RefName" : "mac_blocks_down_q6k_Pipeline_13","ID" : "111","Type" : "sequential",
						"SubLoops" : [
						{"Name" : "Loop 1","RefName" : "Loop 1","ID" : "112","Type" : "pipeline"},]},
				{"Name" : "grp_mac_blocks_down_q6k_Pipeline_MAC_Q6K6_fu_6022", "RefName" : "mac_blocks_down_q6k_Pipeline_MAC_Q6K6","ID" : "113","Type" : "sequential",
						"SubLoops" : [
						{"Name" : "MAC_Q6K","RefName" : "MAC_Q6K","ID" : "114","Type" : "pipeline"},]},
				{"Name" : "grp_mac_blocks_down_q6k_Pipeline_15_fu_6387", "RefName" : "mac_blocks_down_q6k_Pipeline_15","ID" : "115","Type" : "sequential",
						"SubLoops" : [
						{"Name" : "Loop 1","RefName" : "Loop 1","ID" : "116","Type" : "pipeline"},]},
				{"Name" : "grp_mac_blocks_down_q6k_Pipeline_MAC_Q6K7_fu_6399", "RefName" : "mac_blocks_down_q6k_Pipeline_MAC_Q6K7","ID" : "117","Type" : "sequential",
						"SubLoops" : [
						{"Name" : "MAC_Q6K","RefName" : "MAC_Q6K","ID" : "118","Type" : "pipeline"},]},]},]},]},]},]
}]}