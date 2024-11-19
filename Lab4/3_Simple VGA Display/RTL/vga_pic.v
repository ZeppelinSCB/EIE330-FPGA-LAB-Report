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
    V_VALID = 10'd480 , //Maximum y value
    H_Map = 10'd64,
    V_Map = 10'd16;

parameter RED = 16'hF800, //RED
ORANGE = 16'hFC00, //Orange
YELLOW = 16'hFFE0, //Yellow
GREEN = 16'h07E0, //Green
CYAN = 16'h07FF, //Cyan
BLUE = 16'h0B346E, //Blue
PURPPLE = 16'hF81F, //Purple
BLACK = 16'h0000, //Black
WHITE = 16'hFFFF, //White
GRAY = 16'hD69A; //Grey

reg [H_Map-1:0] char [V_Map-1:0];

always@(posedge vga_clk)
begin
    char[0 ] <= {8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000}; 
    char[1 ] <= {8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000}; 
    char[2 ] <= {8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000}; 
    char[3 ] <= {8'b11101110, 8'b00000000, 8'b11100111, 8'b00000000, 8'b00111110, 8'b00000000, 8'b11111110, 8'b00000000}; 
    char[4 ] <= {8'b01101100, 8'b00000000, 8'b01000010, 8'b00000000, 8'b01000010, 8'b00000000, 8'b10010010, 8'b00000000};
    char[5 ] <= {8'b01101100, 8'b00000000, 8'b01000010, 8'b00000000, 8'b01000010, 8'b00000000, 8'b00010000, 8'b00000000};
    char[6 ] <= {8'b01101100, 8'b00000000, 8'b01000010, 8'b00000000, 8'b01000000, 8'b00000000, 8'b00010000, 8'b00000000};
    char[7 ] <= {8'b01101100, 8'b00000000, 8'b01000010, 8'b00000000, 8'b00100000, 8'b00000000, 8'b00010000, 8'b00000000};
    char[8 ] <= {8'b01101100, 8'b00000000, 8'b01000010, 8'b00000000, 8'b00011000, 8'b00000000, 8'b00010000, 8'b00000000}; 
    char[9 ] <= {8'b01010100, 8'b00000000, 8'b01000010, 8'b00000000, 8'b00000100, 8'b00000000, 8'b00010000, 8'b00000000};
    char[10] <= {8'b01010100, 8'b00000000, 8'b01000010, 8'b00000000, 8'b00000010, 8'b00000000, 8'b00010000, 8'b00000000};
    char[11] <= {8'b01010100, 8'b00000000, 8'b01000010, 8'b00000000, 8'b01000010, 8'b00000000, 8'b00010000, 8'b00000000};
    char[12] <= {8'b01010100, 8'b00000000, 8'b01000010, 8'b00000000, 8'b01000010, 8'b00000000, 8'b00010000, 8'b00000000}; 
    char[13] <= {8'b11010110, 8'b00000000, 8'b00111100, 8'b00000000, 8'b01111100, 8'b00000000, 8'b00111000, 8'b00000000}; 
    char[14] <= {8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000};
    char[15] <= {8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000};
end

//Generate color data according coordinates
always@(posedge vga_clk or negedge sys_rst_n) begin
	if(sys_rst_n == 1'b0)
		pix_data <= 16'd0;
    else
        // If in valid X
        if((pix_x>=H_VALID/2-H_Map/2)&&(pix_x<=H_VALID/2+H_Map/2))
            // If in valid Y
            if((pix_y>=V_VALID/2-V_Map/2)&&(pix_y<=V_VALID/2+V_Map/2))
                if(char[pix_y-V_VALID/2+V_Map/2][H_Map-pix_x-H_VALID/2+H_Map/2] == 1)
                    pix_data <= YELLOW;
                else
                    pix_data <= BLUE;
            else
                pix_data <= BLACK;
        else
            pix_data <= BLACK;
end

endmodule