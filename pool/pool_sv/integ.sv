module integ (
	input clk,start,
	output clk_gated,
	input [15:0] fm_in [0:63],
	output rst,
	output [15:0] pool
);
	reg [15:0] mem [0:63] ; 
	always @(posedge clk ) begin
		if (!rst) begin
			for (int i = 0 ; i< 64 ; i++) begin
				mem[i] <= 0 ; 
			end		
		end
		else
			for (int j = 0 ; j< 64 ; j++) begin
				mem[j] <= fm_in[63-j] ;
			end
	end
	assign clk_gated = clk && start ; 
	pool u1 (
		.clk(clk_gated),
		.rst(rst),
		.pool_out(pool),
		.fm(mem)
	);

endmodule 

