function m = sine_coff(data,nn)
    % nn������ӳ���Ǻ���ϵ��������
        % length(data)Ϊż��ʱ��������ȡlength(data)/2+1
        % length(data)Ϊ����ʱ��������ȡlength(data)%2+1
    % data������Ҫ�������Ǻ���չ��ϵ�������ݼ�
    clc

%     x = 1:50;
%     q =[ 0.1839 0.2400 0.4173 0.0497]
%     data = (q(1)*cos(q(2).*x)+q(3)*cos(q(4).*x))';
%     nn = 26;


    le = length(data);
    con = fft(data);
    
%     plot(ifft(con),'-r')
%     hold on
    
%% ����Ҷ����չ��
    a = con;
    n = a(2:nn);
    % a(1)Ϊ������
    % ǰ�벿realΪcos(2*pi/le*i*x)
    % ��벿imagΪsin(2*pi/le*i*x)ϵ��
    m = [a(1);2*real(n);-2*imag(n)]; 
    % output nn*1
    
%     q=[];
%     for k = (0:le-1)
%         q = [q f(k,m,le)];
%     end
%     plot(q,'y')
end


    