module avg_pooling2d
#(
	parameter stride  = 1,
	parameter padding = 0,
	parameter input_x = 5,
	parameter input_y = 5
)
(
	input clk,
	input rst,
	input sof,
	input [31:0] d_in,
	input input_valid,
	output o_sof,
	output output_valid,
	output [31:0] d_out
);

localparam data_width = 32;
wire line_buffer_output_valid;
wire [data_width - 1 : 0] line_buffer_output[8:0]; 
generate
	if(stride == 1 && padding == 0) begin
		line_buffer_stride_1_no_padding #(data_width, input_y) line_buffer(
			.clk(clk),
			.rst(rst),
			.sof(sof), 
			.input_valid(input_valid),
			.output_valid(line_buffer_output_valid),
			.data_in(d_in),
			.data_out_0(line_buffer_output[0]),
			.data_out_1(line_buffer_output[1]),
			.data_out_2(line_buffer_output[2]),
			.data_out_3(line_buffer_output[3]),
			.data_out_4(line_buffer_output[4]),
			.data_out_5(line_buffer_output[5]),
			.data_out_6(line_buffer_output[6]),
			.data_out_7(line_buffer_output[7]),
			.data_out_8(line_buffer_output[8])
		);
		output_control #(input_x - 2, input_y - 2) my_output_control(
			.clk(clk),
			.rst(rst),
			.output_valid(output_valid),
			.o_sof(o_sof)
		);
	end else if(stride == 1 && padding == 1) begin
		line_buffer_stride_1_padding_same #(data_width, input_y, input_x) line_buffer(
			.clk(clk),
			.rst(rst),
			.sof(sof),
			.busy(),
			.input_valid(input_valid),
			.output_valid(line_buffer_output_valid),
			.data_in(d_in),
			.data_out_0(line_buffer_output[0]),
			.data_out_1(line_buffer_output[1]),
			.data_out_2(line_buffer_output[2]),
			.data_out_3(line_buffer_output[3]),
			.data_out_4(line_buffer_output[4]),
			.data_out_5(line_buffer_output[5]),
			.data_out_6(line_buffer_output[6]),
			.data_out_7(line_buffer_output[7]),
			.data_out_8(line_buffer_output[8])
		);
		output_control #(input_x, input_y) my_output_control(
			.clk(clk),
			.rst(rst),
			.output_valid(output_valid),
			.o_sof(o_sof)
		);
	end else if(stride == 2) begin
		line_buffer_stride_2_no_padding #(data_width, input_y) line_buffer(
			.clk(clk),
			.rst(rst),
			.sof(sof), 
			.input_valid(input_valid),
			.output_valid(line_buffer_output_valid),
			.data_in(d_in),
			.data_out_0(line_buffer_output[0]),
			.data_out_1(line_buffer_output[1]),
			.data_out_2(line_buffer_output[2]),
			.data_out_3(line_buffer_output[3]),
			.data_out_4(line_buffer_output[4]),
			.data_out_5(line_buffer_output[5]),
			.data_out_6(line_buffer_output[6]),
			.data_out_7(line_buffer_output[7]),
			.data_out_8(line_buffer_output[8])
		);
		output_control #((input_x - 1)/2, (input_y - 1)/2) my_output_control(
			.clk(clk),
			.rst(rst),
			.output_valid(output_valid),
			.o_sof(o_sof)
		);
	end
endgenerate
	avg_apply my_avg(
		.clk(clk),
		.rst(rst),
		.input_valid(line_buffer_output_valid),
		.output_valid(output_valid),
		.IN_1(line_buffer_output[0]),
		.IN_2(line_buffer_output[1]),
		.IN_3(line_buffer_output[2]),
		.IN_4(line_buffer_output[3]),
		.IN_5(line_buffer_output[4]),
		.IN_6(line_buffer_output[5]),
		.IN_7(line_buffer_output[6]),
		.IN_8(line_buffer_output[7]),
		.IN_9(line_buffer_output[8]),
		.result(d_out)
	);
endmodule