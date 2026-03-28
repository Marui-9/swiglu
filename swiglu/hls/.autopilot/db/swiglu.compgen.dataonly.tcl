# This script segment is generated automatically by AutoPilot

set axilite_register_dict [dict create]
set port_CTRL {
W { 
	dir I
	width 8
	depth 1
	mode ap_none
	offset 16
	offset_end 23
}
V { 
	dir I
	width 8
	depth 1
	mode ap_none
	offset 24
	offset_end 31
}
W_down { 
	dir I
	width 8
	depth 1
	mode ap_none
	offset 32
	offset_end 39
}
x_batch { 
	dir I
	width 8
	depth 1
	mode ap_none
	offset 40
	offset_end 47
}
out_batch { 
	dir I
	width 64
	depth 1
	mode ap_none
	offset 48
	offset_end 59
}
down_quant_mode { 
	dir I
	width 32
	depth 1
	mode ap_none
	offset 60
	offset_end 67
}
x_scale { 
	dir I
	width 32
	depth 1
	mode ap_none
	offset 68
	offset_end 75
}
ap_start { }
ap_done { }
ap_ready { }
ap_idle { }
interrupt {
}
}
dict set axilite_register_dict CTRL $port_CTRL


