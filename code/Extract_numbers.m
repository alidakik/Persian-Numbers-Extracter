function Extract_numbers(image)


    R = image(:,:,1);
    B = image(:,:,3);
    

    threshold_value = 200; 
    R = R < threshold_value;
    B = B < threshold_value;
    
    
    RlabeledImage = bwlabel(R);
    BlabeledImage = bwlabel(B);

    Rprops = regionprops(RlabeledImage, 'BoundingBox');
    Bprops = regionprops(BlabeledImage, 'BoundingBox');
    
    folderName = 'cropped_objects';
    if exist(folderName, 'dir')
        rmdir(folderName, 's');
    end

    mkdir(folderName);
    
    for i = 1:length(Rprops)
        RboundingBox = round(Rprops(i).BoundingBox);
    
        RcroppedObject = imcrop(R, RboundingBox);
    
        if size(RcroppedObject,1) * size(RcroppedObject,1) > 100
            imwrite(RcroppedObject, ['cropped_objects/object_-' num2str(i) '.png']);
        end
    end

    

   for i = length(Rprops)+1:length(Rprops)+length(Bprops)
        BboundingBox = round(Bprops(i-length(Rprops)).BoundingBox);

        BcroppedObject = imcrop(B, BboundingBox);

        if size(BcroppedObject,1) * size(BcroppedObject,1) > 100
            imwrite(BcroppedObject, ['cropped_objects/object_' num2str(i) '.png']);
        end
    end


end