`define f2r(z) ({z[31], z[30], {3{~z[30]}}, z[29:23], z[22:0], {29{1'b0}}})
`define r2f(z) ({z[63], z[62], z[58:52], z[51:29]})
module softmax(
    input clk,
	  input resetn,
	  input valid_in,
    input [31:0] d_in[9:0],
    output [31:0] percent[9:0],
    output reg valid_out
    );
    reg [63:0] num[0:9];
    reg [63:0] per[0:9];
    assign percent[0] = `r2f(per[0]);
    assign percent[1] = `r2f(per[1]);
    assign percent[2] = `r2f(per[2]);
    assign percent[3] = `r2f(per[3]);
    assign percent[4] = `r2f(per[4]);
    assign percent[5] = `r2f(per[5]);
    assign percent[6] = `r2f(per[6]);
    assign percent[7] = `r2f(per[7]);
    assign percent[8] = `r2f(per[8]);
    assign percent[9] = `r2f(per[9]);
    reg s1,s2,s3;
    real r0,r1,r2,r3,r4,r5,r6,r7,r8,r9,r_sum,r0_bk,r1_bk,r2_bk,r3_bk,r4_bk,r5_bk,r6_bk,r7_bk,r8_bk,r9_bk;
    always @ (posedge clk or negedge resetn)begin
        if (resetn == 1'b1)begin
            num[0] <= 0;
            num[1] <= 0;
            num[2] <= 0;
            num[3] <= 0;
            num[4] <= 0;
            num[5] <= 0;
            num[6] <= 0;
            num[7] <= 0;
            num[8] <= 0;
            num[9] <= 0;
            s1 <= 0;
        end
        else if(valid_in == 1'b1)begin
            num[0] <= `f2r(d_in[0]);
            num[1] <= `f2r(d_in[1]);
            num[2] <= `f2r(d_in[2]);
            num[3] <= `f2r(d_in[3]);
            num[4] <= `f2r(d_in[4]);
            num[5] <= `f2r(d_in[5]);
            num[6] <= `f2r(d_in[6]);
            num[7] <= `f2r(d_in[7]);
            num[8] <= `f2r(d_in[8]);
            num[9] <= `f2r(d_in[9]);
            s1 <= valid_in;
        end
        else begin
            num[0] <= num[0];
            num[1] <= num[1];
            num[2] <= num[2];
            num[3] <= num[3];
            num[4] <= num[4];
            num[5] <= num[5];
            num[6] <= num[6];
            num[7] <= num[7];
            num[8] <= num[8];
            num[9] <= num[9];
            s1 <= 0;
        end
    end
    always @ (posedge clk or negedge resetn)begin
        if (resetn == 1'b1)begin
            r0 <= 0;
            r1 <= 0;
            r2 <= 0;
            r3 <= 0;
            r4 <= 0;
            r5 <= 0;
            r6 <= 0;
            r7 <= 0;
            r8 <= 0;
            r9 <= 0;
            s2 <= 0;
        end
        else if(s1 == 1'b1)begin
            r0 <= 2.71828182846**$bitstoreal(num0);
            r1 <= 2.71828182846**$bitstoreal(num1);
            r2 <= 2.71828182846**$bitstoreal(num2);
            r3 <= 2.71828182846**$bitstoreal(num3);
            r4 <= 2.71828182846**$bitstoreal(num4);
            r5 <= 2.71828182846**$bitstoreal(num5);
            r6 <= 2.71828182846**$bitstoreal(num6);
            r7 <= 2.71828182846**$bitstoreal(num7);
            r8 <= 2.71828182846**$bitstoreal(num8);
            r9 <= 2.71828182846**$bitstoreal(num9);
            s2 <= s1;
        end
        else begin
            r0 <= r0;
            r1 <= r1;
            r2 <= r2;
            r3 <= r3;
            r4 <= r4;
            r5 <= r5;
            r6 <= r6;
            r7 <= r7;
            r8 <= r8;
            r9 <= r9;
            s2 <= 0;
        end
    end
    always @ (posedge clk or negedge resetn)begin
        if (resetn == 1'b1)begin
            r_sum <= 0;
            s3 <= 0;
            r0_bk <= 0;
            r1_bk <= 0;
            r2_bk <= 0;
            r3_bk <= 0;
            r4_bk <= 0;
            r5_bk <= 0;
            r6_bk <= 0;
            r7_bk <= 0;
            r8_bk <= 0;
            r9_bk <= 0;
        end
        else if(s2 == 1'b1)begin
            r_sum <= r0 + r1 + r2 + r3 + r4 + r5 + r6 + r7 + r8 + r9;
            r0_bk <= r0;
            r1_bk <= r1;
            r2_bk <= r2;
            r3_bk <= r3;
            r4_bk <= r4;
            r5_bk <= r5;
            r6_bk <= r6;
            r7_bk <= r7;
            r8_bk <= r8;
            r9_bk <= r9;
            s3 <= s2;
        end
        else begin
            r_sum <= r_sum;
            r0_bk <= r0_bk;
            r1_bk <= r1_bk;
            r2_bk <= r2_bk;
            r3_bk <= r3_bk;
            r4_bk <= r4_bk;
            r5_bk <= r5_bk;
            r6_bk <= r6_bk;
            r7_bk <= r7_bk;
            r8_bk <= r8_bk;
            r9_bk <= r9_bk;
            s3 <= 0;
        end
    end
    always @ (posedge clk or negedge resetn)begin
        if (resetn == 1'b1)begin
            per[0] <= 0;
            per[1] <= 0;
            per[2] <= 0;
            per[3] <= 0;
            per[4] <= 0;
            per[5] <= 0;
            per[6] <= 0;
            per[7] <= 0;
            per[8] <= 0;
            per[9] <= 0;
            valid_out <= 0;
        end
        else if(s3 == 1'b1)begin
            per[0] <= $realtobits(r0_bk/r_sum);
            per[1] <= $realtobits(r1_bk/r_sum);
            per[2] <= $realtobits(r2_bk/r_sum);
            per[3] <= $realtobits(r3_bk/r_sum);
            per[4] <= $realtobits(r4_bk/r_sum);
            per[5] <= $realtobits(r5_bk/r_sum);
            per[6] <= $realtobits(r6_bk/r_sum);
            per[7] <= $realtobits(r7_bk/r_sum);
            per[8] <= $realtobits(r8_bk/r_sum);
            per[9] <= $realtobits(r9_bk/r_sum);
            valid_out <= s3;
        end
        else begin
            per[0] <= per[0];
            per[1] <= per[1];
            per[2] <= per[2];
            per[3] <= per[3];
            per[4] <= per[4];
            per[5] <= per[5];
            per[6] <= per[6];
            per[7] <= per[7];
            per[8] <= per[8];
            per[9] <= per[9];
            valid_out <= 0;
        end
    end
endmodule