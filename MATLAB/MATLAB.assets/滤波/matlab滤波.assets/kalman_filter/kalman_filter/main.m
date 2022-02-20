% �źŹ۲�
data= SignalBuilder('G',50,5,20);
plot(data,'*')
hold on
plot( 1:length(data),5*ones(1,length(data)),'black' )


% �������˲�
% ��֪
% ϵͳ����Ϊ������ϵͳ�ڲ���������Ϊ0

% ���� 1*N �ĳ���ֵ 5 
% �������۲⵽������data
% ϵͳ��������Ϊ0
% ������������������Ϊ20
% ϵͳ״̬��ʼֵΪ30
% ϵͳ�ڲ����Э�����ֵ 20
[data_filiter,P] = kalmanFilter( 5*ones(1,length(data)), data, 0, 0.00001, 30, 20 );

plot(data_filiter,'gp--');
plot(P,'r-');
legend('sensor output','ground value','filiter','P');
