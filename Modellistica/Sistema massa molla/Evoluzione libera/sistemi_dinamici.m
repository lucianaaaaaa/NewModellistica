clear
close all
clc

% sistema massa molla
%% introduciamo i parametri di riferimento
k=0.1;
m=1;
T=100;

x0=[1 ; 0]; %% il sistema massa molla ha 2 variabili di stato

%% matrici
A= [0 1;-k/m 0];
B= [0; 1/m];
C= [1 0];
D= 0;

%% sistema lineare
sys = ss(A,B,C,D);
[y,time,x]=initial(sys,x0,T);

%così è tempo continuo, se aggiungo un argomento (tempo di campionamento)
%diventa tempo discreto

%% grafici
figure(1)
plot(time,y)
xlabel('tempo')
ylabel('uscita')

figure(2)
plot(time,x(:,1),'LineWidth',2)
xlabel('tempo')
ylabel('spostamento')
legend('s(t)=x_1(t)')
grid

figure(3)
plot(time,x(:,2),'LineWidth',2)
xlabel('tempo')
ylabel('velocità')
legend('ds(t)/dt=x2(t)')
grid

%% subplot: 2 plot nella stessa figura
%%i primi 2 parametri indicano la regione di figura che seleziono
figure 
subplot(2,1,1) %% il terzo parametro indica quale regione selezioni
plot(time,x(:,1),'LineWidth',2)
xlabel('tempo')
ylabel('spostamento')
legend('s(t)=x_1(t)')
grid
subplot(2,1,2) %% in questo subplot cambia solo il terzo parametro
plot(time,x(:,2),'LineWidth',2)
xlabel('tempo')
ylabel('velocità')
legend('ds(t)/dt=x2(t)')
grid