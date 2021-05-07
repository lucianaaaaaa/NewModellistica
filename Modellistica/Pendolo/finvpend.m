function xp=finvpend(input)

a=0.25;
k=4.5;
m=1;
L=0.5;
g=9.81;

x1 = input(1);
x2 = input(2);
u= input (3);

xp(1)= x2;
xp(2)=-a/(m*L^2)*x2-k/(m*L^2)*x1+g/L*sin(x1)+u/(m*L^2);