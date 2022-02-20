clc
clear


%�㷨���� 
PopNumber= 30; 	%��Ⱥ��ģ
BestFitness= [];%��Ѹ���

% % % % % % % % % % %һ���Ӧ0.1
%y���������
a = 0.1;
%x���������
b = 0.1;
%h���������
h = 0.01;
%������Χ[0 10]
x = 10;
y = 10;
z = 10;
% ���㻮�ָ���
x_grid = x/b;
y_grid = y/a;
z_grid = z/h;

%% ������ž��󣬱�����Ϣ
%��ʼ����Ϣ�� 
pheromone= ones(x_grid+1,y_grid+1,z_grid+1);
% ��ʼ���
starty =1;
% δ��һ��Ľ���һ��
starth = round(HeightData(starty*a,1*b)/h+0.5);
endy = 90;
endh = round(HeightData(endy*a,(x_grid+1)*b)/h+0.5);


 
%%��ʼ����·��
[path,pheromone] = searchpath(PopNumber,x_grid,z_grid,pheromone,starty,starth,endy,endh,a,b,h);
fitness= CacuFit(path,a,b,h);			%��Ӧ��ֵ����
[bestfitness,bestindex] = min(fitness);	%�����Ӧ��ֵ
bestpath = path(bestindex,:);			%���·��
BestFitness = [BestFitness;bestfitness];%��Ӧ��ֵ��¼

%%��Ϣ�ظ��� 
rou =0.2;
cfit = 100/bestfitness; 
for i = 2:x_grid
	pheromone(i,bestpath(i*2-1),bestpath(i*2)) = (1-rou)*pheromone(i,bestpath(i*2-1),bestpath(i*2))+rou*cfit;
end

%%ѭ��Ѱ������·�� 
for kk= 1:200
	%%·������
	[path,pheromone] = searchpath(PopNumber,x_grid,z_grid,pheromone,starty,starth,endy,endh,a,b,h);
		
	%%��Ӧ��ֵ����
	fitness = CacuFit(path,a,b,h);
	[newbestfitness,newbestindex] = min(fitness); 
	if newbestfitness < bestfitness
		bestfitness = newbestfitness;
		bestpath= path(newbestindex,:);
	end
	BestFitness= [BestFitness;bestfitness];
	
	%%������Ϣ�� 
	cfit = 100/bestfitness; 
	for i = 2:x_grid
		pheromone(i,bestpath(i*2-1),bestpath(i*2)) = (1-rou)*pheromone(i,bestpath(i*2-1),bestpath(i*2))+rou*cfit;
	end
end

figure
plot(1:kk+1,BestFitness);

figure
[X,Y] = meshgrid(0:0.1:11);
R = sqrt((X+5).^2 + (Y+5).^2);
Z = sin(R)./R + 0.28;
mesh(X,Y,Z)
hold on
x=[];
y=[];
z=[];
for i = 1:x_grid+1
	j = (i-1)*b;
	jj = (bestpath(i*2-1)-1)*a;
	jjj = (bestpath(i*2)-1)*h;
%     plot3(j,jj,jjj,'o');
    hold on
    x = [x j];
    y = [y jj];
    z = [z jjj];
end
plot3(x,y,z,'--');