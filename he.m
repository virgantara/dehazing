function J = he(I)

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
    
    image = I;

    omega = 0.95;

    win_size = 15;

    %DEHZE Summary of this function goes here
    %   Detailed explanation goes here

    r = 15;
    res = 0.001;

    [m, n, ~] = size(image);

    dark_channel = get_dark_channel(image, win_size);

    %figure, imshow(dark_channel)



    atmosphere = get_atmosphere(image, dark_channel);
    trans_est = get_transmission_estimate(image, atmosphere, omega, win_size);

    x = guided_filter(rgb2gray(image), trans_est, r, res);

    transmission = reshape(x, m, n);


    radiance = get_radiance(image, transmission, atmosphere);
    J = radiance;
end

