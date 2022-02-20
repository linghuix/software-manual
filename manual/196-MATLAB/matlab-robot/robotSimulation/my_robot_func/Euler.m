
%%Function description:
%%Transformation of the end effector frame following the Euler angles
%%in closed form
%%input: rotation angles along y,z,y axis expressed in degrees

function [EulerMat]=Euler(fi1,theta,fi2)

EulerMat=[cos(fi1)*cos(theta)*cos(fi2)-sin(fi1)*sin(fi2),-cos(fi1)*cos(theta)*sin(fi2)-sin(fi1)*cos(fi2),cos(fi1)*sin(theta),0;
        sin(fi1)*cos(theta)*cos(fi2)+cos(fi1)*sin(fi2),-sin(fi1)*cos(theta)*sin(fi2)+cos(fi1)*cos(fi2),sin(fi1)*sin(theta),0;
        -sin(theta)*cos(fi2),sin(theta)*sin(fi2),cos(theta),0;
        0                      ,0                   ,0          ,1;];
    
    

end