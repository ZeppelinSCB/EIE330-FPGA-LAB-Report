module SimpleVGADisplay(
input wire vga_clk, //clock of VGA, frequency is 25M Hz
input wire sys_rst_n,
output wire hsync , //Line sync signal
output wire vsync , //Field sync signal
output wire [15:0] rgb //RGB565 data
);

 ////
 //\* Parameter and Internal Signal \//
 ////
 //parameter define
 parameter H_VALID = 10'd640 , //Maximum x value
 V_VALID = 10'd480 ; //Maximum y value
 //====================
 //Total 640*480 pixel
 //====================
 parameter RED = 16'hF800, //RED
 ORANGE = 16'hFC00, //Orange
 YELLOW = 16'hFFE0, //Yellow
 GREEN = 16'h07E0, //Green
 CYAN = 16'h07FF, //Cyan
 BLUE = 16'h001F, //Blue
 PURPPLE = 16'hF81F, //Purple
 BLACK = 16'h0000, //Black
 WHITE = 16'hFFFF, //White
 GRAY = 16'hD69A; //Grey


endmodule