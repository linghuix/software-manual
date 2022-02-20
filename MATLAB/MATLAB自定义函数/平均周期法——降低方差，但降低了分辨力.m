%ƽ������ͼ���������ܶȺ���
% ʹ���ص�0% �ķ�ʽ����ƽ�����ڷ�
clear;
Fs=1024;
f1=50;
f2=125;
f3=135;
n=0:1/Fs:1;
xn=cos(2*pi*f1*n)+1.5*cos(2*pi*f2*n)+cos(2*pi*f3*n)+1.5*randn(size(n));

N=1024;Nsec=256;                                    %���ݵĳ��Ⱥ�FFT���õ����ݳ���
Pxx1=abs(fft(xn(1:Nsec),Nsec)).^2/Nsec;             %��һ�ι�����
Pxx2=abs(fft(xn((Nsec+1):Nsec*2),Nsec)).^2/Nsec;      %�ڶ��ι�����
Pxx3=abs(fft(xn((Nsec*2+1):Nsec*3),Nsec)).^2/Nsec;	%�����ι�����
Pxx4=abs(fft(xn((Nsec*3+1):Nsec*4),Nsec)).^2/Nsec;	%���Ķι�����
Pxx=(Pxx1+Pxx2+Pxx3+Pxx4)/4;						%Fourier�����ƽ����ƽ��ֵ����ת��ΪdB
f=(0:length(Pxx)-1)*Fs/length(Pxx);                 %����Ƶ������
hold on
% plot(f(1:Nsec/2),10*log10(Pxx(1:Nsec/2)));		%���ƹ���������
plot(f(1:Nsec/2),Pxx(1:Nsec/2));
xlabel('Ƶ��/Hz');ylabel('���߹�����');
title('N = 4X256 �ֱ��� Fs/256=4Hz');grid on;
(std(Pxx))^2
%% ʹ���ص�50% �ķ�ʽ����ƽ�����ڷ�
N=1024;Nsec=256;                                    %���ݵĳ��Ⱥ�FFT���õ����ݳ���
Pxx1=abs(fft(xn(1:2*Nsec),2*Nsec)).^2/Nsec; 		%��һ�ι�����
Pxx2=abs(fft(xn((Nsec+1):Nsec*3),2*Nsec)).^2/Nsec;	%�ڶ��ι�����
Pxx3=abs(fft(xn((Nsec*2+1):Nsec*4),2*Nsec)).^2/Nsec;	%�����ι�����
Pxx=(Pxx1+Pxx2+Pxx3)/3;                             %Fourier�����ƽ����ƽ��ֵ����ת��ΪdB
f=(0:length(Pxx)-1)*Fs/length(Pxx);                 %����Ƶ������
hold on
% plot(f(1:Nsec/2),10*log10(Pxx(1:Nsec/2)));		%���ƹ���������
plot(f(1:Nsec),Pxx(1:Nsec));
xlabel('Ƶ��/Hz');ylabel('���߹�����');
title('N = 3X512 �ֱ��� Fs/512=2Hz');grid on;
(std(Pxx))^2
