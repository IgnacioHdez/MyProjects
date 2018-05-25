function [valor]=col(fx,rx,A1,A2)
syms x
%Aplicacion de bolzano. Resto y evaluo en los extremos del segmento
%De esta manera luego comparo el signo
g(x)=fx-rx;
p1=A1(1,1);
p2=A2(1,1);
a=g(p1);
b=g(p2);
if (a*b)>=0
    valor=-1;
else
    valor=1;
end
end