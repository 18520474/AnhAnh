module top
(
	input clk,
	input rst,
	input load,
	input input_valid,
	input sof,
	input [31:0] d_in,
	output output_valid,
	output [9:0] d_out,
	output load_weight_done
);
	wire layer_0_o_sof, layer_0_output_valid;
	wire [31:0] layer_0_d_out[3:0];
	conv2d_0 layer_0(                               
		.clk(clk),                                             
		.rst(rst),                                             
		.load(load),                                             
		.input_valid(input_valid),                                             
		.sof(sof),                                             
		.o_sof(layer_0_o_sof),                                             
		.load_success(load_weight_done),                                             
		.output_valid(layer_0_output_valid),                                      
		.d_out(layer_0_d_out),    
		.d_in(d_in)                                             
	); 
	wire max_polling_o_sof, max_polling_output_valid;
	wire [31:0] max_polling_d_out[3:0];
	max_polling my_max_polling(                               
		.clk(clk),                                             
		.rst(rst),                                             
		.input_valid(layer_0_output_valid),                                             
		.sof(layer_0_o_sof),                                             
		.o_sof(max_polling_o_sof),                                             
		.output_valid(max_polling_output_valid),                                      
		.d_out(max_polling_d_out),    
		.d_in(layer_0_d_out)  
	);
	wire layer_1_o_sof, layer_1_output_valid;
	wire [31:0] layer_1_d_out[7:0];
	conv2d_1 layer_1(                               
		.clk(clk),                                             
		.rst(rst),                                             
		.load(load),                                             
		.input_valid(max_polling_output_valid),                                             
		.sof(max_polling_o_sof),                                             
		.o_sof(layer_1_o_sof),                                                                                      
		.output_valid(layer_1_output_valid),                                      
		.d_out(layer_1_d_out), 
		.load_success(),    
		.d_in(max_polling_d_out)                                             
	);
	wire layer_2_o_sof, layer_2_output_valid;
	wire [31:0] layer_2_d_out[7:0];
	conv2d_2 layer_2(                               
		.clk(clk),                                             
		.rst(rst),                                             
		.load(load),                                             
		.input_valid(layer_1_output_valid),                                             
		.sof(layer_1_o_sof),                                             
		.o_sof(layer_2_o_sof),                                                                                      
		.output_valid(layer_2_output_valid),                                      
		.d_out(layer_2_d_out),    
		.d_in(layer_1_d_out)                                             
	);
	wire layer_3_o_sof, layer_3_output_valid;
	wire [31:0] layer_3_d_out[7:0];
	conv2d_3 layer_3(                               
		.clk(clk),                                             
		.rst(rst),                                             
		.load(load),                                             
		.input_valid(layer_2_output_valid),                                             
		.sof(layer_2_o_sof),                                             
		.o_sof(layer_3_o_sof),                                                                                      
		.output_valid(layer_3_output_valid),                                      
		.d_out(layer_3_d_out),    
		.d_in(layer_2_d_out)                                             
	);
	wire [31:0] add_0_d_out[7:0];
	wire add_0_output_valid;
	wire add_0_o_sof;
	add_2d my_add(
		.clk(clk),
		.rst(rst),
		.input_valid_layer(layer_3_output_valid),
		.input_valid_short_cut(layer_1_output_valid),
		.d_in_short_cut(layer_1_d_out),
		.d_in_layer(layer_3_d_out),
		.d_out(add_0_d_out),
		.output_valid(add_0_output_valid),
		.o_sof(add_0_o_sof)
	);
	wire layer_4_o_sof, layer_4_output_valid;
	wire [31:0] layer_4_d_out[15:0];
	conv2d_4 layer_4(                               
		.clk(clk),                                             
		.rst(rst),                                             
		.load(load),                                             
		.input_valid(add_0_output_valid),                                             
		.sof(add_0_o_sof),                                             
		.o_sof(layer_4_o_sof),                                                                                      
		.output_valid(layer_4_output_valid),                                      
		.d_out(layer_4_d_out),    
		.d_in(add_0_d_out)                                             
	);
	wire layer_5_o_sof, layer_5_output_valid;
	wire [31:0] layer_5_d_out[15:0];
	conv2d_5 layer_5(                               
		.clk(clk),                                             
		.rst(rst),                                             
		.load(load),                                             
		.input_valid(layer_4_output_valid),                                             
		.sof(layer_4_o_sof),                                             
		.o_sof(layer_5_o_sof),                                                                                      
		.output_valid(layer_5_output_valid),                                      
		.d_out(layer_5_d_out),    
		.d_in(layer_4_d_out)                                             
	);
	wire layer_6_o_sof, layer_6_output_valid;
	wire [31:0] layer_6_d_out[15:0];
	conv2d_6 layer_6(                               
		.clk(clk),                                             
		.rst(rst),                                             
		.load(load),                                             
		.input_valid(layer_5_output_valid),                                             
		.sof(layer_5_o_sof),                                             
		.o_sof(layer_6_o_sof),                                                                                      
		.output_valid(layer_6_output_valid),                                      
		.d_out(layer_6_d_out),    
		.d_in(layer_5_d_out)                                             
	);

	wire [31:0] add_1_d_out[15:0];
	wire add_1_output_valid;
	wire add_1_o_sof;
	add_2d_16 my_add_1(
		.clk(clk),
		.rst(rst),
		.input_valid_layer(layer_6_output_valid),
		.input_valid_short_cut(layer_4_output_valid),
		.d_in_short_cut(layer_4_d_out),
		.d_in_layer(layer_6_d_out),
		.d_out(add_1_d_out),
		.output_valid(add_1_output_valid),
		.o_sof(add_1_o_sof)
	);
	wire avg_polling_o_sof, avg_polling_output_valid;
	wire [31:0] avg_polling_d_out[15:0];
	avg_polling my_avg_polling(                               
		.clk(clk),                                             
		.rst(rst),                                             
		.input_valid(add_1_output_valid),                                             
		.sof(add_1_o_sof),                                             
		.o_sof(avg_polling_o_sof),                                             
		.output_valid(avg_polling_output_valid),                                      
		.d_out(avg_polling_d_out),    
		.d_in(add_1_d_out)  
	);
	wire fc_output_valid;
	wire [31:0] fc_d_out[9:0];
	Fully_Connected FC(
		.clk(clk),
		.rst(rst),
		.load(load),
		.input_valid(avg_polling_output_valid),
		.output_valid(fc_output_valid),
		.d_in(avg_polling_d_out),
		.d_out(fc_d_out)
	);
	wire [31:0] scale_d_out[9:0];
	scale m_scale(
		.d_in(fc_d_out),
		.d_out(scale_d_out)
	);
	wire softmax_output_valid;
	wire [31:0] soft_d_out[9:0];
	softmax my_soft(
		.clk(clk),
		.resetn(rst),
		.valid_in(fc_output_valid),
		.class0(scale_d_out[0]),
		.class1(scale_d_out[1]),
		.class2(scale_d_out[2]),
		.class3(scale_d_out[3]),
		.class4(scale_d_out[4]),
		.class5(scale_d_out[5]),
		.class6(scale_d_out[6]),
		.class7(scale_d_out[7]),
		.class8(scale_d_out[8]),
		.class9(scale_d_out[9]),
		.percent0(soft_d_out[0]),
		.percent1(soft_d_out[1]),
		.percent2(soft_d_out[2]),
		.percent3(soft_d_out[3]),
		.percent4(soft_d_out[4]),
		.percent5(soft_d_out[5]),
		.percent6(soft_d_out[6]),
		.percent7(soft_d_out[7]),
		.percent8(soft_d_out[8]),
		.percent9(soft_d_out[9]),
		.valid_out(softmax_output_valid)
    );
	hotone_encoder encoder(
		.clk(clk),
		.rst(rst),
		.input_valid(softmax_output_valid),
		.output_valid(output_valid),
		.d_in(soft_d_out),
		.d_out(d_out)
	);
endmodule
