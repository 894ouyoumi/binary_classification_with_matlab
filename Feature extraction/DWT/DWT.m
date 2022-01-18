% 小波变换特征提取 (DWT)
close all; clear; clc;

load('data\4_for_train.mat')
x_train=X;
load('data\1_for_test.mat')
x_test=X1;
% 范围是0-9
startS=0;
endS=9;
wStep=1;
wRange=9;

X=extractDWT(x_train,startS,endS,wStep,wRange);
T=extractDWT(x_test,startS,endS,wStep,wRange);
save dataDWT.mat X Y T

color_L = [0 102 255] ./ 255;
color_R = [255, 0, 102] ./ 255;

pos = find(Y==1);
plot(X(pos,1),X(pos,2),'x','Color',color_L,'LineWidth',2);

hold on
pos = find(Y==-1);
plot(X(pos,1),X(pos,2),'o','Color',color_R,'LineWidth',2);

legend('Y = 1','Y = -1')
xlabel('C3','fontweight','bold')
ylabel('C4','fontweight','bold')
