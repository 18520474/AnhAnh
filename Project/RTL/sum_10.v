module sum_10
(
	input clk,
	input rst,
   input input_valid,
   output reg output_valid,
    output wire [31:0] data_out,
   input [31:0] data_in_0,
   input [31:0] data_in_1,
   input [31:0] data_in_2,
   input [31:0] data_in_3,
   input [31:0] data_in_4,
   input [31:0] data_in_5,
   input [31:0] data_in_6,
   input [31:0] data_in_7,
	input [31:0] data_in_8,
   input [31:0] data_in_9
 );
 ////////////// STAGE 0 ///////////////
reg[31:0] stage_0_reg [9:0];
reg stage_0_output_valid;

always @ (posedge clk or posedge rst) begin
	if(rst) begin
        stage_0_reg[0] <= 32'd0;
        stage_0_reg[1] <= 32'd0;
        stage_0_reg[2] <= 32'd0;
        stage_0_reg[3] <= 32'd0;
		  stage_0_reg[4] <= 32'd0;
        stage_0_reg[5] <= 32'd0;
        stage_0_reg[6] <= 32'd0;
		  stage_0_reg[7] <= 32'd0;
		  stage_0_reg[8] <= 32'd0;
        stage_0_reg[9] <= 32'd0;
        stage_0_output_valid <= 0;
    end else begin
        stage_0_reg[0] <= data_in_0;
        stage_0_reg[1] <= data_in_1;
        stage_0_reg[2] <= data_in_2;
        stage_0_reg[3] <= data_in_3;
		  stage_0_reg[4] <= data_in_4;
        stage_0_reg[5] <= data_in_5;
        stage_0_reg[6] <= data_in_6;
        stage_0_reg[7] <= data_in_7;
		  stage_0_reg[8] <= data_in_8;
        stage_0_reg[9] <= data_in_9;
        stage_0_output_valid <= input_valid;
    end
end
////////////// STAGE_1 /////////////// 
reg[31:0] stage_1_reg [4:0];
wire[31:0] stage_1_add [4:0];
reg stage_1_output_valid;
fp_adder stage_1_add_0(.a_operand(stage_0_reg[0]), .b_operand(stage_0_reg[1]), .AddBar_Sub(1'b0) , .result(stage_1_add[0]));
fp_adder stage_1_add_1(.a_operand(stage_0_reg[2]), .b_operand(stage_0_reg[3]), .AddBar_Sub(1'b0) , .result(stage_1_add[1]));
fp_adder stage_1_add_2(.a_operand(stage_0_reg[4]), .b_operand(stage_0_reg[5]), .AddBar_Sub(1'b0) , .result(stage_1_add[2]));
fp_adder stage_1_add_3(.a_operand(stage_0_reg[6]), .b_operand(stage_0_reg[7]), .AddBar_Sub(1'b0) , .result(stage_1_add[3]));
fp_adder stage_1_add_4(.a_operand(stage_0_reg[8]), .b_operand(stage_0_reg[9]), .AddBar_Sub(1'b0) , .result(stage_1_add[4]));
always @ (posedge clk or posedge rst) begin
	if(rst) begin
        stage_1_reg[0] <= 32'd0;
        stage_1_reg[1] <= 32'd0;
        stage_1_reg[2] <= 32'd0;
        stage_1_reg[3] <= 32'd0;
		  stage_1_reg[4] <= 32'd0;
        stage_1_output_valid <= 0;
    end else begin
        stage_1_reg[0] <= stage_1_add[0];
        stage_1_reg[1] <= stage_1_add[1];
        stage_1_reg[2] <= stage_1_add[2];
        stage_1_reg[3] <= stage_1_add[3];
		  stage_1_reg[4] <= stage_1_add[4];
        stage_1_output_valid <= stage_0_output_valid;
    end
end
////////////// STAGE_2 /////////////// 
reg[31:0] stage_2_reg [2:0];
wire[31:0] stage_2_add [2:0];
reg stage_2_output_valid;
fp_adder stage_2_add_0(.a_operand(stage_1_reg[0]), .b_operand(stage_1_reg[1]), .AddBar_Sub(1'b0) , .result(stage_2_add[0]));
fp_adder stage_2_add_1(.a_operand(stage_1_reg[2]), .b_operand(stage_1_reg[3]), .AddBar_Sub(1'b0) , .result(stage_2_add[1]));
assign stage_2_add[2] = stage_1_reg[4];
always @ (posedge clk or posedge rst) begin
	if(rst) begin
        stage_2_reg[0] <= 32'd0;
        stage_2_reg[1] <= 32'd0;
		  stage_2_reg[2] <= 32'd0;
        stage_2_output_valid <= 0;
    end else begin
        stage_2_reg[0] <= stage_2_add[0];
        stage_2_reg[1] <= stage_2_add[1];
		  stage_2_reg[2] <= stage_2_add[2];
        stage_2_output_valid <= stage_1_output_valid;
    end
end
////////////// STAGE_3 /////////////// 
reg[31:0] stage_3_reg [1:0];
wire[31:0] stage_3_add [1:0];
reg stage_3_output_valid;
fp_adder stage_3_add_0(.a_operand(stage_2_reg[0]), .b_operand(stage_2_reg[1]), .AddBar_Sub(1'b0) , .result(stage_3_add[0]));
assign stage_3_add[1] = stage_2_reg[2];
always @ (posedge clk or posedge rst) begin
	if(rst) begin
        stage_3_reg[0] <= 32'd0;
        stage_3_reg[1] <= 32'd0;
        stage_3_output_valid <= 0;
    end else begin
        stage_3_reg[0] <= stage_3_add[0];
        stage_3_reg[1] <= stage_3_add[1];
        stage_3_output_valid <= stage_2_output_valid;
    end
end
////////////// STAGE_3 /////////////// 
reg[31:0] stage_4_reg;
wire[31:0] stage_4_add;
fp_adder stage_4_add_0(.a_operand(stage_3_reg[0]), .b_operand(stage_3_reg[1]), .AddBar_Sub(1'b0) , .result(stage_4_add));

always @ (posedge clk or posedge rst) begin
	if(rst) begin
        stage_4_reg <= 32'd0;
        output_valid <= 0;
    end else begin
        stage_4_reg <= stage_4_add;
        output_valid <= stage_3_output_valid;
    end
end
assign data_out = stage_4_reg;
endmodule
