function F = equilibrio(x)

%% dati
k=4.5;
m=1;
L=0.5;
g=9.81;

%% 
F(2) = sin(x)-(k/(m*g*L))*x;