function J = shengzhang(I)
    src = im2double(I);
    darkchannel = get_dark_channel(src,15);
    A = get_atmosphere(src, darkchannel);
    [height, width, nch] = size(src);
    hsv = rgb2hsv(src);
    d = zeros(height, width);
   % d(:,:) = 0.121779 + 0.959710 * hsv(:,:,3) - 0.780245 * hsv(:,:,2) + 0.041337;
 %our   %
    d(:,:) =  0.0910 + 0.6960 * hsv(:,:,3)  -0.7198 * hsv(:,:,2);
    new_d = d;%d_patch(d, 5);

     r = 15;
    res = 0.001;

    guidedfilter_d = guided_filter(rgb2gray(src), new_d, r, res);


    J = recover(src, A, guidedfilter_d);

end