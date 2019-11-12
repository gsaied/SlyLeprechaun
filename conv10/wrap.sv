module wrap(
	input clk,
	input en,
	input [15:0] address,
	output [15:0] chs [0:2]
);
rom u1 (
	.clk(clk),
	.en(en),
	.address1(address),
	.address2(address),
	.address3(address),
	.ch1_out(chs[0]),
	.ch2_out(chs[1]),
	.ch3_out(chs[2]) 
);

endmodule
