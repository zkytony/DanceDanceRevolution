module encode_top(L, O);
	input [4:0] L;
	output [2:0] O;
	
	assign O[2] = L[3] | L[4];
	assign O[1] = ~L[3] & ~L[4] & (L[2] | L[1]);
	assign O[0] = ~L[3] & ~L[4] & (L[0] & ~L[1] | L[2]) | L[4];

endmodule

module test_encoder;

	reg clk;
	reg [4:0] l;
	wire [2:0] o;
	
	encode_top e (l, o);

	parameter cc = 10;
	
	always
		#cc clk = ~clk;
		
	always
		#cc l = l + 1;
		
	initial
	begin
		clk = 0;
		l = 0;
	end
	
endmodule 