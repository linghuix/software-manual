function [F,ft] = z2ss(f)
% [F,ft] = z2ss(f)
% ������������˹����s�Ĵ��ݺ�����ת��Ϊ��ɢ��������Ӧ����
% ����
%     f����ɢ��������Ӧ����
% ���
%     F��ת����İ���������˹����s�Ĵ��ݺ���
%     ft�� ת�����м���ϵͳ��ʱ����
% ʹ��ʱҪע�⽫��ɢ��������Ӧ�����Ĳ�������ȫ����Ϊ1,
%   See also ss2z
%   Copyright 2017 POEWR-LJR.
% 
syms n z t
% subs(f,T,1);
ft = iztrans(f,t);
ft = simplify(ft);
% f = subs(F,n*Ts);
F = laplace(ft);
end

