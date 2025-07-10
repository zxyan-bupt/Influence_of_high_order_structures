clear all;
close all;
clc;

%计算阈值与平均超边密度Ddh的关系

k1=20;
k01=0;
k11=0;
k21=3.5;
k31=0;

%网络构建
N=2000;
mmax=3;
long=zeros(1,mmax-1);
edge1=zeros(1,2);
edge2=zeros(1,3);
A=zeros(N,N);%A是总的邻接矩阵
p1=(k1-4/3*k21)/(N-1-2/3*k21);
p2_21=2*k21/(N-1)/(N-2);
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
            if x<=p2_21
                long(2)=long(2)+1;
                edge2(long(2),1)=i;
                edge2(long(2),2)=j;
                edge2(long(2),3)=l;
                if (A(i,j)+A(i,l)+A(j,l))==0%三角形中没有一阶边
                    plus_list=randperm(3,2);
                    for i_plus=1:2
                        if plus_list(i_plus)==1
                            long(1)=long(1)+1;
                            edge1(long(1),1)=i;
                            edge1(long(1),2)=j;
                            A(i,j)=1;
                        elseif plus_list(i_plus)==2
                            long(1)=long(1)+1;
                            edge1(long(1),1)=i;
                            edge1(long(1),2)=l;
                            A(i,l)=1;
                        else
                            long(1)=long(1)+1;
                            edge1(long(1),1)=j;
                            edge1(long(1),2)=l;
                            A(j,l)=1;
                        end
                    end
                elseif (A(i,j)+A(i,l)+A(j,l))==1%三角形中有一条一阶边
                    if A(i,j)==1
                        x=rand();
                        if x<0.5
                            long(1)=long(1)+1;
                            edge1(long(1),1)=i;
                            edge1(long(1),2)=l;
                            A(i,l)=1;
                        else
                            long(1)=long(1)+1;
                            edge1(long(1),1)=j;
                            edge1(long(1),2)=l;
                            A(j,l)=1;
                        end
                    elseif A(i,l)==1
                        x=rand();
                        if x<0.5
                            long(1)=long(1)+1;
                            edge1(long(1),1)=i;
                            edge1(long(1),2)=j;
                            A(i,j)=1;
                        else
                            long(1)=long(1)+1;
                            edge1(long(1),1)=j;
                            edge1(long(1),2)=l;
                            A(j,l)=1;
                        end
                    else
                        x=rand();
                        if x<0.5
                            long(1)=long(1)+1;
                            edge1(long(1),1)=i;
                            edge1(long(1),2)=j;
                            A(i,j)=1;
                        else
                            long(1)=long(1)+1;
                            edge1(long(1),1)=i;
                            edge1(long(1),2)=l;
                            A(i,l)=1;
                        end
                    end
                elseif (A(i,j)+A(i,l)+A(j,l))==3%三角形中有三条一阶边
                    x=rand();
                    if x<(1/3)
                        for i_reduce=1:long(1)
                            if (edge1(i_reduce,1)==i)&&(edge1(i_reduce,2)==j)
                                edge1(i_reduce,:)=[];
                                A(i,j)=0;
                                break;
                            end
                        end
                    elseif x>(2/3)
                        for i_reduce=1:long(1)
                            if (edge1(i_reduce,1)==i)&&(edge1(i_reduce,2)==l)
                                edge1(i_reduce,:)=[];
                                A(i,l)=0;
                                break;
                            end
                        end
                    else
                        for i_reduce=1:long(1)
                            if (edge1(i_reduce,1)==j)&&(edge1(i_reduce,2)==l)
                                edge1(i_reduce,:)=[];
                                A(j,l)=0;
                                break;
                            end
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
k_delta21=zeros(1,N);
for i=1:long(1)
    for j=1:2
        k(edge1(i,j))=k(edge1(i,j))+1;
    end
end
for i=1:long(2)
    for j=1:3
        k_delta21(edge2(i,j))=k_delta21(edge2(i,j))+1;
    end
end

k_max=max(k);
k_bar=mean(k);
k21_bar=mean(k_delta21);
k21_max=max(k_delta21);

P1=zeros(1,k_max+1);
for i=1:N
    P1(1,k(i)+1)=P1(1,k(i)+1)+1/N;
end
P21=zeros(1,k21_max+1);
Pjoint21=zeros(k_max+1,k21_max+1);
for i=1:N
    P21(1,k_delta21(i)+1)=P21(1,k_delta21(i)+1)+1/N;
    Pjoint21(k(i)+1,k_delta21(i)+1)=Pjoint21(k(i)+1,k_delta21(i)+1)+1/N;
end
fitting=poisspdf(0:k_max,k_bar);
fitting21=poisspdf(0:k21_max,k21_bar);

figure(1)
% plot(0:k_max,P1,'ko');
plot(0:k_max,P1,'ko',0:k_max,fitting,'k');

figure(2)
plot(0:k21_max,P21,'ko',0:k21_max,fitting21,'k');

ces1=sum(P1);
ces2=sum(sum(Pjoint21));

P_2=P1;

% save('N=2000_k1=20_k21=3_P1.mat', 'P_2');
save('N=2000_k1=20_k21=3_5_edge1_1.mat', 'edge1');
save('N=2000_k1=20_k21=3_5_edge2_1.mat', 'edge2');
save('N=2000_k1=20_k21=3_5_long_1.mat', 'long');
% % save('N=10000_k1=100_k21=30_A_1.mat', 'A');
% save('N=2000_k1=20_k21=3_Pjoint_1.mat', 'Pjoint21');