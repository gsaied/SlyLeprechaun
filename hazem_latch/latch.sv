module latch ( 
	input clk,
	input en,
	input d,
	output reg q );


always @(posedge clk) begin
	case(en) 
		1'b0:q<= d; 
	endcase 
end
endmodule
