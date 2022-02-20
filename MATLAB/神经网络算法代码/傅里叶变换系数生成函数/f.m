function result = f(x, coff, len)
    % x���Ա���
    % coff, function
    % sine_off�������a(1)Ϊ�����ǰ�벿realΪcos(2*pi/le*i*x)����벿imagΪsin(2*pi/le*i*x)ϵ����
            %ע��ϵ����û�г��Բ��������������ǳ����˶���
    % len�����������ĸ�����
    % result ����һ��Ƶ����(coff)������ĺ���ֵ
    
    
    % mean����ֵ
    % cos_cof cos������ϵ��
    % sin_cof sin������ϵ��
    mean = coff(1)/len;                            %constant
    cos_cof = coff(2:(length(coff)+1)/2)/len;      %cos(2*pi/le*i*x) i from 1 to (le-1)/2
    sin_cof = coff((length(coff)+1)/2+1:end)/len;  %sin(2*pi/le*i*x) i from 1 to (le-1)/2
    
    y = 0;

    for index = 1:length(cos_cof)
        y = y + cos_cof(index)*cos(2*pi/len*index*x);
    end

    for index = 1:length(sin_cof)
        y = y + sin_cof(index)*sin(2*pi/len*index*x);
    end    
    length(sin_cof)
    result = mean + y;
end
