module tb_Group4_Exp8_1();
    reg mode, load, clk;
    reg [4:0] data;
    wire [4:0] RingOut, JhonsonOut;
    ring_and_Johnson_counter M0(mode, load, clk, data, RingOut, JhonsonOut);
    initial #220 $finish;
    initial begin clk = 0; forever #5 clk = ~clk; end
    
    initial begin
        // Ring counter
        #10 mode=0; load=1; data=5'b01111;
        #10 load=0;
        #70 mode=1; load=1; data=5'b01100;
        #10 load=0;
    end
endmodule