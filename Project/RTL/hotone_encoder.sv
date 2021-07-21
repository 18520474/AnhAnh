module hotone_encoder
(
	input  clk,
	input  rst,
	input  input_valid,
	output reg   output_valid,
	input [31:0] d_in[9:0],
	output reg [9:0] d_out
);
	reg [31:0]    stage_1_d_in_0, stage_1_d_in_1,
				  stage_1_d_in_2, stage_1_d_in_3,
				  stage_1_d_in_4, stage_1_d_in_5,
				  stage_1_d_in_6, stage_1_d_in_7,
				  stage_1_d_in_8, stage_1_d_in_9;
	always @ (posedge clk or posedge rst) begin
		if(rst) begin
			stage_1_d_in_0 <= 31'd0;
			stage_1_d_in_1 <= 31'd0;
			stage_1_d_in_2 <= 31'd0;
			stage_1_d_in_3 <= 31'd0;
			stage_1_d_in_4 <= 31'd0;
			stage_1_d_in_5 <= 31'd0;
			stage_1_d_in_6 <= 31'd0;
			stage_1_d_in_7 <= 31'd0;
			stage_1_d_in_8 <= 31'd0;
			stage_1_d_in_9 <= 31'd0;
		end else if(input_valid) begin
			stage_1_d_in_0 <= d_in[0];
			stage_1_d_in_1 <= d_in[1];
			stage_1_d_in_2 <= d_in[2];
			stage_1_d_in_3 <= d_in[3];
			stage_1_d_in_4 <= d_in[4];
			stage_1_d_in_5 <= d_in[5];
			stage_1_d_in_6 <= d_in[6];
			stage_1_d_in_7 <= d_in[7];
			stage_1_d_in_8 <= d_in[8];
			stage_1_d_in_9 <= d_in[9];
		end 
	end
	wire [31:0] max_output;
	wire 	    max_output_valid;
	max10 my_max(
		.clk(clk),
		.rst(rst),
		.input_valid(input_valid),
		.output_valid(max_output_valid),
		.d_in_0(d_in[0]),
		.d_in_1(d_in[1]),
		.d_in_2(d_in[2]),
		.d_in_3(d_in[3]),
		.d_in_4(d_in[4]),
		.d_in_5(d_in[5]),
		.d_in_6(d_in[6]),
		.d_in_7(d_in[7]),
		.d_in_8(d_in[8]),
		.d_in_9(d_in[9]),
		.d_out(max_output)
	);
	reg [31:0] stage_2_d_in_0, stage_2_d_in_1,
				  stage_2_d_in_2, stage_2_d_in_3,
				  stage_2_d_in_4, stage_2_d_in_5,
				  stage_2_d_in_6, stage_2_d_in_7,
				  stage_2_d_in_8, stage_2_d_in_9;
	always @ (posedge clk or posedge rst) begin
		if(rst) begin
			stage_2_d_in_0 <= 31'd0;
			stage_2_d_in_1 <= 31'd0;
			stage_2_d_in_2 <= 31'd0;
			stage_2_d_in_3 <= 31'd0;
			stage_2_d_in_4 <= 31'd0;
			stage_2_d_in_5 <= 31'd0;
			stage_2_d_in_6 <= 31'd0;
			stage_2_d_in_7 <= 31'd0;
			stage_2_d_in_8 <= 31'd0;
			stage_2_d_in_9 <= 31'd0;
		end else begin
			stage_2_d_in_0 <= stage_1_d_in_0;
			stage_2_d_in_1 <= stage_1_d_in_1;
			stage_2_d_in_2 <= stage_1_d_in_2;
			stage_2_d_in_3 <= stage_1_d_in_3;
			stage_2_d_in_4 <= stage_1_d_in_4;
			stage_2_d_in_5 <= stage_1_d_in_5;
			stage_2_d_in_6 <= stage_1_d_in_6;
			stage_2_d_in_7 <= stage_1_d_in_7;
			stage_2_d_in_8 <= stage_1_d_in_8;
			stage_2_d_in_9 <= stage_1_d_in_9;
		end 
	end
	/*bug*/
	always @ (posedge clk or posedge rst) begin
		if(rst) begin
			output_valid <= 1'b0;
			d_out <= 10'd0;
		end else begin
			output_valid <= max_output_valid;
			if(max_output == stage_2_d_in_0)
				d_out <= 10'b1000000000;
			else if(max_output == stage_2_d_in_1)
				d_out <= 10'b0100000000;
			else if(max_output == stage_2_d_in_2)
				d_out <= 10'b0010000000;
			else if(max_output == stage_2_d_in_3)
				d_out <= 10'b0001000000;
			else if(max_output == stage_2_d_in_4)
				d_out <= 10'b0000100000;
			else if(max_output == stage_2_d_in_5)
				d_out <= 10'b0000010000;
			else if(max_output == stage_2_d_in_6)
				d_out <= 10'b0000001000;
			else if(max_output == stage_2_d_in_7)
				d_out <= 10'b0000000100;
			else if(max_output == stage_2_d_in_8)
				d_out <= 10'b0000000010;
			else if(max_output == stage_2_d_in_9)
				d_out <= 10'b0000000001;
		end
	end	
endmodule