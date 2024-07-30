function Write_Output(image, number,name)



    
    str = num2str(number);
    
    
    J =image(756:800,:,:);
    
    for i = 1:length(str)
        path = fullfile('numbers/', [str(i) '.png']);
        I = imread(path);
        I = ~I;
        I = imresize(I,[35,20]);
        
        if i==1
            J(5:39, 300+55:319+55,1) = I*255; 
            J(5:39, 325+55:344+55,2) = 255; 
            J(5:39, 300+55:319+55,3) = I*255;
        elseif i==2
            J(5:39, 325+55:344+55,1) = I*255;
            J(5:39, 325+55:344+55,2) = 255; 
            J(5:39, 325+55:344+55,3) = I*255;
        elseif i==3
            J(5:39, 350+55:369+55,1) = I*255;
            J(5:39, 350+55:369+55,2) = 255; 
            J(5:39, 350+55:369+55,3) = I*255;
        end
    end
    
    %imshow(J)
    
    image(756:800,:,:) = J;
    
    path = fullfile("../output/", name);
    
    imwrite(image, path);


end