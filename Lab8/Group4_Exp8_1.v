module D_FF(d, clk, clr, q, qbar);
    input d, clk, clr;
    output q, qbar;
    reg q;
    always @(posedge clk, negedge clr)
    begin
        if (~clr)
            q <= 0;
        else
            q <= d;
    end
    assign qbar = ~q;
endmodule

module ring_and_Johnson_counter(mode,load,data,clk,clr,q);
    input mode,load,clk,clr; 
    input [4:0] data;
    output [4:0] q;
    wire [4:0] qbar;
    D_FF D0((~mode?q[0]:qbar[0]),clk,clr,q[1],qbar[1]);
    D_FF D1(q[1],clk,clr,q[2],qbar[2]);
    D_FF D2(q[2],clk,clr,q[3],qbar[3]);
    D_FF D3(q[3],clk,clr,q[4],qbar[4]);
    D_FF D4(q[4],clk,clr,q[0],qbar[0]);
    
    if(load)
        assign q = data;

endmodule