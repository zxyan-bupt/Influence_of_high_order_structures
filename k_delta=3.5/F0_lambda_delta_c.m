clear all;
close all;
clc;

k1=20;
k01=3.5;
k11=0;
k21=0;
k31=0;

N=2000;
mmax=3;
i_net_number=50;%平均的网络数量
kbar_2=zeros(1,i_net_number);
lambda_delta_c=zeros(1,i_net_number);
lambda_delta_c_bar=0;
i_net=0;

while i_net<i_net_number
    %网络构建
    long=zeros(1,mmax-1);
    edge1=zeros(1,2);
    edge2=zeros(1,3);
    A=zeros(N,N);%A是总的邻接矩阵
    m_shiji=k1/(2-4*k01/N);%实际的m值
    p2_01=2*k01/(N-1)/(N-2);
    
    A=zeros(N,N);
    
    A(1,2)=1;
    A(1,3)=1;
    A(2,3)=1;
    A(2,1)=1;
    A(3,1)=1;
    A(3,2)=1;
    
    for i=4:N
        %每一步构建的m必须是整数
        x=rand();
        if x<m_shiji-floor(m_shiji)
            m=floor(m_shiji)+1;
        else
            m=floor(m_shiji);
        end
        
        ksum=sum(A(:));
        kj=sum(A,2);
        for j=1:(i-1)
            p(j)=kj(j)/ksum;
        end
        for j=i:N
            p(j)=0;
        end
        ces=sum(p);
        x=randsample(1:N,m,true,p);
        Nt(i)=1;
        for j=1:m
            long(1)=long(1)+1;
            edge1(long(1),1)=x(j);
            edge1(long(1),2)=i;
            A(i,x(j))=1;
            A(x(j),i)=1;
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
    
    P1=zeros(1,k_max+1);
    for i=1:N
        P1(1,k(i)+1)=P1(1,k(i)+1)+1/N;
    end
    
    kbar_2_ces=mean(k_delta01)+mean(k_delta11)+mean(k_delta21)+mean(k_delta31);
    
    if abs(kbar_2_ces-k01-k11-k21-k31)<(0.03*(k01+k11+k21+k31))
        i_net=i_net+1;
        kbar_2(1,i_net)=kbar_2_ces;
        %计算理论阈值
        kbar=mean(k);
        k2bar=mean(k.*k);
        k3bar=mean(k.*k.*k);
        lambda_delta_fenmu=0;
        for i_k=1:k_max
            lambda_delta_fenmu=lambda_delta_fenmu+P1(i_k+1)*i_k*( F0(i_k)+F1(i_k)+F2(i_k)+F3(i_k) );
        end
        lambda_delta_c(1,i_net)=k3bar*kbar*kbar/k2bar/k2bar/lambda_delta_fenmu;
        lambda_delta_c_bar=lambda_delta_c_bar+lambda_delta_c(1,i_net)/i_net_number;
    end
end

save('F0_k_delta=3_5_lambda_delta_c.txt', 'lambda_delta_c','-ascii');