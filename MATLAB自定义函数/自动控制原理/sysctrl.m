function [Co] = sysctrl(A,B,C,D)
Co = ctrb(A,B);
T = [C*Co D];
Ty = rank(T);
n = size(C,1);
r = rank(Co);
L = length(A);
if(n==Ty)
    disp('�����ο���һ���Ծ���Ϊ���ݣ�ϵͳ�����ȫ�ɿ�');
else
    disp('�����ο���һ���Ծ���Ϊ���ݣ�ϵͳ�������ȫ�ɿ�');
end

if(r==L)
    disp('ϵͳ��״̬��ȫ�ɿ�');
else
    disp('ϵͳ��״̬����ȫ�ɿ�');
end

end