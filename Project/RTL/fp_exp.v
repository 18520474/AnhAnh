module fp_exp(
	IN_FLOAT32,
	OUT_FLOAT32
);
	parameter num_of_frac = 23;

	input [31:0] IN_FLOAT32;
	output [31:0] OUT_FLOAT32;// D_FLOAT32, D_FLOAT32_TAYLOR;
	
	wire [num_of_frac - 1:0] LUT_89_88_OUT_X_FRAC;
	wire [31:0] OUT_FLOAT32_LUT;
	LUT_89_88 my_LUT_89_88( 
		.IN_FLOAT32(IN_FLOAT32), /*IEEE FP32 input*/
		.OUT_FLOAT32(OUT_FLOAT32_LUT),
		.OUT_X_FRAC(LUT_89_88_OUT_X_FRAC)
	);
	//assign D_FLOAT32 = OUT_FLOAT32_LUT;
	
	wire [31:0] OUT_FLOAT32_TAYLOR;
	LUT_TAYLOR my_LUT_TAYLOR(
		.IN_X_FRAC(LUT_89_88_OUT_X_FRAC), /*fixed point fraction input*/
		.OUT_FLOAT32(OUT_FLOAT32_TAYLOR) 
	);
	//assign D_FLOAT32_TAYLOR = OUT_FLOAT32_TAYLOR;
	wire [31:0] exp_output;
	fp_mul my_FP_MUL(
		.A(OUT_FLOAT32_TAYLOR),
		.B(OUT_FLOAT32_LUT),
		.OUT(exp_output)
	);
	assign OUT_FLOAT32 = ($signed(IN_FLOAT32) > $signed(32'b01000010101100000000000000000000)/*88*/)   ? 32'b01111111100000000000000000000000 :
								($signed({1'b0, IN_FLOAT32[30:0]}) > $signed(32'b01000010110011000000000000000000)/*102*/) && IN_FLOAT32[31] ? 32'd0 : exp_output;
endmodule

