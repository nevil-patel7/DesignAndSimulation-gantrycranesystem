M = 1000; m1 = 100; m2 = 100; l1 = 20; l2 = 10; g = 9.8;
 
A = [0 1 0 0 0 0;0 0 (-m1*g)/M 0 (-m2*g)/M 0;0 0 0 1 0 0; 0 0 (-(m1+M)*g)/(M*l1) 0 (-m2*g)/(M*l1) 0;0 0 0 0 0 1;0 0 (-m1*g)/(M*l2) 0 (-(m2+M)*g)/(M*l2) 0]; 
B = [0;    (1/M);     0;    (1/(M*l1));     0;    (1/(M*l2))];
 
% initial state of the system 
X0 = [0;0;pi/20;0;pi/40;0]; 
%  we take time t from 1 to 5 seconds 
t = 0:0.01:5; 
u = zeros(size(t));
new_poles = [-3.1 -3.2 -3.3 -3.4 -3.5 -3.6];
%just cart position X 
C1 = [1 0 0 0 0 0]; 
L1 = place(A',C1',new_poles)'; 
A1 = A - L1*C1;
B1 = [0;0;0;0;0;0];  
D1 = 0; 
closed_loop_sys_1 = ss(A1,B1,C1,D1); 
[y,t,~] = lsim(closed_loop_sys_1,u,t,X0);
 
%plotting the graph for cart position after applying luenberger observer 
plot(t,y(:,1),'red') 
title('cart position after applying Luenberger Observer')
xlabel('time(s)')
ylabel('cart position(m)') 
legend('cart position')

%cart position and theta2
C2 = [1 0 0 0 0 0; 0 0 0 0 1 0]; 
L2 = place(A',C2',new_poles)'; 
A2 = A - L2*C2;
B2 = [0;0;0;0;0;0]; 
D2 = 0; 
closed_loop_sys_2 = ss(A2,B2,C2,D2); 
[y,t,~] = lsim(closed_loop_sys_2,u,t,X0); 
figure;
yyaxis left 
plot(t,y(:,1))
ylabel('cart position(m)')
yyaxis right 
plot(t,y(:,2)*(180/pi),'g')
ylabel('theta2(degrees)')
title('cart position and theta_2 after applying Luenberger Observer')
xlabel('time(s)')
legend('cart position','theta2')

%cart position X, theta1 and theta2 
C3 = [1 0 0 0 0 0;0 0 1 0 0 0;0 0 0 0 1 0 ]; 
L3 = place(A',C3',new_poles)';
A3 = A - L3*C3;
B3 = [0;0;0;0;0;0]; 
D3 = 0;
closed_loop_sys_3 = ss(A3,B3,C3,D3); 
[y,t,~] = lsim(closed_loop_sys_3,u,t,X0);
 
figure; 
yyaxis left;
plot(t,y(:,1),'red') 
ylabel('cart position(m)'); 
yyaxis right;
plot(t,[y(:,2),y(:,3)]*(180/pi)) 
title('cart position, theta1 and theta2 after applying Luenberger Observer');
xlabel('time(s)');
ylabel('theta1 and theta2 (degrees)') 
legend('cart position','theta1','theta2')
 