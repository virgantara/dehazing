% ob = pre brightness
% oc = pre contrast
% nb = post brightness
% nc = post contrast


function [ob,oc,nb,nc] = evaluate_me(method) 

    basepath = 'Data\Kelud\';
    
    contents = dir(strcat(basepath,'Hazy\*.jpg')); % or whatever the filename extension is

    s = numel(contents);

    ob = zeros(15,1);
    oc = zeros(15,1);
    nb = zeros(15,1);
    nc = zeros(15,1);
    
    for i = 1:s
      filename = contents(i).name;
%       fpath = strcat('Data\Frida\Clear\',filename);
%       % Open the file specified in filename, do your processing...
%       gt = double(imread(fpath))/255;
%       
      
      if strcmp(method,'he')
         iname = strcat(basepath,'He\',filename);

      elseif strcmp(method,'meng')
         iname = strcat(basepath,'\Meng\',filename);
      elseif strcmp(method,'tarel')
         iname = strcat(basepath,'\Tarel\',filename);
         
      elseif strcmp(method,'zhu')
         iname = strcat(basepath,'\Zhu\',filename);

      elseif strcmp(method,'chen')
         iname = strcat(basepath,'\Chen\',filename);

      elseif strcmp(method,'our')
         iname = strcat(basepath,'\Our\',filename);

      end
       
      om = imread(strcat(basepath,'Hazy\',filename));
      om = imcrop(om,[0 30 800 450]);
      ihsv = rgb2hsv(om);
      v = ihsv(:,:,3);
      ob(i) = mean(mean(v));
      ma = max(max(v));
      mi = min(min(v));
      oc(i) = (ma - mi)/(ma + mi);
      
      
      im = imread(iname);
      ihsv = rgb2hsv(im);
      v = ihsv(:,:,3);
      nb(i) = mean(mean(v));
      ma = max(max(v));
      mi = min(min(v));
      nc(i) = (ma - mi)/(ma + mi);
      
    end

    
    
end