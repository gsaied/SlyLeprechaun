/* verilator lint_off COMBDLY */
module relu (
	input clk,
	input [15:0] fm_out,
	output [15:0] relu_out
);
	reg [15:0] x = 16'b0 ;
	always @(posedge clk) begin
		if (!fm_out[15])
			x<= fm_out ;
	end
	assign relu_out = x ; 
endmodule 
