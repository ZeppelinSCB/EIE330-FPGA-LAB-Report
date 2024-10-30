transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+E:/EIE330_FPGA/Lab2/4_Counter/RTL {E:/EIE330_FPGA/Lab2/4_Counter/RTL/Counter.v}

vlog -vlog01compat -work work +incdir+E:/EIE330_FPGA/Lab2/4_Counter/Quartus_prj/../Sim {E:/EIE330_FPGA/Lab2/4_Counter/Quartus_prj/../Sim/tb_Counter.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  tb_Counter

add wave *
view structure
view signals
run -all
