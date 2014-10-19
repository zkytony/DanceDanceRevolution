module decoder3to8 (C, D);
	input [2:0] C;
	output [7:0] D;
	
	reg [7:0] D;
	
	always @(C)
		begin
			case (C)
				3'd0: D = 8'b11111110;
				3'd1: D = 8'b11111101;
				3'd2: D = 8'b11111011;
				3'd3: D = 8'b11110111;
				3'd4: D = 8'b11101111;
				3'd5: D = 8'b11011111; //disabled
				3'd6: D = 8'b10111111; //disabled
				3'd7: D = 8'b01111111; //disabled
				default:;
			endcase
		end
endmodule

module test_decoder;
	reg clk, reset;
	reg [2:0] ct;
	
	wire [7:0] d;
	
	decoder3to8 dec (ct, d);
	
	parameter cc = 10;
	
	always
		#cc clk = ~clk;
		
	always
		#(5*cc) ct = ct + 1;
		
	initial
	begin
		reset = 1;
		ct = 3'b000;
		clk = 0;
		#cc reset = 0;
	end
endmodule
