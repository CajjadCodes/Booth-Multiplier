`timescale 1ns/1ns

module TB();

reg clk, rst;
reg start;
reg [5:0] inBus;
wire [5:0] outBus;
wire done;

reg signed [5:0] X, Y;
reg signed [11:0] result;

	BoothMultiplier bm (
		.clk(clk),
		.rst(rst),
		.inBus(inBus),
		.outBus(outBus),
		.start(start),
		.done(done)
		);

	initial begin
		clk = 0; rst = 0; 
		repeat (6) #247 clk = ~clk;
		#100 rst = 1;
		#100 rst = 0;
		#100

		/* Test 1: 9 * 8 */

		X = 9;
		Y = 8;

		start = 1;
		#100
		clk = 1;
		#247
		inBus = X;
		clk = 0;
		#247
		start = 0;
		clk = 1;
		#247
		inBus = Y;
		clk = 0;
		#247
		clk = 1;
		
		while(done != 1'b1) #247 clk = ~clk;
		
		#247 clk = 0;
		result[11:6] = outBus;
		#247 clk = 1;
		#247 clk = 0;
		result[5:0] = outBus;
		#247 clk = 1;
		#247 clk = 0;
		$display("result of %d * %d is: %d", X, Y, result);



		/* Test 2: 23 * -11 */

		X = 23;
		Y = -11; 

		start = 1;
		#100
		clk = 1;
		#247
		inBus = X;
		clk = 0;
		#247
		start = 0;
		clk = 1;
		#247
		inBus = Y;
		clk = 0;
		#247
		clk = 1;
		
		while(done != 1'b1) #247 clk = ~clk;
		
		#247 clk = 0;
		result[11:6] = outBus;
		#247 clk = 1;
		#247 clk = 0;
		result[5:0] = outBus;
		#247 clk = 1;
		#247 clk = 0;
		$display("result of %d * %d is: %d", X, Y, result);

		/* Test 3: -10 * -19 */

		X = -10;
		Y = -19;

		start = 1;
		#100
		clk = 1;
		#247
		inBus = X;
		clk = 0;
		#247
		start = 0;
		clk = 1;
		#247
		inBus = Y;
		clk = 0;
		#247
		clk = 1;
		
		while(done != 1'b1) #247 clk = ~clk;
		
		#247 clk = 0;
		result[11:6] = outBus;
		#247 clk = 1;
		#247 clk = 0;
		result[5:0] = outBus;
		#247 clk = 1;
		#247 clk = 0;
		$display("result of %d * %d is: %d", X, Y, result);


		/* Test 4: 20 * 0 */

		X = 20;
		Y = 0;

		start = 1;
		#100
		clk = 1;
		#247
		inBus = X;
		clk = 0;
		#247
		start = 0;
		clk = 1;
		#247
		inBus = Y;
		clk = 0;
		#247
		clk = 1;
		
		while(done != 1'b1) #247 clk = ~clk;
		
		#247 clk = 0;
		result[11:6] = outBus;
		#247 clk = 1;
		#247 clk = 0;
		result[5:0] = outBus;
		#247 clk = 1;
		#247 clk = 0;
		$display("result of %d * %d is: %d", X, Y, result);

		/* Test 5: 31 * 31 */

		X = 31;
		Y = -31; 

		start = 1;
		#100
		clk = 1;
		#247
		inBus = X;
		clk = 0;
		#247
		start = 0;
		clk = 1;
		#247
		inBus = Y;
		clk = 0;
		#247
		clk = 1;
		
		while(done != 1'b1) #247 clk = ~clk;
		
		#247 clk = 0;
		result[11:6] = outBus;
		#247 clk = 1;
		#247 clk = 0;
		result[5:0] = outBus;
		#247 clk = 1;
		#247 clk = 0;
		$display("result of %d * %d is: %d", X, Y, result);
		#500
		$stop;
	end

endmodule
