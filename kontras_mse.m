
%michelson contrast
function hasil = kontras_mse 
    contents = dir('Data\Kelud\Hazy\*.jpg'); % or whatever the filename extension is

    s = numel(contents);

    hasil = zeros(15,1);
    
    for i = 1:s
        filename = contents(i).name;

        iname = strcat('Data\Kelud\Hazy\',filename);

        im = imread(iname);
        im = imcrop(im,[0 30 800 450]);
        I = im2double(im);

        [height, width, nch] = size(I);
        
        totalpx = height * width;

        delta = 0;
        for j = 1:1:height
            for k = 1:1:width
                
                rata2 = mean(I(j,k,:));
                for c = 1:1:nch

                    value = I(j,k,c);
                    
                    s = ((value - rata2)^2) / totalpx;
                    delta = delta + s;
                    
                    

                    
                end
             end
        end
  
        hasil(i) = delta;
    end

    
    
end