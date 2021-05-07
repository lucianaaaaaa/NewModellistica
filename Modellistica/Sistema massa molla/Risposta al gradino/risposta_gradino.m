clear
close all
clc

% sistema massa molla
%% introduciamo i parametri di riferimento
k=0.1;
b=0.05;
m=1;
T=100;

x0=[1 ; 0]; %% il sistema massa molla ha 2 variabili di stato

%% matrici
A= [0 1;-k/m -b/m];
B= [0; 1/m];
C= [1 0];
D= 0;

%% sistema lineare
sys = ss(A,B,C,D);

%% risposta forzata
[yf,timef,xf] = step(sys,T);

figure
plot(timef,xf)
xlabel('tempo')
ylabel('uscita al gradino')

%% evoluzione libera
[y,time,x]=initial(sys,x0,T);

figure
plot(time,x,'LineWidth',2)
xlabel('tempo')
ylabel('stato')
legend('s(t)=x_1(t)','ds(t)/dt=x2(t)')
grid

%% cambiamento di base
TT = [1 1;-1 1];
Atilde = TT*A*inv(TT);
Btilde = TT*B;
Ctilde= C*inv(TT);
Dtilde=0;


sys_tilde = ss(Atilde,Btilde,Ctilde,Dtilde);

% evoluzione libera
[y_t,timet,x_t]=initial(sys_tilde,TT*x0,T);

figure 
subplot(2,1,1)
plot(time,x,'LineWidth',2)
xlabel('tempo')
ylabel('stato 1')
title ('stato libero')

grid
subplot(2,1,2) 
plot(timet,x_t,'LineWidth',2)
xlabel('tempo')
ylabel('stato 2')

grid

 % risposta forzata
[yft,timeft,xft]=step(sys_tilde,T);
figure 

subplot(2,1,1) 
plot(timef,xf,'LineWidth',2) 
xlabel('tempo')
ylabel('stato 1')
title ('stato forzato')
grid
subplot(2,1,2) 
plot(timeft,xft,'LineWidth',2)
xlabel('tempo')
ylabel('stato 2')
grid

% uscita libera
figure 
subplot(2,1,1)
plot(time,y,'LineWidth',2)
xlabel('tempo')
ylabel('uscita libera 1')
title ('uscita libera')

grid
subplot(2,1,2) 
plot(timet,y_t,'LineWidth',2)
xlabel('tempo')
ylabel('uscita libera 2')

grid

% uscita forzata
figure 
subplot(2,1,1)
plot(timef,yf,'LineWidth',2)
xlabel('tempo')
ylabel('uscita forzata 1')
title('uscita forzata')

grid
subplot(2,1,2) 
plot(timeft,yft,'LineWidth',2)
xlabel('tempo')
ylabel('uscita libera 2')

grid

%% risposta a un ingresso sinusoidale
t= 0:0.1:100;
u=sin(t);
plot(t,u)
[yg,tg,xg]=lsim(sys,u,t,x0);

%% simulink to workspace (plot evoluzione libera)
figure
plot(out.Time,out.evlibera)

figure
plot(out.Time,out.rispostaforzata)

