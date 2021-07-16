module sum_8
#(
	parameter input_x = 4
)
(
	input clk,
	input rst,
   input input_valid,
   output reg output_valid,
	output wire [31:0] data_out,
	output wire o_sof,
   input [31:0] data_in_0,
   input [31:0] data_in_1,
   input [31:0] data_in_2,
   input [31:0] data_in_3,
   input [31:0] data_in_4,
   input [31:0] data_in_5,
   input [31:0] data_in_6,
   input [31:0] data_in_7
    );
////////////// STAGE 0 ///////////////
localparam input_y = input_x;
reg[31:0] stage_0_reg [7:0];
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
        stage_0_output_valid <= input_valid;
    end
end
////////////// STAGE_1 /////////////// 
reg[31:0] stage_1_reg [3:0];
wire[31:0] stage_1_add [3:0];
reg stage_1_output_valid;
fp_adder stage_1_add_0(.a_operand(stage_0_reg[0]), .b_operand(stage_0_reg[1]), .AddBar_Sub(1'b0) , .result(stage_1_add[0]));
fp_adder stage_1_add_1(.a_operand(stage_0_reg[2]), .b_operand(stage_0_reg[3]), .AddBar_Sub(1'b0) , .result(stage_1_add[1]));
fp_adder stage_1_add_2(.a_operand(stage_0_reg[4]), .b_operand(stage_0_reg[5]), .AddBar_Sub(1'b0) , .result(stage_1_add[2]));
fp_adder stage_1_add_3(.a_operand(stage_0_reg[6]), .b_operand(stage_0_reg[7]), .AddBar_Sub(1'b0) , .result(stage_1_add[3]));

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
        stage_1_output_valid <= stage_0_output_valid;
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
        if(input_x == 69) begin
            stage_3_reg <= stage_3_add;
            output_valid <= stage_2_output_valid;
        end else begin
            stage_3_reg <= (stage_3_add[31]) ? 32'd0 : stage_3_add;
            output_valid <= stage_2_output_valid;
        end
    end
end
//assign data_out = stage_3_reg;
assign data_out = stage_3_reg; 
output_control #(input_x, input_y) my_output_control(
	.clk(clk),
	.rst(rst),
	.output_valid(output_valid),
	.o_sof(o_sof)
);
endmodule