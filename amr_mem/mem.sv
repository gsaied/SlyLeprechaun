`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/29/2019 09:28:21 AM
// Design Name: 
// Module Name: mem
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module mem#(
    parameter ram_num=64,
    parameter num=8,
	parameter width= 16 ,
	parameter address= 10
)

(
input clk,
input rst,
input rw,
input[width-1:0] conv1[0:ram_num-1],
input [width-1:0] expand21x1[0:ram_num-1],
input [width-1:0] expand23x3[0:ram_num-1],
input clkconv1,
input clkexpand21x1,
input clkexpand23x3,
input enconv1,
input enexpand21x1,
input enexpand23x3,
output [width-1:0] douta [0:ram_num-1],
output [width-1:0] doutb [0:ram_num-1]
    );
   
   
reg clock1;
reg clock2;
reg [address-1:0] addra1 [0:ram_num-1];
reg [address-1:0] addrb [0:ram_num-1];
reg [address-1:0] addra2 [0:ram_num-1];
reg [width-1:0] dina1 [0:num-1][0:ram_num-1];
reg [width-1:0] dina2 [0:num-1][0:ram_num-1];
reg [width-1:0] dinb [0:ram_num-1];
reg [num-1:0] ena2;
reg [num-1:0] web;
reg [num-1:0] enb;
reg [num-1:0] wea1;
reg [num-1:0] wea2;
reg [num-1:0] ena1;
   
genvar i;
generate 
    for (i=0; i < num ; i=i+1) begin :ram_3d1 
        ram_3d #(
        .ram_num(ram_num),
        .width(width),
        .address(address))
        u(
        .clk(clock1), 
        .rst(rst), 
        .wea(wea1[i]), 
        .ena(ena1[i]), 
        .web(web[i]), 
        .enb(enb[i]), 
        .addra(addra1),
        .addrb(addrb),
        .dina(dina1[i]),
        .dinb(dinb),
        .douta(douta),
        .doutb(doutb)
        );
    end



    for (i=0; i < num ; i=i+1) begin :ram_3d2 
        ram_3d #(
        .ram_num(ram_num),
        .width(width),
        .address(address))
        u(
        .clk(clock2), 
        .rst(rst), 
        .wea(wea2[i]), 
        .ena(ena2[i]), 
        .web(web[i]), 
        .enb(enb[i]), 
        .addra(addra2),
        .addrb(addrb),
        .dina(dina2[i]),
        .dinb(dinb),
        .douta(douta),
        .doutb(doutb)
        );
    end
    
    
endgenerate

integer address_counter;
integer addressrams_counter;
integer set1_counter=0; 
integer set2_counter=0;
initial begin

    
    
    for(addressrams_counter=0;addressrams_counter<ram_num;addressrams_counter++) begin
    
        addra1[addressrams_counter]=0;
        addra2[addressrams_counter]=0;
    end
    
    
    end
    
    



always@(*) begin

   case({enconv1,enexpand21x1,enexpand23x3}) 
   
        3'b100: begin
           clock1 = clkconv1;
           clock2 = clkconv1;
           
           //while ( <num) begin
	   for ( int i = 0 ; i < num ; i++) begin
               dina1[i]=conv1;
               dina2[i]=conv1;
           end
           
        end
        
        
        3'b011:begin
           clock1 = clkexpand21x1;
           clock2 = clkexpand23x3;
           
	   for ( int i = 0 ; i < num ; i++) begin
               dina1[i]=expand21x1;
               dina2[i]=expand23x3;
           end
           
        end   
        
        default: begin
            clock1 = 0;
            clock2 = 0;
            
	   for ( int i = 0 ; i < num ; i++) begin
                
		   for ( int j = 0 ; j < ram_num ; j++) begin
                   dina1[i][j]=0;
                   dina2[i][j]=0;
                end
                
            end
            
        end
	  
    endcase
end 
 
always@(posedge clock1) begin
   case({enconv1,enexpand21x1,enexpand23x3}) 
        3'b100,3'b110: begin
            address_counter=0;
            if(set1_counter<num) begin
                if(address_counter==0) begin
                   ena1[set1_counter]=1;
                   wea1[set1_counter]=1;
                   address_counter++;
                   for(addressrams_counter=0;addressrams_counter<ram_num;addressrams_counter++) begin
    
                       addra1[addressrams_counter]++;
                   end
                end
                
                else if(address_counter<1024) begin
                   address_counter++;
                   for(addressrams_counter=0;addressrams_counter<ram_num;addressrams_counter++) begin
    
                       addra1[addressrams_counter]++;
                   end
               end
                    
                else begin

                    ena1[set1_counter]=0;
                    wea1[set1_counter]=0;
                   for(addressrams_counter=0;addressrams_counter<ram_num;addressrams_counter++) begin
    
                       addra1[addressrams_counter]=0;
                   end
                    set1_counter++;
                    address_counter=0;
                    if(set1_counter!=num) begin
                       
                        ena1[set1_counter]=1;
                        wea1[set1_counter]=1;
                        
            
                    end
                end
            end
        end
        
        default: begin
		   for ( int i = 0 ; i < num ; i++) begin
                ena1[i]=0;
                wea1[i]=0;
                for(addressrams_counter=0;addressrams_counter<ram_num;addressrams_counter++) begin

                    addra1[addressrams_counter]=0;
                end
            end
        end
    endcase
end
always@(posedge clock2) begin
    
    
   case({enconv1,enexpand21x1,enexpand23x3}) 
        3'b100: begin
            address_counter=0;
            if(set2_counter<num) begin
                if(address_counter==0) begin
                    ena2[set2_counter]=1;
                    wea2[set2_counter]=1;
                    address_counter++;
                    for(addressrams_counter=0;addressrams_counter<ram_num;addressrams_counter++) begin

                    addra2[addressrams_counter]++;
                    end
                end
            
                else if(address_counter<1024) begin
                    address_counter++;
                    for(addressrams_counter=0;addressrams_counter<ram_num;addressrams_counter++) begin

                    addra2[addressrams_counter]++;
                    end
                end
            
                else begin
                    ena2[set2_counter]=0;
                    wea2[set2_counter]=0;
                    
                    for(addressrams_counter=0;addressrams_counter<ram_num;addressrams_counter++) begin

                        addra2[addressrams_counter]=0;
                    end
                    set2_counter++;
                    address_counter=0;
                    if(set2_counter!=num) begin
                        
                        ena2[set2_counter]=1;
                        wea2[set2_counter]=1;
                    end
                end
            end
        end
    
        3'b011: begin
            
            if(set1_counter == num) begin
                if(set2_counter<num) begin     
                    if(address_counter==0) begin
                        ena2[set2_counter]=1;
                        wea2[set2_counter]=1;
                        address_counter++;
                        for(addressrams_counter=0;addressrams_counter<ram_num;addressrams_counter++) begin
    
                            addra2[addressrams_counter]++;
                        end
                    end
        
                    else if(address_counter<1024) begin
                        address_counter++;
                        for(addressrams_counter=0;addressrams_counter<ram_num;addressrams_counter++) begin
    
                            addra2[addressrams_counter]++;
                        end
                    end
                    
                    else begin
                        ena2[set2_counter]=0;
                        wea2[set2_counter]=0;
                        
                        for(addressrams_counter=0;addressrams_counter<ram_num;addressrams_counter++) begin
    
                            addra2[addressrams_counter]=0;
                        end
                        if(set2_counter != num-1) begin
			    set2_counter++;
                            ena2[set2_counter]=1;
                            wea2[set2_counter]=1;
                        end
			else begin
				set2_counter++;
			end
                        address_counter=0;
                    
                    end
                end
            end
        end
	default:begin

	end
    endcase
end

 
    

endmodule
