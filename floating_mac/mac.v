/*THIS IS A 16-BIT FLOATING POINT MAC MODULE
* CREATED ON 22th OCT
*/
module mac (
	input clk,
	input rst,
	input [15:0] pixel,
	input [15:0] kernel,
	output reg [15:0] mac_out
);
	wire sign_bit ; 
	wire [4:0] exponent ; 
	wire [19:0] mantissa ; 
	assign sign_bit = pixel[15] ^ kernel[15] ;
	assign exponent = pixel[14:10] + kernel[14:10] ;
	assign mantissa = pixel[9:0] * kernel[9:0] ;
	always @(posedge clk or negedge rst) begin
		if (!rst) 
			mac_out<= 16'b0 ; 
		else
			mac_out<= {sign_bit,exponent,mantissa[19:10]} + mac_out ;
	end
endmodule
