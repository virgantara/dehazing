function J = sulami(I)
%The function finds and returns the Atmospheric light color (orientation and magnitude) of the given image

I = double(I)/255;
%I = I.^1.5; %gamma correction might help orientation recovery

A = findOrientation(I,false);



J = findMagnitude(I,A,false);

end
