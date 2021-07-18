module load_weight_fc
#(
	parameter path = "weight.txt"
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
	output reg [31:0] w_8,
	output reg [31:0] w_9,
	output reg [31:0] w_10,
	output reg [31:0] w_11,
	output reg [31:0] w_12,
	output reg [31:0] w_13,
	output reg [31:0] w_14,
	output reg [31:0] w_15
);
	reg [31:0] mem [0:15];
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
			w_9 <= 32'd0;
			w_10 <= 32'd0;
			w_11 <= 32'd0;
			w_12 <= 32'd0;
			w_13 <= 32'd0;
			w_14 <= 32'd0;
			w_15 <= 32'd0;
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
					w_9 <= mem[9];
					w_10 <= mem[10];
					w_11 <= mem[11];
					w_12 <= mem[12];
					w_13 <= mem[13];
					w_14 <= mem[14];
					w_15 <= mem[15];
					load_done <= 1'b1;
			end
		end
	end
endmodule