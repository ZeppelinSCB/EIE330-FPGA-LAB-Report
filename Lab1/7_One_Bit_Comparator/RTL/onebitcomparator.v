module onebitcomparator
(
input wire A, B,
output reg LED_greater,LED_equal,LED_smaller
);

always @(*)
begin
	LED_greater = 1;
	LED_equal = 1;
	LED_smaller = 1;
	
	if(A<B)
	begin
	LED_greater = 0;
	end
	else if(A==B)
	begin
	LED_equal = 0;
	end
	else
	begin
	LED_smaller = 0;
	end
end

endmodule