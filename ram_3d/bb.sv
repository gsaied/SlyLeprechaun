module bb #
(
   parameter RAM_WIDTH = 16 ,
   parameter RAM_ADDR_BITS = 10 
   )
(
      input clock,      
      input write_enable,
      output [RAM_WIDTH-1:0] output_data ,
      input [RAM_ADDR_BITS-1:0]  read_address,    
      input [RAM_ADDR_BITS-1:0]  write_address,   
      input [RAM_WIDTH-1:0]  input_data 
);

   (* ram_style="distributed" *)
   reg [RAM_WIDTH-1:0] ram_dist  [(2**RAM_ADDR_BITS)-1:0];

   wire [RAM_WIDTH-1:0] output_data ;


   always @(posedge clock )
      if (write_enable )
         ram_dist [ write_address ]  =  input_data ;

   assign output_data  =  ram_dist [ read_address ];
					
				
   endmodule
