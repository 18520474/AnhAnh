module sum_9
#(
	parameter is_relu = 0
)
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
	output reg output_valid;
	output reg [31:0] result;
	/*-------------stage 0-------------*/
	reg [31:0] stage_0_din[0:8];
	reg stage_0_output_valid;
	always @(posedge clk or posedge rst) begin
		if(rst) begin
			stage_0_din[0] <= 32'd0;
			stage_0_din[1] <= 32'd0;
			stage_0_din[2] <= 32'd0;
			stage_0_din[3] <= 32'd0;
			stage_0_din[4] <= 32'd0;
			stage_0_din[5] <= 32'd0;
			stage_0_din[6] <= 32'd0;
			stage_0_din[7] <= 32'd0;
			stage_0_din[8] <= 32'd0;
			stage_0_output_valid <= 1'b0;
		end else begin
			if(input_valid) begin
				stage_0_din[0] <= IN_1;
				stage_0_din[1] <= IN_2;
				stage_0_din[2] <= IN_3;
				stage_0_din[3] <= IN_4;
				stage_0_din[4] <= IN_5;
				stage_0_din[5] <= IN_6;
				stage_0_din[6] <= IN_7;
				stage_0_din[7] <= IN_8;
				stage_0_din[8] <= IN_9;
				stage_0_output_valid <= 1'b1;
			end else begin
				stage_0_din[0] <= stage_0_din[0];
				stage_0_din[1] <= stage_0_din[1];
				stage_0_din[2] <= stage_0_din[2];
				stage_0_din[3] <= stage_0_din[3];
				stage_0_din[4] <= stage_0_din[4];
				stage_0_din[5] <= stage_0_din[5];
				stage_0_din[6] <= stage_0_din[6];
				stage_0_din[7] <= stage_0_din[7];
				stage_0_din[8] <= stage_0_din[8];
				stage_0_output_valid <= 1'b0;
			end
		end
	end

	wire [31:0] stage_1_add[0:3];
	fp_adder stage_1_add_0(.a_operand(stage_0_din[0]), .b_operand(stage_0_din[1]), .AddBar_Sub(1'b0) , .result(stage_1_add[0]));
	fp_adder stage_1_add_1(.a_operand(stage_0_din[2]), .b_operand(stage_0_din[3]), .AddBar_Sub(1'b0) , .result(stage_1_add[1]));
	fp_adder stage_1_add_2(.a_operand(stage_0_din[4]), .b_operand(stage_0_din[5]), .AddBar_Sub(1'b0) , .result(stage_1_add[2]));
	fp_adder stage_1_add_3(.a_operand(stage_0_din[6]), .b_operand(stage_0_din[7]), .AddBar_Sub(1'b0) , .result(stage_1_add[3]));
	wire [31:0] stage_2_add[0:1];
	wire [31:0] stage_3_add;
	fp_adder stage_2_add_0(.a_operand(stage_1_add[0]), .b_operand(stage_1_add[1]), .AddBar_Sub(1'b0) , .result(stage_2_add[0]));
	fp_adder stage_2_add_1(.a_operand(stage_1_add[2]), .b_operand(stage_1_add[3]), .AddBar_Sub(1'b0) , .result(stage_2_add[1]));
	fp_adder stage_2_add_2(.a_operand(stage_2_add[0]), .b_operand(stage_2_add[1]), .AddBar_Sub(1'b0) , .result(stage_3_add));
	wire [31:0] stage_4_add;
	fp_adder stage_3_add_0(.a_operand(stage_3_add), .b_operand(stage_0_din[8]), .AddBar_Sub(1'b0) , .result(stage_4_add));

	always @(posedge clk or posedge rst) begin
		if(rst) begin
			result <= 32'd0;
			output_valid <= 1'b0;
		end else begin
			if(stage_0_output_valid) begin
				if(is_relu == 1'b1) begin
					result <= (stage_4_add[31]) ? 32'd0 : stage_4_add;
					output_valid <= 1'b1;
				end else begin
					result <= stage_4_add;
					output_valid <= 1'b1;
				end
			end else begin
				output_valid <= 1'b0;
			end
		end
	end
endmodule
	
