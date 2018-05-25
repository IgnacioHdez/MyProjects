syms x
%Funciones de los segmentos
ra=recta(A1,A2);
rb=recta(B1,B2);
rc=recta(C1,C2);
%Defino variables iniciales
n=0;
a=0;
b=0;
c=0;
h=0;
a2=0;
b2=0;
c2=0;
%Cuerpo del ataque
disp('Las funciones deben ser continuas y derivables en [-9,9]')
disp('y contener la variable `x` al menos una vez')
disp('---')
tic
    while n<3
        %Defino el color si no hay choque
        color=('g');
        %Input de la función
        fx=input('Función del ataque f(x)=');
        disp('---')
        %Consejos
        cons
        %h mide las veces que se dispara
        h=h+1;
        %Funcion que determina la colisión mediante el uso del
        %T.Bolzano(Aportacion de Andres)
        cola=col(fx,ra,A1,A2);
        colb=col(fx,rb,B1,B2);
        colc=col(fx,rc,C1,C2);
        %Casos posibles:
            if cola==1
                %a sirve para descartar repeticiones. De esta manera hundo
                %cada barco una vez
                if a==0
                display('Barquito A hundido!')
                disp('---')
                n=n+1;
                a=1;
                soundeff
                color=('r');
                hold on
                plot(A1(1,1),A1(1,2),'ob')
                plot(A2(1,1),A2(1,2),'ob')
                
                else
                    if a2==0
                display('¡Falló!')
                display('Acaba de desperdiciar una importante')
                display('suma de dinero público.Preparate para los recortes')
                disp('---')
                a2=1;
                    end
                end
            end
            if colb==1
                if b==0
                display('Barquito B hundido!')
                disp('---')
                n=n+1;
                b=1;
                soundeff
                color=('r');
                hold on
                plot(B1(1,1),B1(1,2),'.b')
                plot(B2(1,1),B2(1,2),'.b')
                else
                    if b2==0
                display('¡Falló!')
                display('Acaba de desperdiciar una importante')
                display('suma de dinero público.Preparate para los recortes')
                disp('---')
                b2=1;
                    end
                end
            end
            if colc==1
                if c==0
                display('Barquito C hundido!')
                disp('---')
                n=n+1;
                c=1;
                soundeff
                color=('r');
                hold on
                plot(C1(1,1),C1(1,2),'*b')
                plot(C2(1,1),C2(1,2),'*b')
                else
                    if c2==0
                display('¡Falló!')
                display('Acaba de desperdiciar una importante')
                display('suma de dinero público.Preparate para los recortes')
                disp('---')
                c2=1;
                    end
                end
            end
            if cola==-1
                if colb ==-1
                    if colc==-1
                display('¡Falló!')
                display('Acaba de desperdiciar una importante')
                display('suma de dinero público.Preparate para los recortes')
                disp('---')
                    end
                end
            end
        f(x)=fx;    
        i=(-9.001:0.01:9.001);
        j=f(i);
        plot(i,j,color);
        axis([-9,9,-9,9])
        hold on
        plot(0,0,'+k')
        title('MATQUITOS')
    end
t=toc;