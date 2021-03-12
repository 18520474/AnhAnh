// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.2 (lin64) Build 3064766 Wed Nov 18 09:12:47 MST 2020
// Date        : Fri Mar 12 15:56:48 2021
// Host        : theanhnp-ThinkPad-T470s running 64-bit Ubuntu 20.04.2 LTS
// Command     : write_verilog -mode timesim -nolib -sdf_anno true -force -file
//               /home/theanhnp/RGBtoGRAY/RGBtoGRAY.sim/sim_1/synth/timing/xsim/tb_int_to_float_time_synth.v
// Design      : int_to_float
// Purpose     : This verilog netlist is a timing simulation representation of the design and should not be modified or
//               synthesized. Please ensure that this netlist is used with the corresponding SDF file.
// Device      : xc7z010iclg225-1L
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps
`define XIL_TIMING

(* NotValidForBitStream *)
module int_to_float
   (int_input,
    float_output);
  input [7:0]int_input;
  output [31:0]float_output;

  wire [31:0]float_output;
  wire [30:16]float_output_OBUF;
  wire \float_output_OBUF[19]_inst_i_2_n_0 ;
  wire \float_output_OBUF[20]_inst_i_2_n_0 ;
  wire \float_output_OBUF[21]_inst_i_2_n_0 ;
  wire \float_output_OBUF[22]_inst_i_2_n_0 ;
  wire \float_output_OBUF[23]_inst_i_2_n_0 ;
  wire \float_output_OBUF[24]_inst_i_2_n_0 ;
  wire \float_output_OBUF[29]_inst_i_2_n_0 ;
  wire \float_output_OBUF[30]_inst_i_2_n_0 ;
  wire [7:0]int_input;
  wire [7:0]int_input_IBUF;

initial begin
 $sdf_annotate("tb_int_to_float_time_synth.sdf",,,,"tool_control");
end
  OBUF \float_output_OBUF[0]_inst 
       (.I(1'b0),
        .O(float_output[0]));
  OBUF \float_output_OBUF[10]_inst 
       (.I(1'b0),
        .O(float_output[10]));
  OBUF \float_output_OBUF[11]_inst 
       (.I(1'b0),
        .O(float_output[11]));
  OBUF \float_output_OBUF[12]_inst 
       (.I(1'b0),
        .O(float_output[12]));
  OBUF \float_output_OBUF[13]_inst 
       (.I(1'b0),
        .O(float_output[13]));
  OBUF \float_output_OBUF[14]_inst 
       (.I(1'b0),
        .O(float_output[14]));
  OBUF \float_output_OBUF[15]_inst 
       (.I(1'b0),
        .O(float_output[15]));
  OBUF \float_output_OBUF[16]_inst 
       (.I(float_output_OBUF[16]),
        .O(float_output[16]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \float_output_OBUF[16]_inst_i_1 
       (.I0(int_input_IBUF[0]),
        .I1(int_input_IBUF[7]),
        .O(float_output_OBUF[16]));
  OBUF \float_output_OBUF[17]_inst 
       (.I(float_output_OBUF[17]),
        .O(float_output[17]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT4 #(
    .INIT(16'hB888)) 
    \float_output_OBUF[17]_inst_i_1 
       (.I0(int_input_IBUF[1]),
        .I1(int_input_IBUF[7]),
        .I2(int_input_IBUF[0]),
        .I3(int_input_IBUF[6]),
        .O(float_output_OBUF[17]));
  OBUF \float_output_OBUF[18]_inst 
       (.I(float_output_OBUF[18]),
        .O(float_output[18]));
  LUT6 #(
    .INIT(64'hB8BBB888B888B888)) 
    \float_output_OBUF[18]_inst_i_1 
       (.I0(int_input_IBUF[2]),
        .I1(int_input_IBUF[7]),
        .I2(int_input_IBUF[1]),
        .I3(int_input_IBUF[6]),
        .I4(int_input_IBUF[0]),
        .I5(int_input_IBUF[5]),
        .O(float_output_OBUF[18]));
  OBUF \float_output_OBUF[19]_inst 
       (.I(float_output_OBUF[19]),
        .O(float_output[19]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \float_output_OBUF[19]_inst_i_1 
       (.I0(int_input_IBUF[3]),
        .I1(int_input_IBUF[7]),
        .I2(\float_output_OBUF[19]_inst_i_2_n_0 ),
        .O(float_output_OBUF[19]));
  LUT6 #(
    .INIT(64'hB8BBB888B888B888)) 
    \float_output_OBUF[19]_inst_i_2 
       (.I0(int_input_IBUF[2]),
        .I1(int_input_IBUF[6]),
        .I2(int_input_IBUF[1]),
        .I3(int_input_IBUF[5]),
        .I4(int_input_IBUF[0]),
        .I5(int_input_IBUF[4]),
        .O(\float_output_OBUF[19]_inst_i_2_n_0 ));
  OBUF \float_output_OBUF[1]_inst 
       (.I(1'b0),
        .O(float_output[1]));
  OBUF \float_output_OBUF[20]_inst 
       (.I(float_output_OBUF[20]),
        .O(float_output[20]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \float_output_OBUF[20]_inst_i_1 
       (.I0(int_input_IBUF[4]),
        .I1(int_input_IBUF[7]),
        .I2(int_input_IBUF[3]),
        .I3(int_input_IBUF[6]),
        .I4(\float_output_OBUF[20]_inst_i_2_n_0 ),
        .O(float_output_OBUF[20]));
  LUT6 #(
    .INIT(64'hB8BBB888B888B888)) 
    \float_output_OBUF[20]_inst_i_2 
       (.I0(int_input_IBUF[2]),
        .I1(int_input_IBUF[5]),
        .I2(int_input_IBUF[1]),
        .I3(int_input_IBUF[4]),
        .I4(int_input_IBUF[3]),
        .I5(int_input_IBUF[0]),
        .O(\float_output_OBUF[20]_inst_i_2_n_0 ));
  OBUF \float_output_OBUF[21]_inst 
       (.I(float_output_OBUF[21]),
        .O(float_output[21]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \float_output_OBUF[21]_inst_i_1 
       (.I0(int_input_IBUF[5]),
        .I1(int_input_IBUF[7]),
        .I2(int_input_IBUF[4]),
        .I3(int_input_IBUF[6]),
        .I4(\float_output_OBUF[21]_inst_i_2_n_0 ),
        .O(float_output_OBUF[21]));
  LUT6 #(
    .INIT(64'hFBFBEAEA50405040)) 
    \float_output_OBUF[21]_inst_i_2 
       (.I0(int_input_IBUF[5]),
        .I1(int_input_IBUF[4]),
        .I2(int_input_IBUF[2]),
        .I3(int_input_IBUF[0]),
        .I4(int_input_IBUF[1]),
        .I5(int_input_IBUF[3]),
        .O(\float_output_OBUF[21]_inst_i_2_n_0 ));
  OBUF \float_output_OBUF[22]_inst 
       (.I(float_output_OBUF[22]),
        .O(float_output[22]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'hE5E0)) 
    \float_output_OBUF[22]_inst_i_1 
       (.I0(int_input_IBUF[7]),
        .I1(int_input_IBUF[5]),
        .I2(int_input_IBUF[6]),
        .I3(\float_output_OBUF[22]_inst_i_2_n_0 ),
        .O(float_output_OBUF[22]));
  LUT6 #(
    .INIT(64'hDD99DD88CC98CC88)) 
    \float_output_OBUF[22]_inst_i_2 
       (.I0(int_input_IBUF[5]),
        .I1(int_input_IBUF[4]),
        .I2(int_input_IBUF[0]),
        .I3(int_input_IBUF[3]),
        .I4(int_input_IBUF[1]),
        .I5(int_input_IBUF[2]),
        .O(\float_output_OBUF[22]_inst_i_2_n_0 ));
  OBUF \float_output_OBUF[23]_inst 
       (.I(float_output_OBUF[23]),
        .O(float_output[23]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT3 #(
    .INIT(8'h0E)) 
    \float_output_OBUF[23]_inst_i_1 
       (.I0(int_input_IBUF[6]),
        .I1(\float_output_OBUF[23]_inst_i_2_n_0 ),
        .I2(int_input_IBUF[7]),
        .O(float_output_OBUF[23]));
  LUT6 #(
    .INIT(64'h00000000AAAAFFBA)) 
    \float_output_OBUF[23]_inst_i_2 
       (.I0(int_input_IBUF[4]),
        .I1(int_input_IBUF[1]),
        .I2(int_input_IBUF[0]),
        .I3(int_input_IBUF[2]),
        .I4(int_input_IBUF[3]),
        .I5(int_input_IBUF[5]),
        .O(\float_output_OBUF[23]_inst_i_2_n_0 ));
  OBUF \float_output_OBUF[24]_inst 
       (.I(float_output_OBUF[24]),
        .O(float_output[24]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT3 #(
    .INIT(8'hF4)) 
    \float_output_OBUF[24]_inst_i_1 
       (.I0(int_input_IBUF[6]),
        .I1(\float_output_OBUF[24]_inst_i_2_n_0 ),
        .I2(int_input_IBUF[7]),
        .O(float_output_OBUF[24]));
  LUT6 #(
    .INIT(64'h00000000FFFFABAA)) 
    \float_output_OBUF[24]_inst_i_2 
       (.I0(int_input_IBUF[4]),
        .I1(int_input_IBUF[1]),
        .I2(int_input_IBUF[2]),
        .I3(int_input_IBUF[0]),
        .I4(int_input_IBUF[3]),
        .I5(int_input_IBUF[5]),
        .O(\float_output_OBUF[24]_inst_i_2_n_0 ));
  OBUF \float_output_OBUF[25]_inst 
       (.I(float_output_OBUF[25]),
        .O(float_output[25]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'hFFFE)) 
    \float_output_OBUF[25]_inst_i_1 
       (.I0(int_input_IBUF[6]),
        .I1(\float_output_OBUF[29]_inst_i_2_n_0 ),
        .I2(int_input_IBUF[5]),
        .I3(int_input_IBUF[7]),
        .O(float_output_OBUF[25]));
  OBUF \float_output_OBUF[26]_inst 
       (.I(float_output_OBUF[26]),
        .O(float_output[26]));
  OBUF \float_output_OBUF[27]_inst 
       (.I(float_output_OBUF[26]),
        .O(float_output[27]));
  OBUF \float_output_OBUF[28]_inst 
       (.I(float_output_OBUF[26]),
        .O(float_output[28]));
  OBUF \float_output_OBUF[29]_inst 
       (.I(float_output_OBUF[26]),
        .O(float_output[29]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'h0004)) 
    \float_output_OBUF[29]_inst_i_1 
       (.I0(int_input_IBUF[6]),
        .I1(\float_output_OBUF[29]_inst_i_2_n_0 ),
        .I2(int_input_IBUF[5]),
        .I3(int_input_IBUF[7]),
        .O(float_output_OBUF[26]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h00000002)) 
    \float_output_OBUF[29]_inst_i_2 
       (.I0(int_input_IBUF[0]),
        .I1(int_input_IBUF[1]),
        .I2(int_input_IBUF[2]),
        .I3(int_input_IBUF[3]),
        .I4(int_input_IBUF[4]),
        .O(\float_output_OBUF[29]_inst_i_2_n_0 ));
  OBUF \float_output_OBUF[2]_inst 
       (.I(1'b0),
        .O(float_output[2]));
  OBUF \float_output_OBUF[30]_inst 
       (.I(float_output_OBUF[30]),
        .O(float_output[30]));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \float_output_OBUF[30]_inst_i_1 
       (.I0(int_input_IBUF[6]),
        .I1(int_input_IBUF[4]),
        .I2(\float_output_OBUF[30]_inst_i_2_n_0 ),
        .I3(int_input_IBUF[3]),
        .I4(int_input_IBUF[5]),
        .I5(int_input_IBUF[7]),
        .O(float_output_OBUF[30]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \float_output_OBUF[30]_inst_i_2 
       (.I0(int_input_IBUF[1]),
        .I1(int_input_IBUF[2]),
        .O(\float_output_OBUF[30]_inst_i_2_n_0 ));
  OBUF \float_output_OBUF[31]_inst 
       (.I(1'b0),
        .O(float_output[31]));
  OBUF \float_output_OBUF[3]_inst 
       (.I(1'b0),
        .O(float_output[3]));
  OBUF \float_output_OBUF[4]_inst 
       (.I(1'b0),
        .O(float_output[4]));
  OBUF \float_output_OBUF[5]_inst 
       (.I(1'b0),
        .O(float_output[5]));
  OBUF \float_output_OBUF[6]_inst 
       (.I(1'b0),
        .O(float_output[6]));
  OBUF \float_output_OBUF[7]_inst 
       (.I(1'b0),
        .O(float_output[7]));
  OBUF \float_output_OBUF[8]_inst 
       (.I(1'b0),
        .O(float_output[8]));
  OBUF \float_output_OBUF[9]_inst 
       (.I(1'b0),
        .O(float_output[9]));
  IBUF \int_input_IBUF[0]_inst 
       (.I(int_input[0]),
        .O(int_input_IBUF[0]));
  IBUF \int_input_IBUF[1]_inst 
       (.I(int_input[1]),
        .O(int_input_IBUF[1]));
  IBUF \int_input_IBUF[2]_inst 
       (.I(int_input[2]),
        .O(int_input_IBUF[2]));
  IBUF \int_input_IBUF[3]_inst 
       (.I(int_input[3]),
        .O(int_input_IBUF[3]));
  IBUF \int_input_IBUF[4]_inst 
       (.I(int_input[4]),
        .O(int_input_IBUF[4]));
  IBUF \int_input_IBUF[5]_inst 
       (.I(int_input[5]),
        .O(int_input_IBUF[5]));
  IBUF \int_input_IBUF[6]_inst 
       (.I(int_input[6]),
        .O(int_input_IBUF[6]));
  IBUF \int_input_IBUF[7]_inst 
       (.I(int_input[7]),
        .O(int_input_IBUF[7]));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
