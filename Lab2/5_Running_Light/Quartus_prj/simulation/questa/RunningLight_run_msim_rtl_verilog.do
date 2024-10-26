transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/94384/Desktop/EIE330-FPGA-Laboratory/Lab2/5_Running_Light/RTL {C:/Users/94384/Desktop/EIE330-FPGA-Laboratory/Lab2/5_Running_Light/RTL/RunningLight.v}

