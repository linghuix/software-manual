%%�Ŵ��㷨  һԪ���������Ž�
% 
% * ���Ŵ��㷨���һԪ����  sin(10*pi*x)/x ,[1,2] ����Сֵ

clc
clear all
close all
%%
 
% * ��������ͼ
figure(1);
hold on
ib=1;ub=2;   %�����Ա�����Χ[1,2]
ezplot('sin(10*pi*x)/x',[ib,ub]);%������������
xlabel('�Ա���/X')
ylabel('����ֵ/Y')

%%
%�����Ŵ��㷨����
nind=40;%��Ⱥ��С
maxgen=20;%����Ŵ�����
preci=20;%���峤��--�����õ�������ֵ�ľ����й�
ggap=0.95;%����--ָ������������Ⱥ������
px=0.7;%�������
pm=0.01;% �������
trace=zeros(2,maxgen);%���ڴ���ÿһ�������Ÿ���
fieldd=[preci;ib;ub;1;0;1;1];%������������
chrom=crtbp(nind,preci);%����������ɢ�����Ⱥ
%%
%%�Ż�
gen=0;% ��Ⱥ�Ŵ�����
x=bs2rv(chrom,fieldd);%��ʼ��Ⱥ������ת��Ϊʮ����
objv=sin(10*pi*x)./x;%����Ŀ�꺯��ֵ
while gen<maxgen
    fitv=ranking(objv);%������Ӧ��ֵ
    selch=select('sus',chrom,fitv,ggap);%ѡ��
    selch=recombin('xovsp',selch,px);%����
    selch=mut(selch,pm);%����
    x=bs2rv(selch,fieldd);%�Ӵ������ʮ����ת��
    objvsel=sin(10*pi*x)./x;%�Ӵ������Ŀ�꺯��ֵ
    [chrom,objv]=reins(chrom,selch,1,1,objv,objvsel);%���Ӵ�������뵽�������õ��µ���Ⱥ
    x=bs2rv(chrom,fieldd);
    gen=gen+1;
    [y,i]=min(objv);%��ȡÿһ�������Ž⼰����ţ�yΪ���Ž⣬iΪ��������
    trace(1,gen)=x(i);%����ÿһ���������Ա���ֵ
    trace(2,gen)=y;%����ÿһ��������Ŀ�꺯��ֵ
end
plot(trace(1,:),trace(2,:),'ro');%����ÿһ�������Ž�
grid on;
plot(x,objv,'b*');%�������һ������Ⱥ�ֲ�
hold off
%%
% *������ͼ��
figure(2)
plot(1:maxgen,trace(2,:));
grid on;
xlabel('�Ŵ�����')
ylabel('��ı仯')
title('��������')
besty=trace(2,end);
bestx=trace(1,end);
fprintf(['���Ž⣺\n x=',num2str(bestx),'\n y=',num2str(besty),'\n'])





