
function buffer = getOffsetImages( img, regionSizePixels )
% GETOFFSETIMAGES

    imgSize      = size( img );
    imgHeight    = imgSize( 1 );
    imgWidth     = imgSize( 2 );

    minDelta     = 0;
    maxDelta     = (regionSizePixels-1);

    bufferWidth  = imgWidth  + maxDelta;
    bufferHeight = imgHeight + maxDelta;
    bufferDepth  = regionSizePixels .^ 2;
    bufferSize   = [ bufferHeight bufferWidth bufferDepth ];
    buffer       = zeros( bufferSize );

    iSample = 0;

    for deltaX = minDelta:maxDelta

        iStartX = 1        + deltaX;
        iEndX   = imgWidth + deltaX;
        idxX    = iStartX:iEndX;

        for deltaY = minDelta:maxDelta

            iSample = iSample + 1;

            iStartY = 1         + deltaY;
            iEndY   = imgHeight + deltaY;
            idxY    = iStartY:iEndY;

            buffer( idxY, idxX, iSample ) = img;

        end
    end

    iMin   = ceil(regionSizePixels/2);
    iMax   = iMin + (imgWidth-1);
    buffer = buffer( iMin:iMax, iMin:iMax, : );

end % GETOFFSETIMAGES