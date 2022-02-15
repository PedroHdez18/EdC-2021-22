module cal(output wire out, c_out, input wire a, b, arit, c_in, input wire [1:0] s);

wire cout_cl, carry_out, sum_fa;

cl cl_(cout_cl, a, b, s);
fa fa_(carry_out, sum_fa, a, b, c_in);

assign out = arit ? sum_fa : cout_cl;
assign c_out = arit ? carry_out : 1'b0;

endmodule

// always @*;
// if (arit == 0) //cl
//     begin
//         out = cout_cl;
//         C_out = 0;
//     end
// else if (arit == 1) //FA
//     begin
//         out = sum_fa;
//         c_out = carry_out;
//     end

// assign out = s ? b : a; //oper. condicional de C, sintaxis [condicion ? valor_si_cierta : valor_si_falsa] 

// cl(output wire out, input wire a, b, input wire [1:0] s);
// fa(output wire cout, sum, input wire a, b, cin);