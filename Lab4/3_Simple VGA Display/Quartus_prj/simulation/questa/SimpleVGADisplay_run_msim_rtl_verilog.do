transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+E:/EIE330_FPGA/Lab4/3_Simple\ VGA\ Display/RTL {E:/EIE330_FPGA/Lab4/3_Simple VGA Display/RTL/SimpleVGADisplay.v}
vlog -vlog01compat -work work +incdir+E:/EIE330_FPGA/Lab4/3_Simple\ VGA\ Display/RTL {E:/EIE330_FPGA/Lab4/3_Simple VGA Display/RTL/vga_pic.v}
vlog -vlog01compat -work work +incdir+E:/EIE330_FPGA/Lab4/3_Simple\ VGA\ Display/RTL {E:/EIE330_FPGA/Lab4/3_Simple VGA Display/RTL/vga_ctrl.v}
vlog -vlog01compat -work work +incdir+E:/EIE330_FPGA/Lab4/3_Simple\ VGA\ Display/RTL {E:/EIE330_FPGA/Lab4/3_Simple VGA Display/RTL/clk_gen.v}
vlog -vlog01compat -work work +incdir+E:/EIE330_FPGA/Lab4/3_Simple\ VGA\ Display/Quartus_prj/db {E:/EIE330_FPGA/Lab4/3_Simple VGA Display/Quartus_prj/db/clk_gen_altpll.v}

vlog -vlog01compat -work work +incdir+E:/EIE330_FPGA/Lab4/3_Simple\ VGA\ Display/Quartus_prj/../Sim {E:/EIE330_FPGA/Lab4/3_Simple VGA Display/Quartus_prj/../Sim/tb_vga.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  tb_vga

add wave *
view structure
view signals
run 1 sec
