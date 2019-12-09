module ram_3d #(
	parameter ram_num = 16 ,
	parameter width= 16 ,
	parameter address= 10
)
(
	input clk,
	input rst,
	input  wea,
	input  ena,
	input  web,
	input  enb,
	input [address-1:0] addra [0:ram_num-1],
	input [address-1:0] addrb [0:ram_num-1],
	input [width-1:0] dina [0:ram_num-1],
	input [width-1:0] dinb [0:ram_num-1],
	output reg [width-1:0] douta  [0:ram_num-1],
	output reg [width-1:0] doutb  [0:ram_num-1] 
);
   (* ram_style="{block}" *)
reg [width-1:0] ram3d [0:ram_num-1][0:2**address-1] ;
genvar i ;
integer j;
generate 

	for (i = 0 ; i < ram_num; i++) begin
		always@(posedge clk  ) begin
		    
			if (ena) begin
					if(wea) begin
						ram3d[i][addra[i]] <=dina[i] ;
					end
						douta[i]<= ram3d[i][addra[i]] ;
			end
		end
	end
endgenerate
//end of port A

generate 
	for (i = 0 ; i < ram_num; i++) begin
		always@(posedge clk ) begin
			if(enb) begin
				if(web) begin
					ram3d[i][addrb[i]] <=dinb[i] ;
				end
					doutb[i]<= ram3d[i][addrb[i]] ;
			end
		end
	end
endgenerate
//end of port B
endmodule


	
