module D_FF_C(d, clk, clr, q);
    input d, clk,clr;
    output q;
    reg q;
    always @(posedge clk, negedge clr)
    begin
        if (~clr)
            q <= 0;
        else
            q <= d;
    end
endmodule

module mod6_async_counter(clk, clr, q);
    input clk, clr;
    output [2:0] q;
    // reg [2:0] q;
    wire t_clr;
    D_FF_C D0(~q[0], clk, t_clr, q[0]);
    D_FF_C D1(~q[1], q[0],t_clr, q[1]);
    D_FF_C D2(~q[2], q[1],t_clr, q[2]);
    assign t_clr = clr&(q[2]|~q[1]|~q[0]);
    // assign t_clr=clr;
endmodule