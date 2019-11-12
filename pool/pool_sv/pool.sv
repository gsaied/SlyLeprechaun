/* IMPLEMENTATION OF AVG. POOL MODULE WITH SV
* CREATED ON NOV 1st
*/
/* verilator lint_off COMBDLY */

module pool (
	input [15:0] fm [0:63],
	(*PERIOD = "5 ns"*)
	(*clock_signal = "yes"*)
	input clk , 
	input rst , 
	output  [15:0] pool_out
);
	reg [15:0] level1 [0:31] ; 
	reg [15:0] level2 [0:15] ; 
	reg [15:0] level3 [0:7] ; 
	reg [15:0] level4 [0:3] ; 
	reg [15:0] level5 [0:1] ; 
	reg [15:0] level6 ;
  	always @(posedge clk or negedge rst) begin
		if (!rst) begin
			for (int i = 0 ; i< 32 ; i++) begin
				level1[i] <= 16'b0 ; 
				level2[(i/2)]<= 16'b0 ; 
				level3[(i/4)]<= 16'b0 ; 
				level4[(i/8)]<= 16'b0 ; 
				level5[(i/16)]<= 16'b0 ; 
				level6<=16'b0 ; 
			end
		end
		else begin
			for ( int i = 0 ; i <32 ; i++) begin
				level1[i]<= fm[2*i] + fm[(2*i)+1] ; 
			end
			for ( int i = 0 ; i<16 ; i++) begin
				level2[i]<= level1[2*i] + level1[(2*i)+1] ; 
			end
			for (int i = 0 ; i<8 ; i++) begin
				level3[i]<= level2[2*i] + level2[(2*i)+1] ; 
			end
			for (int j = 0 ; j< 4 ; j++) begin
				level4[j] <= level3[2*j] + level3[(2*j)+1] ; 
			end
			for (int j = 0 ; j< 2 ; j++) begin
				level5[j] <= level4[2*j] + level4[(2*j)+1] ; 
			end
			level6 <= level5[0] + level5[1] ; 
		end
	end
	assign pool_out  = level6 >> 6 ; //division by 64
endmodule 
