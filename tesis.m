function [J t]= tesis(I)
    
%     I = imcrop(I,[0 30 800 450]);
    src = im2double(I);
    darkchannel = get_dark_channel(src,15);
    A = get_atmosphere(src, darkchannel);
    [height, width, ~] = size(src);
    hsv = rgb2hsv(src);
    d = zeros(height, width);
    d(:,:) =   -0.4595 + 1.3912 * hsv(:,:,3)  + 0.6651 * hsv(:,:,2);

    new_d = d;

     r = 15;
    res = 0.001;

    guidedfilter_d = guided_filter(rgb2gray(src), new_d, r, res);
%     J = tmap_gamma_corr(src,guidedfilter_d);
    [J t]= tesis_recover(src, A, guidedfilter_d);

end