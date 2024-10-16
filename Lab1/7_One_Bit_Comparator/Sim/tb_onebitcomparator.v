`timescale 1ns/1ns

module tb_onebitcomparator();

reg A, B; 
wire LED_greater,LED_equal,LED_smaller;

initial begin
A <= 1'b0;
B <= 1'b0;
end

always #10 A <= {$random} % 2;

always #10 B <= {$random} % 2;


onebitcomparator led_inst
(
.A (A),
.B (B),
.LED_greater (LED_greater),
.LED_equal (LED_equal),
.LED_smaller (LED_smaller)
);

endmodule