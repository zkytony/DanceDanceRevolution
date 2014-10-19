module bank(Clock, Reset, KEY, LED, Ren, pt);
	input Clock, Reset, KEY, Ren;
	output [4:0] LED;
	//output [6:0] hex0, hex1;
	output signed [3:0] pt;
	
	wire [3:0] pt_code0, pt_code1, pt_code2, pt_code3, pt_code4;
	
	score sc (pt, pt_code0, pt_code1, pt_code2, pt_code3, pt_code4);
	
	wire [2:0] top_code;
	encode_top et (LED, top_code);
	
	//L0(Clock, Reset, BL, KEY, TOP_POS, lighton, pt);
	L0 light_0 (Clock, Reset, Ren, ~KEY, top_code, LED[0], pt_code0);
	L1 light_1 (Clock, Reset, LED[0], ~KEY, top_code, LED[1], pt_code1);
	L2 light_2 (Clock, Reset, LED[1], ~KEY, top_code, LED[2], pt_code2);
	L3 light_3 (Clock, Reset, LED[2], ~KEY, top_code, LED[3], pt_code3);
	L4 light_4 (Clock, Reset, LED[3], ~KEY, top_code, LED[4], pt_code4);
	
	
endmodule 

module test_bank;
	reg clk, Reset, KEY;
	reg Ren;
	reg [4:0] clk_SPD;
	wire [4:0] LED;
	wire [2:0] top_code;
	
	//bank_0(CLOCK_50, Reset, KEY, clk_SPD, LED, top_code);
	bank_0 bk (clk, Reset, KEY, clk_SPD, LED, top_code);
	
	parameter cc = 10;
	
	always
		#cc clk = ~clk;
		
	always
		#(5*cc) KEY = ~KEY;
		
	always
		#(7*cc) Ren = ~Ren;
		
	initial
	begin
		Reset = 1;
		clk = 0;
		KEY = 0;
		Ren = 0;
		#cc Reset = 0;
	end
	
endmodule 