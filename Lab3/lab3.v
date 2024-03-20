module decoder_3x8_df(A,O);
input [0:3] A;
output reg [0:6] O;
    always @(A)begin
    case(A)
    0: assign O=7'b1111110;
    1: assign O=7'b0110000;
    2: assign O=7'b1101101;
    3: assign O=7'b1111001;
    4: assign O=7'b0110011;
    5: assign O=7'b1011011;
    6: assign O=7'b0011111;
    7: assign O=7'b1110000;
    8: assign O=7'b1111111;
    9: assign O=7'b1110011;
    endcase
    end
endmodule
module encoder(A,O);
input[0:7] A;
output reg [0:3] O;
parameter S0 = 8'b11111111 , S1 =8'b11111110 ,S2 =8'b11111101 ,S3 =8'b11111011 ,S4 =8'b111101111 ,S5 =8'b11101111 ,S6 =8'b11011111 ,S7 =8'b10111111 ,S8 =8'b01111111 ;
    always @(A) begin
        
    case(A)
    S0: assign O=4'b1111;
    S1: assign O=4'b1110;
    S2: assign O=4'b1101;
    S3: assign O=4'b1100;
    S4: assign O=4'b1011;
    S5: assign O=4'b1010;
    S6: assign O=4'b1001;
    S7: assign O=4'b1000;
    S8: assign O=4'b0111;

    endcase
    end
endmodule
module lab3(A,O);
input [0:8]A;
output[0:6]O;
wire [0:3]w1;
encoder E1 (~A[0:7],w1);
decoder_3x8_df D1 (~w1,O);
endmodule