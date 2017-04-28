contents = dir('Data\sample\*.jpg'); % or whatever the filename extension is

s = numel(contents);
X = zeros(1,3);
D = zeros(1,1);
row = 0;

n = 0;
saturasi = [];
value = [];
depth = [];
total_count = 0;
tic; 
for i = 1:s
    filename = contents(i).name;
    % Open the file specified in filename, do your processing...
   
    fpathclear = strcat('Data\sample\',filename);
    
    J = imread(fpathclear);
    
    I = double(J)/255;
    Igray = rgb2gray(J);
    d = randi(([0 1000])/1000,size(Igray));
    
    

    Ihsv = rgb2hsv(I);

    [row col ~] = size(J);
    % 
    n = row * col;
    d = reshape(d,n,1);
    depth(end+1:end+n,:) = d;
    saturasi(end+1:end+n,:) = reshape(Ihsv(:,:,2),n,1);
    value(end+1:end+n,:) = reshape(Ihsv(:,:,3),n,1);
    
   
    total_count = total_count + n;
% 
    
% 
   

   
end
X = zeros(total_count,3);
D = zeros(total_count,1);
X(:,1) = 1;
X(:,2) = saturasi;
X(:,3) = value;
D(:,1) = depth;
T = (inv(X'*X))*X'*D

toc

