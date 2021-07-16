module sum_16
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
    input [31:0] data_in_7,
    input [31:0] data_in_8,
    input [31:0] data_in_9,
    input [31:0] data_in_10,
    input [31:0] data_in_11,
    input [31:0] data_in_12,
    input [31:0] data_in_13,
    input [31:0] data_in_14,
    input [31:0] data_in_15
    );
////////////// STAGE_1 /////////////// 
localparam input_y = input_x;
reg  [31:0] stage_1_reg [1:0];
wire [31:0] stage_1_add [1:0];
wire output_valid_and [1:0];
reg stage_1_output_valid [1:0];
sum_8 add_8bit_1
(
.clk(clk),
.rst(rst),
.input_valid(input_valid),
.data_in_0(data_in_0),
.data_in_1(data_in_1),
.data_in_2(data_in_2),
.data_in_3(data_in_3),
.data_in_4(data_in_4),
.data_in_5(data_in_5),
.data_in_6(data_in_6),
.data_in_7(data_in_7),
.output_valid(output_valid_and[0]),
.data_out(stage_1_add[0])
);
sum_8 add_8bit_2
(
.clk(clk),
.rst(rst),
.input_valid(input_valid),
.data_in_0(data_in_8),
.data_in_1(data_in_9),
.data_in_2(data_in_10),
.data_in_3(data_in_11),
.data_in_4(data_in_12),
.data_in_5(data_in_13),
.data_in_6(data_in_14),
.data_in_7(data_in_15),
.output_valid(output_valid_and[1]),
.data_out(stage_1_add[1])
);

always @ (posedge clk or posedge rst) begin
	if(rst) begin
        stage_1_reg[0] <= 32'd0;
        stage_1_reg[1] <= 32'd0;
        stage_1_output_valid[0] <= 0;
        stage_1_output_valid[1] <= 0;
    end else begin
        stage_1_reg[0] <= stage_1_add[0];
        stage_1_reg[1] <= stage_1_add[1];
        stage_1_output_valid[0] <= output_valid_and[0];
        stage_1_output_valid[1] <= output_valid_and[1];
    end
end
////////////// STAGE_2 /////////////// 
reg[31:0] stage_2_reg;
wire[31:0] stage_2_add;
wire output_valid_wire;

fp_adder stage_2_add_0(.a_operand(stage_1_reg[0]), .b_operand(stage_1_reg[1]), .AddBar_Sub(1'b0) , .result(stage_2_add));
and(output_valid_wire,stage_1_output_valid[0],stage_1_output_valid[1]);

always @ (posedge clk or posedge rst) begin
	if(rst) begin
        stage_2_reg <= 32'd0;
        output_valid <= 0;
    end else begin
        stage_2_reg <= stage_2_add;
        output_valid <= output_valid_wire;
    end
end
assign data_out = stage_2_reg;
output_control #(input_x, input_y) my_output_control(
	.clk(clk),
	.rst(rst),
	.output_valid(output_valid),
	.o_sof(o_sof)
);
endmodule