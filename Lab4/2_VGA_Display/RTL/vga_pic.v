module vga_pic(
    input wire vga_clk , //VGA working clock, 25MHz
    input wire sys_rst_n , //Reset signal. Low level is effective
    input wire [9:0] pix_x , //X coordinate of current pixel
    input wire [9:0] pix_y , //Y coordinate of current pixel

    output reg [15:0] pix_data //Color information
);

 ////
 //\* Parameter and Internal Signal \//
 ////
 //parameter define
 parameter 
    H_VALID = 10'd640 , //Maximum x value
    V_VALID = 10'd480 ; //Maximum y value

 parameter 
    [10*16-1:0] COLOR_ARRAY ={
        16'hF800,
        16'hFC00,
        16'hFFE0,
        16'h07E0,
        16'h07FF,
        16'h001F,
        16'hF81F,
        16'h0000,
        16'hFFFF,
        16'hD69A
    };   

 ////
 //\* Main Code \//
 ////

 //Generate color data according coordinates
 always@(posedge vga_clk or negedge sys_rst_n) begin
	if(sys_rst_n == 1'b0)
		pix_data <= 16'd0;
	else 
		if((pix_x >= 0) && (pix_x < (H_VALID/10)*1))
			pix_data <= COLOR_ARRAY[1*16-1 +: 16];
		else if((pix_x >= (H_VALID/10)*1) && (pix_x < (H_VALID/10)*2))
			pix_data <= COLOR_ARRAY[2*16-1 +: 16];
		else if((pix_x >= (H_VALID/10)*2) && (pix_x < (H_VALID/10)*3))
			pix_data <= COLOR_ARRAY[3*16-1 +: 16];
		else if((pix_x >= (H_VALID/10)*3) && (pix_x < (H_VALID/10)*4))
			pix_data <= COLOR_ARRAY[4*16-1 +: 16];
		else if((pix_x >= (H_VALID/10)*4) && (pix_x < (H_VALID/10)*5))
			pix_data <= COLOR_ARRAY[5*16-1 +: 16];
		else if((pix_x >= (H_VALID/10)*5) && (pix_x < (H_VALID/10)*6))
			pix_data <= COLOR_ARRAY[6*16-1 +: 16];
		else if((pix_x >= (H_VALID/10)*6) && (pix_x < (H_VALID/10)*7))
			pix_data <= COLOR_ARRAY[7*16-1 +: 16];
		else if((pix_x >= (H_VALID/10)*7) && (pix_x < (H_VALID/10)*8))
			pix_data <= COLOR_ARRAY[8*16-1 +: 16];
		else if((pix_x >= (H_VALID/10)*8) && (pix_x < (H_VALID/10)*9))
			pix_data <= COLOR_ARRAY[9*16-1 +: 16];
		else if((pix_x >= (H_VALID/10)*9) && (pix_x < H_VALID))
			pix_data <= COLOR_ARRAY[0 +: 16];
		else
			pix_data <= COLOR_ARRAY[0 +: 16];
 end

 endmodule