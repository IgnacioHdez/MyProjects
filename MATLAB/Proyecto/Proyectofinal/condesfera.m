%CONDICIONES INICIALES: ESFERA

%--Arista de la caja--

s=10;

%--Constantes--

k=8.9875517873681764*10^9;

%--Características de la partícula A (Azul)--

qa=1*10^-4;
ma=1*10^0;
ra=[5,5,2];
va=[0,-4,0]*10^1;
vax=va(1);
vay=va(2);
vaz=va(3);
rax(1)=ra(1);
ray(1)=ra(2);
raz(1)=ra(3);

%--Características de la partícula B (Roja)--

qb=-5*10^-3;
mb=1000000;
rb=[5,5,5];
vb=[0,0,0]*10^1;
vbx=vb(1);
vby=vb(2);
vbz=vb(3);
rbx(1)=rb(1);
rby(1)=rb(2);
rbz(1)=rb(3);

%--Campo magnético uniforme--

B=-[1,1,1]*10^4;

%--Tiempo de simulación y número de puntos--

N=5000;
tf=10;
t=linspace(0,tf,N);
dt=t(2)-t(1);

%--Simulacion--
%Si w=1 Se inicia la simulacion de la trayectoria
%Si w=0 Se muestra la trayectoria final sin hacer la simulacion

w=0;

%--Porcentaje inicial de simulacion completado--

ppo=0;

%--Energía inicial--

E0=k*qa*qb/((norm(rb-ra)))+(0.5*ma*(norm(va))^2)+(0.5*mb*((norm(vb))^2));