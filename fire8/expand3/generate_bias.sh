#!/bin/bash
count=0;
count2=0
WIDTH=16
echo -e "Enter number of filters\n" ;
read DSP_NO
if [  "$1"  == "unix" ] || [[ -z $1 ]] ; then
	dos2unix bias.mem ;
elif [ "$1" == "windows"  ]; then
	unix2dos bias.mem ;
else
	echo -e "Unknown Platform, specify either unix or windows\n" ;
fi
if [  -n biasing.sv ] ; then
	rm -rf biasing.sv
fi
echo "
module biasing_rom (
	output [15:0] bias_mem [0:"$DSP_NO"-1]
);
">> biasing.sv
cat bias.mem | while read LINE; do
	echo "reg ["$WIDTH"-1:0] bias_reg_"$count" = 16'b$LINE;" >> biasing.sv
	((count++));
done
cat bias.mem | while read LINE ; do
	echo "assign bias_mem["$count2"] = bias_reg_"$count2";" >> biasing.sv
	((count2++));
done
echo "endmodule" >> biasing.sv
