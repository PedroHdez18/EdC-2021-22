module alu(output wire [3:0] R, output wire zero, carry, sign, input wire [3:0] A, B, input wire [1:0] ALUOp, input wire arit);

assign op1_A = ~arit | ~ALUOp[1];

assign op2_B = ~ALUOp[1] | (~arit & ~ALUOp[0]) | (arit & ALUOp[0]);

assign cpl = (arit & ALUOp[0]) | (arit & ALUOp[1]);

assign cin_0 = ALUOp[0] | ALUOp[1];

// Salidas mux
wire [3:0] OP1, OP2, s_b;

// mux2_4(output wire [3:0] out, input wire [3:0] a, input wire [3:0] b, input wire s);
// assign out = s ? b : a;
mux2_4 mux_OP1(OP1, 4'b0000, A, op1_A);
mux2_4 mux_OP2(s_b, A, B, op2_B);

// compl1(output wire [3:0] Sal, input wire [3:0] Ent, input wire cpl);
compl1 c1_OP2(OP2, s_b, cpl);

//SUMA
// La operación de sumala elaboramos simplemente instanciando cuatro elementos cal y 
// conectando los acarreos de salida de unelemento al acarreo de entrada del siguiente

wire cout_0, cout_1, cout_2, cout_3; 
wire cin_1, cin_2, cin_3; 

// cal(output wire out, c_out, input wire a, b, arit, c_in, input wire [1:0] s);
cal cal0(R[0], cout_0, OP1[0], OP2[0], arit, cin_0, ALUOp);
    assign cin_1 = cout_0;
cal cal1(R[1], cout_1, OP1[1], OP2[1], arit, cin_1, ALUOp);
    assign cin_2 = cout_1;
cal cal2(R[2], cout_2, OP1[2], OP2[2], arit, cin_2, ALUOp);
    assign cin_3 = cout_2;
cal cal3(R[3], cout_3, OP1[3], OP2[3], arit, cin_3, ALUOp);

// Asignando los valores a zero en funcion de R
assign zero = R ? 0 : 1;

// Asignando los valores a carry en funcion de el acarreo de R
assign carry = cout_3 ? 1 : 0;

// Asignando los valores a sign en funcion del bit mas significato de R
assign sign = R[3];


endmodule



    // DECLARACION
// Salidas tabla
// output reg op1_A, op2_B, cpl, cin_0;

// ASIGNACION DE VALORES TABLA DE LA VERDAD
// always @(arit, ALUOp)
// begin 
//     case (arit)
//         1'b0 :                          // arit == 0
//         begin 
//             case (ALUOp)              
//                 2'b00 :                 // A and B
//                 begin
//                     op1_A = 1;
//                     op2_B = 1;
//                     cpl = 0; 
//                 end
//                 2'b01 :                 // A or B 
//                 begin
//                     op1_A = 1; 
//                     op2_B = 1; 
//                     cpl = 0;
//                 end
//                 2'b10 :                 // A xor B
//                 begin
//                     op1_A = 1;
//                     op2_B = 1;
//                     cpl = 0; 
//                 end 
//                 2'b11 :                 // not A
//                 begin
//                     op1_A = 1;
//                     op2_B = 0;
//                     cpl = 0; 
//                 end
//             endcase 
//         end

//         1'b1 :                          // arit == 1
//         begin 
//             case (ALUOp)                
//                 2'b00 :                 // A + B
//                 begin
//                     op1_A = 1;
//                     op2_B = 1;
//                     cpl = 0;
//                     cin_0 = 0; 
//                 end
//                 2'b01 :                 // A - B 
//                 begin
//                     op1_A = 1;
//                     op2_B = 1;
//                     cpl = 1;
//                     cin_0 = 1; 
//                 end
//                 2'b10 :                 // compl A
//                 begin
//                     op1_A = 0;
//                     op2_B = 0;
//                     cpl = 1;
//                     cin_0 = 1; 
//                 end 
//                 2'b11 :                 // compl B
//                 begin
//                     op1_A = 0;
//                     op2_B = 1;
//                     cpl = 1;
//                     cin_0 = 1; 
//                 end
//             endcase 
//         end 
//     endcase
// end