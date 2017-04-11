I = imread('Data\adc.jpg');
grayImage = im2double((I)) ;
% Ih = histeq(Ig);
[pixelCounts, grayLevels] = imhist(grayImage);
% Computer probability density function:
pdf = pixelCounts / numel(grayImage);
% rata = mean(mean(grayImage));
% dev = std(std(grayImage));

pdfmax = max(pdf);
pdfmin = min(pdf);

alpha = 1.2;
pdfw = pdfmax * ((pdf - pdfmin)/(pdfmax - pdfmin).^alpha);
sumpdfw = sum(pdfw);    
cdfw = cumsum(pdfw);

% sumpw = 0;
cdfww = zeros(256,1);
for i = 1:numel(pdfw)
    cdfww(i) = cdfww(i) + (pdfw(i)/sumpdfw);
end

% cdfw = cumsum(pdfw)./sumpdfw;
gamma = 1 - cdfww;
% gamma
% tParam = 3;
% D = (rata + 2 * dev) / (rata - 2 * dev);

