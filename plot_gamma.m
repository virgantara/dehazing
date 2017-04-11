%
x =0:255;
y_g = uint8(255 * (x / 255) .^ (2.3091));
plot(x, y_g, 'r', 'linewidth', 2);
% hold on;
% y_g = uint8(255 * (x / 255) .^ (0.75));
% plot(x, y_g, 'r', 'linewidth', 1);
% 
% y_g = uint8(255 * (x / 255) .^ (1));
% plot(x, y_g, 'r', 'linewidth', 1);
% 
% y_g = uint8(255 * (x / 255) .^ (1.25));
% plot(x, y_g, 'r', 'linewidth', 1);
% 
% y_g = uint8(255 * (x / 255) .^ (1.5));
% plot(x, y_g, 'r', 'linewidth', 1);
% 
% y_g = uint8(255 * (x / 255) .^ (1.75));
% plot(x, y_g, 'r', 'linewidth', 1);
% 
% y_g = uint8(255 * (x / 255) .^ (2.0));
% plot(x, y_g, 'r', 'linewidth', 1);