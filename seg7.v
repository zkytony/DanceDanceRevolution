module seg7(hex, leds);
	input [3:0] hex;
	output reg [7:1] leds;
	
	always @(hex)
		case(hex) //abcdefg
			0: leds=7'b1000000;
			1: leds=7'b1111001;
			2: leds=7'b0100100;
			3: leds=7'b0110000;
			4: leds=7'b0011001;
			5: leds=7'b0010010;
			6: leds=7'b0000010;
			7: leds=7'b1111000;
			8: leds=7'b0000000;
			9: leds=7'b0010000;
			default: leds=7'b0001001;
		endcase

endmodule 