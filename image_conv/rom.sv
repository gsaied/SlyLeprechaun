   parameter ROM_ADDR_BITS = 10 ;
   parameter ROM_WIDTH = 16 ;
module rom (
	input clk,
	input en [0:2], 
	/*
	input [ROM_ADDR_BITS-1:0] address1,
	input [ROM_ADDR_BITS-1:0] address2,
	input [ROM_ADDR_BITS-1:0] address3,
	
	output reg  [15:0] ch2_out, 
	output reg  [15:0] ch3_out, 
	output reg  [15:0] ch1_out  
	*/

	input [ROM_ADDR_BITS-1:0] address3 [0:2] ,
	output reg  [15:0] ch1_out [0:2]  
);


   (* rom_style="{distributed | block}" *)
   reg [ROM_WIDTH-1:0] ch1 [(2**ROM_ADDR_BITS)-1:0];
   (* rom_style="{distributed | block}" *)
   reg [ROM_WIDTH-1:0] ch2 [(2**ROM_ADDR_BITS)-1:0];
   (* rom_style="{distributed | block}" *)
   reg [ROM_WIDTH-1:0] ch3 [(2**ROM_ADDR_BITS)-1:0];


   initial begin
      $readmemb("weights.mem", ch1, 0, (2**ROM_ADDR_BITS)-1);
      $readmemb("weights2.mem", ch2, 0,(2**ROM_ADDR_BITS)-1);
      $readmemb("weights3.mem", ch3, 0, (2**ROM_ADDR_BITS)-1);
      //$readmemb("weight3.txt", ch3, (2**ROM_ADDR_BITS), 2*(2**ROM_ADDR_BITS)-1);
      end
      always @(posedge clk) begin
	      if (en[0]) begin
         ch1_out[0] <= ch1[address3[0]];
	 end
 end
      always @(posedge clk) begin
	      if (en[1]) begin
         ch1_out[1] <= ch2[address3[1]];
	 end
 end
      always @(posedge clk) begin
	      if (en[2]) begin
         ch1_out[2] <= ch3[address3[2]];
	 end
 end


endmodule
				
				
