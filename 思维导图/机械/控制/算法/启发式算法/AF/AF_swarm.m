 function [Xnext,Ynext] = AF_swarm(X,i,visual,step,delta,try_number,LBUB,lastY)  
% ��Ⱥ��Ϊ�����������λ�ÿ�£

% ����: 
% x	�����˹����λ�� 
% i	��ǰ�˹������� 
% visual	��֪��Χ
% step	����ƶ�����
% delta	ӵ����
% try_number	����Դ���
% LBUB	��������������
% lastY	�ϴεĸ��˹���λ�õ�ʳ��Ũ��

% ���:
% Xnext	Xi�˹������һ��λ��
% Ynext	Xi�˹������һ��λ�ŵ�ʳ��Ũ��

Xi = X(:,i);
%������Ⱥ����֮��ľ���
D = AF_distance(Xi,X);
%��Ұ�ڵĸ���
index = find(D>0 & D<visual); 
nf = length(index); 
if nf>0   
	for j = 1:size(X,1)
		Xc(j,1) = mean(X(j,index));
	end
	Yc= AF_foodconsistence(Xc);
	Yi = lastY(i); 
	%�����Ⱥ�ܶȱȽ�С
	if Yc/nf>delta*Yi
		Xnext = Xi+rand*step*(Xc-Xi)/norm(Xc-Xi);
		for i = 1:length(Xnext)
			if Xnext( i)>LBUB( i, 2)
				Xnext(i) = LBUB(i,2);
			end
			if Xnext(i)<LBUB(i,1)
				Xnext(i) = LBUB(i,1),
			end
		end
		Ynext= AF_foodconsistence(Xnext);
	else
	%�����Ⱥ�ܶȱȽϴ�����ʳ��Ϊ
		[Xnext,Ynext] = AF_prey(Xi,i,visual,step,try_number,LBUB,lastY);
	end
else
%�����Ұ��Χ��û�и��壬��ʳ��Ϊ
	[Xnext,Ynext]= AF_prey(Xi,i,visual,step,try_number,LBUB,lastY);
end









