%% 绘图验证DH建模的准确性
% 核心要义  
% RotX(th)是实现从A坐标系中的点旋转运算后，在A坐标系统的位置；
% 欧拉公式是AB坐标重合，B坐标系按自身坐标旋转后，B坐标到A中的坐标系的映射；

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

    f(base)             % 绘制根节点
    plotT(T0_0);plotlink(T0_0,T1_0);
    
    axis equal;
    view([1,1,1])       % 固定三维视图的方向
    
    plotT(T1_0);plotlink(T1_0,T2_0);plotT(T2_0);
    plotlink(T2_0,T3_0);plotT(T3_0);
    plotlink(T3_0,T4_0);plotT(T4_0);
    plotlink(T4_0,T5_0);plotT(T5_0);
    plotlink(T5_0,T6_0);plotT(T6_0);
    
    hold on
    
    drawnow limitrate   % 加速绘图

end

%% 准确性验证后，使用符号工具箱，计算、化简转移矩阵

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
