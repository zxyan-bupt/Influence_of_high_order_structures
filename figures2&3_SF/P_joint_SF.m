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

P1=zeros(1,k_max+1);
for i=1:N
    P1(1,k(i)+1)=P1(1,k(i)+1)+1/N;
end
fitting=poisspdf(0:k_max,k_bar);

P01=zeros(1,k01_max+1);
Pjoint01=zeros(k_max+1,k01_max+1);
for i=1:N
    P01(1,k_delta01(i)+1)=P01(1,k_delta01(i)+1)+1/N;
    Pjoint01(k(i)+1,k_delta01(i)+1)=Pjoint01(k(i)+1,k_delta01(i)+1)+1/N;
end
fitting01=poisspdf(0:k01_max,k01_bar);

P11=zeros(1,k11_max+1);
Pjoint11=zeros(k_max+1,k11_max+1);
for i=1:N
    P11(1,k_delta11(i)+1)=P11(1,k_delta11(i)+1)+1/N;
    Pjoint11(k(i)+1,k_delta11(i)+1)=Pjoint11(k(i)+1,k_delta11(i)+1)+1/N;
end
fitting11=poisspdf(0:k11_max,k11_bar);

P21=zeros(1,k21_max+1);
Pjoint21=zeros(k_max+1,k21_max+1);
for i=1:N
    P21(1,k_delta21(i)+1)=P21(1,k_delta21(i)+1)+1/N;
    Pjoint21(k(i)+1,k_delta21(i)+1)=Pjoint21(k(i)+1,k_delta21(i)+1)+1/N;
end
fitting21=poisspdf(0:k21_max,k21_bar);

P31=zeros(1,k31_max+1);
Pjoint31=zeros(k_max+1,k31_max+1);
for i=1:N
    P31(1,k_delta31(i)+1)=P31(1,k_delta31(i)+1)+1/N;
    Pjoint31(k(i)+1,k_delta31(i)+1)=Pjoint31(k(i)+1,k_delta31(i)+1)+1/N;
end
fitting31=poisspdf(0:k31_max,k31_bar);

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

fit=polyfit(8:33,F0(8:33),1);
% fit=polyfit(10:34,F1(10:34),1);
% fit=polyfit(8:33,F2(8:33),1);
% fit=polyfit(5:33,F3(5:33),1);
% fit=polyfit(8:33,F0(8:33),1);
% fit=polyfit(10:34,F1(10:34),1);
% fit=polyfit(8:33,F2(8:33),1);
fit=polyfit(5:33,F3(5:33),1);


fit_F=polyval(fit,0:k_max);

A=fit(1);
B=fit(2);

kbar=mean(k);
k2bar=mean(k.*k);
k3bar=mean(k.*k.*k);
lambda_delta_c=kbar*kbar*k3bar/k2bar/k2bar/(A*k2bar+B*kbar);

figure(1)
hold on;
plot(0:k31_max,fitting31,'r',0:k_max,P1,'ko',0:k31_max,P31,'ro' );
box on;
title('(a) Type-3 network');
axis([0 inf 0 0.25]);
xlabel('k or k_{\Delta}'), ylabel('P(k) or P(k_{\Delta})')
legend('k','k_{\Delta}','Location','northeast');

figure(2)
box on;
axis([0 inf 0 inf]);
imagesc(0:k_max,0:k31_max,Pjoint31);
title('0 first-order edges in a triangle');
annotation('textbox', [0.02, 0.9, 0.1, 0.1], 'String', '(a)', 'FontName', 'Cambria Math', 'EdgeColor', 'none', 'BackgroundColor', 'none', 'FontSize', 15);
xlabel('k'), ylabel('k_{\Delta}')
set(gca, 'YDir', 'normal'); % 反转 y 轴方向
colormap('cool'); % 使用 'hot' 颜色映射
colorbar;
c=colorbar;
% c.Label.String = 'P(k,k_{\Delta})'; % 设置颜色条标题
% c.Label.FontSize = 12;    % 设置字体大小
% c.Label.Color = 'black';  % 设置字体颜色
% c.Label.Position = [0.5, 1.05, 0]; % 将注释放在颜色条上方
% % c.Label.HorizontalAlignment = 'center'; % 水平居中
cPos = c.Position;% 获取 colorbar 的位置
text(43, 9.5, 'P(k,k_{\Delta})', 'HorizontalAlignment', 'center', 'FontSize', 12);% 在 colorbar 上方手动添加注释

save('k_max_3.txt', 'k_max','-ascii');
save('k31_max.txt', 'k31_max','-ascii');
save('fitting31.txt', 'fitting31','-ascii');
save('P1_3.txt', 'P1','-ascii');
save('P31.txt', 'P31','-ascii');
save('Pjoint31.txt', 'Pjoint31','-ascii');