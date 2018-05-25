clear all
close all
clc

%Presentación del programa

disp('Cálculo de la distribucion de probabilidad')
disp('asociada a una distribución espectral:')
disp(' ')

disp('(1/5) Tomando valores iniciales')
%Numero de iteraciones:
N=750;
%Defino que picos tiene la distribucion espectral (v) y su sigma
kvalues=[5,1,50];
sg=[2,0.5];

%Defino los intervalos en los que operare asegurandome coger un 99.78% de k
k0=min(kvalues)-3*max(sg);
kf=max(kvalues)+3*max(sg);

x0=-3/min(sg);
xf=3/min(sg);


disp('(2/5) Definiendo vectores')
x=linspace(x0,xf,N);
k=linspace(k0,kf,N);
dk=(kf-k0)/N;
dx=(xf-x0)/N;

disp('(3/5) Haciendo la transformada de la amplitud')
for j=1:N
    tp1=complex(0);
    tp2=complex(0);
    
    for n=1:N
        tp1=tp1+g(k(n),kvalues,sg(1))*exp( 1i*( k(n)*x(j) ) )*dk;
        tp2=tp2+g(k(n),kvalues,sg(2))*exp( 1i*( k(n)*x(j) ) )*dk;
    end
    
    y1(j)=tp1;
    prob1(j)=norm(y1(j));
    y2(j)=tp2;
    prob2(j)=norm(y2(j));
end

disp('(4/5) Normalizando probabilidad')

C1=0;
C2=0;
for i=1:N
    C1=C1+prob1(i)*dx;
    C2=C2+prob2(i)*dx;
end
K1=1/C1;
K2=1/C2;

disp('(5/5) Mostrando resultados')

subplot(1,2,1)
plot(x,K1*prob1,'b')
hold on
plot(x,K2*prob2,'r')

xlabel('x (m)')
ylabel('Probabilidad (Partes por 1)')
title('Distribucion de probabilidad')
legend('Distribucion de probabilidad A','Distribucion de probabilidad B')
hold off

subplot(1,2,2)
plot(k,g(k,kvalues,sg(1)),'b')
hold on
plot(k,g(k,kvalues,sg(2)),'r')

xlabel('k (1/m)')
ylabel('Amplitud (m)')
title('Distribucion espectral')
legend('Distribucion espectral A','Distribucion espectral B')

