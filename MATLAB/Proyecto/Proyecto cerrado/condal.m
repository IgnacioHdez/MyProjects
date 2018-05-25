%Condiciones iniciales para una esfera
%s=input('Arista del cubo = ');
s=5;

%Constantes

k=8.9875517873681764*10^9;
g=[0,0,-9.8];

%Características de la partícula A (Azul)

qa=4*rand*(-1)^(randi(2))*10^(-4);
ma=rand*2;
ra=[rand*s,rand*s,rand*s];
va=[rand*s*(-1)^(randi(2)),rand*s*(-1)^(randi(2)),rand*s*(-1)^(randi(2))]*2;
vax=va(1);
vay=va(2);
vaz=va(3);
rax(1)=ra(1);
ray(1)=ra(2);
raz(1)=ra(3);

%Características de la partícula B (Roja)

qb=5*rand*10^-1*(-1)^(randi(2))*10^(-3);
mb=rand*2;
rb=[rand*s,rand*s,rand*s];
vb=[rand*s*(-1)^(randi(2)),rand*s*(-1)^(randi(2)),rand*s*(-1)^(randi(2))]*2;
vbx=vb(1);
vby=vb(2);
vbz=vb(3);
rbx(1)=rb(1);
rby(1)=rb(2);
rbz(1)=rb(3);

%Campo magnético uniforme

B=[rand*(-1)^(randi(2)),rand*(-1)^(randi(2)),rand*(-1)^(randi(2))]*100;

%Tiempo de simulación y número de puntos

N=3000;
tf=2;
%disp('¿Iniciar simulación dinámica?')
%disp('No recomendable para un número de puntos mayor que 2000')
w=1;
t=linspace(0,tf,N);
dt=t(2)-t(1);
ppo=0;

%Energía inicial

E0=k*qa*qb/((norm(rb-ra)))+(0.5*ma*(norm(va))^2)+(0.5*mb*((norm(vb))^2))+ma*norm(g)*raz+mb*norm(g)*rbz;

