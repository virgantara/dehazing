I = imread('Data\Kelud\Hazy\Kawah_20161103_112454.jpg');
I = imcrop(I,[0 30 800 450]);
src = im2double(I);
darkchannel = get_dark_channel(src,15);
A = get_atmosphere(src, darkchannel);
[height, width, ~] = size(src);
hsv = rgb2hsv(src);
d = zeros(height, width);
d(:,:) =     -0.4595 + 0.6651* hsv(:,:,3) + 1.3912 * hsv(:,:,2);

new_d = d_patch(d, 5);

 r = 15;
res = 0.001;

guidedfilter_d = guided_filter(rgb2gray(src), new_d, r, res);


% J = recover(src, A, guidedfilter_d);

[height, width, nch] = size(I);
value = zeros(height, width);
output = zeros(height, width, nch);

e = 2.718281828459;
b = 1.0;
for c = 1:1:nch
    for i = 1:1:height
        for j = 1:1:width
            tmp = e^(-b*d(i, j));

        if tmp > 0.1
            max = tmp;
        else
            max = 0.1;
        end

        if max < 0.9
            value(i, j) = max;
        else
            value(i, j) = 0.9;
        end

        
        output(i, j, c) = (I(i, j, c) - (A(c) )) / value(i, j) + (A(c));
        end
     end
end