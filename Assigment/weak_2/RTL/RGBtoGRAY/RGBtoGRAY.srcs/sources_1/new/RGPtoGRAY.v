`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/11/2021 08:25:22 PM
// Design Name: 
// Module Name: RGPtoGRAY
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


module RGPtoGRAY(
        clk,    /*clk inout*/
        R,      /*R channel input*/      
        B,      /*B channel input*/
        G,      /*G channel input*/
        GRAY    /*GRAY output*/
    );
    input  wire clk;
    input  wire [7:0] R, G, B;
    output wire [31:0] GRAY;
    assign GRAY = R | B | G;
    
endmodule
