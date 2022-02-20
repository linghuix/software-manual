%% ����
Fs = 128;      %% ����Ƶ�ʣ���λHz
L = 1;       %% ����ʱ�䣬��λs
t = 0:1/Fs:L;
n = Fs*t+1;  %% ������ţ���������Ҫ��һ��n=length(y)
y = sin(10*pi*t)+3;
ezplot('sin(10*pi*t)',[0 L]);
hold on
stem(t,y,'.r');


%% fft�任
% NFFT = 2^nextpow2(length(n)) 
% % ȡ��С��L����С��2���ݡ�֮��������ȡֵ����ΪFFT�㷨Ҫ���źŵĳ���Ϊ2���ݣ���NFFT�����źų���ʱ��fft�������㲹�롣
% % ����ֱ�ӿ����
A = abs(fft(y));    %% Ƶ���ֵ���
stem(n,A);          %% Ƶ���ֵ��Ŵ�1��ʼ

figure
f = Fs/2*linspace(0, 1, length(n)/2+1);%%��������������Ƶ�ʷֱ���
A_f = 2*A(1:length(n)/2+1);
stem(f,A_f,'.r');

%% Ifft�任
figure
[yy] = ifft(A); %% ʱ���ֵ���
ezplot('sin(10*pi*t)',[0 L]);
hold on
plot(t,y,'--r',t,yy(1:length(t)),'g');

