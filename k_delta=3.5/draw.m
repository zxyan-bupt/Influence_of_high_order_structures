clear all;
close all;
clc;

% rho_plot_h0ccl=load('N=2000_k1=20_k01=6_ode_lambda_delta=0.185_h_ccl.txt','\t');
rho_plot_h1ccl=load('N=2000_k1=20_k11=6_ode_lambda_delta=0.17_h_ccl.txt','\t');
rho_plot_h2ccl=load('N=2000_k1=20_k21=6_ode_lambda_delta=0.17_h_ccl.txt','\t');
% rho_plot_h3ccl=load('N=2000_k1=20_k31=6_ode_lambda_delta=0.16_h_ccl.txt','\t');

% rho_plot_h0cl=load('N=2000_k1=20_k01=6_ode_lambda_delta=0.185_h_cl.txt','\t');
rho_plot_h1cl=load('N=2000_k1=20_k11=6_ode_lambda_delta=0.17_h_cl.txt','\t');
rho_plot_h2cl=load('N=2000_k1=20_k21=6_ode_lambda_delta=0.17_h_cl.txt','\t');
% rho_plot_h3cl=load('N=2000_k1=20_k31=6_ode_lambda_delta=0.16_h_cl.txt','\t');

% rho_plot_h0=load('N=2000_k1=20_k01=6_ode_lambda_delta=0.185_h_x.txt','\t');
rho_plot_h1=load('N=2000_k1=20_k11=6_ode_lambda_delta=0.17_h_x.txt','\t');
rho_plot_h2=load('N=2000_k1=20_k21=6_ode_lambda_delta=0.17_h_x.txt','\t');
% rho_plot_h3=load('N=2000_k1=20_k31=6_ode_lambda_delta=0.16_h_x.txt','\t');

rho_plot_h0cr=load('N=2000_k1=20_k01=6_ode_lambda_delta=0.185_h_cr.txt','\t');
rho_plot_h1cr=load('N=2000_k1=20_k11=6_ode_lambda_delta=0.17_h_cr.txt','\t');
rho_plot_h2cr=load('N=2000_k1=20_k21=6_ode_lambda_delta=0.17_h_cr.txt','\t');
% rho_plot_h3cr=load('N=2000_k1=20_k31=6_ode_lambda_delta=0.16_h_cr.txt','\t');

% rho_plot_h0ccr=load('N=2000_k1=20_k01=6_ode_lambda_delta=0.185_h_ccr.txt','\t');
rho_plot_h1ccr=load('N=2000_k1=20_k11=6_ode_lambda_delta=0.17_h_ccr.txt','\t');
rho_plot_h2ccr=load('N=2000_k1=20_k21=6_ode_lambda_delta=0.17_h_ccr.txt','\t');
% rho_plot_h3ccr=load('N=2000_k1=20_k31=6_ode_lambda_delta=0.16_h_ccr.txt','\t');

% rho_plot_l0=load('N=2000_k1=20_k01=6_ode_lambda_delta=0.185_l_x.txt','\t');
rho_plot_l1=load('N=2000_k1=20_k11=6_ode_lambda_delta=0.17_l_x.txt','\t');
rho_plot_l2=load('N=2000_k1=20_k21=6_ode_lambda_delta=0.17_l_x.txt','\t');
% rho_plot_l3=load('N=2000_k1=20_k31=6_ode_lambda_delta=0.16_l_x.txt','\t');


% lambda1_plot0ccl=load('N=2000_k1=20_k01=6_ode_lambda_delta=0.185_lambda1_plot_ccl.txt','\t');
lambda1_plot1ccl=load('N=2000_k1=20_k11=6_ode_lambda_delta=0.17_lambda1_plot_ccl.txt','\t');
lambda1_plot2ccl=load('N=2000_k1=20_k21=6_ode_lambda_delta=0.17_lambda1_plot_ccl.txt','\t');
% lambda1_plot3ccl=load('N=2000_k1=20_k31=6_ode_lambda_delta=0.16_lambda1_plot_ccl.txt','\t');
% lambda1_plot0cl=load('N=2000_k1=20_k01=6_ode_lambda_delta=0.185_lambda1_plot_cl.txt','\t');
lambda1_plot1cl=load('N=2000_k1=20_k11=6_ode_lambda_delta=0.17_lambda1_plot_cl.txt','\t');
lambda1_plot2cl=load('N=2000_k1=20_k21=6_ode_lambda_delta=0.17_lambda1_plot_cl.txt','\t');
% lambda1_plot3cl=load('N=2000_k1=20_k31=6_ode_lambda_delta=0.16_lambda1_plot_cl.txt','\t');
lambda1_plot0=load('N=2000_k1=20_k01=6_ode_lambda_delta=0.185_lambda1_plot_x.txt','\t');
lambda1_plot1=load('N=2000_k1=20_k11=6_ode_lambda_delta=0.17_lambda1_plot_x.txt','\t');
lambda1_plot2=load('N=2000_k1=20_k21=6_ode_lambda_delta=0.17_lambda1_plot_x.txt','\t');
lambda1_plot3=load('N=2000_k1=20_k31=6_ode_lambda_delta=0.16_lambda1_plot_x.txt','\t');
lambda1_plot0cr=load('N=2000_k1=20_k01=6_ode_lambda_delta=0.185_lambda1_plot_cr.txt','\t');
lambda1_plot1cr=load('N=2000_k1=20_k11=6_ode_lambda_delta=0.17_lambda1_plot_cr.txt','\t');
lambda1_plot2cr=load('N=2000_k1=20_k21=6_ode_lambda_delta=0.17_lambda1_plot_cr.txt','\t');
% lambda1_plot3cr=load('N=2000_k1=20_k31=6_ode_lambda_delta=0.16_lambda1_plot_cr.txt','\t');
lambda1_plot0ccr=load('N=2000_k1=20_k01=6_ode_lambda_delta=0.185_lambda1_plot_ccr.txt','\t');
lambda1_plot1ccr=load('N=2000_k1=20_k11=6_ode_lambda_delta=0.17_lambda1_plot_ccr.txt','\t');
lambda1_plot2ccr=load('N=2000_k1=20_k21=6_ode_lambda_delta=0.17_lambda1_plot_ccr.txt','\t');
% lambda1_plot3ccr=load('N=2000_k1=20_k31=6_ode_lambda_delta=0.16_lambda1_plot_ccr.txt','\t');

figure(1)
hold on;
% plot(lambda1_plot0ccl,rho_plot_h0ccl,'k');
plot(lambda1_plot1ccl,rho_plot_h1ccl,'r');
plot(lambda1_plot2ccl,rho_plot_h2ccl,'k');
% plot(lambda1_plot3ccl,rho_plot_h3ccl,'r');

% plot(lambda1_plot0cl,rho_plot_h0cl,'k');
plot(lambda1_plot1cl,rho_plot_h1cl,'r');
plot(lambda1_plot2cl,rho_plot_h2cl,'k');
% plot(lambda1_plot3cl,rho_plot_h3cl,'r');

% plot(lambda1_plot0,rho_plot_h0,'k');
plot(lambda1_plot1,rho_plot_h1,'r');
plot(lambda1_plot2,rho_plot_h2,'k');
% plot(lambda1_plot3,rho_plot_h3,'r');

% plot(lambda1_plot0cr,rho_plot_h0cr,'k');
plot(lambda1_plot1cr,rho_plot_h1cr,'r');
plot(lambda1_plot2cr,rho_plot_h2cr,'k');
% plot(lambda1_plot3c,rho_plot_h3cr,'r');

% plot(lambda1_plot0ccr,rho_plot_h0ccr,'k');
plot(lambda1_plot1ccr,rho_plot_h1ccr,'r');
plot(lambda1_plot2ccr,rho_plot_h2ccr,'k');
% plot(lambda1_plot3ccr,rho_plot_h3ccr,'r');

% plot(lambda1_plot0,rho_plot_l0,'k');
plot(lambda1_plot1,rho_plot_l1,'r');
plot(lambda1_plot2,rho_plot_l2,'k');
% plot(lambda1_plot3,rho_plot_l3,'r');

box on;
axis([0.04 0.08 0 0.6]);
set(gca, 'FontName', 'Cambria Math'); % 设置字体
set(gca, 'FontSize', 12); % 设置字体大小
title('ERSC');
xlabel('\lambda')
ylabel('\rho(\infty)')
% xlim([0.02 0.06]); % 设置x轴范围
% ylim([ymin ymax]); % 设置y轴范围
xticks([0.04 0.05 0.06 0.07 0.08]); % 设置 x 轴刻度位置
yticks([0.2 0.4 0.6]); % 设置 y 轴刻度位置
legend('k^1_{\Delta}=6','k^2_{\Delta}=6','Location','northwest','Box','off');

% 小图
axes('Position', [0.505, 0.2, 0.36, 0.36]); 
hold on;
plot(lambda1_plot1,rho_plot_h1,'r');
plot(lambda1_plot1,rho_plot_l1,'r');
plot(lambda1_plot2,rho_plot_h2,'k');
plot(lambda1_plot2,rho_plot_l2,'k');
box on;
axis([0.04734 0.04746 0 0.08]);
xlabel('\lambda')
ylabel('\rho(\infty)')
xticks([0.04734 0.04738 0.04742 0.04746]); % 设置 x 轴刻度位置