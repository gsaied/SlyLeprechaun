   parameter ROM_ADDR_BITS = 16 ;
   parameter ROM_WIDTH = 16 ;
module rom (
	input clk,
	input en, 
	input [ROM_ADDR_BITS-1:0] address1,
	input [ROM_ADDR_BITS-1:0] address2,
	input [ROM_ADDR_BITS-1:0] address3,
	output reg  [15:0] ch2_out, 
	output reg  [15:0] ch3_out, 
	output reg  [15:0] ch1_out  
);


   (* rom_style="{distributed | block}" *)
   reg [ROM_WIDTH-1:0] ch1 [(2**ROM_ADDR_BITS)-1:0];
   (* rom_style="{distributed | block}" *)
   reg [ROM_WIDTH-1:0] ch2 [(2**ROM_ADDR_BITS)-1:0];
   //(* rom_style="{distributed | block}" *)
   reg [ROM_WIDTH-1:0] ch3 [(2**ROM_ADDR_BITS)-1:0];


   initial begin
      $readmemb("weights.mem", ch1, 0, (2**ROM_ADDR_BITS)-1);
      $readmemb("weights2.mem", ch2, 0,(2**ROM_ADDR_BITS)-1);
      $readmemb("weights3.mem", ch3, 0, (2**ROM_ADDR_BITS)-1);
      end
      always @(posedge clk) begin
	      if (en) begin
         ch1_out <= ch1[address1];
	 end
 end
 /*
      always @(posedge clk) begin
	      if (en) begin
         ch2_out <= ch2[address2];
	 end
 end
 */
      always @(*) begin
	      if (en) begin
         ch3_out <= ch3[address3];
         ch2_out <= ch2[address2];
	 end
 end



endmodule
				
				
