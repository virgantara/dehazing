
%michelson contrast
function hasil = bright_me 
    contents = dir('Data\Kelud\Hazy\*.jpg'); % or whatever the filename extension is

    s = numel(contents);

    hasil = zeros(15,1);
    
    for i = 1:s
      filename = contents(i).name;
%       fpath = strcat('Data\Frida\Clear\',filename);
%       % Open the file specified in filename, do your processing...
%       gt = double(imread(fpath))/255;
%       
      
      iname = strcat('Data\Kelud\Chen\',filename);
        
      im = imread(iname);
      im = imcrop(im,[0 30 800 450]);
      im = im2double(im);
      
      hsv = rgb2hsv(im);
      
      v = hsv(:,:,3);
     
      
      hasil(i) = mean(mean(v));
  
    end

    
    
end