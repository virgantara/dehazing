image = double(imread('kawah1.jpg'))/255;
hsv = rgb2hsv(image);
v = hsv(:,:,3);
max_v = max(max(v));
[r, c] = find(v == max_v);
imshow(image)
hold on

for i=1:size(r,1)
    for j=1:size(c,1)
        rectangle('Position', [r(j), c(i), 15, 15],'EdgeColor','r', 'LineWidth', 1)
    end
end
