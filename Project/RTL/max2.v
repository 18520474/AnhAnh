module max2
(
	input [31:0] d_in_0,
	input [31:0] d_in_1,
	output [31:0] d_out
);
	
	assign d_out = ($signed(d_in_0) > $signed(d_in_1) ? (d_in_0) : (d_in_1));
endmodule
