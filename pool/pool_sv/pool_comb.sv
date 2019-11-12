/* verilator lint_off COMBDLY */
module pool_comb (
	input [15:0] fm [0:63],
	output  [15:0] pool_out
);
	reg [15:0] level1 [0:31] ; 
	reg [15:0] level2 [0:15] ; 
	reg [15:0] level3 [0:7] ; 
	reg [15:0] level4 [0:3] ; 
	reg [15:0] level5 [0:1] ; 
	reg [15:0] level6 ;
       always @(*) begin
			for ( int i = 0 ; i <32 ; i++) begin
				level1[i] <= (fm[2*i] + fm[(2*i)+1]) ; 
			end
			for ( int i = 0 ; i<16 ; i++) begin
				level2[i]<= (level1[2*i] + level1[(2*i)+1]) ; 
			end
			for (int i = 0 ; i<8 ; i++) begin
				level3[i]<= (level2[2*i] + level2[(2*i)+1]) ; 
			end
			for (int j = 0 ; j< 4 ; j++) begin
				level4[j] <= (level3[2*j] + level3[(2*j)+1]) ; 
			end
			for (int j = 0 ; j< 2 ; j++) begin
				level5[j] <= (level4[2*j] + level4[(2*j)+1]) ; 
			end
			level6 <=( level5[0] + level5[1]) ; 
		end
	assign pool_out  = level6 >> 6 ; //division by 64
endmodule
