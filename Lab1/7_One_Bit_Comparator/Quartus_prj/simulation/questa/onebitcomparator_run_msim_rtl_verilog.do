transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/94384/Desktop/EIE330-FPGA-Laboratory/Lab1/7_One_Bit_Comparator/RTL {C:/Users/94384/Desktop/EIE330-FPGA-Laboratory/Lab1/7_One_Bit_Comparator/RTL/onebitcomparator.v}

