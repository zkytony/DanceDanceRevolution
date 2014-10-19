module L3(Clock, Reset, BL, KEY, TOP_POS, lighton, pt);
	input Clock, Reset, BL, KEY;
	input [2:0] TOP_POS;  //position of the top light
	output lighton; // whether this light should lit
	output signed [3:0] pt; // the points

	wire [1:0] PS;
	reg [1:0] NS;
	
	reg lighton;
	reg [3:0] pt;
	
	parameter [1:0] OFF = 2'b00, ON = 2'b01, PRESS = 2'b10;
	parameter [2:0] no_light_on = 3'b000, _0 = 3'b001, _1 = 3'b010, _2 = 3'b011, _3 = 3'b100, _4 = 3'b101;
	parameter signed [3:0] no_point = 4'b0000, plus_one = 4'b0001, plus_two = 4'b0010, neg_two = 4'b1110;
	
	always @(BL or KEY or TOP_POS or PS)
		case (PS)
			OFF:
				if (BL == 1'b1 && (KEY == 1'b0 || !(TOP_POS == _2))) NS = ON; // when the bottom light is on
																						// and when the key is not pressed or the bottom light		
																						// is not the top light, this light is ON (bubble up)
				else if (BL == 1'b1 && (KEY == 1'b1 && (TOP_POS == _2))) NS = PRESS;
																						// when the bottom light is on
																						// and when the key is pressed AND the bottom light		
																						// is the top light, this light is ON (got one off)
				else NS = OFF; //nothing qualified for change;
			
			ON:
				if (BL == 1'b1 && (KEY == 1'b0 || !(TOP_POS == _2))) NS = ON; // when the bottom light is on
																						// and when the key is not pressed or the bottom light		
																						// is not the top light, this light is ON (bubble up)
				else if (BL == 1'b1 && (KEY == 1'b1 && (TOP_POS == _2))) NS = PRESS;
																						// when the bottom light is on
																						// and when the key is pressed AND the bottom light		
																						// is the top light, this light is ON (got one off)
				else NS = OFF;
			
			PRESS:
				NS = OFF; // always go back to off (impossible to stay or go to ON)
				
			default:
				NS = 2'bxx;
		endcase 
	
	always @(PS)
		case (PS)
			OFF:
				begin
					lighton = 1'b0;
					pt = no_point;
				end
			ON:
				begin
					lighton = 1'b1;
					pt = no_point;
				end
			PRESS:
				begin
					lighton = 1'b0;
					pt = plus_two;
				end
			default:
				begin
					lighton = 1'bx;
					pt = 2'bxx;
				end
		endcase
	
	D_FF dff0 (PS[0], NS[0], Reset, Clock);
	D_FF dff1 (PS[1], NS[1], Reset, Clock);
endmodule

module test_L3;
	reg clk, reset, bl, key;
	reg [2:0] top_pos;
	
	wire lit;
	wire [1:0] pt;
	
	parameter cc = 10;
	
	//L0(Clock, Reset, BL, KEY, TOP_POS, lighton, pt);
	L3 L (clk, reset, bl, key, top_pos, lit, pt);
	
	always
		#cc clk = ~clk;
		
	always
		#(2*cc) top_pos = top_pos + 1;
		
	always
		#(5*cc) bl = ~bl;
	
	always
		#(5*cc) key = ~key;
		
	initial
	begin
		reset = 1;
		clk = 0;
		top_pos = 3'b000;
		bl = 0;
		key = 0;
		#cc reset = 0;
		//#(cc) reset = 0;
		//#cc key = 1;
		//#cc bl = 1;
	end
endmodule 