
	/* verilator lint_off COMBDLY */
	module rom_array_layer_1 #(
	parameter WIDTH=16,
	parameter KERNEL=3,
	parameter ADDR=10,
	parameter NUM=16)
	(
		input [ADDR-1:0] address ,
		input clk,
		output reg [WIDTH-1:0] rom_out [0:NUM-1]
	);	
	

  	(* rom_style="{block}" *)
	reg [WIDTH-1:0] rom_1 [0:2**ADDR-1] ;

  	(* rom_style="{block}" *)
	reg [WIDTH-1:0] rom_2 [0:2**ADDR-1] ;

  	(* rom_style="{block}" *)
	reg [WIDTH-1:0] rom_3 [0:2**ADDR-1] ;

  	(* rom_style="{block}" *)
	reg [WIDTH-1:0] rom_4 [0:2**ADDR-1] ;

  	(* rom_style="{block}" *)
	reg [WIDTH-1:0] rom_5 [0:2**ADDR-1] ;

  	(* rom_style="{block}" *)
	reg [WIDTH-1:0] rom_6 [0:2**ADDR-1] ;

  	(* rom_style="{block}" *)
	reg [WIDTH-1:0] rom_7 [0:2**ADDR-1] ;

  	(* rom_style="{block}" *)
	reg [WIDTH-1:0] rom_8 [0:2**ADDR-1] ;

  	(* rom_style="{block}" *)
	reg [WIDTH-1:0] rom_9 [0:2**ADDR-1] ;

  	(* rom_style="{block}" *)
	reg [WIDTH-1:0] rom_10 [0:2**ADDR-1] ;

  	(* rom_style="{block}" *)
	reg [WIDTH-1:0] rom_11 [0:2**ADDR-1] ;

  	(* rom_style="{block}" *)
	reg [WIDTH-1:0] rom_12 [0:2**ADDR-1] ;

  	(* rom_style="{block}" *)
	reg [WIDTH-1:0] rom_13 [0:2**ADDR-1] ;

  	(* rom_style="{block}" *)
	reg [WIDTH-1:0] rom_14 [0:2**ADDR-1] ;

  	(* rom_style="{block}" *)
	reg [WIDTH-1:0] rom_15 [0:2**ADDR-1] ;

  	(* rom_style="{block}" *)
	reg [WIDTH-1:0] rom_16 [0:2**ADDR-1] ;
initial  begin
$readmemb("file_1.mem",rom_1,0,576-1);
$readmemb("file_2.mem",rom_2,0,2**ADDR-1);
$readmemb("file_3.mem",rom_3,0,2**ADDR-1);
$readmemb("file_4.mem",rom_4,0,2**ADDR-1);
$readmemb("file_5.mem",rom_5,0,2**ADDR-1);
$readmemb("file_6.mem",rom_6,0,2**ADDR-1);
$readmemb("file_7.mem",rom_7,0,2**ADDR-1);
$readmemb("file_8.mem",rom_8,0,2**ADDR-1);
$readmemb("file_9.mem",rom_9,0,2**ADDR-1);
$readmemb("file_10.mem",rom_10,0,2**ADDR-1);
$readmemb("file_11.mem",rom_11,0,2**ADDR-1);
$readmemb("file_12.mem",rom_12,0,2**ADDR-1);
$readmemb("file_13.mem",rom_13,0,2**ADDR-1);
$readmemb("file_14.mem",rom_14,0,2**ADDR-1);
$readmemb("file_15.mem",rom_15,0,2**ADDR-1);
$readmemb("file_16.mem",rom_16,0,2**ADDR-1);
end
always @(posedge clk) begin

rom_out[0] <= rom_1[address] ;
rom_out[1] <= rom_2[address] ;
rom_out[2] <= rom_3[address] ;
rom_out[3] <= rom_4[address] ;
rom_out[4] <= rom_5[address] ;
rom_out[5] <= rom_6[address] ;
rom_out[6] <= rom_7[address] ;
rom_out[7] <= rom_8[address] ;
rom_out[8] <= rom_9[address] ;
rom_out[9] <= rom_10[address] ;
rom_out[10] <= rom_11[address] ;
rom_out[11] <= rom_12[address] ;
rom_out[12] <= rom_13[address] ;
rom_out[13] <= rom_14[address] ;
rom_out[14] <= rom_15[address] ;
rom_out[15] <= rom_16[address] ;
end
endmodule
