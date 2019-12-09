
module biasing_rom (
	output [15:0] bias_mem [0:16-1]
);

reg [16-1:0] bias_reg_0 = 16'b0000000000000000;
reg [16-1:0] bias_reg_1 = 16'b0000000110100110;
reg [16-1:0] bias_reg_2 = 16'b0000001110010010;
reg [16-1:0] bias_reg_3 = 16'b1000000011110000;
reg [16-1:0] bias_reg_4 = 16'b0000001100011000;
reg [16-1:0] bias_reg_5 = 16'b1000000000000001;
reg [16-1:0] bias_reg_6 = 16'b0000000000000000;
reg [16-1:0] bias_reg_7 = 16'b1000000000000001;
reg [16-1:0] bias_reg_8 = 16'b0000000000000000;
reg [16-1:0] bias_reg_9 = 16'b1000000000111100;
reg [16-1:0] bias_reg_10 = 16'b0000000011101000;
reg [16-1:0] bias_reg_11 = 16'b0000000000000000;
reg [16-1:0] bias_reg_12 = 16'b0000000111101101;
reg [16-1:0] bias_reg_13 = 16'b0000010000101001;
reg [16-1:0] bias_reg_14 = 16'b0000001011001110;
reg [16-1:0] bias_reg_15 = 16'b1000000000000001;
assign bias_mem[0] = bias_reg_0;
assign bias_mem[1] = bias_reg_1;
assign bias_mem[2] = bias_reg_2;
assign bias_mem[3] = bias_reg_3;
assign bias_mem[4] = bias_reg_4;
assign bias_mem[5] = bias_reg_5;
assign bias_mem[6] = bias_reg_6;
assign bias_mem[7] = bias_reg_7;
assign bias_mem[8] = bias_reg_8;
assign bias_mem[9] = bias_reg_9;
assign bias_mem[10] = bias_reg_10;
assign bias_mem[11] = bias_reg_11;
assign bias_mem[12] = bias_reg_12;
assign bias_mem[13] = bias_reg_13;
assign bias_mem[14] = bias_reg_14;
assign bias_mem[15] = bias_reg_15;
endmodule
