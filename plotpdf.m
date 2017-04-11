function pdf = plotpdf(grayImage)
    [pixelCounts, ~] = imhist(grayImage);
% Computer probability density function:
    pdf = pixelCounts / numel(grayImage);
    
end