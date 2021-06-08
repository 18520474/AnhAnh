module add_8bit
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
    input [31:0] data_in_7
    );
////////////// STAGE_1 /////////////// 
reg[31:0] stage_1_reg [3:0];
wire[31:0] stage_1_add [3:0];
reg stage_1_output_valid;
fp_adder stage_1_add_0(.a_operand(data_in_0), .b_operand(data_in_1), .AddBar_Sub(1'b0) , .result(stage_1_add[0]));
fp_adder stage_1_add_1(.a_operand(data_in_2), .b_operand(data_in_3), .AddBar_Sub(1'b0) , .result(stage_1_add[1]));
fp_adder stage_1_add_2(.a_operand(data_in_4), .b_operand(data_in_5), .AddBar_Sub(1'b0) , .result(stage_1_add[2]));
fp_adder stage_1_add_3(.a_operand(data_in_6), .b_operand(data_in_7), .AddBar_Sub(1'b0) , .result(stage_1_add[3]));

always @ (posedge clk or posedge rst) begin
	if(rst) begin
        stage_1_reg[0] <= 32'd0;
        stage_1_reg[1] <= 32'd0;
        stage_1_reg[2] <= 32'd0;
        stage_1_reg[3] <= 32'd0;
        stage_1_output_valid <= 0;
    end else begin
        stage_1_reg[0] <= stage_1_add[0];
        stage_1_reg[1] <= stage_1_add[1];
        stage_1_reg[2] <= stage_1_add[2];
        stage_1_reg[3] <= stage_1_add[3];
        stage_1_output_valid <= input_valid;
    end
end
////////////// STAGE_2 /////////////// 
reg[31:0] stage_2_reg [1:0];
wire[31:0] stage_2_add [1:0];
reg stage_2_output_valid;
fp_adder stage_2_add_0(.a_operand(stage_1_reg[0]), .b_operand(stage_1_reg[1]), .AddBar_Sub(1'b0) , .result(stage_2_add[0]));
fp_adder stage_2_add_1(.a_operand(stage_1_reg[2]), .b_operand(stage_1_reg[3]), .AddBar_Sub(1'b0) , .result(stage_2_add[1]));

always @ (posedge clk or posedge rst) begin
	if(rst) begin
        stage_2_reg[0] <= 32'd0;
        stage_2_reg[1] <= 32'd0;
        stage_2_output_valid <= 0;
    end else begin
        stage_2_reg[0] <= stage_2_add[0];
        stage_2_reg[1] <= stage_2_add[1];
        stage_2_output_valid <= stage_1_output_valid;
    end
end
////////////// STAGE_3 /////////////// 
reg[31:0] stage_3_reg;
wire[31:0] stage_3_add;
fp_adder stage_3_add_0(.a_operand(stage_2_reg[0]), .b_operand(stage_2_reg[1]), .AddBar_Sub(1'b0) , .result(stage_3_add));

always @ (posedge clk or posedge rst) begin
	if(rst) begin
        stage_3_reg <= 32'd0;
        output_valid <= 0;
    end else begin
        stage_3_reg <= stage_3_add;
        output_valid <= stage_2_output_valid;
    end
end
assign data_out = stage_3_reg;
endmodule