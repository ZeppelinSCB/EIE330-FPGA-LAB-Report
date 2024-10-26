module RunningLight
(
input wire sys_clk , //Clock input. we Will use system clock, 50M Hz
input wire sys_rst_n, //Reset button
output reg [24:0] counter, //Counter
output reg [3:0] countercounter, // 4-bit shift counter
output reg led_0, //Output1
output reg led_1, //Output2
output reg led_2, //Output3
output reg led_3  //Output4
 );

always@(posedge sys_clk or negedge sys_rst_n) begin //One should use or to connect 
	if(sys_rst_n == 1'b0)
	begin
		counter <= 25'd0;
		countercounter <= 4'b0001;
	end
	else if(counter == 0) 
	begin
		counter = 25'd2499_9999;
		countercounter <= countercounter << 1;
		if(countercounter == 4'b1000)
		begin
			countercounter <= 4'b0001;
		end
		else
		begin
			countercounter <= 4'b0001;
		end
	end
	else
	begin
		counter <= counter - 1'b1;
	end
	end
	always @(*) begin
    case (countercounter)
        4'b0001: {led_3, led_2, led_1, led_0} = 4'b0001;
        4'b0010: {led_3, led_2, led_1, led_0} = 4'b0010;
        4'b0100: {led_3, led_2, led_1, led_0} = 4'b0100;
        4'b1000: {led_3, led_2, led_1, led_0} = 4'b1000;
        default: {led_3, led_2, led_1, led_0} = 4'b0000;
    endcase
end

endmodule