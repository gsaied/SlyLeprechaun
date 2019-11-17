/* verilator lint_off UNPACKED */
package strise;
	parameter WIDTH = 15 ;
	parameter ADDR = 10 ;
	parameter NUM = 10 ;
	struct  {
		reg [ADDR-1:0] address ; 
		reg [WIDTH-1:0] rom ;
	} rom ;
endpackage
