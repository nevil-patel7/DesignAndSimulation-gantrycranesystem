% Mass of the crane M 
M = 1000; 
% Mass of the weight m1 
m1 = 100; 
% Mass of the weight m2
m2 = 100; 
% Length of cable 1 
l1 = 20; 
% Length of cable 2 
l2 = 10; 
% gravity g
g = 9.8;
 
A = [0 1 0 0 0 0;0 0 (-m1*g)/M 0 (-m2*g)/M 0;0 0 0 1 0 0; 0 0 (-(m1+M)*g)/(M*l1) 0 (-m2*g)/(M*l1) 0;0 0 0 0 0 1;0 0 (-m1*g)/(M*l2) 0 (-(m2+M)*g)/(M*l2) 0]; 
B = [0;    (1/M);     0;    (1/(M*l1));     0;    (1/(M*l2))];
C = [1 0 0 0 0 0]; 
D=[0]; 
sys= ss(A,B,C,D);
 
R= [1]; 
nx = 6;
%number of states
ny = 3; 
%only x is taken into account 
Qn = [4 2 0 5 2 1;
    1 2 3 2 1 0;
    5 8 7 0 0 1;
    4 6 5 9 6 3;
    9 8 7 4 5 6;
    3 5 4 7 8 9]; 
%covariance: reference taken from matlab documentation
Rn = eye(1); 
%Measurement covariance
 
QXU = blkdiag(0.1*eye(nx),R);
QWV = blkdiag(Qn,Rn);
QI = eye(1);
 
KLQG = lqg(sys,QXU,QWV,QI);
size(KLQG)
finalsys = tf(KLQG);

