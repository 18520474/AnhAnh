`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Created by: Nguyen Pham The Anh 
// 
// Create Date: 03/12/2021 08:15:04 PM
// Module Name: fp_mul
// Project Name: FPGA implement for exponential fuction
// Description: single-cycle fp32 multiplier
//////////////////////////////////////////////////////////////////////////////////


module fp_mul(

	A,     /*float32 A input*/
	B,     /*float32 B input*/
	OUT    /*float32 output*/
);
	input      [31:0] A, B; 
	output     [31:0] OUT;
	wire       [31:0] RESULT;
	wire       [23:0] a_m, b_m, a_m_1, b_m_1, z_m, z_m_1, z_m_2, z_m_3;
	wire       [9:0] a_e, tmp_a_e, tmp_b_e, b_e, a_e_1, b_e_1, z_e, z_e_1, z_e_2, z_e_3, z_e_4;
	wire       [49:0] product;
	wire       z_s, guard, round_bit, sticky, guard_1, round_bit_1, sticky_1, guard_2, round_bit_2, sticky_2;
	
	assign     a_m[22:0] = A[22:0];
    assign     b_m[22:0] = B[22:0];
	assign     tmp_a_e = A[30:23] - 10'd127;
	assign     tmp_b_e = B[30:23] - 10'd127;
    assign     {a_m[23] , a_e} = ($signed(tmp_a_e) == -127) ? {1'b0, -10'sd126} : {1'b1, tmp_a_e};
    assign     {b_m[23] , b_e} = ($signed(tmp_b_e) == -127) ? {1'b0, -10'sd126} : {1'b1, tmp_b_e};
	
	/*special case check*/
	assign OUT = (((A[31:23] == {1'b0, 8'hff}) && A[22:0] != 0) || ((B[31:23] == {1'b0, 8'hff}) && B[22:0] != 0 /*v1.5*/)) ? {1'b0, 8'hff, 1'b1, 22'd0} : /*nan*/
					 ((A[30-:8] == 8'hff && A[22:0] == 0) || (B[30-:8] == 8'hff && B[22:0] == 0) /*v1.5*/) ? {z_s, 8'hff, 23'd0} : /*inf*/
					 ((A == 0) || (B == 0)) ? {32'd0} : /*zero*/
					 RESULT; 
	//assign OUT = RESULT;
    assign a_m_1          = (!a_m[23]) ? a_m << 1 : a_m;
	assign a_e_1          = (!a_m[23]) ? a_e - 10'd1 : a_e;
	assign b_m_1          = (!b_m[23]) ? b_m << 1 : b_m;
	assign b_e_1          = (!b_m[23]) ? b_e - 10'd1 : b_e;

	
	assign z_s = A[31] ^ B[31];
	assign z_e = a_e_1 + b_e_1 + 10'd1;
	
	assign product = a_m_1 * b_m_1 * 4;
	assign z_m = product[49:26];
	assign guard = product[25];
	assign sticky = (product[23:0] != 0);
	assign round_bit = product[24];
	
	assign z_e_1       = (z_m[23] == 0) ? z_e - 10'd1 : z_e;
	assign z_m_1       = (z_m[23] == 0) ? (z_m << 1) + guard : z_m;
	assign guard_1     = (z_m[23] == 0) ? product[24] : guard;
	assign round_bit_1 = (z_m[23] == 0) ? 1'b0 : round_bit;
	
	assign z_e_2       = ($signed(z_e_1) < -126) ? z_e_1 + 10'd1 : z_e_1;
	assign z_m_2       = ($signed(z_e_1) < -126) ? z_m_1 >> 1 : z_m_1;
	assign guard_2     = ($signed(z_e_1) < -126) ? z_m_1[0] : guard_1;
	assign round_bit_2 = ($signed(z_e_1) < -126) ? guard_1 : round_bit_1;
	assign sticky_1    = ($signed(z_e_1) < -126) ? sticky | round_bit_1 : sticky;
	

																			  
	assign z_m_3       = (guard_2 && (round_bit_2 | sticky_1 | z_m_2[0])) ? z_m_2 + 24'd1 : z_m_2;
	assign z_e_3       = (guard_2 && (round_bit_2 | sticky_1 | z_m_2[0]) && z_m_2 == 24'hffffff) ? z_e_2 + 10'd1 : z_e_2;
	assign z_e_4       = z_e_3[7:0] + 8'd127;
	
	assign RESULT = ($signed(z_e_3) == -10'sd126 && z_m_3[23] == 1'b0) ? {z_s, 8'h00, z_m_3[22:0]} :
					($signed(z_e_3) > 10'sd127)                        ? {z_s, 8'hff, 23'd0} /*overflow*/ : 
							                                             {z_s, z_e_4[7:0], z_m_3[22:0]};
endmodule
	
