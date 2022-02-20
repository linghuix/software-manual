
%%output: rotation matrix along X axis by an angle expressed in degree
function [Rmat]=RotX(angle)

Rmat=[1 0 0 0;
      0 cos(angle) -sin(angle) 0;
      0 sin(angle) cos(angle) 0;
      0 0 0 1];

end