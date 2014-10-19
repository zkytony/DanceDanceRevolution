module random_3(press, Clock, Reset); //13 lfsr
	input Clock, Reset;
	//input [9:0] SW;
	output press;
	
	reg press;
	
	wire [9:0] rgen0;
	wire [9:0] rgen1;
	wire [10:0] sum;
	wire [10:0] carry;
	
	LFSR_10b lfsr1 (rgen0, Clock, Reset);
	LFSR_10b lfsr2 (rgen1, Clock, Reset);
	ten_bit_adder adder (carry, sum, rgen0, rgen1);
	
	always @(posedge Clock)
		if (carry[9] == 1'b1)
			begin
				press = 1'b1;
			end
		else
			begin
				press = 1'b0;
			end
endmodule