%Defining symbols using matlab symbolic toolbox.
syms m1 m2 l1 l2 g M;
%Matrix A
A = [0 1 0                  0 0                  0;
     0 0 (-g*m1)/M          0 (-g*m2)/M          0;
     0 0 0                  1 0                  0;
     0 0 (-g*(m1+M))/(M*l1) 0 (-g*m2)/(M*l1)     0;
     0 0 0                  0 0                  1;
     0 0 (-g*m1)/(M*l2)     0 (-g*(m2+M))/(M*l2) 0]
 %Matrix B
 B = [0 ; 1/M ; 0 ; 1/(M*l1) ; 0 ; 1/(M*l2)]
 %Z gives us the Controllability matrix
 Z = [B A*B (A^2)*B (A^3)*B (A^4)*B (A^5)*B];
 %simplifying Z
 C = simplify(Z)
 %D gives us the rank of C which is n and Hence the system is Controllable.
 D = rank(C)
 %E gives the Determinant of matrix C
 E = det(C)
 %F simplifies matrix E
 F = simplify(E)
 