im1 = imread('cat.jpg') ;
disp ('formattings is either ROWS or COLS or VOLS') ; 
shape = input ("enter mode","s") ; 
%disp (shape);
id = fopen ('img.txt','w') ;
if (shape == 'COLS') 
	for ch = 1:3 
		for j = 1:length(im1(:,1,:))
			for i = 1:length(im1(1,:,:))
				final_vector  = dec2bin((im1(j,i,ch)),16);
				%disp(r) ;
				fdisp(id,final_vector) ; 
			end
		end
	end
elseif (shape == 'ROWS')
	for ch = 1:3 
		for j = 1:length(im1(1,:,:))
			for i = 1:length(im1(:,1,:))
				r = dec2bin((im1(j,i,ch)),16);
				disp(r) ;
			end
		end
	end
elseif (shape == 'VOLS') 

end
