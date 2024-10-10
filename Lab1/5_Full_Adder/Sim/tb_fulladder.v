`timescale 1ns/1ns

module tb_fulladder();

reg key1, key2, key3; 
wire LED_carry, LED_out;

initial begin
key1 <= 1'b0;
key2 <= 1'b0;
key3 <= 1'b0;
end

always #10 key1 <= {$random} % 2;

always #10 key2 <= {$random} % 2;

always #10 key3 <= {$random} % 2;


fulladder led_inst
(
.key1 (key1),
.key2 (key2),
.key3 (key3),
.LED_out (LED_out),
.LED_carry (LED_carry)
);

endmodule