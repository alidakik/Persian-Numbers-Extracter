function cleaned = My_clean(image)

    cleaned = image;
    
    for i=1:size(image,1)

        for j=1:size(image,2)
            
            if image(i,j,1) ==  0 && image(i,j,2) == 0 && image(i,j,3) ==  255 
                cleaned(i,j,1) = 0;
                cleaned(i,j,2) = 0;
                cleaned(i,j,3) = 255;
                
            elseif image(i,j,1) ==  255 && image(i,j,2) == 0 && image(i,j,3) ==  0 
                cleaned(i,j,1) = 255;
                cleaned(i,j,2) = 0;
                cleaned(i,j,3) = 0;
            else
                cleaned(i,j,:) = 255;
            end

        end        

    end


end