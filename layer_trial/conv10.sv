/* FIRST IMPLEMENTATION OF A CONV LAYER
* LAYER: CONV10
* INPUT SIZE: 8*8*736
* OUTPUT SIZE: 8*8*512
* STRIDE: 1
* WINDOW: 1*1
*/

module conv10#(
parameter DSP_NO = 256 ,
parameter STRIDE = 1 ,
parameter W_IN = 8 ,
parameter H_IN = 8 ,
parameter WIDTH = 16 ,
parameter CHIN = 736 , 
parameter CHOUT = 512  
)       
	(
	input clk,
	input rst,
	input conv10_en,
	input [15:0] ifm [0:DSP_NO-1],
	output reg [15:0] ofm [0:DSP_NO-1]

);
wire [2*WIDTH-1:0] ofmw [0:DSP_NO-1];
reg [1:0] counter_3 ;
reg clk_3 ; 
reg [WIDTH-1:0] kernels [0:DSP_NO-1] ; 
////////
//this signal is very important to track
//represents a pulse to clr pin of mac to reset every 3 cycles of clk
//
reg clr_pulse ; 
///////
// counter to generate clock_divider
always @(posedge clk or negedge rst) begin
	if(!rst) begin
		counter_3<= 2'b0 ; 
		clr_pulse <= 1'b0 ;
	end
	else begin
		if (counter_3 == 2'b11 ) begin
			counter_3<= 2'b0 ; 
			clk_3 <= !clk_3 ;
			clr_pulse <= 1'b1 ;
		end
		else begin
			clr_pulse <= 1'b0 ; 
			counter_3<= counter_3 +1 ;	
		end
	end
end
// wait for all channels to be processed
always@(posedge clk_3) begin
	if(conv10_en) begin
		for (int i = 0 ; i< DSP_NO ; i++) begin
		ofm[i] <= ofmw[i][23:8] ; 
	end
	end
end
//
genvar i ; 
generate for (i = 0 ; i < 256 ; i++) begin
	mac u_i  (
		.clr(clr_pulse),
		.clk(clk),
		.rst(rst),
		.pix(ifm[i]),
		.mul_out(ofmw[i]),
		.ker(kernels[i])
	);
end
endgenerate//#FILTERS instances of macs
endmodule
