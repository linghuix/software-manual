%%%%%%% ������ѧ���� P66,��3.4 %%%%%%%
L1 = Link('d', 0, 'a', 0, 'alpha',0,'modified');
L2 = Link('theta',0, 'a', 0, 'alpha',pi/2,'qlim',[-0.5 0],'modified');
L3 = Link('d', 1, 'a', 0, 'alpha',0,'modified');
M = [-20 20 -20 20 -20 20]/5;
bot = SerialLink([L1 L2 L3]);
bot.plot([0 0 0],'workspace',M);
bot.teach
%% 

%%%%%%% ������ѧ���� P67,��3.5 %%%%%%%
L1 = Link('d', 0, 'a', 0, 'alpha',0,'modified');
L2 = Link('d', 5, 'a', 0, 'alpha',pi/2,'modified');
L3 = Link('d', 0, 'a', 10, 'alpha',0,'modified');
M = [-20 20 -20 20 -20 20];
bot = SerialLink([L1 L2 L3]);
bot.plot([0 pi/2 0],'workspace',M);
bot.teach
%% 
%%%%%%% ������ѧ����  3R %%%%%%
% ����
% �˳�    l1  L2
% �Ƕ�    th1 th2 th3
% �����ﵽ��λ��   hopeth
syms l1 l2 th1 th2 th3 hopeth
l1 = 5;
l2 = 5;
hopeth=0;
% theta = [th1 th2 th3];
theta = [1.3429, -1.1151,   0]
L1 = Link('d', 0, 'a', 0, 'alpha',0,'modified');
L2 = Link('d', 0, 'a', l1, 'alpha',0,'modified');
L3 = Link('d', 0, 'a', l2, 'alpha',0,'modified');
% R1 = SerialLink([L1]);
% R2 = SerialLink([L1 L2]);
R3 = SerialLink([L1 L2 L3]);
R3.plot(theta);
clc
% T01 = R1.fkine( theta(1) )
% T02 = R2.fkine( theta(1:2) )

%%%%%%% �ܽ���������еĽ⣬Ҳ���ǵ���ָ�����λ�� %%%%%%%

% mikine(R3,[1 0 0 6;0 1 0 6;0 0 1 0;0 0 0 1],[1 1 1 0 0 0])
T01 = [rotz(th1) [0 0 0]';
         0        0 0 1];
T12 = [rotz(th2) [l1 0 0]';
         0        0 0 1]                
T23 = [rotz(th3) [l2 0 0]';
         0        0 0 1]

% ��Ч��T03 = R3.fkine( theta )     
T03 = simplify(T01*T12*T23)
A = solve('5*cos(th1 + th2) + 5*cos(th1)=6','5*sin(th1 + th2) + 5*sin(th1)=6','cos(th1 + th2 +th3)=cos(0)','sin(th1 + th2 + th3)=sin(0)')

[vpa(A.hopeth,6) vpa(A.th1,6) vpa(A.th2,6) vpa(A.th3,6)]

% % % % % %   

J0 = R3.jacob0(theta);%���������ϵ0���ٶ�
simplify(J0)
Jn = R3.jacobe(theta);%���������ϵ3���ٶ�
simplify(Jn)
% ���������ϵ3��jacobe����J3
% J3=[
%    [l1*sin(th2 + th3)+l2*sin(th3), l2*sin(th3), 0];
%    [l1*cos(th2 + th3)+l2*cos(th3), l2*cos(th3), 0];
%    [0, 0, 0];
%    [0, 0, 0];
%    [0, 0, 0];
%    [1, 1, 1]
%    ]
% 
% J0 = [T03(1:3,1:3) diag([0 0 0]);
%        diag([0 0 0]) T03(1:3,1:3)]*A
% ����仯��õ����������ϵ0��jacobe����

J0 = R2.jacobn(theta(1:2));
simplify(J0)
%% 

% % % % % �켣�滮
T = 0:0.056:1;
T1 = transl([0 4 0]);
T2 = transl([5 5 0]);
T = ctraj(T1,T2,length(T));
x = T(:,4,:);
y = size(x);
xx = [];
for i = 1:y(3)
    xx = [xx;x(:,:,i)'];
end
figure
plot(xx(:,1),xx(:,2),'o');
title('ĩ��ִ�����켣');
%һ��ʼ�ȼ��٣�������٣��ﵽ�쵽��Ŀ�����ȼ�����0
q = mikine(R3 , T,[1 1 1 0 0 0]);
figure
plot(R3 ,q)
% R3.teach
%% 

% % % % % �ٶ�f���򣬴�С����
tour = [];
theta = [10,20,30]*pi/180;
th = theta;                 %��¼�Ƕ�
J0 = R3.jacob0(theta);      %���������ϵ0���ٶ�
J0 = [J0(1:2,:);J0(6,:)];
v_hopespeed = [0 -0.2 0]';

for i = 1:50
v_c = (J0^-1)*v_hopespeed;
theta = theta + v_c'*0.5;
J0 = R3.jacob0(theta);      %���������ϵ0���ٶ�
J0 = [J0(1:2,:);J0(6,:)];
T= R3.fkine(theta);
x = T*[0 0 0]'; %��ȻT����ά��
x = x(1:2)';
tour = [tour ;x];
th = [th ;theta];
plot(R3,theta);
end
figure
plot(tour(:,1),tour(:,2));
title('ĩ��ִ�����켣')
figure
subplot(3,1,1)
plot(0:50,th(:,1)'*180/pi);title('�ؽ�1�Ƕȱ仯');
subplot(3,1,2)
plot(0:50,th(:,2)'*180/pi);title('�ؽ�2�Ƕȱ仯');
subplot(3,1,3)
plot(0:50,th(:,3)'*180/pi);title('�ؽ�3�Ƕȱ仯');