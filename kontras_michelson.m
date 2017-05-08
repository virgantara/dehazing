
%michelson contrast
function hasil = kontras_michelson 
    contents = dir('Data\Kelud\Hazy\*.jpg'); % or whatever the filename extension is

    s = numel(contents);

    hasil = zeros(15,1);
    
    for i = 1:s
      filename = contents(i).name;
%       fpath = strcat('Data\Frida\Clear\',filename);
%       % Open the file specified in filename, do your processing...
%       gt = double(imread(fpath))/255;
%       
      
      iname = strcat('Data\Kelud\Tesis\',filename);
        
      im = imread(iname);
      im = imcrop(im,[0 30 800 450]);
      im = im2double(im);
      
      ycbcr = rgb2ycbcr(im);
      
      lum = ycbcr(:,:,1);
      
      maxlum = max(lum);
      minlum = min(lum);
      
      rasioKontras = (maxlum - minlum) / (maxlum + minlum);
      
      hasil(i) = rasioKontras;
  
    end

    
    
end