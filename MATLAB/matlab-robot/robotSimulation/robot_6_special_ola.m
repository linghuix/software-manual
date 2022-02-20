%% 验证
% 核心要义  
% RotX(th)是实现从A坐标系中的点旋转运算后，在A坐标系统的位置；
% 欧拉公式是AB坐标重合，B坐标系按自身坐标旋转后，B坐标到A中的坐标系的映射；

clear all

% syms theta_1 theta_2 theta_3 theta_4 theta_5 theta_6;
% syms a1 a2 a3 a4 a5;
% Pi = sym(pi);


base = [0 0 1 1]';
th1 = 0;
th2 = 0*pi/4;
th3 = 0*pi/3;
th4 = 0*pi/3;
th5 = 0;
th6 = 0;
a1= 10;
a2= 10;
a3= 60;
a4= 70;
Pi = pi;
f = @(q) plot3(q(1),q(2),q(3),'o','markersize',20,'userdata',1);
t =  @(q,num) text(q(1),q(2),q(3)+1,num2str(num))

T0_0 = RotZ(0);

figure(1)
for th6 = 0:0.1:pi/2;
    
    th2 = th6;
    th3 = th6;
    th4 = th6;
    th5 = th6;
 
        T1_0 = RotZ((th1));
        T11_1 = Trans(0,0,-a1)*RotY(Pi/2);
        T2_11 = RotZ((th2+pi/2));
        T22_2 = Trans(0,-a2,0)*RotY(Pi/2);
        T3_22 = RotZ((th3+Pi/2));
        T4_3 = RotZ(th4)*Trans(-a3,0,0);
        T5_4 = RotZ(th5)*Trans(-a4,0,0);
        T55_5 = RotX(-Pi/2);
        T6_55 = RotZ((th6+pi));


        % Tx_y means x->y

        T1_0 = (T1_0);
        T11_0 = (T1_0*T11_1)
        T2_0 = (T11_0*T2_11)
        T22_0 = (T2_0*T22_2)
        T3_0 = (T22_0*T3_22)
        T4_0 = (T3_0*T4_3)
        T5_0 = (T4_0*T5_4)
        T6_0 = (T5_0*T55_5*T6_55)


        q1 = T1_0^-1*base
        q11 = T11_0^-1*base
        q2 = T2_0^-1*base
        q22 = T22_0^-1*base
        q3 = T3_0^-1*base
        q4 = T4_0^-1*base
        q5 = T5_0^-1*base
        q6 = T6_0^-1*base

        
        hold off
        plotT(T0_0)
        f(base)
        plotT(T1_0);plotlink(T1_0,T11_0); plotT(T11_0);
        
        axis equal;
        view([1,1,1])       % 固定三维视图的方向
        
        plotT(T2_0);plotlink(T2_0,T22_0);plotT(T22_0);
        plotlink(T3_0,T4_0);plotT(T4_0);plotlink(T4_0,T5_0);plotT(T5_0)
        plotT(T6_0)
        hold on
        drawnow limitrate


end

%%
syms th1 th2 th3 th4 th5 th6;
syms a1 a2 a3 a4 a5;
Pi = sym(pi);

T1_0 = RotZ((th1));
T11_1 = Trans(0,0,-a1)*RotY(Pi/2);
T2_11 = RotZ((th2+pi/2));
T22_2 = Trans(0,-a2,0)*RotY(Pi/2);
T3_22 = RotZ((th3+Pi/2));
T4_3 = RotZ(th4)*Trans(-a3,0,0);
T5_4 = RotZ(th5)*Trans(-a4,0,0);
T55_5 = RotX(-Pi/2);
T6_55 = RotZ((th6+pi));


% Tx_y means x->y
T1_0 = simplify(T1_0);
T11_0 = simplify(T1_0*T11_1)
T2_0 = simplify(T11_0*T2_11)
T22_0 = simplify(T2_0*T22_2)
T3_0 = simplify(T22_0*T3_22)
T4_0 = simplify(T3_0*T4_3)
T5_0 = simplify(T4_0*T5_4)
T6_0 = simplify(T5_0*T55_5*T6_55)

%% subs(T2_0,symvar(T2_0),[1 2 3])
base = [0 0 0]';
th1 = 0;
th2 = 0;
th3 = 0;
th4 = 0;
th5 = 0;
th6 = 0;
a1= -10;
a2= -10;
a3= -10;
a4= -10;
a5= -10;

T1_0
T11_0
T2_0
T22_0
T3_0
T4_0
T5_0
T6_0

