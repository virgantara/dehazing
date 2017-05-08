contents = dir('Data\Kelud\Hazy\*.jpg'); % or whatever the filename extension is


%     
%   imwrite(O,iname);

s = numel(contents);

for i = 1:s
    
    i
  filename = contents(i).name;
  % Open the file specified in filename, do your processing...
  fpath = strcat('Data\Kelud\Hazy\',filename);

  I = imread(fpath);
   I = imcrop(I,[0, 30, 800 450]);
   
   J = he(I);
  iname = strcat('Data\Kelud\He\',filename);  
  imwrite(J,iname);
  
%   J = tarel(I);
%   iname = strcat('Data\Simulasi\Tarel\',filename);  
%   imwrite(J,iname);
  
  J = tesis(I);
  iname = strcat('Data\Kelud\Tesis\',filename);  
  imwrite(J,iname);
%   
  J = gao(I);
  iname = strcat('Data\Kelud\Gao\',filename);  
  imwrite(J,iname);
  
  J = zhu(I);
  iname = strcat('Data\Kelud\Zhu\',filename);  
  imwrite(J,iname);
% %   
  J = chen(I);
  iname = strcat('Data\Kelud\Chen\',filename);  
  imwrite(J,iname);
%   
%   J = grs2rgb(I);
%   iname = strcat('Data\Kelud\Dark Channel\Hot\',filename);  
%   imwrite(J,iname);
end
