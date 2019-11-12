/* CLOCK DIVIDER TO SYNCHRONIZE AVG. POOLING WITH PRECEEDING LAYER
* EVERY 10 CYCLES A NEW INPUT IS PASSED TO BOTH AVG. POOL INSTANCES
*/
module clock_divider (
	input clk,
	input rst,
	output reg clk_10 
);
	reg [3:0] clock_div ;
	always @(posedge clk or negedge rst) begin
		if (!rst) begin
			clock_div <= 4'b0 ; 
			clk_10 <= 1'b0 ; 
		end
		else if (clock_div == 4'b1010) begin
			clock_div <= 4'b0 ; 
			clk_10 <= !clk_10 ;
		end
		else
			clock_div <= clock_div +1 ; 
	end
endmodule 
