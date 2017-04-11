function [ output ] = our_recover_with_gamma_corr( I, A, d )

    [height, width, nch] = size(I);
    value = zeros(height, width);
    output = zeros(height, width, nch);
    
    dc = avg_intensity(I);
%     dc = [0 0 0];
    gr = rgb2gray(I);
    Xmax = max(max(gr));
    
    Tthres = 110;
    icdf = plotcdf(gr);
    tInts = find(icdf > 0.1, 1);
    
    gamma = 1;
    if(tInts >= Tthres)
        gamma = 1 + (tInts / Tthres);
    end
    
    if (gamma > 2.75)
        gamma = 2.75;
    end
    
    e = 2.718281828459;
    b = 1.0;
    for c = 1:1:nch
        for i = 1:1:height
            for j = 1:1:width
                tmp = e^(-b*d(i, j));
                
            if tmp > 0.1
                maks = tmp;
            else
                maks = 0.1;
            end
            
            if maks < 0.9
                value(i, j) = maks;
            else
                value(i, j) = 0.9;
            end
            
            value(i,j) = Xmax * ((value(i,j) / Xmax) ^ gamma);
            
            output(i, j, c) = (I(i, j, c) - (A(c) - dc(c))) / value(i, j) + (A(c) - dc(c));
            end
         end
    end
end

