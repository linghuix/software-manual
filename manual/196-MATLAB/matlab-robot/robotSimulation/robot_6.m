clear all

syms theta_1 theta_2 theta_3 theta_4 theta_5 theta_6
syms a1 a4 a5 a2

format = 2;

T1_0 = RotZ(theta_1)*Trans(a1,0,0);
T2_1 = RotZ(theta_2-pi/2)*RotX(-sym(pi)/2);
T3_2 = RotZ(theta_3-pi/2)*RotX(sym(pi)/2);
T4_3 = RotZ(theta_4)*Trans(a4,0,0);
T5_4 = RotZ(theta_5)*Trans(a5,0,0);
T6_5 = RotZ(theta_6)*RotX(sym(pi)/2);


T1_0 = T1_0

T2_0 = T2_1*T1_0

T3_0 = T3_2*T2_1*T1_0
T3_0 = T3_2*T2_0

T4_0 = T4_3*T3_0

T5_0 = T5_4*T4_0

T6_0 = T6_5*T5_0
%%
clear all

% syms theta_1 theta_2 theta_3 theta_4 theta_5 theta_6;
% syms a1 a2 a3 a4 a5;
% Pi = sym(pi);


theta_1 = 0;
theta_2 = 0;
theta_3 = 0;
theta_4 = 0;
theta_5 = 0;
theta_6 = 0;
a1= 10;
a2= 10;
a3= 10;
a4= 10;
a5= 10;
base = [0 0 0 1]';

f = @(q) plot3(q(1),q(2),q(3),'o','markersize',10,'userdata',1);
t =  @(q,num) text(q(1),q(2),q(3)+1,num2str(num))

T1_0 = RotZ(theta_1)*Trans(a1,0,0);
T2_1 = RotZ(theta_2-pi/2)*RotX(-pi/2);
T3_2 = RotZ(theta_3-pi/2)*RotX(pi/2);
T4_3 = RotZ(theta_4)*Trans(a4,0,0);
T5_4 = RotZ(theta_5)*Trans(a5,0,0);
T6_5 = RotZ(theta_6)*RotX(pi/2);


T1_0 = T1_0

T2_0 = T2_1*T1_0

T3_0 = T3_2*T2_1*T1_0
T3_0 = T3_2*T2_0

T4_0 = T4_3*T3_0

T5_0 = T5_4*T4_0

T6_0 = T6_5*T5_0



plotT(T1_0^-1);
hold on
f(base)
plotT(T2_0^-1)
plotT(T3_0^-1)
plotT(T4_0^-1)
plotT(T5_0^-1)
plotT(T6_0^-1)

% T1_0 = vpa(T1_0,format)
% 
% T2_0 = vpa(T2_1*T1_0,format)
% 
% T3_0 = vpa(T3_2*T2_1*T1_0,format);
% T3_0 = vpa(T3_2*T2_0,format)
% 
% T4_0 = vpa(T4_3*T3_0,format)
% 
% T5_0 = vpa(T5_4*T4_0,format)
% 
% T6_0 = vpa(T6_5*T5_0,format)

