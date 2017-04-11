
function dc = avg_intensity(I,b,k)
    
   [b k ~] = size(I);

    totalr = sum(sum(I(:,:,1)));
    totalg = sum(sum(I(:,:,2)));
    totalb = sum(sum(I(:,:,3)));

    mn = b*k;
    avgr = totalr/mn;
    avgg = totalg/mn;
    avgb = totalb/mn;

    avgc = (avgr + avgg + avgb)/3;

    dr = avgr - avgc;
    dg = avgg - avgc;
    db = avgb - avgc;

    dc = [dr dg db];

end