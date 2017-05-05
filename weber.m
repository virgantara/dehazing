
imgWidthPixels            = 1024;
imgHeightPixels           = 1024;
localBackgroundSizePixels = 5; % square patch

luminance     = randn( imgHeightPixels, imgWidthPixels );
luminance( 496:528, 496:528 ) = 20;
background    = localMeanFilter( luminance, localBackgroundSizePixels );
weberContrast = ( luminance - background );% ./ background;

imagesc( weberContrast );
title( 'Weber Contrast' );
colormap(gray);


