function fitness = CacuFit(path,a,b,h)
%%���������ڼ���·����Ӧ��ֵ 
% path		input	·��
% fitness	input	·����Ӧ��ֵ

[n,m] = size(path); 
% ����ÿһֻ����
for i = 1:n
	fitness(i) = 0; 
	for j = 2: m/2
		%��Ӧ��ֵΪ���ȼӸ߶ȣ�j*2-1Ϊ y��j*2Ϊ h
		fitness(i) = fitness(i) + sqrt((1*b)^2+((path(i,j*2-1)-path(i,(j-1)*2-1))*a)^2+((path(i,j*2)-path(i,(j-1)*2))*h)^2) + abs(path(i,j*2)*h);
	end
end