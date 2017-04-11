warning('off','all');

tic;
image = double(imread('remote_hazy.jpg'))/255;

%image = imresize(image, 0.4);

result = dehaze_fast(image, 0.95, 3);
%imwrite(result,'r1.jpg');
toc;

figure, imshow(image)
figure, imshow(result)

warning('on','all');