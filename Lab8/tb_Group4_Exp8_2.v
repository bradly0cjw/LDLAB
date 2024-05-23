module tb_Group4_Exp8_2();
    reg clk,clr;
    wire [2:0] q;
    mod6_async_counter M0(clk,clr,q);
    initial #100 $finish;
    initial begin clk = 1; forever #5 clk = ~clk; end
    
    initial begin
        // Ring counter
        #0 clr=0;
        #10 clr=1;
        // #60 clr=0;
        // #5 clr=1;
        // #10 clr=1;
    end
endmodule