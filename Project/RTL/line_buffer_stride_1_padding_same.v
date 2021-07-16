module line_buffer_stride_1_padding_same
#(
	parameter data_width = 32,
	parameter input_y = 5,
	parameter input_x = 5
)
(
	clk,
	rst,
	sof, /*start of frame*/
	busy,
	input_valid,
	output_valid,
	data_in,
	data_out_0,
	data_out_1,
	data_out_2,
	data_out_3,
	data_out_4,
	data_out_5,
	data_out_6,
	data_out_7,
	data_out_8
);
	//input 
	input clk;
	input rst;
	input input_valid;
	input sof;
	input [data_width - 1:0] data_in;
	//output 
	output output_valid;
	output [data_width - 1:0] data_out_0;
	output [data_width - 1:0] data_out_1;
	output [data_width - 1:0] data_out_2;
	output [data_width - 1:0] data_out_3;
	output [data_width - 1:0] data_out_4;
	output [data_width - 1:0] data_out_5;
	output [data_width - 1:0] data_out_6;
	output [data_width - 1:0] data_out_7;
	output [data_width - 1:0] data_out_8;
	output busy;
	
	wire is_pad_0, is_pad_1, is_pad_2, is_pad_3, is_pad_4, is_pad_5, is_pad_6, is_pad_7, is_pad_8;
	wire [data_width - 1:0] out_0, out_1, out_2, out_3, out_4, out_5, out_6, out_7, out_8;
	wire load = input_valid || busy;
	wire reg_rst = rst;
	wire [data_width - 1:0] line_0_wire [2:input_y - 1]; 
	wire [data_width - 1:0] line_1_wire [2:input_y - 1]; 
	
	assign data_out_0 = (is_pad_0) ? 32'd0 : out_0;
	assign data_out_1 = (is_pad_1) ? 32'd0 : out_1;
	assign data_out_2 = (is_pad_2) ? 32'd0 : out_2;
	assign data_out_3 = (is_pad_3) ? 32'd0 : out_3;
	assign data_out_4 = (is_pad_4) ? 32'd0 : out_4;
	assign data_out_5 = (is_pad_5) ? 32'd0 : out_5;
	assign data_out_6 = (is_pad_6) ? 32'd0 : out_6;
	assign data_out_7 = (is_pad_7) ? 32'd0 : out_7;
	assign data_out_8 = (is_pad_8) ? 32'd0 : out_8;
	
	wire [data_width - 1:0] inter_connect[0:1];
	line #(input_y, data_width) line_0(	
		.clk(clk),
		.rst(reg_rst),
		.load(load),
		.data_in(data_in),
		.data_out_0(out_8),
		.data_out_1(out_7),
		.data_out_2(out_6),
		.data_out(inter_connect[0])
	);
	line #(input_y, data_width) line_1(	
		.clk(clk),
		.rst(reg_rst),
		.load(load),
		.data_in(inter_connect[0]),
		.data_out_0(out_5),
		.data_out_1(out_4),
		.data_out_2(out_3),
		.data_out(inter_connect[1])
	);
	line #(3, data_width) line_2(	
		.clk(clk),
		.rst(reg_rst),
		.load(load),
		.data_in(inter_connect[1]),
		.data_out_0(out_2),
		.data_out_1(out_1),
		.data_out(),
		.data_out_2(out_0)
	);
	
	//control
	line_buffer_control_stride_1_padding_same #(input_y, input_x) controller(
		.clk(clk),
		.busy(busy),
		.rst(rst),
		.sof(sof),
		.input_valid(input_valid),
		.output_valid(output_valid),
		.is_pad_0(is_pad_0),
		.is_pad_1(is_pad_1),
		.is_pad_2(is_pad_2),
		.is_pad_3(is_pad_3),
		.is_pad_4(is_pad_4),
		.is_pad_5(is_pad_5),
		.is_pad_6(is_pad_6),
		.is_pad_7(is_pad_7),
		.is_pad_8(is_pad_8)
	);
endmodule