module add_2d_16( //depth = 8
    input clk,
	input rst,
    input input_valid_layer,
	input input_valid_short_cut,
    input [31:0] d_in_short_cut[15:0],
    input [31:0] d_in_layer[15:0],
    output reg [31:0] d_out[15:0],
    output reg output_valid,
    output o_sof
    );

    output_control #(3, 3) my_output_control(
        .clk(clk),
        .rst(rst),
        .output_valid(output_valid),
        .o_sof(o_sof)
    );

    wire [31:0] fifo_d_out[15:0];
    wire fifo_rd_en;
    fifo input_fifo_0( .clk(clk), .rst(rst), .buf_in(d_in_short_cut[0]), .buf_out(fifo_d_out[0]), .wr_en(input_valid_short_cut), .rd_en(input_valid_layer) );
    fifo input_fifo_1( .clk(clk), .rst(rst), .buf_in(d_in_short_cut[1]), .buf_out(fifo_d_out[1]), .wr_en(input_valid_short_cut), .rd_en(input_valid_layer) );
    fifo input_fifo_2( .clk(clk), .rst(rst), .buf_in(d_in_short_cut[2]), .buf_out(fifo_d_out[2]), .wr_en(input_valid_short_cut), .rd_en(input_valid_layer) );
    fifo input_fifo_3( .clk(clk), .rst(rst), .buf_in(d_in_short_cut[3]), .buf_out(fifo_d_out[3]), .wr_en(input_valid_short_cut), .rd_en(input_valid_layer) );
    fifo input_fifo_4( .clk(clk), .rst(rst), .buf_in(d_in_short_cut[4]), .buf_out(fifo_d_out[4]), .wr_en(input_valid_short_cut), .rd_en(input_valid_layer) );
    fifo input_fifo_5( .clk(clk), .rst(rst), .buf_in(d_in_short_cut[5]), .buf_out(fifo_d_out[5]), .wr_en(input_valid_short_cut), .rd_en(input_valid_layer) );
    fifo input_fifo_6( .clk(clk), .rst(rst), .buf_in(d_in_short_cut[6]), .buf_out(fifo_d_out[6]), .wr_en(input_valid_short_cut), .rd_en(input_valid_layer) );
    fifo input_fifo_7( .clk(clk), .rst(rst), .buf_in(d_in_short_cut[7]), .buf_out(fifo_d_out[7]), .wr_en(input_valid_short_cut), .rd_en(input_valid_layer) );
    fifo input_fifo_8( .clk(clk), .rst(rst), .buf_in(d_in_short_cut[8]), .buf_out(fifo_d_out[8]), .wr_en(input_valid_short_cut), .rd_en(input_valid_layer) );
    fifo input_fifo_9( .clk(clk), .rst(rst), .buf_in(d_in_short_cut[9]), .buf_out(fifo_d_out[9]), .wr_en(input_valid_short_cut), .rd_en(input_valid_layer) );
    fifo input_fifo_10( .clk(clk), .rst(rst), .buf_in(d_in_short_cut[10]), .buf_out(fifo_d_out[10]), .wr_en(input_valid_short_cut), .rd_en(input_valid_layer) );
    fifo input_fifo_11( .clk(clk), .rst(rst), .buf_in(d_in_short_cut[11]), .buf_out(fifo_d_out[11]), .wr_en(input_valid_short_cut), .rd_en(input_valid_layer) );
    fifo input_fifo_12( .clk(clk), .rst(rst), .buf_in(d_in_short_cut[12]), .buf_out(fifo_d_out[12]), .wr_en(input_valid_short_cut), .rd_en(input_valid_layer) );
    fifo input_fifo_13( .clk(clk), .rst(rst), .buf_in(d_in_short_cut[13]), .buf_out(fifo_d_out[13]), .wr_en(input_valid_short_cut), .rd_en(input_valid_layer) );
    fifo input_fifo_14( .clk(clk), .rst(rst), .buf_in(d_in_short_cut[14]), .buf_out(fifo_d_out[14]), .wr_en(input_valid_short_cut), .rd_en(input_valid_layer) );
    fifo input_fifo_15( .clk(clk), .rst(rst), .buf_in(d_in_short_cut[15]), .buf_out(fifo_d_out[15]), .wr_en(input_valid_short_cut), .rd_en(input_valid_layer) );

    reg [31:0] stage_0_d_in_layer_delay[15:0];
    reg stage_0_output_valid;
    always @(posedge clk or posedge rst) begin
        if(rst) begin 
            stage_0_d_in_layer_delay[0] <= 32'd0;
            stage_0_d_in_layer_delay[1] <= 32'd0;
            stage_0_d_in_layer_delay[2] <= 32'd0;
            stage_0_d_in_layer_delay[3] <= 32'd0;
            stage_0_d_in_layer_delay[4] <= 32'd0;
            stage_0_d_in_layer_delay[5] <= 32'd0;
            stage_0_d_in_layer_delay[6] <= 32'd0;
            stage_0_d_in_layer_delay[7] <= 32'd0;
            stage_0_d_in_layer_delay[8] <= 32'd0;
            stage_0_d_in_layer_delay[9] <= 32'd0;
            stage_0_d_in_layer_delay[10] <= 32'd0;
            stage_0_d_in_layer_delay[11] <= 32'd0;
            stage_0_d_in_layer_delay[12] <= 32'd0;
            stage_0_d_in_layer_delay[13] <= 32'd0;
            stage_0_d_in_layer_delay[14] <= 32'd0;
            stage_0_d_in_layer_delay[15] <= 32'd0;
            stage_0_output_valid <= 0;
        end else if(input_valid_layer) begin
            stage_0_d_in_layer_delay[0] <= d_in_layer[0];
            stage_0_d_in_layer_delay[1] <= d_in_layer[1];
            stage_0_d_in_layer_delay[2] <= d_in_layer[2];
            stage_0_d_in_layer_delay[3] <= d_in_layer[3];
            stage_0_d_in_layer_delay[4] <= d_in_layer[4];
            stage_0_d_in_layer_delay[5] <= d_in_layer[5];
            stage_0_d_in_layer_delay[6] <= d_in_layer[6];
            stage_0_d_in_layer_delay[7] <= d_in_layer[7];
            stage_0_d_in_layer_delay[8] <= d_in_layer[8];
            stage_0_d_in_layer_delay[9] <= d_in_layer[9];
            stage_0_d_in_layer_delay[10] <= d_in_layer[10];
            stage_0_d_in_layer_delay[11] <= d_in_layer[11];
            stage_0_d_in_layer_delay[12] <= d_in_layer[12];
            stage_0_d_in_layer_delay[13] <= d_in_layer[13];
            stage_0_d_in_layer_delay[14] <= d_in_layer[14];
            stage_0_d_in_layer_delay[15] <= d_in_layer[15];
            stage_0_output_valid <= 1;
        end else begin
            stage_0_output_valid <= 0;
        end
    end
    
    wire [31:0] stage_1_add_result[15:0];
    fp_adder stage_1_add_0(.a_operand(stage_0_d_in_layer_delay[0]), .b_operand(fifo_d_out[0]), .AddBar_Sub(1'b0) , .result(stage_1_add_result[0]));
    fp_adder stage_1_add_1(.a_operand(stage_0_d_in_layer_delay[1]), .b_operand(fifo_d_out[1]), .AddBar_Sub(1'b0) , .result(stage_1_add_result[1]));
    fp_adder stage_1_add_2(.a_operand(stage_0_d_in_layer_delay[2]), .b_operand(fifo_d_out[2]), .AddBar_Sub(1'b0) , .result(stage_1_add_result[2]));
    fp_adder stage_1_add_3(.a_operand(stage_0_d_in_layer_delay[3]), .b_operand(fifo_d_out[3]), .AddBar_Sub(1'b0) , .result(stage_1_add_result[3]));
    fp_adder stage_1_add_4(.a_operand(stage_0_d_in_layer_delay[4]), .b_operand(fifo_d_out[4]), .AddBar_Sub(1'b0) , .result(stage_1_add_result[4]));
    fp_adder stage_1_add_5(.a_operand(stage_0_d_in_layer_delay[5]), .b_operand(fifo_d_out[5]), .AddBar_Sub(1'b0) , .result(stage_1_add_result[5]));
    fp_adder stage_1_add_6(.a_operand(stage_0_d_in_layer_delay[6]), .b_operand(fifo_d_out[6]), .AddBar_Sub(1'b0) , .result(stage_1_add_result[6]));
    fp_adder stage_1_add_7(.a_operand(stage_0_d_in_layer_delay[7]), .b_operand(fifo_d_out[7]), .AddBar_Sub(1'b0) , .result(stage_1_add_result[7]));
    fp_adder stage_1_add_8(.a_operand(stage_0_d_in_layer_delay[8]), .b_operand(fifo_d_out[8]), .AddBar_Sub(1'b0) , .result(stage_1_add_result[8]));
    fp_adder stage_1_add_9(.a_operand(stage_0_d_in_layer_delay[9]), .b_operand(fifo_d_out[9]), .AddBar_Sub(1'b0) , .result(stage_1_add_result[9]));
    fp_adder stage_1_add_10(.a_operand(stage_0_d_in_layer_delay[10]), .b_operand(fifo_d_out[10]), .AddBar_Sub(1'b0) , .result(stage_1_add_result[10]));
    fp_adder stage_1_add_11(.a_operand(stage_0_d_in_layer_delay[11]), .b_operand(fifo_d_out[11]), .AddBar_Sub(1'b0) , .result(stage_1_add_result[11]));
    fp_adder stage_1_add_12(.a_operand(stage_0_d_in_layer_delay[12]), .b_operand(fifo_d_out[12]), .AddBar_Sub(1'b0) , .result(stage_1_add_result[12]));
    fp_adder stage_1_add_13(.a_operand(stage_0_d_in_layer_delay[13]), .b_operand(fifo_d_out[13]), .AddBar_Sub(1'b0) , .result(stage_1_add_result[13]));
    fp_adder stage_1_add_14(.a_operand(stage_0_d_in_layer_delay[14]), .b_operand(fifo_d_out[14]), .AddBar_Sub(1'b0) , .result(stage_1_add_result[14]));
    fp_adder stage_1_add_15(.a_operand(stage_0_d_in_layer_delay[15]), .b_operand(fifo_d_out[15]), .AddBar_Sub(1'b0) , .result(stage_1_add_result[15]));

    always @(posedge clk or posedge rst) begin
        if(rst) begin 
            d_out[0] <= 32'd0;
            d_out[1] <= 32'd0;
            d_out[2] <= 32'd0;
            d_out[3] <= 32'd0;
            d_out[4] <= 32'd0;
            d_out[5] <= 32'd0;
            d_out[6] <= 32'd0;
            d_out[7] <= 32'd0;
            d_out[8] <= 32'd0;
            d_out[9] <= 32'd0;
            d_out[10] <= 32'd0;
            d_out[11] <= 32'd0;
            d_out[12] <= 32'd0;
            d_out[13] <= 32'd0;
            d_out[14] <= 32'd0;
            d_out[15] <= 32'd0;
            output_valid <= 0;
        end else if(stage_0_output_valid) begin
            d_out[0] <= stage_1_add_result[0];
            d_out[1] <= stage_1_add_result[1];
            d_out[2] <= stage_1_add_result[2];
            d_out[3] <= stage_1_add_result[3];
            d_out[4] <= stage_1_add_result[4];
            d_out[5] <= stage_1_add_result[5];
            d_out[6] <= stage_1_add_result[6];
            d_out[7] <= stage_1_add_result[7];
            d_out[8] <= stage_1_add_result[8];
            d_out[9] <= stage_1_add_result[9];
            d_out[10] <= stage_1_add_result[10];
            d_out[11] <= stage_1_add_result[11];
            d_out[12] <= stage_1_add_result[12];
            d_out[13] <= stage_1_add_result[13];
            d_out[14] <= stage_1_add_result[14];
            d_out[15] <= stage_1_add_result[15];
            output_valid <= 1;
        end else begin
            output_valid <= 0;
        end
    end
endmodule