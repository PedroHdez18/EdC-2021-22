`timescale 1 ns / 10 ps //Directiva que fija la unidad de tiempo de simulación y la precision de la unidad

module microc_tb;

// Variables usadas en el tb
  reg clk, reset, s_ret, s_rre, s_inc, s_inm, we3, wez;
  reg [2:0] op;
  wire z;
  wire [5:0] opcode;

// Creacion del microc
microc microc(clk, reset, s_ret, s_rre, s_inc, s_inm, we3, wez, op, z, opcode);

//hacemos un always con un reloj

always
  begin
    clk=1;
    #20;
    clk=0;
    #20;
   end 

initial
  begin
  $monitor("tiempo=%0d opcode=%b", $time, opcode);
  $dumpfile("microc_tb.vcd");
  $dumpvars;
    reset=1;
    #10
    reset=0;
    #10
    // ADD R0, R0, R1
    we3=1;
    wez=1;
    s_inc=1;
    s_inm=0;
    s_ret=0;
    s_rre=0;
    op=3'b010;
    // LI 1, R2
    #40 //60
    we3=1;
    wez=0;
    s_inc=1;
    s_inm=1;
    s_ret=0;
    s_rre=0;
    op=3'b000;
    // LI 2, R3
    #40 //100
    we3=1;
    wez=0;
    s_inc=1;
    s_inm=1;
    s_ret=0;
    s_rre=0;
    op=3'b000;
    // bucle: JAL subr
    #40 //140
    we3=0;
    wez=0;
    s_inc=0;
    s_inm=1;
    s_ret=0;
    s_rre=1;
    op=3'b000;

    // subr: ADD R1, R2, R1
    #40 //180
    we3=1;
    wez=1;
    s_inc=1;
    s_inm=0;
    s_ret=0;
    s_rre=0;
    op=3'b010;
    // RET
    #40 //220
    we3=0;
    wez=0;
    s_inc=0;
    s_ret=0;
    s_rre=0;
    s_inm=1;
    op=3'b000;

    // SUB R3, R2, R3
    #40 //260
    we3=1;
    wez=1;
    s_inc=1;
    s_inm=0;
    s_ret=0;
    s_rre=0;
    op=3'b011;
    // JNZ bucle
    #40 //300
    we3=0;
    wez=0;
    s_inc=1;
    s_ret=0;
    s_rre=0;
    if (z == 0) 
    begin
      s_inc=0;
      s_ret=0;
      s_rre=1;
    end
    s_inm=1;
    op=3'b000;
    // bucle: JAL subr
    #40 //340
    we3=0;
    wez=0;
    s_inc=0;
    s_inm=1;
    s_ret=0;
    s_rre=1;
    op=3'b000;
    // subr: ADD R1, R2, R1
    #40 //380
    we3=1;
    wez=1;
    s_inc=1;
    s_inm=0;
    s_ret=0;
    s_rre=0;
    op=3'b010;
    // RET
    #40 //220
    we3=0;
    wez=0;
    s_inc=0;
    s_ret=0;
    s_rre=0;
    s_inm=1;
    op=3'b000;
    // SUB R3, R2, R3
    #40 //260
    we3=1;
    wez=1;
    s_inc=1;
    s_inm=0;
    s_ret=0;
    s_rre=0;
    op=3'b011;
    // JNZ bucle
    #40 //420
    we3=0;
    wez=0;
    s_inc=1;
    s_ret=0;
    s_rre=0;
    if (z == 0) 
    begin
      s_inc=0;
      s_ret=0;
      s_rre=1;
    end
    s_inm=1;
    op=3'b000;        
    // J fin
    #40 //440
    we3=0;
    wez=0;
    s_inc=0;
    s_ret=0;
    s_rre=0;
    s_inm=1;
    op=3'b000;

    // fin: J fin
    #40 //480
    we3=0;
    wez=0;
    s_inc=0;
    s_ret=0;
    s_rre=0;
    s_inm=1;
    op=3'b000;
    // fin: J fin
    #40 //480
    we3=0;
    wez=0;
    s_inc=0;
    s_ret=0;
    s_rre=0;
    s_inm=1;
    op=3'b000;
    #20
  $finish;
end
    
endmodule