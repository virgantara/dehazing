I = imread('kawah3.jpg');
[b k c] = size(I);

o = I;
for i=1:1:b
    for j=1:1:k
        
        p = [I(i,j,1) I(i,j,2) I(i,j,3)];
        
        minP = find(p == min(p));
        
        
        o(i,j,minP) = 0;
        
    end
end

imshow(o);
imwrite(o,'kawah3zeroc.jpg');


