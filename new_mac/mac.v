module mac (
	input rst,
	input clr,
	input clk,
	input [15:0] pix,
	input [15:0] ker,
	output reg [31:0] mul_out 
);
wire [31:0] intermed ;
wire rst_and ; 
assign rst_and = clr && rst ;
	assign intermed = pix*ker + mul_out ; 
	always @(posedge clk ) begin
		if (!rst_and)
			mul_out <= 32'b0 ;
		/*
		else if(clr)
			mul_out <= 32'b0 ;
		*/
		else
			mul_out <= intermed ; 
	end
endmodule
