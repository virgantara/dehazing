
function J = gao(im)

[row,col] = size(im);
imneg=im;



for i=1:row
    for j=1:col
        imneg(i,j) = 1.8 * (255-im(i,j));
    end

end

imnegen = imneg;


J = im;
for i=1:row
    for j=1:col
        J(i,j) = 255-imnegen(i,j);
    end

end

end