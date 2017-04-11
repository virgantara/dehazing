I = double(imread('kawah1.jpg'))/255;
[height, width, ~] = size(I);
D = zeros(height, width);
radius = 15;%round(min(height, width) * 0.02);
pixeldc = min(I, [], 3);
w = 0.95;
for i = 1:height
   for j = 1:width
      patch = pixeldc(max(1, i-radius):min(height, i+radius), ... 
                      max(1, j-radius):min(width, j+radius));
      D(i, j) = w .* min(medfilt2(patch)) - medfilt2(patch);
   end
end