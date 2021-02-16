%Defining symbols using matlab symbolic toolbox.
syms m1 m2 l1 l2 g M;
%Defining C matrix as per the conditions
C1=[1 0 0 0 0 0];                 % C matrix for x
C2=[0 0 1 0 0 0; 0 0 0 0 1 0];     % C matrix for theta1,theta2
C3=[1 0 0 0 0 0; 0 0 0 0 1 0];     % C matrix for x,theta2
C4=[1 0 0 0 0 0; 
    0 0 1 0 0 0;
    0 0 0 0 1 0];                  % C matrix for x,theta1,theta2 
%Matrix A
A = [0 1 0                  0 0                  0;
     0 0 (-g*m1)/M          0 (-g*m2)/M          0;
     0 0 0                  1 0                  0;
     0 0 (-g*(m1+M))/(M*l1) 0 (-g*m2)/(M*l1)     0;
     0 0 0                  0 0                  1;
     0 0 (-g*m1)/(M*l2)     0 (-g*(m2+M))/(M*l2) 0];
 
%Checking Obervabiltiy for x. 
C1_=[C1 ;C1*A; C1*A^2; C1*A^3; C1*A^4; C1*A^5];
R_C1 = rank(C1_)

%Checking Obervabiltiy for theta1,theta2. 
C2_=[C2 ;C2*A; C2*A^2; C2*A^3; C2*A^4; C2*A^5];
R_C2 = rank(C2_)

%Checking Obervabiltiy for x,theta2. 
C3_=[C3 ;C3*A; C3*A^2; C3*A^3; C3*A^4; C3*A^5];
R_C3 = rank(C3_)

%Checking Obervabiltiy for x,theta1,theta2. 
C4_=[C4 ;C4*A; C4*A^2; C4*A^3; C4*A^4; C4*A^5];
R_C4 = rank(C4_)