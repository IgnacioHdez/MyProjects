%Con este método vamos a evaluar la derivada d ela función y en el punto en
%el que cort la recta tangnte al eje  evaluamos de nuevo. De este modo nos
%aproximaremos al corte en e eje x.
clear all
inicio=input('inicio=');
fin=input('fin=');
n=1;
for xa=inicio:fin
eps1=1.e-5;
nomax=1000;
%Comenzamos en xa y calculamos su imagen
xa=inicio;
    fa=-6*xa+4*(xa^3)+(xa^4)/2;
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
            fpa=-6+12*xa^2+2*xa^3;
            xa=xa-fa/fpa;
            fa=-6*xa+4*(xa^3)+(xa^4)/2;
        end
        is=is+1;
end
root(1,n)=xa;
inicio=inicio+1;
n=n+1;
end
root