module bufif6(sel,in,out);
input sel;
input [5:0]in;
output [5:0]out;
	assign out=sel?in:6'bzzzzzz;
endmodule
