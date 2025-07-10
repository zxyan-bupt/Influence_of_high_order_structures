clear all;
close all;
clc;

k1=20;
k01=3.5;
k11=0;
k21=0;
k31=0;

%网络构建
N=2000;
mmax=6;
long=zeros(1,mmax-1);
edge1=zeros(1,2);
edge2=zeros(1,3);
A=zeros(N,N);%A是总的邻接矩阵
p1=k1/(N-1-2*k01);
p2_01=2*k01/(N-1)/(N-2);
ces=round(p1*N*(N-1)/2);

A=zeros(N,N);

for i=1:(N-1)
    for j=(i+1):N
        x=rand();
        if x<=p1
            long(1)=long(1)+1;
            edge1(long(1),1)=i;
            edge1(long(1),2)=j;
            A(i,j)=1;
        end
    end
end

for i=1:(N-2)
    for j=(i+1):(N-1)
        for l=(j+1):N
            x=rand();
            if x<=p2_01
                long(2)=long(2)+1;
                edge2(long(2),1)=i;
                edge2(long(2),2)=j;
                edge2(long(2),3)=l;
                if A(i,j)==1
                    for i_reduce=1:long(1)
                        if (edge1(i_reduce,1)==i)&&(edge1(i_reduce,2)==j)
                            edge1(i_reduce,:)=[];
                            A(i,j)=0;
                            break;
                        end
                    end
                    long(1)=long(1)-1;
                end
                if A(i,l)==1
                    for i_reduce=1:long(1)
                        if (edge1(i_reduce,1)==i)&&(edge1(i_reduce,2)==l)
                            edge1(i_reduce,:)=[];
                            A(i,l)=0;
                            break;
                        end
                    end
                    long(1)=long(1)-1;
                end
                if A(j,l)==1
                    for i_reduce=1:long(1)
                        if (edge1(i_reduce,1)==j)&&(edge1(i_reduce,2)==l)
                            edge1(i_reduce,:)=[];
                            A(j,l)=0;
                            break;
                        end
                    end
                    long(1)=long(1)-1;
                end
            end
        end
    end
end
%构建结束

%计算联合度分布
k=zeros(1,N);
k_delta01=zeros(1,N);
for i=1:long(1)
    for j=1:2
        k(edge1(i,j))=k(edge1(i,j))+1;
    end
end
for i=1:long(2)
    for j=1:3
        k_delta01(edge2(i,j))=k_delta01(edge2(i,j))+1;
    end
end

k_max=max(k);
k_bar=mean(k);
k01_max=max(k_delta01);
k01_bar=mean(k_delta01);

P1=zeros(1,k_max+1);
for i=1:N
    P1(1,k(i)+1)=P1(1,k(i)+1)+1/N;
end
P01=zeros(1,k01_max+1);
Pjoint01=zeros(k_max+1,k01_max+1);
for i=1:N
    P01(1,k_delta01(i)+1)=P01(1,k_delta01(i)+1)+1/N;
    Pjoint01(k(i)+1,k_delta01(i)+1)=Pjoint01(k(i)+1,k_delta01(i)+1)+1/N;
end

fitting=poisspdf(0:k_max,k_bar);
fitting01=poisspdf(0:k01_max,k01_bar);

figure(1)
plot(0:k_max,P1,'ko',0:k_max,fitting,'k');

figure(2)
plot(0:k01_max,P01,'ko',0:k01_max,fitting01,'k');

ces1=sum(P1);
ces2=sum(sum(Pjoint01));

P_0=P1;

% save('N=2000_k1=20_k01=3_P1.mat', 'P_0');
save('N=2000_k1=20_k01=3_5_edge1_1.mat', 'edge1');
save('N=2000_k1=20_k01=3_5_edge2_1.mat', 'edge2');
save('N=2000_k1=20_k01=3_5_long_1.mat', 'long');
% % save('N=10000_k1=20_k01=6_A_1.mat', 'A');
% save('N=5000_k1=50_k01=15_Pjoint_1.mat', 'Pjoint01');