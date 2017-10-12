I = imread('Data\glass.png');
[h,w,s] = size(I);

if(s == 3)
    I = rgb2hsv(im2double(I));
    I = I(:,:,3);
end

rata = mean(mean(I));
stddev = std(std(I));
tau = 3;
a = rata + 2 * stddev;
b = rata - 2 * stddev;
%D = a - b;
D = 4 * stddev;
islow = 0; % low contrast
if(D <=  1 / tau) 
    islow = 1;
end

y = 0;

if(islow)
    y = -log2(stddev);
    
else
end

k = I.^y + (1 - I.^y) * rata.^y;

heaviside = 0;

x = 0.5 - rata; 
if(x > 0)
    heaviside = 1;
end

c = 1 ./ (1 + heaviside .* (k - 1));

if(islow && rata >= 0.5)
    c = 1;
    Io = c .* I.^y;
elseif (islow && rata < 0.5)
    Io = I.^y ./ (I.^y + (1 - I.^y) * rata ^ y);    
end


