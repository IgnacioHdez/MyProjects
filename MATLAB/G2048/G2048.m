%--Creamos el escenario
A=zeros(4);
E=0;
%--Aparici�n aleatoria de dos 2
i=randi(4);
j=randi(4);
A(i,j)=2;
A=Mov24(randi(4),A);
%--Jugamos
while E==0  
    M=fmovint(A,ln);
    A=Mov24(M,A);
    %--Comprobaci�n fin de juego
    E=Endtest(A);
end