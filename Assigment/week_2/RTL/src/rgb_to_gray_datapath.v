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
        load_reg_en,
        turn_reg_en,
        none_scale_result_reg_en,
        scale_result_reg_en,
        R,
        G,
        B,
        GRAY,
        /*debug*/
        D
    );
    input  wire clk;
    input  wire [7:0] R, G, B;
    input  wire load_reg_en, turn_reg_en, none_scale_result_reg_en, scale_result_reg_en;
    output wire [31:0] GRAY, D;
    
    parameter r_gain =32'b00111110100110010000100101101100; /*0.2989*/ 
    parameter g_gain =32'b00111111000101100100010110100010; /*0.5870*/ 
    parameter b_gain =32'b00111101111010010111100011010101; /*0.1140*/ 
    parameter scale  =32'b00111011100000001000000010000000; /*1/255*/
    
    /*------------------------------------------*/
    /*-----------------stage 1------------------*/   
    /*------------------------------------------*/
    reg [31:0] r_reg, g_reg, b_reg;
    wire [31:0]   r_reg_bus, g_reg_bus, b_reg_bus;
    int_to_float R_convert(.int_input(R), .float_output(r_reg_bus));
    int_to_float G_convert(.int_input(G), .float_output(g_reg_bus));
    int_to_float B_convert(.int_input(B), .float_output(b_reg_bus));
    always @ (posedge clk) begin
        if(load_reg_en) begin
            r_reg <= r_reg_bus;
            g_reg <= g_reg_bus; 
            b_reg <= b_reg_bus;
        end else;
    end
    
    /*------------------------------------------*/
    /*-----------------stage 2------------------*/   
    /*------------------------------------------*/
    reg  [31:0]   r_turn_reg, g_turn_reg, b_turn_reg;
    wire [31:0]   r_turn_reg_bus, g_turn_reg_bus, b_turn_reg_bus;
    fp_mul R_mul(.A(r_reg), .B(r_gain), .OUT(r_turn_reg_bus));
    fp_mul G_mul(.A(g_reg), .B(g_gain), .OUT(g_turn_reg_bus));
    fp_mul B_mul(.A(b_reg), .B(b_gain), .OUT(b_turn_reg_bus));
    always @ (posedge clk) begin
        if(turn_reg_en) begin
            r_turn_reg <= r_turn_reg_bus;  
            g_turn_reg <= g_turn_reg_bus;
            b_turn_reg <= b_turn_reg_bus;
        end
    end
    
    /*------------------------------------------*/
    /*-----------------stage 3------------------*/   
    /*------------------------------------------*/
    wire [31:0] stage_3_add_bus, stage_3_add_output_bus;
    reg  [31:0] none_scale_result_reg;
    fp_adder add_1(.AddBar_Sub(1'b0), .a_operand(r_turn_reg), .b_operand(g_turn_reg), .result(stage_3_add_bus));
    fp_adder add_2(.AddBar_Sub(1'b0), .a_operand(b_turn_reg), .b_operand(stage_3_add_bus), .result(stage_3_add_output_bus));
    always @ (posedge clk) begin
        if(none_scale_result_reg_en) begin
            none_scale_result_reg <= stage_3_add_output_bus;
        end
    end
    assign D = stage_3_add_output_bus;
    /*------------------------------------------*/
    /*-----------------stage 4------------------*/   
    /*------------------------------------------*/
    reg [31:0] result_reg;
    wire [31:0] scale_bus;
    fp_mul scale_mul(.A(none_scale_result_reg), .B(scale), .OUT(scale_bus));
    always @ (posedge clk) begin
        if(scale_result_reg_en) begin
            result_reg <= scale_bus;
        end
    end
    assign GRAY = result_reg;
endmodule
