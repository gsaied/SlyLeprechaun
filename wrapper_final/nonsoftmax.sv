/* IMPLEMENTATION OF NON SOFTMAX LAYER
* CREATED ON 4th OCT
*/

module nonsoftmax (
	input clk,
	input rst, 
	output [9:0] prediction,
	input [15:0] fm 
);
reg [9:0] counter ; 
reg [9:0] index ; 
reg [15:0] comp_feedback ;
always @(posedge clk or negedge rst) begin
	if (!rst) begin
		counter <= 10'b0 ; 
		index <= 10'b0 ; 
		comp_feedback <= 16'b0 ; 
	end
	else if (fm > comp_feedback ) begin
		comp_feedback <= fm ;
		index <= counter  ;
		counter <= counter +1 ;
	end
	else
		counter <= counter +1 ;
end
assign prediction  = index ;
endmodule
