 function [Y] = AF_foodconsistence(X)
%�����˹���ĵ�ǰλ����ʳ��Ũ�� 

%���룺
%X	������˹��㣬ÿ��Ϊһ���˹���

%�����
%Y	��������˹��㵱ǰλ�õ�ʳ��Ũ�ȣ�������ֵ��

fishnum = size(X,2);
for i = 1:fishnum
% 	Y(1,i) = X(i)*sin(10*pi*X(i))+2;
Y(1,i) = 1/(X(i)+2)*sin(50*pi*X(i))+2
end
