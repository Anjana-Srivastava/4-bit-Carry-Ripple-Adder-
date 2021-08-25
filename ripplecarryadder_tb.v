`timescale 1ns/1ns 
`include "ripplecarryadder.v" 

module ripplecarryadder_tb;

reg[3:0] A,B;
wire[3:0] S; 
wire Cout; 

ripplecarryadder UUT(A,B,S,Cout);

initial begin 
$dumpfile("ripplecarryadder.vcd");
$dumpvars(0, ripplecarryadder_tb);
#100
A=4'b0001;
B=4'b0000; 
#100
A=4'b0011;
B=4'b0010;
#100
A=4'b0101;
B=4'b0100;
#100
A=4'b0111;
B=4'b0110;
#100
A=4'b1011;
B=4'b1010;
#100
A=4'b1001;
B=4'b1000;
#100
A=4'b1111;
B=4'b1110;
#100
A=4'b1101;
B=4'b1100;




end 
endmodule 