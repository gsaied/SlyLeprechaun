/* THIS MODULE WRAPS THE FINAL CONV10 LAYERS WITH POOL 
* AND NON-SOFTMAX LAYERS
* CREATED ON DEC 2nd
*/
module conv10_wrapper(
	input clk,
	output clk_sampling,
	input conv10_en,
	output conv10_end,
	output reg final_value
);
reg [15:0] pool_ready_data [0:511] ;
conv10 u1 (
	.clk(clk),
	.rst(rst),
	.conv10_en(conv10_en),
	.conv10_end(conv10_end),
	.ifm(ifm),
	.ofm(pool_ready_data)
);
////////////////////////////////
///////////////////////////////
reg pool_clk ;
always @(posedge clk) begin
	pool_clk<= u1.clr_pulse ;//divide by2	
end
wire [15:0] soft_max_ready_data [0:7] ;
genvar i ;
generate for (i = 0 ; i < 8 ; i++) begin
	pool p_i (
		.clk(clk),
		.rst(rst),
		.pool_out(soft_max_ready_data[i]),
		.fm(pool_ready_data[i*64:(i+1)*64-1])
	);
end	
endgenerate


endmodule
