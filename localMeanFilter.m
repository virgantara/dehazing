function filteredImg = localMeanFilter( img, regionSizePixels )

    offsetImages  = getOffsetImages( img, regionSizePixels );
    filteredImg   = mean( offsetImages, 3 );

end