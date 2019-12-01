module img_rom #(
	parameter WIDTH= 16,
	parameter CH = 3,
	parameter ADDR = 18, 
	parameter WIN = 256
)
(
	input [ADDR-1:0] address,
	input clk ,
	output reg  [WIDTH-1:0] img_out
);
(*rom_style="{distributed}"*)
reg [WIDTH-1:0] img_rom [0:2**ADDR-1] ;
wire [WIDTH-1:0] img_wire ;
initial 
	$readmemb("img.txt",img_rom,0,2**ADDR-1) ; 
assign img_wire = img_rom[address] ; 
always @(posedge clk ) begin
	img_out<= img_wire ; 
end
endmodule 
