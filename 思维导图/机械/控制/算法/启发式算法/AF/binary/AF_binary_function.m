clc
clear 
close all
tic
figure(1) ; 
hold on

%��������
	fishnum= 100;
	MAXGEN = 50;
	try_number = 100;
	%��֪����
	visual = 2.5 ;
	%ӵ��������
	delta =0.618;	
	%�ƶ�����
	step =0.3;	
%��ʼ����Ⱥ 
lb_ub = [-10,10,2;];
X = AF_init(fishnum,lb_ub);
LBUB=[];
for i= 1:size(lb_ub,1)
	LBUB= [LBUB;repmat(lb_ub(i,1:2),lb_ub(i,3),1)];
end
gen = 1 ;
%ÿ�������ŵĺ���ֵ
BestY= - 1 * ones(1,MAXGEN);	
BestX= - 1 * ones(2,MAXGEN);
%���ź���ֵ
besty = - 100;	
Y= AF_foodconsistence(X); 
while gen <= MAXGEN
	fprintf(1, '%d\n',gen) 
	for i = 1 :fishnum
		%��Ⱥ��Ϊ
		[Xi1,Yi1]=AF_swarm(X,i,visual,step,delta,try_number,LBUB,Y); 
		%׷β��Ϊ
		[Xi2,Yi2]=AF_follow(X,i,visual,step,delta,try_number,LBUB,Y); 
		if Yi1>Yi2
			X(:,i) = Xi1;
			Y(1,i) = Yi1;
		else
			X(:,i) = Xi2;
			Y(1,i) = Yi2;
		end
	end
	[Ymax, index] = max(Y); 
    
    % ÿһ������Ⱥ���Ÿ�����ƣ���ɫ�ɺڱ��
	figure(1);
	plot(X(1,index),X(2,index),'.', 'color',[gen/MAXGEN ,0,0]);
	%��¼���Ž�
	if Ymax>besty 
		besty = Ymax ; 
		bestx = X( :, index);
		BestY(gen) = Ymax;
		[BestX(:,gen)] = X(:,index);
	else
		BestY(gen) = BestY(gen - 1);
		
disp(['���Ž� X:',num2str(bestx','  %1.5f')]);
disp(['���Ž� Y:',num2str(besty,'%1.5f')]);
		BestX(:,gen) = BestX(:,gen - 1);
	end
	gen = gen+1 ;
    
%    ��¼���һ�ε������Ž����ڷ�λ
    if gen == MAXGEN
        plot(X(1),X(2),'.', 'color',[gen/MAXGEN ,0,0],'markerSize',20);
    end
end


% �ú�ɫ�Ĵ�Բ��Ŀ�ı�������ֵ��������
plot(bestx(1) ,bestx(2), 'ro', 'MarkerSize', 80);
xlabel('x')
ylabel('y')
title('��Ⱥ�㷨�������������������ƶ�')

% ������Ⱥ�㷨���������е���ʷ����ֵ�ı仯ͼ
figure
plot(1:MAXGEN,BestY);
xlabel('��������');
ylabel('��ʷ����ֵ'); 
title('��Ⱥ�㷨��������');
toc
