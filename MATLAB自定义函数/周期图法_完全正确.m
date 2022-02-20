%% ʱ���ź�
Fs=1000;                        %����Ƶ��
f1=50;f2=125;f3=135;
N=1024;Nfft=N;n=0:N-1;t=n/Fs;   %���õ�ʱ������
xn=cos(2*pi*f1*t)+1.5*cos(2*pi*f2*t)+cos(2*pi*f3*t)+1.5*randn(size(n));
figure;
plot(t,xn);grid on;title('ʱ���ź� t����y ');
%% 
Pxx=(abs(fft(xn,Nfft))).^2/N;	%Fourier�����ƽ����ƽ��ֵ��δת��ΪdB
                                % f=(0:length(Pxx)-1)*Fs/length(Pxx);
t = 0:round(Nfft/2-1);          %������0��ʼ������
f = t*Fs/Nfft;                  %����Ƶ������
figure;
plot(f',10*log10(Pxx(t+1)));	%���ƹ��������ߣ�������ѹ����ʹ��20lg������ʹ��10lg
xlabel('Ƶ��/Hz');ylabel('���߹���');
title('����N=128');grid on;
std(Pxx)^2                      % ����׼ƫ��
%%
hold on 
[pxx,f] =  psd(xn,N,Fs,boxcar(N),0,'none') % ϵͳ�Դ�����ͼ��
plot(f,10*log10(pxx),'--y') 
ylabel('�������ܶȣ�dB')
pxx(1:512)'-10*log10(Pxx(t+1))