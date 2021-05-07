clear
clc

%modello preda-predatore

%a=natalità prede, b,c=tasso incontri, d=mortalità predatori
%impongo condizioni iniziali, parametri e grafo tutte e due
%lo faccio a tempo discreto 

% x(k+1)-x(k) = x(k)a - b x(k) y(k)
% y(k+1)-y(k) = c x(k)y(k) -d y(k) 
% x(0) = x0, y(0) = y0

%% inizializzazione delle variabili 
x = zeros (1,50);
y = zeros (1,50);
x(1) = 8;
y(1) = 0.7;
a = 0.3;
b = 0.09;
c = 0.007;
d = 0.09;

%% calcolo popolazioni

for k=1:50
    x(k+1)= x(k) + a*x(k) - b*x(k)*y(k);
    y(k+1)=y(k)+ c*x(k)*y(k) -d*y(k);
end

%% grafico delle prede e dei predatori
tempo = 0:50;
plot(tempo,x)
xlabel('tempo')
ylabel('blu: prede, rosso:predatori')
grid

hold on

plot(tempo,y)

hold off