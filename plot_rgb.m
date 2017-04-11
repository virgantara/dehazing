function plot_rgb(I, min, max)
    
    Red = I(:,:,1);
    Green = I(:,:,2);
    Blue = I(:,:,3);
    %Get histValues for each channel
    [yRed, x] = imhist(Red);
    [yGreen, x] = imhist(Green);
    [yBlue, x] = imhist(Blue);
    %Plot them together in one plot
    plot(x(min:max), yRed(min:max), 'Red', x(min:max), yGreen(min:max), 'Green', x(min:max), yBlue(min:max), 'Blue');
end