`timescale 1ns/1ns
module tb_Counter();

//reg define
reg sys_clk ; //Clock input. we Will use system clock, 50M Hz
reg sys_rst_n ; //Reset button

//wire deifne
wire led_out;  //Output


//Init inputs
initial begin
    sys_clk <= 1'b1; //Clock uses blocking assignment.
    
    sys_rst_n <= 1'b1; //unpress
    #100
    sys_rst_n <= 1'b0; //press
    #100
    sys_rst_n <= 1'b1; //After 20ns, the reset button is released
end
/*
Simulate system clock 50M Hz. The period is 20ns. The half period is 10ns, 
which means the clock signal is inversed every 10ns.
*/
always #10 sys_clk = ~sys_clk;
always #300000 sys_rst_n <= {$random} % 2; //press
always@(negedge sys_rst_n)begin
	#100 sys_rst_n <= ~sys_rst_n; //unpress
	end
//------------------RunningLight_inst-------------------
Counter Counter_inst
(
    .sys_clk (sys_clk ),     //input sys_clk
    .sys_rst_n (sys_rst_n ), //input sys_rst_n
    .led_out (led_out )         //output led_0

);
endmodule