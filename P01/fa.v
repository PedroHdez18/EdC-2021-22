//HA_1
// xor xor1(sum1, a, b);
// and and1(carry, a, b);

//HA_2
// xor xor2(sum, cin, sum1);
// and and2(carry2, cin, sum1);

module fa(output wire cout, sum, input wire a, b, cin);

wire sum1, carry1, carry2;

assign {carry1, sum1} = a + b;
assign {carry2, sum} = cin + sum1;

or or1(cout, carry1, carry2);

endmodule