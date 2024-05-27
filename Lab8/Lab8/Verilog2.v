module D_FF(input d, clk, output reg q, output wire qbar);
    always @(posedge clk)
        q <= d;
    assign qbar = ~q;
endmodule

module ring_and_Johnson_counter(input mode, load, clk, input [4:0] data, output [4:0] RingOut, JhonsonOut);
    reg [4:0] d;
    wire [4:0] dbar;
    wire [4:0] d_out; // New wire type variables

    D_FF D0(d[0], clk, d_out[0], dbar[0]);
    D_FF D1(d[1], clk, d_out[1], dbar[1]);
    D_FF D2(d[2], clk, d_out[2], dbar[2]);
    D_FF D3(d[3], clk, d_out[3], dbar[3]);
    D_FF D4(d[4], clk, d_out[4], dbar[4]);
    
    always @(negedge clk,posedge load)
    begin
        if (load)
            d <= data;
        else if (mode) // Johnson counter
            d <= {d_out[3],d_out[2],d_out[1],d_out[0],dbar[4]};
        else // Ring counter
            d <= {d_out[3],d_out[2],d_out[1],d_out[0],d_out[4]};
    end

    assign RingOut = (mode) ? 5'b0 : d;
    assign JhonsonOut = (mode) ? d : 5'b0;
endmodule