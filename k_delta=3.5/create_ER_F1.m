clear all;
close all;
clc;

%计算阈值与平均超边密度Ddh的关系

k1=20;
k01=0;
k11=3.5;
k21=0;
k31=0;

%网络构建
N=2000;
mmax=3;
long=zeros(1,mmax-1);
edge1=zeros(1,2);
edge2=zeros(1,3);
A=zeros(N,N);%A是总的邻接矩阵
p1=(k1-2/3*k11)/(N-1-4/3*k11);
p2_11=2*k11/(N-1)/(N-2);
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
%构建两条连边
for i=1:(N-2)
    for j=(i+1):(N-1)
        for l=(j+1):N
            x=rand();
            if x<=p2_11
                long(2)=long(2)+1;
                edge2(long(2),1)=i;
                edge2(long(2),2)=j;
                edge2(long(2),3)=l;
                if (A(i,j)+A(i,l)+A(j,l))==0%三角形中没有一阶边
                    plus_list=randperm(3,1);
                    if plus_list==1
                        long(1)=long(1)+1;
                        edge1(long(1),1)=i;
                        edge1(long(1),2)=j;
                        A(i,j)=1;
                    elseif plus_list==2
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
                elseif (A(i,j)+A(i,l)+A(j,l))==2%三角形中有两条一阶边
                    if A(i,j)==0
                        x=rand();
                        if x<0.5
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
                    elseif A(i,l)==1
                        x=rand();
                        if x<0.5
                            for i_reduce=1:long(1)
                                if (edge1(i_reduce,1)==i)&&(edge1(i_reduce,2)==j)
                                    edge1(i_reduce,:)=[];
                                    A(i,j)=0;
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
                    else
                        x=rand();
                        if x<0.5
                            for i_reduce=1:long(1)
                                if (edge1(i_reduce,1)==i)&&(edge1(i_reduce,2)==j)
                                    edge1(i_reduce,:)=[];
                                    A(i,j)=0;
                                    break;
                                end
                            end
                        else
                            for i_reduce=1:long(1)
                                if (edge1(i_reduce,1)==i)&&(edge1(i_reduce,2)==l)
                                    edge1(i_reduce,:)=[];
                                    A(i,l)=0;
                                    break;
                                end
                            end
                        end
                    end
                    long(1)=long(1)-1;
                elseif (A(i,j)+A(i,l)+A(j,l))==3%三角形中有三条一阶边
                    x=rand();
                    if x<(1/3)
                        for i_reduce=1:long(1)
                            if (edge1(i_reduce,1)==i)&&(edge1(i_reduce,2)==l)
                                edge1(i_reduce,:)=[];
                                A(i,l)=0;
                                break;
                            end
                        end
                        for i_reduce=1:long(1)
                            if (edge1(i_reduce,1)==j)&&(edge1(i_reduce,2)==l)
                                edge1(i_reduce,:)=[];
                                A(j,l)=0;
                                break;
                            end
                        end
                    elseif x>(2/3)
                        for i_reduce=1:long(1)
                            if (edge1(i_reduce,1)==i)&&(edge1(i_reduce,2)==j)
                                edge1(i_reduce,:)=[];
                                A(i,j)=0;
                                break;
                            end
                        end
                        for i_reduce=1:long(1)
                            if (edge1(i_reduce,1)==j)&&(edge1(i_reduce,2)==l)
                                edge1(i_reduce,:)=[];
                                A(j,l)=0;
                                break;
                            end
                        end
                    else
                        for i_reduce=1:long(1)
                            if (edge1(i_reduce,1)==i)&&(edge1(i_reduce,2)==j)
                                edge1(i_reduce,:)=[];
                                A(i,j)=0;
                                break;
                            end
                        end
                        for i_reduce=1:long(1)
                            if (edge1(i_reduce,1)==i)&&(edge1(i_reduce,2)==l)
                                edge1(i_reduce,:)=[];
                                A(i,l)=0;
                                break;
                            end
                        end
                    end
                    long(1)=long(1)-2;
                end
            end
        end
    end
end


%构建结束

%计算联合度分布
k=zeros(1,N);
k_delta11=zeros(1,N);
for i=1:long(1)
    for j=1:2
        k(edge1(i,j))=k(edge1(i,j))+1;
    end
end
for i=1:long(2)
    for j=1:3
        k_delta11(edge2(i,j))=k_delta11(edge2(i,j))+1;
    end
end

k_max=max(k);
k_bar=mean(k);
k11_bar=mean(k_delta11);
k11_max=max(k_delta11);

P1=zeros(1,k_max+1);
for i=1:N
    P1(1,k(i)+1)=P1(1,k(i)+1)+1/N;
end
P11=zeros(1,k11_max+1);
Pjoint11=zeros(k_max+1,k11_max+1);
for i=1:N
    P11(1,k_delta11(i)+1)=P11(1,k_delta11(i)+1)+1/N;
    Pjoint11(k(i)+1,k_delta11(i)+1)=Pjoint11(k(i)+1,k_delta11(i)+1)+1/N;
end
fitting=poisspdf(0:k_max,k_bar);
fitting11=poisspdf(0:k11_max,k11_bar);

figure(1)
plot(0:k_max,P1,'ko',0:k_max,fitting,'k');

figure(2)
plot(0:k11_max,P11,'ko',0:k11_max,fitting11,'k');

ces1=sum(P1);
ces2=sum(sum(Pjoint11));

P_1=P1;

% save('N=2000_k1=20_k11=3_P1.mat', 'P_1');
save('N=2000_k1=20_k11=3_5_edge1_1.mat', 'edge1');
save('N=2000_k1=20_k11=3_5_edge2_1.mat', 'edge2');
save('N=2000_k1=20_k11=3_5_long_1.mat', 'long');
% % save('N=10000_k1=100_k11=30_A_1.mat', 'A');
% save('N=2000_k1=20_k11=6_Pjoint_1.mat', 'Pjoint11');