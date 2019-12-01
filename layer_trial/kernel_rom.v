module rom_kernels #(
	parameter WIDTH = 16 ,
	parameter DEPTH = 736,
	parameter NUM = 512
)
(
	input clk,
	input [NUM-1:0] en,
	input [WIDTH-1:0] addr [0:NUM-1],
	output reg [WIDTH-1:0] rom_out [0:NUM-1]
);
genvar i ;
generate for ( i = 0 ; i < NUM-1 ; i++) begin
	rom_1k u_i (
		.clk(clk),
		.en(en[i]),
		.address(addr[i]),
		.dout(rom_out[i])
	);
	initial begin
		$readmemb("weights.mem",u_i.rom,i*(736),(i+1)*736-1) ;
end	
endgenerate 
endmodule
