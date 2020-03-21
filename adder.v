module adder(aBarS,A,B,C);
input aBarS;
input [5:0]A;
input [5:0]B;
output [5:0]C;
	assign C=aBarS ? A+~B+1'b1 : A+B;

endmodule
