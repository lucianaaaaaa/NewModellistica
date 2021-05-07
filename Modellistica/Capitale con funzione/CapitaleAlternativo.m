clear 
clc
close all

%% dati del sistema
r = 6;
I = 0.03;
k=0;
C0 = 100;

%% svolgimento
flagMutuo=1;
C(1)=C0;
k=1;

while flagMutuo>0
    C(k+1) = C(k) + I/2*C(k) -r;
    if C(k+1)<0
        flagMutuo=0;
    else 
        k=k+1;
    end
end
semestri = 0:k;

%% grafico del capitale residuo
plot(semestri,C)
xlabel('tempo')
ylabel('capitale residuo')
title('C(k+1) = C(k) + I/2*C(k) -r;')
grid

CapitalePagato = r*k + C(end);

