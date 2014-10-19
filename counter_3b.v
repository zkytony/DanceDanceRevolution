module counter_3b (B, Clock, reset);
	output [2:0] B;
	input Clock, reset;
	
	wire [2:0] PS;
	reg [2:0] NS;
	reg [2:0] B;
	
	parameter [2:0] _0 = 3'b000,
				 _1 = 3'b001,
				 _2 = 3'b010,
				 _3 = 3'b011,
				 _4 = 3'b100,
				 _5 = 3'b101,
				 _6 = 3'b110,
				 _7 = 3'b111;
	
	always @(Clock or PS)
		case (PS)
			_0: NS = _1;
			_1: NS = _2;
			_2: NS = _3;
			_3: NS = _4;
			_4: NS = _5;
			_5: NS = _6;
			_6: NS = _7;
			_7: NS = _0;
			default: NS = 3'bxxx;
		endcase
		
	always @(PS)
		case(PS)
			_0 : B = PS;
			_1 : B = PS;
			_2 : B = PS;
			_3 : B = PS;
			_4 : B = PS;
			_5 : B = PS;
			_6 : B = PS;
		   _7 : B = PS;
			default: B = 3'bxxx;
		endcase
		
	D_FF dff1(PS[0], NS[0], reset, Clock);
	D_FF dff2(PS[1], NS[1], reset, Clock);
	D_FF dff3(PS[2], NS[2], reset, Clock);
	
endmodule 

module test_ct3;
	reg clk, reset;
	
	wire [2:0] d;
	
	counter_3b counter (d, clk, reset);
	
	parameter cc = 10;
	
	always
		#cc clk = ~clk;
		
	initial
	begin
		reset = 1;
		clk = 0;
		#cc reset = 0;
	end
endmodule
