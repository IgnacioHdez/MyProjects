eps1=1.e-4;
eps2=1.e-4;
%Defino y calculo valore en el intervalo
a=0.6;
fa=(log(a)*tan(exp(a))-((a)^3)+a)^(1/2)-a;
b=0.8;
fb=(log(b)*tan(exp(b))-((b)^3)+b)^(1/2)-b;
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
        fm=(log(m)*tan(exp(m))-((m)^3)+m)^(1/2)-m;
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
x=0.6:0.001:0.8;
fx=(log(x).*tan(exp(x))-((x).^3)+x).^(1/2)-x;
plot(x,fx)
grid