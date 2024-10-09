`timescale 1ns/1ns
module tb_decoder3_8();

reg in1;
reg in2;

wire [3:0] out;


initial begin
in1 <= 1'b0;
in2 <= 1'b0;
end

always #10 in1 <= {$random} % 2;
always #10 in2 <= {$random} % 2;

 //------------------------------------------------------------
 initial begin
 $timeformat(-9, 0, "ns", 6);
 $monitor("@time %t:in1=%b in2=%b in3=%b out=%b",$time,in1,in2,out);
 end
 //------------------------------------------------------------

 //-------------decoder3_8_inst----------------
 decoder2-4 decoder3_8_ins
 (
 .in1(in1), //input in1
 .in2(in2), //input in2

 .out(out) //output [7:0] out
 );

 endmodule