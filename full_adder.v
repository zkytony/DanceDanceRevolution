module full_adder(Co, S, A, B, Ci);
	input A, B, Ci;
	output Co, S;
	
	wire sum;
	wire c_first, c_second; // carry of first/second half_adder
	
	half_adder first (c_first, sum, A, B);
	half_adder second (c_second, S, sum, Ci);
	
	or (Co, c_first, c_second);
endmodule

module half_adder(C, S, A, B);
	input A, B;
	output C, S;
	
	xor (S, A, B); // S = A xor B
	and (C, A, B); // Carry = A and B
endmodule 