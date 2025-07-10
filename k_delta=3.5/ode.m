clear all;
close all;
clc;

%ode解节点平均场方程组

load('N=2000_k1=20_k11=3_5_edge1_1.mat');
load('N=2000_k1=20_k11=3_5_edge2_1.mat');
load('N=2000_k1=20_k11=3_5_long_1.mat');

N=2000;
mmax=3;

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
k_delta_max=max(k_delta01+k_delta11+k_delta21+k_delta31);

kbar=mean(k);
k2bar=mean(k.*k);
kbar01=mean(k_delta01);
kbar11=mean(k_delta11);
kbar21=mean(k_delta21);
kbar31=mean(k_delta31);

ces_lambda_c=kbar/k2bar;

for i=1:N
    Rg(i)=k(i)/k_max+( k_delta01(i)+k_delta11(i)+k_delta21(i)+k_delta31(i) )/k_delta_max;
end
[Rg_max,i_max]=max(Rg);

% lambda_delta=3/(kbar01+kbar11+kbar21+kbar31);
lambda_delta=0.31;

y0_h = ones(N,1); % 初始条件向量
y0_l = 0.0001*ones(N,1); % 初始条件向量
% y0 = zeros(N,1);
% y0(i_max)=1;
tspan = [0 80000]; % 时间跨度从0到x

i_lambda1=0;
for lambda1_k=0.04771:0.00001:0.04773
    lambda1=lambda1_k;
    i_lambda1=i_lambda1+1;
    % 设置初始条件和时间跨度
    
    lambda1_plot(i_lambda1)=lambda1_k;
    
    odeFun = @(t, y) myODEsystem(t, y, edge1, edge2, long, lambda1, lambda_delta);
    
    % 调用求解器
    [t, y] = ode45(odeFun, tspan, y0_h);
    size_t=size(t);
    rho_plot_h(i_lambda1)=mean(y(size_t(1),:));
end
%0.04585:0.00001:0.046
i_lambda1=0;
for lambda1_k=0.04771:0.00001:0.04773
    lambda1=lambda1_k;
    i_lambda1=i_lambda1+1;
    % 设置初始条件和时间跨度
    
    lambda1_plot(i_lambda1)=lambda1_k;
    
    odeFun = @(t, y) myODEsystem(t, y, edge1, edge2, long, lambda1, lambda_delta);
    
    % 调用求解器
    [t, y] = ode45(odeFun, tspan, y0_l);
    size_t=size(t);
    rho_plot_l(i_lambda1)=mean(y(size_t(1),:));
end

figure(1)
hold on;
plot(lambda1_plot, rho_plot_h,'k');
plot(lambda1_plot, rho_plot_l,'r');

% 定义微分方程组
function dydt = myODEsystem(t, y, edge1, edge2, long, lambda1, lambda_delta)
% 示例方程组
N=2000;
dydt = zeros(N,1); % 初始化导数向量
for i=1:N
    dydt(i) = -y(i);% 第i个方程的导数
end
for i=1:long(1)
    dydt(edge1(i,1)) = dydt(edge1(i,1))+(1-y(edge1(i,1)))*lambda1*y(edge1(i,2));
    dydt(edge1(i,2)) = dydt(edge1(i,2))+(1-y(edge1(i,2)))*lambda1*y(edge1(i,1));
end
for i=1:long(2)
    dydt(edge2(i,1)) = dydt(edge2(i,1))+(1-y(edge2(i,1)))*lambda_delta*y(edge2(i,2))*y(edge2(i,3));
    dydt(edge2(i,2)) = dydt(edge2(i,2))+(1-y(edge2(i,2)))*lambda_delta*y(edge2(i,1))*y(edge2(i,3));
    dydt(edge2(i,3)) = dydt(edge2(i,3))+(1-y(edge2(i,3)))*lambda_delta*y(edge2(i,1))*y(edge2(i,2));
end
end


%节点数2000，一阶平均度为20，二阶平均度为6的ER网络出现双稳态时的λΔ
%F3 0.1558 0.04593-0.04596
%F2 0.1634 0.04739-0.04741
%F1 0.1785 0.04742-0.04744
%F0 0.1983 0.04736-0.04739

%节点数2000，一阶平均度为20，二阶平均度为5的ER网络出现双稳态时的λΔ
%F3 0.1825 0.04642-0.04644
%F2 0.1955 0.04664-0.04666
%F1 0.2130 0.04783-0.04785
%F0 0.2320 0.04791-0.04793

%节点数2000，一阶平均度为20，二阶平均度为4的ER网络出现双稳态时的λΔ
%F3 0.2281 0.04659-0.04661
%F2 0.2479 0.04691-0.04693
%F1 0.2700 0.04758-0.04760
%F0 0.2983 0.04733-0.04735

%节点数2000，一阶平均度为20，二阶平均度为3.5的ER网络出现双稳态时的λΔ
%F3 0.267 0.04668-0.04670
%F2 0.284 0.04708-0.04710
%F1 0.310 0.04771-0.04773
%F0 0.336 0.04740-0.04742

%节点数2000，一阶平均度为20，二阶平均度为3的ER网络出现双稳态时的λΔ
%F3 0.3015 0.04697-0.04699
%F2 0.3294 0.04722-0.04724
%F1 0.3585 0.04761-0.04763
%F0 0.3940 0.04734-0.04736