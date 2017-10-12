contents = dir('Data\gt\*.jpg'); % or whatever the filename extension is


%     
%   imwrite(O,iname);

s = numel(contents);

for i = 1:s
    
    i
  filename = contents(i).name;
  % Open the file specified in filename, do your processing...
  fpath = strcat('Data\gt\',filename);

  I = imread(fpath);
  src = im2double(I);

    [height, width, ~] = size(src);
    hsv = rgb2hsv(src);
    d = zeros(height, width);
    d(:,:) = hsv(:,:,3) - hsv(:,:,2);
    % d(:,:) =     -0.4595 + 0.6651* hsv(:,:,3) + 1.3912 * hsv(:,:,2);
    % e = 2.718281828459;
    % t = e.^(-d);
    iname = strcat('Data\Depth Est\',filename);  
  imwrite(d,iname);
%    imwrite(d,'Data\Depth Est\');

end
