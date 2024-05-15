module tb_Group_Exp7_1;

reg [4:0] A,B;
reg c0,S;
wire [4:0] sum;
wire carry,sub;
five_bit_adder_with_sub M0(A,B,S,sum,carry,c0,sub);
initial #90 $finish;
initial begin
    // #0 A=5'b00010 ; B=5'b00011;
    // S=1;
    // Group 1
    #10 A=5'b10111 ; B=5'b11000;
    c0=0;
    S=0;
    #10 A=5'b00101; B=5'b11111;
    S=1;
    //Group 2
    #10 A=5'b11101 ; B=5'b01100;
    c0=0;
    S=0;
    #10 A=5'b10010; B=5'b11001;
    S=1;
    //Group 3
    #10 A=5'b01110 ; B=5'b10001;
    c0=1;
    S=0;
    #10 A=5'b10001; B=5'b01010;
    S=1;
    //Group 4
    #10 A=5'b11111 ; B=5'b11111;
    c0=1;
    S=0;
    #10 A=5'b10110; B=5'b11101;
    S=1;
    // #10 A=5'b10110; B=5'b11101;
    // S=0;
end
endmodule
