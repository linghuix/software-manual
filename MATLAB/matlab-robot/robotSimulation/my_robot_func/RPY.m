
%%Transformation of the end effector frame following the RPY angles in
%%closed form
%%input: rotation angles along y,z,x axis expressed in degrees

function [RPYmat]=RPY(fia,fio,fin)

RPYmat=[cos(fia)*cos(fio),cos(fia)*sin(fin)*sin(fio)-sin(fia)*cos(fin),cos(fia)*sin(fio)*cos(fin)+sin(fia)*sin(fin),0;
        sin(fia)*cos(fio),sin(fia)*sin(fio)*sin(fin)+cos(fia)*cos(fin),sin(fia)*sin(fio)*cos(fin)-cos(fia)*sin(fin),0;
        -sin(fio),cos(fio)*sin(fin),cos(fio)*cos(fin),0;
        0,0,0,1];
    
end