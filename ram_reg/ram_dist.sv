module ram_dist #
(
   parameter RAM_WIDTH = 16 ,
   parameter RAM_ADDR_BITS = 10 
   )
(
      input clock,      
      input write_enable,
      output reg [RAM_WIDTH-1:0] output_data ,
      input [RAM_ADDR_BITS-1:0]  read_address,    
      input [RAM_ADDR_BITS-1:0]  write_address,   
      input [RAM_WIDTH-1:0]  input_data 
);

   (* ram_style="registers" *)
   reg [RAM_WIDTH-1:0] ram_dist  [736-1:0];


   initial begin
	$readmemb("file_1.mem",ram_dist,0,736-1);
   end

   always @(posedge clock ) begin
      if (write_enable )
         ram_dist [ write_address ]  <=  input_data ;
					
   	 output_data  <=  ram_dist [ read_address ];
 end
				
   endmodule
