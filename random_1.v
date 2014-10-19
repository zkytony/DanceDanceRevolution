module random_1(press, Clock, Reset); //8 lfsr
	input Clock, Reset;
	//input [12:0] SW;
	output press;
	
	reg press;
	
	wire [7:0] rgen0;
	wire [7:0] rgen1;
	wire [8:0] sum;
	wire [8:0] carry;
	
	LFSR_8b lfsr1 (rgen0, Clock, Reset);
	LFSR_8b lfsr2 (rgen1, Clock, Reset);
	ten_bit_adder adder (carry, sum, rgen0, rgen1);
	
	always @(posedge Clock)
		if (carry[7] == 1'b1)
			begin
				press = 1'b1;
			end
		else
			begin
				press = 1'b0;
			end
endmodule