module LFSR_7b(Q, Clock, Reset);
	input Clock, Reset;
	output [6:0] Q;
	
	parameter x1 = 5, x2 = 6;
	
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
endmodule 