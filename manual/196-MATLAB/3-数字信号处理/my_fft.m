function my_fft( y , Fs )     %yΪ��ɢ������������ʱ��Ϊ����������ݣ�fsΪ����Ƶ��
% % fs = 10000;                 %����Ƶ��
% % 
% % t= [0:0.0001:0.2];
% % y= sin(50*(2*pi)*t);
% close all
% Y=fft(y);
% n =length(y);
% f = [0 : n/2]*fs/n;            %����Ƶ�ʱض�����ʵ��Ƶ�ʵĶ���
% pow = abs(Y(1:n/2+1));
% plot(f,pow,'-',f,pow,'o');
% %  axis([0,300,0,1000]);

% NFFT = 2^nextpow2(length(y));       % Ƶ��ͼ�ĵ���
NFFT = length(y);

A = fft(y,NFFT);
A_abs = abs(A);                     % Ƶ���ֵ
stem(1:NFFT,A_abs);                 % Ƶ���ֵ��Ŵ�1��ʼ

figure(2)

subplot 211
f = Fs*linspace(0, 1, NFFT);        %��������������Ƶ�ʷֱ���
stem(f,A_abs,'.r');
title('FFT(x)ֱ�Ӽ�����������ͼ')

subplot 212
f = Fs/2*linspace(0, 1, NFFT/2);    %��������������Ƶ�ʷֱ���
A_f = [A_abs(1)  2*A_abs(2:NFFT/2)];
stem(f,A_f/NFFT,'.r');
title('��ʵƵ�ף���ֵΪ��Ƶ�����Ҳ���Ӧ�ķ�ֵ')