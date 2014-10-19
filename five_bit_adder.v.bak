module ten_bit_adder(C, S, A, B);
	input [9:0] A;
	input [9:0] B;
	output [9:0] S;
	output [9:0] C;
	
	full_adder FA0 (C[0], S[0], A[0], B[0], 0);
	full_adder FA1 (C[1], S[1], A[1], B[1], C[0]);
	full_adder FA2 (C[2], S[2], A[2], B[2], C[1]);
	full_adder FA3 (C[3], S[3], A[3], B[3], C[2]);
	full_adder FA4 (C[4], S[4], A[4], B[4], C[3]);
	full_adder FA5 (C[5], S[5], A[5], B[5], C[4]);
	full_adder FA6 (C[6], S[6], A[6], B[6], C[5]);
	full_adder FA7 (C[7], S[7], A[7], B[7], C[6]);
	full_adder FA8 (C[8], S[8], A[8], B[8], C[7]);
	full_adder FA9 (C[9], S[9], A[9], B[9], C[8]);
endmodule 