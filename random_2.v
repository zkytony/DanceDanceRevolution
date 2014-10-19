module random_2(press, Clock, Reset); //7 lfsr
	input Clock, Reset;
	//input [6:0] SW;
	output press;
	
	reg press;
	
	wire [6:0] rgen0;
	wire [6:0] rgen1;
	wire [7:0] sum;
	wire [7:0] carry;
	
	LFSR_7b lfsr1 (rgen0, Clock, Reset);
	LFSR_7b lfsr2 (rgen1, Clock, Reset);
	ten_bit_adder adder (carry, sum, rgen0, rgen1);
	
	always @(posedge Clock)
		if (carry[6] == 1'b1)
			begin
				press = 1'b1;
			end
		else
			begin
				press = 1'b0;
			end
endmodule