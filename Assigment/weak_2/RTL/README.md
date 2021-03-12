# RTL module
## module convert RGB to grayscale using verilog accepts 8-bit RGB input (R, G, B) and output IEEE754 single-precision standard at GRAY port. 
## resource LUT 605
<img src="https://github.com/18520474/AnhAnh/blob/main/Assigment/weak_2/RTL/img/1.png">
 
## latency: 6 clock per pixel
<img src="https://github.com/18520474/AnhAnh/blob/main/Assigment/weak_2/RTL/img/1.png">

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

    