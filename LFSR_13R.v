module LFSR_8b(Q, Clock, Reset);
	input Clock, Reset;
	output [7:0] Q;
	
	parameter x1 = 7, x2 = 5, x3 = 4, x4 = 3;
	
	wire in;
	xnor (in, Q[x1], Q[x2], Q[x3], Q[x4]);
	
	//module D_FF (q, d, reset, clk;
	D_FF dff0 (Q[0], in, Reset, Clock);
	D_FF dff1 (Q[1], Q[0], Reset, Clock);
	D_FF dff2 (Q[2], Q[1], Reset, Clock);
	D_FF dff3 (Q[3], Q[2], Reset, Clock);
	D_FF dff4 (Q[4], Q[3], Reset, Clock);
	D_FF dff5 (Q[5], Q[4], Reset, Clock);
	D_FF dff6 (Q[6], Q[5], Reset, Clock);
	D_FF dff7 (Q[7], Q[6], Reset, Clock);
endmodule 