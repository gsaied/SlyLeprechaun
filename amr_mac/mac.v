module mac #(parameter INPUT_MULTIPLICAND = 16)
 (
	input rst,
	input clk,stop,
	input [INPUT_MULTIPLICAND-1:0] pixel_in ,
	input [INPUT_MULTIPLICAND-1:0] kernel_in,
	output reg [2*INPUT_MULTIPLICAND-1:0] mac_out 
);
//wire [2*INPUT_MULTIPLICAND-1:0] intermed ;
	//assign intermed = pixel_in *kernel_in + mac_out ; 
	always @(posedge clk) begin
		if (rst == 1'b1)
			mac_out <= 32'b0 ;
		else if (stop==1'b0 && kernel_in!=1'b0 && pixel_in!=1'b0)
			mac_out <= pixel_in *kernel_in + mac_out ; 
	end
endmodule