module conv2d_1(                               
     input wire clk,                                             
     input wire rst,                                             
     input wire load,                                             
     input wire input_valid,                                             
     input wire sof,                                             
     output wire o_sof,                                             
     output wire load_success,                                             
     output wire output_valid,                                      
     output wire [31:0] d_out[7:0],    
     input wire [31:0] d_in[3:0]                    
); 
wire output_valid_affter_conv;                                             
wire [31:0] _0_addbus_[3:0];    
conv2d #("weight/conv2d_1/0_0.txt", 0 /*dont use relu*/, 2, 0, 15, 15) conv2d_0_0(
	.clk(clk),
	.rst(rst),
	.input_valid(input_valid),
	.load(load),
	.load_success(load_success),
	.output_valid(output_valid_affter_conv),
	.sof(sof),
	.o_sof(),
	.d_in(d_in[0]),
	.d_out(_0_addbus_[0])
);
conv2d #("weight/conv2d_1/0_1.txt", 0 /*dont use relu*/, 2, 0, 15, 15) conv2d_0_1(
	.clk(clk),
	.rst(rst),
	.input_valid(input_valid),
	.load(load),
	.load_success(),
	.output_valid(),
	.sof(sof),
	.o_sof(),
	.d_in(d_in[1]),
	.d_out(_0_addbus_[1])
);
conv2d #("weight/conv2d_1/0_2.txt", 0 /*dont use relu*/, 2, 0, 15, 15) conv2d_0_2(
	.clk(clk),
	.rst(rst),
	.input_valid(input_valid),
	.load(load),
	.load_success(),
	.output_valid(),
	.sof(sof),
	.o_sof(),
	.d_in(d_in[2]),
	.d_out(_0_addbus_[2])
);
conv2d #("weight/conv2d_1/0_3.txt", 0 /*dont use relu*/, 2, 0, 15, 15) conv2d_0_3(
	.clk(clk),
	.rst(rst),
	.input_valid(input_valid),
	.load(load),
	.load_success(),
	.output_valid(),
	.sof(sof),
	.o_sof(),
	.d_in(d_in[3]),
	.d_out(_0_addbus_[3])
);
sum_4 #(7) sum_0( 
        .clk(clk), 
        .rst(rst), 
        .input_valid(output_valid_affter_conv), 
        .output_valid(output_valid), 
        .o_sof(o_sof), 
        .data_out(d_out[0]), 
        .data_in_0(_0_addbus_[0]), 
        .data_in_1(_0_addbus_[1]), 
        .data_in_2(_0_addbus_[2]), 
        .data_in_3(_0_addbus_[3]) 
); 
wire [31:0] _1_addbus_[3:0];    
conv2d #("weight/conv2d_1/1_0.txt", 0 /*dont use relu*/, 2, 0, 15, 15) conv2d_1_0(
	.clk(clk),
	.rst(rst),
	.input_valid(input_valid),
	.load(load),
	.load_success(),
	.output_valid(),
	.sof(sof),
	.o_sof(),
	.d_in(d_in[0]),
	.d_out(_1_addbus_[0])
);
conv2d #("weight/conv2d_1/1_1.txt", 0 /*dont use relu*/, 2, 0, 15, 15) conv2d_1_1(
	.clk(clk),
	.rst(rst),
	.input_valid(input_valid),
	.load(load),
	.load_success(),
	.output_valid(),
	.sof(sof),
	.o_sof(),
	.d_in(d_in[1]),
	.d_out(_1_addbus_[1])
);
conv2d #("weight/conv2d_1/1_2.txt", 0 /*dont use relu*/, 2, 0, 15, 15) conv2d_1_2(
	.clk(clk),
	.rst(rst),
	.input_valid(input_valid),
	.load(load),
	.load_success(),
	.output_valid(),
	.sof(sof),
	.o_sof(),
	.d_in(d_in[2]),
	.d_out(_1_addbus_[2])
);
conv2d #("weight/conv2d_1/1_3.txt", 0 /*dont use relu*/, 2, 0, 15, 15) conv2d_1_3(
	.clk(clk),
	.rst(rst),
	.input_valid(input_valid),
	.load(load),
	.load_success(),
	.output_valid(),
	.sof(sof),
	.o_sof(),
	.d_in(d_in[3]),
	.d_out(_1_addbus_[3])
);
sum_4 #(7) sum_1( 
        .clk(clk), 
        .rst(rst), 
        .input_valid(output_valid_affter_conv), 
        .data_out(d_out[1]), 
        .data_in_0(_1_addbus_[0]), 
        .data_in_1(_1_addbus_[1]), 
        .data_in_2(_1_addbus_[2]), 
        .data_in_3(_1_addbus_[3]) 
); 
wire [31:0] _2_addbus_[3:0];    
conv2d #("weight/conv2d_1/2_0.txt", 0 /*dont use relu*/, 2, 0, 15, 15) conv2d_2_0(
	.clk(clk),
	.rst(rst),
	.input_valid(input_valid),
	.load(load),
	.load_success(),
	.output_valid(),
	.sof(sof),
	.o_sof(),
	.d_in(d_in[0]),
	.d_out(_2_addbus_[0])
);
conv2d #("weight/conv2d_1/2_1.txt", 0 /*dont use relu*/, 2, 0, 15, 15) conv2d_2_1(
	.clk(clk),
	.rst(rst),
	.input_valid(input_valid),
	.load(load),
	.load_success(),
	.output_valid(),
	.sof(sof),
	.o_sof(),
	.d_in(d_in[1]),
	.d_out(_2_addbus_[1])
);
conv2d #("weight/conv2d_1/2_2.txt", 0 /*dont use relu*/, 2, 0, 15, 15) conv2d_2_2(
	.clk(clk),
	.rst(rst),
	.input_valid(input_valid),
	.load(load),
	.load_success(),
	.output_valid(),
	.sof(sof),
	.o_sof(),
	.d_in(d_in[2]),
	.d_out(_2_addbus_[2])
);
conv2d #("weight/conv2d_1/2_3.txt", 0 /*dont use relu*/, 2, 0, 15, 15) conv2d_2_3(
	.clk(clk),
	.rst(rst),
	.input_valid(input_valid),
	.load(load),
	.load_success(),
	.output_valid(),
	.sof(sof),
	.o_sof(),
	.d_in(d_in[3]),
	.d_out(_2_addbus_[3])
);
sum_4 #(7) sum_2( 
        .clk(clk), 
        .rst(rst), 
        .input_valid(output_valid_affter_conv), 
        .data_out(d_out[2]), 
        .data_in_0(_2_addbus_[0]), 
        .data_in_1(_2_addbus_[1]), 
        .data_in_2(_2_addbus_[2]), 
        .data_in_3(_2_addbus_[3]) 
); 
wire [31:0] _3_addbus_[3:0];    
conv2d #("weight/conv2d_1/3_0.txt", 0 /*dont use relu*/, 2, 0, 15, 15) conv2d_3_0(
	.clk(clk),
	.rst(rst),
	.input_valid(input_valid),
	.load(load),
	.load_success(),
	.output_valid(),
	.sof(sof),
	.o_sof(),
	.d_in(d_in[0]),
	.d_out(_3_addbus_[0])
);
conv2d #("weight/conv2d_1/3_1.txt", 0 /*dont use relu*/, 2, 0, 15, 15) conv2d_3_1(
	.clk(clk),
	.rst(rst),
	.input_valid(input_valid),
	.load(load),
	.load_success(),
	.output_valid(),
	.sof(sof),
	.o_sof(),
	.d_in(d_in[1]),
	.d_out(_3_addbus_[1])
);
conv2d #("weight/conv2d_1/3_2.txt", 0 /*dont use relu*/, 2, 0, 15, 15) conv2d_3_2(
	.clk(clk),
	.rst(rst),
	.input_valid(input_valid),
	.load(load),
	.load_success(),
	.output_valid(),
	.sof(sof),
	.o_sof(),
	.d_in(d_in[2]),
	.d_out(_3_addbus_[2])
);
conv2d #("weight/conv2d_1/3_3.txt", 0 /*dont use relu*/, 2, 0, 15, 15) conv2d_3_3(
	.clk(clk),
	.rst(rst),
	.input_valid(input_valid),
	.load(load),
	.load_success(),
	.output_valid(),
	.sof(sof),
	.o_sof(),
	.d_in(d_in[3]),
	.d_out(_3_addbus_[3])
);
sum_4 #(7) sum_3( 
        .clk(clk), 
        .rst(rst), 
        .input_valid(output_valid_affter_conv), 
        .data_out(d_out[3]), 
        .data_in_0(_3_addbus_[0]), 
        .data_in_1(_3_addbus_[1]), 
        .data_in_2(_3_addbus_[2]), 
        .data_in_3(_3_addbus_[3]) 
); 
wire [31:0] _4_addbus_[3:0];    
conv2d #("weight/conv2d_1/4_0.txt", 0 /*dont use relu*/, 2, 0, 15, 15) conv2d_4_0(
	.clk(clk),
	.rst(rst),
	.input_valid(input_valid),
	.load(load),
	.load_success(),
	.output_valid(),
	.sof(sof),
	.o_sof(),
	.d_in(d_in[0]),
	.d_out(_4_addbus_[0])
);
conv2d #("weight/conv2d_1/4_1.txt", 0 /*dont use relu*/, 2, 0, 15, 15) conv2d_4_1(
	.clk(clk),
	.rst(rst),
	.input_valid(input_valid),
	.load(load),
	.load_success(),
	.output_valid(),
	.sof(sof),
	.o_sof(),
	.d_in(d_in[1]),
	.d_out(_4_addbus_[1])
);
conv2d #("weight/conv2d_1/4_2.txt", 0 /*dont use relu*/, 2, 0, 15, 15) conv2d_4_2(
	.clk(clk),
	.rst(rst),
	.input_valid(input_valid),
	.load(load),
	.load_success(),
	.output_valid(),
	.sof(sof),
	.o_sof(),
	.d_in(d_in[2]),
	.d_out(_4_addbus_[2])
);
conv2d #("weight/conv2d_1/4_3.txt", 0 /*dont use relu*/, 2, 0, 15, 15) conv2d_4_3(
	.clk(clk),
	.rst(rst),
	.input_valid(input_valid),
	.load(load),
	.load_success(),
	.output_valid(),
	.sof(sof),
	.o_sof(),
	.d_in(d_in[3]),
	.d_out(_4_addbus_[3])
);
sum_4 #(7) sum_4( 
        .clk(clk), 
        .rst(rst), 
        .input_valid(output_valid_affter_conv), 
        .data_out(d_out[4]), 
        .data_in_0(_4_addbus_[0]), 
        .data_in_1(_4_addbus_[1]), 
        .data_in_2(_4_addbus_[2]), 
        .data_in_3(_4_addbus_[3]) 
); 
wire [31:0] _5_addbus_[3:0];    
conv2d #("weight/conv2d_1/5_0.txt", 0 /*dont use relu*/, 2, 0, 15, 15) conv2d_5_0(
	.clk(clk),
	.rst(rst),
	.input_valid(input_valid),
	.load(load),
	.load_success(),
	.output_valid(),
	.sof(sof),
	.o_sof(),
	.d_in(d_in[0]),
	.d_out(_5_addbus_[0])
);
conv2d #("weight/conv2d_1/5_1.txt", 0 /*dont use relu*/, 2, 0, 15, 15) conv2d_5_1(
	.clk(clk),
	.rst(rst),
	.input_valid(input_valid),
	.load(load),
	.load_success(),
	.output_valid(),
	.sof(sof),
	.o_sof(),
	.d_in(d_in[1]),
	.d_out(_5_addbus_[1])
);
conv2d #("weight/conv2d_1/5_2.txt", 0 /*dont use relu*/, 2, 0, 15, 15) conv2d_5_2(
	.clk(clk),
	.rst(rst),
	.input_valid(input_valid),
	.load(load),
	.load_success(),
	.output_valid(),
	.sof(sof),
	.o_sof(),
	.d_in(d_in[2]),
	.d_out(_5_addbus_[2])
);
conv2d #("weight/conv2d_1/5_3.txt", 0 /*dont use relu*/, 2, 0, 15, 15) conv2d_5_3(
	.clk(clk),
	.rst(rst),
	.input_valid(input_valid),
	.load(load),
	.load_success(),
	.output_valid(),
	.sof(sof),
	.o_sof(),
	.d_in(d_in[3]),
	.d_out(_5_addbus_[3])
);
sum_4 #(7) sum_5( 
        .clk(clk), 
        .rst(rst), 
        .input_valid(output_valid_affter_conv), 
        .data_out(d_out[5]), 
        .data_in_0(_5_addbus_[0]), 
        .data_in_1(_5_addbus_[1]), 
        .data_in_2(_5_addbus_[2]), 
        .data_in_3(_5_addbus_[3]) 
); 
wire [31:0] _6_addbus_[3:0];    
conv2d #("weight/conv2d_1/6_0.txt", 0 /*dont use relu*/, 2, 0, 15, 15) conv2d_6_0(
	.clk(clk),
	.rst(rst),
	.input_valid(input_valid),
	.load(load),
	.load_success(),
	.output_valid(),
	.sof(sof),
	.o_sof(),
	.d_in(d_in[0]),
	.d_out(_6_addbus_[0])
);
conv2d #("weight/conv2d_1/6_1.txt", 0 /*dont use relu*/, 2, 0, 15, 15) conv2d_6_1(
	.clk(clk),
	.rst(rst),
	.input_valid(input_valid),
	.load(load),
	.load_success(),
	.output_valid(),
	.sof(sof),
	.o_sof(),
	.d_in(d_in[1]),
	.d_out(_6_addbus_[1])
);
conv2d #("weight/conv2d_1/6_2.txt", 0 /*dont use relu*/, 2, 0, 15, 15) conv2d_6_2(
	.clk(clk),
	.rst(rst),
	.input_valid(input_valid),
	.load(load),
	.load_success(),
	.output_valid(),
	.sof(sof),
	.o_sof(),
	.d_in(d_in[2]),
	.d_out(_6_addbus_[2])
);
conv2d #("weight/conv2d_1/6_3.txt", 0 /*dont use relu*/, 2, 0, 15, 15) conv2d_6_3(
	.clk(clk),
	.rst(rst),
	.input_valid(input_valid),
	.load(load),
	.load_success(),
	.output_valid(),
	.sof(sof),
	.o_sof(),
	.d_in(d_in[3]),
	.d_out(_6_addbus_[3])
);
sum_4 #(7) sum_6( 
        .clk(clk), 
        .rst(rst), 
        .input_valid(output_valid_affter_conv), 
        .data_out(d_out[6]), 
        .data_in_0(_6_addbus_[0]), 
        .data_in_1(_6_addbus_[1]), 
        .data_in_2(_6_addbus_[2]), 
        .data_in_3(_6_addbus_[3]) 
); 
wire [31:0] _7_addbus_[3:0];    
conv2d #("weight/conv2d_1/7_0.txt", 0 /*dont use relu*/, 2, 0, 15, 15) conv2d_7_0(
	.clk(clk),
	.rst(rst),
	.input_valid(input_valid),
	.load(load),
	.load_success(),
	.output_valid(),
	.sof(sof),
	.o_sof(),
	.d_in(d_in[0]),
	.d_out(_7_addbus_[0])
);
conv2d #("weight/conv2d_1/7_1.txt", 0 /*dont use relu*/, 2, 0, 15, 15) conv2d_7_1(
	.clk(clk),
	.rst(rst),
	.input_valid(input_valid),
	.load(load),
	.load_success(),
	.output_valid(),
	.sof(sof),
	.o_sof(),
	.d_in(d_in[1]),
	.d_out(_7_addbus_[1])
);
conv2d #("weight/conv2d_1/7_2.txt", 0 /*dont use relu*/, 2, 0, 15, 15) conv2d_7_2(
	.clk(clk),
	.rst(rst),
	.input_valid(input_valid),
	.load(load),
	.load_success(),
	.output_valid(),
	.sof(sof),
	.o_sof(),
	.d_in(d_in[2]),
	.d_out(_7_addbus_[2])
);
conv2d #("weight/conv2d_1/7_3.txt", 0 /*dont use relu*/, 2, 0, 15, 15) conv2d_7_3(
	.clk(clk),
	.rst(rst),
	.input_valid(input_valid),
	.load(load),
	.load_success(),
	.output_valid(),
	.sof(sof),
	.o_sof(),
	.d_in(d_in[3]),
	.d_out(_7_addbus_[3])
);
sum_4 #(7) sum_7( 
        .clk(clk), 
        .rst(rst), 
        .input_valid(output_valid_affter_conv), 
        .data_out(d_out[7]), 
        .data_in_0(_7_addbus_[0]), 
        .data_in_1(_7_addbus_[1]), 
        .data_in_2(_7_addbus_[2]), 
        .data_in_3(_7_addbus_[3]) 
); 
endmodule