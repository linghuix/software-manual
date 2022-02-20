

%%output: rotation matrix along Y axis by an angle expressed in degree
function [Rmat]=RotY(angle)

Rmat=[cos(angle) 0 sin(angle) 0; 
       0  1 0 0;
       -sin(angle) 0 cos(angle) 0;
       0 0 0 1];

end