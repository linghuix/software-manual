
%%input: 2 subsequent transformation matrixs
%%output: a figure representing position and orientation
%%of both frames with a black link connecting their origin

function plotlink(Tprev,Tnext)

% plotT(Tprev);
% plotT(Tnext)

px1=Tprev(1,4);
py1=Tprev(2,4);
pz1=Tprev(3,4);


px2=Tnext(1,4);
py2=Tnext(2,4);
pz2=Tnext(3,4);
hold on
grid on
line([px1,px2],[py1,py2],[pz1,pz2],'LineWidth',3,'Color','black','Tag','n');
xlabel('x');
ylabel('y');
zlabel('z');
title('T position and orientation');
hold off
end