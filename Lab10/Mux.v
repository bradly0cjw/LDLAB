module Mux_8x1 (out,in,sel);
    //F(A,B,C)=sigma(0,1,2,5)
    output out;
    input [7:0] in;
    input [2:0] sel;
    wire [7:0] temp;
    assign temp[0] = in[0];
    assign temp[1] = in[1];
    assign temp[2] = in[2];
    assign temp[5] = in[5];
    assign out = temp[sel];
endmodule