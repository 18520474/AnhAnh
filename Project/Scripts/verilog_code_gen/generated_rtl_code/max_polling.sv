module max_polling(                               
     input wire clk,                                             
     input wire rst,                                             
     input wire input_valid,                                             
     input wire sof,                                             
     output wire o_sof,                                             
     output wire output_valid,                                      
     output wire [31:0] d_out[3:0],    
     input  wire [31:0] d_in[3:0]    
); 
max_pooling2d #(2, 0, 31, 31) polling_0(
	.clk(clk),
	.rst(rst),
	.sof(sof),
	.d_in(d_in[0]),
	.input_valid(input_valid),
	.o_sof(o_sof),
	.output_valid(output_valid),
	.d_out(d_out[0])
);
max_pooling2d #(2, 0, 31, 31) polling_1(
	.clk(clk),
	.rst(rst),
	.sof(sof),
	.d_in(d_in[1]),
	.input_valid(input_valid),
	.o_sof(),
	.output_valid(),
	.d_out(d_out[1])
);
max_pooling2d #(2, 0, 31, 31) polling_2(
	.clk(clk),
	.rst(rst),
	.sof(sof),
	.d_in(d_in[2]),
	.input_valid(input_valid),
	.o_sof(),
	.output_valid(),
	.d_out(d_out[2])
);
max_pooling2d #(2, 0, 31, 31) polling_3(
	.clk(clk),
	.rst(rst),
	.sof(sof),
	.d_in(d_in[3]),
	.input_valid(input_valid),
	.o_sof(),
	.output_valid(),
	.d_out(d_out[3])
);
endmodule