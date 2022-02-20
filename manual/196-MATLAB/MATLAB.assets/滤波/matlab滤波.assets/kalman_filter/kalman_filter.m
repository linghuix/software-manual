function [x, V, VV, loglik] = kalman_filter(y, A, C, Q, R, init_x, init_V, varargin)
% Kalman filter.����
% [x, V, VV, loglik] = kalman_filter(y, A, C, Q, R, init_x, init_V, ...)
%
% INPUTS:
% y(:,t)   - the observation at time t              ��ʱ��t�Ĺ۲�
% A - the system matrix                       A ϵͳ����         
% C - the observation matrix                  C �۲����
% Q - the system covariance                   Q  ϵͳЭ����
% R - the observation covariance              R  �۲�Э���� 
% init_x - the initial state (column) vector      init_x   ��ʼ״̬���У�����
% init_V - the initial state covariance             init_V    ��ʼ״̬Э����
%
% OPTIONAL INPUTS (string/value pairs [default in brackets])             ѡ�������루�ַ���/ֵ �ԡ�Ĭ���������С���
% 'model' - model(t)=m means use params from model m at time t [ones(1,T) ]         ��ʱ��t��m��ζ������ mģ�Ͳ���   [ones(1,T) ]
% 
%     In this case, all the above matrices take an additional final
%     dimension,                                                           �����������,����������ø��ӵ�ά��
%     i.e., A(:,:,m), C(:,:,m), Q(:,:,m), R(:,:,m).                     ����
%     However, init_x and init_V are independent of model(1).      
%                                                 init_x and init_V�����ģ��1�Ƕ�����
% 'u'     - u(:,t) the control signal at time t [ [] ]
%                                                           ��ʱ��t�Ŀ����ź�
% 'B'     - B(:,:,m) the input regression matrix for model m
%                                                         ����ģ��m�ģ�����ع����

% OUTPUTS (where X is the hidden state being estimated)       ���������X�Ǳ����Ƶ�����״̬��
% x(:,t) = E[X(:,t) | y(:,1:t)]
% V(:,:,t) = Cov[X(:,t) | y(:,1:t)]
% VV(:,:,t) = Cov[X(:,t), X(:,t-1) | y(:,1:t)] t >= 2
% loglik = sum{t=1}^T log P(y(:,t))
%
% If an input signal is specified, we also condition on it:  ���һ�������ź����ض���,���ǵ�����
% e.g., x(:,t) = E[X(:,t) | y(:,1:t), u(:, 1:t)]
% If a model sequence is specified, we also condition on it:
% e.g., x(:,t) = E[X(:,t) | y(:,1:t), u(:, 1:t), m(1:t)]
[os T] = size(y);
ss = size(A,1); % size of state space
% set default params
model = ones(1,T);
u = [];
B = [];
ndx = [];
args = varargin;
nargs = length(args);
for i=1:2:nargs
  switch args{i}
   case 'model', model = args{i+1};
   case 'u', u = args{i+1};
   case 'B', B = args{i+1};
   case 'ndx', ndx = args{i+1};
   otherwise, error(['unrecognized argument ' args{i}])
  end
end
x = zeros(ss, T);
V = zeros(ss, ss, T);
VV = zeros(ss, ss, T);
loglik = 0;
for t=1:T
  m = model(t);
  if t==1
    %prevx = init_x(:,m);
    %prevV = init_V(:,:,m);
    prevx = init_x;
    prevV = init_V;
    initial = 1;
  else
    prevx = x(:,t-1);
    prevV = V(:,:,t-1);
    initial = 0;
  end
  if isempty(u)
    [x(:,t), V(:,:,t), LL, VV(:,:,t)] = ...
 kalman_update(A(:,:,m), C(:,:,m), Q(:,:,m), R(:,:,m), y(:,t), prevx, prevV, 'initial', initial);
  else
    if isempty(ndx)
      [x(:,t), V(:,:,t), LL, VV(:,:,t)] = ...
   kalman_update(A(:,:,m), C(:,:,m), Q(:,:,m), R(:,:,m), y(:,t), prevx, prevV, ... 
   'initial', initial, 'u', u(:,t), 'B', B(:,:,m));
    else
      i = ndx{t};
      % copy over all elements; only some will get updated
      x(:,t) = prevx;
      prevP = inv(prevV);
      prevPsmall = prevP(i,i);
      prevVsmall = inv(prevPsmall);
      [x(i,t), smallV, LL, VV(i,i,t)] = ...
   kalman_update(A(i,i,m), C(:,i,m), Q(i,i,m), R(:,:,m), y(:,t), prevx(i), prevVsmall, ...
   'initial', initial, 'u', u(:,t), 'B', B(i,:,m));
      smallP = inv(smallV);
      prevP(i,i) = smallP;
      V(:,:,t) = inv(prevP);
    end    
  end
  loglik = loglik + LL;
end