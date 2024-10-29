`timescale 1ns/1ns
module tb_RunningLight();

//reg define
reg sys_clk ; //Clock input. we Will use system clock, 50M Hz
reg sys_rst_n ; //Reset button

//wire deifne
 wire [24:0] counter; //Counter
 wire [3:0] countercounter;
 wire led_0; //Output1
 wire led_1; //Output2
 wire led_2; //Output3
 wire led_3;  //Output4
 
 //Init inputs
 initial begin
 sys_clk <= 1'b1; //Clock uses blocking assignment.
 
 sys_rst_n <= 1'b0; //At the beginning, the reset button is pressed.
 
 #20
 sys_rst_n <= 1'b1; //After 20ns, the reset button is released
 end

 /*
 Simulate system clock 50M Hz. The period is 20ns. The half period is 10ns, 
 which means the clock signal is inversed every 10ns.
 */
 always #10 sys_clk = ~sys_clk; 

 // always #3000000 sys_rst_n <= {$random} % 2;

 //------------------------------------------------------------

 //------------------RunningLight_inst-------------------
 RunningLight RunningLight_inst
 (
 .sys_clk (sys_clk ), //input sys_clk
 .sys_rst_n (sys_rst_n ), //input sys_rst_n

 .led_0 (led_0 ), //output led_0
 .led_1 (led_1 ), //output led_1
 .led_2 (led_2 ), //output led_2
 .led_3 (led_3 ) //output led_3
 );

 endmodule