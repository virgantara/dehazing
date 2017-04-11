function J = chen(I)

    I = double(I) / 255;
    
    % Make grayscales to color
    if numel(size(I)) == 2
        [x y] = size(I);
        tmpI = zeros(x,y,3);
        for c = 1:3
            tmpI(:,:,c) = I;
        end
        I = tmpI;
    end
    
    win_size = 15;

    [row col ~] = size(I);
    Im = zeros(row,col);

    Id =  get_dark_channel(I, win_size);

    d = zeros(row,col);

    for i=1:1:row
        for j=1:1:col
            val1 = min(I(i,j));
            Im(i,j) = val1;

            val2 = Im(i,j) - Id(i,j);
            d(i,j) = val2;
        end
    end


    totalpxl = row * col;
    totald = sum(sum(d));
    g = totald / totalpxl;

    t = zeros(row, col);
    for i=1:1:row
        for j=1:1:col
            p = randi([800 1000])/1000;
            val = (1 - Im(i,j)) + g * p;
            t(i,j) = val;
        end
    end
    atmosphere = get_atmosphere(I, Id);

    J = get_radiance(I, t, atmosphere);
end

