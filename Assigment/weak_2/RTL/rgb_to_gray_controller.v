`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Created by: Nguyen Pham The Anh 
// 
// Create Date: 03/12/2021 09:20:17 PM
// Module Name: rgb_to_gray_controller
// Project Name: RGB to grayscale converter
// Description: FSM controller
//////////////////////////////////////////////////////////////////////////////////


module rgb_to_gray_controller(
        clk,
        rst,
        input_valid,
        output_valid,
        channel_mux,
        gain_mux,
        load_reg_en,
        r_turn_reg_en,
        g_turn_reg_en,
        b_turn_reg_en,
        result_reg_en
    );
    input  wire clk, rst, input_valid;
    output reg output_valid  , load_reg_en, 
               r_turn_reg_en , g_turn_reg_en, 
               b_turn_reg_en , result_reg_en;
    output reg [1:0] channel_mux, gain_mux; 
    
    parameter load_state   = 3'd0;
    parameter r_state      = 3'd1;
    parameter g_state      = 3'd2;
    parameter b_state      = 3'd3;
    parameter sum_state    = 3'd4;
    parameter return_state = 3'd5;
 
    parameter r_ss = 2'd0;
    parameter g_ss = 2'd1;
    parameter b_ss = 2'd2;
 
    reg [2:0] state;
    //next state
    always @ (posedge clk or posedge rst) begin
        if (rst) begin
            state <= load_state;
        end else if (state == load_state && input_valid) begin
            state <= r_state;
        end else if (state == r_state) begin
            state <= g_state;
        end else if (state == g_state) begin
            state <= b_state;
        end else if (state == b_state) begin
            state <= sum_state;
        end else if (state == sum_state) begin
            state <= return_state;
        end else begin
            state <= load_state;
        end
    end 
    //output
    always @ (state) begin
        output_valid  = 1'b0;
        load_reg_en   = 1'b0;
        r_turn_reg_en = 1'b0; 
        g_turn_reg_en = 1'b0; 
        b_turn_reg_en = 1'b0; 
        result_reg_en = 1'b0; 
        channel_mux   = 2'b0; 
        gain_mux      = 2'b0; 
        case (state)
            load_state: load_reg_en = 1'b1;
            r_state   : begin
                            r_turn_reg_en = 1'b1;
                            channel_mux   = r_ss;
                            gain_mux      = r_ss;
                        end 
            g_state   : begin
                            g_turn_reg_en = 1'b1;
                            channel_mux   = g_ss;
                            gain_mux      = g_ss;
                        end 
            b_state   : begin
                            b_turn_reg_en = 1'b1;
                            channel_mux   = b_ss;
                            gain_mux      = b_ss;
                        end   
            sum_state    : result_reg_en = 1'b1;
            return_state : output_valid  = 1'b1;
            default;
        endcase
    end
endmodule
