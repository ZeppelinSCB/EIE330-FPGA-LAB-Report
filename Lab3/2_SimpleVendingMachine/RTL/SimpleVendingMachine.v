module SimpleVendingMachine
(
input wire sys_clk , 
input wire sys_rst_n , 
input wire [1:0] i_money , //01 is 0.5 yuan, 10 is 1.0 yuan
output reg o_cola, //Giving cola when o_cola == 1
output reg o_change //Only considering changes for 0.5 yuan (01), change when o_change == 1

);
 //parameter define
 parameter IDLE = 4'b0001; //Accept no coin, or after gave cola
 parameter ONE = 4'b0010; //0.5 accepted
 parameter TWO = 4'b0100; //1.0 accepted
 parameter THREE = 4'b1000; //1.5 accepted

 //reg define
 reg [3:0] state ; //4 states total

 always@(posedge sys_clk or negedge sys_rst_n)
 if(sys_rst_n == 1'b0)
	state <= IDLE; 
 else case(state)
 
 IDLE : if(i_money == 2'b01) 
	state <= ONE;
 else if(i_money == 2'b10) 
	state <= TWO;
 else
	state <= IDLE;

 ONE : if(i_money == 2'b01) 
	state <= TWO;
 else if(i_money == 2'b10)
	state <= THREE;
 else
	state <= ONE;

 TWO : if(i_money == 2'b01)
	state <= THREE;
 else if(i_money == 2'b10)
	state <= IDLE;
 else
	state <= TWO;
 
 THREE : if(i_money == 2'b01)
	state <= IDLE;
 else if(i_money == 2'b10) //Money is over-accepted, change needed
	state <= IDLE;
 else
	state <= THREE;
 
 default: state <= IDLE;
 endcase

 
 always@(posedge sys_clk or negedge sys_rst_n)
 if(sys_rst_n == 1'b0)begin
	o_cola <= 1'b0;
	o_change <= 1'b0;
 end
 else if((state == TWO) && (i_money == 2'b10))begin
	o_cola <= 1'b1;
	o_change <= 1'b0;
 end
 else if((state == THREE) && (i_money == 2'b01))begin
	o_cola <= 1'b1;
	o_change <= 1'b0;
 end
 else if((state == THREE) && (i_money == 2'b10))begin
	o_cola <= 1'b1;
	o_change <= 1'b1;
 end
 else begin
	o_cola <= 1'b0;
	o_change <= 1'b0;
 end

 endmodule