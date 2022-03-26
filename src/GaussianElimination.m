clc;
clear;
close all;

A=[0.3e-15 59.14 3 1;5.291 -6.130 -1 2;11.2 9 5 2;1 2 1 1];
b=[59.17;46.78;1;2];
C=[A b];
[m,n]=size(A);

for i=1:n %i为待完成消元列数
 maxl=0;
    for j=i:m
        if(abs(A(i,j))>maxl)
            maxl=abs(A(i,j));
            a=j;%记录最大值位置，方便后面交换
        end
        C([i,a],:)=C([a,i],:); %交换位置
     
        
        for k=i:m
            temp=C(k,i)/C(1,i);
            C(k,i)=temp*C(1,i)-C(k,i);
        end
        %disp(C);
    end
end

%反代求解x
x=zeros(1,m);
for d=m-1:-1:1
    x(d)=C(d,n);
    for t=1:m-d
        x(d)=x(d)-C(d,n-t)*x(m+1-t);
    end
    x(d)=x(d)/C(d,d);
end
disp(x);

[L,U,p]=lu(A);
disp(L);
disp(U);