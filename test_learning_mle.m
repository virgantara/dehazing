clear;
contents = dir('Data\Sample\*.jpg'); % or whatever the filename extension is

n = numel(contents);

s = [];
v = [];
for i = 1:n
    filename = contents(i).name;
    % Open the file specified in filename, do your processing...
    fpath = strcat('Data\Sample\',filename);

    I = double(imread(fpath))/255;
    hsvI = rgb2hsv(I);

    ts = hsvI(:,:,2);
    tv = hsvI(:,:,3);
    
    clear hsvI;
    
    [b k] = size(ts);

    p = b*k;
    
    newTS = reshape(ts,p,1);
    newTV = reshape(tv,p,1);

    
    s = [s;newTS];
    v = [v;newTV];
    
    clear newTS;
    clear newTV;
end

[b k] = size(s);

p = b*k;

d = randi([0 1],size(s));

newS = reshape(s,p,1);
newV = reshape(v,p,1);
newD = reshape(d,p,1);

clear d;
clear s;
clear v;

X = zeros(p,3);
X(:,1) = 1;
X(:,2) = newV(:);
X(:,3) = newS(:);

th = inv(X' * X) * X' * newD;

clear X;
clear newD;
clear newS;
clear newV;

%{
I = double(imread('Data\Ground Truth\17.jpg'))/255;
I2 = double(imread('Data\Ground Truth\18.jpg'))/255;


hsvI = rgb2hsv(I);
hsvI2 = rgb2hsv(I2);

s = hsvI(:,:,2);
v = hsvI(:,:,3);

s2 = hsvI2(:,:,2);
v2 = hsvI2(:,:,3);

s = [s;s2];
v = [v;v2];


[b k] = size(s);

p = b*k;

d = randi([0 1],size(s));

newS = reshape(s,p,1);
newV = reshape(v,p,1);
newD = reshape(d,p,1);

X = zeros(p,3);
X(:,1) = 1;
X(:,2) = newV(:);
X(:,3) = newS(:);

th = inv(X' * X) * X' * newD;


n = p;
th0 = 0; th1 = 1; th2 = -1;
sum = 0; wSum = 0; vSum = 0; sSum = 0;
varians = 0;

for iter=1:1:50 
    for i=1:1:n 
        tmp = newD(i) - th0 - th1 * newV(i) - th2 * newS(i);
        wSum = wSum + tmp;
        vSum = vSum + newV(i) * tmp;
        sSum = sSum + newS(i) * tmp;
        sum = sum + tmp^2;
        
        
    end
    
    varians = sum / n;
    th0 = th0 + wSum;
    th1 = th1 + vSum;
    th2 = th2 + sSum;
    
    mle
    
end 

%}