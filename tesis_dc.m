function darkchannel= tesis_dc(I)
    
%     I = imcrop(I,[0 30 800 450]);
    src = im2double(I);
    darkchannel = get_dark_channel(src,15);

%     darkchannel = guided_filter(rgb2gray(src), darkchannel, 15, 0.001);
end