function darkchannel= tesis_dc

    I = imread('Data\Kelud\Hazy\Kawah_20161102_091838.jpg');
    ps = 15;
    I = imcrop(I,[0 30 800 450]);
    src = im2double(I);
    darkchannel = get_dark_channel(src,ps);

%     darkchannel = guided_filter(rgb2gray(src), darkchannel, 15, 0.001);
end