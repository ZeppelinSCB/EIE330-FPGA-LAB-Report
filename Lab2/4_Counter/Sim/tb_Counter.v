`timescale 1ns/1ns
module tb_syn_flip_flop();

//reg define
reg sys_clk ; //Clock input. we Will use system clock, 50M Hz
reg sys_rst_n ; //Reset button

//wire deifne
 wire led_out ;
 wire [24:0] counter, //Counter
 
 //Init inputs
 initial begin
 sys_clk = 1'b1; //Clock uses blocking assignment.
 
 // Other inputs use un-block assignments
 sys_rst_n <= 1'b0; //At the beginning, the reset button is pressed.
 key_in <= 1'b0; //The input is initialed as 0
 
 #20
 sys_rst_n <= 1'b1; //After 20ns, the reset button is released
 end

 /*
 Simulate system clock 50M Hz. The period is 20ns. The half period is 10ns, 
 which means the clock signal is inversed every 10ns.
 */
 always #10 sys_clk = ~sys_clk; 

 
 always #3000000000 key_in <= {$random} % 2;

 //------------------------------------------------------------
 initial begin
 $timeformat(-9, 0, "ns", 6);
 $monitor("@time %t: key_in=%b led_out=%b", $time, key_in, led_out);
 end
 //------------------------------------------------------------

 //------------------syn_flip_flop_inst-------------------
 Counter Counter_inst
 (
 .sys_clk (sys_clk ), //input sys_clk
 .sys_rst_n (sys_rst_n ), //input sys_rst_n
 .counter (counter ), //input key_in

 .led_out (led_out ) //output led_out
 );

 endmodule