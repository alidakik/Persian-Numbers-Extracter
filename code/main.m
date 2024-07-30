clc;clear;close all;




folderPath = '../dataset';
files = dir(fullfile(folderPath, '*.png'));

folderName = '../output';
if exist(folderName, 'dir')
    rmdir(folderName, 's');
end


mkdir(folderName);
    

counter = 0;

for i = 1:length(files)
    
    fileName = files(i).name;
    imagePath = fullfile(folderPath, fileName);
    image_main = imread(imagePath);
    image = My_Remove_Salt(image_main);
    image = RGB_fill(image);
    image = RGB_fill(image);

    match = regexp(fileName, '-?\d+', 'match');
    answer = match(2);
    number = str2double(answer);
    s = My_Calculate(image);

    Write_Output(image_main,s,fileName);
    if s == number
        counter = counter +1;
    end

    

end


fprintf("Algorithm accuracy %d%%.",counter)


