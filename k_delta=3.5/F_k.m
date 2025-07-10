clear all;
close all;
clc;

load('N=2000_k1=20_k31=3_5_edge1_1.mat');
load('N=2000_k1=20_k31=3_5_edge2_1.mat');
load('N=2000_k1=20_k31=3_5_long_1.mat');

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

k_bar=mean(k);
P1=zeros(1,k_max+1);
for i=1:N
    P1(1,k(i)+1)=P1(1,k(i)+1)+1/N;
end

fit=polyfit(8:32,F0(8:32),1);
% fit=polyfit(10:32,F1(10:32),1);
% fit=polyfit(8:35,F2(8:35),1);
% fit=polyfit(8:32,F3(8:32),1);

A=fit(1);
B=fit(2);

fit_F=polyval(fit,0:k_max);

kbar=mean(k);
k2bar=mean(k.*k);
k3bar=mean(k.*k.*k);
lambda_delta_c=kbar*kbar*k3bar/k2bar/k2bar/(A*k2bar+B*kbar);
lambda_delta_fenmu=0;
for i_k=1:k_max
    lambda_delta_fenmu=lambda_delta_fenmu+P1(i_k+1)*i_k*( F0(i_k)+F1(i_k)+F2(i_k)+F3(i_k) );
end
lambda_delta_c=k3bar*kbar*kbar/k2bar/k2bar/lambda_delta_fenmu;

% figure(1)
% plot(1:k_max,F0,'bo',0:k_max,fit_F,'b');
% % plot(1:k_max,F3,'bo');
% % legend('数值计算','拟合','Location','northwest', 'FontName', 'Times New Roman');
% set(gca, 'FontName', 'Cambria Math'); % 设置字体
% xlabel('k', 'FontAngle', 'italic');
% ylabel('F_{\Delta}(k)', 'FontAngle', 'italic');