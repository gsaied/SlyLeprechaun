module rom_wrapper(
	input clk,
	input [4:0] address,
	output reg [15:0] rom_out [0:63]
);
wire [15:0] rom_wire [0:63] ;
rom_array_layer_1 u1 (
	.address(address),
	.rom_out(rom_wire)
);
	always @(posedge clk) begin
		rom_out<= rom_wire ; 
	end
endmodule
