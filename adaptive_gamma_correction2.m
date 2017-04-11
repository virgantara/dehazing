I = imread('Data\adc.jpg');
grayImage = im2double((I)) ;
% Ih = histeq(Ig);
[pixelCounts, grayLevels] = imhist(grayImage);
% Computer probability density function:
pdf = pixelCounts / numel(grayImage);
% rata = mean(mean(grayImage));
% dev = std(std(grayImage));
