%Con este m�todo vamos a evaluar la derivada d ela funci�n y en el punto en
%el que cort la recta tangnte al eje  evaluamos de nuevo. De este modo nos
%aproximaremos al corte en e eje x.
eps1=1.e-5;
nmax=100;
%Comenzamos en xa y calculamos su imagen
xa=input('Punto de origen =');
    fa=2*xa-atan(xa)*(1+xa^2);
    %Bucle de resultados
    hold off
for j=1:nmax
    %Si este valor esta muy cerca de 0 fin de la operaci�n
    if abs(fa)<=eps1
        break
        else
            %Si el valor es mayor que la precisi�n a a drivar fx (fpa) y
            %calcular el corte de la recta tangente a fx por ese punto para
            %luego convertir a ese unto en el nuevo valor de evaluaci�n
            fpa=1-atan(xa)*2*xa;
            xa=xa-fa/fpa;
            fa=2*xa-atan(xa)*(1+xa^2);
end
end
root=xa;
root
fa
j