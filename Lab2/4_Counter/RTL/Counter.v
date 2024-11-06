module Counter
(
input wire sys_clk , //Clock input. we Will use system clock, 50M Hz
input wire sys_rst_n, //Reset button
output reg led_out //Output
 );

reg [24:0] counter;

always@(posedge sys_clk or negedge sys_rst_n) begin //One should use or to connect 
	if(sys_rst_n == 1'b0) //reset counter and light
	begin
		counter <= 25'b0;
		led_out <= 1'b1;
	end
	else if(counter <= 0) //counter reset if 1s is end and reverse light
	begin
		counter = 25'd_24_999_999;
		led_out <= !led_out; //!led_out
	end
	else
	begin
		counter <= counter - 1'b1; //counting down
	end
end
endmodule