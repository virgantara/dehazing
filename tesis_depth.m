I = imread('Data\Kelud\Hazy\Kawah_20160626_170812.jpg');
    I = imcrop(I,[0 30 800 450]);
src = im2double(I);

[height, width, ~] = size(src);
hsv = rgb2hsv(src);
d = zeros(height, width);
d(:,:) =     -0.4595 + 0.6651* hsv(:,:,3) + 1.3912 * hsv(:,:,2);
e = 2.718281828459;
t = e.^(-d);
imshow(t);