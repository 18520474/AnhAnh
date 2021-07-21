`define f2r(z) ({z[31], z[30], {3{~z[30]}}, z[29:23], z[22:0], {29{1'b0}}})
`define r2f(z) ({z[63], z[62], z[58:52], z[51:29]})
module softmax(
    clk,
    resetn,
    valid_in,
    class0,class1,class2,class3,class4,class5,class6,class7,class8,class9,
    percent0,percent1,percent2,percent3,percent4,percent5,percent6,percent7,percent8,percent9,
    valid_out
    );
    input clk;
	input resetn;
	input valid_in;
    input [31:0] class0,class1,class2,class3,class4,class5,class6,class7,class8,class9;
    output [31:0] percent0,percent1,percent2,percent3,percent4,percent5,percent6,percent7,percent8,percent9;
    output reg valid_out;

    

    reg [63:0] num0,num1,num2,num3,num4,num5,num6,num7,num8,num9,per0,per1,per2,per3,per4,per5,per6,per7,per8,per9;
    assign percent0 = `r2f(per0);
    assign percent1 = `r2f(per1);
    assign percent2 = `r2f(per2);
    assign percent3 = `r2f(per3);
    assign percent4 = `r2f(per4);
    assign percent5 = `r2f(per5);
    assign percent6 = `r2f(per6);
    assign percent7 = `r2f(per7);
    assign percent8 = `r2f(per8);
    assign percent9 = `r2f(per9);
    reg s1,s2,s3;
    real r0,r1,r2,r3,r4,r5,r6,r7,r8,r9,r_sum,r0_bk,r1_bk,r2_bk,r3_bk,r4_bk,r5_bk,r6_bk,r7_bk,r8_bk,r9_bk;
    always @ (posedge clk or posedge resetn)begin
        if (resetn == 1'b1)begin
            num0 <= 0;
            num1 <= 0;
            num2 <= 0;
            num3 <= 0;
            num4 <= 0;
            num5 <= 0;
            num6 <= 0;
            num7 <= 0;
            num8 <= 0;
            num9 <= 0;
            s1 <= 0;
        end
        else if(valid_in == 1'b1)begin
            num0 <= `f2r(class0);
            num1 <= `f2r(class1);
            num2 <= `f2r(class2);
            num3 <= `f2r(class3);
            num4 <= `f2r(class4);
            num5 <= `f2r(class5);
            num6 <= `f2r(class6);
            num7 <= `f2r(class7);
            num8 <= `f2r(class8);
            num9 <= `f2r(class9);
            s1 <= valid_in;
        end
        else begin
            num0 <= num0;
            num1 <= num1;
            num2 <= num2;
            num3 <= num3;
            num4 <= num4;
            num5 <= num5;
            num6 <= num6;
            num7 <= num7;
            num8 <= num8;
            num9 <= num9;
            s1 <= 0;
        end
    end
    always @ (posedge clk or posedge resetn)begin
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
    always @ (posedge clk or posedge resetn)begin
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
    always @ (posedge clk or posedge resetn)begin
        if (resetn == 1'b1)begin
            per0 <= 0;
            per1 <= 0;
            per2 <= 0;
            per3 <= 0;
            per4 <= 0;
            per5 <= 0;
            per6 <= 0;
            per7 <= 0;
            per8 <= 0;
            per9 <= 0;
            valid_out <= 0;
        end
        else if(s3 == 1'b1)begin
            per0 <= $realtobits(r0_bk/r_sum);
            per1 <= $realtobits(r1_bk/r_sum);
            per2 <= $realtobits(r2_bk/r_sum);
            per3 <= $realtobits(r3_bk/r_sum);
            per4 <= $realtobits(r4_bk/r_sum);
            per5 <= $realtobits(r5_bk/r_sum);
            per6 <= $realtobits(r6_bk/r_sum);
            per7 <= $realtobits(r7_bk/r_sum);
            per8 <= $realtobits(r8_bk/r_sum);
            per9 <= $realtobits(r9_bk/r_sum);
            valid_out <= s3;
        end
        else begin
            per0 <= per0;
            per1 <= per1;
            per2 <= per2;
            per3 <= per3;
            per4 <= per4;
            per5 <= per5;
            per6 <= per6;
            per7 <= per7;
            per8 <= per8;
            per9 <= per9;
            valid_out <= 0;
        end
    end
endmodule