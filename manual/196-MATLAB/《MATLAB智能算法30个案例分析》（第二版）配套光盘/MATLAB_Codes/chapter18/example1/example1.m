clc
clear all
close all
tic
figure(1);hold on
ezplot('x*sin(10*pi*x)+2',[-1,2]);
%% ��������
fishnum=50;    %����50ֻ�˹���
MAXGEN=50;     %����������
try_number=100;%�����̽����
visual=1;      %��֪����
delta=0.618;   %ӵ��������
step=0.1;      %����
%% ��ʼ����Ⱥ
lb_ub=[-1,2,1];
X=AF_init(fishnum,lb_ub);
LBUB=[];
for i=1:size(lb_ub,1)
    LBUB=[LBUB;repmat(lb_ub(i,1:2),lb_ub(i,3),1)];
end
gen=1;
BestY=-1*ones(1,MAXGEN);   %ÿ�������ŵĺ���ֵ
BestX=-1*ones(1,MAXGEN);   %ÿ�������ŵ��Ա���
besty=-100;                %���ź���ֵ
Y=AF_foodconsistence(X);
while gen<=MAXGEN
    fprintf(1,'%d\n',gen)
    for i=1:fishnum
        [Xi1,Yi1]=AF_swarm(X,i,visual,step,delta,try_number,LBUB,Y);     %��Ⱥ��Ϊ
        [Xi2,Yi2]=AF_follow(X,i,visual,step,delta,try_number,LBUB,Y);    %׷β��Ϊ
        if Yi1>Yi2
            X(:,i)=Xi1;
            Y(1,i)=Yi1;
        else
            X(:,i)=Xi2;
            Y(1,i)=Yi2;
        end
    end
    [Ymax,index]=max(Y);
    figure(1);
    plot(X(1,index),Ymax,'.','color',[gen/MAXGEN,0,0])
    if Ymax>besty
        besty=Ymax;
        bestx=X(:,index);
        BestY(gen)=Ymax;
        [BestX(:,gen)]=X(:,index);
    else
        BestY(gen)=BestY(gen-1);
        [BestX(:,gen)]=BestX(:,gen-1);
    end    
    gen=gen+1;
end
plot(bestx(1),besty,'ro','MarkerSize',100)
xlabel('x')
ylabel('y')
title('��Ⱥ�㷨�������������������ƶ�')
figure
plot(1:MAXGEN,BestY)
xlabel('��������')
ylabel('�Ż�ֵ')
title('��Ⱥ�㷨��������')
disp(['���Ž�X��',num2str(bestx,'%1.5f')])
disp(['���Ž�Y��',num2str(besty,'%1.5f')])
toc