module max10
(
	input  clk,
	input  rst,
	input  input_valid,
	output reg   output_valid,
	input [31:0] d_in_0,
	input [31:0] d_in_1,
	input [31:0] d_in_2,
	input [31:0] d_in_3,
	input [31:0] d_in_4,
	input [31:0] d_in_5,
	input [31:0] d_in_6,
	input [31:0] d_in_7,
	input [31:0] d_in_8,
	input [31:0] d_in_9,
	output reg [31:0] d_out
);
	reg [31:0] stage_1_d_in_0, stage_1_d_in_1,
				  stage_1_d_in_2, stage_1_d_in_3,
				  stage_1_d_in_4, stage_1_d_in_5,
				  stage_1_d_in_6, stage_1_d_in_7,
				  stage_1_d_in_8, stage_1_d_in_9;
	reg 		  stage_1_input_valid;
	always @ (posedge clk or posedge rst) begin
		if(rst) begin
			stage_1_d_in_0 <= 31'd0;
			stage_1_d_in_1 <= 31'd0;
			stage_1_d_in_2 <= 31'd0;
			stage_1_d_in_3 <= 31'd0;
			stage_1_d_in_4 <= 31'd0;
			stage_1_d_in_5 <= 31'd0;
			stage_1_d_in_6 <= 31'd0;
			stage_1_d_in_7 <= 31'd0;
			stage_1_d_in_8 <= 31'd0;
			stage_1_d_in_9 <= 31'd0;
			stage_1_input_valid <= 1'b0;
		end else if(input_valid) begin
			stage_1_d_in_0 <= d_in_0;
			stage_1_d_in_1 <= d_in_1;
			stage_1_d_in_2 <= d_in_2;
			stage_1_d_in_3 <= d_in_3;
			stage_1_d_in_4 <= d_in_4;
			stage_1_d_in_5 <= d_in_5;
			stage_1_d_in_6 <= d_in_6;
			stage_1_d_in_7 <= d_in_7;
			stage_1_d_in_8 <= d_in_8;
			stage_1_d_in_9 <= d_in_9;
			stage_1_input_valid <= input_valid;
		end else begin
			stage_1_input_valid <= input_valid;
		end
	end
	wire [31:0] max_bus[8:0];
	//stage_1
	max2 max_0(stage_1_d_in_0, stage_1_d_in_1, max_bus[0]);
	max2 max_1(stage_1_d_in_2, stage_1_d_in_3, max_bus[1]);
	max2 max_2(stage_1_d_in_4, stage_1_d_in_5, max_bus[2]);
	max2 max_3(stage_1_d_in_6, stage_1_d_in_7, max_bus[3]);
	max2 max_4(stage_1_d_in_8, stage_1_d_in_9, max_bus[4]);
	//stage_2
	max2 max_5(max_bus[0], max_bus[1], max_bus[5]);
	max2 max_6(max_bus[2], max_bus[3], max_bus[6]);
	max2 max_7(max_bus[5], max_bus[6], max_bus[7]);
	//stage_3
	max2 max_8(max_bus[7], max_bus[4], max_bus[8]);
	
	always @ (posedge clk or posedge rst) begin
		if(rst) begin
			output_valid <= 1'b0;
			d_out <= 32'd0;
		end else begin
			output_valid <= stage_1_input_valid;
			d_out <= max_bus[8];
		end
	end
endmodule