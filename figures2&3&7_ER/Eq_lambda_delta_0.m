clear all;
close all;
clc;

load('N=2000_k1=20_k31=3_edge1_1.mat');
load('N=2000_k1=20_k31=3_edge2_1.mat');
load('N=2000_k1=20_k31=3_long_1.mat');

N=2000;
A=zeros(N,N);
k=zeros(1,N);
k_delta01=zeros(1,N);
k_delta11=zeros(1,N);
k_delta21=zeros(1,N);
k_delta31=zeros(1,N);
for i=1:long(1)
    for j=1:2
        k(edge1(i,j))=k(edge1(i,j))+1;
    end
    A(edge1(i,1),edge1(i,2))=1;
end
for i=1:long(2)
    panduan(i)=A(edge2(i,1),edge2(i,2))+A(edge2(i,1),edge2(i,3))+A(edge2(i,2),edge2(i,3));
    if panduan(i)==0
        for j=1:3
            k_delta01(edge2(i,j))=k_delta01(edge2(i,j))+1;
        end
    elseif panduan(i)==1
        for j=1:3
            k_delta11(edge2(i,j))=k_delta11(edge2(i,j))+1;
        end
    elseif panduan(i)==2
        for j=1:3
            k_delta21(edge2(i,j))=k_delta21(edge2(i,j))+1;
        end
    elseif panduan(i)==3
        for j=1:3
            k_delta31(edge2(i,j))=k_delta31(edge2(i,j))+1;
        end
    end
end

k_max=max(k);
k_bar=mean(k);
k01_max=max(k_delta01);
k11_max=max(k_delta11);
k21_max=max(k_delta21);
k31_max=max(k_delta31);
k01_bar=mean(k_delta01);
k11_bar=mean(k_delta11);
k21_bar=mean(k_delta21);
k31_bar=mean(k_delta31);

k2_bar=mean(k.*k);
k3_bar=mean(k.*k.*k);

P1=zeros(1,k_max+1);
for i=1:N
    P1(1,k(i)+1)=P1(1,k(i)+1)+1/N;
end
fitting=poisspdf(0:k_max,k_bar);

k_max=max(k);

n=zeros(1,k_max);
F0=zeros(1,k_max);
F1=zeros(1,k_max);
F2=zeros(1,k_max);
F3=zeros(1,k_max);
for i=1:N
    if k(i)~=0
        n(k(i))=n(k(i))+1;
    end
end
for i=1:N
    if k(i)~=0
        F0(k(i))=F0(k(i))+k_delta01(i)/n(k(i));
        F1(k(i))=F1(k(i))+k_delta11(i)/n(k(i));
        F2(k(i))=F2(k(i))+k_delta21(i)/n(k(i));
        F3(k(i))=F3(k(i))+k_delta31(i)/n(k(i));
    end
end

% fit=polyfit(8:33,F0(8:33),1);
% fit=polyfit(10:34,F1(10:34),1);
% fit=polyfit(8:33,F2(8:33),1);
fit=polyfit(5:33,F3(5:33),1);

fit_F=polyval(fit,0:k_max);

A=fit(1);
B=fit(2);
lambda_delta_c=k_bar*k_bar*k3_bar/k2_bar/k2_bar/(A*k2_bar+B*k_bar);

%持续阈值前
lambda_delta=0;
lambda1=0.03;
i_theta=0;
for n_theta=-0.5:0.01:1
    i_theta=i_theta+1;
    theta(i_theta)=n_theta;
    phi1(i_theta)=-theta(i_theta);
    for i_k=1:k_max
        sigma=(A+B/i_k)*lambda_delta/lambda1;
        phi1(i_theta)=phi1(i_theta)+P1(i_k+1)/k_bar* (i_k*i_k*lambda1*theta(i_theta)*(1+sigma*theta(i_theta))) / (1+ i_k*lambda1*theta(i_theta)*(1+sigma*theta(i_theta)) );
    end
end

%持续阈值
lambda_delta=0;
lambda1=0.0434;
i_theta=0;
for n_theta=-0.5:0.01:1
    i_theta=i_theta+1;
    theta(i_theta)=n_theta;
    phi2(i_theta)=-theta(i_theta);
    for i_k=1:k_max
        sigma=(A+B/i_k)*lambda_delta/lambda1;
        phi2(i_theta)=phi2(i_theta)+P1(i_k+1)/k_bar* (i_k*i_k*lambda1*theta(i_theta)*(1+sigma*theta(i_theta))) / (1+ i_k*lambda1*theta(i_theta)*(1+sigma*theta(i_theta)) );
    end
end

%持续阈值后，入侵阈值前
lambda_delta=0;
lambda1=0.045;
i_theta=0;
for n_theta=-0.5:0.01:1
    i_theta=i_theta+1;
    theta(i_theta)=n_theta;
    phi3(i_theta)=-theta(i_theta);
    for i_k=1:k_max
        sigma=(A+B/i_k)*lambda_delta/lambda1;
        phi3(i_theta)=phi3(i_theta)+P1(i_k+1)/k_bar* (i_k*i_k*lambda1*theta(i_theta)*(1+sigma*theta(i_theta))) / (1+ i_k*lambda1*theta(i_theta)*(1+sigma*theta(i_theta)) );
    end
end

%入侵阈值_非临界
lambda_delta=0;
% lambda_delta=lambda_delta_c;
lambda1=k_bar/k2_bar;
i_theta=0;
for n_theta=-0.5:0.01:1
    i_theta=i_theta+1;
    theta(i_theta)=n_theta;
    phi4(i_theta)=-theta(i_theta);
    for i_k=1:k_max
        sigma=(A+B/i_k)*lambda_delta/lambda1;
        phi4(i_theta)=phi4(i_theta)+P1(i_k+1)/k_bar* (i_k*i_k*lambda1*theta(i_theta)*(1+sigma*theta(i_theta))) / (1+ i_k*lambda1*theta(i_theta)*(1+sigma*theta(i_theta)) );
    end
end

%入侵阈值后
lambda_delta=0;
lambda1=0.06;
i_theta=0;
for n_theta=-0.5:0.01:1
    i_theta=i_theta+1;
    theta(i_theta)=n_theta;
    phi5(i_theta)=-theta(i_theta);
    for i_k=1:k_max
        sigma=(A+B/i_k)*lambda_delta/lambda1;
        phi5(i_theta)=phi5(i_theta)+P1(i_k+1)/k_bar* (i_k*i_k*lambda1*theta(i_theta)*(1+sigma*theta(i_theta))) / (1+ i_k*lambda1*theta(i_theta)*(1+sigma*theta(i_theta)) );
    end
end

figure(1);
hold on;
plot(theta,phi1,'r','LineWidth',1.5);
plot(theta,phi2,'g','LineWidth',1.5);
plot(theta,phi3,'b','LineWidth',1.5);
plot(theta,phi4,'k','LineWidth',1.5);
plot(theta,phi5,'m','LineWidth',1.5);
% 绘制 y=0 直线（水平线）
plot([-5 5], [0 0],'k--','LineWidth',1.5); % 蓝色 y=0 直线
% 绘制 x=0 直线（垂直线）
plot([0 0], [-5 5],'k--','LineWidth',1.5); % 红色 x=0 直线
box on;
axis([-0.2 0.6 -0.1 0.05]);
set(gca, 'FontName', 'Cambria Math'); % 设置字体
set(gca, 'FontSize', 12); % 设置字体大小
set(gca, 'LineWidth', 1.5); % 设置边框大小
title('(a)');
xlabel('\Theta(\infty)'), ylabel('\Phi[\Theta(\infty)]-\Theta(\infty)')
xticks([-0.2 0 0.2 0.4 0.6]); % 设置 x 轴刻度位置
yticks([-0.1 -0.05 0 0.05]); % 设置 y 轴刻度位置
% legend('\lambda=0.03','\lambda=0.0434','\lambda=0.045','\lambda=0.0471','\lambda=0.06','Location',[0.122, 0.2, 0.1, 0.1],'Box','off','FontSize',13);
legend('\lambda=0.03','\lambda=0.0434','\lambda=0.045','\lambda=0.0471','\lambda=0.06','Box','off');