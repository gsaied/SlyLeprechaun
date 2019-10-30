`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/25/2019 02:39:59 PM
// Design Name: 
// Module Name: squeeze2
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module squeeze2 #(parameter INPUT_MULTIPLICAND = 16) (
input rst,
	input clk,stop,
	input [INPUT_MULTIPLICAND-1:0] pixel_in ,
	input [INPUT_MULTIPLICAND-1:0] kernel_in,
	output [2*INPUT_MULTIPLICAND-1:0] mac_out 
    );
    genvar i;
generate 
	for (i=0; i < 256 ; i=i+1) 
	begin :mac 
	mac #(.INPUT_MULTIPLICAND(INPUT_MULTIPLICAND))u(.clk(clk),.rst(rst),.stop(stop),.pixel_in(pixel_in),.kernel_in(kernel_in),.mac_out(mac_out));
	end
	endgenerate
	endmodule
