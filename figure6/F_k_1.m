clear all;
close all;
clc;

ER_k_max_0=load('ER_k_max_0.txt','\t');
ER_k_max_1=load('ER_k_max_1.txt','\t');
ER_k_max_2=load('ER_k_max_2.txt','\t');
ER_k_max_3=load('ER_k_max_3.txt','\t');

F0=load('F0.txt','\t');
F1=load('F1.txt','\t');
F2=load('F2.txt','\t');
F3=load('F3.txt','\t');

fit_F0=load('fit_F0.txt','\t');
fit_F1=load('fit_F1.txt','\t');
fit_F2=load('fit_F2.txt','\t');
fit_F3=load('fit_F3.txt','\t');

figure('Position', [100, 100, 1600, 360]);

ax1=subplot(1, 4, 1);
plot(1:ER_k_max_0,F0,'bo',0:ER_k_max_0,fit_F0,'b');
box on;
set(gca, 'FontName', 'Cambria Math'); % 设置字体
set(gca, 'FontSize', 18); % 设置字体大小
set(gca, 'LineWidth', 1); % 设置边框大小
title('(a) Type-0','FontSize', 18);
axis([0 50 -2 10]);
xlabel('k', 'FontAngle', 'italic'), ylabel('F_{\Delta}(k)', 'FontAngle', 'italic');
legend('data','fitting','Location','northwest','Box','off','FontSize', 18);

ax2=subplot(1, 4, 2);
plot(1:ER_k_max_1,F1,'bo',0:ER_k_max_1,fit_F1,'b');
box on;
set(gca, 'FontName', 'Cambria Math'); % 设置字体
set(gca, 'FontSize', 18); % 设置字体大小
set(gca, 'LineWidth', 1); % 设置边框大小
title('(b) Type-1','FontSize', 18);
axis([0 50 -2 10]);
xlabel('k', 'FontAngle', 'italic'), ylabel('F_{\Delta}(k)', 'FontAngle', 'italic');
legend('data','fitting','Location','northwest','Box','off','FontSize', 18);

ax3=subplot(1, 4, 3);
plot(1:ER_k_max_2,F2,'bo',0:ER_k_max_2,fit_F2,'b');
box on;
set(gca, 'FontName', 'Cambria Math'); % 设置字体
set(gca, 'FontSize', 18); % 设置字体大小
set(gca, 'LineWidth', 1); % 设置边框大小
title('(c) Type-2','FontSize', 18);
axis([0 50 -2 10]);
xlabel('k', 'FontAngle', 'italic'), ylabel('F_{\Delta}(k)', 'FontAngle', 'italic');
legend('data','fitting','Location','northwest','Box','off','FontSize', 18);

ax4=subplot(1, 4, 4);
plot(1:ER_k_max_3,F3,'bo',0:ER_k_max_3,fit_F3,'b');
box on;
set(gca, 'FontName', 'Cambria Math'); % 设置字体
set(gca, 'FontSize', 18); % 设置字体大小
set(gca, 'LineWidth', 1); % 设置边框大小
title('(d) Type-3','FontSize', 18);
axis([0 50 -2 10]);
xlabel('k', 'FontAngle', 'italic'), ylabel('F_{\Delta}(k)', 'FontAngle', 'italic');
legend('data','fitting','Location','northwest','Box','off','FontSize', 18);

%调整子图位置
pos1 = ax1.Position; 
ax1.Position = [pos1(1)-0.03, pos1(2)+0.1, pos1(3), pos1(4)*0.85]; 
pos2 = ax2.Position; 
ax2.Position = [pos2(1)-0.01, pos2(2)+0.1, pos2(3), pos2(4)*0.85]; 
pos3 = ax3.Position; 
ax3.Position = [pos3(1)+0.01, pos3(2)+0.1, pos3(3), pos3(4)*0.85]; 
pos4 = ax4.Position; 
ax4.Position = [pos4(1)+0.03, pos4(2)+0.1, pos4(3), pos4(4)*0.85]; 

figure(2);
hold on;
plot(1:ER_k_max_0,F0,'ro',0:ER_k_max_0,fit_F0,'r');
plot(1:ER_k_max_1,F1,'go',0:ER_k_max_1,fit_F1,'g');
plot(1:ER_k_max_2,F2,'bo',0:ER_k_max_2,fit_F2,'b');
plot(1:ER_k_max_3,F3,'ko',0:ER_k_max_3,fit_F3,'k');
box on;
set(gca, 'FontName', 'Cambria Math'); % 设置字体
set(gca, 'FontSize', 14); % 设置字体大小
set(gca, 'LineWidth', 1); % 设置边框大小
% title('(d) Type-3','FontSize', 14);
axis([0 50 -2 10]);
xlabel('k', 'FontAngle', 'italic'), ylabel('F_{\Delta}(k)', 'FontAngle', 'italic');
legend('Type-0','Type-1','Type-2','Type-3','Location','northwest','Box','off','FontSize', 14);