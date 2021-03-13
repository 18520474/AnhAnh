`timescale 1ns / 1ps
`include "fp_mul.v"
`include "fp_adder.v"
`include "int_to_float.v"
//////////////////////////////////////////////////////////////////////////////////
// Created by: Nguyen Pham The Anh 
// 
// Create Date: 03/12/2021 09:50:55 PM
// Module Name: rgb_to_gray_datapath
// Project Name: RGB to grayscale converter
// Description: Datapath
//////////////////////////////////////////////////////////////////////////////////
module rgb_to_gray_datapath(
        clk,
        rst,
        channel_mux,
        gain_mux,
        load_reg_en,
        r_turn_reg_en,
        g_turn_reg_en,
        b_turn_reg_en,
        result_reg_en,
        R,
        G,
        B,
        GRAY
    );
    input  wire clk, rst;
    input  wire [7:0] R, G, B;
    input  wire load_reg_en,   r_turn_reg_en, g_turn_reg_en, 
               b_turn_reg_en,  result_reg_en;
    input  wire [1:0] channel_mux, gain_mux; 
    output reg [31:0] GRAY;
    
    parameter r_gain =32'b00111110100110010000100101101100; /*0.2989*/ 
    parameter g_gain =32'b00111111000101100100010110100010; /*0.5870*/ 
    parameter b_gain =32'b00111101111010010111100011010101; /*0.1140*/ 
    
    parameter r_ss = 2'd0;
    parameter g_ss = 2'd1;
    parameter b_ss = 2'd2;
    
    wire [31:0]   gain;
    wire [31:0]   channel;
    wire [31:0]   turn_return_bus;
    wire [31:0]   fp_add_bus, fp_add_result_bus;
    wire [31:0]   r_reg_bus, g_reg_bus, b_reg_bus;
    reg  [31:0]   r_reg, g_reg, b_reg;
    reg  [31:0]   r_turn_reg, g_turn_reg, b_turn_reg;
    
    assign gain    =  (gain_mux == r_ss) ? r_gain:
                      (gain_mux == g_ss) ? g_gain:
                      (gain_mux == b_ss) ? b_gain:
                                            32'd0;
    assign channel =  (channel_mux == r_ss) ? r_reg:
                      (channel_mux == g_ss) ? g_reg:
                      (channel_mux == b_ss) ? b_reg:
                                               8'd0;
    // instance                                           
    int_to_float R_convert(.int_input(R), .float_output(r_reg_bus));
    int_to_float G_convert(.int_input(G), .float_output(g_reg_bus));
    int_to_float B_convert(.int_input(B), .float_output(b_reg_bus));
    fp_mul       my_fp_mul(.A(channel), .B(gain), .OUT(turn_return_bus));
    fp_adder     my_fp_add_1(.a_operand(r_turn_reg),
                             .b_operand(g_turn_reg), 
                             .AddBar_Sub(1'b0), /*add mode*/	              
                             .result(fp_add_bus));
    fp_adder     my_fp_add_2(.a_operand(fp_add_bus),
                             .b_operand(b_turn_reg), 
                             .AddBar_Sub(1'b0), /*add mode*/	              
                             .result(fp_add_result_bus));
    
    always @ (posedge clk or posedge rst) begin
        if(rst) begin
            r_reg      <= 32'd0;
            g_reg      <= 32'd0; 
            b_reg      <= 32'd0;
            r_turn_reg <= 32'd0;
            g_turn_reg <= 32'd0;
            b_turn_reg <= 32'd0;
            GRAY       <= 32'd0; 
        end
        else if(load_reg_en) begin
            r_reg <= r_reg_bus;
            g_reg <= g_reg_bus; 
            b_reg <= b_reg_bus;
        end 
        else if (r_turn_reg_en) r_turn_reg <= turn_return_bus;
        else if (g_turn_reg_en) g_turn_reg <= turn_return_bus;
        else if (b_turn_reg_en) b_turn_reg <= turn_return_bus;
        else if (result_reg_en) GRAY       <= fp_add_result_bus;    
        else;
    end    
endmodule
