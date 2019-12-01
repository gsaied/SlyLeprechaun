
	/* verilator lint_off COMBDLY */
	module rom_array_layer_1 #(
	parameter WIDTH=16,
	parameter ADDR=5
	)
	(
		input [ADDR-1:0] address ,
		input [ADDR-1:0] address2 ,
		output [15:0] c2 [0:1] 
	);	
	

  	(* rom_style="{distributed}" *)
	reg [WIDTH-1:0] rom_1 [0:2**ADDR-1] ;
  	(* rom_style="{distributed}" *)
	reg [WIDTH-1:0] rom_2 [0:2**ADDR-1] ;

initial  begin
$readmemb("weights.mem",rom_1,0,2**ADDR-1);
$readmemb("dd.mem",rom_2,0,2**ADDR-1);
end
assign c2[0] = rom_1[address] ;
assign c2[1] = rom_2[address2] ;
endmodule
