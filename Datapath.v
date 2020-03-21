module Datapath(clk, rst, ldX, ldY, ldA, initA, initYminusOne,aBarS, shRA, shRY, ldYminusOne, selR, selL,inBus, Y0YminusOne, outBus);
input clk;
input rst;
input ldX;
input ldY;
input ldA;
input initA;
input initYminusOne;
input aBarS;
input shRA;
input shRY;
input ldYminusOne;
input selR;
input selL;
input [5:0]inBus;
output [1:0]Y0YminusOne;
output [5:0]outBus;
	wire [5:0]Xout,Yout,Aout;
	wire Asign,A0,Y0;
	wire YminusOne;
	wire [5:0]res;

	Shreg6 X(
		.clk(clk),
		.rst(rst),
		.ld(ldX),
		.sh(),
		.serin(),
		.serout(),
		.parin(inBus),
		.parout(Xout)
		);
	Shreg6 Y(
		.clk(clk),
		.rst(rst),
		.ld(ldY),
		.sh(shRY),
		.serin(A0),
		.serout(Y0),
		.parin(inBus),
		.parout(Yout)
		);
	assign Asign=Aout[5];
	Shreg6 A(
		.clk(clk),
		.rst(rst),
		.init(initA),
		.ld(ldA),
		.sh(shRA),
		.serin(Asign),
		.serout(A0),
		.parin(res),
		.parout(Aout)
		);
	Reg1 YminusOneReg(
		.clk(clk),
		.rst(rst),
		.init(initYminusOne),
		.ld(ldYminusOne),
		.in(Y0),
		.out(YminusOne)
		);
	Adder adder (
		.aBarS(aBarS),
		.A(Aout),
		.B(Xout),
		.C(res)
		);
	Bufif6 buf6L (
		.sel(selL),
		.in(Aout),
		.out(outBus)
		);
	Bufif6 buf6R (
		.sel(selR),
		.in(Yout),
		.out(outBus)
		);
	assign Y0YminusOne={Y0,YminusOne};
endmodule
