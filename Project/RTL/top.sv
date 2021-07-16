module top
(
	input clk,
	input rst,
	input load,
	input input_valid,
	input sof,
	input [31:0] d_in,
	output o_sof,
	output output_valid,
	output [31:0] d_out[15:0],
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
	wire layer_4_o_sof, layer_4_output_valid;
	wire [31:0] layer_4_d_out[15:0];
	conv2d_4 layer_4(                               
		.clk(clk),                                             
		.rst(rst),                                             
		.load(load),                                             
		.input_valid(layer_3_output_valid),                                             
		.sof(layer_3_o_sof),                                             
		.o_sof(layer_4_o_sof),                                                                                      
		.output_valid(layer_4_output_valid),                                      
		.d_out(layer_4_d_out),    
		.d_in(layer_3_d_out)                                             
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
	wire avg_polling_o_sof, avg_polling_output_valid;
	wire [31:0] avg_polling_d_out[15:0];
	avg_polling my_avg_polling(                               
		.clk(clk),                                             
		.rst(rst),                                             
		.input_valid(layer_6_output_valid),                                             
		.sof(layer_6_o_sof),                                             
		.o_sof(o_sof),                                             
		.output_valid(output_valid),                                      
		.d_out(avg_polling_d_out),    
		.d_in(layer_6_d_out)  
	);
	assign d_out = avg_polling_d_out;	
endmodule
