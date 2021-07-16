module maxpolling(                               
     input wire clk,                                             
     input wire rst,                                             
     input wire input_valid,                                             
     input wire sof,                                             
     output wire o_sof,                                             
     output wire output_valid,                                      
     output wire [31:0] d_out[63:0],    
     input  wire [31:0] d_in[63:0]    
); 
max_pooling2d #(2, 0, 31, 31) polling_0(
	.clk(clk),
	.rst(rst),
	.sof(sof),
	.d_in(d_in[0]),
	.input_valid(input_valid),
	.o_sof(o_sof),
	.output_valid(output_valid),
	.d_out(d_out[0])
);
max_pooling2d #(2, 0, 31, 31) polling_1(
	.clk(clk),
	.rst(rst),
	.sof(sof),
	.d_in(d_in[1]),
	.input_valid(input_valid),
	.o_sof(),
	.output_valid(),
	.d_out(d_out[1])
);
max_pooling2d #(2, 0, 31, 31) polling_2(
	.clk(clk),
	.rst(rst),
	.sof(sof),
	.d_in(d_in[2]),
	.input_valid(input_valid),
	.o_sof(),
	.output_valid(),
	.d_out(d_out[2])
);
max_pooling2d #(2, 0, 31, 31) polling_3(
	.clk(clk),
	.rst(rst),
	.sof(sof),
	.d_in(d_in[3]),
	.input_valid(input_valid),
	.o_sof(),
	.output_valid(),
	.d_out(d_out[3])
);
max_pooling2d #(2, 0, 31, 31) polling_4(
	.clk(clk),
	.rst(rst),
	.sof(sof),
	.d_in(d_in[4]),
	.input_valid(input_valid),
	.o_sof(),
	.output_valid(),
	.d_out(d_out[4])
);
max_pooling2d #(2, 0, 31, 31) polling_5(
	.clk(clk),
	.rst(rst),
	.sof(sof),
	.d_in(d_in[5]),
	.input_valid(input_valid),
	.o_sof(),
	.output_valid(),
	.d_out(d_out[5])
);
max_pooling2d #(2, 0, 31, 31) polling_6(
	.clk(clk),
	.rst(rst),
	.sof(sof),
	.d_in(d_in[6]),
	.input_valid(input_valid),
	.o_sof(),
	.output_valid(),
	.d_out(d_out[6])
);
max_pooling2d #(2, 0, 31, 31) polling_7(
	.clk(clk),
	.rst(rst),
	.sof(sof),
	.d_in(d_in[7]),
	.input_valid(input_valid),
	.o_sof(),
	.output_valid(),
	.d_out(d_out[7])
);
max_pooling2d #(2, 0, 31, 31) polling_8(
	.clk(clk),
	.rst(rst),
	.sof(sof),
	.d_in(d_in[8]),
	.input_valid(input_valid),
	.o_sof(),
	.output_valid(),
	.d_out(d_out[8])
);
max_pooling2d #(2, 0, 31, 31) polling_9(
	.clk(clk),
	.rst(rst),
	.sof(sof),
	.d_in(d_in[9]),
	.input_valid(input_valid),
	.o_sof(),
	.output_valid(),
	.d_out(d_out[9])
);
max_pooling2d #(2, 0, 31, 31) polling_10(
	.clk(clk),
	.rst(rst),
	.sof(sof),
	.d_in(d_in[10]),
	.input_valid(input_valid),
	.o_sof(),
	.output_valid(),
	.d_out(d_out[10])
);
max_pooling2d #(2, 0, 31, 31) polling_11(
	.clk(clk),
	.rst(rst),
	.sof(sof),
	.d_in(d_in[11]),
	.input_valid(input_valid),
	.o_sof(),
	.output_valid(),
	.d_out(d_out[11])
);
max_pooling2d #(2, 0, 31, 31) polling_12(
	.clk(clk),
	.rst(rst),
	.sof(sof),
	.d_in(d_in[12]),
	.input_valid(input_valid),
	.o_sof(),
	.output_valid(),
	.d_out(d_out[12])
);
max_pooling2d #(2, 0, 31, 31) polling_13(
	.clk(clk),
	.rst(rst),
	.sof(sof),
	.d_in(d_in[13]),
	.input_valid(input_valid),
	.o_sof(),
	.output_valid(),
	.d_out(d_out[13])
);
max_pooling2d #(2, 0, 31, 31) polling_14(
	.clk(clk),
	.rst(rst),
	.sof(sof),
	.d_in(d_in[14]),
	.input_valid(input_valid),
	.o_sof(),
	.output_valid(),
	.d_out(d_out[14])
);
max_pooling2d #(2, 0, 31, 31) polling_15(
	.clk(clk),
	.rst(rst),
	.sof(sof),
	.d_in(d_in[15]),
	.input_valid(input_valid),
	.o_sof(),
	.output_valid(),
	.d_out(d_out[15])
);
max_pooling2d #(2, 0, 31, 31) polling_16(
	.clk(clk),
	.rst(rst),
	.sof(sof),
	.d_in(d_in[16]),
	.input_valid(input_valid),
	.o_sof(),
	.output_valid(),
	.d_out(d_out[16])
);
max_pooling2d #(2, 0, 31, 31) polling_17(
	.clk(clk),
	.rst(rst),
	.sof(sof),
	.d_in(d_in[17]),
	.input_valid(input_valid),
	.o_sof(),
	.output_valid(),
	.d_out(d_out[17])
);
max_pooling2d #(2, 0, 31, 31) polling_18(
	.clk(clk),
	.rst(rst),
	.sof(sof),
	.d_in(d_in[18]),
	.input_valid(input_valid),
	.o_sof(),
	.output_valid(),
	.d_out(d_out[18])
);
max_pooling2d #(2, 0, 31, 31) polling_19(
	.clk(clk),
	.rst(rst),
	.sof(sof),
	.d_in(d_in[19]),
	.input_valid(input_valid),
	.o_sof(),
	.output_valid(),
	.d_out(d_out[19])
);
max_pooling2d #(2, 0, 31, 31) polling_20(
	.clk(clk),
	.rst(rst),
	.sof(sof),
	.d_in(d_in[20]),
	.input_valid(input_valid),
	.o_sof(),
	.output_valid(),
	.d_out(d_out[20])
);
max_pooling2d #(2, 0, 31, 31) polling_21(
	.clk(clk),
	.rst(rst),
	.sof(sof),
	.d_in(d_in[21]),
	.input_valid(input_valid),
	.o_sof(),
	.output_valid(),
	.d_out(d_out[21])
);
max_pooling2d #(2, 0, 31, 31) polling_22(
	.clk(clk),
	.rst(rst),
	.sof(sof),
	.d_in(d_in[22]),
	.input_valid(input_valid),
	.o_sof(),
	.output_valid(),
	.d_out(d_out[22])
);
max_pooling2d #(2, 0, 31, 31) polling_23(
	.clk(clk),
	.rst(rst),
	.sof(sof),
	.d_in(d_in[23]),
	.input_valid(input_valid),
	.o_sof(),
	.output_valid(),
	.d_out(d_out[23])
);
max_pooling2d #(2, 0, 31, 31) polling_24(
	.clk(clk),
	.rst(rst),
	.sof(sof),
	.d_in(d_in[24]),
	.input_valid(input_valid),
	.o_sof(),
	.output_valid(),
	.d_out(d_out[24])
);
max_pooling2d #(2, 0, 31, 31) polling_25(
	.clk(clk),
	.rst(rst),
	.sof(sof),
	.d_in(d_in[25]),
	.input_valid(input_valid),
	.o_sof(),
	.output_valid(),
	.d_out(d_out[25])
);
max_pooling2d #(2, 0, 31, 31) polling_26(
	.clk(clk),
	.rst(rst),
	.sof(sof),
	.d_in(d_in[26]),
	.input_valid(input_valid),
	.o_sof(),
	.output_valid(),
	.d_out(d_out[26])
);
max_pooling2d #(2, 0, 31, 31) polling_27(
	.clk(clk),
	.rst(rst),
	.sof(sof),
	.d_in(d_in[27]),
	.input_valid(input_valid),
	.o_sof(),
	.output_valid(),
	.d_out(d_out[27])
);
max_pooling2d #(2, 0, 31, 31) polling_28(
	.clk(clk),
	.rst(rst),
	.sof(sof),
	.d_in(d_in[28]),
	.input_valid(input_valid),
	.o_sof(),
	.output_valid(),
	.d_out(d_out[28])
);
max_pooling2d #(2, 0, 31, 31) polling_29(
	.clk(clk),
	.rst(rst),
	.sof(sof),
	.d_in(d_in[29]),
	.input_valid(input_valid),
	.o_sof(),
	.output_valid(),
	.d_out(d_out[29])
);
max_pooling2d #(2, 0, 31, 31) polling_30(
	.clk(clk),
	.rst(rst),
	.sof(sof),
	.d_in(d_in[30]),
	.input_valid(input_valid),
	.o_sof(),
	.output_valid(),
	.d_out(d_out[30])
);
max_pooling2d #(2, 0, 31, 31) polling_31(
	.clk(clk),
	.rst(rst),
	.sof(sof),
	.d_in(d_in[31]),
	.input_valid(input_valid),
	.o_sof(),
	.output_valid(),
	.d_out(d_out[31])
);
max_pooling2d #(2, 0, 31, 31) polling_32(
	.clk(clk),
	.rst(rst),
	.sof(sof),
	.d_in(d_in[32]),
	.input_valid(input_valid),
	.o_sof(),
	.output_valid(),
	.d_out(d_out[32])
);
max_pooling2d #(2, 0, 31, 31) polling_33(
	.clk(clk),
	.rst(rst),
	.sof(sof),
	.d_in(d_in[33]),
	.input_valid(input_valid),
	.o_sof(),
	.output_valid(),
	.d_out(d_out[33])
);
max_pooling2d #(2, 0, 31, 31) polling_34(
	.clk(clk),
	.rst(rst),
	.sof(sof),
	.d_in(d_in[34]),
	.input_valid(input_valid),
	.o_sof(),
	.output_valid(),
	.d_out(d_out[34])
);
max_pooling2d #(2, 0, 31, 31) polling_35(
	.clk(clk),
	.rst(rst),
	.sof(sof),
	.d_in(d_in[35]),
	.input_valid(input_valid),
	.o_sof(),
	.output_valid(),
	.d_out(d_out[35])
);
max_pooling2d #(2, 0, 31, 31) polling_36(
	.clk(clk),
	.rst(rst),
	.sof(sof),
	.d_in(d_in[36]),
	.input_valid(input_valid),
	.o_sof(),
	.output_valid(),
	.d_out(d_out[36])
);
max_pooling2d #(2, 0, 31, 31) polling_37(
	.clk(clk),
	.rst(rst),
	.sof(sof),
	.d_in(d_in[37]),
	.input_valid(input_valid),
	.o_sof(),
	.output_valid(),
	.d_out(d_out[37])
);
max_pooling2d #(2, 0, 31, 31) polling_38(
	.clk(clk),
	.rst(rst),
	.sof(sof),
	.d_in(d_in[38]),
	.input_valid(input_valid),
	.o_sof(),
	.output_valid(),
	.d_out(d_out[38])
);
max_pooling2d #(2, 0, 31, 31) polling_39(
	.clk(clk),
	.rst(rst),
	.sof(sof),
	.d_in(d_in[39]),
	.input_valid(input_valid),
	.o_sof(),
	.output_valid(),
	.d_out(d_out[39])
);
max_pooling2d #(2, 0, 31, 31) polling_40(
	.clk(clk),
	.rst(rst),
	.sof(sof),
	.d_in(d_in[40]),
	.input_valid(input_valid),
	.o_sof(),
	.output_valid(),
	.d_out(d_out[40])
);
max_pooling2d #(2, 0, 31, 31) polling_41(
	.clk(clk),
	.rst(rst),
	.sof(sof),
	.d_in(d_in[41]),
	.input_valid(input_valid),
	.o_sof(),
	.output_valid(),
	.d_out(d_out[41])
);
max_pooling2d #(2, 0, 31, 31) polling_42(
	.clk(clk),
	.rst(rst),
	.sof(sof),
	.d_in(d_in[42]),
	.input_valid(input_valid),
	.o_sof(),
	.output_valid(),
	.d_out(d_out[42])
);
max_pooling2d #(2, 0, 31, 31) polling_43(
	.clk(clk),
	.rst(rst),
	.sof(sof),
	.d_in(d_in[43]),
	.input_valid(input_valid),
	.o_sof(),
	.output_valid(),
	.d_out(d_out[43])
);
max_pooling2d #(2, 0, 31, 31) polling_44(
	.clk(clk),
	.rst(rst),
	.sof(sof),
	.d_in(d_in[44]),
	.input_valid(input_valid),
	.o_sof(),
	.output_valid(),
	.d_out(d_out[44])
);
max_pooling2d #(2, 0, 31, 31) polling_45(
	.clk(clk),
	.rst(rst),
	.sof(sof),
	.d_in(d_in[45]),
	.input_valid(input_valid),
	.o_sof(),
	.output_valid(),
	.d_out(d_out[45])
);
max_pooling2d #(2, 0, 31, 31) polling_46(
	.clk(clk),
	.rst(rst),
	.sof(sof),
	.d_in(d_in[46]),
	.input_valid(input_valid),
	.o_sof(),
	.output_valid(),
	.d_out(d_out[46])
);
max_pooling2d #(2, 0, 31, 31) polling_47(
	.clk(clk),
	.rst(rst),
	.sof(sof),
	.d_in(d_in[47]),
	.input_valid(input_valid),
	.o_sof(),
	.output_valid(),
	.d_out(d_out[47])
);
max_pooling2d #(2, 0, 31, 31) polling_48(
	.clk(clk),
	.rst(rst),
	.sof(sof),
	.d_in(d_in[48]),
	.input_valid(input_valid),
	.o_sof(),
	.output_valid(),
	.d_out(d_out[48])
);
max_pooling2d #(2, 0, 31, 31) polling_49(
	.clk(clk),
	.rst(rst),
	.sof(sof),
	.d_in(d_in[49]),
	.input_valid(input_valid),
	.o_sof(),
	.output_valid(),
	.d_out(d_out[49])
);
max_pooling2d #(2, 0, 31, 31) polling_50(
	.clk(clk),
	.rst(rst),
	.sof(sof),
	.d_in(d_in[50]),
	.input_valid(input_valid),
	.o_sof(),
	.output_valid(),
	.d_out(d_out[50])
);
max_pooling2d #(2, 0, 31, 31) polling_51(
	.clk(clk),
	.rst(rst),
	.sof(sof),
	.d_in(d_in[51]),
	.input_valid(input_valid),
	.o_sof(),
	.output_valid(),
	.d_out(d_out[51])
);
max_pooling2d #(2, 0, 31, 31) polling_52(
	.clk(clk),
	.rst(rst),
	.sof(sof),
	.d_in(d_in[52]),
	.input_valid(input_valid),
	.o_sof(),
	.output_valid(),
	.d_out(d_out[52])
);
max_pooling2d #(2, 0, 31, 31) polling_53(
	.clk(clk),
	.rst(rst),
	.sof(sof),
	.d_in(d_in[53]),
	.input_valid(input_valid),
	.o_sof(),
	.output_valid(),
	.d_out(d_out[53])
);
max_pooling2d #(2, 0, 31, 31) polling_54(
	.clk(clk),
	.rst(rst),
	.sof(sof),
	.d_in(d_in[54]),
	.input_valid(input_valid),
	.o_sof(),
	.output_valid(),
	.d_out(d_out[54])
);
max_pooling2d #(2, 0, 31, 31) polling_55(
	.clk(clk),
	.rst(rst),
	.sof(sof),
	.d_in(d_in[55]),
	.input_valid(input_valid),
	.o_sof(),
	.output_valid(),
	.d_out(d_out[55])
);
max_pooling2d #(2, 0, 31, 31) polling_56(
	.clk(clk),
	.rst(rst),
	.sof(sof),
	.d_in(d_in[56]),
	.input_valid(input_valid),
	.o_sof(),
	.output_valid(),
	.d_out(d_out[56])
);
max_pooling2d #(2, 0, 31, 31) polling_57(
	.clk(clk),
	.rst(rst),
	.sof(sof),
	.d_in(d_in[57]),
	.input_valid(input_valid),
	.o_sof(),
	.output_valid(),
	.d_out(d_out[57])
);
max_pooling2d #(2, 0, 31, 31) polling_58(
	.clk(clk),
	.rst(rst),
	.sof(sof),
	.d_in(d_in[58]),
	.input_valid(input_valid),
	.o_sof(),
	.output_valid(),
	.d_out(d_out[58])
);
max_pooling2d #(2, 0, 31, 31) polling_59(
	.clk(clk),
	.rst(rst),
	.sof(sof),
	.d_in(d_in[59]),
	.input_valid(input_valid),
	.o_sof(),
	.output_valid(),
	.d_out(d_out[59])
);
max_pooling2d #(2, 0, 31, 31) polling_60(
	.clk(clk),
	.rst(rst),
	.sof(sof),
	.d_in(d_in[60]),
	.input_valid(input_valid),
	.o_sof(),
	.output_valid(),
	.d_out(d_out[60])
);
max_pooling2d #(2, 0, 31, 31) polling_61(
	.clk(clk),
	.rst(rst),
	.sof(sof),
	.d_in(d_in[61]),
	.input_valid(input_valid),
	.o_sof(),
	.output_valid(),
	.d_out(d_out[61])
);
max_pooling2d #(2, 0, 31, 31) polling_62(
	.clk(clk),
	.rst(rst),
	.sof(sof),
	.d_in(d_in[62]),
	.input_valid(input_valid),
	.o_sof(),
	.output_valid(),
	.d_out(d_out[62])
);
max_pooling2d #(2, 0, 31, 31) polling_63(
	.clk(clk),
	.rst(rst),
	.sof(sof),
	.d_in(d_in[63]),
	.input_valid(input_valid),
	.o_sof(),
	.output_valid(),
	.d_out(d_out[63])
);
endmodule