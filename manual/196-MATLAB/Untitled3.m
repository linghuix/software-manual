
%t = 0:0.00001:0.1;
%f = sin(2*pi*60*t)+cos(2*pi*25*t)+cos(2*pi*30*t);
%plot(t,f,'r');
fy = 'sin(2*pi*60*t) + cos(2*pi*25*t) +cos(2*pi*30*t)';
% ��һ���������������ԭ�źź������źź���fy���ַ����ĸ�ʽ����
fs0 = 10000;
tp  = 0.1;
t   = -tp:1/fs0:tp;  %001��������
k1  = 0:999;
k2  = -999:-1; 
m1  = length(k1);
m2  = length(k2);
f   = [fs0*k2/m2,fs0*k1/m1];%f 1999
w   = [-2*pi*k2/m2,2*pi*k1/m1];%w = 2*pi*K/N,����������ͷβ����
fx1 = sin(2*pi*60*t)+cos(2*pi*25*t)+cos(2*pi*30*t)
FX1 = fx1*exp(-1i*((1:length(fx1))./10)'*w); %��10����õ��˲�0��Ч��
%��ԭ�źŵ���ɢʱ�丵��Ҷ�任
figure(1);
%h����ԭ�źŲ���
subplot(1,2,1);plot(t,fx1,'r');
title('ԭ�ź�');
xlabel('ʱ��t/s');
axis([min(t),max(t),min(fx1),max(fx1)]);       %��ԭ�źŷ���Ƶ��
subplot(1,2,2);
plot(f,abs(FX1),'r');
title('ԭ�źŷ���Ƶ��');
xlabel('Ƶ��f');
axis([-1000,1000,0,max(abs(FX1)+5)]);          %��ԭ�źŷ���Ƶ��

    %��ʵ����������һ�ľͿ����õ�������źŵ��ˡ�����ľ�����Թ��ܶ��֣����µ�����Ŀǰ�Գ���Ψһһ�������õġ�

% ���źŽ��в���
fs   = 150;   % ����Ƶ��
Ts   = 1/fs;
ws   = Ts*w;
ts   = Ts*(1:length(t));
fst  = sin(2*pi*60*ts)+cos(2*pi*25*ts)+cos(2*pi*30*ts);
Fs1 = fst*exp(-1i*((1:length(fst))./10)'*ws);
length(fst)
figure(2);
subplot(1,2,1);plot(ts,fst,'r');
title('�����ź�');
xlabel('ʱ��t/s');
axis([min(ts),0.5,min(fst),max(fst)]);       %��ԭ�źŷ���Ƶ��
subplot(1,2,2);
plot(f,abs(Fs1),'r');
title('����Ƶ��');
xlabel('Ƶ��f');

t1 = 1:length(t);
%����ĳ���ź���ô����Ϊ�˺Ͳ����źŵ���ƥ�䣬�������Ϊ�õ��Ǿ����������
%��h(t)
ht = Ts*sin(2*pi*t1/Ts)./(t1*pi);
Ft = conv(ht,fst);
n = 1: max([length(fst)+length(ht)-1,length(fst),length(ht)]);
figure(3);
plot(n,Ft,'b');
axis([200,450,min(Ft),max(Ft)]);

    %��Ȼ�Լ������Ļ����кܶ෽����һ�¾ͽ���һ�ַ�����
% 
% y = -0.1:0.001:0.1;
% n = -0.1/T:0.1/T;
% M=ones(length(n),1)*y-n'*T*ones(1,length(y));
% fs = fg*sinc(frequency*M);