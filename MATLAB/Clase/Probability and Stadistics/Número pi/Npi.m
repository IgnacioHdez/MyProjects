%Aproxmaci�n del n�mero pi mediante el c�lculo de la probabilidadde que un
%unto en un cuadrado de lado uno este dentro de la circunferencia de radio
%1 que pasa por el cuadrado si este tiene s esquina en el 0,0
n=input('N�mero de puntos =');
%Creaci�n de los puntos
for i=1:n
    x(1,i)=rand;
    y(1,i)=rand;
end
s=0;
for j=1:n
    d(j)=den(x(1,j),y(1,j));
    s=s+d(j);
end
x=[0,1];
hist(d,x,1)
prob=s/n;
pip=4*prob;
disp(pip)
