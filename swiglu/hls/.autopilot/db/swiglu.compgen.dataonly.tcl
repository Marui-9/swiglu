# This script segment is generated automatically by AutoPilot

set axilite_register_dict [dict create]
set port_CTRL {
W { 
	dir I
	width 64
	depth 1
	mode ap_none
	offset 16
	offset_end 27
}
V { 
	dir I
	width 64
	depth 1
	mode ap_none
	offset 28
	offset_end 39
}
W_down { 
	dir I
	width 64
	depth 1
	mode ap_none
	offset 40
	offset_end 51
}
W_down2 { 
	dir I
	width 64
	depth 1
	mode ap_none
	offset 52
	offset_end 63
}
x_batch { 
	dir I
	width 64
	depth 1
	mode ap_none
	offset 64
	offset_end 75
}
out_batch { 
	dir I
	width 64
	depth 1
	mode ap_none
	offset 76
	offset_end 87
}
down_quant_mode { 
	dir I
	width 32
	depth 1
	mode ap_none
	offset 88
	offset_end 95
}
x_scale { 
	dir I
	width 32
	depth 1
	mode ap_none
	offset 96
	offset_end 103
}
ap_start { }
ap_done { }
ap_ready { }
ap_idle { }
interrupt {
}
}
dict set axilite_register_dict CTRL $port_CTRL


