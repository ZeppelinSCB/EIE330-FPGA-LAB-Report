transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+E:/EIE330_FPGA/Lab2/2_Avoid_Latch/RTL {E:/EIE330_FPGA/Lab2/2_Avoid_Latch/RTL/latch_1.v}

vlog -vlog01compat -work work +incdir+E:/EIE330_FPGA/Lab2/2_Avoid_Latch/Quartus_prj/latch_1/../../Sim {E:/EIE330_FPGA/Lab2/2_Avoid_Latch/Quartus_prj/latch_1/../../Sim/tb_latch_1.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  latch_1.v

add wave *
view structure
view signals
run -all
