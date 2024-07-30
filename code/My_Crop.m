function croppedImage = My_Crop(binaryImage)


se = strel('square', 3);
erodedImage = imerode(binaryImage, se);

boundaryImage = binaryImage - erodedImage;

se = strel('square', 5);
dilatedImage = imdilate(boundaryImage, se);


[row, col] = find(dilatedImage);

if ~isempty(row) && ~isempty(col)
    minRow = max(min(row) - 2, 1); 
    maxRow = min(max(row) + 2, size(binaryImage, 1)); 
    minCol = max(min(col) - 2, 1);
    maxCol = min(max(col) + 2, size(binaryImage, 2)); 

    croppedImage = binaryImage(minRow:maxRow, minCol:maxCol);


end


end