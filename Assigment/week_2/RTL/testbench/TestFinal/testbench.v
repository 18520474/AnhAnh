`timescale 1ns/1ps
module testbench();
  parameter N = 1182721;
  reg clk;
  reg rst;
  reg input_valid;
  wire output_valid;
  reg [7:0] R;
  reg [7:0] G;
  reg [7:0] B;
  reg [7:0] Red[N-1:0];
  reg [7:0] Green[N-1:0];
  reg [7:0] Blue[N-1:0];
  reg [31:0] Result;
  wire [31:0] GRAY;
  integer i;
initial begin
  $readmemb("Red.txt", Red);
  $readmemb("Green.txt", Green);
  $readmemb("Blue.txt", Blue);
  Result = $fopen("Result");
  input_valid = 1'b1;
  clk = 1'b0;
  rst = 1'b1;
  #6;
  rst = 1'b0;
    for (i = 0; i < N; i = i + 1 ) begin
    R = Red[i];
    G = Green[i];
    B = Blue [i];
    $fdisplay(Result,"%b",GRAY);
    #60;
  end
  $finish;
end
    always @ (clk) begin
      #5;
      clk <= !clk;
    end 
  rgb_to_gray_top me_(
        .clk(clk),
        .rst(rst),
        .input_valid(input_valid),
        .output_valid(output_valid),
        .R(R),
        .G(G),
        .B(B),
        .GRAY(GRAY)
    );
endmodule