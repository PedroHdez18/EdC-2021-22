module microc(input wire clk, reset, s_ret, s_rre, s_inc, s_inm, we3, wez, input wire [2:0] op, output wire z, output wire [5:0] opcode);
//Microcontrolador sin memoria de datos de un solo ciclo

//Instanciar e interconectar pc, memprog, regfile, alu, sum, biestable Z y mux's

wire[9:0] sum_out, mux_SumSalto, mux_pc, dir, dir_salto, rr_out;
wire[3:0] ra1, ra2, wa3;
wire[7:0] inm, wd3, rd1, rd2, alu_out;
wire[15:0] instruccion;
wire zalu;

assign ra1[3:0] = instruccion[11:8];
assign ra2[3:0] = instruccion[7:4];
assign wa3[3:0] = instruccion[3:0];
assign inm[7:0] = instruccion[11:4];
assign opcode[5:0] = instruccion[15:10];
assign dir_salto[9:0] = instruccion[9:0];

mux2 #(10) muxPC(mux_SumSalto, rr_out, s_ret, mux_pc);
registro #(10) pc(clk, reset, mux_pc, dir);
sum sum(dir, 10'b1, sum_out);
memprog memprog(clk, dir, instruccion);
regfile banco_registros(clk, we3, ra1, ra2, wa3, wd3, rd1, rd2);
alu alu(rd1, rd2, op, alu_out, zalu);
ffd ffz(clk, reset, zalu, wez, z);
mux2 muxAlu(alu_out, inm, s_inm, wd3);
registro_en #(10) rr(clk, reset, s_rre, sum_out, rr_out);
mux2 #(10) muxInc(dir_salto, sum_out, s_inc, mux_SumSalto);


endmodule