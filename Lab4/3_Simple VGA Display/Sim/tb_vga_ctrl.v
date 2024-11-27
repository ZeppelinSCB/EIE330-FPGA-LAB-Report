`timescale  1ns/1ns
module  tb_vga_char();

	wire hsync;
	wire [15:0] rgb;
	wire vsync;
	reg sys_clk;
	reg sys_rst_n;

initial
	begin
		sys_clk = 1'b1;
		sys_rst_n <= 1'b0;
		#200
		sys_rst_n <= 1'b1;
	end

always #10 sys_clk = ~sys_clk;

vga_pic vga_char_pic(
	.sys_clk (sys_clk),
	.sys_rst_n (sys_rst_n),
	
	.hsync (hsync),
	.vsync (vsync),
	.rgb (rgb)
);

endmodule
