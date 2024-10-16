transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+E:/EIE330_FPGA/Lab1/6_Decoder2-4/RTL {E:/EIE330_FPGA/Lab1/6_Decoder2-4/RTL/Decoder2_4.v}

