%���� A�� HҲ�򵥵�ȡ1��
%��������û�е�,B��u(k) �� 0
%x��Pֻ��Ҫ����ֵ��ÿ�ε����������ֵ��K�ò��Ÿ���ֵ��Q��R��ֵ�Ժ���֮��ĵ�����Ҳ���Ը�
%x��P�ĳ�ֵ�ǿ���������

%{
while(�¹۲�ֵ)
{
    K = P / (P + R);
    x = x + K * (�¹۲�ֵ - x);
    P = (1 - K) �� P + Q;
}

	���԰���������
	data =random('Normal',0,5,1,100); kalmanFilter(data,1e-6,4e-4,-60,1); 
	i = 1:length(data); 
	plot(i,result,'r',i,data,'b');
 
 
%}


% kalman_filter.m 
function X = kalmanFilter(data,Q,R,x0,P0) 
% data���ݣ�Q����������Э���R����������x0��ֵ��P0���Э���
%

N = length(data); 
K = zeros(N,1); 
X = zeros(N,1); 
P = zeros(N,1); 
X(1) = x0; 
P(1) = P0; 
for i = 2:N 
	K(i) = P(i-1) / (P(i-1) + R); 
	X(i) = X(i-1) + K(i) * (data(i) - X(i-1)); 
	P(i) = P(i-1) - K(i) * P(i-1) + Q; 
end


