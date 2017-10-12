% filename = 'Kawah_20161101_103634.jpg';
filename = 'Kawah_20161101_080634.jpg';
% Open the file specified in filename, do your processing...
% fpath = strcat('Data\Kelud\Hazy\',filename);
% 
% I = imread(fpath);
% I = rgb2hsv(I);
% figure,
% plot(plotpdf(I(:,:,1)),'Color',[1,0,0],'LineWidth',1.5);
% hold on
% plot(plotpdf(I(:,:,2)),'Color',[0,1,0],'LineWidth',1.5);
% plot(plotpdf(I(:,:,3)),'Color',[0,0,1],'LineWidth',1.5);
% hold off


iname = strcat('Data\Kelud\Chen\',filename);  
J = imread(iname);
J = rgb2hsv(J);
% figure,imhist(J(:,:,1));
figure,
% plot(plotpdf(J(:,:,1)),'Color',[1,0,0],'LineWidth',1.5);
hold on
set(gca,'FontSize',16)
xlabel('Intensitas','FontName','Arial','FontSize',16);
ylabel('Jumlah','FontName','Arial','FontSize',16);
plot(plotpdf(J(:,:,2)),'Color',[0.86,0.56,0],'LineWidth',1.5);
plot(plotpdf(J(:,:,3)),'Color',[0,0,1],'LineWidth',1.5);
legend('Saturasi','Kecerahan','orientation','horizontal');
ylim([0 0.05]);
hold off