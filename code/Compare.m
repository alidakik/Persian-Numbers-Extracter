function [maxCorrValue, templateIndex]  = Compare(image)


    numTemplates = 9;
    
    maxCorrValues = zeros(numTemplates, 1);
    maxIndices = zeros(numTemplates, 1);
    
    
    for i = 1:numTemplates
    
        template = imread(['numbers/' num2str(i) '.png']);
        template = imresize(template,size(image));
        
        correlation = normxcorr2(template, image);
        [maxCorrValues(i), maxIndices(i)] = max(abs(correlation(:)));
    end

    [maxCorrValue, templateIndex] = max(maxCorrValues);

end