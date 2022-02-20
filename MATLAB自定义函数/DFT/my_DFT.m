% ��ɢ����Ҷ�任������ N_t����������X_t����ֵ��Fs �����ź�
%                    N
%      X(k) =       sum  x(n)*exp(-j*2*pi*(k-1)*(n-1)/N), 1 <= k <= N.
%                   n=1
function freq = my_DFT(X_t)
    N_t = length(X_t);
    % matlab��������Сֵ��1��ʼ��������Ҫ�仯һ�¡�
    W = exp(-1j*2*pi/N_t);
    X = zeros(1,N_t);
    for k = 1:N_t
        for n = 1:N_t
            X(k) = X(k) + X_t(n)*W^((k-1)*(n-1));
        end
    end
    freq = X;
end
% Fs=1000;
% f1=50;
% f2=125;
% f3=135;
% n=0:1/Fs:1;
% xn=cos(2*pi*f1*n)+1.5*cos(2*pi*f2*n)+cos(2*pi*f3*n)+1.5*randn(size(n));
% 
% N=1024;Nsec=512;							%���ݵĳ��Ⱥ�FFT���õ����ݳ���
% Pxx1=fft(xn(1:512),Nsec); 
% Pxx2=my_DFT(Nsec,xn(1:512)); 
% yn=cos(2*pi*f1*n)