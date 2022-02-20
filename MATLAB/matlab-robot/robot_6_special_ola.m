%% ��֤
% ����Ҫ��  
% RotX(th)��ʵ�ִ�A����ϵ�еĵ���ת�������A����ϵͳ��λ�ã�
% ŷ����ʽ��AB�����غϣ�B����ϵ������������ת��B���굽A�е�����ϵ��ӳ�䣻

clear all

% syms theta_1 theta_2 theta_3 theta_4 theta_5 theta_6;
% syms a1 a2 a3 a4 a5;
% Pi = sym(pi);


base = [0 0 0 1]';
th1 = 0;
th2 = 0*pi/4;
th3 = 0*pi/3;

a0= 10;
a1= 10;

Pi = pi;
f = @(q) plot3(q(1),q(2),q(3),'o','markersize',20,'userdata',1);
t =  @(q,num) text(q(1),q(2),q(3)+1,num2str(num))

T0_0 = RotZ(0);

figure(1)
for th1 = 0:0.1:0.1;
    
    th2 = 0;
    th3 = 0;
    
    T1_0 = RotZ((th1))*Trans(-a0,0,0);%1->0
    T2_1 = RotZ((th2))*Trans(-a1,0,0);
    T3_2 = RotZ(th3);


    % Tx_y means x->y
    T1_0 = (T1_0)
    T2_0 = (T1_0*T2_1)
    T3_0 = (T2_0*T3_2)

    q1 = T1_0^-1*base   % 0->�ؽ�1����ϵ
    q2 = T2_0^-1*base   % 0->�ؽ�2����ϵ
    q3 = T3_0^-1*base   % 0->�ؽ�3����ϵ


    hold off
    plotT(T0_0)
    f(base)
    plotT(T1_0);plotlink(T1_0,T2_0); plotT(T2_0);

    axis equal;
    view([1,1,1])       % �̶���ά��ͼ�ķ���

    plotT(T2_0);plotlink(T2_0,T3_0);plotT(T3_0);
    hold on
        drawnow limitrate


end

%%
syms th1 th2 th3;
syms a0 a1;
Pi = sym(pi);

T1_0 = RotZ((th1))*Trans(-a0,0,0)
T2_1 = RotZ((th2))*Trans(-a1,0,0)
T3_2 = RotZ(th3)


% Tx_y means x->y
T1_0 = simplify(T1_0)
T2_0 = simplify(T1_0*T2_1)
T3_0 = simplify(T2_0*T3_2)

%% subs(T2_0,symvar(T2_0),[1 2 3])
base = [0 0 0]';
th1 = 0;
th2 = 0;
th3 = 0;
a0= 10;
a0= 10;


T1_0 = RotZ((th1))*Trans(-a0,0,0);
T2_1 = RotZ((th2))*Trans(-a0,0,0);
T3_2 = RotZ(th3);


% Tx_y means x->y
T1_0 = (T1_0)
T2_0 = (T2_1*T1_0)
T3_0 = (T3_2*T2_0)



