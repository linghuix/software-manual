%% ��ͼ��֤DH��ģ��׼ȷ��
% ����Ҫ��  
% RotX(th)��ʵ�ִ�A����ϵ�еĵ���ת�������A����ϵͳ��λ�ã�
% ŷ����ʽ��AB�����غϣ�B����ϵ������������ת��B���굽A�е�����ϵ��ӳ�䣻

clear all

base = [0 0 1 1]';
th1 = 0;th2 = 0;th3 = 0;
th4 = 0;th5 = 0;th6 = 0;
a1= 10;a2= 10;a3= 60;a4= 70;a5= 10;
Pi = pi;

f = @(q) plot3(q(1),q(2),q(3),'o','markersize',20,'userdata',1);
t =  @(q,num) text(q(1),q(2),q(3)+1,num2str(num));

figure(5)

for th6 = 0:0.1:pi/2;
    
    th2 = th6;
    th3 = th6;
    th4 = th6;
    th5 = th6;
    
    
    T0_0 = RotZ(0);
    T1_0 = RotZ(th1)*Trans(0,0,-a1)*RotX(Pi/2);
    T2_1 = RotZ(th2+pi/2)*Trans(-a2,0,0)*RotX(Pi/2);
    T3_2 = RotZ(th3)*Trans(-a3,0,0);
    T4_3 = RotZ(th4)*Trans(-a4,0,0);
    T5_4 = RotZ(th5)*Trans(-a5,0,0)*RotX(Pi/2);
    T6_5 = RotZ(th6);


    % Tx_y means x->y
    T1_0 = (T1_0);
    T2_0 = (T1_0*T2_1);
    T3_0 = (T2_0*T3_2);
    T4_0 = (T3_0*T4_3);
    T5_0 = (T4_0*T5_4);
    T6_0 = (T5_0*T6_5);


    q1 = T1_0^-1*base;
    q2 = T2_0^-1*base;
    q3 = T3_0^-1*base;
    q4 = T4_0^-1*base;
    q5 = T5_0^-1*base;
    q6 = T6_0^-1*base;

    hold off

    f(base)             % ���Ƹ��ڵ�
    plotT(T0_0);plotlink(T0_0,T1_0);
    
    axis equal;
    view([1,1,1])       % �̶���ά��ͼ�ķ���
    
    plotT(T1_0);plotlink(T1_0,T2_0);plotT(T2_0);
    plotlink(T2_0,T3_0);plotT(T3_0);
    plotlink(T3_0,T4_0);plotT(T4_0);
    plotlink(T4_0,T5_0);plotT(T5_0);
    plotlink(T5_0,T6_0);plotT(T6_0);
    
    hold on
    
    drawnow limitrate   % ���ٻ�ͼ

end

%% ׼ȷ����֤��ʹ�÷��Ź����䣬���㡢����ת�ƾ���

syms th1 th2 th3 th4 th5 th6;
syms a1 a2 a3 a4 a5;
Pi = sym(pi);

T0_0 = RotZ(0);
T1_0 = RotZ(th1)*Trans(0,0,-a1)*RotX(Pi/2);
T2_1 = RotZ(th2+pi/2)*Trans(-a2,0,0)*RotX(Pi/2);
T3_2 = RotZ(th3)*Trans(-a3,0,0);
T4_3 = RotZ(th4)*Trans(-a4,0,0);
T5_4 = RotZ(th5)*Trans(-a5,0,0)*RotX(Pi/2);
T6_5 = RotZ(th6);

T1_0 = simplify(T1_0)
T2_1 = simplify(T2_1)
T3_2 = simplify(T3_2)
T4_3 = simplify(T4_3)
T5_4 = simplify(T5_4)
T6_5 = simplify(T6_5)


% Tx_y means x->y
T1_0 = simplify(T1_0);
T2_0 = simplify(T1_0*T2_1);
T3_0 = simplify(T2_0*T3_2);
T4_0 = simplify(T3_0*T4_3);
T5_0 = simplify(T4_0*T5_4);
T6_0 = simplify(T5_0*T6_5)
