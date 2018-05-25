close all
clear all
format
%--La jugada de mayor puntuaci�n
p=1;
%--Probabilidad de movimiento aleatorio
ln=2;
%--N�mero de jugadas
nmax=1000;
%--N�mero de apariciones de los n�meros altos
Win=[512,1024,2048;0,0,0];
%--Bucle de la partida
s=zeros(1,nmax);
for n=1:nmax
    %--Juega la partida
    G2048
    %--C�lculo de puntuaci�n
    s(n)=fpunt(A);
    if s(p)<s(n)
         Amx=A;
         p=n;
    end
    %--Recogida de los valores m�ximos
    if max(max(A))==2048
        Win(2,3)=Win(2,3)+100/nmax;
    elseif max(max(A))==1024
        Win(2,2)=Win(2,2)+100/nmax;
    elseif max(max(A))==512
        Win(2,1)=Win(2,1)+100/nmax;
    end
    %--Tiempo restante
    temp
end
%--Muestreo de los resultados
format
disp('Puntuaci�n media=')
disp(mean(s))
disp('Puntuaci�n m�xima=')
disp(max(s))
disp(Amx)
disp('Resultados m�ximos (%)=')
disp(Win)