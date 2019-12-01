
	/* verilator lint_off COMBDLY */
	module rom_array_layer_1 #(
	parameter WIDTH=16,
	parameter KERNEL=1,
	parameter ADDR=10,
	parameter NUM=10)
	(
		input [ADDR-1:0] address ,
		input clk,
		input we,
		input [WIDTH-1:0] din,
//		output reg [WIDTH-1:0] out2,
//		output reg [WIDTH-1:0] out3, 
		output reg [WIDTH-1:0] out1 
	);	
	

  	(* rom_style="{distributed}" *)
	reg [WIDTH-1:0] rom_1 [0:736-1] ;

  //	(* rom_style="{distributed}" *)
//	reg [WIDTH-1:0] rom_2 [0:736-1] ;

  //	(* rom_style="{distributed}" *)
//	reg [WIDTH-1:0] rom_3 [0:736-1] ;
initial  begin
//$readmemb("file_1.mem",rom_1,0,736-1);
//$readmemb("file_2.mem",rom_2,0,736-1);
//$readmemb("file_3.mem",rom_3,0,736-1);
end
always @(posedge clk) begin
	if(we) begin
		 out1 <= rom_1[address] ;
//		 out2 <= rom_2[address] ;
//		 out3 <= rom_3[address] ;
		end
	   rom_1[address] <=din;
//	   rom_2[address] <=din;
//	   rom_3[address] <=din;
 end
endmodule
