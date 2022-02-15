module compl1(output wire [3:0] Sal, input wire [3:0] Ent, input wire cpl);

assign Sal = cpl ? ~Ent : Ent;
//Si cpl = 1, Sal = Cpl1(Ent) y si no, Sal =Ent.
// ~Ent, (negacion)

endmodule