/*
module output_control
#(
	parameter output_x = 2,
	parameter output_y = 2
)
(
	input clk,
	input rst,
	input output_valid,
	output reg o_sof
);
	reg [7:0] x, y;
	always @ (posedge clk or posedge rst) begin
		if(rst) begin
			x <= 8'd0;
			y <= 8'd0;
		end else begin
			if(output_valid) begin
				if(y != output_y - 1) begin
					y <= y + 8'd1;
				end else begin
					y <= 8'd0;
					if(x != output_x - 1) begin
						x <= x + 8'd1;
					end else begin
						x <= 8'd0;
						y <= 8'd0;
					end
				end
			end
		end
	end
	always @ (negedge clk) begin
		if(x == 0 && y == 0 && output_valid) begin
			o_sof <= 1;
		end else begin
			o_sof <= 0;
		end
	end
endmodule
*/

module output_control
#(
	parameter output_x = 4,
	parameter output_y = 4
)
(
	input clk,
	input rst,
	input output_valid,
	output o_sof
);
	reg [7:0] x, y;
	always @ (posedge clk or posedge rst) begin
		if(rst) begin
			x <= 8'd0;
			y <= -8'd1;
		end else begin
			if(output_valid) begin
				if(y != output_y - 1) begin
					y <= y + 8'd1;
				end else begin
					y <= 8'd0;
					if(x != output_x - 1) begin
						x <= x + 8'd1;
					end else begin
						x <= 8'd0;
						y <= 8'd0;
					end
				end
			end
		end
	end
	assign o_sof = (x == 0 && (y == -8'd1) && output_valid) ? 1'd1 : 1'd0;
endmodule
