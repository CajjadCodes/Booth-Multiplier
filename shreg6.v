module shreg6(clk,rst,init,ld,sh,serin,serout,parin,parout);
input clk;
input rst;
input init;
input ld;
input sh;
input serin;
input [5:0]parin;
output serout;
output reg[5:0]parout;
	always@(posedge clk,posedge rst)begin
		if (rst) parout<=6'b000000;
		else if (init) parout<=6'b000000;
		else if (ld) parout<=parin;
		else if (sh) parout<={serin,parout[5:1]};
	end
	assign serout=parout[0];
endmodule
