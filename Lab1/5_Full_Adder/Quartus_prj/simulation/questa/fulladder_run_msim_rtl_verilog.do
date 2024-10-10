transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/94384/Desktop/Quartus/Lab1/5_Full_Adder/RTL {C:/Users/94384/Desktop/Quartus/Lab1/5_Full_Adder/RTL/fulladder.v}

