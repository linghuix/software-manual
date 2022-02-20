
% ����غ��������� N_t����������X_t����ֵ��Fs �����ź�
function self = relax_self(X_t)
    N_t = length(X_t);
    % matlab��������Сֵ��1��ʼ��������Ҫ�仯һ�¡�
    Rxx = zeros(1,N_t);
    for r = 1:N_t
        for n = 1:N_t-r+1
            Rxx(r) = Rxx(r) + X_t(n)*X_t(n+r-1);
        end

        Rxx(r) = Rxx(r)/(N_t-r+1);
    end
    self = Rxx;
end