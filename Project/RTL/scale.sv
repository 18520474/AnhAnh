module scale(
    input [31:0] d_in[9:0],
    output [31:0] d_out[9:0]
);
    parameter scale_param  = 32'b00111010000000110001001001101111;
    wire [31:0] mul_result[9:0];

    fp_mul mul_0(.A(d_in[0]), .B(scale_param), .OUT(mul_result[0]));
    assign d_out[0] = (d_in[0] == 32'd0) ? 32'd0 : mul_result[0];

    fp_mul mul_1(.A(d_in[1]), .B(scale_param), .OUT(mul_result[1]));
    assign d_out[1] = (d_in[1] == 32'd0) ? 32'd0 : mul_result[1];

    fp_mul mul_2(.A(d_in[2]), .B(scale_param), .OUT(mul_result[2]));
    assign d_out[2] = (d_in[2] == 32'd0) ? 32'd0 : mul_result[2];

    fp_mul mul_3(.A(d_in[3]), .B(scale_param), .OUT(mul_result[3]));
    assign d_out[3] = (d_in[3] == 32'd0) ? 32'd0 : mul_result[3];

    fp_mul mul_4(.A(d_in[4]), .B(scale_param), .OUT(mul_result[4]));
    assign d_out[4] = (d_in[4] == 32'd0) ? 32'd0 : mul_result[4];

    fp_mul mul_5(.A(d_in[5]), .B(scale_param), .OUT(mul_result[5]));
    assign d_out[5] = (d_in[5] == 32'd0) ? 32'd0 : mul_result[5];

    fp_mul mul_6(.A(d_in[6]), .B(scale_param), .OUT(mul_result[6]));
    assign d_out[6] = (d_in[6] == 32'd0) ? 32'd0 : mul_result[6];

    fp_mul mul_7(.A(d_in[7]), .B(scale_param), .OUT(mul_result[7]));
    assign d_out[7] = (d_in[7] == 32'd0) ? 32'd0 : mul_result[7];

    fp_mul mul_8(.A(d_in[8]), .B(scale_param), .OUT(mul_result[8]));
    assign d_out[8] = (d_in[8] == 32'd0) ? 32'd0 : mul_result[8];

    fp_mul mul_9(.A(d_in[9]), .B(scale_param), .OUT(mul_result[9]));
    assign d_out[9] = (d_in[9] == 32'd0) ? 32'd0 : mul_result[9];


endmodule