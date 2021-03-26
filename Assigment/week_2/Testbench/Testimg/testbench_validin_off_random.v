`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/12/2021 10:39:38 PM
// Design Name: 
// Module Name: tb_rgb_to_gray_top
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module tb_rgb_to_gray_top();
    parameter N = 496321; //496321; /*1182721*/
    reg clk;
    reg rst;
    reg is_rst;
    reg input_valid;
    wire output_valid;
    reg [7:0] R;
    reg [7:0] G;
    reg [7:0] B;
    reg [7:0] Red[N-1:0];
    reg [7:0] Green[N-1:0];
    reg [7:0] Blue[N-1:0];
    reg [31:0] Result;
    wire [31:0] GRAY;
    integer i;
    integer j;
    integer tmp;
initial begin
    $readmemb("Red.txt", Red);
    $readmemb("Green.txt", Green);
    $readmemb("Blue.txt", Blue);
    Result = $fopen("Result","w");
    tmp = 0;
    j = $urandom%2000;
    i = 0;
    clk = 1'b0;
    rst = 1'b1;
    is_rst = 1'b0;


end
/*---------------------------------------*/ 
/*-------------clk control---------------*/
/*---------------------------------------*/ 
always @ (clk) begin
    #10 clk <= !clk;
    tmp = tmp + 1;
end
/*---------------------------------------*/ 
/*-------------rst control---------------*/
/*---------------------------------------*/ 
always @ (posedge clk) begin
    if(!is_rst) begin
        #2;
        rst = 1'b0;
        is_rst = 1'b1;
    end
end 
/*---------------------------------------*/ 
/*-----------input control---------------*/
/*---------------------------------------*/ 
always @ (clk) begin
    //if(tmp >= 45 && tmp <= 60 || tmp >= 1120 && tmp <= 1500)
    if(tmp >= j && tmp <= (j + 40))
	input_valid = 1'b0;
    else if(is_rst & !clk)
        input_valid = 1'b1;
    else begin
        #2; 
        input_valid = 1'b0;
    end
end
always @ (posedge input_valid) begin
    R = Red[i];
    G = Green[i];
    B = Blue [i];
    if(output_valid == 1) begin
    	$fdisplay(Result,"%b",GRAY);
	i = i + 1;
    end
    if(i == N - 1) begin
        #1000;
        $finish;
    end
end
/*---------------------------------------*/ 
rgb_to_gray_top me_(
        .clk(clk),
        .rst(rst),
        .input_valid(input_valid),
        .output_valid(output_valid),
        .R(R),
        .G(G),
        .B(B),
        .GRAY(GRAY)
);
endmodule
