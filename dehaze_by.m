function dehaze_by(method) 
    contents = dir('Data\Hazy\*.jpg'); % or whatever the filename extension is

    s = numel(contents);

    for i = 1:s
      filename = contents(i).name;
      % Open the file specified in filename, do your processing...
      fpath = strcat('Data\Hazy\',filename);

      I = imread(fpath);

      if strcmp(method,'he')
         J = he(I); 
         iname = strcat('Data\He\',filename);
         imwrite(J,iname);
      
      elseif strcmp(method,'meng')
        J = meng(I); 
         iname = strcat('Data\Meng\',filename);
         imwrite(J,iname);
         
      elseif strcmp(method,'tarel')
        J = tarel(I); 
         iname = strcat('Data\Tarel\',filename);
         imwrite(J,iname);
         
      elseif strcmp(method,'zhu')
         J = zhu(I); 
         iname = strcat('Data\Zhu\',filename);
         imwrite(J,iname);
         
       elseif strcmp(method,'sulami')
         disp(filename);
         J = sulami(I); 
         iname = strcat('Data\Sulami\',filename);
         imwrite(J,iname);
         
      end
      
    end

    
end