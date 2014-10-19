module D_FF (q, d, reset, clk);
	output q;
	input d, reset, clk;
	reg q; // Indicate that q is stateholding
	
	always @(posedge clk or posedge reset)
		if (reset)
			q = 0; // On reset, set to 0
		else
			q = d; // Otherwise out = d
endmodule 

// divided_clocks[0] = 25MHz, [1] = 12.5Mhz, ... [23] = 3Hz, [24] = 1.5Hz,
//[25] = 0.75Hz, ...
module clock_divider (clock, divided_clocks);
	input clock;
	output [31:0] divided_clocks;
	reg [31:0] divided_clocks;
	
	initial
		divided_clocks = 0;
	
	always @(posedge clock)
		divided_clocks = divided_clocks + 1;
endmodule  