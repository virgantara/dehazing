
image = double(imread('kawah1.jpg'))/255;
win_size = 15;
[m, n, ~] = size(image);

pad_size = floor(win_size/2);

padded_image = padarray(image, [pad_size pad_size], Inf);

dark_channel = zeros(m, n); 

for j = 1 : m
    for i = 1 : n
        patch = padded_image(j : j + (win_size-1), i : i + (win_size-1), :);

        dark_channel(j,i) = min(patch(:));
     end
end

% estimating atmospheric light
n_pixels = m * n;

n_search_pixels = floor(n_pixels * 0.01);

dark_vec = reshape(dark_channel, n_pixels, 1);

image_vec = reshape(image, n_pixels, 3);

[~, indices] = sort(dark_vec, 'descend');

accumulator = zeros(1, 3);

for k = 1 : n_search_pixels
    accumulator = accumulator + image_vec(indices(k),:);
end

atmosphere = accumulator / n_search_pixels;



