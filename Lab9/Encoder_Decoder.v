module 4x2_encoder(in,out);
output [1:0] out;
input [3:0] in;
assign out[0] = in[0] | in[1] | in[2] | in[3];
assign out[1] = in[0] & in[1] & in[2] & in[3];
endmodule

module 2x4_decoder(in,out);
output [3:0] out;
input [1:0] in;
assign out[0] = ~in[0] & ~in[1];
assign out[1] = ~in[0] & in[1];
assign out[2] = in[0] & ~in[1];
assign out[3] = in[0] & in[1];
endmodule