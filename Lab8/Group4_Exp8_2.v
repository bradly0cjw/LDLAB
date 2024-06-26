module D_FF_C(d, clk, clr, q);
    input d, clk,clr;
    output q;
    reg q;
    // initial begin
    //     q = 0;
    // end
    always @(posedge clk, negedge clr)
    begin
        if (~clr)
            q <= 0;
        else
            q <= d;
    end
endmodule

module mod6_async_counter(clk, q);
    input clk;
    output [2:0] q;
    // reg [2:0] q;
    wire t_clr;
    // wire temp,temp2;
    assign t_clr = ~(q[2] & q[1] & ~q[0]);
    D_FF_C D0(~q[0], clk, t_clr, q[0]);
    D_FF_C D1(~q[1], ~q[0],t_clr, q[1]);
    D_FF_C D2(~q[2], ~q[1],t_clr, q[2]);
    // nand (temp, q[2],q[1],~q[0]);
    // and (t_clr,clr,temp);
    // assign t_clr=clr;
endmodule