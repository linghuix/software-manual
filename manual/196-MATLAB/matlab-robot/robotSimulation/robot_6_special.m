clear all

% syms theta_1 theta_2 theta_3 theta_4 theta_5 theta_6;
% syms a1 a2 a3 a4 a5;
% Pi = sym(pi);


base = [0 0 0 1]';
theta_1 = 0;
theta_2 = 0*pi/4;
theta_3 = 0*pi/3;
theta_4 = 0*pi/3;
theta_5 = 0;
theta_6 = 0;
a1= 10;
a2= 10;
a3= 60;
a4= 70;
Pi = pi;


for theta_3 = 0:-0.5:-0.5;
    for theta_1 = 0:-0.1:-pi/4;
    
drawnow limitrate    
f = @(q) plot3(q(1),q(2),q(3),'o','markersize',10,'userdata',1);
t =  @(q,num) text(q(1),q(2),q(3)+1,num2str(num))

T1_0 = RotZ(-(theta_1));
T11_1 = Trans(-a1,0,0)*RotY(-Pi/2);
T2_11 = RotZ(-(theta_2+pi/2));
T22_2 = Trans(0,a2,0)*RotY(-Pi/2);
T3_22 = RotZ(-(theta_3+Pi/2));
T4_3 = RotZ(-theta_4)*Trans(a3,0,0);
T5_4 = RotZ(-theta_5)*Trans(a4,0,0);
T55_5 = RotX(Pi/2);
T6_55 = RotZ(-(theta_6+pi));


% 
T1_0 = (T1_0)
T11_0 = (T11_1*T1_0)
T2_0 = (T2_11*T11_0)
T22_0 = (T22_2*T2_0)
T3_0 = (T3_22*T22_0)
T4_0 = (T4_3*T3_0)
T5_0 = (T5_4*T4_0)
T6_0 = (T6_55*T55_5*T5_0)


% q1 = T1_0*base
% q11 = T11_0*base
% q2 = T2_0*base
% q22 = T22_0*base
% q3 = T3_0*base
% q4 = T4_0*base
% q5 = T5_0*base
% q6 = T6_0*base

% plotT(T1_0^-1);
plotT2(T1_0^-1,T11_0^-1)
hold on
f(base)
plotT(T11_0^-1)
% plotT(T2_0^-1)
% plotT(T22_0^-1)
plotT2(T2_0^-1,T22_0^-1)
% plotT(T3_0^-1)
plotT2(T3_0^-1,T4_0^-1)
plotT2(T4_0^-1,T5_0^-1)
% plotT(T4_0^-1)
% plotT(T5_0^-1)
plotT(T6_0^-1)
% hold off
axis([-10 80 -10 80 -150 20])
    end
end

%%
syms theta_1 theta_2 theta_3 theta_4 theta_5 theta_6;
syms a1 a2 a3 a4 a5;
Pi = sym(pi);

T1_0 = RotZ(theta_1);
T11_1 = Trans(0,0,-a1)*RotY(Pi/2);
T2_11 = RotZ(theta_2+Pi/2);
T22_2 = Trans(0,-a2,0)*RotY(Pi/2);
T3_22 = RotZ(theta_3+Pi/2);
T4_3 = Trans(-a3,0,0)*RotZ(theta_4);
T5_4 = Trans(-a4,0,0)*RotZ(theta_5);
T6_5 = RotX(-Pi/2)*RotZ(theta_6-Pi/2);

T1_0 = simplify(T1_0)
T11_0 = simplify(T11_1*T1_0)
T2_0 = simplify(T2_11*T11_0)
T22_0 = simplify(T22_2*T2_0)
T3_0 = simplify(T3_22*T22_0)
T4_0 = simplify(T4_3*T3_0)
T5_0 = simplify(T5_4*T4_0)
T6_0 = simplify(T6_5*T5_0)
%% subs(T2_0,symvar(T2_0),[1 2 3])
base = [0 0 0]';
theta_1 = 0;
theta_2 = 0;
theta_3 = 0;
theta_4 = 0;
theta_5 = 0;
theta_6 = 0;
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

