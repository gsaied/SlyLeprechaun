module relu  (input [15:0] m,output [15:0] n);
wire [15:0] x ;
assign x= {16{~m[15]}} ;
assign n= x & m;
endmodule 
