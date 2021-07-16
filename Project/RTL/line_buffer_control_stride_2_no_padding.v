module line_buffer_control_stride_2_no_padding
	#(parameter input_y = 64)
	(
	clk,
	rst,
	sof,
	input_valid,
	output_valid
);	
	localparam state_rst = 3'b000;
	localparam state_idle = 3'b001;
	localparam state_return = 3'b010;
	localparam state_wait = 3'b011;
	
	input clk;
	input rst;
	input sof;
	input input_valid;
	output reg output_valid;

	reg [2:0] state;
	reg [10:0] input_valid_count;
	reg [10:0] y_count;
	
	reg [2:0]     return_count;
	reg [7:0]     wait_count;
	
	always @ (posedge clk) begin
		if(rst) begin
			output_valid <= 1'b0;
			state <= state_rst; 
			return_count <= 3'd0;
		end else if(sof) begin
			output_valid <= 1'b0;
			y_count <= 11'd0;
			wait_count <= 2'b0;
			state <= state_idle;
			if(input_valid) begin
				input_valid_count <= 11'b1;
			end else begin
				input_valid_count <= 11'b0;
			end
		end
		else begin
			case(state)
				state_rst:
					begin
						if(sof) begin
							state <= state_idle;
							output_valid <= 1'b0;
							y_count <= 11'd0;
							wait_count <= 2'b0;
							return_count <= 3'd0;
							if (input_valid) begin
								input_valid_count <= 11'd1;
							end else begin
								input_valid_count <= 11'd0;
							end
						end
					end
				state_idle:
					begin
						if(input_valid && input_valid_count != input_y*2 + 3 - 1) begin
							input_valid_count <= input_valid_count + 11'd1;
						end else begin
							if(input_valid) begin
								output_valid <= 1'b1;
								y_count <= 11'd1;
								state <= state_return;
							end
						end		
					end
				state_return:
					begin
						if(y_count != (input_y - 1) /2) begin
							if(input_valid) begin
								return_count <= return_count + 3'd1;
								if(return_count == 1) begin
									return_count <= 0;
									output_valid <= 1'b1;
									y_count <= y_count + 11'd1;
								end else begin
									output_valid <= 1'b0;
								end
							end else begin
								output_valid <= 1'b0	;
							end	
						end else begin
							y_count <= 11'd0;
							output_valid <= 1'b0;
							state <= state_wait;
							if(input_valid) begin
								wait_count <= 8'd1;
							end else begin
								wait_count <= 8'd0; //fix bug 1.1
							end			
						end
					end
				state_wait:
					begin
						if(input_y == 64) begin
							if(input_valid && wait_count != input_y + 2 + 1) begin
								wait_count <= wait_count + 1'd1;
							end else begin
								if(input_valid) begin
									y_count <= 11'd1;
									state <= state_return;
									output_valid <= 1'b1;
								end
							end
						end else begin
							if(input_valid && wait_count != input_y + 2) begin
								wait_count <= wait_count + 1'd1;
							end else begin
								if(input_valid) begin
									y_count <= 11'd1;
									state <= state_return;
									output_valid <= 1'b1;
								end
							end
						end
					end
			endcase
		end
	end
endmodule