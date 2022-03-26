clc;
clear;
close all;

A=[0.3e-15 59.14 3 1;5.291 -6.130 -1 2;11.2 9 5 2;1 2 1 1];
b=[59.17;46.78;1;2];
C=[A b];
[m,n]=size(A);
x1=A\b;
x1

for i=1:n %i为待完成消元列数
 maxl=0;
    for j=i:m
        if(abs(A(j,i))>maxl)
            maxl=abs(A(j,i));
            a=j;%记录最大值位置，方便后面交换
        end
      
    end
      C([i,a],:)=C([a,i],:); %交换位置
        
        for k=i+1:m
            temp=C(k,i)/C(i,i);
            C(k,:)=temp*C(i,:)-C(k,:);
        %disp(C);
        end
end

%反代求解x
x2=zeros(1,m);
for d=m-1:-1:1
    x2(d)=C(d,n);
    for t=1:m-d
        x2(d)=x2(d)-C(d,n-t)*x2(m+1-t);
    end
    x2(d)=x2(d)/C(d,d);
end

x2
%disp(x);

[L,U,p]=lu(A);
L
U
