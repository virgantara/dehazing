function hasil = std_me(method) 
    contents = dir('Data\Frida\Clear\*.png'); % or whatever the filename extension is

    s = numel(contents);

    hasil = zeros(17,1);
    
    for i = 1:s
      filename = contents(i).name;
%       fpath = strcat('Data\Frida\Clear\',filename);
%       % Open the file specified in filename, do your processing...
%       gt = double(imread(fpath))/255;
%       
      
      if strcmp(method,'he')
         iname = strcat('Data\Frida\He\',filename);

      elseif strcmp(method,'meng')
         iname = strcat('Data\Frida\Meng\',filename);
      elseif strcmp(method,'tarel')
         iname = strcat('Data\Frida\Tarel\',filename);
         
      elseif strcmp(method,'zhu')
         iname = strcat('Data\Frida\Zhu\',filename);
       
      elseif strcmp(method,'chen')
         iname = strcat('Data\Frida\Chen\',filename);   

      elseif strcmp(method,'our')
         iname = strcat('Data\Frida\Our\',filename);

      end

      im = im2double(imread(iname));
      hasil(i) = std(std(std(im)));
  
    end

    
    
end