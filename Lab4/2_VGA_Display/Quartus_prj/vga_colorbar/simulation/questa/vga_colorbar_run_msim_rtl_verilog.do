transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+E:/EIE330_FPGA/Lab4/2_VGA_Display/RTL {E:/EIE330_FPGA/Lab4/2_VGA_Display/RTL/vga_pic.v}
vlog -vlog01compat -work work +incdir+E:/EIE330_FPGA/Lab4/2_VGA_Display/RTL {E:/EIE330_FPGA/Lab4/2_VGA_Display/RTL/vga_ctrl.v}
vlog -vlog01compat -work work +incdir+E:/EIE330_FPGA/Lab4/2_VGA_Display/RTL {E:/EIE330_FPGA/Lab4/2_VGA_Display/RTL/hdmi_ctrl.v}
vlog -vlog01compat -work work +incdir+E:/EIE330_FPGA/Lab4/2_VGA_Display/RTL {E:/EIE330_FPGA/Lab4/2_VGA_Display/RTL/hdmi_enc.v}
vlog -vlog01compat -work work +incdir+E:/EIE330_FPGA/Lab4/2_VGA_Display/RTL/ipcore {E:/EIE330_FPGA/Lab4/2_VGA_Display/RTL/ipcore/ddio_out.v}
vlog -vlog01compat -work work +incdir+E:/EIE330_FPGA/Lab4/2_VGA_Display/RTL {E:/EIE330_FPGA/Lab4/2_VGA_Display/RTL/par_to_ser.v}
vlog -vlog01compat -work work +incdir+E:/EIE330_FPGA/Lab4/2_VGA_Display/RTL {E:/EIE330_FPGA/Lab4/2_VGA_Display/RTL/hdmi_colorbar.v}

vlog -vlog01compat -work work +incdir+E:/EIE330_FPGA/Lab4/2_VGA_Display/Quartus_prj/vga_colorbar/../../Sim {E:/EIE330_FPGA/Lab4/2_VGA_Display/Quartus_prj/vga_colorbar/../../Sim/tb_hdmi_colorbar.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  tb_hdmi_colorbar

add wave *
view structure
view signals
run 5 sec
