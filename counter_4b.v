module tens_count (U, T, in, Clock, reset);
	input Clock, reset;
	input [1:0] in;
	output [3:0] U, T;
	
	reg [3:0] T;
	
	parameter [3:0] _0 = 4'b0000,
				 _1 = 4'b0001,
				 _2 = 4'b0010,
				 _3 = 4'b0011,
				 _4 = 4'b0100,
				 _5 = 4'b0101,
				 _6 = 4'b0110,
				 _7 = 4'b0111,
				 _8 = 4'b1000,
				 _9 = 4'b1001;
	
	wire inc;
	counter_4b c_4 (U, inc, Clock, in, reset);
	
	wire [3:0] PS;
	reg [3:0] NS;
	
	always @(inc or PS)
		case (PS)
			_0: if (inc == 1'b1) NS = _1; else NS = _0;
			_1: if (inc == 1'b1) NS = _2; else NS = _1;
			_2: if (inc == 1'b1) NS = _3; else NS = _2;
			_3: if (inc == 1'b1) NS = _4; else NS = _3;
			_4: if (inc == 1'b1) NS = _5; else NS = _4;
			_5: if (inc == 1'b1) NS = _6; else NS = _5;
			_6: if (inc == 1'b1) NS = _7; else NS = _6;
			_7: if (inc == 1'b1) NS = _8; else NS = _7;
			_8: if (inc == 1'b1) NS = _9; else NS = _8;
			_9: if (inc == 1'b1) NS = _0; else NS = _9;
			default:
				NS = 4'bx;
		endcase
			
	always @(PS)
		case (PS)
			_0: T = PS;
			_1: T = PS;
			_2: T = PS;
			_3: T = PS;
			_4: T = PS;
			_5: T = PS;
			_6: T = PS;
			_7: T = PS;
			_8: T = PS;
			_9: T = PS;
			default:
				T = 4'bx;
		endcase
		
	D_FF dff0(PS[0], NS[0], reset, Clock);
	D_FF dff1(PS[1], NS[1], reset, Clock);
	D_FF dff2(PS[2], NS[2], reset, Clock);
	D_FF dff3(PS[3], NS[3], reset, Clock);
endmodule

module counter_4b (U, INC, Clock, in, reset);
	output [3:0] U;
	output INC;
	input [1:0] in;
	input Clock, reset;
	
	wire [3:0] PS;
	reg [3:0] NS;
	reg [3:0] U;
	reg INC;
	
	parameter [1:0] no =2 'b00, p1 = 2'b01, p2 = 2'b10, n2 = 2'b11;
	parameter [3:0] _0 = 4'b0000,
				 _1 = 4'b0001,
				 _2 = 4'b0010,
				 _3 = 4'b0011,
				 _4 = 4'b0100,
				 _5 = 4'b0101,
				 _6 = 4'b0110,
				 _7 = 4'b0111,
				 _8 = 4'b1000,
				 _9 = 4'b1001,
				 
				 i_0 = 4'b1010,
				 i_1 = 4'b1011;
				 
	
	always @(in or PS)
		case (PS)
			_0: 
				begin
					case (in)
						p1: NS = _1;
						p2: NS = _2;
						default NS = _0;
					endcase
				end
			_1:
				begin
					case (in)
						p1: NS = _2;
						p2: NS = _3;
						n2: NS = _0;
						default NS = _1;
					endcase
				end
			_2:
				begin
					case (in)
						p1: NS = _3;
						p2: NS = _4;
						n2: NS = _0;
						default NS = _2;
					endcase
				end
			_3:
				begin
					case (in)
						p1: NS = _4;
						p2: NS = _5;
						n2: NS = _1;
						default NS = _3;
					endcase
				end
			_4:
				begin
					case (in)
						p1: NS = _5;
						p2: NS = _6;
						n2: NS = _2;
						default NS = _4;
					endcase
				end
			_5:
				begin
					case (in)
						p1: NS = _6;
						p2: NS = _7;
						n2: NS = _3;
						default NS = _5;
					endcase
				end
			_6:
				begin
					case (in)
						p1: NS = _7;
						p2: NS = _8;
						n2: NS = _4;
						default NS = _6;
					endcase
				end
			_7:
				begin
					case (in)
						p1: NS = _8;
						p2: NS = _9;
						n2: NS = _5;
						default NS = _7;
					endcase
				end
			_8:
				begin
					case (in)
						p1: NS = _9;
						p2: begin NS = i_0; end
						n2: NS = _6;
						default NS = _8;
					endcase
				end
			_9:
				begin
					case (in)
						p1: begin NS = i_0; end
						p2: begin NS = i_1; end
						n2: NS = _7;
						default NS = _9;
					endcase
				end
			i_0:
				begin
					NS = _0;
				end
			i_1:
				begin
					NS = _1;
				end
			default: 
				begin
					NS = 3'bxxx;
				end
		endcase
		
	always @(PS)
		case(PS)
			_0 : begin U = PS; INC = 0; end
			_1 : begin U = PS; INC = 0; end
			_2 : begin U = PS; INC = 0; end
			_3 : begin U = PS; INC = 0; end
			_4 : begin U = PS; INC = 0; end
			_5 : begin U = PS; INC = 0; end
			_6 : begin U = PS; INC = 0; end
		   _7 : begin U = PS; INC = 0; end
		   _8 : begin U = PS; INC = 0; end
		   _9 : begin U = PS; INC = 0; end
			i_0 : begin U = _0; INC = 1; end
			i_1 : begin U = _1; INC = 1; end
			default:
				begin
					U = 4'bx;
					INC = 1'b0;
				end
		endcase
		
	D_FF dff0(PS[0], NS[0], reset, Clock);
	D_FF dff1(PS[1], NS[1], reset, Clock);
	D_FF dff2(PS[2], NS[2], reset, Clock);
	D_FF dff3(PS[3], NS[3], reset, Clock);
	
endmodule 

module test_counter;
	reg clk, reset;
	reg [1:0] in;
	wire [3:0] u, t;
	wire inc;
	
	tens_count ct (u, t, in, clk, reset, inc);
	parameter cc = 10;
	
	always
		#cc clk = ~clk;
		
	always
		#(4*cc) in <= in + 1;
		
	initial
	begin
		reset = 1;
		clk = 0;
		in = 0;
		#cc reset = 0;
	end
	
endmodule 