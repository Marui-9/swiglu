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
		{"Name" : "grp_load_row_wv_fu_529", "RefName" : "load_row_wv","ID" : "5","Type" : "sequential",
				"SubInsts" : [
				{"Name" : "grp_load_row_wv_Pipeline_LOAD_WV_VITIS_LOOP_71_1_fu_97", "RefName" : "load_row_wv_Pipeline_LOAD_WV_VITIS_LOOP_71_1","ID" : "6","Type" : "sequential",
					"SubLoops" : [
					{"Name" : "LOAD_WV_VITIS_LOOP_71_1","RefName" : "LOAD_WV_VITIS_LOOP_71_1","ID" : "7","Type" : "pipeline"},]},]},
		{"Name" : "grp_mac_blocks_wv_k4_fu_545", "RefName" : "mac_blocks_wv_k4","ID" : "8","Type" : "sequential",
				"SubInsts" : [
				{"Name" : "grp_mac_blocks_wv_k4_Pipeline_MAC_ALL_K4_fu_2956", "RefName" : "mac_blocks_wv_k4_Pipeline_MAC_ALL_K4","ID" : "9","Type" : "sequential",
					"SubLoops" : [
					{"Name" : "MAC_ALL_K4","RefName" : "MAC_ALL_K4","ID" : "10","Type" : "pipeline"},]},
				{"Name" : "grp_fp16_to_fp32_fu_4304", "RefName" : "fp16_to_fp32","ID" : "11","Type" : "pipeline"},
				{"Name" : "grp_fp16_to_fp32_fu_4309", "RefName" : "fp16_to_fp32","ID" : "12","Type" : "pipeline"},
				{"Name" : "grp_fp16_to_fp32_fu_4314", "RefName" : "fp16_to_fp32","ID" : "13","Type" : "pipeline"},
				{"Name" : "grp_fp16_to_fp32_fu_4319", "RefName" : "fp16_to_fp32","ID" : "14","Type" : "pipeline"},
				{"Name" : "grp_fp16_to_fp32_fu_4324", "RefName" : "fp16_to_fp32","ID" : "15","Type" : "pipeline"},
				{"Name" : "grp_fp16_to_fp32_fu_4329", "RefName" : "fp16_to_fp32","ID" : "16","Type" : "pipeline"},
				{"Name" : "grp_fp16_to_fp32_fu_4334", "RefName" : "fp16_to_fp32","ID" : "17","Type" : "pipeline"},
				{"Name" : "grp_fp16_to_fp32_fu_4339", "RefName" : "fp16_to_fp32","ID" : "18","Type" : "pipeline"},
				{"Name" : "grp_fp16_to_fp32_fu_4344", "RefName" : "fp16_to_fp32","ID" : "19","Type" : "pipeline"},
				{"Name" : "grp_fp16_to_fp32_fu_4349", "RefName" : "fp16_to_fp32","ID" : "20","Type" : "pipeline"},
				{"Name" : "grp_fp16_to_fp32_fu_4354", "RefName" : "fp16_to_fp32","ID" : "21","Type" : "pipeline"},
				{"Name" : "grp_fp16_to_fp32_fu_4359", "RefName" : "fp16_to_fp32","ID" : "22","Type" : "pipeline"},
				{"Name" : "grp_fp16_to_fp32_fu_4364", "RefName" : "fp16_to_fp32","ID" : "23","Type" : "pipeline"},
				{"Name" : "grp_fp16_to_fp32_fu_4369", "RefName" : "fp16_to_fp32","ID" : "24","Type" : "pipeline"},
				{"Name" : "grp_fp16_to_fp32_fu_4374", "RefName" : "fp16_to_fp32","ID" : "25","Type" : "pipeline"},
				{"Name" : "grp_fp16_to_fp32_fu_4379", "RefName" : "fp16_to_fp32","ID" : "26","Type" : "pipeline"},
				{"Name" : "grp_fp16_to_fp32_fu_4384", "RefName" : "fp16_to_fp32","ID" : "27","Type" : "pipeline"},
				{"Name" : "grp_fp16_to_fp32_fu_4389", "RefName" : "fp16_to_fp32","ID" : "28","Type" : "pipeline"},
				{"Name" : "grp_fp16_to_fp32_fu_4394", "RefName" : "fp16_to_fp32","ID" : "29","Type" : "pipeline"},
				{"Name" : "grp_fp16_to_fp32_fu_4399", "RefName" : "fp16_to_fp32","ID" : "30","Type" : "pipeline"},
				{"Name" : "grp_fp16_to_fp32_fu_4404", "RefName" : "fp16_to_fp32","ID" : "31","Type" : "pipeline"},
				{"Name" : "grp_fp16_to_fp32_fu_4409", "RefName" : "fp16_to_fp32","ID" : "32","Type" : "pipeline"},
				{"Name" : "grp_fp16_to_fp32_fu_4414", "RefName" : "fp16_to_fp32","ID" : "33","Type" : "pipeline"},
				{"Name" : "grp_fp16_to_fp32_fu_4419", "RefName" : "fp16_to_fp32","ID" : "34","Type" : "pipeline"},
				{"Name" : "grp_fp16_to_fp32_fu_4424", "RefName" : "fp16_to_fp32","ID" : "35","Type" : "pipeline"},
				{"Name" : "grp_fp16_to_fp32_fu_4429", "RefName" : "fp16_to_fp32","ID" : "36","Type" : "pipeline"},
				{"Name" : "grp_fp16_to_fp32_fu_4434", "RefName" : "fp16_to_fp32","ID" : "37","Type" : "pipeline"},
				{"Name" : "grp_fp16_to_fp32_fu_4439", "RefName" : "fp16_to_fp32","ID" : "38","Type" : "pipeline"},
				{"Name" : "grp_fp16_to_fp32_fu_4444", "RefName" : "fp16_to_fp32","ID" : "39","Type" : "pipeline"},
				{"Name" : "grp_fp16_to_fp32_fu_4449", "RefName" : "fp16_to_fp32","ID" : "40","Type" : "pipeline"},
				{"Name" : "grp_fp16_to_fp32_fu_4454", "RefName" : "fp16_to_fp32","ID" : "41","Type" : "pipeline"},
				{"Name" : "grp_fp16_to_fp32_fu_4459", "RefName" : "fp16_to_fp32","ID" : "42","Type" : "pipeline"},
				{"Name" : "grp_fp16_to_fp32_fu_4464", "RefName" : "fp16_to_fp32","ID" : "43","Type" : "pipeline"},
				{"Name" : "grp_fp16_to_fp32_fu_4469", "RefName" : "fp16_to_fp32","ID" : "44","Type" : "pipeline"},
				{"Name" : "grp_fp16_to_fp32_fu_4474", "RefName" : "fp16_to_fp32","ID" : "45","Type" : "pipeline"},
				{"Name" : "grp_fp16_to_fp32_fu_4479", "RefName" : "fp16_to_fp32","ID" : "46","Type" : "pipeline"},
				{"Name" : "grp_fp16_to_fp32_fu_4484", "RefName" : "fp16_to_fp32","ID" : "47","Type" : "pipeline"},
				{"Name" : "grp_fp16_to_fp32_fu_4489", "RefName" : "fp16_to_fp32","ID" : "48","Type" : "pipeline"},
				{"Name" : "grp_fp16_to_fp32_fu_4494", "RefName" : "fp16_to_fp32","ID" : "49","Type" : "pipeline"},
				{"Name" : "grp_fp16_to_fp32_fu_4499", "RefName" : "fp16_to_fp32","ID" : "50","Type" : "pipeline"},
				{"Name" : "grp_fp16_to_fp32_fu_4504", "RefName" : "fp16_to_fp32","ID" : "51","Type" : "pipeline"},
				{"Name" : "grp_fp16_to_fp32_fu_4509", "RefName" : "fp16_to_fp32","ID" : "52","Type" : "pipeline"},
				{"Name" : "grp_fp16_to_fp32_fu_4514", "RefName" : "fp16_to_fp32","ID" : "53","Type" : "pipeline"},
				{"Name" : "grp_fp16_to_fp32_fu_4519", "RefName" : "fp16_to_fp32","ID" : "54","Type" : "pipeline"},
				{"Name" : "grp_fp16_to_fp32_fu_4524", "RefName" : "fp16_to_fp32","ID" : "55","Type" : "pipeline"},
				{"Name" : "grp_fp16_to_fp32_fu_4529", "RefName" : "fp16_to_fp32","ID" : "56","Type" : "pipeline"},
				{"Name" : "grp_fp16_to_fp32_fu_4534", "RefName" : "fp16_to_fp32","ID" : "57","Type" : "pipeline"},
				{"Name" : "grp_fp16_to_fp32_fu_4539", "RefName" : "fp16_to_fp32","ID" : "58","Type" : "pipeline"},
				{"Name" : "grp_fp16_to_fp32_fu_4544", "RefName" : "fp16_to_fp32","ID" : "59","Type" : "pipeline"},
				{"Name" : "grp_fp16_to_fp32_fu_4549", "RefName" : "fp16_to_fp32","ID" : "60","Type" : "pipeline"},
				{"Name" : "grp_fp16_to_fp32_fu_4554", "RefName" : "fp16_to_fp32","ID" : "61","Type" : "pipeline"},
				{"Name" : "grp_fp16_to_fp32_fu_4559", "RefName" : "fp16_to_fp32","ID" : "62","Type" : "pipeline"},
				{"Name" : "grp_fp16_to_fp32_fu_4564", "RefName" : "fp16_to_fp32","ID" : "63","Type" : "pipeline"},
				{"Name" : "grp_fp16_to_fp32_fu_4569", "RefName" : "fp16_to_fp32","ID" : "64","Type" : "pipeline"},
				{"Name" : "grp_fp16_to_fp32_fu_4574", "RefName" : "fp16_to_fp32","ID" : "65","Type" : "pipeline"},
				{"Name" : "grp_fp16_to_fp32_fu_4579", "RefName" : "fp16_to_fp32","ID" : "66","Type" : "pipeline"},
				{"Name" : "grp_fp16_to_fp32_fu_4584", "RefName" : "fp16_to_fp32","ID" : "67","Type" : "pipeline"},
				{"Name" : "grp_fp16_to_fp32_fu_4589", "RefName" : "fp16_to_fp32","ID" : "68","Type" : "pipeline"},
				{"Name" : "grp_fp16_to_fp32_fu_4594", "RefName" : "fp16_to_fp32","ID" : "69","Type" : "pipeline"},
				{"Name" : "grp_fp16_to_fp32_fu_4599", "RefName" : "fp16_to_fp32","ID" : "70","Type" : "pipeline"},
				{"Name" : "grp_fp16_to_fp32_fu_4604", "RefName" : "fp16_to_fp32","ID" : "71","Type" : "pipeline"},
				{"Name" : "grp_fp16_to_fp32_fu_4609", "RefName" : "fp16_to_fp32","ID" : "72","Type" : "pipeline"},
				{"Name" : "grp_fp16_to_fp32_fu_4614", "RefName" : "fp16_to_fp32","ID" : "73","Type" : "pipeline"},
				{"Name" : "grp_fp16_to_fp32_fu_4619", "RefName" : "fp16_to_fp32","ID" : "74","Type" : "pipeline"},]},]},]},
	{"Name" : "compute_X2_U0", "RefName" : "compute_X2","ID" : "75","Type" : "sequential",
		"SubLoops" : [
		{"Name" : "COMPUTE_X2","RefName" : "COMPUTE_X2","ID" : "76","Type" : "no",
		"SubInsts" : [
		{"Name" : "grp_load_row_wv_fu_529", "RefName" : "load_row_wv","ID" : "77","Type" : "sequential",
				"SubInsts" : [
				{"Name" : "grp_load_row_wv_Pipeline_LOAD_WV_VITIS_LOOP_71_1_fu_97", "RefName" : "load_row_wv_Pipeline_LOAD_WV_VITIS_LOOP_71_1","ID" : "78","Type" : "sequential",
					"SubLoops" : [
					{"Name" : "LOAD_WV_VITIS_LOOP_71_1","RefName" : "LOAD_WV_VITIS_LOOP_71_1","ID" : "79","Type" : "pipeline"},]},]},
		{"Name" : "grp_mac_blocks_wv_k4_fu_545", "RefName" : "mac_blocks_wv_k4","ID" : "80","Type" : "sequential",
				"SubInsts" : [
				{"Name" : "grp_mac_blocks_wv_k4_Pipeline_MAC_ALL_K4_fu_2956", "RefName" : "mac_blocks_wv_k4_Pipeline_MAC_ALL_K4","ID" : "81","Type" : "sequential",
					"SubLoops" : [
					{"Name" : "MAC_ALL_K4","RefName" : "MAC_ALL_K4","ID" : "82","Type" : "pipeline"},]},
				{"Name" : "grp_fp16_to_fp32_fu_4304", "RefName" : "fp16_to_fp32","ID" : "83","Type" : "pipeline"},
				{"Name" : "grp_fp16_to_fp32_fu_4309", "RefName" : "fp16_to_fp32","ID" : "84","Type" : "pipeline"},
				{"Name" : "grp_fp16_to_fp32_fu_4314", "RefName" : "fp16_to_fp32","ID" : "85","Type" : "pipeline"},
				{"Name" : "grp_fp16_to_fp32_fu_4319", "RefName" : "fp16_to_fp32","ID" : "86","Type" : "pipeline"},
				{"Name" : "grp_fp16_to_fp32_fu_4324", "RefName" : "fp16_to_fp32","ID" : "87","Type" : "pipeline"},
				{"Name" : "grp_fp16_to_fp32_fu_4329", "RefName" : "fp16_to_fp32","ID" : "88","Type" : "pipeline"},
				{"Name" : "grp_fp16_to_fp32_fu_4334", "RefName" : "fp16_to_fp32","ID" : "89","Type" : "pipeline"},
				{"Name" : "grp_fp16_to_fp32_fu_4339", "RefName" : "fp16_to_fp32","ID" : "90","Type" : "pipeline"},
				{"Name" : "grp_fp16_to_fp32_fu_4344", "RefName" : "fp16_to_fp32","ID" : "91","Type" : "pipeline"},
				{"Name" : "grp_fp16_to_fp32_fu_4349", "RefName" : "fp16_to_fp32","ID" : "92","Type" : "pipeline"},
				{"Name" : "grp_fp16_to_fp32_fu_4354", "RefName" : "fp16_to_fp32","ID" : "93","Type" : "pipeline"},
				{"Name" : "grp_fp16_to_fp32_fu_4359", "RefName" : "fp16_to_fp32","ID" : "94","Type" : "pipeline"},
				{"Name" : "grp_fp16_to_fp32_fu_4364", "RefName" : "fp16_to_fp32","ID" : "95","Type" : "pipeline"},
				{"Name" : "grp_fp16_to_fp32_fu_4369", "RefName" : "fp16_to_fp32","ID" : "96","Type" : "pipeline"},
				{"Name" : "grp_fp16_to_fp32_fu_4374", "RefName" : "fp16_to_fp32","ID" : "97","Type" : "pipeline"},
				{"Name" : "grp_fp16_to_fp32_fu_4379", "RefName" : "fp16_to_fp32","ID" : "98","Type" : "pipeline"},
				{"Name" : "grp_fp16_to_fp32_fu_4384", "RefName" : "fp16_to_fp32","ID" : "99","Type" : "pipeline"},
				{"Name" : "grp_fp16_to_fp32_fu_4389", "RefName" : "fp16_to_fp32","ID" : "100","Type" : "pipeline"},
				{"Name" : "grp_fp16_to_fp32_fu_4394", "RefName" : "fp16_to_fp32","ID" : "101","Type" : "pipeline"},
				{"Name" : "grp_fp16_to_fp32_fu_4399", "RefName" : "fp16_to_fp32","ID" : "102","Type" : "pipeline"},
				{"Name" : "grp_fp16_to_fp32_fu_4404", "RefName" : "fp16_to_fp32","ID" : "103","Type" : "pipeline"},
				{"Name" : "grp_fp16_to_fp32_fu_4409", "RefName" : "fp16_to_fp32","ID" : "104","Type" : "pipeline"},
				{"Name" : "grp_fp16_to_fp32_fu_4414", "RefName" : "fp16_to_fp32","ID" : "105","Type" : "pipeline"},
				{"Name" : "grp_fp16_to_fp32_fu_4419", "RefName" : "fp16_to_fp32","ID" : "106","Type" : "pipeline"},
				{"Name" : "grp_fp16_to_fp32_fu_4424", "RefName" : "fp16_to_fp32","ID" : "107","Type" : "pipeline"},
				{"Name" : "grp_fp16_to_fp32_fu_4429", "RefName" : "fp16_to_fp32","ID" : "108","Type" : "pipeline"},
				{"Name" : "grp_fp16_to_fp32_fu_4434", "RefName" : "fp16_to_fp32","ID" : "109","Type" : "pipeline"},
				{"Name" : "grp_fp16_to_fp32_fu_4439", "RefName" : "fp16_to_fp32","ID" : "110","Type" : "pipeline"},
				{"Name" : "grp_fp16_to_fp32_fu_4444", "RefName" : "fp16_to_fp32","ID" : "111","Type" : "pipeline"},
				{"Name" : "grp_fp16_to_fp32_fu_4449", "RefName" : "fp16_to_fp32","ID" : "112","Type" : "pipeline"},
				{"Name" : "grp_fp16_to_fp32_fu_4454", "RefName" : "fp16_to_fp32","ID" : "113","Type" : "pipeline"},
				{"Name" : "grp_fp16_to_fp32_fu_4459", "RefName" : "fp16_to_fp32","ID" : "114","Type" : "pipeline"},
				{"Name" : "grp_fp16_to_fp32_fu_4464", "RefName" : "fp16_to_fp32","ID" : "115","Type" : "pipeline"},
				{"Name" : "grp_fp16_to_fp32_fu_4469", "RefName" : "fp16_to_fp32","ID" : "116","Type" : "pipeline"},
				{"Name" : "grp_fp16_to_fp32_fu_4474", "RefName" : "fp16_to_fp32","ID" : "117","Type" : "pipeline"},
				{"Name" : "grp_fp16_to_fp32_fu_4479", "RefName" : "fp16_to_fp32","ID" : "118","Type" : "pipeline"},
				{"Name" : "grp_fp16_to_fp32_fu_4484", "RefName" : "fp16_to_fp32","ID" : "119","Type" : "pipeline"},
				{"Name" : "grp_fp16_to_fp32_fu_4489", "RefName" : "fp16_to_fp32","ID" : "120","Type" : "pipeline"},
				{"Name" : "grp_fp16_to_fp32_fu_4494", "RefName" : "fp16_to_fp32","ID" : "121","Type" : "pipeline"},
				{"Name" : "grp_fp16_to_fp32_fu_4499", "RefName" : "fp16_to_fp32","ID" : "122","Type" : "pipeline"},
				{"Name" : "grp_fp16_to_fp32_fu_4504", "RefName" : "fp16_to_fp32","ID" : "123","Type" : "pipeline"},
				{"Name" : "grp_fp16_to_fp32_fu_4509", "RefName" : "fp16_to_fp32","ID" : "124","Type" : "pipeline"},
				{"Name" : "grp_fp16_to_fp32_fu_4514", "RefName" : "fp16_to_fp32","ID" : "125","Type" : "pipeline"},
				{"Name" : "grp_fp16_to_fp32_fu_4519", "RefName" : "fp16_to_fp32","ID" : "126","Type" : "pipeline"},
				{"Name" : "grp_fp16_to_fp32_fu_4524", "RefName" : "fp16_to_fp32","ID" : "127","Type" : "pipeline"},
				{"Name" : "grp_fp16_to_fp32_fu_4529", "RefName" : "fp16_to_fp32","ID" : "128","Type" : "pipeline"},
				{"Name" : "grp_fp16_to_fp32_fu_4534", "RefName" : "fp16_to_fp32","ID" : "129","Type" : "pipeline"},
				{"Name" : "grp_fp16_to_fp32_fu_4539", "RefName" : "fp16_to_fp32","ID" : "130","Type" : "pipeline"},
				{"Name" : "grp_fp16_to_fp32_fu_4544", "RefName" : "fp16_to_fp32","ID" : "131","Type" : "pipeline"},
				{"Name" : "grp_fp16_to_fp32_fu_4549", "RefName" : "fp16_to_fp32","ID" : "132","Type" : "pipeline"},
				{"Name" : "grp_fp16_to_fp32_fu_4554", "RefName" : "fp16_to_fp32","ID" : "133","Type" : "pipeline"},
				{"Name" : "grp_fp16_to_fp32_fu_4559", "RefName" : "fp16_to_fp32","ID" : "134","Type" : "pipeline"},
				{"Name" : "grp_fp16_to_fp32_fu_4564", "RefName" : "fp16_to_fp32","ID" : "135","Type" : "pipeline"},
				{"Name" : "grp_fp16_to_fp32_fu_4569", "RefName" : "fp16_to_fp32","ID" : "136","Type" : "pipeline"},
				{"Name" : "grp_fp16_to_fp32_fu_4574", "RefName" : "fp16_to_fp32","ID" : "137","Type" : "pipeline"},
				{"Name" : "grp_fp16_to_fp32_fu_4579", "RefName" : "fp16_to_fp32","ID" : "138","Type" : "pipeline"},
				{"Name" : "grp_fp16_to_fp32_fu_4584", "RefName" : "fp16_to_fp32","ID" : "139","Type" : "pipeline"},
				{"Name" : "grp_fp16_to_fp32_fu_4589", "RefName" : "fp16_to_fp32","ID" : "140","Type" : "pipeline"},
				{"Name" : "grp_fp16_to_fp32_fu_4594", "RefName" : "fp16_to_fp32","ID" : "141","Type" : "pipeline"},
				{"Name" : "grp_fp16_to_fp32_fu_4599", "RefName" : "fp16_to_fp32","ID" : "142","Type" : "pipeline"},
				{"Name" : "grp_fp16_to_fp32_fu_4604", "RefName" : "fp16_to_fp32","ID" : "143","Type" : "pipeline"},
				{"Name" : "grp_fp16_to_fp32_fu_4609", "RefName" : "fp16_to_fp32","ID" : "144","Type" : "pipeline"},
				{"Name" : "grp_fp16_to_fp32_fu_4614", "RefName" : "fp16_to_fp32","ID" : "145","Type" : "pipeline"},
				{"Name" : "grp_fp16_to_fp32_fu_4619", "RefName" : "fp16_to_fp32","ID" : "146","Type" : "pipeline"},]},]},]},
	{"Name" : "gate_scale_U", "RefName" : "compute_gate","ID" : "147","Type" : "sequential",
		"SubInsts" : [
		{"Name" : "grp_compute_gate_Pipeline_1_fu_106", "RefName" : "compute_gate_Pipeline_1","ID" : "148","Type" : "sequential",
			"SubLoops" : [
			{"Name" : "Loop 1","RefName" : "Loop 1","ID" : "149","Type" : "pipeline"},]},
		{"Name" : "grp_compute_gate_Pipeline_GATE_PASS1_fu_118", "RefName" : "compute_gate_Pipeline_GATE_PASS1","ID" : "150","Type" : "sequential",
			"SubLoops" : [
			{"Name" : "GATE_PASS1","RefName" : "GATE_PASS1","ID" : "151","Type" : "pipeline",
			"SubInsts" : [
			{"Name" : "p_hls_fptosi_float_i32", "RefName" : "p_hls_fptosi_float_i32","ID" : "152","Type" : "pipeline"},]},]},
		{"Name" : "grp_compute_gate_Pipeline_GATE_PASS2_fu_136", "RefName" : "compute_gate_Pipeline_GATE_PASS2","ID" : "153","Type" : "sequential",
			"SubLoops" : [
			{"Name" : "GATE_PASS2","RefName" : "GATE_PASS2","ID" : "154","Type" : "pipeline",
			"SubInsts" : [
			{"Name" : "p_hls_fptosi_float_i32", "RefName" : "p_hls_fptosi_float_i32","ID" : "155","Type" : "pipeline"},
			{"Name" : "p_hls_fptosi_float_i32", "RefName" : "p_hls_fptosi_float_i32","ID" : "156","Type" : "pipeline"},]},]},
		{"Name" : "grp_compute_gate_Pipeline_4_fu_163", "RefName" : "compute_gate_Pipeline_4","ID" : "157","Type" : "sequential",
			"SubLoops" : [
			{"Name" : "Loop 1","RefName" : "Loop 1","ID" : "158","Type" : "pipeline"},]},
		{"Name" : "grp_compute_gate_Pipeline_GATE_PASS111_fu_175", "RefName" : "compute_gate_Pipeline_GATE_PASS111","ID" : "159","Type" : "sequential",
			"SubLoops" : [
			{"Name" : "GATE_PASS1","RefName" : "GATE_PASS1","ID" : "160","Type" : "pipeline",
			"SubInsts" : [
			{"Name" : "p_hls_fptosi_float_i32", "RefName" : "p_hls_fptosi_float_i32","ID" : "161","Type" : "pipeline"},]},]},
		{"Name" : "grp_compute_gate_Pipeline_GATE_PASS212_fu_193", "RefName" : "compute_gate_Pipeline_GATE_PASS212","ID" : "162","Type" : "sequential",
			"SubLoops" : [
			{"Name" : "GATE_PASS2","RefName" : "GATE_PASS2","ID" : "163","Type" : "pipeline",
			"SubInsts" : [
			{"Name" : "p_hls_fptosi_float_i32", "RefName" : "p_hls_fptosi_float_i32","ID" : "164","Type" : "pipeline"},
			{"Name" : "p_hls_fptosi_float_i32", "RefName" : "p_hls_fptosi_float_i32","ID" : "165","Type" : "pipeline"},]},]},
		{"Name" : "grp_compute_gate_Pipeline_7_fu_220", "RefName" : "compute_gate_Pipeline_7","ID" : "166","Type" : "sequential",
			"SubLoops" : [
			{"Name" : "Loop 1","RefName" : "Loop 1","ID" : "167","Type" : "pipeline"},]},
		{"Name" : "grp_compute_gate_Pipeline_GATE_PASS113_fu_232", "RefName" : "compute_gate_Pipeline_GATE_PASS113","ID" : "168","Type" : "sequential",
			"SubLoops" : [
			{"Name" : "GATE_PASS1","RefName" : "GATE_PASS1","ID" : "169","Type" : "pipeline",
			"SubInsts" : [
			{"Name" : "p_hls_fptosi_float_i32", "RefName" : "p_hls_fptosi_float_i32","ID" : "170","Type" : "pipeline"},]},]},
		{"Name" : "grp_compute_gate_Pipeline_GATE_PASS214_fu_250", "RefName" : "compute_gate_Pipeline_GATE_PASS214","ID" : "171","Type" : "sequential",
			"SubLoops" : [
			{"Name" : "GATE_PASS2","RefName" : "GATE_PASS2","ID" : "172","Type" : "pipeline",
			"SubInsts" : [
			{"Name" : "p_hls_fptosi_float_i32", "RefName" : "p_hls_fptosi_float_i32","ID" : "173","Type" : "pipeline"},
			{"Name" : "p_hls_fptosi_float_i32", "RefName" : "p_hls_fptosi_float_i32","ID" : "174","Type" : "pipeline"},]},]},
		{"Name" : "grp_compute_gate_Pipeline_10_fu_277", "RefName" : "compute_gate_Pipeline_10","ID" : "175","Type" : "sequential",
			"SubLoops" : [
			{"Name" : "Loop 1","RefName" : "Loop 1","ID" : "176","Type" : "pipeline"},]},
		{"Name" : "grp_compute_gate_Pipeline_GATE_PASS115_fu_289", "RefName" : "compute_gate_Pipeline_GATE_PASS115","ID" : "177","Type" : "sequential",
			"SubLoops" : [
			{"Name" : "GATE_PASS1","RefName" : "GATE_PASS1","ID" : "178","Type" : "pipeline",
			"SubInsts" : [
			{"Name" : "p_hls_fptosi_float_i32", "RefName" : "p_hls_fptosi_float_i32","ID" : "179","Type" : "pipeline"},]},]},
		{"Name" : "grp_compute_gate_Pipeline_GATE_PASS216_fu_307", "RefName" : "compute_gate_Pipeline_GATE_PASS216","ID" : "180","Type" : "sequential",
			"SubLoops" : [
			{"Name" : "GATE_PASS2","RefName" : "GATE_PASS2","ID" : "181","Type" : "pipeline",
			"SubInsts" : [
			{"Name" : "p_hls_fptosi_float_i32", "RefName" : "p_hls_fptosi_float_i32","ID" : "182","Type" : "pipeline"},
			{"Name" : "p_hls_fptosi_float_i32", "RefName" : "p_hls_fptosi_float_i32","ID" : "183","Type" : "pipeline"},]},]},]},
	{"Name" : "compute_output_U0", "RefName" : "compute_output","ID" : "184","Type" : "sequential",
		"SubInsts" : [
		{"Name" : "grp_compute_output_Pipeline_1_fu_1050", "RefName" : "compute_output_Pipeline_1","ID" : "185","Type" : "sequential",
			"SubLoops" : [
			{"Name" : "Loop 1","RefName" : "Loop 1","ID" : "186","Type" : "pipeline"},]},],
		"SubLoops" : [
		{"Name" : "DOWN_Q4K","RefName" : "DOWN_Q4K","ID" : "187","Type" : "no",
		"SubInsts" : [
		{"Name" : "grp_load_row_down_q4k_fu_719", "RefName" : "load_row_down_q4k","ID" : "188","Type" : "sequential",
				"SubInsts" : [
				{"Name" : "grp_load_row_down_q4k_Pipeline_LOAD_DOWN_Q4K_VITIS_LOOP_435_1_fu_97", "RefName" : "load_row_down_q4k_Pipeline_LOAD_DOWN_Q4K_VITIS_LOOP_435_1","ID" : "189","Type" : "sequential",
					"SubLoops" : [
					{"Name" : "LOAD_DOWN_Q4K_VITIS_LOOP_435_1","RefName" : "LOAD_DOWN_Q4K_VITIS_LOOP_435_1","ID" : "190","Type" : "pipeline"},]},]},
		{"Name" : "grp_mac_blocks_down_q4k7_fu_1020", "RefName" : "mac_blocks_down_q4k7","ID" : "191","Type" : "sequential",
				"SubInsts" : [
				{"Name" : "grp_mac_blocks_down_q4k7_Pipeline_UNPACK_HDR_DOWN_fu_4416", "RefName" : "mac_blocks_down_q4k7_Pipeline_UNPACK_HDR_DOWN","ID" : "192","Type" : "sequential",
					"SubLoops" : [
					{"Name" : "UNPACK_HDR_DOWN","RefName" : "UNPACK_HDR_DOWN","ID" : "193","Type" : "pipeline",
					"SubInsts" : [
					{"Name" : "fp16_to_fp32", "RefName" : "fp16_to_fp32","ID" : "194","Type" : "pipeline"},
					{"Name" : "fp16_to_fp32", "RefName" : "fp16_to_fp32","ID" : "195","Type" : "pipeline"},]},]},
				{"Name" : "grp_mac_blocks_down_q4k7_Pipeline_VITIS_LOOP_504_2_MAC_GROUP_fu_5012", "RefName" : "mac_blocks_down_q4k7_Pipeline_VITIS_LOOP_504_2_MAC_GROUP","ID" : "196","Type" : "sequential",
					"SubLoops" : [
					{"Name" : "VITIS_LOOP_504_2_MAC_GROUP","RefName" : "VITIS_LOOP_504_2_MAC_GROUP","ID" : "197","Type" : "pipeline"},]},
				{"Name" : "grp_mac_blocks_down_q4k7_Pipeline_REDUCE_DOWN_Q4K_fu_6072", "RefName" : "mac_blocks_down_q4k7_Pipeline_REDUCE_DOWN_Q4K","ID" : "198","Type" : "sequential",
					"SubLoops" : [
					{"Name" : "REDUCE_DOWN_Q4K","RefName" : "REDUCE_DOWN_Q4K","ID" : "199","Type" : "pipeline"},]},]},]},
		{"Name" : "DOWN_Q6K","RefName" : "DOWN_Q6K","ID" : "200","Type" : "no",
		"SubInsts" : [
		{"Name" : "grp_load_row_down_q6k_fu_735", "RefName" : "load_row_down_q6k","ID" : "201","Type" : "sequential",
				"SubInsts" : [
				{"Name" : "grp_load_row_down_q6k_Pipeline_LOAD_Q6K_FLAT_fu_1285", "RefName" : "load_row_down_q6k_Pipeline_LOAD_Q6K_FLAT","ID" : "202","Type" : "sequential",
					"SubLoops" : [
					{"Name" : "LOAD_Q6K_FLAT","RefName" : "LOAD_Q6K_FLAT","ID" : "203","Type" : "pipeline"},]},],
				"SubLoops" : [
				{"Name" : "VITIS_LOOP_573_1","RefName" : "VITIS_LOOP_573_1","ID" : "204","Type" : "no",
				"SubInsts" : [
				{"Name" : "grp_load_row_down_q6k_Pipeline_EXTRACT_QL_fu_1308", "RefName" : "load_row_down_q6k_Pipeline_EXTRACT_QL","ID" : "205","Type" : "sequential",
						"SubLoops" : [
						{"Name" : "EXTRACT_QL","RefName" : "EXTRACT_QL","ID" : "206","Type" : "pipeline"},]},
				{"Name" : "grp_load_row_down_q6k_Pipeline_EXTRACT_QH_fu_1397", "RefName" : "load_row_down_q6k_Pipeline_EXTRACT_QH","ID" : "207","Type" : "sequential",
						"SubLoops" : [
						{"Name" : "EXTRACT_QH","RefName" : "EXTRACT_QH","ID" : "208","Type" : "pipeline"},]},
				{"Name" : "grp_load_row_down_q6k_Pipeline_EXTRACT_SC_fu_1483", "RefName" : "load_row_down_q6k_Pipeline_EXTRACT_SC","ID" : "209","Type" : "sequential",
						"SubLoops" : [
						{"Name" : "EXTRACT_SC","RefName" : "EXTRACT_SC","ID" : "210","Type" : "pipeline"},]},
				{"Name" : "fp16_to_fp32", "RefName" : "fp16_to_fp32","ID" : "211","Type" : "pipeline"},
				{"Name" : "fp16_to_fp32", "RefName" : "fp16_to_fp32","ID" : "212","Type" : "pipeline"},
				{"Name" : "grp_fp16_to_fp32_fu_1595", "RefName" : "fp16_to_fp32","ID" : "213","Type" : "pipeline"},
				{"Name" : "grp_fp16_to_fp32_fu_1608", "RefName" : "fp16_to_fp32","ID" : "214","Type" : "pipeline"},]},]},
		{"Name" : "grp_mac_blocks_down_q6k_fu_871", "RefName" : "mac_blocks_down_q6k","ID" : "215","Type" : "sequential",
				"SubInsts" : [
				{"Name" : "grp_mac_blocks_down_q6k_Pipeline_VITIS_LOOP_641_2_Q6K_MAC_GROUP_fu_1514", "RefName" : "mac_blocks_down_q6k_Pipeline_VITIS_LOOP_641_2_Q6K_MAC_GROUP","ID" : "216","Type" : "sequential",
					"SubLoops" : [
					{"Name" : "VITIS_LOOP_641_2_Q6K_MAC_GROUP","RefName" : "VITIS_LOOP_641_2_Q6K_MAC_GROUP","ID" : "217","Type" : "pipeline"},]},]},]},]},]
}]}