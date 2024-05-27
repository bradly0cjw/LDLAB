
module half_adder(a, b, sum, carry);
    input a, b;
    output sum, carry;
    xor (sum, a, b);
    and (carry, a, b);
endmodule

module full_adder(a, b, cin, sum, cout);
    input a, b, cin;
    output sum, cout;
    wire s1, c1, c2;
    half_adder ha1(a, b, s1, c1);
    half_adder ha2(s1, cin, sum, c2);
    or (cout, c1, c2);
endmodule

module ripple_carry_4_bit_adder(a, b, sum, cout,c0);
    input [3:0] a, b;
    input c0;
    output [3:0] sum;
    output cout;
    wire [3:0] c;
    full_adder fa0(a[0], b[0], c0, sum[0], c[0]);
    full_adder fa1(a[1], b[1], c[0], sum[1], c[1]);
    full_adder fa2(a[2], b[2], c[1], sum[2], c[2]);
    full_adder fa3(a[3], b[3], c[2], sum[3], cout);
endmodule

module five_bit_adder_with_sub(a,b,S,sum,carry,c0,sub);
    input [4:0] a,b;
    input c0,S;
    output [4:0] sum;
    output carry;
    output sub;
    wire ct;
    wire [4:0] c;
    wire c5;
    wire [4:0] b1;
    wire c8;
    wire [3:0] temp;
    wire [4:0] st;
    xor (b1[4],b[4],S);
    xor (b1[3],b[3],S);
    xor (b1[2],b[2],S);
    xor (b1[1],b[1],S);
    xor (b1[0],b[0],S);
    or (ct,S,c0);
    ripple_carry_4_bit_adder M0(a[3:0],b1[3:0],st[3:0],c[4],ct);
    ripple_carry_4_bit_adder M1({3'b0,a[4]},{3'b0,b1[4]},temp,c8,c[4]);
    // assign sub=S==1?temp[1]:1'b0;
    // assign sum[4]=temp[0];
    // assign carry= S==1?1'b0:temp[1];
    assign st[4]=temp[0];
    wire make_two_complement ;
    wire [4:0]two_complement_sum;
    and (make_two_complement,~temp[1],S);
    xor (two_complement_sum[4],st[4],make_two_complement);
    xor (two_complement_sum[3],st[3],make_two_complement);
    xor (two_complement_sum[2],st[2],make_two_complement);
    xor (two_complement_sum[1],st[1],make_two_complement);
    xor (two_complement_sum[0],st[0],make_two_complement);
    wire t_carry;
    and (t_carry,temp[1],~S);
    assign sum=make_two_complement==1?two_complement_sum+1'b1:st;
    assign carry=t_carry;
    assign sub=make_two_complement;

endmodule