/* THIS MODULE WRAPS 2 INSTANCES OF AVG. POOL
* CLOCK OF THESE INSTANCES ARE DIVIDED BY 10 TO
* SYNCHRONIZE WITH PRECEEDING LAYER
*/
module pool_wrapper (
	input clk,
	input rst,
	input [15:0] fm1 [0:63],
	input [15:0] fm2 [0:63],
	output  [15:0] pool_out_1,
	output  [15:0] pool_out_2 
);
	wire clk_divided ; 
	clock_divider clk_div_inst (
		.clk(clk),
		.rst(rst),
		.clk_10(clk_divided)
	);
	pool pool_inst_1 (
		.clk(clk_divided),
		.rst(rst),
		.fm(fm1),
		.pool_out(pool_out_1)
	);
	pool pool_inst_2 (
		.clk(clk_divided),
		.rst(rst),
		.fm(fm2),
		.pool_out(pool_out_2)
	);
endmodule 

