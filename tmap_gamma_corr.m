function [ output ] = tmap_gamma_corr( I, d )
    
    [height, width, ~] = size(I);
    value = zeros(height, width);
    output = zeros(height, width, 1);
    
    dc = avg_intensity(I);
    
    gr = rgb2gray(I);
    Xmax = max(max(gr));
    
    Tthres = 110;
    icdf = plotcdf(gr);
    tInts = find(icdf > 0.1, 1);
    
    gamma = 1;
    if(tInts >= Tthres)
        gamma = 1 + (tInts / Tthres);
    end
    
    
    
    e = 2.718281828459;
    b = 1.0;
    
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

        output(i, j, 1) = value(i,j);
        end
    end
end

