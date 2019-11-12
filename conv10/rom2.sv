module rom2
#(
	parameter WIDTH =16,
	parameter ADDR=10
)
(
	input clk,
	input en,
	input [ADDR-1:0] address,
	output reg [WIDTH-1:0] rom_out 
);
(*rom_style="{distributed | block}"*)
reg [WIDTH-1:0] rom [0:2**ADDR-1] ;
	always@(posedge clk ) begin
		if(en)
			rom_out<= rom[address]; 
	end
endmodule
