function J = our(I)
    
%     I = imcrop(I,[0 30 800 450]);
    src = im2double(I);
    darkchannel = get_dark_channel(src,15);
    A = get_atmosphere(src, darkchannel);
    [height, width, ~] = size(src);
    hsv = rgb2hsv(src);
    d = zeros(height, width);

    d(:,:) =  0.0910 + 0.6960 * hsv(:,:,3)  -0.7198 * hsv(:,:,2);

%     d(:,:) =   -0.4595 + 1.3912 * hsv(:,:,3)  + 0.6651 * hsv(:,:,2);
% d(:,:) =   0.1893 + 1.0267 * hsv(:,:,3)  - 1.2966 * hsv(:,:,2);
    new_d = d;

     r = 15;
    res = 0.001;

    guidedfilter_d = guided_filter(rgb2gray(src), new_d, r, res);
%     J = tmap_gamma_corr(src,guidedfilter_d);
    J = our_recover_with_gamma_corr(src, A, guidedfilter_d);

end