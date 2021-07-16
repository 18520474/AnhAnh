`timescale 1ps/1ps
module top_tb;
    reg clk;
    reg rst;
    reg input_valid;
    reg sof;
    reg load;
    reg [31:0] d_in;
    integer file_in, file_out, scan_status; 
    integer input_count = 0;
    integer output_valid_count = 0;
    integer x = 0;
    integer y = 0;
/*------------- clock generator --------------------*/
initial begin
    clk = 0;
    forever #2 clk = !clk;
end
/*---------------- RESET --------------------------*/
initial begin
    file_in <= $fopen("input/gray.txt","r"); // Read image file   
    file_out <= $fopen("output/result.txt", "w");  //write file
    rst = 1;
    load = 0;
    #4; 
    rst = 0;
    load = 1;
    #4;
    load = 0;
end

wire load_weight_done;
wire [31:0] d_out[15:0];
wire output_valid;
wire o_sof;
top my_top(
	.clk(clk),
	.rst(rst),
	.load(load),
	.input_valid(input_valid),
	.sof(sof),
	.d_in(d_in),
	.o_sof(o_sof),
	.output_valid(output_valid),
	.d_out(d_out),
	.load_weight_done(load_weight_done)
);

always @(posedge output_valid) begin
    y <= y + 1;
    if(y == 2) begin
        y <= 0;
        x <= x + 1;
    end
    output_valid_count <= output_valid_count + 1;
    $fdisplay(file_out, "index [%0t][%0t]", x, y);
    $fdisplayb(file_out, d_out[0]);
    $fdisplayb(file_out, d_out[1]);
    $fdisplayb(file_out, d_out[2]);
    $fdisplayb(file_out, d_out[3]);
    
    $fdisplayb(file_out, d_out[4]);
    $fdisplayb(file_out, d_out[5]);
    $fdisplayb(file_out, d_out[6]);
    $fdisplayb(file_out, d_out[7]);
    
    
    $fdisplayb(file_out, d_out[8]);
    $fdisplayb(file_out, d_out[9]);
    $fdisplayb(file_out, d_out[10]);
    $fdisplayb(file_out, d_out[11]);

    $fdisplayb(file_out, d_out[12]);
    $fdisplayb(file_out, d_out[13]);
    $fdisplayb(file_out, d_out[14]);
    $fdisplayb(file_out, d_out[15]);
    
    if(output_valid_count == 1) begin
        $finish;
        //#fclose(file_out);
    end
    
end

always @(negedge clk) begin
    if(!rst && load_weight_done) begin
        #4;
        scan_status = $fscanf(file_in,"%b",d_in);
        input_valid <= 1'b1;
        input_count <= input_count + 1;
    end
end

always @* begin
    if(input_count == 1) begin
        sof = 1;
    end else begin
        sof = 0;
    end
end

endmodule