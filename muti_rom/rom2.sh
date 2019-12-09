#!/bin/bash
rm -rf rom2.sv
echo -e  "Enter #files\n" 
read file_count
echo " enter kernel dimension and rest of the rom"
read kernel_dim
read rom_rest
let "size=$kernel_dim**2*$rom_rest"
address=` ./log2.pl "$rom_rest"` ;
touch readmem.sv always.sv decl.sv rom2.sv

echo "
	/* verilator lint_off COMBDLY */
	module rom_array_layer_2 #(
	parameter WIDTH=16,
	parameter KERNEL="$kernel_dim",
	parameter ADDR="$address",
	parameter NUM="$file_count")
	(
		input [ADDR-1:0] address ,
		output [WIDTH-1:0] rom_out [0:NUM-1]
	);	
	" >> rom2.sv
echo "initial begin" >> readmem.sv
count=1
find *.mem | grep extend | sort -n -t _ -k 3 | while read LINE ; do
	
	echo "
  	(* rom_style=\"{distributed}\" *)
	reg [WIDTH-1:0] rom_"$count" [0:2**ADDR-1] ;" >> decl.sv;
	echo "\$readmemb("\"$LINE\"",rom_"$count",0,2**ADDR-1);" >> readmem.sv;
	((count++))
done
for (( i = 0 ; i < $file_count ; i++)) ; do
	echo "assign rom_out["$i"] = rom_"$(($i+1))"[address] ;" >> always.sv ;
done
echo "end" >> readmem.sv
cat decl.sv >> rom2.sv
cat readmem.sv >> rom2.sv
cat always.sv >> rom2.sv
echo "endmodule" >> rom2.sv
rm -rf always.sv decl.sv readmem.sv
