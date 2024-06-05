module mux_16x1_beh (out,in,sel);
    input [15:0] in;
    input [3:0] sel;
    output reg out;
   always @(in,sel) begin
        case(sel)
            4'b0000: out = in[0];
            4'b0001: out = in[1];
            4'b0010: out = in[2];
            4'b0011: out = in[3];
            4'b0100: out = in[4];
            4'b0101: out = in[5];
            4'b0110: out = in[6];
            4'b0111: out = in[7];
            4'b1000: out = in[8];
            4'b1001: out = in[9];
            4'b1010: out = in[10];
            4'b1011: out = in[11];
            4'b1100: out = in[12];
            4'b1101: out = in[13];
            4'b1110: out = in[14];
            4'b1111: out = in[15];
        endcase
    end
endmodule   

module demux_1x4_beh (out,in,sel);
    input in;
    input [3:0] sel;
    output reg [15:0] out;
    always @(in,sel)
    begin
        case(sel)
            4'b0000: out = {15'b0,in};
            4'b0001: out = {14'b0,in,1'b0};
            4'b0010: out = {13'b0,in,2'b0};
            4'b0011: out = {12'b0,in,3'b0};
            4'b0100: out = {11'b0,in,4'b0};
            4'b0101: out = {10'b0,in,5'b0};
            4'b0110: out = {9'b0,in,6'b0};
            4'b0111: out = {8'b0,in,7'b0};
            4'b1000: out = {7'b0,in,8'b0};
            4'b1001: out = {6'b0,in,9'b0};
            4'b1010: out = {5'b0,in,10'b0};
            4'b1011: out = {4'b0,in,11'b0};
            4'b1100: out = {3'b0,in,12'b0};
            4'b1101: out = {2'b0,in,13'b0};
            4'b1110: out = {1'b0,in,14'b0};
            4'b1111: out = {in,15'b0};
        endcase
    end
endmodule

module JK_FF(j,k,clk,rst,q);
    input j,k,clk,rst;
    output reg q = 1'b1;
    always @(posedge clk or posedge rst)
    begin
        if(rst)
            q <= 1'b1;
        else
            case({j,k})
                2'b00: q <= q;
                2'b01: q <= 1'b0;
                2'b10: q <= 1'b1;
                2'b11: q <= ~q;
            endcase
    end
endmodule
module mod16_async_coutdown_counter(out,clk);
    input clk;
    output [3:0] out;
    JK_FF jk0(1,1,clk,0,out[0]);
    JK_FF jk1(1,1,out[0],0,out[1]);
    JK_FF jk2(1,1,out[1],0,out[2]);
    JK_FF jk3(1,1,out[2],0,out[3]);
endmodule

module tx_rx (Din,Dout,clk);
    input [15:0] Din;
    output [15:0] Dout;
    input clk;
    wire [15:0] Dout;
    wire [15:0] temp;
    wire [3:0] counter;
    mod16_async_coutdown_counter M0(counter,clk);
    mux_16x1_beh M1(temp,Din,counter);
    demux_1x4_beh M2(Dout,temp,counter);
endmodule