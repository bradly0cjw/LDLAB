module D_FF(d, clk, q, qbar);
    input d, clk;
    output reg q;
    output qbar;
    always @(posedge clk)
        q <= d;
    assign qbar = ~q;
endmodule

module ring_and_Johnson_counter(mode,load,data,clk,q);
    input mode,load,clk; 
    input [4:0] data;
    output [4:0] q;
    reg [4:0] d, dbar;
    D_FF D0((~mode ? d[4] : dbar[4]),clk,d[0],dbar[0]);
    D_FF D1(d[1],clk,d[1],dbar[1]);
    D_FF D2(d[2],clk,d[2],dbar[2]);
    D_FF D3(d[3],clk,d[3],dbar[3]);
    D_FF D4(d[4],clk,d[4],dbar[4]);
    always @(load)
        d = data;
    assign q=d;
endmodule