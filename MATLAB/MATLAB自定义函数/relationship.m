% ����غ��������� X_t����ֵ��Y_t����ֵ��Fs �����ź�
function rela = relationship(X_t,Y_t)
    N_t = length(X_t);
    % matlab��������Сֵ��1��ʼ��������Ҫ�仯һ�¡�
    Rxy = zeros(1,N_t);
    for r = 1:N_t
        for n = 1:N_t-r+1
            Rxy(r) = Rxy(r) + X_t(n)*Y_t(n+r-1);
        end

        Rxy(r) = Rxy(r)/(N_t-r+1);
    end
    rela = Rxy;
end