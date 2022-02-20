%% Author: epokh
%% Website: www.epokh.org/drupy
%% This software is under GPL

%%Transformation in cylindrical coordinates
%%input: alfa angle along z axis, l translation along z axis,r translation
%%along x axis

function Tmat=Tcyl(alfa,l,r)

Tmat=Trans(0,0,l)*RotZ(alfa)*Trans(r,0,0);

end