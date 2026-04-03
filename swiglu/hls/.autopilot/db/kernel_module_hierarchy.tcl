set ModuleHierarchy {[{
"Name" : "swiglu", "RefName" : "swiglu","ID" : "0","Type" : "dataflow",
"SubInsts" : [
	{"Name" : "load_x_local_U0", "RefName" : "load_x_local","ID" : "1","Type" : "sequential",
		"SubLoops" : [
		{"Name" : "LOAD_X_BATCH_LOAD_X_VEC","RefName" : "LOAD_X_BATCH_LOAD_X_VEC","ID" : "2","Type" : "pipeline"},]},
	{"Name" : "compute_X1_U0", "RefName" : "compute_X1","ID" : "3","Type" : "sequential",
		"SubLoops" : [
		{"Name" : "COMPUTE_X1","RefName" : "COMPUTE_X1","ID" : "4","Type" : "no",
		"SubInsts" : [
		{"Name" : "grp_load_row_wv_fu_447", "RefName" : "load_row_wv","ID" : "5","Type" : "sequential",
				"SubInsts" : [
				{"Name" : "grp_load_row_wv_Pipeline_LOAD_WV_VITIS_LOOP_78_1_fu_97", "RefName" : "load_row_wv_Pipeline_LOAD_WV_VITIS_LOOP_78_1","ID" : "6","Type" : "sequential",
					"SubLoops" : [
					{"Name" : "LOAD_WV_VITIS_LOOP_78_1","RefName" : "LOAD_WV_VITIS_LOOP_78_1","ID" : "7","Type" : "pipeline"},]},]},
		{"Name" : "grp_mac_blocks_wv_k1_fu_463", "RefName" : "mac_blocks_wv_k1","ID" : "8","Type" : "sequential",
				"SubInsts" : [
				{"Name" : "grp_mac_blocks_wv_k1_Pipeline_MAC_ALL_K1_fu_1038", "RefName" : "mac_blocks_wv_k1_Pipeline_MAC_ALL_K1","ID" : "9","Type" : "sequential",
					"SubLoops" : [
					{"Name" : "MAC_ALL_K1","RefName" : "MAC_ALL_K1","ID" : "10","Type" : "pipeline"},]},
				{"Name" : "grp_fp16_to_fp32_fu_1570", "RefName" : "fp16_to_fp32","ID" : "11","Type" : "pipeline"},
				{"Name" : "grp_fp16_to_fp32_fu_1575", "RefName" : "fp16_to_fp32","ID" : "12","Type" : "pipeline"},
				{"Name" : "grp_fp16_to_fp32_fu_1580", "RefName" : "fp16_to_fp32","ID" : "13","Type" : "pipeline"},
				{"Name" : "grp_fp16_to_fp32_fu_1585", "RefName" : "fp16_to_fp32","ID" : "14","Type" : "pipeline"},
				{"Name" : "grp_fp16_to_fp32_fu_1590", "RefName" : "fp16_to_fp32","ID" : "15","Type" : "pipeline"},
				{"Name" : "grp_fp16_to_fp32_fu_1595", "RefName" : "fp16_to_fp32","ID" : "16","Type" : "pipeline"},
				{"Name" : "grp_fp16_to_fp32_fu_1600", "RefName" : "fp16_to_fp32","ID" : "17","Type" : "pipeline"},
				{"Name" : "grp_fp16_to_fp32_fu_1605", "RefName" : "fp16_to_fp32","ID" : "18","Type" : "pipeline"},
				{"Name" : "grp_fp16_to_fp32_fu_1610", "RefName" : "fp16_to_fp32","ID" : "19","Type" : "pipeline"},
				{"Name" : "grp_fp16_to_fp32_fu_1615", "RefName" : "fp16_to_fp32","ID" : "20","Type" : "pipeline"},
				{"Name" : "grp_fp16_to_fp32_fu_1620", "RefName" : "fp16_to_fp32","ID" : "21","Type" : "pipeline"},
				{"Name" : "grp_fp16_to_fp32_fu_1625", "RefName" : "fp16_to_fp32","ID" : "22","Type" : "pipeline"},
				{"Name" : "grp_fp16_to_fp32_fu_1630", "RefName" : "fp16_to_fp32","ID" : "23","Type" : "pipeline"},
				{"Name" : "grp_fp16_to_fp32_fu_1635", "RefName" : "fp16_to_fp32","ID" : "24","Type" : "pipeline"},
				{"Name" : "grp_fp16_to_fp32_fu_1640", "RefName" : "fp16_to_fp32","ID" : "25","Type" : "pipeline"},
				{"Name" : "grp_fp16_to_fp32_fu_1645", "RefName" : "fp16_to_fp32","ID" : "26","Type" : "pipeline"},
				{"Name" : "grp_mac_blocks_wv_k1_Pipeline_REDUCE_WV_K1_fu_1650", "RefName" : "mac_blocks_wv_k1_Pipeline_REDUCE_WV_K1","ID" : "27","Type" : "sequential",
					"SubLoops" : [
					{"Name" : "REDUCE_WV_K1","RefName" : "REDUCE_WV_K1","ID" : "28","Type" : "pipeline"},]},]},]},]},
	{"Name" : "compute_X2_U0", "RefName" : "compute_X2","ID" : "29","Type" : "sequential",
		"SubLoops" : [
		{"Name" : "COMPUTE_X2","RefName" : "COMPUTE_X2","ID" : "30","Type" : "no",
		"SubInsts" : [
		{"Name" : "grp_load_row_wv_fu_447", "RefName" : "load_row_wv","ID" : "31","Type" : "sequential",
				"SubInsts" : [
				{"Name" : "grp_load_row_wv_Pipeline_LOAD_WV_VITIS_LOOP_78_1_fu_97", "RefName" : "load_row_wv_Pipeline_LOAD_WV_VITIS_LOOP_78_1","ID" : "32","Type" : "sequential",
					"SubLoops" : [
					{"Name" : "LOAD_WV_VITIS_LOOP_78_1","RefName" : "LOAD_WV_VITIS_LOOP_78_1","ID" : "33","Type" : "pipeline"},]},]},
		{"Name" : "grp_mac_blocks_wv_k1_fu_463", "RefName" : "mac_blocks_wv_k1","ID" : "34","Type" : "sequential",
				"SubInsts" : [
				{"Name" : "grp_mac_blocks_wv_k1_Pipeline_MAC_ALL_K1_fu_1038", "RefName" : "mac_blocks_wv_k1_Pipeline_MAC_ALL_K1","ID" : "35","Type" : "sequential",
					"SubLoops" : [
					{"Name" : "MAC_ALL_K1","RefName" : "MAC_ALL_K1","ID" : "36","Type" : "pipeline"},]},
				{"Name" : "grp_fp16_to_fp32_fu_1570", "RefName" : "fp16_to_fp32","ID" : "37","Type" : "pipeline"},
				{"Name" : "grp_fp16_to_fp32_fu_1575", "RefName" : "fp16_to_fp32","ID" : "38","Type" : "pipeline"},
				{"Name" : "grp_fp16_to_fp32_fu_1580", "RefName" : "fp16_to_fp32","ID" : "39","Type" : "pipeline"},
				{"Name" : "grp_fp16_to_fp32_fu_1585", "RefName" : "fp16_to_fp32","ID" : "40","Type" : "pipeline"},
				{"Name" : "grp_fp16_to_fp32_fu_1590", "RefName" : "fp16_to_fp32","ID" : "41","Type" : "pipeline"},
				{"Name" : "grp_fp16_to_fp32_fu_1595", "RefName" : "fp16_to_fp32","ID" : "42","Type" : "pipeline"},
				{"Name" : "grp_fp16_to_fp32_fu_1600", "RefName" : "fp16_to_fp32","ID" : "43","Type" : "pipeline"},
				{"Name" : "grp_fp16_to_fp32_fu_1605", "RefName" : "fp16_to_fp32","ID" : "44","Type" : "pipeline"},
				{"Name" : "grp_fp16_to_fp32_fu_1610", "RefName" : "fp16_to_fp32","ID" : "45","Type" : "pipeline"},
				{"Name" : "grp_fp16_to_fp32_fu_1615", "RefName" : "fp16_to_fp32","ID" : "46","Type" : "pipeline"},
				{"Name" : "grp_fp16_to_fp32_fu_1620", "RefName" : "fp16_to_fp32","ID" : "47","Type" : "pipeline"},
				{"Name" : "grp_fp16_to_fp32_fu_1625", "RefName" : "fp16_to_fp32","ID" : "48","Type" : "pipeline"},
				{"Name" : "grp_fp16_to_fp32_fu_1630", "RefName" : "fp16_to_fp32","ID" : "49","Type" : "pipeline"},
				{"Name" : "grp_fp16_to_fp32_fu_1635", "RefName" : "fp16_to_fp32","ID" : "50","Type" : "pipeline"},
				{"Name" : "grp_fp16_to_fp32_fu_1640", "RefName" : "fp16_to_fp32","ID" : "51","Type" : "pipeline"},
				{"Name" : "grp_fp16_to_fp32_fu_1645", "RefName" : "fp16_to_fp32","ID" : "52","Type" : "pipeline"},
				{"Name" : "grp_mac_blocks_wv_k1_Pipeline_REDUCE_WV_K1_fu_1650", "RefName" : "mac_blocks_wv_k1_Pipeline_REDUCE_WV_K1","ID" : "53","Type" : "sequential",
					"SubLoops" : [
					{"Name" : "REDUCE_WV_K1","RefName" : "REDUCE_WV_K1","ID" : "54","Type" : "pipeline"},]},]},]},]},
	{"Name" : "gate_scale_U", "RefName" : "compute_gate","ID" : "55","Type" : "sequential",
		"SubInsts" : [
		{"Name" : "grp_compute_gate_Pipeline_1_fu_108", "RefName" : "compute_gate_Pipeline_1","ID" : "56","Type" : "sequential",
			"SubLoops" : [
			{"Name" : "Loop 1","RefName" : "Loop 1","ID" : "57","Type" : "pipeline"},]},
		{"Name" : "grp_compute_gate_Pipeline_GATE_PASS1_fu_120", "RefName" : "compute_gate_Pipeline_GATE_PASS1","ID" : "58","Type" : "sequential",
			"SubLoops" : [
			{"Name" : "GATE_PASS1","RefName" : "GATE_PASS1","ID" : "59","Type" : "pipeline",
			"SubInsts" : [
			{"Name" : "p_hls_fptosi_float_i32", "RefName" : "p_hls_fptosi_float_i32","ID" : "60","Type" : "pipeline"},]},]},
		{"Name" : "grp_compute_gate_Pipeline_GATE_PASS2_fu_138", "RefName" : "compute_gate_Pipeline_GATE_PASS2","ID" : "61","Type" : "sequential",
			"SubLoops" : [
			{"Name" : "GATE_PASS2","RefName" : "GATE_PASS2","ID" : "62","Type" : "pipeline",
			"SubInsts" : [
			{"Name" : "p_hls_fptosi_float_i32", "RefName" : "p_hls_fptosi_float_i32","ID" : "63","Type" : "pipeline"},
			{"Name" : "p_hls_fptosi_float_i32", "RefName" : "p_hls_fptosi_float_i32","ID" : "64","Type" : "pipeline"},]},]},
		{"Name" : "grp_compute_gate_Pipeline_4_fu_165", "RefName" : "compute_gate_Pipeline_4","ID" : "65","Type" : "sequential",
			"SubLoops" : [
			{"Name" : "Loop 1","RefName" : "Loop 1","ID" : "66","Type" : "pipeline"},]},
		{"Name" : "grp_compute_gate_Pipeline_GATE_PASS111_fu_177", "RefName" : "compute_gate_Pipeline_GATE_PASS111","ID" : "67","Type" : "sequential",
			"SubLoops" : [
			{"Name" : "GATE_PASS1","RefName" : "GATE_PASS1","ID" : "68","Type" : "pipeline",
			"SubInsts" : [
			{"Name" : "p_hls_fptosi_float_i32", "RefName" : "p_hls_fptosi_float_i32","ID" : "69","Type" : "pipeline"},]},]},
		{"Name" : "grp_compute_gate_Pipeline_GATE_PASS212_fu_195", "RefName" : "compute_gate_Pipeline_GATE_PASS212","ID" : "70","Type" : "sequential",
			"SubLoops" : [
			{"Name" : "GATE_PASS2","RefName" : "GATE_PASS2","ID" : "71","Type" : "pipeline",
			"SubInsts" : [
			{"Name" : "p_hls_fptosi_float_i32", "RefName" : "p_hls_fptosi_float_i32","ID" : "72","Type" : "pipeline"},
			{"Name" : "p_hls_fptosi_float_i32", "RefName" : "p_hls_fptosi_float_i32","ID" : "73","Type" : "pipeline"},]},]},
		{"Name" : "grp_compute_gate_Pipeline_7_fu_222", "RefName" : "compute_gate_Pipeline_7","ID" : "74","Type" : "sequential",
			"SubLoops" : [
			{"Name" : "Loop 1","RefName" : "Loop 1","ID" : "75","Type" : "pipeline"},]},
		{"Name" : "grp_compute_gate_Pipeline_GATE_PASS113_fu_234", "RefName" : "compute_gate_Pipeline_GATE_PASS113","ID" : "76","Type" : "sequential",
			"SubLoops" : [
			{"Name" : "GATE_PASS1","RefName" : "GATE_PASS1","ID" : "77","Type" : "pipeline",
			"SubInsts" : [
			{"Name" : "p_hls_fptosi_float_i32", "RefName" : "p_hls_fptosi_float_i32","ID" : "78","Type" : "pipeline"},]},]},
		{"Name" : "grp_compute_gate_Pipeline_GATE_PASS214_fu_252", "RefName" : "compute_gate_Pipeline_GATE_PASS214","ID" : "79","Type" : "sequential",
			"SubLoops" : [
			{"Name" : "GATE_PASS2","RefName" : "GATE_PASS2","ID" : "80","Type" : "pipeline",
			"SubInsts" : [
			{"Name" : "p_hls_fptosi_float_i32", "RefName" : "p_hls_fptosi_float_i32","ID" : "81","Type" : "pipeline"},
			{"Name" : "p_hls_fptosi_float_i32", "RefName" : "p_hls_fptosi_float_i32","ID" : "82","Type" : "pipeline"},]},]},
		{"Name" : "grp_compute_gate_Pipeline_10_fu_279", "RefName" : "compute_gate_Pipeline_10","ID" : "83","Type" : "sequential",
			"SubLoops" : [
			{"Name" : "Loop 1","RefName" : "Loop 1","ID" : "84","Type" : "pipeline"},]},
		{"Name" : "grp_compute_gate_Pipeline_GATE_PASS115_fu_291", "RefName" : "compute_gate_Pipeline_GATE_PASS115","ID" : "85","Type" : "sequential",
			"SubLoops" : [
			{"Name" : "GATE_PASS1","RefName" : "GATE_PASS1","ID" : "86","Type" : "pipeline",
			"SubInsts" : [
			{"Name" : "p_hls_fptosi_float_i32", "RefName" : "p_hls_fptosi_float_i32","ID" : "87","Type" : "pipeline"},]},]},
		{"Name" : "grp_compute_gate_Pipeline_GATE_PASS216_fu_309", "RefName" : "compute_gate_Pipeline_GATE_PASS216","ID" : "88","Type" : "sequential",
			"SubLoops" : [
			{"Name" : "GATE_PASS2","RefName" : "GATE_PASS2","ID" : "89","Type" : "pipeline",
			"SubInsts" : [
			{"Name" : "p_hls_fptosi_float_i32", "RefName" : "p_hls_fptosi_float_i32","ID" : "90","Type" : "pipeline"},
			{"Name" : "p_hls_fptosi_float_i32", "RefName" : "p_hls_fptosi_float_i32","ID" : "91","Type" : "pipeline"},]},]},]},
	{"Name" : "compute_output_U0", "RefName" : "compute_output","ID" : "92","Type" : "sequential",
		"SubInsts" : [
		{"Name" : "grp_compute_output_Pipeline_1_fu_1051", "RefName" : "compute_output_Pipeline_1","ID" : "93","Type" : "sequential",
			"SubLoops" : [
			{"Name" : "Loop 1","RefName" : "Loop 1","ID" : "94","Type" : "pipeline"},]},],
		"SubLoops" : [
		{"Name" : "DOWN_Q4K","RefName" : "DOWN_Q4K","ID" : "95","Type" : "no",
		"SubInsts" : [
		{"Name" : "grp_load_row_down_q4k_fu_719", "RefName" : "load_row_down_q4k","ID" : "96","Type" : "sequential",
				"SubInsts" : [
				{"Name" : "grp_load_row_down_q4k_Pipeline_LOAD_DOWN_Q4K_VITIS_LOOP_311_1_fu_97", "RefName" : "load_row_down_q4k_Pipeline_LOAD_DOWN_Q4K_VITIS_LOOP_311_1","ID" : "97","Type" : "sequential",
					"SubLoops" : [
					{"Name" : "LOAD_DOWN_Q4K_VITIS_LOOP_311_1","RefName" : "LOAD_DOWN_Q4K_VITIS_LOOP_311_1","ID" : "98","Type" : "pipeline"},]},]},
		{"Name" : "grp_mac_blocks_down_q4k7_fu_1021", "RefName" : "mac_blocks_down_q4k7","ID" : "99","Type" : "sequential",
				"SubInsts" : [
				{"Name" : "grp_mac_blocks_down_q4k7_Pipeline_UNPACK_HDR_DOWN_fu_4416", "RefName" : "mac_blocks_down_q4k7_Pipeline_UNPACK_HDR_DOWN","ID" : "100","Type" : "sequential",
					"SubLoops" : [
					{"Name" : "UNPACK_HDR_DOWN","RefName" : "UNPACK_HDR_DOWN","ID" : "101","Type" : "pipeline",
					"SubInsts" : [
					{"Name" : "fp16_to_fp32", "RefName" : "fp16_to_fp32","ID" : "102","Type" : "pipeline"},
					{"Name" : "fp16_to_fp32", "RefName" : "fp16_to_fp32","ID" : "103","Type" : "pipeline"},]},]},
				{"Name" : "grp_mac_blocks_down_q4k7_Pipeline_VITIS_LOOP_379_2_MAC_GROUP_fu_5012", "RefName" : "mac_blocks_down_q4k7_Pipeline_VITIS_LOOP_379_2_MAC_GROUP","ID" : "104","Type" : "sequential",
					"SubLoops" : [
					{"Name" : "VITIS_LOOP_379_2_MAC_GROUP","RefName" : "VITIS_LOOP_379_2_MAC_GROUP","ID" : "105","Type" : "pipeline"},]},
				{"Name" : "grp_mac_blocks_down_q4k7_Pipeline_REDUCE_DOWN_Q4K_fu_6072", "RefName" : "mac_blocks_down_q4k7_Pipeline_REDUCE_DOWN_Q4K","ID" : "106","Type" : "sequential",
					"SubLoops" : [
					{"Name" : "REDUCE_DOWN_Q4K","RefName" : "REDUCE_DOWN_Q4K","ID" : "107","Type" : "pipeline"},]},]},]},
		{"Name" : "DOWN_Q6K","RefName" : "DOWN_Q6K","ID" : "108","Type" : "no",
		"SubInsts" : [
		{"Name" : "grp_load_row_down_q6k_fu_735", "RefName" : "load_row_down_q6k","ID" : "109","Type" : "sequential",
				"SubInsts" : [
				{"Name" : "grp_load_row_down_q6k_Pipeline_LOAD_Q6K_FLAT_fu_1285", "RefName" : "load_row_down_q6k_Pipeline_LOAD_Q6K_FLAT","ID" : "110","Type" : "sequential",
					"SubLoops" : [
					{"Name" : "LOAD_Q6K_FLAT","RefName" : "LOAD_Q6K_FLAT","ID" : "111","Type" : "pipeline"},]},],
				"SubLoops" : [
				{"Name" : "VITIS_LOOP_449_1","RefName" : "VITIS_LOOP_449_1","ID" : "112","Type" : "no",
				"SubInsts" : [
				{"Name" : "grp_load_row_down_q6k_Pipeline_EXTRACT_QL_fu_1308", "RefName" : "load_row_down_q6k_Pipeline_EXTRACT_QL","ID" : "113","Type" : "sequential",
						"SubLoops" : [
						{"Name" : "EXTRACT_QL","RefName" : "EXTRACT_QL","ID" : "114","Type" : "pipeline"},]},
				{"Name" : "grp_load_row_down_q6k_Pipeline_EXTRACT_QH_fu_1397", "RefName" : "load_row_down_q6k_Pipeline_EXTRACT_QH","ID" : "115","Type" : "sequential",
						"SubLoops" : [
						{"Name" : "EXTRACT_QH","RefName" : "EXTRACT_QH","ID" : "116","Type" : "pipeline"},]},
				{"Name" : "grp_load_row_down_q6k_Pipeline_EXTRACT_SC_fu_1483", "RefName" : "load_row_down_q6k_Pipeline_EXTRACT_SC","ID" : "117","Type" : "sequential",
						"SubLoops" : [
						{"Name" : "EXTRACT_SC","RefName" : "EXTRACT_SC","ID" : "118","Type" : "pipeline"},]},
				{"Name" : "fp16_to_fp32", "RefName" : "fp16_to_fp32","ID" : "119","Type" : "pipeline"},
				{"Name" : "fp16_to_fp32", "RefName" : "fp16_to_fp32","ID" : "120","Type" : "pipeline"},
				{"Name" : "grp_fp16_to_fp32_fu_1595", "RefName" : "fp16_to_fp32","ID" : "121","Type" : "pipeline"},
				{"Name" : "grp_fp16_to_fp32_fu_1608", "RefName" : "fp16_to_fp32","ID" : "122","Type" : "pipeline"},]},]},
		{"Name" : "grp_mac_blocks_down_q6k_fu_871", "RefName" : "mac_blocks_down_q6k","ID" : "123","Type" : "sequential",
				"SubInsts" : [
				{"Name" : "grp_mac_blocks_down_q6k_Pipeline_VITIS_LOOP_517_2_Q6K_MAC_GROUP_fu_1518", "RefName" : "mac_blocks_down_q6k_Pipeline_VITIS_LOOP_517_2_Q6K_MAC_GROUP","ID" : "124","Type" : "sequential",
					"SubLoops" : [
					{"Name" : "VITIS_LOOP_517_2_Q6K_MAC_GROUP","RefName" : "VITIS_LOOP_517_2_Q6K_MAC_GROUP","ID" : "125","Type" : "pipeline"},]},
				{"Name" : "grp_mac_blocks_down_q6k_Pipeline_REDUCE_Q6K_fu_1986", "RefName" : "mac_blocks_down_q6k_Pipeline_REDUCE_Q6K","ID" : "126","Type" : "sequential",
					"SubLoops" : [
					{"Name" : "REDUCE_Q6K","RefName" : "REDUCE_Q6K","ID" : "127","Type" : "pipeline"},]},]},]},]},]
}]}