module RunningLight
(
input wire sys_clk,     //Clock input. we Will use system clock, 50M Hz
input wire sys_rst_n,   //Reset button

output reg listen_clk,
output reg led_0,      //Output1
output reg led_1,      //Output2
output reg led_2,      //Output3
output reg led_3       //Output4
);

/// internal signals
reg [3:0] shift_counter; // 4-bit shift counter
wire clk_1hz; // 1Hz clock signal

//------------------------ counter_inst0 -------------------------
Counter counter_inst0 
(
	.sys_clk(sys_clk),
	.sys_rst_n(sys_rst_n),

	.out(clk_1hz)
);
// listen to the 
always @(*) begin
	listen_clk <= clk_1hz;
end

/// shift counter logic state machine
always@(posedge clk_1hz, negedge sys_rst_n) 
	begin 
		if(sys_rst_n == 1'b0) 	// reset shift counter
			shift_counter <= 4'b0001;
		else if(shift_counter == 4'b1000)
			shift_counter <= 4'b0001;
		else // shift the counter by a bit 
			shift_counter <= shift_counter << 1;
	end

/// assign led outputs
always @(*) 
	begin
    	case (shift_counter)
    		4'b0001: {led_3, led_2, led_1, led_0} = 4'b1110;
    		4'b0010: {led_3, led_2, led_1, led_0} = 4'b1101;
    		4'b0100: {led_3, led_2, led_1, led_0} = 4'b1011;
    		4'b1000: {led_3, led_2, led_1, led_0} = 4'b0111;
    		default: {led_3, led_2, led_1, led_0} = 4'b0000;
    	endcase
	end

endmodule