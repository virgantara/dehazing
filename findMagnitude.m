function L  = findMagnitude( I, A, showFigures )

[h w c] = size(I);
A3 = reshape(A,1,1,3);
repA = repmat(A3,h,w);

disp('estimate transmission...')
patch_size = 10;
alpha_est = makeDarkChannel(I./repA,patch_size);

r = 15;
res = 0.001;

[alpha] = guided_filter(rgb2gray(I), alpha_est, r, res);


%[alpha] = generateLaplacian(I,alpha_est);

clear aPart
for c=1:3
    aPart(:,:,c) = alpha.*repA(:,:,c);
end

withoutA = I-aPart;
withoutA(withoutA<0)=0;


disp('calc l*...')
initMag = 0.5;
isNegative = true;
while(isNegative)
    initMag = initMag + 0.1;
    for c=1:3
        L(:,:,c) = withoutA(:,:,c)./(1-alpha./initMag);
    end
    isNegative = false;
    if(any(any(any(L<0))))
        isNegative = true;
    end
end

for c=1:3
    L(:,:,c) = withoutA(:,:,c)./(1-alpha./initMag);
end

end

