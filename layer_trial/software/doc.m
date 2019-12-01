random_size = 196608; 
id = fopen('weights.mem','w') ;
for i = 1:random_size
	fdisp(id,dec2bin(unidrnd(15),16)) ; 
end
