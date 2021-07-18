module Fully_Connected
(
	input clk,
	input rst,
	input load,
   input input_valid,
	output output_valid,
	input [31:0] d_in[15:0],
	output [31:0] d_out[9:0]
);
	FC_1_class #("weight/dense/0.txt") FC_0(.d_out(d_out[0]), .clk(clk), .rst(rst), .load(load), .input_valid(input_valid), .d_in(d_in));
	FC_1_class #("weight/dense/1.txt") FC_1(.d_out(d_out[1]), .clk(clk), .rst(rst), .load(load), .input_valid(input_valid), .d_in(d_in));
	FC_1_class #("weight/dense/2.txt") FC_2(.d_out(d_out[2]), .clk(clk), .rst(rst), .load(load), .input_valid(input_valid), .d_in(d_in));
	FC_1_class #("weight/dense/3.txt") FC_3(.d_out(d_out[3]), .clk(clk), .rst(rst), .load(load), .input_valid(input_valid), .d_in(d_in));
	FC_1_class #("weight/dense/4.txt") FC_4(.d_out(d_out[4]), .clk(clk), .rst(rst), .load(load), .input_valid(input_valid), .d_in(d_in));
	FC_1_class #("weight/dense/5.txt") FC_5(.d_out(d_out[5]), .clk(clk), .rst(rst), .load(load), .input_valid(input_valid), .d_in(d_in));
	FC_1_class #("weight/dense/6.txt") FC_6(.d_out(d_out[6]), .clk(clk), .rst(rst), .load(load), .input_valid(input_valid), .d_in(d_in));
	FC_1_class #("weight/dense/7.txt") FC_7(.d_out(d_out[7]), .clk(clk), .rst(rst), .load(load), .input_valid(input_valid), .d_in(d_in));
	FC_1_class #("weight/dense/8.txt") FC_8(.d_out(d_out[8]), .clk(clk), .rst(rst), .load(load), .input_valid(input_valid), .d_in(d_in));
	FC_1_class #("weight/dense/9.txt") FC_9(.d_out(d_out[9]), .clk(clk), .rst(rst), .load(load), .input_valid(input_valid), .d_in(d_in), .output_valid(output_valid));
endmodule