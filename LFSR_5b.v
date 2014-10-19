module LFSR_5b(Q, Clock, Reset);
	input Clock, Reset;
	output [8:0] Q;
	
	parameter x1 = 4, x2 = 8;
	
	wire in;
	xnor (in, Q[x1], Q[x2]);
	
	//module D_FF (q, d, reset, clk;
	D_FF dff0 (Q[0], in, Reset, Clock);
	D_FF dff1 (Q[1], Q[0], Reset, Clock);
	D_FF dff2 (Q[2], Q[1], Reset, Clock);
	D_FF dff3 (Q[3], Q[2], Reset, Clock);
	D_FF dff4 (Q[4], Q[3], Reset, Clock);
	D_FF dff5 (Q[5], Q[4], Reset, Clock);
	D_FF dff6 (Q[6], Q[5], Reset, Clock);
	D_FF dff7 (Q[7], Q[6], Reset, Clock);
	D_FF dff8 (Q[8], Q[7], Reset, Clock);
endmodule 

module test_lfsr;
	
	reg clock, reset, en; // inputs are reg;
	wire [8:0] q;
	LFSR_9b lfsr (q, clock, reset);
	
	parameter cc = 10;
	
	always
		#cc clock = ~clock;
		
	initial
	begin
		reset = 1;
		clock = 0;
		en = 0;
		#cc reset = 0;
		#(5*cc) reset = 1;
		#(5*cc) reset = 0;
		#(5*cc) reset = 1;
		#(5*cc) reset = 0;
		//$finish;
	end

endmodule