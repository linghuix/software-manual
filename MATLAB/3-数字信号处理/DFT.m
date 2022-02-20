% ��ɢ����Ҷ�任������ N_t����������X_t����ֵ��Fs �����ź�
function freq = DFT(N_t,X_t)

% matlab��������Сֵ��1��ʼ��������Ҫ�仯һ�¡�
W = exp(-j*2*pi/N_t);
X = zeros(1,N_t-1);
for k = 1:N_t
	for n = 1:N_t
		X(k) = X(k) + X_t(n)*W^(k*(n-1));
	end
end


% ��ɢ����Ҷ��任������ N_t����������X_t����ֵ��Fs �����ź�
function X_t = DFT(N_t,freq)

% matlab��������Сֵ��1��ʼ��������Ҫ�仯һ�¡�
W = exp(-j*2*pi/N_t);
X = zeros(1,N_t-1);
for k = 1:N_t
	for n = 1:N_t
		X(k) = X(k) + X_t(n)*W^(-(k-1)*(n-1));
	end
	
	X(k) = X(k)/N_t;
end



% ����غ��������� N_t����������X_t����ֵ��Fs �����ź�
function freq = relax_self(N_t,X_t)

% matlab��������Сֵ��1��ʼ��������Ҫ�仯һ�¡�
Rxx = zeros(1,N_t);
for r = 1:N_t
	for n = 1:N_t-r+1
		Rxx(r) = Rxx(r) + X_t(n)*X_t(n+r-1);
	end
	
	Rxx(r) = Rxx(r)/(N_t-r);
end
	

	
% ����غ��������� N_t����������X_t����ֵ��Fs �����ź�
function freq = relax_self(N_t,X_t,Y_t)

% matlab��������Сֵ��1��ʼ��������Ҫ�仯һ�¡�
Rxy = zeros(1,N_t);
for r = 1:N_t
	for n = 1:N_t-r
		Rxy(r) = Rxy(r) + X_t(n)*Y_t(n+r);
	end
	
	Rxy(r) = Rxy(r)/(N_t-r);
end

