function J = meng(I)
% input an image
    %filename = '.\examples\3-h';
    %HazeImg = imread([filename, '.jpg']);
    %figure, imshow(HazeImg, []);

    HazeImg = I;
    % estimating the global airlight
    % method = 'our'; 
    % method = 'he'; 
    method = 'our'; 
    wsz = 15; % window size
    A = Airlight(HazeImg, method, wsz); 

    % calculating boundary constraints
    wsz = 3; % window size
    ts = Boundcon(HazeImg, A, 30, 300, wsz);

    % refining the estimation of transmission
    lambda = 2;  % regularization parameter, the more this parameter, the closer to the original patch-wise transmission
    t = CalTransmission(HazeImg, ts, lambda, 0.5); % using contextual information

    % dehazing
    r = Dehazefun(HazeImg, t, A, 0.85); 

    J = r;

end