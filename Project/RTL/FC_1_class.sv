module FC_1_class
#(
	parameter weight_path = "0.txt"
)
(
	input clk,
	input rst,
	input load,
    input  wire input_valid,
    output wire output_valid,
	input  wire [31:0] d_in[15:0],
	output wire [31:0] d_out
);
	reg [31:0] stage_0_d_in[15:0];
	reg stage_0_output_valid;

	always @ (posedge clk or posedge rst) begin
		if(rst) begin
			stage_0_d_in[0] <= 32'd0;
			stage_0_d_in[1] <= 32'd0;
			stage_0_d_in[2] <= 32'd0;
			stage_0_d_in[3] <= 32'd0;
			stage_0_d_in[4] <= 32'd0;
			stage_0_d_in[5] <= 32'd0;
			stage_0_d_in[6] <= 32'd0;
			stage_0_d_in[7] <= 32'd0;
			stage_0_d_in[8] <= 32'd0;
			stage_0_d_in[9] <= 32'd0;
			stage_0_d_in[10] <= 32'd0;
			stage_0_d_in[11] <= 32'd0;
			stage_0_d_in[12] <= 32'd0;
			stage_0_d_in[13] <= 32'd0;
			stage_0_d_in[14] <= 32'd0;
			stage_0_d_in[15] <= 32'd0;
			stage_0_output_valid <= 1'b0;
		end else if(input_valid) begin
			stage_0_d_in[0] <= d_in[0];
			stage_0_d_in[1] <= d_in[1];
			stage_0_d_in[2] <= d_in[2];
			stage_0_d_in[3] <= d_in[3];
			stage_0_d_in[4] <= d_in[4];
			stage_0_d_in[5] <= d_in[5];
			stage_0_d_in[6] <= d_in[6];
			stage_0_d_in[7] <= d_in[7];
			stage_0_d_in[8] <= d_in[8];
			stage_0_d_in[9] <= d_in[9];
			stage_0_d_in[10] <= d_in[10];
			stage_0_d_in[11] <= d_in[11];
			stage_0_d_in[12] <= d_in[12];
			stage_0_d_in[13] <= d_in[13];
			stage_0_d_in[14] <= d_in[14];
			stage_0_d_in[15] <= d_in[15];
			stage_0_output_valid <= 1'b1;
		end else begin
			stage_0_output_valid <= 1'b0;
		end
	end
	wire fc_output_valid;
	wire [31:0] fc_out[15:0];
	wire [31:0] fc_weight_in[15:0];
	load_weight_fc #(weight_path) my_weight(
		.clk(clk),
		.rst(rst),
		.load(load),
		.w_0(fc_weight_in[0]),
		.w_1(fc_weight_in[1]),
		.w_2(fc_weight_in[2]),
		.w_3(fc_weight_in[3]),
		.w_4(fc_weight_in[4]),
		.w_5(fc_weight_in[5]),
		.w_6(fc_weight_in[6]),
		.w_7(fc_weight_in[7]),
		.w_8(fc_weight_in[8]),
		.w_9(fc_weight_in[9]),
		.w_10(fc_weight_in[10]),
		.w_11(fc_weight_in[11]),
		.w_12(fc_weight_in[12]),
		.w_13(fc_weight_in[13]),
		.w_14(fc_weight_in[14]),
		.w_15(fc_weight_in[15])
	);
	wire [31:0] stage_0_mul_output[15:0];
	fp_mul stage_1_mul_0(.A(stage_0_d_in[0]),    .B(fc_weight_in[0]),    .OUT(stage_0_mul_output[0]));
	fp_mul stage_1_mul_1(.A(stage_0_d_in[1]),    .B(fc_weight_in[1]),    .OUT(stage_0_mul_output[1]));
	fp_mul stage_1_mul_2(.A(stage_0_d_in[2]),    .B(fc_weight_in[2]),    .OUT(stage_0_mul_output[2]));
	fp_mul stage_1_mul_3(.A(stage_0_d_in[3]),    .B(fc_weight_in[3]),    .OUT(stage_0_mul_output[3]));
	fp_mul stage_1_mul_4(.A(stage_0_d_in[4]),    .B(fc_weight_in[4]),    .OUT(stage_0_mul_output[4]));
	fp_mul stage_1_mul_5(.A(stage_0_d_in[5]),    .B(fc_weight_in[5]),    .OUT(stage_0_mul_output[5]));
	fp_mul stage_1_mul_6(.A(stage_0_d_in[6]),    .B(fc_weight_in[6]),    .OUT(stage_0_mul_output[6]));
	fp_mul stage_1_mul_7(.A(stage_0_d_in[7]),    .B(fc_weight_in[7]),    .OUT(stage_0_mul_output[7]));
	fp_mul stage_1_mul_8(.A(stage_0_d_in[8]),    .B(fc_weight_in[8]),    .OUT(stage_0_mul_output[8]));
	fp_mul stage_1_mul_9(.A(stage_0_d_in[9]),    .B(fc_weight_in[9]),    .OUT(stage_0_mul_output[9]));
	fp_mul stage_1_mul_10(.A(stage_0_d_in[10]),    .B(fc_weight_in[10]),    .OUT(stage_0_mul_output[10]));
	fp_mul stage_1_mul_11(.A(stage_0_d_in[11]),    .B(fc_weight_in[11]),    .OUT(stage_0_mul_output[11]));
	fp_mul stage_1_mul_12(.A(stage_0_d_in[12]),    .B(fc_weight_in[12]),    .OUT(stage_0_mul_output[12]));
	fp_mul stage_1_mul_13(.A(stage_0_d_in[13]),    .B(fc_weight_in[13]),    .OUT(stage_0_mul_output[13]));
	fp_mul stage_1_mul_14(.A(stage_0_d_in[14]),    .B(fc_weight_in[14]),    .OUT(stage_0_mul_output[14]));
	fp_mul stage_1_mul_15(.A(stage_0_d_in[15]),    .B(fc_weight_in[15]),    .OUT(stage_0_mul_output[15]));
	sum_16 #(69) sum_0( 
        .clk(clk), 
        .rst(rst), 
        .input_valid(stage_0_output_valid), 
        .output_valid(output_valid), 
        .data_out(d_out), 
        .data_in_0(stage_0_mul_output[0]), 
        .data_in_1(stage_0_mul_output[1]), 
        .data_in_2(stage_0_mul_output[2]), 
        .data_in_3(stage_0_mul_output[3]), 
        .data_in_4(stage_0_mul_output[4]), 
        .data_in_5(stage_0_mul_output[5]), 
        .data_in_6(stage_0_mul_output[6]), 
        .data_in_7(stage_0_mul_output[7]), 
        .data_in_8(stage_0_mul_output[8]), 
        .data_in_9(stage_0_mul_output[9]), 
        .data_in_10(stage_0_mul_output[10]), 
        .data_in_11(stage_0_mul_output[11]), 
        .data_in_12(stage_0_mul_output[12]), 
        .data_in_13(stage_0_mul_output[13]), 
        .data_in_14(stage_0_mul_output[14]), 
        .data_in_15(stage_0_mul_output[15]) 
	);
endmodule