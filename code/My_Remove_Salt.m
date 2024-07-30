function image = My_Remove_Salt(I)
    
    image = I;
    
    for i=1:size(image,1)
        for j=1:size(image,2)
           if (sum(image(i,j,:))==0)
               image(i,j,:) = 255;
           end
        end
    end



end