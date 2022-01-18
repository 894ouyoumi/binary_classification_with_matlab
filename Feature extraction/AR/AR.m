% 自回归特征提取 (AR)
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
AROrder=5;

X=extractAR(x_train,AROrder,startS,endS,wStep,wRange);
T=extractAR(x_test,AROrder,startS,endS,wStep,wRange);
save dataAR.mat X Y T

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
