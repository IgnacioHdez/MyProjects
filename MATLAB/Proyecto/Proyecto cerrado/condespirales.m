%Condiciones iniciales para una esfera
%s=input('Arista del cubo = ');
s=10;

%Constantes

k=8.9875517873681764*10^9;
g=[0,0,0];

%Características de la partícula A (Azul)

qa=10^-4;
ma=10^-1;
ra=[2,2,8];
va=[0,0,0];
vax=va(1);
vay=va(2);
vaz=va(3);
rax(1)=ra(1);
ray(1)=ra(2);
raz(1)=ra(3);

%Características de la partícula B (Roja)

qb=-10^-4;
mb=10^-1;
rb=[2,2,5.5];
vb=[0,10,0];
vbx=vb(1);
vby=vb(2);
vbz=vb(3);
rbx(1)=rb(1);
rby(1)=rb(2);
rbz(1)=rb(3);

%Campo magnético uniforme

B=[5,0,5]*10^3;

%Tiempo de simulación y número de puntos

N=6500;
tf=6;
%disp('¿Iniciar simulación dinámica?')
%disp('No recomendable para un número de puntos mayor que 2000')
w=1;

t=linspace(0,tf,N);
dt=t(2)-t(1);
ppo=0;

%Energía inicial

E0=k*qa*qb/((norm(rb-ra)))+(0.5*ma*(norm(va))^2)+(0.5*mb*((norm(vb))^2))+ma*norm(g)*raz+mb*norm(g)*rbz;

