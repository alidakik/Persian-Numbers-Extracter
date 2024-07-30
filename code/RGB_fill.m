function fulled_image = RGB_fill(image)


    fulled_image = image;

    for i=1:size(image,1)-1
        for j=1:size(image,2)-1
            counter = 0;
            color = 0;
            if i~=1 && j~=1 && i~=size(image,1) && j~=size(image,1)
                
                if sum(image(i,j,:))==765
                    if image(i-1,j-1,2) ~= 255
                        counter = counter+1;
                        color = image(i-1,j-1,:);
                    end
                    if image(i,j-1,2) ~= 255
                        counter = counter+1;
                        color = image(i-1,j-1,:);
                    end
                    if image(i-1,j,2) ~= 255
                        counter = counter+1;
                        color = image(i-1,j-1,:);
                    end
                    if image(i,j-1,2) ~= 255
                        counter = counter+1;
                        color = image(i-1,j-1,:);
                    end

                    if image(i,j+1,2) ~= 255
                        counter = counter+1;
                        color = image(i-1,j-1,:);
                    end
                    if image(i+1,j+1,2) ~= 255
                        counter = counter+1;
                        color = image(i-1,j-1,:);
                    end
                    if image(i+1,j-1,2) ~= 255
                        counter = counter+1;
                        color = image(i-1,j-1,:);
                    end
                    if image(i-1,j+1,2) ~= 255
                        counter = counter+1;
                        color = image(i-1,j-1,:);
                    end
                   
                    if image(i+1,j,2) ~= 255
                        counter = counter+1;
                        color = image(i-1,j-1,:);
                    end
                    
                    if counter > 3
                        
                        fulled_image(i,j,:) = color;
                    end
                end
            end
        end
    end





end
