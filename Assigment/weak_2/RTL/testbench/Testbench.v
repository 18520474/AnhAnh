#### Test int_to_float.v
`timescale 1ns/1ps
module testbench();
  reg [7:0] int_input;
  wire [31:0] float_output;
  reg [31:0] bin;
  integer i;
  initial begin
    bin = $fopen("Bin_file");
    for(i = 0; i <= 255; i = i + 1 ) begin
      #100
      int_input = i;
      $fdisplay(bin,"%b",float_output);
    end
  end
    int_to_float me_(
        .int_input(int_input),     
        .float_output(float_output) 
        );
endmodule


