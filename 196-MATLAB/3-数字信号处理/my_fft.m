function my_fft( y , fs )     %yΪ��ɢ������������ʱ��Ϊ����������ݣ�fsΪ����Ƶ��
% fs = 10000;                 %����Ƶ��
% 
% t= [0:0.0001:0.2];
% y= sin(50*(2*pi)*t);
% close all
Y=fft(y);
n =length(y);
f = [0 : n/2]*fs/n;            %����Ƶ�ʱض�����ʵ��Ƶ�ʵĶ���
pow = abs(Y(1:n/2+1));
plot(f,pow,'-',f,pow,'o');
%  axis([0,300,0,1000]);