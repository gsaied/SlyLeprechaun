module rom_1k #(
	parameter WIDTH = 16,
	parameter ADDR  = 10
)
(
	input clk,
	input en,
	output reg [WIDTH-1:0] dout,
	input [ADDR-1:0] addr
);
	(*rom_style = "{block}"*)
	reg [WIDTH-1:0] rom [0:2**ADDR-1] ;
	always @(posedge clk) begin
		if(en)
			dout <= rom[addr] ; 
	end
endmodule
