function [y ny] = juanji(x,nx,h,nh)
% xΪ������У�nxΪ���е�λ��,��һά����
% hΪ������У�nhΪ���е�λ��,��һά����
ny_start = nh(1)+nx(1);
ny_end = nh(end)+nx(end);
y = conv(x,h);
ny = ny_start:ny_end;
end

% ����

