module subtractor_3b(X, Y, D, B);
	input [2:0] X, Y;
	output [2:0] D, B;
	
	fullsubtractor FS0 (X[0], Y[0], 0, D[0], B[0]);
	fullsubtractor FS1 (X[1], Y[1], B[0], D[1], B[0]);
	fullsubtractor FS2 (X[2], Y[2], B[1], D[2], B[2]);
	
endmodule 