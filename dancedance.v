module dancedance(CLOCK_50, Reset, clk_SPD, KEY, Row, Col_R, Col_G, hex1, hex0, hex3, hex2);
	
	input CLOCK_50, Reset;
	input [4:0] clk_SPD;
	input [3:0] KEY;
	
	output [7:0] Row;
	output [3:0] Col_R, Col_G; // green red each one has a Col output
	output [6:0] hex0, hex1, hex3, hex2;
	
	wire [31:0] clk;
	clock_divider divider (CLOCK_50, clk);
	
	parameter counterClock = 10;
	wire [4:0] whichClock;
	assign whichClock = ~clk_SPD;
	
	// the four banks of lights
	wire [4:0] LED_b0, LED_b1, LED_b2, LED_b3;
	
	// randoms
	wire Ren0, Ren1, Ren2, Ren3;
	random_0 r0 (Ren0, clk[whichClock], Reset);
	random_1 r1 (Ren1, clk[whichClock], Reset);
	random_2 r2 (Ren2, clk[whichClock], Reset);
	random_3 r3 (Ren3, clk[whichClock], Reset);
	
	wire [3:0] pt_0, pt_1, pt_2, pt_3;
	
	//bank(Clock, Reset, KEY, LED);
	bank b0 (clk[whichClock], Reset, KEY[0], LED_b0, Ren0, pt_0); //right most bank;
	bank b1 (clk[whichClock], Reset, KEY[1], LED_b1, Ren1, pt_1); //right-mid bank;
	bank b2 (clk[whichClock], Reset, KEY[2], LED_b2, Ren2, pt_2); //left-mid bank;
	bank b3 (clk[whichClock], Reset, KEY[3], LED_b3, Ren3, pt_3); //left most bank;
	
	score_keep sk (clk[whichClock], Reset, pt_0, pt_1, pt_2, pt_3, hex1, hex0, hex3, hex2);
	
	wire [2:0] c_num;
	counter_3b ct (c_num, clk[counterClock], Reset);
	
	decoder3to8 decoder (c_num, Row); // decode the counted value to the row drivers;
												 // however, for this project, only five rows are used;
	
	//mux8to1 (D0, D1, D2, D3, D4, D5, D6, D7, S, out);
	mux8to1 col_0_red (LED_b0[4], 0, LED_b0[2], LED_b0[1], LED_b0[0], 0, 0, 0, c_num, Col_R[0]); // right most column led[3] is green!
	mux8to1 col_0_green (0, LED_b0[3], 0, 0, 0, 0, 0, 0, c_num, Col_G[0]); // right most column
	
	mux8to1 col_1_red (LED_b1[4], 0, LED_b1[2], LED_b1[1], LED_b1[0], 0, 0, 0, c_num, Col_R[1]); // right-mid column
	mux8to1 col_1_green (0, LED_b1[3], 0, 0, 0, 0, 0, 0, c_num, Col_G[1]); // right-mid column
	
	mux8to1 col_2_red (LED_b2[4], 0, LED_b2[2], LED_b2[1], LED_b2[0], 0, 0, 0, c_num, Col_R[2]); // left-mid column
	mux8to1 col_2_green (0, LED_b2[3], 0, 0, 0, 0, 0, 0, c_num, Col_G[2]); // left-mid column

	mux8to1 col_3_red (LED_b3[4], 0, LED_b3[2], LED_b3[1], LED_b3[0], 0, 0, 0, c_num, Col_R[3]); // left most column
	mux8to1 col_3_green (0, LED_b3[3], 0, 0, 0, 0, 0, 0, c_num, Col_G[3]); // left most column
	
	
endmodule
