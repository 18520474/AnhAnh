module sum_4
#(
	parameter input_x = 4
)
(
	input clk,
	input rst,
    input input_valid,
    output reg output_valid,
    output reg [31:0] data_out,
	output wire o_sof,
    input [31:0] data_in_0,
    input [31:0] data_in_1,
    input [31:0] data_in_2,
    input [31:0] data_in_3
);
////////////// STAGE 0 ///////////////
localparam input_y = input_x;
reg [31:0] stage_0_din[0:3];
reg stage_0_output_valid;
always @(posedge clk or posedge rst) begin
    if(rst) begin
        stage_0_din[0] <= 32'd0;
        stage_0_din[1] <= 32'd0;
        stage_0_din[2] <= 32'd0;
        stage_0_din[3] <= 32'd0;
        stage_0_output_valid <= 1'b0;
    end else begin
        if(input_valid) begin
            stage_0_din[0] <= data_in_0;
            stage_0_din[1] <= data_in_1;
            stage_0_din[2] <= data_in_2;
            stage_0_din[3] <= data_in_3;
            stage_0_output_valid <= 1'b1;
        end else begin
            stage_0_din[0] <= 32'd0;
            stage_0_din[1] <= 32'd0;
            stage_0_din[2] <= 32'd0;
            stage_0_din[3] <= 32'd0;
            stage_0_output_valid <= 1'b0;
        end
    end
end

wire [31:0] stage_1_add[0:1];
fp_adder stage_1_add_0(.a_operand(stage_0_din[0]), .b_operand(stage_0_din[1]), .AddBar_Sub(1'b0) , .result(stage_1_add[0]));
fp_adder stage_1_add_1(.a_operand(stage_0_din[2]), .b_operand(stage_0_din[3]), .AddBar_Sub(1'b0) , .result(stage_1_add[1]));
wire [31:0] stage_2_add;
fp_adder stage_1_add_2(.a_operand(stage_1_add[0]), .b_operand(stage_1_add[1]), .AddBar_Sub(1'b0) , .result(stage_2_add));


always @(posedge clk or posedge rst) begin
    if(rst) begin
        data_out <= 32'd0;
        output_valid <= 1'b0;
    end else begin
        if(stage_0_output_valid) begin
            data_out <= (stage_2_add[31]) ? 32'd0 : stage_2_add;
            output_valid <= 1'b1;
        end else begin
            output_valid <= 1'b0;
        end
    end
end
output_control #(input_x, input_y) my_output_control(
	.clk(clk),
	.rst(rst),
	.output_valid(output_valid),
	.o_sof(o_sof)
);
endmodule