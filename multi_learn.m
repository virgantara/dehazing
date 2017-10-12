contents = dir('Data\gt\*.jpg'); % or whatever the filename extension is

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
    i
    filename = contents(i).name;
    % Open the file specified in filename, do your processing...
    fpath = strcat('Data\Depth Est\',filename);
    fpathclear = strcat('Data\gt\',filename);
    
    J = imread(fpathclear);
    
    I = double(J)/255;
    d = imread(fpath);
    if size(d,3)==3
        d = double(rgb2gray(d))/255;
    else
        d = double(d)/255;
    end
    
    

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
X(:,2) = value;
X(:,3) = saturasi;
D(:,1) = depth;
T = (inv(X'*X))*X'*D

toc

