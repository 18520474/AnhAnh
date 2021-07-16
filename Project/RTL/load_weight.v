module load_weight
#(
	parameter path = "test_weight.txt"
)
(
	input clk,
	input rst,
	input load,
	output reg load_done,
	output reg [31:0] w_0,
	output reg [31:0] w_1,
	output reg [31:0] w_2,
	output reg [31:0] w_3,
	output reg [31:0] w_4,
	output reg [31:0] w_5,
	output reg [31:0] w_6,
	output reg [31:0] w_7,
	output reg [31:0] w_8
);
	reg [31:0] mem [0:8];
   initial begin
        $readmemb(path, mem);
   end
	always @(posedge clk or posedge rst) begin
		if(rst) begin
			w_0 <= 32'd0;
			w_1 <= 32'd0;
			w_2 <= 32'd0;
			w_3 <= 32'd0;
			w_4 <= 32'd0;
			w_5 <= 32'd0;
			w_6 <= 32'd0;
			w_7 <= 32'd0;
			w_8 <= 32'd0;
			load_done <= 1'b0;
		end else begin
			if(load) begin
					w_0 <= mem[0];
					w_1 <= mem[1];
					w_2 <= mem[2];
					w_3 <= mem[3];
					w_4 <= mem[4];
					w_5 <= mem[5];
					w_6 <= mem[6];
					w_7 <= mem[7];
					w_8 <= mem[8];
					load_done <= 1'b1;
			end
		end
	end
endmodule