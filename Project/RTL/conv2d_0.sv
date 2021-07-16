module conv2d_0(                               
     input wire clk,                                             
     input wire rst,                                             
     input wire load,                                             
     input wire input_valid,                                             
     input wire sof,                                             
     output wire o_sof,                                             
     output wire load_success,                                             
     output wire output_valid,                                      
     output wire [31:0] d_out[3:0],    
     input wire [31:0] d_in                                             
); 
conv2d #("weight/conv2d_0/0.txt", 1 /*use relu*/, 2, 0, 64, 64) conv2d_0_conv2d_0(
	.clk(clk),
	.rst(rst),
	.input_valid(input_valid),
	.load(load),
	.load_success(load_success),
	.output_valid(output_valid),
	.sof(sof),
	.o_sof(o_sof),
	.d_in(d_in),
	.d_out(d_out[0])
);
conv2d #("weight/conv2d_0/1.txt", 1 /*use relu*/, 2, 0, 64, 64) conv2d_0_conv2d_1(
	.clk(clk),
	.rst(rst),
	.input_valid(input_valid),
	.load(load),
	.load_success(),
	.output_valid(),
	.sof(sof),
	.o_sof(),
	.d_in(d_in),
	.d_out(d_out[1])
);
conv2d #("weight/conv2d_0/2.txt", 1 /*use relu*/, 2, 0, 64, 64) conv2d_0_conv2d_2(
	.clk(clk),
	.rst(rst),
	.input_valid(input_valid),
	.load(load),
	.load_success(),
	.output_valid(),
	.sof(sof),
	.o_sof(),
	.d_in(d_in),
	.d_out(d_out[2])
);
conv2d #("weight/conv2d_0/3.txt", 1 /*use relu*/, 2, 0, 64, 64) conv2d_0_conv2d_3(
	.clk(clk),
	.rst(rst),
	.input_valid(input_valid),
	.load(load),
	.load_success(),
	.output_valid(),
	.sof(sof),
	.o_sof(),
	.d_in(d_in),
	.d_out(d_out[3])
);
endmodule