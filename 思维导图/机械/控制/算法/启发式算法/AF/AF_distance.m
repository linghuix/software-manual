 function D = AF_distance(Xi,X)
%�����i�������������λ��

%����:
%Xi ��i����ĵ�ǰλ�� 
%X	������ĵ�ǰλ�D

%���:
%D ��i������������ľ��� 

col = size(X,2);
D = zeros(1,col); 
for j = 1:col
	D(j) = norm(Xi-X(:,j)); 
end 