%Condiciones iniciales para una esfera
%s=input('Arista del cubo = ');
s=10;

%Constantes

k=8.9875517873681764*10^9;
g=[0,0,0];

%Caracter�sticas de la part�cula A (Azul)

qa=1*10^-4;
ma=1*10^0;
ra=[5,5,2];
va=[0,-4,1]*10^1;
vax=va(1);
vay=va(2);
vaz=va(3);
rax(1)=ra(1);
ray(1)=ra(2);
raz(1)=ra(3);

%Caracter�sticas de la part�cula B (Roja)

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

%Campo magn�tico uniforme

B=[0,1,1]*10^4;

%Tiempo de simulaci�n y n�mero de puntos

N=15000;
tf=10;
%disp('�Iniciar simulaci�n din�mica?')
%disp('No recomendable para un n�mero de puntos mayor que 2000')
w=0;

t=linspace(0,tf,N);
dt=t(2)-t(1);
ppo=0;

%Energ�a inicial

E0=k*qa*qb/((norm(rb-ra)))+(0.5*ma*(norm(va))^2)+(0.5*mb*((norm(vb))^2))+ma*norm(g)*raz+mb*norm(g)*rbz;