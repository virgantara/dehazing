function  generate_hazy 
    contents = dir('Data\*.jpg'); % or whatever the filename extension is

    s = numel(contents);
    
    for i = 1:s
      filename = contents(i).name;
      % Open the file specified in filename, do your processing...
      fpath = strcat('Data\',filename);

      J = imread(fpath);
      [I d] = haze(J);
      
      iname = strcat('Data\Hazy\',filename);
      dname = strcat('Data\Depth\',filename);
      imwrite(d,dname);
      imwrite(I,iname);
    end

    
end