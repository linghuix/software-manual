
%%output: rotation matrix along Z axis by an angle expressed in degree

function [Rmat]=RotZ(angle)

Rmat=[ cos(angle) -sin(angle)   0 0 
       sin(angle) cos(angle)    0 0;
       0          0             1 0;
       0          0             0 1];

end