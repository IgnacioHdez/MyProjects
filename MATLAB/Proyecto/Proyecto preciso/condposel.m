%Condiciones iniciales para una esfera
%s=input('Arista del cubo = ');
s=2*10^-6;

%Constantes

k=8.9875517873681764*10^9;
%g=[0,0,0];

%Características de la partícula A (Azul)

qa=-1.6*10^-19;
ma=9.1*10^-31;
ra=[0.5,0.5,0.5]*10^-6;
va=[1,0,0]*10^4;

vax=va(1);
vay=va(2);
vaz=va(3);
rax(1)=ra(1);
ray(1)=ra(2);
raz(1)=ra(3);

%Características de la partícula B (Roja)

qb=1.6*10^-19;
mb=9.1*10^-31;
rb=[0.5,0.9,0.5]*10^-6;
vb=[-1,0,0]*10^4;

vbx=vb(1);
vby=vb(2);
vbz=vb(3);
rbx(1)=rb(1);
rby(1)=rb(2);
rbz(1)=rb(3);

%Campo magnético uniforme

B=[0,0,1]*10^-1;

%Tiempo de simulación y número de puntos

% N=input('Número de puntos = ');
% tf=input('Tiempo de simulación = ');
% disp('¿Iniciar simulación dinámica?')
% disp('No recomendable para un número de puntos mayor que 2000')
% w=input('(1/0) = ');

N=1000000;
tf=3.6*10^-10;
w=0;

t=linspace(0,tf,N);
dt=(t(2)-t(1));
ppo=0;

%Energía inicial

E0=k*qa*qb/((norm(rb-ra)))+(0.5*ma*(norm(va))^2)+(0.5*mb*((norm(vb))^2));%+ma*norm(g)*raz+mb*norm(g)*rbz;

