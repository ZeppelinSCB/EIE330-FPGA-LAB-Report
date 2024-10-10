module fulladder
(
input wire key1, key2, key3,
output wire LED_carry,LED_out
);

assign LED_out = key1^key2^key3;
assign LED_carry = (key1&key2) | (key1&key3) | (key2&key3);

endmodule