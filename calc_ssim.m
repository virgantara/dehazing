function hasil = calc_ssim(method) 
    contents = dir('Data\Ground Truth\*.jpg'); % or whatever the filename extension is

    s = numel(contents);

    total_ssim = 0;
    
    
    
    for i = 1:s
      filename = contents(i).name;
      fpath = strcat('Data\Ground Truth\',filename);
      % Open the file specified in filename, do your processing...
      gt = double(imread(fpath))/255;
      
      
      if strcmp(method,'he')
         iname = strcat('Data\He\',filename);

      elseif strcmp(method,'meng')
         iname = strcat('Data\Meng\',filename);
      elseif strcmp(method,'tarel')
         iname = strcat('Data\Tarel\',filename);
         
      elseif strcmp(method,'zhu')
         iname = strcat('Data\Zhu\',filename);

      end

      im = double(imread(iname))/255;
      total_ssim = total_ssim + ssim(gt,im);
  
    end

   hasil = total_ssim / 200;
    
end