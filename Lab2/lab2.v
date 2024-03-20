module adder(A,B,Ci,Co,S);
    input A,B,Ci;
    output Co,S;
    // wire
    assign S = (A^B^Ci);
    assign Co = (A||Ci)+(B||Ci)+(A||B);
endmodule