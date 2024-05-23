module D_FF(input d, clk, output reg q, output wire qbar);
    always @(posedge clk)
        q <= d;
    assign qbar = ~q;
endmodule

module ring_and_Johnson_counter(input mode, load, clk, input [4:0] data, output [4:0] RingOut, JhonsonOut);
    reg [4:0] d;
    wire [4:0] dbar;
    D_FF D0(d[0], clk, d[0], dbar[0]);
    D_FF D1(d[1], clk, d[1], dbar[1]);
    D_FF D2(d[2], clk, d[2], dbar[2]);
    D_FF D3(d[3], clk, d[3], dbar[3]);
    D_FF D4(d[4], clk, d[4], dbar[4]);

    always @(posedge clk)
    begin
        if (load)
            d <= data;
        else if (mode) // Johnson counter
            d <= {dbar[0], d[4:1]};
        else // Ring counter
            d <= {d[3:0], d[4]};
    end

    assign RingOut = (mode) ? 5'b0 : d;
    assign JhonsonOut = (mode) ? d : 5'b0;
endmodule