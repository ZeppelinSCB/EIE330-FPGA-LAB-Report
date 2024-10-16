transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+E:/EIE330_FPGA/Lab1/6_Decoder2-4/RTL {E:/EIE330_FPGA/Lab1/6_Decoder2-4/RTL/Decoder2_4.v}

vlog -vlog01compat -work work +incdir+E:/EIE330_FPGA/Lab1/6_Decoder2-4/Quartus_prj/../Sim {E:/EIE330_FPGA/Lab1/6_Decoder2-4/Quartus_prj/../Sim/tb_Decoder2_4.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  tb_Decoder2_4

add wave *
view structure
view signals
run 1 us
