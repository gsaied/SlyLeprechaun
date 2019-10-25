/*
* THIS MODULE WRAPS 3 MAC MODULES AND ADDER TREE TO PERFORM 3D CONV
* USING THIS MODULE, CONV1 WRAPPER SHOULD BE EASIER TO IMPLEMENT
* CREATED ON 19th OCT
*/
/* verilator lint_off COMBDLY */
module mac_volume (
	input clk,
	input rst,
	input start,
 	input [15:0] mac_1_pixel, 
 	input [15:0] mac_1_kernel, 
 	input [15:0] mac_2_pixel, 
 	input [15:0] mac_2_kernel, 
 	input [15:0] mac_3_pixel, 
 	input [15:0] mac_3_kernel, 
	output reg  [15:0] conv_out_relued
);
	reg [31:0] mac_1_out ;
	reg [31:0] mac_2_out ;
	reg [31:0] mac_3_out ;
	reg [31:0] final_out ;
	mac inst1 (
		.clk(clk),
		.rst(rst),
		.start(start),
		.pixel_in(mac_1_pixel),
		.kernel_in(mac_1_kernel),
		.mac_out(mac_1_out)
	);
	mac inst2 (
		.clk(clk),
		.rst(rst),
		.start(start),
		.pixel_in(mac_2_pixel),
		.kernel_in(mac_2_kernel),
		.mac_out(mac_2_out)
	);
	mac inst3 (
		.clk(clk),
		.rst(rst),
		.start(start),
		.pixel_in(mac_3_pixel),
		.kernel_in(mac_3_kernel),
		.mac_out(mac_3_out)
	);
	always @(*) begin
		final_out = mac_1_out + mac_2_out + mac_3_out;
		if (final_out[31] == 1'b1 )
			conv_out_relued <= 16'h0000 ;
		else
			conv_out_relued <= final_out[23:8];
	end
endmodule
