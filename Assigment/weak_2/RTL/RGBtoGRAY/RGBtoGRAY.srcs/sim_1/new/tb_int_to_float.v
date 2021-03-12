`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/11/2021 09:12:53 PM
// Design Name: 
// Module Name: tb_int_to_float
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


module tb_int_to_float(

    );
    reg  [31:0] int_input;
    wire [31:0] float_output;
    initial begin
        int_input = 8'd255;
        #10;
        $finish;
    end
    int_to_float my_int_to_float(.int_input(int_input), .float_output(float_output));
endmodule
