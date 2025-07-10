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

figure('Position', [100, 100, 1000, 1000]);

subplot(2, 2, 1);
plot(1:ER_k_max_0,F0,'bo',0:ER_k_max_0,fit_F0,'b');
box on;
set(gca, 'FontName', 'Cambria Math'); % 设置字体
set(gca, 'FontSize', 18); % 设置字体大小
set(gca, 'LineWidth', 1); % 设置边框大小
title('(a) Type-0','FontSize', 18);
axis([0 50 -2 10]);
xlabel('k', 'FontAngle', 'italic'), ylabel('F_{\Delta}(k)', 'FontAngle', 'italic');
legend('data','fitting','Location','northwest','Box','off','FontSize', 18);

subplot(2, 2, 2);
plot(1:ER_k_max_1,F1,'bo',0:ER_k_max_1,fit_F1,'b');
box on;
set(gca, 'FontName', 'Cambria Math'); % 设置字体
set(gca, 'FontSize', 18); % 设置字体大小
set(gca, 'LineWidth', 1); % 设置边框大小
title('(b) Type-1','FontSize', 18);
axis([0 50 -2 10]);
xlabel('k', 'FontAngle', 'italic'), ylabel('F_{\Delta}(k)', 'FontAngle', 'italic');
legend('data','fitting','Location','northwest','Box','off','FontSize', 18);

subplot(2, 2, 3);
plot(1:ER_k_max_2,F2,'bo',0:ER_k_max_2,fit_F2,'b');
box on;
set(gca, 'FontName', 'Cambria Math'); % 设置字体
set(gca, 'FontSize', 18); % 设置字体大小
set(gca, 'LineWidth', 1); % 设置边框大小
title('(c) Type-2','FontSize', 18);
axis([0 50 -2 10]);
xlabel('k', 'FontAngle', 'italic'), ylabel('F_{\Delta}(k)', 'FontAngle', 'italic');
legend('data','fitting','Location','northwest','Box','off','FontSize', 18);

subplot(2, 2, 4);
plot(1:ER_k_max_3,F3,'bo',0:ER_k_max_3,fit_F3,'b');
box on;
set(gca, 'FontName', 'Cambria Math'); % 设置字体
set(gca, 'FontSize', 18); % 设置字体大小
set(gca, 'LineWidth', 1); % 设置边框大小
title('(d) Type-3','FontSize', 18);
axis([0 50 -2 10]);
xlabel('k', 'FontAngle', 'italic'), ylabel('F_{\Delta}(k)', 'FontAngle', 'italic');
legend('data','fitting','Location','northwest','Box','off','FontSize', 18);

monitors = get(0, 'MonitorPositions');  % 获取显示器信息
primary_mon = monitors(1, :);           % 第一个显示器
new_width = 1000;
new_height = 1000;
new_x = primary_mon(1) + (primary_mon(3) - new_width)/2;
new_y = primary_mon(2) + (primary_mon(4) - new_height)/2;
set(gcf, 'Position', [new_x, new_y, new_width, new_height]);

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