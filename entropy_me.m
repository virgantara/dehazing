function hasil = entropy_me(method) 
    contents = dir('Data\Kelud\Hazy\*.jpg'); % or whatever the filename extension is

    s = numel(contents);

    hasil = zeros(15,1);
    
    for i = 1:s
      filename = contents(i).name;
%       fpath = strcat('Data\Frida\Clear\',filename);
%       % Open the file specified in filename, do your processing...
%       gt = double(imread(fpath))/255;
%       
      
      if strcmp(method,'he')
         iname = strcat('Data\Kelud\He\',filename);

      elseif strcmp(method,'meng')
         iname = strcat('Data\Kelud\Meng\',filename);
      elseif strcmp(method,'tarel')
         iname = strcat('Data\Kelud\Tarel\',filename);
         
      elseif strcmp(method,'zhu')
         iname = strcat('Data\Kelud\Zhu\',filename);
       elseif strcmp(method,'chen')
         iname = strcat('Data\Kelud\Chen\',filename);
      
      elseif strcmp(method,'our')
         iname = strcat('Data\Kelud\Our\',filename);

      end

      im = im2double(imread(iname));
      hasil(i) = entropy(im);
  
    end

    
    
end