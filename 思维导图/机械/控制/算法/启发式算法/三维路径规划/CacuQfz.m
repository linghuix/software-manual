function qfz = CacuQfz(Nexty,Nexth,Nowy,Nowh,endy,endh,abscissa,a,b,h,x_grid)
%%�ú������ڼ����������ֵ
% Nexty,Nexth	input	�¸�������
% Nowy,Nowh		input	��ǰ������
% endy,endh		input	�յ�����
% abscissa		input	������
% HeightData	input	��ͼ�߶�
% qfz			output	����ֵ

%����
K = 50;
P = 30;
Nexty = (Nexty-1)*a;
Nexth = (Nexth-1)*h;
Nowy = (Nowy-1)*a;
Nowh = (Nowh-1)*h;
endy = (endy-1)*a;
endh = (endh-1)*h;
abscissa = (abscissa-1)*b;
%%�ж��¸����Ƿ�ɴ� 
if HeightData(Nexty,abscissa) < Nexth
	%�ռ������λ��ˮ�ռ��У���ʾ�ɴﵽ
	S=1;
else
	S=0;
end

%%��������ֵ 
%����50/��������һ��ľ���+�ﵽĿ�ĵصľ��룩���붼��Ϊ1km
D = K/(sqrt(b^2+(Nowh-Nexth)^2+(Nexty-Nowy)^2)+sqrt(((x_grid+1-abscissa)*b)^2+(endh-Nexth)^2+(endy-Nexty)^2)); 
%����߶�
M = 1/abs(Nexth+1)/h;
%��������ֵ ,ʹ���ϵ��˶������� ����Ŀ�ĵء�ǰ��������߶�С������һ��
qfz = S*M*D;