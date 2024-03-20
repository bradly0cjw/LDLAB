module tb_adder();
    reg [2:0] A;
    wire S,C ;
    adder uut(A[2],A[1],A[0],S,C); 
initial begin
    A=0;
    repeat(7)
    #20 A=A+3'h1;
end
initial #150 $finish;
initial begin
    $display ("                  time   Select  Carry Sum");
    $monitor ($time, "    %b       %b  %b",A,C,S);
end
endmodule