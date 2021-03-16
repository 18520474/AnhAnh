`timescale 1ns / 1ps
`include "rgb_to_gray_datapath.v"
`include "rgb_to_gray_controller.v"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/12/2021 10:24:56 PM
// Design Name: 
// Module Name: rgb_to_gray_top
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


module rgb_to_gray_top(
        clk,
        rst,
        input_valid,
        output_valid,
        R,
        G,
        B,
        GRAY
    );
    input  wire        clk, rst, input_valid;
    output wire        output_valid;
    input  wire [7:0]  R, G, B;
    output wire [31:0] GRAY;
    
    
    wire [1:0] channel_mux, gain_mux; 
    wire  load_reg_en, turn_reg_en, none_scale_result_reg_en, scale_result_reg_en;
    rgb_to_gray_controller control(
                    .clk(clk),
                    .rst(rst),
                    .input_valid(input_valid),
                    .output_valid(output_valid),
                    .load_reg_en(load_reg_en),
                    .turn_reg_en(turn_reg_en),
                    .none_scale_result_reg_en(none_scale_result_reg_en),
                    .scale_result_reg_en(scale_result_reg_en)
    );
    rgb_to_gray_datapath datapath(
                    .clk(clk),
                    .load_reg_en(load_reg_en),
                    .turn_reg_en(turn_reg_en),
                    .none_scale_result_reg_en(none_scale_result_reg_en),
                    .scale_result_reg_en(scale_result_reg_en),
                    .R(R),
                    .G(G),
                    .B(B),
                    .GRAY(GRAY)
    );
endmodule
