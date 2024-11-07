`timescale 1ns/1ns

module tb_SimpleVendingMahcine();
//reg define
reg sys_clk ;
reg sys_rst_n ;
reg [1:0] i_money ;

//wire define
wire o_cola;
wire o_change;

//Init inputs
initial begin
    sys_clk = 1'b1;
    sys_rst_n <= 1'b0;
    #20 // pre-rst
    sys_rst_n <= 1'b1;
end

//Simulate system clock (50M Hz)
    always #10 sys_clk = ~sys_clk;

    always begin
        #500 sys_rst_n = 1'b0; //reset
        #20 sys_rst_n = 1'b1; //release reset
    end
	 
//Generate the random input
    always@(posedge sys_clk or negedge sys_rst_n)
    if(sys_rst_n == 1'b0)
        i_money <= 2'b0;
    else
        i_money <= {$random} % 3; 
//Take remainder, generate non-negative random number 0, 1, 2

//------------------------SimpleVendingMachine_inst------------------------
SimpleVendingMachine SimpleVendingMachine_inst(
    .sys_clk (sys_clk), //input sys_clk
    .sys_rst_n (sys_rst_n), //input sys_rst_n
    .i_money (i_money), //input coin

    .coke (o_cola), //output cola
    .change (o_change) //output change
);
endmodule