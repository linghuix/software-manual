% ��ɢ����Ҷ��任������ N_t����������X_t����ֵ��Fs �����ź�
%   The inverse DFT (computed by IFFT) is given by
%                    N
%      x(n) = (1/N) sum  X(k)*exp( j*2*pi*(k-1)*(n-1)/N), 1 <= n <= N.
%                   k=1
function X_t = my_iDFT(freq)
    N_t = length(freq);
    % matlab��������Сֵ��1��ʼ��������Ҫ�仯һ�¡�
    W = exp(-j*2*pi/N_t);
    X = zeros(1,N_t);
    for k = 1:N_t
        for n = 1:N_t
            X(k) = X(k) + freq(n)*W^(-(k-1)*(n-1));
        end

        X(k) = X(k)/N_t;
    end
    X_t=real(X);%  ȡʵ��������ת��Ϊʵ����5+000j --> 5��
end