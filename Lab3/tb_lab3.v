module tb_lab3;
reg [0:8]A;
wire[0:6]O;
lab3 T1(A,O);
initial #200 $finish;
  initial begin				// Stimulus generator
    	A = 9'b000000000;
      #10 A = A + 1'b1 ;
    repeat (9)
      #10 A = A * 2;
  end

endmodule