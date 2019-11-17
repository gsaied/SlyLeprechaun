/* verilator lint_off COMBDLY */
module rom_comb
#(
	parameter WIDTH =16,
	parameter NUM = 100 ,
	parameter ADDR=10
)
(
	//input clk,
	//input rst,
	input [ADDR-1:0] address [0:NUM-1],
	output reg  [WIDTH-1:0] rom_out [0:NUM-1]
);
(*rom_style="{distributed}"*)
reg [WIDTH-1:0] rom [0:2**ADDR-1] ;
initial 
	$readmemb("img.txt",rom,0,2**ADDR-1) ;
///////////////////////
always@(*) begin
	for (int i = 0 ; i < NUM ; i++) begin
		rom_out[i]<= rom[address[i]] ; 
	end
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
