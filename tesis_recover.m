function [ output value ] = tesis_recover( I, A, d )

    [height, width, nch] = size(I);
    value = zeros(height, width);
    output = zeros(height, width, nch);
    
    
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
                       
            output(i, j, c) = (I(i, j, c) - (A(c))) / value(i, j) + (A(c));
            end
         end
    end
end

