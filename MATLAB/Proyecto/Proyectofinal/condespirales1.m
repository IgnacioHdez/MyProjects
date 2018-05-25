%CONDICIONES INICIALES: ESPIRALES 1

%--Arista de la caja--

s=10;

%--Constantes--

k=8.9875517873681764*10^9;

%--Caracter�sticas de la part�cula A (Azul)--

qa=10^-4;
ma=10^-1;
ra=[3,1,8];
va=[0,0,0];
vax=va(1);
vay=va(2);
vaz=va(3);
rax(1)=ra(1);
ray(1)=ra(2);
raz(1)=ra(3);

%--Caracter�sticas de la part�cula B (Roja)--

qb=-10^-4;
mb=10^-1;
rb=[3,1,5.5];
vb=[0,10,0];
vbx=vb(1);
vby=vb(2);
vbz=vb(3);
rbx(1)=rb(1);
rby(1)=rb(2);
rbz(1)=rb(3);

%--Campo magn�tico uniforme--

B=[5,0,5]*10^3;

%--Tiempo de simulaci�n y n�mero de puntos--

N=20000;
tf=6;
t=linspace(0,tf,N);
dt=(t(2)-t(1));

%--Simulacion--
%Si w=1 Se inicia la simulacion de la trayectoria
%Si w=0 Se muestra la trayectoria final sin hacer la simulacion

w=0;

%--Porcentaje inicial de simulacion completado--

ppo=0;

%Energ�a inicial

E0=k*qa*qb/((norm(rb-ra)))+(0.5*ma*(norm(va))^2)+(0.5*mb*((norm(vb))^2));

