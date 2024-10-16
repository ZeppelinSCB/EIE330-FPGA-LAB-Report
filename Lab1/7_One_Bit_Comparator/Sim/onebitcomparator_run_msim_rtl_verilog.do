transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/94384/Desktop/EIE330-FPGA-Laboratory/Lab1/7_One_Bit_Comparator/RTL {C:/Users/94384/Desktop/EIE330-FPGA-Laboratory/Lab1/7_One_Bit_Comparator/RTL/onebitcomparator.v}

vlog -vlog01compat -work work +incdir+C:/Users/94384/Desktop/EIE330-FPGA-Laboratory/Lab1/7_One_Bit_Comparator/Quartus_prj/../Sim {C:/Users/94384/Desktop/EIE330-FPGA-Laboratory/Lab1/7_One_Bit_Comparator/Quartus_prj/../Sim/tb_onebitcomparator.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  tb_onebitcomparator

add wave *
view structure
view signals
run 1 us
