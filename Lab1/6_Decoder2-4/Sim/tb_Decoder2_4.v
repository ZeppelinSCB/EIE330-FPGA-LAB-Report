`timescale 1ns/1ns
module tb_Decoder2_4;

reg [1:0] in_a;

wire [3:0] out;


initial begin
in_a[0] <= 1'b0;
in_a[1] <= 1'b0;
end

always #10 in_a[0] <= {$random} % 2;
always #10 in_a[1] <= {$random} % 2;

 //------------------------------------------------------------
/*
 initial begin
 $timeformat(-9, 0, "ns", 6);
 $monitor("@time %t:in1=%b in2=%b in3=%b out=%b",$time,in_a[0],in_a[1],out);
 end
 */

 //------------------------------------------------------------

 //-------------decoder3_8_inst----------------
 Decoder2_4 Decoder_inst
 (
 .a(in_a), //input a

 .b(out) //output [3:0] out
 );

 endmodule