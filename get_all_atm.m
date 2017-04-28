contents = dir('Data\Kelud\Hazy\*.jpg'); % or whatever the filename extension is


%     
%   imwrite(O,iname);

s = numel(contents);
A = zeros(1,3);
for i = 1:s
  filename = contents(i).name;
  % Open the file specified in filename, do your processing...
  fpath = strcat('Data\Kelud\Hazy\',filename);

  I = imread(fpath);
  I = imcrop(I,[0, 30, 800 450]);
  I = double(I)/255;
  dc = get_dark_channel(I,15);
  
  A(i,:) = get_atmosphere(I, dc);
  
end
A