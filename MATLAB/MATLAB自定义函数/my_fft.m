function [f ,A_f] = my_fft(y,Fs,L)    
% Plot single-sided amplitude spectrum.
% A_fΪ���Ƶ�ʷ�ֵ��fΪ��Ӧ��Ƶ��

%ֻ��������ͬ����Ƶ�ʵ��ź�
%yΪ��ɢ������������ʱ��Ϊ����������ݣ�fsΪ����Ƶ��Sampling frequency
% L Length of signalʱ���ϵ��źų��ȣ��źŸ�������������

% L�ǲ������������ȡʱ�䳤���йأ���Ӱ��Ƶ�ʷֱ�����
% ����Ƶ��Fs��Ƶ���ϵ����䳤��[-Fs/2 ,Fs/2]�йأ���Ҫ��������Ȥ��Ƶ�Ρ�

T = 1/Fs;                       % Sample time                   
t = (0:L-1)*T;                  % Time vector
NFFT = 2^nextpow2(L);           %ȡ��С��L����С��2���ݡ�֮��������ȡֵ����ΪFFT�㷨Ҫ���źŵĳ���Ϊ2���ݣ���NFFT�����źų���ʱ��fft�������㲹�롣  
Y = fft(y,NFFT)/L;              % fft����ֱ�Ӽ���õ���X��k��������Ƶ�׷�ֵ��
f = (Fs/2)*linspace(0,1,NFFT/2+1);%��������������Ƶ�ʷֱ���
A_f = 2*abs(Y(1:NFFT/2+1));

% Plot single-sided amplitude spectrum.
%plot(f,2*abs(Y(1:NFFT/2+1)));                       
%title('Single-Sided Amplitude Spectrum of y(t)')
%xlabel('Frequency (Hz)')
%ylabel('|Y(f)|')




%{
 Sum of a 50 Hz sinusoid and a 120 Hz sinusoid
x = 0.7*sin(2*pi*50*t) + sin(2*pi*120*t); 
y = x + 2*randn(size(t));     % Sinusoids plus noise
subplot(2,1,1)
plot(Fs*t(1:50),x(1:50))
title('Sinusoids Signal')
xlabel('time (milliseconds)')
subplot(2,1,2)
plot(Fs*t(1:50),y(1:50))
title('Signal Corrupted with Zero-Mean Random Noise')
xlabel('time (milliseconds)')

NFFT = 2^nextpow2(L); %ȡ��С��L����С��2���ݡ�֮��������ȡֵ����ΪFFT�㷨Ҫ���źŵĳ���Ϊ2���ݣ���NFFT�����źų���ʱ��fft�������㲹�롣         
Y = fft(y,NFFT)/L;    %                                            (1)
f = Fs/2*linspace(0,1,NFFT/2+1);
% Plot single-sided amplitude spectrum.
figure
plot(f,2*abs(Y(1:NFFT/2+1)))       %                               (2)
title('Single-Sided Amplitude Spectrum of y(t)')
xlabel('Frequency (Hz)')
ylabel('|Y(f)|')
%}