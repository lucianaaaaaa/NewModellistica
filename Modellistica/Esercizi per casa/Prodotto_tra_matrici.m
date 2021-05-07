clc 
clear

%% definizione del sistema dinamico
k=0.1;
m=1;
A = [0 1; -k/m 0];
B = [0 1/m]';
C = [1 0];
D = 0;

%% cambiamento di base
T = [1 1; 1 -1];

At = T*A*T^(-1);
Bt = T*B;
Ct = C*T^(-1);
Dt = D;
