module rom_1k_master
#(parameter NUM = 10 )
(
	input clk,
	input [NUM-1:0] en,
	output reg [15:0] rom_1k_master_out [0:NUM-1],
	input [9:0] addr_master [0:NUM-1]
);
genvar i ;
generate for (i= 0 ; i< NUM-1 ; i++) begin
	rom_1k rom_1k_i (
			.clk(clk),
			.en(en[i]),
			.addr(addr_master[i]),
			.dout(rom_1k_master_out[i])
		);
	initial begin
		$readmemb("weights.txt",rom_1k_i.rom,i*(1024),(i+1)*1024 -1 );
	end

end
endgenerate 
endmodule
