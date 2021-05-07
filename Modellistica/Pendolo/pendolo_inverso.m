clear
clc 
close all

%% dati
global a k m L g
a=0.25;
k=4.5;
m=1;
L=0.5;
g=9.81;
x1 = -pi/2:0.01:pi/2;

%% funzioni
y1= sin(x1);
y2= (k/(m*L*g))*x1;
y3 = y1-y2;

%% plot - due grafici distinti
figure 
plot(x1,y1,'--',x1,y2,':','LineWidth',1.5)
title('2 grafici distinti')
legend('y1= sin(x)','y2= (k/(m*L*g))*x')

%% plot- grafico della differenza
figure 
plot (x1,y3,'LineWidth',1.3)
title('differenza tra le due funzioni')

%% solve nonlinear system

for i=1:length(x1)
    x0=x1(i);
    x = fsolve(@(x) equilibrio(x),x0);
    x_vet(i)=x;
end

figure
plot (x1*180/pi,x_vet,'r','LineWidth',1.3)
title ('punti di equilibrio al variare di x0')
xlabel('variazione di x0')
ylabel('soluzioni del sistema nonlineare')

%% linearizzazione sistema
x_bar=[0.713; 0];
u_bar=0;
u=0;

A=[0 1; -k/(m*L*L)+g/L*cos(x_bar(1)) -a/(m*L*L)];
B= [0 ; 0];
C= [1 0];
D= 0;
T=10;
x0 = [0.7 ; 0];

dx0=x0-x_bar;
du = u-u_bar;

t=0:0.1:20;
sim('linearizzazione_pendolo_inv',t);



