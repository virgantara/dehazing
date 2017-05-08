I = imread('Data\Kelud\Hazy\Kawah_20161103_112454.jpg');
I = imcrop(I,[0 30 800 450]);
I = double(I)/255;
dark_channel = get_dark_channel(I,15);
% dark_channel = guided_filter(rgb2gray(I), dark_channel, 15, 0.001);
image = I;
mi = I;
minew = I;
[m, n, ~] = size(image);
n_pixels = m * n;

% memilih top 1%;
n_search_pixels = floor(n_pixels * 0.01);

%mengubah matrix menjadi vektor
dark_vec = reshape(dark_channel, n_pixels, 1);

%mengubah matrix image masing2 channel RGB menjadi matrix of vector RGB
image_vec = reshape(image, n_pixels, 3);

[hasil, indices] = sort(dark_vec, 'descend');

accumulator = zeros(1, 3);

for k = 1 : n_search_pixels
    accumulator = accumulator + image_vec(indices(k),:);
    v = image_vec(indices(k),:);
    for i=1:1:m
        for j=1:1:n
            r = mi(i,j,1);
            g = mi(i,j,2);
            b = mi(i,j,3);
            if(r==v(1))
                r = 1;
                g = 0;
                b = 0;
            
            elseif(g==v(2))
                r = 1;
                g = 0;
                b = 0;
            elseif(b==v(3))
                r = 1;
                g = 0;
                b = 0;
            end
                        
            minew(i,j,1) = r;
            minew(i,j,2) = g;
            minew(i,j,3) = b;
        end
    end
    
end

atmosphere = accumulator / n_search_pixels;