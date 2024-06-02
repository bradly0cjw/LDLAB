module decoder_2x4_gate(D,A,B,enable);
output [3:0] D;
input A,B,enable;
wire A_not , B_not,enable_not;
not G1 (A_not,A),
G2 (B_not,B),
G3 (enable_not,enable);
nand
G4 (D[0],A_not,B_not,enable_not),
G5 (D[1],A,B_not,enable_not),
G6 (D[2],A_not,B,enable_not),
G7 (D[3],A,B,enable_not);
endmodule

module decoder_4x16(inSwitch, outLED);
output [15:0] outLED;
input [3:0] inSwitch;
wire [3:0]enable;
decoder_2x4_gate G1 (outLED[3:0],inSwitch[0],inSwitch[1],enable[0]);
decoder_2x4_gate G2 (outLED[7:4],inSwitch[0],inSwitch[1],enable[1]);
decoder_2x4_gate G3 (outLED[11:8],inSwitch[0],inSwitch[1],enable[2]);
decoder_2x4_gate G4 (outLED[15:12],inSwitch[0],inSwitch[1],enable[3]);
decoder_2x4_gate G5 (enable,inSwitch[2],inSwitch[3],0);
endmodule