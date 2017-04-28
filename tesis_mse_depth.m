contents = dir('Data\Test\Clear\*.png'); % or whatever the filename extension is

s = numel(contents);
tic; 
total_mse = 0;
mses = [];
for i = 1:s
    filename = contents(i).name;
    % Open the file specified in filename, do your processing...
    fpath = strcat('Data\Test\Depth\',filename);
    fpathclear = strcat('Data\Test\Clear\',filename);
    
    J = imread(fpathclear);
    
    gt = imread(fpath);
    if size(gt,3)==3
        gt = double(rgb2gray(gt))/255;
    else
        gt = double(gt)/255;
    end
    
    filename
    [height, width, ~] = size(J);
    hsv = rgb2hsv(J);
    d = zeros(height, width);
    d(:,:) =    0.2739 - 0.2739 * hsv(:,:,3) + 0.5178 * hsv(:,:,2);
%     figure(i,filename);imshow(-log(d));

    mse =  immse(gt,d);
    total_mse = total_mse + mse;
    mses = [mses,mse];
% 
    
% 
   

   
end

akurasi = 100 * (1-(total_mse/i))

toc

