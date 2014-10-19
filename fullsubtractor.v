module fullsubtractor(X, Y, BORin, diff, BORout);
	input X, Y, BORin;
	output diff, BORout;
	
	wire d1, b1, b2;
	halfsubtractor first (X, Y, d1, b1);
	halfsubtractor second (BORin, d1, diff, b2);
	or (BORout, b1, b2);

endmodule

module halfsubtractor(X, Y, diff, bor);
	input X, Y;
	output diff, bor;
	
	xor (diff, X, Y);
	wire notX;
	not (notX, X);
	and (bor, notX, Y);
endmodule
