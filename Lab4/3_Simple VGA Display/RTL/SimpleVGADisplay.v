module SimpleVGADisplay(
input wire vga_clk, //clock of VGA, frequency is 25M Hz
input wire sys_rst_n,
input wire [9:0] pix_x, //pixel information in x-axis, 10bits
input wire [9:0] pix_y, //pixel information in y-axis, 10bits
output reg [15:0] pix_data //colour of the pixels output, 16 bits
)

endmodule