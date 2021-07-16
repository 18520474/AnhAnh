module avg_polling(                               
     input wire clk,                                             
     input wire rst,                                             
     input wire input_valid,                                             
     input wire sof,                                             
     output wire o_sof,                                             
     output wire output_valid,                                      
     output wire [31:0] d_out[15:0],    
     input  wire [31:0] d_in[15:0]    
); 
avg_pooling2d #(1, 0, 3, 3) polling_0(
	.clk(clk),
	.rst(rst),
	.sof(sof),
	.d_in(d_in[0]),
	.input_valid(input_valid),
	.o_sof(o_sof),
	.output_valid(output_valid),
	.d_out(d_out[0])
);
avg_pooling2d #(1, 0, 3, 3) polling_1(
	.clk(clk),
	.rst(rst),
	.sof(sof),
	.d_in(d_in[1]),
	.input_valid(input_valid),
	.o_sof(),
	.output_valid(),
	.d_out(d_out[1])
);
avg_pooling2d #(1, 0, 3, 3) polling_2(
	.clk(clk),
	.rst(rst),
	.sof(sof),
	.d_in(d_in[2]),
	.input_valid(input_valid),
	.o_sof(),
	.output_valid(),
	.d_out(d_out[2])
);
avg_pooling2d #(1, 0, 3, 3) polling_3(
	.clk(clk),
	.rst(rst),
	.sof(sof),
	.d_in(d_in[3]),
	.input_valid(input_valid),
	.o_sof(),
	.output_valid(),
	.d_out(d_out[3])
);
avg_pooling2d #(1, 0, 3, 3) polling_4(
	.clk(clk),
	.rst(rst),
	.sof(sof),
	.d_in(d_in[4]),
	.input_valid(input_valid),
	.o_sof(),
	.output_valid(),
	.d_out(d_out[4])
);
avg_pooling2d #(1, 0, 3, 3) polling_5(
	.clk(clk),
	.rst(rst),
	.sof(sof),
	.d_in(d_in[5]),
	.input_valid(input_valid),
	.o_sof(),
	.output_valid(),
	.d_out(d_out[5])
);
avg_pooling2d #(1, 0, 3, 3) polling_6(
	.clk(clk),
	.rst(rst),
	.sof(sof),
	.d_in(d_in[6]),
	.input_valid(input_valid),
	.o_sof(),
	.output_valid(),
	.d_out(d_out[6])
);
avg_pooling2d #(1, 0, 3, 3) polling_7(
	.clk(clk),
	.rst(rst),
	.sof(sof),
	.d_in(d_in[7]),
	.input_valid(input_valid),
	.o_sof(),
	.output_valid(),
	.d_out(d_out[7])
);
avg_pooling2d #(1, 0, 3, 3) polling_8(
	.clk(clk),
	.rst(rst),
	.sof(sof),
	.d_in(d_in[8]),
	.input_valid(input_valid),
	.o_sof(),
	.output_valid(),
	.d_out(d_out[8])
);
avg_pooling2d #(1, 0, 3, 3) polling_9(
	.clk(clk),
	.rst(rst),
	.sof(sof),
	.d_in(d_in[9]),
	.input_valid(input_valid),
	.o_sof(),
	.output_valid(),
	.d_out(d_out[9])
);
avg_pooling2d #(1, 0, 3, 3) polling_10(
	.clk(clk),
	.rst(rst),
	.sof(sof),
	.d_in(d_in[10]),
	.input_valid(input_valid),
	.o_sof(),
	.output_valid(),
	.d_out(d_out[10])
);
avg_pooling2d #(1, 0, 3, 3) polling_11(
	.clk(clk),
	.rst(rst),
	.sof(sof),
	.d_in(d_in[11]),
	.input_valid(input_valid),
	.o_sof(),
	.output_valid(),
	.d_out(d_out[11])
);
avg_pooling2d #(1, 0, 3, 3) polling_12(
	.clk(clk),
	.rst(rst),
	.sof(sof),
	.d_in(d_in[12]),
	.input_valid(input_valid),
	.o_sof(),
	.output_valid(),
	.d_out(d_out[12])
);
avg_pooling2d #(1, 0, 3, 3) polling_13(
	.clk(clk),
	.rst(rst),
	.sof(sof),
	.d_in(d_in[13]),
	.input_valid(input_valid),
	.o_sof(),
	.output_valid(),
	.d_out(d_out[13])
);
avg_pooling2d #(1, 0, 3, 3) polling_14(
	.clk(clk),
	.rst(rst),
	.sof(sof),
	.d_in(d_in[14]),
	.input_valid(input_valid),
	.o_sof(),
	.output_valid(),
	.d_out(d_out[14])
);
avg_pooling2d #(1, 0, 3, 3) polling_15(
	.clk(clk),
	.rst(rst),
	.sof(sof),
	.d_in(d_in[15]),
	.input_valid(input_valid),
	.o_sof(),
	.output_valid(),
	.d_out(d_out[15])
);
endmodule