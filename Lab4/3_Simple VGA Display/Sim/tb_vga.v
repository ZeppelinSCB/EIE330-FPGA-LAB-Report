`timescale  1ns/1ns

module tb_vga();

wire rst_n;

reg sys_clk;
reg sys_rst_n;
wire [15:0] pix_data;
wire [15:0] rgb;
wire [9:0] pix_x;
wire [9:0] pix_y;

initial
	begin
        sys_clk = 1'b1;
        sys_rst_n <= 1'b0;
        #200
        sys_rst_n <= 1'b1;
	end

always #10 sys_clk = ~sys_clk;

assign rst_n = (sys_rst_n);
 
wire rgb_valid = vga_ctrl_inst.rgb_valid;
wire pix_data_req = vga_ctrl_inst.pix_data_req;
wire [9:0] cnt_h = vga_ctrl_inst.cnt_h;
wire [9:0] cnt_v = vga_ctrl_inst.cnt_v;

vga_ctrl vga_ctrl_inst
    (
        .vga_clk (sys_clk ), //VGA working clock, 25MHz
        .sys_rst_n (rst_n ), //Reset signal. Low level is effective
        .pix_data (pix_data ), //color information
        .pix_x (pix_x ), //x coordinate of current pixel
        .pix_y (pix_y ), //y coordinate of current pixel
        .hsync (hsync ), //Line sync signal
        .vsync (vsync ), //Field sync signal
        .rgb (rgb ) //RGB565 color data
    );

 //------------- vga_pic_inst -------------
 vga_pic vga_pic_inst
    (
        .vga_clk (sys_clk ), //VGA working clock, 25MHz
        .sys_rst_n (rst_n ), //Reset signal. Low level is effective
        .pix_x (pix_x ), //x coordinate of current pixel
        .pix_y (pix_y ), //y coordinate of current pixel

        .pix_data (pix_data ) //color information
    );
endmodule