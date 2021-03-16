`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/12/2021 09:20:17 PM
// Design Name: 
// Module Name: rgb_to_gray_controller
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


module rgb_to_gray_controller(
        clk,
        rst,
        input_valid,
        output_valid,
        load_reg_en,
        turn_reg_en,
        none_scale_result_reg_en,
        scale_result_reg_en
    );
    input  wire clk, rst, input_valid;
    output reg output_valid, 
               load_reg_en,
               turn_reg_en,
               none_scale_result_reg_en,
               scale_result_reg_en;
    /*----------------------------------------*/
    /*---------------stage 1------------------*/
    /*----------------------------------------*/
    reg turn_reg_en_s1, none_scale_result_reg_en_s1, scale_result_reg_en_s1, output_valid_s1;
    always @ (posedge clk or posedge rst) begin
        if(rst) begin
            load_reg_en <= 1'b0;
            turn_reg_en_s1 <= 1'b0;
            none_scale_result_reg_en_s1 <= 1'b0;
            scale_result_reg_en_s1 <= 1'b0;
            output_valid_s1 <= 1'b0;
        end else if(input_valid) begin
            load_reg_en <= 1'b1;
            turn_reg_en_s1 <= 1'b1;
            none_scale_result_reg_en_s1 <= 1'b1;
            scale_result_reg_en_s1 <= 1'b1;
            output_valid_s1 <= 1'b1;
        end else begin
            load_reg_en <= 1'b0;
            turn_reg_en_s1 <= 1'b0;
            none_scale_result_reg_en_s1 <= 1'b0;
            scale_result_reg_en_s1 <= 1'b0;
            output_valid_s1 <= 1'b0;
            
        end
    end
    /*----------------------------------------*/
    /*---------------stage 2------------------*/
    /*----------------------------------------*/
    reg none_scale_result_reg_en_s2, scale_result_reg_en_s2, output_valid_s2;
    always @ (posedge clk or posedge rst) begin
        if(rst) begin
            turn_reg_en <= 1'b0;
            none_scale_result_reg_en_s2 <= 1'b0;
            scale_result_reg_en_s2 <= 1'b0;
            output_valid_s2 <= 1'b0;
        end else begin
            turn_reg_en <= turn_reg_en_s1;
            none_scale_result_reg_en_s2 <= none_scale_result_reg_en_s1;
            scale_result_reg_en_s2 <= scale_result_reg_en_s1;
            output_valid_s2 <= output_valid_s1;
        end
    end
    /*----------------------------------------*/
    /*---------------stage 3------------------*/
    /*----------------------------------------*/
    reg scale_result_reg_en_s3, output_valid_s3;
    always @ (posedge clk or posedge rst) begin
        if(rst) begin
            none_scale_result_reg_en <= 1'b0;
            scale_result_reg_en_s3 <= 1'b0;
            output_valid_s3 <= 1'b0;
        end else begin
            none_scale_result_reg_en <= none_scale_result_reg_en_s2;
            scale_result_reg_en_s3 <= scale_result_reg_en_s2;
            output_valid_s3 <= output_valid_s2;
        end
    end
    /*----------------------------------------*/
    /*---------------stage 4------------------*/
    /*----------------------------------------*/    
    reg output_valid_s4;
    always @ (posedge clk or posedge rst) begin
        if(rst) begin
            scale_result_reg_en <= 1'b0;
            output_valid_s4 <= 1'b0;
        end else begin
            scale_result_reg_en <= scale_result_reg_en_s3;
            output_valid_s4 <= output_valid_s3;
        end
    end
    /*----------------------------------------*/
    /*---------------stage 5------------------*/
    /*----------------------------------------*/
    always @ (posedge clk or posedge rst) 
        if(rst)
            output_valid <= 1'b0;
        else
            output_valid <= output_valid_s4;
endmodule
