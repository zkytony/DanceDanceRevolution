module addsub_5b(C, S, A, B);
	input [4:0] A;
	input [4:0] B;
	output [4:0] S;
	output [4:0] C;
	
	full_adder FA0 (C[0], S[0], A[0], B[0], 0);
	full_adder FA1 (C[1], S[1], A[1], B[1], C[0]);
	full_adder FA2 (C[2], S[2], A[2], B[2], C[1]);
	full_adder FA3 (C[3], S[3], A[3], B[3], C[2]);
	full_adder FA4 (C[4], S[4], A[4], B[4], C[3]);
endmodule 