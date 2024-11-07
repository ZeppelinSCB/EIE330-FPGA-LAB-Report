`timescale 1ns/1ns
module tb_CVM();
//reg define
reg sys_clk ;
reg sys_rst_n ;
reg [1:0]coin ;

//wire define
wire cola;
wire[2:0] return_coins;

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
        coin <= 2'b0;
    else
        coin <= {$random} % 3; 
//Take remainder, generate non-negative random number 0, 1, 2

//------------------------------------------------------------
//Get the internal variables of the instance "simple_fsm_inst"
    wire [2:0] st_cur = CVM_inst.st_cur;
    wire [2:0] st_next = CVM_inst.st_next;
//-------------------------------------------------------------
initial begin
    $timeformat(-9, 0, "ns", 6);
    $monitor("@time %t: coin=%b st_cur=%b st_next=%b cola=%b return_coins=%b",
    $time, coin, st_cur, st_next, cola, return_coins);
end
//------------------------------------------------------------
//------------------------simple_fsm_inst------------------------
CVM CVM_inst(
    .sys_clk (sys_clk ), //input sys_clk
    .sys_rst_n (sys_rst_n ), //input sys_rst_n
    .coin (coin ), //input coin

    .coke (cola ), //output cola
    .refound_coins (return_coins) //output return_coins
);
endmodule