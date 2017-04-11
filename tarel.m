function J = tarel(I)
% Color example of visibility restoration

im=double(I)/255.0;

sv=2*floor(max(size(im))/50)+1;
% ICCV'2009 paper result (NBPC)
res=nbpc(im,sv,0.95,0.5,1,1.3);
%figure;imshow([im, res],[0,1]);

J = res;
%imwrite(res,'tarel_result-3-h.jpg');

end