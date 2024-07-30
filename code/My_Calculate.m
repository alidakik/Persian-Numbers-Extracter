function sum = My_Calculate(image)

    sum = 0;

    Extract_numbers(image);


    folderPath = 'cropped_objects\';
    files = dir(fullfile(folderPath, '*.png'));
    

    paddingSize = 1;

    for i = 1:length(files)
        fileName = files(i).name;
        imagePath = fullfile(folderPath, fileName);
        num_img = imread(imagePath);
        num_img = My_fill(num_img);
        num_img = padarray(num_img, [paddingSize, paddingSize], 0, 'both');
        num_img = My_Crop(num_img);
        %num_img = imresize(num_img,[41,29]);
    
       

    
        [maxCorrValue, templateIndex] = Compare(num_img);
        
        %figure, imshow(num_img);
        %templateIndex

        hasHyphen = contains(fileName, '-');


        if hasHyphen
            sum = sum - templateIndex;
        else
            sum = sum + templateIndex;  
        end
       
    end

end