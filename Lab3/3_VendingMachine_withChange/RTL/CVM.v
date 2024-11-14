/**
* @brief Vending machine module
* @param sys_clk Clock input signal
* @param sys_rst_n async reset signal, when low, reset and refund
* @param coin Coin input signal, [01]: 50 avos, [10]: 1 pataca
* 
* @return coke Coke output signal, 1: release coke
* @return refound Record the number of coins to be refunded, unit: 50 avos
*/
module CVM (
    input wire sys_clk,
    input wire sys_rst_n,
    input wire[1:0] coin, // [d1]: 50 avos, [d2]: 1 pataca
    
    output reg coke,
    output reg [2:0] refound_coins //unit: 50 avos
);
reg [2:0] st_cur;
reg [2:0] st_next;

parameter IDLE   = 3'b000;
parameter Ins_05 = 3'b001;
parameter Ins_10 = 3'b010;
parameter Ins_15 = 3'b011;
parameter Ins_20 = 3'b100;
parameter Ins_25 = 3'b101;
parameter EXCEPT = 3'b110; //When error occurs

//Change State
always @(posedge sys_clk or negedge sys_rst_n)
    if (!sys_rst_n)
        st_cur <= IDLE;
    else
        st_cur <= st_next;

// next state logic
always @(negedge sys_rst_n or posedge sys_clk) begin
    if(!sys_rst_n)
        st_next <= IDLE;
    else
        case (st_next)
        IDLE:
            if (coin == 2'd1)
                st_next = Ins_05;
            else if (coin == 2'd2)
                st_next = Ins_10;
            else
                st_next = IDLE;
        Ins_05:
            if (coin == 2'd1)
                st_next = Ins_10;
            else if (coin == 2'd2)
                st_next = Ins_15;
            else 
                st_next = Ins_05;
        Ins_10:
            if (coin == 2'd1)
                st_next = Ins_15;
            else if (coin == 2'd2)
                st_next = Ins_20;
            else 
                st_next = Ins_10;
        Ins_15:
            if (coin == 2'd1)
                st_next = Ins_20;
            else if (coin == 2'd2)
                st_next = Ins_25;
            else 
                st_next = Ins_15;
        Ins_20:
            if (coin == 2'd1)
                st_next = Ins_05;
            else if (coin == 2'd2)
                st_next = Ins_10;
            else
                st_next = IDLE;
        Ins_25:
            if (coin == 2'd1)
                st_next = Ins_05;
            else if (coin == 2'd2)
                st_next = Ins_10;
            else
                st_next = IDLE;
        default:
                st_next = IDLE;
        endcase
end

// generate refound_coins
always @(posedge sys_clk or negedge sys_rst_n) begin
    if(!sys_rst_n)// When reset, working as mealy machine
        begin
            case (st_cur)
                Ins_05:
                    if(coin == 2'd1)
                        refound_coins <= 3'd1;
                    else if(coin == 2'd2)
                        refound_coins <= 3'd2;
                    else
                        refound_coins <= 3'd0;
                Ins_10:  
                    if(coin == 2'd1)
                        refound_coins <= 3'd3;
                    else if(coin == 2'd2)
                        refound_coins <= 3'd4;
                    else
                        refound_coins <= 3'd2;
                Ins_15:
                    if(coin == 2'd1)
                        refound_coins <= 3'd4;
                    else if(coin == 2'd2)
                        refound_coins <= 3'd5;
                    else
                        refound_coins <= 3'd3;
                Ins_20:
                    if(coin == 2'd1)
                        refound_coins <= 3'd5;
                    else if(coin == 2'd2)
                        refound_coins <= 3'd6;
                    else
                        refound_coins <= 3'd4;
                Ins_25:                    
                    if(coin == 2'd1)
                        refound_coins <= 3'd6;
                    else if(coin == 2'd2)
                        refound_coins <= 3'd7;
                    else
                        refound_coins <= 3'd5;
                default: 
                    refound_coins <= 3'd0;
            endcase
        end
    else // Normally, working as moore machine
        case(st_cur)
        Ins_25:
            refound_coins <= 3'd1;
        default:
            refound_coins <= 3'd0;
        endcase
end

always @(posedge sys_clk) begin
    if ((st_cur == Ins_20) || (st_cur == Ins_25))
        coke <= 1'b1;
    else
        coke <= 1'b0;
end
endmodule