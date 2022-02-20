function[path,pheromone] = searchpath(PopNumber,x_grid,z_grid,pheromone,starty,starth,endy,endh,a,b,h)
% �ú���������Ⱥ�뷨��·���滮
% x_grid		input	���򻮷ָ���
% z_grid		input	���򻮷ָ���
% pherormone	input	��Ϣ��
% starty starth	input	��ʼ��
% path			output	�滮·��
% pheromone		output	��Ϣ��

% ��������		
ycMax = 1;		% ����������䶯����
hcMax = 1;		% �����������䶯����
decr = 0.9;		% ��Ϣ��˥������

% ѭ������·��
for ii = 1: PopNumber
	path(ii,1:2) = [starty,starth];	% ��¼·����ţ���ͬ�������
	NowPoint = [starty,starth];			% ��ǰ��������
	%% ������һ�������������Ӧ��ֵ 
	%������仯,�������߻�ͷ·
	for abscissa = 2: x_grid
       kk= 1;
	   %�Ӿ���Χ�ڱ仯
		for i = - ycMax:ycMax
			%�߶ȷ���仯������˵�Ǻ�����ȵķ���仯
			for j = - hcMax:hcMax
				NextPoint(kk,:) = [NowPoint(1)+i,NowPoint(2)+j];
				% �ж���һ�����Ƿ��������ڣ��������궼λ��[0 10]
				if (NextPoint(kk,1)<10/a)&&(NextPoint(kk,1)>0)&&(NextPoint(kk,2)<10/h)&&(NextPoint(kk,2)>0)
					%������������
					qfz(kk) = CacuQfz(NextPoint(kk,1),NextPoint(kk,2),NowPoint(1),NowPoint(2),endy,endh,abscissa,a,b,h,x_grid);
					%��õ���Ϣ������,�˴�NextPoint����Ϊ����
 
					qz(kk) = qfz(kk)*pheromone(abscissa,NextPoint(kk,1),NextPoint(kk,2));
					kk=kk+1;
				else
					qz(kk) = 0; 
					kk = kk+ 1;
				end
			end
        end

		%%ѡ����һ����
		%�Ӿ���Χ�ڵ���������ĸ��ʼ���
		sumq = qz./sum(qz);
		pick = rand ;
		%���ֻ��25(5*5)�����
		for i= 1:9
			pick= pick - sumq(i); 
			if pick <= 0 
				index = i;
				break;
			end
		end
		% ѡ����һ��
		oldpoint = NextPoint(index,:);
		%�ֲ�������Ϣ�أ���һ����Ϣ����һ��
        % oldpoint
		pheromone(abscissa+1,oldpoint(1),oldpoint(2)) = 0.5*pheromone(abscissa+1,oldpoint(1),oldpoint(2));
		%·������
		path(ii,abscissa*2-1:abscissa*2) = [oldpoint(1),oldpoint(2)];
		NowPoint= oldpoint;
	end
	% ���һ�����
	path(ii,(x_grid+1)*2-1:(x_grid+1)*2) = [endy,endh];
end
