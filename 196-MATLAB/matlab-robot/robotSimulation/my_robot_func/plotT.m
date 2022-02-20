
%%input: transformation matrix of a point
%%output: a figure representing position and orientation of the point
% add cylinder to make picture more vivid

function plotT(T)

length = 10;

nx=T(1,1);ny=T(2,1);nz=T(3,1);
ox=T(1,2);oy=T(2,2);oz=T(3,2);
ax=T(1,3);ay=T(2,3);az=T(3,3);
px=T(1,4);py=T(2,4);pz=T(3,4);

hold on
grid on

line([px,px+nx*length],[py,py+ny*length],[pz,pz+nz*length],'LineWidth',2,'Color','red','Tag','n');
line([px,px+ox*length],[py,py+oy*length],[pz,pz+oz*length],'LineWidth',2,'Color','blue','Tag','o');
line([px,px+ax*length],[py,py+ay*length],[pz,pz+az*length],'LineWidth',2,'Color','black','Tag','a');
title('T position and orientation');

%%plot a dot as the position
plot3(px,py,pz,'ro');
xlabel('x');ylabel('y');zlabel('z');

% add cylinder to make picture more vivid
[x,y,z] = cylinder(1);
z(1,:) = -5;
z(2,:) = 5;
for j = 1:2
    for i = 1:size(x,2)
        after = T*[x(j,i) y(j,i) z(j,i) 1]';
        x(j,i) = after(1);
        y(j,i) = after(2);
        z(j,i) = after(3);
    end
end
surf(x,y,z,'linestyle','none','facecolor',[1 0 0])

hold off
end
