%% ����,����ԭ�źźͲ�����ֵ
Fs = 1024;                  % ����Ƶ�ʣ���λHz
% L = 7.9921875;            % �������ʱ�䣬��λs
N = 2048                    % �����������Ŀ
L = (N-1)/Fs                % ʱ��γ���

t = 0:1/Fs:L;
% n = Fs*t+1;               % ������ţ���������Ҫ��һ��n=length(y)
y = 9*sin(10*pi*t)+50+20*sin(20*pi*t);
% ezplot('sin(10*pi*t)',[0 L]);
hold on
plot(t,y,'.-');         

%% fft�任
% % �㷨����˫�߸�Ϊ���ߣ���ֵҪ*2
% % �����кţ�תΪΪʵ�ʵĲ���Ƶ�ʵ㣬��������ɲ���ʱ�䳤�Ⱦ���������ܹ�����Ƶ���ɲ���ʱ��������
% % ȡ��С��L����С��2���ݡ�֮��������ȡֵ����ΪFFT�㷨Ҫ���źŵĳ���Ϊ2���ݣ���NFFT�����źų���ʱ��fft���������㲹��

NFFT = 2^nextpow2(length(t));       % Ƶ��ͼ�ĵ���

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
%% Ifft�任
% ע�⣬ifft���ֱ������A_abs�õ��Ľ���ᳬǰһ����λ���������һ�������

figure(1)
[yy] = ifft(A);                     % ʱ���ֵ���
plot(t,y,'-*',t,yy(1:length(t)),'r');
legend('original','ifft');

% ֱ��ͨ������Ҷ�任�޸ľ�ֵ
figure(2)
mean = 600;
B = A;
B(1) = mean*NFFT;                   % �޸ľ�ֵ��mean
[yy] = ifft(B);
plot(t,y,'--r',t,yy(1:length(t)),'g');



