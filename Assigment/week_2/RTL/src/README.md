# **RTL module**
## module convert RGB to grayscale using verilog accepts 8-bit RGB input (R, G, B) and output IEEE754 single-precision standard at GRAY port. 
## 5 stage pipeline
<img src="https://github.com/18520474/AnhAnh/blob/main/Assigment/week_2/RTL/img/3.png">

## resource:
<img src="https://github.com/18520474/AnhAnh/blob/main/Assigment/week_2/RTL/img/2.png">

## timing: fmax = 50Mhz (Zynq UltraScale+, part xazu5ev-sfvc784-1Q-q)
## schematic: 
<img src="https://github.com/18520474/AnhAnh/blob/main/Assigment/week_2/RTL/img/1.png">

## diagram
<img src="https://github.com/18520474/AnhAnh/blob/main/Assigment/week_2/RTL/img/diagram.png">

## top level module:
```verilog
module rgb_to_gray_top(
        clk,                /*input clock*/
        rst,                /*reset*/
        input_valid,        /*input ready*/
        output_valid,       /*output readly*/
        R,                  /*R channel input*/
        G,                  /*G channel input*/   
        B,                  /*B channel input*/
        GRAY                /*IEEE754 single-precision output Gray*/
    );
    input  wire        clk, rst, input_valid;
    output wire        output_valid;
    input  wire [7:0]  R, G, B;
    output wire [31:0] GRAY;
    
    
    wire [1:0] channel_mux, gain_mux; 
    wire       load_reg_en,   r_turn_reg_en, g_turn_reg_en, 
               b_turn_reg_en, result_reg_en;
    rgb_to_gray_controller control(
                    .clk(clk),
                    .rst(rst),
                    .input_valid(input_valid),
                    .output_valid(output_valid),
                    .channel_mux(channel_mux),
                    .gain_mux(gain_mux),
                    .load_reg_en(load_reg_en),
                    .r_turn_reg_en(r_turn_reg_en),
                    .g_turn_reg_en(g_turn_reg_en),
                    .b_turn_reg_en(b_turn_reg_en),
                    .result_reg_en(result_reg_en));
    rgb_to_gray_datapath datapath(
                    .clk(clk),
                    .rst(rst),
                    .channel_mux(channel_mux),
                    .gain_mux(gain_mux),
                    .load_reg_en(load_reg_en),
                    .r_turn_reg_en(r_turn_reg_en),
                    .g_turn_reg_en(g_turn_reg_en),
                    .b_turn_reg_en(b_turn_reg_en),
                    .result_reg_en(result_reg_en),
                    .R(R),
                    .G(G),
                    .B(B),
                    .GRAY(GRAY));
endmodule

    
