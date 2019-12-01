
	/* verilator lint_off COMBDLY */
	module rom_array_layer_1 #(
	parameter WIDTH=16,
	parameter KERNEL=1,
	parameter ADDR=10,
	parameter NUM=3)
	(
		input [ADDR-1:0] address ,
		output [WIDTH-1:0] rom_out [0:NUM-1]
	);	
	

  	(* rom_style="{distributed}" *)
	reg [WIDTH-1:0] rom_1 [0:2**ADDR-1] ;

  	(* rom_style="{distributed}" *)
	reg [WIDTH-1:0] rom_2 [0:2**ADDR-1] ;

  	(* rom_style="{distributed}" *)
	reg [WIDTH-1:0] rom_3 [0:2**ADDR-1] ;

  	(* rom_style="{distributed}" *)
	reg [WIDTH-1:0] rom_4 [0:2**ADDR-1] ;
initial  begin
$readmemb("file_1.mem",rom_1,0,736-1);
$readmemb("file_2.mem",rom_2,0,2**ADDR-1);
$readmemb("file_3.mem",rom_3,0,2**ADDR-1);
$readmemb("file_4.mem",rom_4,0,2**ADDR-1);
end
assign rom_out[0] = rom_1[address] ;
assign rom_out[1] = rom_2[address] ;
assign rom_out[2] = rom_3[address] ;
endmodule
