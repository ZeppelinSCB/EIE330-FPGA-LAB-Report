transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/94384/Desktop/EIE330-FPGA-Laboratory/Lab2/4_Counter/RTL {C:/Users/94384/Desktop/EIE330-FPGA-Laboratory/Lab2/4_Counter/RTL/Counter.v}

vlog -vlog01compat -work work +incdir+C:/Users/94384/Desktop/EIE330-FPGA-Laboratory/Lab2/4_Counter/Quartus_prj/../Sim {C:/Users/94384/Desktop/EIE330-FPGA-Laboratory/Lab2/4_Counter/Quartus_prj/../Sim/tb_Counter.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  tb_Counter

add wave *
view structure
view signals
run -all
