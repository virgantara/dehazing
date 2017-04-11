I1 = imread('Data\Kelud\Hazy\1.jpg');
I2 = imread('Data\Kelud\Hazy\2.jpg');
I3 = imread('Data\Kelud\Hazy\3.jpg');
I1 = rgb2hsv(I1);
I2 = rgb2hsv(I2);
I3 = rgb2hsv(I3);
s1 = I1(:,:,2);
s2 = I2(:,:,2);
s3 = I3(:,:,2);

x = [1 2 3];
y1 = [mean(mean(s1))  mean(mean(s2))  mean(mean(s3))];
v1 = I1(:,:,3);
v2 = I2(:,:,3);
v3 = I3(:,:,3);
y2 = [mean(mean(v1))  mean(mean(v2))  mean(mean(v3))];

% d = abs(mean(mean(v3)) - mean(mean(s3)));
% near = [mean(mean(v3)) mean(mean(s3)) d];

bar(x,diag(y2),'stacked');
% set(gca,'XTickLabel',{'1','sedang','jauh'})