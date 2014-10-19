module score(select, pt_0, pt_1, pt_2, pt_3, pt_4);
	input [3:0] pt_0, pt_1, pt_2, pt_3, pt_4;
	
	output [3:0] select;
	or (select[0], pt_0[0], pt_1[0], pt_2[0], pt_3[0], pt_4[0]);
	or (select[1], pt_0[1], pt_1[1], pt_2[1], pt_3[1], pt_4[1]);
	or (select[2], pt_0[2], pt_1[2], pt_2[2], pt_3[2], pt_4[2]);
	or (select[3], pt_0[3], pt_1[3], pt_2[3], pt_3[3], pt_4[3]);
	
endmodule 