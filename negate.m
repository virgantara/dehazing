im=imread('kabutkawah.jpg');
[row,col] = size(im);
imneg=im;
for i=1:row
    for j=1:col
        imneg(i,j) = 1.8 * (255-im(i,j));
    end

end

imnegen = imneg;


imrev = im;
for i=1:row
    for j=1:col
        imrev(i,j) = 255-imnegen(i,j);
    end

end


figure
imshow(im);

figure
imshow(imrev);

imwrite(imrev,'kk_revised.jpg');