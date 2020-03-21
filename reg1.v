module reg1(clk,rst,init,ld,in,out);
input clk;
input rst;
input init;
input ld;
input in;
output reg out;
	always@(posedge clk,posedge rst)begin
		if (rst|init) out<=1'b0;
		else if (init) out<=1'b0;
		else if (ld) out<=in;
	end
endmodule
