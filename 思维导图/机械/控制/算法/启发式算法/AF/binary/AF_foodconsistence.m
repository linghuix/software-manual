 function [Y] = AF_foodconsistence_2(X)
%�����˹���ĵ�ǰλ����ʳ��Ũ�� 

%���룺
%X	������˹��㣬ÿ��Ϊһ���˹���

%�����
%Y	��������˹��㵱ǰλ�õ�ʳ��Ũ�ȣ�������ֵ��

fishnum = size(X,2);
for i = 1:fishnum
	X1 = X(1,i);
	X2 = X(2,i);
	Y(1,i) = sin(X1)*sin(X2)/X1/X2;
end
