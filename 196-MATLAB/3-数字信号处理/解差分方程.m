% ����filter���ַ��� y(n)-ay(n-1)=x(n)
a = 0.5; 
ys = 0;%��ʼ����y(-1)=1
xn = [1,1, zeros(1,30)];
B = 1;A=[1 -a];
xi = filtic(B,A,ys);% ��ʼ������Ӧ�ĵ�Ч��������x(0)
yn = filter(B,A,xn,xi);

n = 0:length(yn)-1;
stem(n, yn,'.');
title('(a)');
xlabel('n');ylabel('y(n)')