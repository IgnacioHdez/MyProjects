%Con este método vamos a evaluar la derivada d ela función y en el punto en
%el que cort la recta tangnte al eje  evaluamos de nuevo. De este modo nos
%aproximaremos al corte en e eje x.
eps1=1.e-5;
nmax=100;
%Comenzamos en x=2 y calculamos su imagen
xa=2;
fa=exp(xa)*log(xa)-xa*xa;
%Bucle de resultados
for j=1:nmax
    %Si este valor esta muy cerca de 0 fin de la operación
    if abs(fa)<=eps1
        break
    else
        %Si el valor es mayor que la precisión a a drivar fx (fpa) y
        %calcular el corte de la recta tangente a fx por ese punto para
        %luego convertir a ese unto en el nuevo valor de evaluación
        %---------- Conservo valores ara el plot
        xaa=xa;
        faa=fa;
        %---------- Vuelvo al bucle
        fpa=exp(xa)*log(xa)+exp(xa)/(xa)-2*xa;
        xa=xa-fa/fpa;
        fa=exp(xa)*log(xa)-xa*xa;
        %Plot de las rectas tangntes
        hold on
        x=1:0.01:2;
        y=fpa.*(x-xaa)+faa;
        if j==1
            plot(x,y,'y')
        elseif j==2
            plot(x,y,'g')
        elseif j==3
            plot(x,y,'c')
        elseif j==4
            plot(x,y,'r','linewidth',2)
        end
    end
end
root=xa;
root
fa
j
%Plot
x=1:0.01:2;
fx=exp(x).*log(x)-x.*x;
plot(x,fx,'linewidth',2)
grid