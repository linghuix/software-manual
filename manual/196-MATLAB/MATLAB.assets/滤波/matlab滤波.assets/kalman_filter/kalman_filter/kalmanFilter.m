%% kalman_filter.m 

function [X,P] = kalmanFilter(u,y,N,W,x0,P0) 

% u - �������
% y - �������۲⵽������
% N - ϵͳ��������
% W - ������������������
% x0 - ϵͳ״̬��ʼֵ
% P0 - ϵͳ�ڲ����Э�����ֵ


% ǰ�����
% ���������������˹����W
F = 1;C = 1;H = 0;

NN = length(u); 
K = zeros(1,NN); X = zeros(1,NN) ;P = zeros(1,NN); 

for i = 1:NN 
    % Ԥ��
    if(i==1)
        X(i) = F*x0 + H*u(i);
        P(i) = F*P0*F' + N;
        continue
    else 
        X(i) = F*X(i-1) + H*u(i);
        P(i) = F*P(i-1)*F' + N;
    end
    
    % K����ļ���
    K(i) = P(i)*C'*(C*P(i)*C'+W)^-1;
    
    % У��
    X(i) = X(i) + K(i)*(y(i) - C*X(i));
    P(i) = (1-K(i)*C)*P(i);
end
