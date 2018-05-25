%CONDICIONES INICIALES: INTERACCION POSITRON-ELECTRON

%--Arista de la caja--

s=2*10^-6;

%--Constantes--

k=8.9875517873681764*10^9;

%--Características de la partícula A (Azul)--

qa=-1.6*10^-19;
ma=9.1*10^-31;
ra=[0.5,1.5,1.5]*10^-6;
va=[1,0,0]*10^4;
vax=va(1);
vay=va(2);
vaz=va(3);
rax(1)=ra(1);
ray(1)=ra(2);
raz(1)=ra(3);

%--Características de la partícula B (Roja)--

qb=1.6*10^-19;
mb=9.1*10^-31;
rb=[0.5,1.9,1.5]*10^-6;
vb=[-1,0,0]*10^4;
vbx=vb(1);
vby=vb(2);
vbz=vb(3);
rbx(1)=rb(1);
rby(1)=rb(2);
rbz(1)=rb(3);

%--Campo magnético uniforme--

B=-1*[1,1,1]*10^-1;

%--Tiempo de simulación y número de puntos--

N=20000;
tf=6*10^-10;
t=linspace(0,tf,N);
dt=(t(2)-t(1));

%--Simulacion--
%Si w=1 Se inicia la simulacion de la trayectoria
%Si w=0 Se muestra la trayectoria final sin hacer la simulacion

w=0;

%--Porcentaje de simulacion completo--

ppo=0;

%--Energía--

E0=k*qa*qb/((norm(rb-ra)))+(0.5*ma*(norm(va))^2)+(0.5*mb*((norm(vb))^2));

