/* verilator lint_off COMBDLY */
module rom_weight
#(
	parameter WIDTH =16,
	parameter ADDR = 5  
)
(
	//input clk,
	//input rst,
	input [ADDR-1:0] address ,
	output reg  [WIDTH-1:0] rom_out 
);
(*rom_style="{distributed}"*)
reg [WIDTH-1:0] rom [0:2**ADDR-1] ;
initial 
	$readmemb("img.txt",rom,0,2**ADDR-1) ;
///////////////////////
always@(*) begin
		rom_out<= rom[address] ; 
end
//
//
//reg [WIDTH-1:0] rom_out_wire [0:NUM-1] ;
//UNCOMMENT IF U WANT TO USE BRAM IMPLEMENTATION
//ADJUST OUTPUT PORTS AND SIGNALS 
/*
always@(posedge clk or negedge rst) begin
	if (!rst) begin
		for (int i =0 ; i <NUM ; i++) begin
			rom_out[i] <= 16'b0 ;
		end
	end
	else begin
		for (int i =0 ; i <NUM ; i++) begin
			rom_out[i] <= rom_out_wire[i] ;
		end
	end
end
*/
endmodule
