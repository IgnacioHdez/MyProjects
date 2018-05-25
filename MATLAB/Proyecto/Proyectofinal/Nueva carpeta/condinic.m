%Condiciones iniciales para una esfera
%s=input('Arista del cubo = ');
s=5;

%Constantes

k=8.9875517873681764*10^9;
%G=6.67384*10^(-11);

%Características de la partícula A (Azul)

qa=10^-1;
ma=10000000;
ra=[2.5,2.5,2.5];
va=[0,0,0];
vax=va(1);
vay=va(2);
vaz=va(3);
rax(1)=ra(1);
ray(1)=ra(2);
raz(1)=ra(3);

%Características de la partícula B (Roja)

qb=5*10^-4;
mb=5;
rb=[2.5,1,2.5];
vb=[10,0,0];
vbx=vb(1);
vby=vb(2);
vbz=vb(3);
rbx(1)=rb(1);
rby(1)=rb(2);
rbz(1)=rb(3);

%Campo magnético uniforme

B=[1,1,1]*10^4;

%Tiempo de simulación y número de puntos


w=1
N=5000;
tf=5;
t=linspace(0,tf,N);
dt=t(2)-t(1);
ppo=0;

%Energía inicial

E0=k*qa*qb/((norm(rb-ra)))+(0.5*ma*(norm(va))^2)+(0.5*mb*((norm(vb))^2));%+G*ma*mb/norm(rb-ra)+G*ma*mb/norm(rb-ra);

