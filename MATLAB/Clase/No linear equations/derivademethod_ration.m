%Con este método vamos a evaluar la derivada d ela función y en el punto en
%el que cort la recta tangnte al eje  evaluamos de nuevo. De este modo nos
%aproximaremos al corte en e eje x.
eps1=1.e-5;
nomax=1000;
%Comenzamos en xa y calculamos su imagen
xa=input('Punto de origen =');
    fa=2-(1/xa);
    %Bucle de resultados
    is=1;
while is<nomax
        %Si este valor esta muy cerca de 0 fin de la operación
        if abs(fa)<=eps1
            break
        else
            %Si el valor es mayor que la precisión a a drivar fx (fpa) y
            %calcular el corte de la recta tangente a fx por ese punto para
            %luego convertir a ese unto en el nuevo valor de evaluación
            fpa=1/(xa^2);
            xa=xa-fa/fpa;
            fa=2-(1/(xa));
        end
        is=is+1;
end
root=xa;
root
fa
is