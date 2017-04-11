function val = plotcdf (I)
    [yGr xGr] = imhist(I);
    val = cumsum(yGr) / sum(yGr);

    
end