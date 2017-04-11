I = double(imread('foggy_reog.jpg'))/255;

[r c ~] = size(I);

w = r / 2;
h = c / 2;

A=I(1:r/2,1:c/2);
B=I(1:r/2,c/2+1:c);
C=I(r/2+1:r,1:c/2);
D=I(r/2+1:r,c/2+1:c);

P = [A;B;C;D];

avgA = mean(mean(A));
avgB = mean(mean(B));
avgC = mean(mean(C));
avgD = mean(mean(D));



avg = [mean(mean(A)) mean(mean(B)) mean(mean(C)) mean(mean(D))];

sd = [std2(A) std2(B) std2(C) std2(D)];

score = avg - sd;



%bright = zeros(w,h);


%sd = std2(I);
