module taylor(
	IN_X_INT,
	IN_X_FRAC,
	IN_A_FRAC,
	IN_A_INT,
	IN_EXP_INT,
	IN_EXP_FRAC,
	OUT_EXP_INT,
	OUT_EXP_FRAC
);
	parameter num_of_int = 32; /*weight of integer*/
	parameter num_of_frac = 23; /* num of frac must be 23*/
	input [num_of_int - 1:0] IN_X_INT, IN_A_INT, IN_EXP_INT;
	input [num_of_frac - 1:0] IN_X_FRAC, IN_A_FRAC, IN_EXP_FRAC;
	output [num_of_int - 1:0] OUT_EXP_INT;
	output [num_of_frac - 1:0] OUT_EXP_FRAC;
	wire [num_of_int - 1:0] add_1_int;
	wire [num_of_frac - 1:0] add_1_frac;
	wire [(num_of_int + num_of_frac)- 1:0] TMP_A;
	wire [(num_of_int + num_of_frac)- 1:0] A;
	assign TMP_A = {IN_A_INT, IN_A_FRAC};
	assign A = ~TMP_A + 1;
	fix_adder #(num_of_int,num_of_frac) add_1( 
		.IN_FRAC_1(IN_X_FRAC),
	   .IN_INT_1(IN_X_INT),
		.IN_FRAC_2(A[(num_of_frac- 1)-:num_of_frac]),
		.IN_INT_2(A[((num_of_int + num_of_frac)- 1)-:num_of_int]),
		.OUT_FRAC(add_1_frac),
		.OUT_INT(add_1_int)

	);
	wire [num_of_int - 1:0] mul_1_int;
	wire [num_of_frac - 1:0] mul_1_frac;
	fix_multiplier #(num_of_int,num_of_frac) mul_1( 
		.IN_FRAC_1(23'b00000000010110110000010), /*1/720*/
		.IN_INT_1(3'd0), 
		.IN_FRAC_2(add_1_frac),
		.IN_INT_2(add_1_int),
		.OUT_FRAC(mul_1_frac),
		.OUT_INT(mul_1_int)

	);
	wire [num_of_int - 1:0] add_2_int;
	wire [num_of_frac - 1:0] add_2_frac;
	fix_adder #(num_of_int,num_of_frac) add_2( 
		.IN_FRAC_1(23'b00000010001000100010001/*1/120*/),
	   .IN_INT_1(3'd0/*1/120*/),
		.IN_FRAC_2(mul_1_frac),
		.IN_INT_2(mul_1_int),
		.OUT_FRAC(add_2_frac),
		.OUT_INT(add_2_int)

	);	
	wire [num_of_int - 1:0] mul_2_int;
	wire [num_of_frac - 1:0] mul_2_frac;
	fix_multiplier #(num_of_int,num_of_frac) mul_2( 
		.IN_FRAC_1(add_2_frac),
		.IN_INT_1(add_2_int), 
		.IN_FRAC_2(add_1_frac),
		.IN_INT_2(add_1_int),
		.OUT_FRAC(mul_2_frac),
		.OUT_INT(mul_2_int)

	);	
	wire [num_of_int - 1:0] add_3_int;
	wire [num_of_frac - 1:0] add_3_frac;
	fix_adder #(num_of_int,num_of_frac) add_3( 
		.IN_FRAC_1(23'b00001010101010101010101/*1/24*/),
	   .IN_INT_1(3'd0/*1/24*/),
		.IN_FRAC_2(mul_2_frac),
		.IN_INT_2(mul_2_int),
		.OUT_FRAC(add_3_frac),
		.OUT_INT(add_3_int)

	);	
	wire [num_of_int - 1:0] mul_3_int;
	wire [num_of_frac - 1:0] mul_3_frac;
	fix_multiplier #(num_of_int,num_of_frac) mul_3( 
		.IN_FRAC_1(add_3_frac),
		.IN_INT_1(add_3_int), 
		.IN_FRAC_2(add_1_frac),
		.IN_INT_2(add_1_int),
		.OUT_FRAC(mul_3_frac),
		.OUT_INT(mul_3_int)

	);	
	wire [num_of_int - 1:0] add_4_int;
	wire [num_of_frac - 1:0] add_4_frac;
	fix_adder #(num_of_int,num_of_frac) add_4( 
		.IN_FRAC_1(23'b00101010101010101010101/*1/6*/),
	   .IN_INT_1(3'd0/*1/6*/),
		.IN_FRAC_2(mul_3_frac),
		.IN_INT_2(mul_3_int),
		.OUT_FRAC(add_4_frac),
		.OUT_INT(add_4_int)

	);	
	wire [num_of_int - 1:0] mul_4_int;
	wire [num_of_frac - 1:0] mul_4_frac;
	fix_multiplier #(num_of_int,num_of_frac) mul_4( 
		.IN_FRAC_1(add_4_frac),
		.IN_INT_1(add_4_int), 
		.IN_FRAC_2(add_1_frac),
		.IN_INT_2(add_1_int),
		.OUT_FRAC(mul_4_frac),
		.OUT_INT(mul_4_int)

	);
	
	wire [num_of_int - 1:0] add_5_int;
	wire [num_of_frac - 1:0] add_5_frac;
	fix_adder #(num_of_int,num_of_frac) add_5( 
		.IN_FRAC_1(23'b10000000000000000000000/*1/2*/),
	   .IN_INT_1(3'd0/*1/2*/),
		.IN_FRAC_2(mul_4_frac),
		.IN_INT_2(mul_4_int),
		.OUT_FRAC(add_5_frac),
		.OUT_INT(add_5_int)

	);
	
	wire [num_of_int - 1:0] mul_5_int;
	wire [num_of_frac - 1:0] mul_5_frac;
	fix_multiplier #(num_of_int,num_of_frac) mul_5( 
		.IN_FRAC_1(add_5_frac),
		.IN_INT_1(add_5_int), 
		.IN_FRAC_2(add_1_frac),
		.IN_INT_2(add_1_int),
		.OUT_FRAC(mul_5_frac),
		.OUT_INT(mul_5_int)

	);
	
	wire [num_of_int - 1:0] add_6_int;
	wire [num_of_frac - 1:0] add_6_frac;
	fix_adder #(num_of_int,num_of_frac) add_6( 
		.IN_FRAC_1(23'd0/*1*/),
	   .IN_INT_1(3'd1/*1*/),
		.IN_FRAC_2(mul_5_frac),
		.IN_INT_2(mul_5_int),
		.OUT_FRAC(add_6_frac),
		.OUT_INT(add_6_int)

	);
	
	wire [num_of_int - 1:0] mul_6_int;
	wire [num_of_frac - 1:0] mul_6_frac;
	fix_multiplier #(num_of_int,num_of_frac) mul_6( 
		.IN_FRAC_1(add_6_frac),
		.IN_INT_1(add_6_int), 
		.IN_FRAC_2(add_1_frac),
		.IN_INT_2(add_1_int),
		.OUT_FRAC(mul_6_frac),
		.OUT_INT(mul_6_int)

	);
	
	wire [num_of_int - 1:0] add_7_int;
	wire [num_of_frac - 1:0] add_7_frac;
	fix_adder #(num_of_int,num_of_frac) add_7( 
		.IN_FRAC_1(23'd0/*1*/),
	   .IN_INT_1(3'd1/*1*/),
		.IN_FRAC_2(mul_6_frac),
		.IN_INT_2(mul_6_int),
		.OUT_FRAC(add_7_frac),
		.OUT_INT(add_7_int)

	);
	fix_multiplier #(num_of_int,num_of_frac) mul_7( 
		.IN_FRAC_1(add_7_frac),
		.IN_INT_1(add_7_int), 
		.IN_FRAC_2(IN_EXP_FRAC),
		.IN_INT_2(IN_EXP_INT),
		.OUT_FRAC(OUT_EXP_FRAC),
		.OUT_INT(OUT_EXP_INT)
	);
endmodule

	
	
	
	
	
	