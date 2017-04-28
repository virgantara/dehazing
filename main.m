contents = dir('Data\Kelud\Hazy\*.jpg'); % or whatever the filename extension is


%     
%   imwrite(O,iname);

s = numel(contents);

for i = 1:s
  filename = contents(i).name;
  % Open the file specified in filename, do your processing...
  fpath = strcat('Data\Kelud\Hazy\',filename);

  I = imread(fpath);
   I = imcrop(I,[0, 30, 800 450]);
   
   J = tesis(I);
  iname = strcat('Data\Kelud\Tesis\',filename);  
  imwrite(J,iname);
  
%   J = tarel(I);
%   iname = strcat('Data\Simulasi\Tarel\',filename);  
%   imwrite(J,iname);
%   
%   J = meng(I);
%   iname = strcat('Data\Simulasi\Meng\',filename);  
%   imwrite(J,iname);
%   
%   J = he(I);
%   iname = strcat('Data\Simulasi\He\',filename);  
%   imwrite(J,iname);
  
%   J = zhu(I);
%   iname = strcat('Data\Simulasi\Zhu\',filename);  
%   imwrite(J,iname);
%   
%   J = chen(I);
%   iname = strcat('Data\Simulasi\Chen\',filename);  
%   imwrite(J,iname);
% %   
%   J = grs2rgb(I);
%   iname = strcat('Data\Kelud\Dark Channel\Hot\',filename);  
%   imwrite(J,iname);
end
