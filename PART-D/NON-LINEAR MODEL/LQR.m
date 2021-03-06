%Defining symbols using matlab symbolic toolbox.
syms m1 m2 l1 l2 g M;
%defining symbols
m1 = 100
m2 = 100
M  = 1000
l1 = 20
l2 = 10
g  = 9.8
%Matrix A
A = [0 1 0                  0 0                  0;
     0 0 (-g*m1)/M          0 (-g*m2)/M          0;
     0 0 0                  1 0                  0;
     0 0 (-g*(m1+M))/(M*l1) 0 (-g*m2)/(M*l1)     0;
     0 0 0                  0 0                  1;
     0 0 (-g*m1)/(M*l2)     0 (-g*(m2+M))/(M*l2) 0]
 %Matrix B
 B = [0 ; 1/M ; 0 ; 1/(M*l1) ; 0 ; 1/(M*l2)]
 C = eye(6)
 D = [0;0;0;0;0;0]
 %Finding out the eigen values of A
 F1 = eigs(A)
 %Defining LQR Controller cost Functions.
 Q = eye(6);
Q(1,1) = 10;
Q(2,2) = 10 ;
Q(3,3) = 10;
Q(4,4) = 100000;
Q(5,5) = 10;
Q(6,6) = 100000;
 R = [0.00001]
%Finding out the LQR gains.
K = lqr(A,B,Q,R)


 