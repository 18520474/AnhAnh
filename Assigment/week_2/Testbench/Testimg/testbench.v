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
    parameter N = 496321; //496321; /*230400*/
    reg clk;
    reg rst;
    reg is_rst;
    reg input_valid;
    wire output_valid;
    reg [7:0] R;
    reg [7:0] G;
    reg [7:0] B;
    //reg [7:0] Red[N-1:0];
    //reg [7:0] Green[N-1:0];
    //reg [7:0] Blue[N-1:0];
    //reg [31:0] Result;
    wire [31:0] GRAY;
    integer Red;
    integer Green;
    integer Blue;
    integer Result;
    integer i;
    integer j;
initial begin
    Red = $fopen("/home/tuananh/Desktop/AnhAnh/Assigment/week_2/Result/text/Red.txt", "r");
    Green = $fopen("/home/tuananh/Desktop/AnhAnh/Assigment/week_2/Result/text/Green.txt", "r");
    Blue = $fopen("/home/tuananh/Desktop/AnhAnh/Assigment/week_2/Result/text/Blue.txt", "r");
    Result = $fopen("/home/tuananh/Desktop/AnhAnh/Assigment/week_2/Result/text/Result.txt","w");
    j = 1 + $urandom%20;
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
integer count = 0;
always @ (posedge clk && is_rst == 1) begin
    if(count == j) begin
        count = 0;
    end else begin
        count =  count + 1;
    end
end
always @ (count) begin
    if(count != 0) begin
        input_valid = 1;
    end else begin
        j = 1 + $urandom%20; // 
        input_valid = 0;
    end 
end
always @ (posedge clk) begin
    if(input_valid) begin
        $fscanf(Red, "%b\n", R);
        $fscanf(Green, "%b\n", G);
        $fscanf(Blue, "%b\n", B);
    end
end
/*---------------------------------------*/ 
/*-------------output control------------*/
/*---------------------------------------*/ 
always @ (posedge clk or output_valid) begin
    #3;
    if(output_valid == 1) begin
        i = i + 1;
        $fwrite(Result,"%b\n",GRAY);
    end
end
always @ (posedge clk) begin
    if(i == N - 1) begin
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
