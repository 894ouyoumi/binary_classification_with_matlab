% 共空间模式特征提取 (CSP)
close all; clear; clc;

load('data\4_for_train.mat')
EEGSignals.x=X;
EEGSignals.y=Y;
load('data\1_for_test.mat')
x_test=X1;

classLabels = unique(EEGSignals.y); 
CSPMatrix = learnCSP(EEGSignals,classLabels);
nbFilterPairs = 1;

X = extractCSP(EEGSignals, CSPMatrix, nbFilterPairs);  
EEGSignals.x=x_test;
T = extractCSP(EEGSignals, CSPMatrix, nbFilterPairs);  

save dataCSP.mat X Y T


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
