
//4 bit ripple carry adder 
module ripplecarryadder(A,B,S,Co);
input [3:0] A, B; 
output [3:0] S;
output Co; 
wire w1,w2,w3;

fulladder u0(.A(A[0]),.B(B[0]),.Cin(1'b0),.S(S[0]),.Cout(w1));
fulladder u1(.A(A[1]),.B(B[1]),.Cin(w1),.S(S[1]),.Cout(w2));
fulladder u2(.A(A[2]),.B(B[2]),.Cin(w2),.S(S[2]),.Cout(w3));
fulladder u3(.A(A[3]),.B(B[3]),.Cin(w3),.S(S[3]),.Cout(Co));
endmodule 

// Full adder 
module fulladder(A,B,Cin,S,Cout);
input A,B,Cin;
output S,Cout; 
wire [7:0] w; 

reg [2:0] in; 
decoder3to8 u0(.A(A),.B(B),.C(Cin),.D(w));

assign S= w[1] | w[2] | w[4] | w[7];
assign Cout= w[3] | w[5] | w[6] | w[7]; 
endmodule 

//3-to-8 Decoder 
module decoder3to8(A,B,C,D);
input A,B,C;
output [7:0] D;

wire[5:0] W; 

decoder2to4 u0(.A(A),.B(B),.D(W[5:2]));
decoder1to2 u1(.A(C),.D(W[1:0]));

assign D[7]=W[5] & W[1];
assign D[6]=W[5] & W[0];
assign D[5]=W[4] & W[1];
assign D[4]=W[4] & W[0];
assign D[3]=W[3] & W[1];
assign D[2]=W[3] & W[0];
assign D[1]=W[2] & W[1];
assign D[0]=W[2] & W[0];
endmodule

//2-to-4 Decoder 
module decoder2to4(A,B,D);
input A,B;
output[3:0] D;

wire[3:0] W;

decoder1to2 u0(.A(A), .D(W[3:2]));
decoder1to2 u1(.A(B), .D(W[1:0]));
assign D[3]= W[3] & W[1];
assign D[2]= W[3] & W[0];
assign D[1]= W[2] & W[1];
assign D[0]= W[2] & W[0];
endmodule 

//1-to-2 Decoder. 
module decoder1to2(A,D);
input A;
output[1:0] D; 
assign D[0]=A;
assign D[1]=~A;
endmodule 