
%% ʱ���ź�
Fs=1000;                        %����Ƶ��
f1=50;f2=125;f3=135;
N=5012;Nfft=N;n=0:N-1;t=n/Fs;   %���õ�ʱ������
xn=cos(2*pi*f1*t)+1.5*cos(2*pi*f2*t)+cos(2*pi*f3*t)+1.5*randn(size(n));
figure;
plot(t,xn);grid on;title('ʱ���ź� t����y ');
%% 
% �ú���������ǹ����׹�һ����Ľ�������㹫ʽ�л�����Fs������ΪdB/Hz��
% ����ͨ������ͼ�����Լ3dB
window= boxcar(length(xn));                     % ��������ѡ�����еĲ�������
[pxx,f]=periodogram(xn,window,length(xn),Fs);   % �����׹�һ������������������ȺͲ���ֵ������Ƶ�ʣ���ȡ����
plot(f,10*log10(pxx*Fs),'r') 
ylabel('�������ܶȣ�dB/Hz')
plot(f,pxx,'r') 