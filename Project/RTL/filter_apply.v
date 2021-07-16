module filter_apply
#(
	parameter is_relu = 0
)

(
	input clk,
	input rst,
	input wire input_valid,
	output output_valid,
	input [31:0] data_in_0,
	input [31:0] data_in_1,
	input [31:0] data_in_2,
	input [31:0] data_in_3,
	input [31:0] data_in_4,
	input [31:0] data_in_5,
	input [31:0] data_in_6,
	input [31:0] data_in_7,
	input [31:0] data_in_8,
	// weight	
	input [31:0] w_in_0,
	input [31:0] w_in_1,
	input [31:0] w_in_2,
	input [31:0] w_in_3,
	input [31:0] w_in_4,
	input [31:0] w_in_5,
	input [31:0] w_in_6,
	input [31:0] w_in_7,
	input [31:0] w_in_8,
	output wire [31:0] data_out
);

	/*stage 1*/
	reg  [31:0] stage_1_input[0:8];
	wire [31:0] stage_1_mul_add[0:8];
	reg stage_1_input_valid;
	always @(negedge clk or negedge rst) begin
		if(rst) begin
			stage_1_input[0] <= 32'd0;
			stage_1_input[1] <= 32'd0;
			stage_1_input[2] <= 32'd0;
			stage_1_input[3] <= 32'd0;
			stage_1_input[4] <= 32'd0;
			stage_1_input[5] <= 32'd0;
			stage_1_input[6] <= 32'd0;
			stage_1_input[7] <= 32'd0;
			stage_1_input[8] <= 32'd0;
			stage_1_input_valid <= 1'b0;
		end else if(input_valid) begin
			stage_1_input[0] <= data_in_0;
			stage_1_input[1] <= data_in_1;
			stage_1_input[2] <= data_in_2;
			stage_1_input[3] <= data_in_3;
			stage_1_input[4] <= data_in_4;
			stage_1_input[5] <= data_in_5;
			stage_1_input[6] <= data_in_6;
			stage_1_input[7] <= data_in_7;
			stage_1_input[8] <= data_in_8;
			stage_1_input_valid <= 1'b1;
		end else begin
			stage_1_input[0] <= 32'd0;
			stage_1_input[1] <= 32'd0;
			stage_1_input[2] <= 32'd0;
			stage_1_input[3] <= 32'd0;
			stage_1_input[4] <= 32'd0;
			stage_1_input[5] <= 32'd0;
			stage_1_input[6] <= 32'd0;
			stage_1_input[7] <= 32'd0;
			stage_1_input[8] <= 32'd0;
			stage_1_input_valid <= 1'b0;
		end
	end
	fp_mul stage_1_mul_0(.A(stage_1_input[0]),    .B(w_in_0),    .OUT(stage_1_mul_add[0]));
	fp_mul stage_1_mul_1(.A(stage_1_input[1]),    .B(w_in_1),    .OUT(stage_1_mul_add[1]));
	fp_mul stage_1_mul_2(.A(stage_1_input[2]),    .B(w_in_2),    .OUT(stage_1_mul_add[2]));
	fp_mul stage_1_mul_3(.A(stage_1_input[3]),    .B(w_in_3),    .OUT(stage_1_mul_add[3]));
	fp_mul stage_1_mul_4(.A(stage_1_input[4]),    .B(w_in_4),    .OUT(stage_1_mul_add[4]));
	fp_mul stage_1_mul_5(.A(stage_1_input[5]),    .B(w_in_5),    .OUT(stage_1_mul_add[5]));
	fp_mul stage_1_mul_6(.A(stage_1_input[6]),    .B(w_in_6),    .OUT(stage_1_mul_add[6]));
	fp_mul stage_1_mul_7(.A(stage_1_input[7]),    .B(w_in_7),    .OUT(stage_1_mul_add[7]));
	fp_mul stage_1_mul_8(.A(stage_1_input[8]),    .B(w_in_8),    .OUT(stage_1_mul_add[8]));
	/*stage 2*/
	wire [31:0] sum_9_result;
	sum_9 #(is_relu) stage_2_sum(
		.clk(clk),
		.rst(rst),
		.input_valid(stage_1_input_valid),
		.output_valid(output_valid),
		.IN_1(stage_1_mul_add[0]),
		.IN_2(stage_1_mul_add[1]),
		.IN_3(stage_1_mul_add[2]),
		.IN_4(stage_1_mul_add[3]),
		.IN_5(stage_1_mul_add[4]),
		.IN_6(stage_1_mul_add[5]),
		.IN_7(stage_1_mul_add[6]),
		.IN_8(stage_1_mul_add[7]),
		.IN_9(stage_1_mul_add[8]),
		.result(data_out)
	);
endmodule
