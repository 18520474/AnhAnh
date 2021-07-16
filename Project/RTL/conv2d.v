module conv2d
#(
	parameter weight_path = "test_weight.txt",
	parameter is_relu = 0,
	parameter stride  = 1,
	parameter padding = 0,
	parameter input_x = 5,
	parameter input_y = 5
)
(
	input clk,
	input rst,
	input sof, 				/*start of frame input*/
	input load,				/*load weight signal*/
	output o_sof,			/*start of frame output*/
	output load_success,	/*feedback load weight signal*/
	input [31:0] d_in,	/*data input*/
	input input_valid,	
	output output_valid,
	output [31:0] d_out	/*data output*/
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
	wire [31:0] weight_input_bus[8:0];
	load_weight #(weight_path) weight(
		.clk(clk),
		.rst(rst),
		.load(load),
		.load_done(load_success),
		.w_0(weight_input_bus[0]),
		.w_1(weight_input_bus[1]),
		.w_2(weight_input_bus[2]),
		.w_3(weight_input_bus[3]),
		.w_4(weight_input_bus[4]),
		.w_5(weight_input_bus[5]),
		.w_6(weight_input_bus[6]),
		.w_7(weight_input_bus[7]),
		.w_8(weight_input_bus[8])
	);
	filter_apply #(is_relu) my_filter_apply(
		.clk(clk),
		.rst(rst),
		.input_valid(line_buffer_output_valid),
		.output_valid(output_valid),
		.data_in_0(line_buffer_output[0]),
		.data_in_1(line_buffer_output[1]),
		.data_in_2(line_buffer_output[2]),
		.data_in_3(line_buffer_output[3]),
		.data_in_4(line_buffer_output[4]),
		.data_in_5(line_buffer_output[5]),
		.data_in_6(line_buffer_output[6]),
		.data_in_7(line_buffer_output[7]),
		.data_in_8(line_buffer_output[8]),
		// weight	
		.w_in_0(weight_input_bus[0]),
		.w_in_1(weight_input_bus[1]),
		.w_in_2(weight_input_bus[2]),
		.w_in_3(weight_input_bus[3]),
		.w_in_4(weight_input_bus[4]),
		.w_in_5(weight_input_bus[5]),
		.w_in_6(weight_input_bus[6]),
		.w_in_7(weight_input_bus[7]),
		.w_in_8(weight_input_bus[8]),
		.data_out(d_out)
	);
endmodule