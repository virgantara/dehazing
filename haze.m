function [I d] = haze(J)
    J = double(J)/255;
    Igray = rgb2gray(J);
    e = 2.718281828459;
    d = randi([0 1],size(Igray));
    k = randi([850 1000])/1000;
    A = [k k k];

    [row, col, channels] = size(J);

    I = zeros(size(J));

    for c=1:1:channels
        for i=1:1:row
            for j=1:1:col
                trans = e^(-d(i,j));
                I(i,j,c) = (J(i,j,c) * trans) + (A(c) * (1 - trans));
            end
        end
    end
end