syms d1 d2 d4 		% ��ĺ��,�оߺ�ȣ��µװ�ĺ��,
d1 = 30e-3;
d4 = 30e-3;
% d2 = 15e-3

d3=275e-3;		% m
% d5=180e-3;
d5 = 280e-3;
% d6=203.56e-3;
d6 = 300e-3;
d7=240e-3;
G= 250*9.8;
Gi=400*9.8;
%material
E = 180e9;

%%%%%%%%%%%%%%%%%%%%%%%%L���У��
B = 430e-3;
A_L_up   = d1*B;		%BΪ L������򳤶�
A_L_down = d4*B;        %BΪ L����°����
M = d6*Gi;
Iz = B*d1^3/12;
disp('***************************************************');
%%%ǿ��У��
	%L�ϰ�
	rou_Fn = Gi/A_L_up;
	rou_bend = (M*d1/2) / Iz;
	rou_L = rou_Fn+rou_bend;
    disp(sprintf('ǿ��У��:L�ΰ��ϰ�ĺ�� %.0f mm',d1*1e3));
    disp(sprintf('ǿ��У��:L�ΰ��ϰ�������Ӧ�� %.2e',rou_L));
	%L�°�
    Iz_x = B*d4^3/12;
	rou_Ft = Gi/A_L_down;
	rou_bend = (M*d4/2)/Iz_x;
	rou_down = sqrt(rou_Ft^2+rou_bend^2);
    disp(sprintf('ǿ��У��:L�ΰ��°�ĺ�� %.0f mm',d4*1e3));
    disp(sprintf('ǿ��У��:L�ΰ��°�������Ӧ�� %.2e',rou_down));
    
    disp(sprintf('safty factor equals %.1f',400/160));
    
%%%�ն�У��
	theta = (M/(Iz*E)*d3)*180/pi;	%ƫת�Ƕ�
    theta = vpa(subs((M/(Iz*E)*d6)*180/pi,'d1',10e-3),5);
    disp(sprintf('�ն�У��:L�ΰ�ƫת�� %.2e',theta));
	disp(sprintf('��ĩ��λ�� %.2f mm',vpa(600*tan(theta/180*pi),6)))
	
%%%�ȶ����о�
%     lamba = pi*sqrt(E/rou_p)
%     theta = vpa(subs(-M/sqrt(E*Iz*Gi)*sin(sqrt(Gi/(E*Iz))*d3)*180/pi,'d1',15e-3),5)
disp(sprintf('�õ��ȶ��� %.2E N',pi^2*E*Iz/(2*d3)^2))


    %% 
%%%%%�н���������Ӧ��У��
    % d1 = 15e-3;         %��L�Ͱ���Ϊ15mm           
	B_clamp = 32.4e-3;  %�н���Ŀ��
	d = 12.4e-3;		%�ۿ�ֱ��
	h =12e-3;           %�н���ĸ߶�
    disp(sprintf('�н���ĸ߶�ȡ %.0f mm',h*1e3));
	Izz = (B_clamp-d)*h^3/12;
    M = 30;  %�н�������
	rou_bend = (M*h/2) / Izz;
    
    F = 500;
    rou = F/((B_clamp-d)*h);
    
    n = 2;      %��ȫϵ��
    
    disp(sprintf('Ӧ��У��:�н��������ӵ������Ӧ�� %.2e',2*sqrt(rou^2+4*rou_bend^2)));
	disp(sprintf('��ȫϵ��ȡ %.0f',n));
    vpa(n*rou_down,5);
	
