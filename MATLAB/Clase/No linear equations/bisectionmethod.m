eps1=1.e-5;
eps2=1.e-5;
%Defino y calculo valore en el intervalo
a=1;
fa=exp(a)*log(a)-a*a;
b=2;
fb=exp(b)*log(b)-b*b;
%Bucle de soluciones que va a verificar el signo de la función
nmax=100;
diff=b-a;
for j=1:nmax
    if (diff<=eps1)
        %La función para si la diferencia entre a y b es muy pequeña
        break
    else
        %Calcula m que es el corte en el punto medio del intervalo a y b
        m=0.5*(b+a);
        fm=exp(m)*log(m)-m*m;
        afm=abs(fm);
        if afm<=eps2
            %Si este valor esta muy cerca de 0 fin de la operación
            break
        elseif (fm*fb)<0
            %Si el valor es negativo el intervalo se cierra por la
            %izquierda
            a=m;
            fa=fm;
        else
            %Si el valor es positivo el intervalo se cierra por la derecha
            b=m;
            fb=fm;
        end
    end
end
root=m;
root
fatroot=fm;
fatroot
j
%Plot
x=1:0.01:2;
fx=exp(x).*log(x)-x.*x;
plot(x,fx)
grid