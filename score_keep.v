module score_keep(Clock, Reset, pt_0, pt_1, pt_2, pt_3, hex1, hex0, hex3, hex2);
	input Clock, Reset;
	input signed [3:0] pt_0, pt_1, pt_2, pt_3;
	output [6:0] hex1, hex0, hex3, hex2;
	
	wire signed [6:0] count;
	wire signed [6:0] maxcount;
	score_counter sc (Clock, Reset, pt_0, pt_1, pt_2, pt_3, count, maxcount);
	//wire [6:0] maxcount;
	
	display(count, maxcount, hex1, hex0, hex3, hex2);
	
	
	
endmodule 

module display (count, maxcount, hex1, hex0, hex3, hex2);
	input [6:0] count, maxcount;
	output [6:0] hex1, hex0, hex3, hex2;
	
	wire [4:0] unit, unit_m;
	wire [4:0] tens, tens_m;
	
	assign unit = count % 10;
	assign tens = count / 10;
	
	assign unit_m = maxcount % 10;
	assign tens_m = maxcount / 10;
	
	seg7 ud (unit, hex0);
	seg7 td (tens, hex1);
	seg7 umd (unit_m, hex2);
	seg7 tmd (tens_m, hex3);
	

endmodule 

module score_counter(Clock, Reset, pt_0, pt_1, pt_2, pt_3, count, maxcount);
	input Clock, Reset;
	//input signed [3:0] sum;
	input [3:0] pt_0, pt_1, pt_2, pt_3;
	parameter signed [3:0] no_point = 4'b0000, plus_one = 4'b0001, plus_two = 4'b0010, neg_two = 4'b1110;
	//input zero, negative, carry, overflow;
	
	output signed [6:0] count, maxcount;
	reg signed [6:0] count, maxcount;
	
	always @(posedge Clock or posedge Reset)
		if (Reset) begin
			count <= 7'b0;
			maxcount <= 7'b0;
		end else begin
			if (maxcount < count) begin
				maxcount <= count;
			end
			if (pt_0 == neg_two) begin
				if (count < 2) begin
					count <= 7'b0;
				end else begin
					count <= count - 2;
				end
			end else begin
				count <= count + pt_0;
				if (count > 7'b100010) begin
					count <= 7'b0;
				end
			end
			
			if (pt_1 == neg_two) begin
				if (count < 2) begin
					count <= 7'b0;
				end else begin
					count <= count - 2;
				end
			end else begin
				count <= count + pt_1;
				if (count > 7'b100010) begin
					count <= 7'b0;
				end
			end
			
			if (pt_2 == neg_two) begin
				if (count < 2) begin
					count <= 7'b0;
				end else begin
					count <= count - 2;
				end
			end else begin
				count <= count + pt_2;
				if (count > 7'b100010) begin
					count <= 7'b0;
				end
			end
			
			if (pt_3 == neg_two) begin
				if (count < 2) begin
					count <= 7'b0;
				end else begin
					count <= count - 2;
				end
			end else begin
				count <= count + pt_3;
				if (count > 7'b100010) begin
					count <= 7'b0;
				end
			end
		end
endmodule

module test_score_counter;
	reg clk, reset;
	reg [4:0] sum;
	
	wire [6:0] count;
	
	parameter cc = 10;
	
	//L0(Clock, Reset, BL, KEY, TOP_POS, lighton, pt);
	score_counter sc (clk, reset, sum, count);
	
	always
		#cc clk = ~clk;
		
	always
		#(3*cc) sum = sum + 1;

	initial
	begin
		reset = 1;
		clk = 0;
		sum = 5'b00000;
		#cc reset = 0;
	end

endmodule 