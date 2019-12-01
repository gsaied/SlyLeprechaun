module ram_3d #(
	parameter SIZE = 32,
	parameter WIDTH= 16 ,
	parameter ADDRESS= 10
)	
(
	input clk,
	input [SIZE-1:0] wea,
	input [SIZE-1:0] ena,
	input [SIZE-1:0] web,
	input [SIZE-1:0] enb,
	input [ADDRESS-1:0] addra [0:SIZE-1],
	input [ADDRESS-1:0] addrb [0:SIZE-1],
	input [WIDTH-1:0] dina [0:SIZE-1],
	input [WIDTH-1:0] dinb [0:SIZE-1],
	output reg [WIDTH-1:0] douta  [0:SIZE-1],
	output reg [WIDTH-1:0] doutb  [0:SIZE-1] 
);
   //(* rom_style="{block}" *)
reg [WIDTH-1:0] ram3d [0:SIZE-1][0:2**ADDRESS-1] ;
genvar i ;
generate 
	for (i = 0 ; i < SIZE; i++) begin
		always@(posedge clk  ) begin
			if (ena[i]) begin
					if(wea[i]) begin
						ram3d[i][addra[i]] <=dina[i] ;
					end
						douta[i]<= ram3d[i][addra[i]] ;
			end
		end
	end
endgenerate
//end of port A

generate 
	for (i = 0 ; i < SIZE; i++) begin
		always@(posedge clk ) begin
			if(enb[i]) begin
				if(web[i]) begin
					ram3d[i][addrb[i]] <=dinb[i] ;
				end
					doutb[i]<= ram3d[i][addrb[i]] ;
			end
		end
	end
endgenerate
//end of port B
endmodule


	
