function [fitness,X] = FitnessFunction(binary,lenchrom)
% ��Ӧ�Ⱥ��� 
% ����:
% binary	�����Ʊ���   
% lenchrom	�������Ķ�����λ�� 
% ���:   
% fitness 	��Ӧ��    
% X			ʮ�����������Ż�������

sizepop= size(binary,1) ; 
fitness= zeros(1,sizepop);   
num = size(lenchrom,2);   
X = zeros(sizepop,num); 
for i = 1:sizepop
	%ʹ��Ŀ�꺯��������Ӧ��
	[fitness(i),X(i,:)] = Objfunction(binary(i,:),lenchrom);
end
