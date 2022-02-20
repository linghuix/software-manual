function [ztran,F] = ss2z(f ,Ts)
% [ztran,F] = ss2z(f ,Ts)
% ����ɢ��������Ӧ����ת��Ϊ����������˹����s�Ĵ��ݺ�����
% ����
%     Ts��ʾ������ʱ������fΪ������˹���ݺ���
% ���
%     ztran��ת�������ɢ������Ӧ����
%     F�� ת�����м���ϵͳ��ʱ����
% 
%   See also z2ss
%   Copyright 2017 POEWR-LJR.
% 
syms n z
f = ilaplace(f);
F = simplify(f);
f = subs(F,n*Ts);
ztran = ztrans(f,n,z);
end

