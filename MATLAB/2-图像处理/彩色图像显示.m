clear
rgb_R=zeros(8,256);
rgb_G=zeros(8,256);
rgb_B=zeros(8,256);
zero=zeros(8,256);

for i=1:256
    rgb_R(:,i)=i;
    rgb_G(:,i)=i;
    rgb_B(:,i)=i;
end
red=uint8(rgb_R);
green=uint8(rgb_G);
blue=uint8(rgb_B);

R=cat(3,red,zero,zero);
G=cat(3,zero,green,zero);
B=cat(3,zero,zero,blue);
RG=cat(3,red,green,zero);
RB=cat(3,red,zero,blue);
GB=cat(3,zero,green,blue);

subplot(6,1,1), imshow(R,[0 1024]), title('��ɫȫ��ͼ'); 
subplot(6,1,2), imshow(G), title('��ɫȫ��ͼ'); 
subplot(6,1,3), imshow(B), title('��ɫȫ��ͼ'); 
subplot(6,1,4), imshow(RG), title('��ɫ����ɫ����ȫ��ͼ'); 
subplot(6,1,5), imshow(RB), title('��ɫ����ɫ����ȫ��ͼ'); 
subplot(6,1,6), imshow(GB), title('��ɫ����ɫ����ȫ��ͼ');