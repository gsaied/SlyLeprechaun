module mac (
	input rst,
	input clk,
	input [15:0] pix,
	input [15:0] ker,
	output reg [31:0] mul_out 
);
wire [31:0] intermed ;
	assign intermed = pix*ker + mul_out ; 
	always @(posedge clk ) begin
		if (rst == 1'b1)
			mul_out <= 32'b0 ;
		else
			mul_out <= intermed ; 
	end
endmodule
