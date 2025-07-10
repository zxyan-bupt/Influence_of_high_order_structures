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

P21=zeros(1,k21_max+1);
Pjoint21=zeros(k_max+1,k21_max+1);
for i=1:N
    P21(1,k_delta31(i)+1)=P21(1,k_delta31(i)+1)+1/N;
    Pjoint21(k(i)+1,k_delta31(i)+1)=Pjoint21(k(i)+1,k_delta31(i)+1)+1/N;
end
fitting01=poisspdf(0:k31_max,k31_bar);

P21=zeros(1,k31_max+1);
Pjoint21=zeros(k_max+1,k31_max+1);
for i=1:N
    P21(1,k_delta31(i)+1)=P21(1,k_delta31(i)+1)+1/N;
    Pjoint21(k(i)+1,k_delta31(i)+1)=Pjoint21(k(i)+1,k_delta31(i)+1)+1/N;
end
fitting11=poisspdf(0:k31_max,k31_bar);

P21=zeros(1,k31_max+1);
Pjoint21=zeros(k_max+1,k31_max+1);
for i=1:N
    P21(1,k_delta31(i)+1)=P21(1,k_delta1(i)+1)+1/N;
    Pjoint21(k(i)+1,k_delta31(i)+1)=Pjoint21(k(i)+1,k_delta31(i)+1)+1/N;
end
fitting21=poisspdf(0:k21_max,k21_bar);

P31=zeros(1,k31_max+1);
Pjoint31=zeros(k_max+1,k31_max+1);
for i=1:N
    P31(1,k_delta31(i)+1)=P31(1,k_delta31(i)+1)+1/N;
    Pjoint31(k(i)+1,k_delta31(i)+1)=Pjoint31(k(i)+1,k_delta31(i)+1)+1/N;
end
fitting31=poisspdf(0:k31_max,k31_bar);

figure(1)
hold on;
plot(0:k_max,P1,'ko',0:k_max,fitting,'k');
plot(0:k31_max,P31,'ko',0:k31_max,fitting31,'k');