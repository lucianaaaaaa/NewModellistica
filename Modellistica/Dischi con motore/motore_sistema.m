%% variables
global gamma beta Ra L bm kc kv g k1 k2 b1 b2 Jm J m M rm r1 r2 r3

gamma=60*pi/180;
beta=60*pi/180;
Ra=0.4;
L=0.2*1e-3;
bm=0.0072;
kc=0.02;
kv=0.02;
g=9.81;
k1=10;
k2=10;
b1=1;
b2=1;
Jm=0.002;
J=0.4;
m=0.03;
M=0.01;
rm=0.005;
r1=0.05;
r3=0.03;
r2=0.01;

%% Matrici per carico
A = [0 1 0 0; -k1/m -b1/m 0 0; 0 0 0 1; 0 0 -k2/M -b2/M];
B = [0 0 0 0; -(k1*r3)/m -(b1*r3)/m cos(gamma) 0;0 0 0 0; (k2*r2)/M (b2*r2)/M cos(beta) 0];
C = [+r3*k1 +r3*b1 -r2*k2 -r2*b2; 1 0 0 0; 0 0 1 0];
D = [+(r2^2)*k2+(r3^2)*k1 +(r2^2)*b2+(r3^2)*b1 0 J; 0 0 0 0; 0 0 0 0];

%% condizioni iniziali
global xm xc;
xm = [0 0 0]; %condizioni iniziali motore (x1=theta, x2=omega, x3=i)
xc = [0 0 0 0]'; %condizioni iniziali carico (x1=s1, x2=ds1, x3=s2, x4=ds2)

%% Simulazione
sim ('sistema_motore',1e-3)