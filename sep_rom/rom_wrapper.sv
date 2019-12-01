module rom_wrapper (
	input clk,
	input rst,
	input address,
	output reg [15:0] rom_reg [0:63]
);
wire [15:0] comb_rom_wire [0:63]; 
rom_array_layer_1 u1 (
	.address(address),
	.rom_out(comb_rom_wire)
);	
	always @(posedge clk or negedge rst) begin
		if(!rst)
			for (int i = 0 ; i < 64 ; i++) begin
				rom_reg[i]<= 16'b0 ; 
			end
		else begin
			rom_reg <= comb_rom_wire;
		end
	end 
endmodule
