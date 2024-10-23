module Counter
(
input wire sys_clk , //Clock input. we Will use system clock, 50M Hz
input wire sys_rst_n, //Reset button
output reg [24:0] counter, //Counter
output reg led_out //Output
 );

always@(posedge sys_clk or negedge sys_rst_n) begin //One should use or to connect 
	if(sys_rst_n == 1'b0)
	begin
		counter <= 0;
		led_out <= 0;
	end
	else if(counter == 0) 
	begin
		counter = 2499_9999;
		led_out <= !led_out;
	end
	else
	begin
		counter <= counter - 1'b1;
	end
end
endmodule