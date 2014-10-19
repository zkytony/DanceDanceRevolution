module inputHandler(keyin, CLOCK_50, Reset, out);
	input keyin, CLOCK_50, Reset;
	output reg out;
	
	wire [1:0] PS;
	reg [1:0] NS;
	parameter A = 2'b00, B = 2'b01, C = 2'b10;
	
	wire reset;
	
	always @(keyin or PS)
		case (PS)
			A: if (keyin == 1'b1) NS = B;
				else NS = A;
			B: NS = C;
			C: if (keyin == 1) NS = C;
				else NS = A;
			default NS = 2'bxx;
		endcase
	
	always @(PS)
		case (PS)
			A: out = 1'b0;
			B: out = 1'b1;
			C: out = 1'b0;
			default out = 1'bx;
		endcase
		
	assign reset = Reset;	
	
	D_FF lsb(PS[0], NS[0], reset, CLOCK_50);
	D_FF msb(PS[1], NS[1], reset, CLOCK_50);
endmodule
