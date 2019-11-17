module rom2
#(
	parameter WIDTH =16,
	parameter ADDR=10
)
(
	input [ADDR-1:0] address,
	output [WIDTH-1:0] rom_out 
);
(*rom_style="{distributed | block}"*)
reg [WIDTH-1:0] rom [0:2**ADDR-1] ;
initial 
	$readmemb("weights.txt",rom,0,2**ADDR-1) ;
assign	rom_out= rom[address]; 
endmodule
