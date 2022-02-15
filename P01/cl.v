module cl(output wire out, input wire a, b, input wire [1:0] s);

output wire salida_and, salida_or, salida_xor, salida_not;

and and_(salida_and, a, b);
or or_(salida_or, a, b);
xor xor_(salida_xor, a, b);
not not_(salida_not, a);

// mux4_1(output reg out, input wire a, b, c, d, input wire [1:0] s);
mux4_1 celda_log(out, salida_and, salida_or, salida_xor, salida_not, s);

endmodule