module random_0(press, Clock, Reset);
	input Clock, Reset;
	//input [8:0] SW;
	output press;
	
	reg press;
	
	wire [8:0] rgen0;
	wire [8:0] rgen1;
	wire [9:0] sum;
	wire [9:0] carry;
	
	LFSR_9b lfsr1 (rgen0, Clock, Reset);
	LFSR_9b lfsr2 (rgen1, Clock, Reset);
	ten_bit_adder adder (carry, sum, rgen0, rgen1);
	
	always @(posedge Clock)
		if (carry[8] == 1'b1)
			begin
				press = 1'b1;
			end
		else
			begin
				press = 1'b0;
			end
endmodule 

module test_random;
	reg clok, reset;
	//reg [8:0] sw;
	wire pres;
	
	parameter cc = 10;
	
	random r (pres, clok, reset);
	
	always
		#cc clok = ~clok;
		
	initial
	begin
		reset = 1;
		clok = 0;
		#cc reset = 0;
		#(20*cc) reset = 0;
		#cc reset = 1;
		#(20*cc) reset = 0;
	end
endmodule 