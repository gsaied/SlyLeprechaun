module dut (
	input clk,
	input rst,
	input d, 
	input load,
	output reg q
);
always @(posedge clk or negedge rst) begin
	if(!rst) begin
		q<= 1'b0 ;
	end
	else begin
		if (load == 1'b1 ) 
			q<= 1'b1; 
		if (q == 1'b1) 
			q<= 1'b0 ; 
end
endmodule
