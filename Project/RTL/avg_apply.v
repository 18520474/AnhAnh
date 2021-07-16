module avg_apply
(
	clk,
	rst,
	input_valid,
	output_valid,
	IN_1,
	IN_2,
	IN_3,
	IN_4,
	IN_5,
	IN_6,
	IN_7,
	IN_8,
	IN_9,
	result
);

	input [31:0] IN_1, IN_2, IN_3, IN_4, IN_5, IN_6, IN_7, IN_8, IN_9;
	input clk, rst;
	input input_valid;
	output output_valid;
	output [31:0]result;
	
	wire add_stage_output_valid;
	wire [31:0] add_stage_result;
	sum_9 add_stage(
		.clk(clk),
		.rst(rst),
		.input_valid(input_valid),
		.output_valid(add_stage_output_valid),
		.IN_1(IN_1),
		.IN_2(IN_2),
		.IN_3(IN_3),
		.IN_4(IN_4),
		.IN_5(IN_5),
		.IN_6(IN_6),
		.IN_7(IN_7),
		.IN_8(IN_8),
		.IN_9(IN_9),
		.result(add_stage_result)
	);
	//stage 2
	reg stage_2_input_valid;
	wire [31:0] stage_2_mul_result_bus;
	reg [31:0] stage_2_mul_result_reg;
	fp_mul mul_stage(
		.A(add_stage_result),     
		.B(32'b00111101111000111000111000111001), /*1/9*/     
		.OUT(stage_2_mul_result_bus)
	);
	always @( posedge clk or posedge rst) begin
		if(rst) begin
			stage_2_input_valid <= 1'b0;
			stage_2_mul_result_reg <= 32'd0;
		end else begin
			stage_2_input_valid <= add_stage_output_valid;
			stage_2_mul_result_reg <= stage_2_mul_result_bus;
		end
	end
	assign result = stage_2_mul_result_reg;
	assign output_valid = stage_2_input_valid;
endmodule
