close all
clear all
format
%--Definimos condiciones iniciales para tomar valores
%--La jugada de mayor puntuación
p=1;
y=0;
%--Probabilidad de movimiento aleatorio
for ln=90:100;
%--Número de jugadas
nmax=50;
%--Bucle de la partida
for n=1:nmax
    %--Juega la partida
    G2048
    s(n)=fpunt(A);
end
ln
y=y+1;
sp(y)=mean(s);
end
plot(90:100,sp)