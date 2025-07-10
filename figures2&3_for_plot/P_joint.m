clear all;
close all;
clc;

ER_k_max_0=load('ER_k_max_0.txt','\t');
ER_k01_max=load('ER_k01_max.txt','\t');
ER_fitting_0=load('ER_fitting_0.txt','\t');
ER_fitting01=load('ER_fitting01.txt','\t');
ER_P1_0=load('ER_P1_0.txt','\t');
ER_P01=load('ER_P01.txt','\t');
ER_Pjoint=load('ER_Pjoint01.txt','\t');
ER_Pjoint01=transpose(ER_Pjoint);

ER_k_max_1=load('ER_k_max_1.txt','\t');
ER_k11_max=load('ER_k11_max.txt','\t');
ER_fitting_1=load('ER_fitting_1.txt','\t');
ER_fitting11=load('ER_fitting11.txt','\t');
ER_P1_1=load('ER_P1_1.txt','\t');
ER_P11=load('ER_P11.txt','\t');
ER_Pjoint=load('ER_Pjoint11.txt','\t');
ER_Pjoint11=transpose(ER_Pjoint);

ER_k_max_2=load('ER_k_max_2.txt','\t');
ER_k21_max=load('ER_k21_max.txt','\t');
ER_fitting_2=load('ER_fitting_2.txt','\t');
ER_fitting21=load('ER_fitting21.txt','\t');
ER_P1_2=load('ER_P1_2.txt','\t');
ER_P21=load('ER_P21.txt','\t');
ER_Pjoint=load('ER_Pjoint21.txt','\t');
ER_Pjoint21=transpose(ER_Pjoint);

ER_k_max_3=load('ER_k_max_3.txt','\t');
ER_k31_max=load('ER_k31_max.txt','\t');
ER_fitting_3=load('ER_fitting_3.txt','\t');
ER_fitting31=load('ER_fitting31.txt','\t');
ER_P1_3=load('ER_P1_3.txt','\t');
ER_P31=load('ER_P31.txt','\t');
ER_Pjoint=load('ER_Pjoint31.txt','\t');
ER_Pjoint31=transpose(ER_Pjoint);

SF_k_max_0=load('k_max_0.txt','\t');
SF_k01_max=load('k01_max.txt','\t');
SF_fitting01=load('fitting01.txt','\t');
SF_P1_0=load('P1_0.txt','\t');
SF_P01=load('P01.txt','\t');
SF_Pjoint=load('Pjoint01.txt','\t');
SF_Pjoint01=transpose(SF_Pjoint);

SF_k_max_1=load('k_max_1.txt','\t');
SF_k11_max=load('k11_max.txt','\t');
SF_fitting11=load('fitting11.txt','\t');
SF_P1_1=load('P1_1.txt','\t');
SF_P11=load('P11.txt','\t');
SF_Pjoint=load('Pjoint11.txt','\t');
SF_Pjoint11=transpose(SF_Pjoint);

SF_k_max_2=load('k_max_2.txt','\t');
SF_k21_max=load('k21_max.txt','\t');
SF_fitting21=load('fitting21.txt','\t');
SF_P1_2=load('P1_2.txt','\t');
SF_P21=load('P21.txt','\t');
SF_Pjoint=load('Pjoint21.txt','\t');
SF_Pjoint21=transpose(SF_Pjoint);

SF_k_max_3=load('k_max_3.txt','\t');
SF_k31_max=load('k31_max.txt','\t');
SF_fitting31=load('fitting31.txt','\t');
SF_P1_3=load('P1_3.txt','\t');
SF_P31=load('P31.txt','\t');
SF_Pjoint=load('Pjoint31.txt','\t');
SF_Pjoint31=transpose(SF_Pjoint);

figure('Position', [100, 100, 600, 1600]);

ax1=subplot(4, 2, 1);
hold on;
h0=plot(0:ER_k_max_0,ER_P1_0,'ko','DisplayName', 'k');
h1=plot(0:ER_k01_max,ER_P01,'ro','DisplayName', 'k_{\Delta}');
h2=plot(0:ER_k_max_0,ER_fitting_0,'k','DisplayName', 'k(fitting)');
h3=plot(0:ER_k01_max,ER_fitting01,'r','DisplayName', 'k_{\Delta}(fitting)');
box on;
title('(a) Type-0','FontSize',14);
axis([0 inf 0 0.25]);
xlabel('k or k_{\Delta}'), ylabel('P(k) or P(k_{\Delta})')
set(gca, 'FontName', 'Cambria Math'); % 设置字体
set(gca, 'FontSize', 12); % 设置字体大小
set(gca, 'LineWidth', 1); % 设置边框大小
% legend('k','k_{\Delta}','Location','northeast','FontSize',12,'Box','off');

ax2=subplot(4, 2, 2);
plot(0:ER_k_max_1,ER_P1_1,'ko',0:ER_k11_max,ER_P11,'ro',0:ER_k_max_1,ER_fitting_1,'k',0:ER_k11_max,ER_fitting11,'r');
box on;
title('(b) Type-1','FontSize',14);
axis([0 inf 0 0.25]);
xlabel('k or k_{\Delta}'), ylabel('P(k) or P(k_{\Delta})')
set(gca, 'FontName', 'Cambria Math'); % 设置字体
set(gca, 'FontSize', 12); 
set(gca, 'LineWidth', 1); % 设置边框大小
% legend('k','k_{\Delta}','Location','northeast','FontSize',12,'Box','off');

ax3=subplot(4, 2, 3);
plot(0:ER_k_max_2,ER_P1_2,'ko',0:ER_k21_max,ER_P21,'ro',0:ER_k_max_2,ER_fitting_2,'k',0:ER_k21_max,ER_fitting21,'r');
box on;
title('(c) Type-2','FontSize',14);
axis([0 inf 0 0.25]);
xlabel('k or k_{\Delta}'), ylabel('P(k) or P(k_{\Delta})')
set(gca, 'FontName', 'Cambria Math'); % 设置字体
set(gca, 'FontSize', 12); 
set(gca, 'LineWidth', 1); % 设置边框大小
% legend('k','k_{\Delta}','Location','northeast','FontSize',12,'Box','off');

ax4=subplot(4, 2, 4);
plot(0:ER_k_max_3,ER_P1_3,'ko',0:ER_k31_max,ER_P31,'ro',0:ER_k_max_3,ER_fitting_3,'k',0:ER_k31_max,ER_fitting31,'r');
box on;
title('(d) Type-3','FontSize',14);
axis([0 inf 0 0.25]);
xlabel('k or k_{\Delta}'), ylabel('P(k) or P(k_{\Delta})')
set(gca, 'FontName', 'Cambria Math'); % 设置字体
set(gca, 'FontSize', 12); 
set(gca, 'LineWidth', 1); % 设置边框大小
% legend('k','k_{\Delta}','Location','northeast','FontSize',12,'Box','off');

ax5=subplot(4, 2, 5);
plot(0:SF_k_max_0,SF_P1_0,'ko',0:SF_k01_max,SF_P01,'ro',0:SF_k01_max,SF_fitting01,'r');
box on;
title('(e) Type-0','FontSize',14);
axis([0 inf 0 0.25]);
xlabel('k or k_{\Delta}'), ylabel('P(k) or P(k_{\Delta})')
set(gca, 'FontName', 'Cambria Math'); % 设置字体
set(gca, 'FontSize', 12); 
set(gca, 'LineWidth', 1); % 设置边框大小
% legend('k','k_{\Delta}','Location','northeast','FontSize',12,'Box','off');
axes('Position', [0.24, 0.36, 0.16, 0.08]); 
hold on;
plot(0:SF_k_max_0,SF_P1_0,'ko',0:SF_k01_max,SF_P01,'ro',0:SF_k01_max,SF_fitting01,'r');
box on;
axis([0 30 0 0.25]);

ax6=subplot(4, 2, 6);
plot(0:SF_k_max_1,SF_P1_1,'ko',0:SF_k11_max,SF_P11,'ro',0:SF_k11_max,SF_fitting11,'r');
box on;
title('(f) Type-1','FontSize',14);
axis([0 inf 0 0.25]);
xlabel('k or k_{\Delta}'), ylabel('P(k) or P(k_{\Delta})')
set(gca, 'FontName', 'Cambria Math'); % 设置字体
set(gca, 'FontSize', 12); 
set(gca, 'LineWidth', 1); % 设置边框大小
% legend('k','k_{\Delta}','Location','northeast','FontSize',12,'Box','off');
axes('Position', [0.63, 0.36, 0.16, 0.08]); 
hold on;
plot(0:SF_k_max_0,SF_P1_0,'ko',0:SF_k01_max,SF_P01,'ro',0:SF_k01_max,SF_fitting01,'r');
box on;
axis([0 30 0 0.25]);

ax7=subplot(4, 2, 7);
plot(0:SF_k_max_2,SF_P1_2,'ko',0:SF_k21_max,SF_P21,'ro',0:SF_k21_max,SF_fitting21,'r');
box on;
title('(g) Type-2','FontSize',14);
axis([0 inf 0 0.25]);
xlabel('k or k_{\Delta}'), ylabel('P(k) or P(k_{\Delta})')
set(gca, 'FontName', 'Cambria Math'); % 设置字体
set(gca, 'FontSize', 12); 
set(gca, 'LineWidth', 1); % 设置边框大小
% legend('k','k_{\Delta}','Location','northeast','FontSize',12,'Box','off');
axes('Position', [0.24, 0.12, 0.16, 0.08]); 
hold on;
plot(0:SF_k_max_0,SF_P1_0,'ko',0:SF_k01_max,SF_P01,'ro',0:SF_k01_max,SF_fitting01,'r');
box on;
axis([0 30 0 0.25]);

ax8=subplot(4, 2, 8);
plot(0:SF_k_max_3,SF_P1_3,'ko',0:SF_k31_max,SF_P31,'ro',0:SF_k31_max,SF_fitting31,'r');
box on;
title('(h) Type-3','FontSize',14);
axis([0 inf 0 0.25]);
xlabel('k or k_{\Delta}'), ylabel('P(k) or P(k_{\Delta})')
set(gca, 'FontName', 'Cambria Math'); % 设置字体
set(gca, 'FontSize', 12); 
set(gca, 'LineWidth', 1); % 设置边框大小
% legend('k','k_{\Delta}','Location','northeast','FontSize',12,'Box','off');
axes('Position', [0.63, 0.12, 0.16, 0.08]); 
hold on;
plot(0:SF_k_max_0,SF_P1_0,'ko',0:SF_k01_max,SF_P01,'ro',0:SF_k01_max,SF_fitting01,'r');
box on;
axis([0 30 0 0.25]);

%调整子图位置
pos1 = ax1.Position; 
ax1.Position = [pos1(1), pos1(2)+0.02, pos1(3), pos1(4)]; 
pos2 = ax2.Position; 
ax2.Position = [pos2(1)-0.05, pos2(2)+0.02, pos2(3), pos2(4)]; 
pos3 = ax3.Position; 
ax3.Position = [pos3(1), pos3(2), pos3(3), pos3(4)]; 
pos4 = ax4.Position; 
ax4.Position = [pos4(1)-0.05, pos4(2), pos4(3), pos4(4)]; 
pos5 = ax5.Position; 
ax5.Position = [pos5(1), pos5(2)-0.02, pos5(3), pos5(4)]; 
pos6 = ax6.Position; 
ax6.Position = [pos6(1)-0.05, pos6(2)-0.02, pos6(3), pos6(4)]; 
pos7 = ax7.Position; 
ax7.Position = [pos7(1), pos7(2)-0.04, pos7(3), pos7(4)]; 
pos8 = ax8.Position; 
ax8.Position = [pos8(1)-0.05, pos8(2)-0.04, pos8(3), pos8(4)]; 

monitors = get(0, 'MonitorPositions');  % 获取显示器信息
primary_mon = monitors(1, :);           % 第一个显示器
new_width = 750;
new_height = 2000;
new_x = primary_mon(1) + (primary_mon(3) - new_width)/2;
new_y = primary_mon(2) + (primary_mon(4) - new_height)/2;
set(gcf, 'Position', [new_x, new_y, new_width, new_height]);

fig = gcf;
figPos = fig.Position;  % [左, 下, 宽, 高]

leg = legend([h0, h1, h2, h3]); 
set(leg, 'Units', 'normalized', 'Position', [0.88, 0.5, 0.01, 0.02]);

allAxes = findobj(fig, 'Type', 'axes', '-not', 'Tag', 'legend');
% 调整每个坐标轴宽度（缩小15%给图注腾空间）
for i = 1:length(allAxes)
    axPos = get(allAxes(i), 'Position');
    set(allAxes(i), 'Position', [axPos(1), axPos(2), axPos(3)*0.75, axPos(4)]);
end


global_min1 = min([ER_Pjoint01(:); ER_Pjoint11(:); ER_Pjoint21(:); ER_Pjoint31(:)]);
global_max1 = max([ER_Pjoint01(:); ER_Pjoint11(:); ER_Pjoint21(:); ER_Pjoint31(:)]);

global_min2 = min([SF_Pjoint01(:); SF_Pjoint11(:); SF_Pjoint21(:); SF_Pjoint31(:)]);
global_max2 = max([SF_Pjoint01(:); SF_Pjoint11(:); SF_Pjoint21(:); SF_Pjoint31(:)]);

figure('Position', [100, 100, 600, 1600]);

ax1=subplot(4, 2, 1);
box on;
axis([0 inf 0 inf]);
imagesc(0:35,0:8,ER_Pjoint01(1:9,1:36));
title('(a) Type-0','FontSize',12,'FontSize',14);
xlabel('k'), ylabel('k_{\Delta}')
set(gca, 'FontName', 'Cambria Math'); % 设置字体
set(gca, 'YDir', 'normal'); % 反转 y 轴方向
set(gca, 'FontSize', 12); 
set(gca, 'LineWidth', 1); % 设置边框大小

ax2=subplot(4, 2, 2);
box on;
axis([0 inf 0 inf]);
imagesc(0:35,0:8,ER_Pjoint11(1:9,1:36));
title('(b) Type-1','FontSize',14);
xlabel('k'), ylabel('k_{\Delta}')
set(gca, 'FontName', 'Cambria Math'); % 设置字体
set(gca, 'YDir', 'normal'); % 反转 y 轴方向
set(gca, 'FontSize', 12); 
set(gca, 'LineWidth', 1); % 设置边框大小

ax3=subplot(4, 2, 3);
box on;
axis([0 inf 0 inf]);
imagesc(0:35,0:8,ER_Pjoint21(1:9,1:36));
title('(c) Type-2','FontSize',14);
xlabel('k'), ylabel('k_{\Delta}')
set(gca, 'FontName', 'Cambria Math'); % 设置字体
set(gca, 'YDir', 'normal'); % 反转 y 轴方向
set(gca, 'FontSize', 12); 
set(gca, 'LineWidth', 1); % 设置边框大小

ax4=subplot(4, 2, 4);
box on;
axis([0 inf 0 inf]);
imagesc(0:35,0:8,ER_Pjoint31(1:9,1:36));
title('(d) Type-3','FontSize',14);
xlabel('k'), ylabel('k_{\Delta}')
set(gca, 'FontName', 'Cambria Math'); % 设置字体
set(gca, 'YDir', 'normal'); % 反转 y 轴方向
set(gca, 'FontSize', 12); 
set(gca, 'LineWidth', 1); % 设置边框大小
colormap('cool'); % 使用 'hot' 颜色映射
caxis([global_min1 global_max1]);
colorbar;
cbar=colorbar('eastoutside');  % 右侧外部
cbar.Position=[0.9, 0.583, 0.0196, 0.342]; 
cbar.LineWidth=1;
text(50, 22, 'P(k,k_{\Delta})', 'HorizontalAlignment', 'center', 'FontName', 'Cambria Math', 'FontSize', 14);% 在 colorbar 上方手动添加注释

ax5=subplot(4, 2, 5);
box on;
axis([0 40 0 8]);
imagesc(0:40,0:8,SF_Pjoint01(1:9,1:41));
title('(e) Type-0','FontSize',14);
xlabel('k'), ylabel('k_{\Delta}')
set(gca, 'FontName', 'Cambria Math'); % 设置字体
set(gca, 'YDir', 'normal'); % 反转 y 轴方向
set(gca, 'FontSize', 12); 
set(gca, 'LineWidth', 1); % 设置边框大小

ax6=subplot(4, 2, 6);
box on;
axis([0 40 0 8]);
imagesc(0:40,0:8,SF_Pjoint11(1:9,1:41));
title('(f) Type-1','FontSize',14);
xlabel('k'), ylabel('k_{\Delta}')
set(gca, 'FontName', 'Cambria Math'); % 设置字体
set(gca, 'YDir', 'normal'); % 反转 y 轴方向
set(gca, 'FontSize', 12); 
set(gca, 'LineWidth', 1); % 设置边框大小

ax7=subplot(4, 2, 7);
box on;
axis([0 40 0 8]);
imagesc(0:40,0:8,SF_Pjoint21(1:9,1:41));
title('(g) Type-2','FontSize',14);
xlabel('k'), ylabel('k_{\Delta}')
set(gca, 'FontName', 'Cambria Math'); % 设置字体
set(gca, 'YDir', 'normal'); % 反转 y 轴方向
set(gca, 'FontSize', 12); 
set(gca, 'LineWidth', 1); % 设置边框大小

ax8=subplot(4, 2, 8);
box on;
axis([0 40 0 8]);
imagesc(0:40,0:8,SF_Pjoint31(1:9,1:41));
title('(h) Type-3','FontSize',14);
xlabel('k'), ylabel('k_{\Delta}')
set(gca, 'FontName', 'Cambria Math'); % 设置字体
set(gca, 'YDir', 'normal'); % 反转 y 轴方向
set(gca, 'FontSize', 12); 
set(gca, 'LineWidth', 1); % 设置边框大小
colormap('cool'); % 使用 'hot' 颜色映射
caxis([global_min2 global_max2]);
colorbar;
cbar=colorbar('eastoutside');  % 右侧外部
cbar.Position=[0.9, 0.11, 0.02, 0.34]; 
cbar.LineWidth=1;
text(57, 22.3, 'P(k,k_{\Delta})', 'HorizontalAlignment', 'center', 'FontName', 'Cambria Math', 'FontSize', 14);% 在 colorbar 上方手动添加注释

%调整子图位置
pos1 = ax1.Position; 
ax1.Position = [pos1(1), pos1(2)+0.02, pos1(3), pos1(4)]; 
pos2 = ax2.Position; 
ax2.Position = [pos2(1)-0.05, pos2(2)+0.02, pos2(3), pos2(4)]; 
pos3 = ax3.Position; 
ax3.Position = [pos3(1), pos3(2), pos3(3), pos3(4)]; 
pos4 = ax4.Position; 
ax4.Position = [pos4(1)-0.05, pos4(2), pos4(3), pos4(4)]; 
pos5 = ax5.Position; 
ax5.Position = [pos5(1), pos5(2)-0.02, pos5(3), pos5(4)]; 
pos6 = ax6.Position; 
ax6.Position = [pos6(1)-0.05, pos6(2)-0.02, pos6(3), pos6(4)]; 
pos7 = ax7.Position; 
ax7.Position = [pos7(1), pos7(2)-0.04, pos7(3), pos7(4)]; 
pos8 = ax8.Position; 
ax8.Position = [pos8(1)-0.05, pos8(2)-0.04, pos8(3), pos8(4)]; 

monitors = get(0, 'MonitorPositions');  % 获取显示器信息
primary_mon = monitors(1, :);           % 第一个显示器
new_width = 750;
new_height = 2000;
new_x = primary_mon(1) + (primary_mon(3) - new_width)/2;
new_y = primary_mon(2) + (primary_mon(4) - new_height)/2;
set(gcf, 'Position', [new_x, new_y, new_width, new_height]);

fig = gcf;
figPos = fig.Position;  % [左, 下, 宽, 高]

allAxes = findobj(fig, 'Type', 'axes', '-not', 'Tag', 'legend');
% 调整每个坐标轴宽度（缩小15%给图注腾空间）
for i = 1:length(allAxes)
    axPos = get(allAxes(i), 'Position');
    set(allAxes(i), 'Position', [axPos(1), axPos(2), axPos(3)*0.85, axPos(4)]);
end