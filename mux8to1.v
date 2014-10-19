module mux8to1 (D0, D1, D2, D3, D4, D5, D6, D7, S, out);
	input D0, D1, D2, D3, D4, D5, D6, D7;
	input [2:0] S;
	output out;
	
	reg out;
	
	always @(D0 or D1 or D2 or D3 or D4 or D5 or D6 or D7 or S)
		begin
			case (S)
				3'd0: out = D0;
				3'd1: out = D1;
				3'd2: out = D2;
				3'd3: out = D3;
				3'd4: out = D4;
				3'd5: out = D5;
				3'd6: out = D6;
				3'd7: out = D7;
				default:;
			endcase
		end
endmodule 