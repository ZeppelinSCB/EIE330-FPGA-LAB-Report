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
parameter Ins_10 = 3'b011;
parameter Ins_15 = 3'b010;
parameter Ins_20 = 3'b110;
parameter Ins_25 = 3'b111;
parameter EXCEPT = 3'b101;//When error occurs

//Change State
always @(posedge sys_clk or negedge sys_rst_n)
    if(!sys_rst_n)
        begin
            st_cur <= IDLE;
            coke <= 1'b0; //clear the coke output
            case (st_next) //next state reflects the current coins inserted
                Ins_05: refound_coins <= 3'd1;
                Ins_10: refound_coins <= 3'd2;
                Ins_15: refound_coins <= 3'd3;
                Ins_20: refound_coins <= 3'd4;
                Ins_25: refound_coins <= 3'd5;
                default : refound_coins <= 3'd0;
            endcase
        end
    else
        case(st_next)
        Ins_20: begin
                coke <= 1'b1;
                refound_coins <= 3'd0;
                st_cur <= IDLE;
            end
        Ins_25: begin
                coke <= 1'b1;
                refound_coins <= 3'd1;
                st_cur <= IDLE;
            end
        default: begin
                coke <= 1'b0;
                refound_coins <= 3'd0;
                st_cur <= st_next;
            end
        endcase
// next state logic
always @(coin)
begin
    case (st_cur)
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
        default:
            st_next = IDLE;
    endcase
end
endmodule