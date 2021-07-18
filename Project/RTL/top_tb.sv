`timescale 1ps/1ps
module top_tb;
    integer number_of_frame = 1;
    reg clk;
    reg rst;
    reg load;
    reg first;
    reg [31:0] d_in;
    integer file_in, file_out, scan_status;
    reg [15:0] random_wr;
    reg [15:0] random_rd;
/*------------- clock generator --------------------*/
initial begin
    clk = 0;
    forever #2 clk = !clk;
end
/*---------------- RESET --------------------------*/
initial begin
    file_in <= $fopen("input/9.txt","r"); // Read image file   
    file_out <= $fopen("output/result.txt", "w");  //write file
    first = 1;
    rst = 1;
    load = 0;
    #4; 
    rst = 0;
    load = 1;
    #4;
    load = 0;
    forever begin
        random_wr = $urandom%10;
        random_rd = $urandom%10;
        #4;
    end
end
wire [31:0] input_fifo_output;
wire input_fifo_buff_full;
wire input_fifo_buff_empty;
wire input_fifo_wr_en;
wire input_fifo_rd_en;
fifo input_fifo( 
    .clk(clk), 
    .rst(rst), 
    .buf_in(d_in), 
    .buf_out(input_fifo_output),
    .wr_en(input_fifo_wr_en),
    .rd_en(input_fifo_rd_en), 
    .buf_empty(input_fifo_buff_empty), 
    .buf_full(input_fifo_buff_full)
    );
wire load_weight_done;
wire [9:0] core_d_out;
wire core_output_valid;
reg core_input_valid;
reg core_sof;
top core(
	.clk(clk),
	.rst(rst),
	.load(load),
	.input_valid(core_input_valid),
	.sof(core_sof),
	.d_in(input_fifo_output),
	.output_valid(core_output_valid),
	.d_out(core_d_out),
	.load_weight_done(load_weight_done)
);
wire [9:0] output_fifo_output;
wire output_fifo_buff_empty;
reg output_fifo_rd_en;
fifo #(10) output_fifo( 
    .clk(clk), 
    .rst(rst), 
    .buf_in(core_d_out),
    .buf_out(output_fifo_output),
    .wr_en(core_output_valid),
    .rd_en(output_fifo_rd_en), 
    .buf_empty(output_fifo_buff_empty)
    );
//read out fifo
always @(posedge clk) begin
    if(!output_fifo_buff_empty) begin
        output_fifo_rd_en <= 1;
        #5;
        $fdisplayb(file_out, output_fifo_output);
        $finish;
    end else begin
        output_fifo_rd_en <= 0;
    end
end
//fifo input read request control
assign input_fifo_rd_en = (input_fifo_buff_empty) ? 1'b0 : random_rd[0];
always @(negedge clk) begin 
    if(load_weight_done && input_fifo_rd_en) begin
        #2;
        core_input_valid <= 1'b1;
        if(first == 1) begin
            core_sof <= 1;
            first <= 0;
        end else begin
            core_sof <= 0;
        end
    end else begin
        #2;
        core_input_valid <= 1'b0;
        core_sof <= 0;
    end
end
//fifo input write request control
assign input_fifo_wr_en = (input_fifo_buff_full) ? 1'b0 : random_wr[0];
always @(negedge clk) begin 
    if(load_weight_done && input_fifo_wr_en) begin
        scan_status <= $fscanf(file_in,"%b",d_in);
    end
end
endmodule