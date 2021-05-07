clear 
clc


r = 6000;
I = 0.03;
k=0;
C = 100000;

while C>=0
    k=k+1;
    C = C + I/2*C - r;
end


