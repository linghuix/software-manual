function [MaxObjV,MaxChrom] = EliteInduvidual(Chrom,ObjV, MaxObjV, MaxChrom) 
%%�˹�ѡ������
%			������		����	����
%���˲���	Chrom		Cell	ÿ��Ԫ��Ϊһ����Ⱥ�ı���(����ǰ�ģ�
%			ObjV		Cell	ÿ��Ԫ��Ϊһ����Ⱥ���и����Ŀ��ֵ������ǰ�ģ�
%			MaxObjV		Double	������Ⱥ��ǰ���Ÿ����Ŀ��ֵ(ѡ��ǰ�ģ�
%			MaxChrom	Double	������Ⱥ��ǰ���Ÿ���ı��루ѡ��ǰ�ģ�
%�������	MaxObjV		Double	������Ⱥ��ǰ���Ÿ����Ŀ��ֵ(ѡ���ģ�
%			MaxChrom	Double	������Ⱥ��ǰ���Ÿ���ı��루ѡ���ģ�
	
MP = length (Chrom) ;	% ��Ⱥ��
for i = 1:MP
	%�ҳ���i��Ⱥ�����Ÿ���
	[MaxO,maxI] = max(ObjV{i}) ;	
	if MaxO> MaxObjV(i)
		%��¼����Ⱥ�ľ�������
		MaxObjV(i) = MaxO;	
		%��¼����Ⱥ��������ı���
		MaxChrom(i,:) = Chrom{i}(maxI,:);	
	end
end