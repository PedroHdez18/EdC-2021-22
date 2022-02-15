module mux4_1(output reg out, input wire a, b, c, d, input wire [1:0] s);

always @*                   //Con el * te permite no poner las in/out
begin 
    case (s)                //Probamos con todas las opc de un mux4_1
    2'b00    : out = a;      //Si s = 00 -> out = a
    2'b01    : out = b;      //Si s = 01 -> out = b
    2'b10    : out = c;      //Si s = 10 -> out = c
    2'b11    : out = d;      //Si s = 11 -> out = d
    endcase 
end

endmodule
