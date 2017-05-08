function hasil = quad_tree(I)
    [r c ~] = size(I);
     hasil = I;
    w = r / 2;
    h = c / 2;
    
    if w < 100
        return
    end
    %
    % ----------
    % |  1 | 2  |
    % |----|----|
    % |  3 | 4  |
    % ----------
    A=I(1:w,1:h); 
    B=I(1:w,h+1:c);
    C=I(w+1:r,1:h);
    D=I(w+1:r,h+1:c);

%     P = [A;B;C;D];
% 
%     avgA = mean(mean(A));
%     avgB = mean(mean(B));
%     avgC = mean(mean(C));
%     avgD = mean(mean(D));

    avg = [mean(mean(A)) mean(mean(B)) mean(mean(C)) mean(mean(D))];

    sd = [std2(A) std2(B) std2(C) std2(D)];

    score = avg - sd;

    idx = find(score == max(score));

   
    if idx == 1
       hasil = quad_tree(A);
    elseif idx == 2
       hasil = quad_tree(B);
    elseif idx == 3
       hasil = quad_tree(C);
    elseif idx == 4
       hasil = quad_tree(D);
    end
    
    
end
%bright = zeros(w,h);


%sd = std2(I);
