// Testbench para modulo semisumador visto antes

`timescale 1 ns / 10 ps //Directiva que fija la unidad de tiempo de simulaci�n y el paso de simulaci�n

module mux4_1_tb;
//declaracion de se�ales

reg test_a, test_b, test_c, test_d;
reg [1:0] test_s; 
wire test_out; 
//instancia del modulo a testear, con notaci�n de posiciones de argumentos 
mux4_1 mux( test_out, test_a, test_b, test_c, test_d, test_s);

//Declaracion del mux en el archivo mux4_1
//mux4_1(output reg out, input wire a, b, c, d, input wire [1:0] s);
//Importante el orden de declaracion


initial
begin
  $monitor("tiempo=%0d a=%b b=%b c=%b d=%d s=%b out=%b", $time, test_a, test_b, test_c, test_d, test_s, test_out);
  $dumpfile("mux4_1_tb.vcd");
  $dumpvars;

  //prueba 1
  test_a = 1'b1;
  test_b = 1'b0;
  test_c = 1'b1;
  test_d = 1'b0;
  test_s = 2'b00;
  #20;

  //prueba 2
  test_a = 1'b1;
  test_b = 1'b0;
  test_c = 1'b1;
  test_d = 1'b0;
  test_s = 2'b01;
  #20;

  //prueba 3
  test_a = 1'b1;
  test_b = 1'b0;
  test_c = 1'b1;
  test_d = 1'b0;
  test_s = 2'b10;
  #20;

  //prueba 4
  test_a = 1'b1;
  test_b = 1'b0;
  test_c = 1'b1;
  test_d = 1'b0;
  test_s = 2'b11;
  #20;

  $finish;  //fin simulacion

end
endmodule
