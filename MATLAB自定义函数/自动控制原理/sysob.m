function Co = sysob(A,B,C,D)
n = size(A,1);
Co = obsv(A,C);
r = rank(Co);

if(r==n)
    disp('�����ο���һ���Ծ���Ϊ���ݣ�ϵͳ��״̬��ȫ�ɹ�');
else
    disp('�����ο���һ���Ծ���Ϊ���ݣ�ϵͳ��״̬����ȫ�ɹ�');
end

end