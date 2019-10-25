/*
*FIRST TRIAL TO IMPLEMENT A MAC MODULE
*CREATED ON OCTOBER 5th 2019
*/
/* verilator lint_off COMBDLY */
module mac #(parameter INPUT_MULTIPLICANT = 16 ) 
	(
       input clk,rst,
       input start,
       input signed [INPUT_MULTIPLICANT-1 :0] pixel_in ,
       input signed [INPUT_MULTIPLICANT-1 :0] kernel_in ,
       output [2*INPUT_MULTIPLICANT-1 :0] mac_out   
);       
	wire [32-1 :0] wire_mul ;
	multip M1 (
		.pixel_in(pixel_in),
		.kernel_in(kernel_in),
		.mul_out(wire_mul)
	);
	accumulator A1 (
		.clk(clk),
		.rst(rst),
		.mul_out(wire_mul),
		.acc_enable(start),
		.mac_out(mac_out) 
	);
endmodule
module multip #(parameter INPUT_MULTIPLICANT = 16 ) 
	(
	output reg  [2*INPUT_MULTIPLICANT -1 :0 ] mul_out ,
	input signed [INPUT_MULTIPLICANT-1 :0] pixel_in , 
	input signed [INPUT_MULTIPLICANT-1 :0] kernel_in 
);
	always @(*) begin
		mul_out <= pixel_in * kernel_in ;
	end
endmodule

module accumulator 
	(
	input clk ,
	input rst ,
	input [32-1 :0] mul_out ,
	input acc_enable ,
	output reg signed [32-1 :0] mac_out  
);
	wire clk_gated ; 
	and acc_gating (clk_gated, clk, acc_enable) ;
	/////////////
	always @(posedge clk_gated or negedge rst ) begin
	if (!rst) begin
		mac_out <= 32'b0 ;
	end
	else begin
			mac_out<= mac_out+mul_out ;
		end
		//mac_out<= #TCQ mac_mux_out ; uncomment if metastable
	end
endmodule
