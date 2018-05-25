%Condiciones iniciales para una esfera
%s=input('Arista del cubo = ');
s=5;

%Constantes

k=8.9875517873681764*10^9;
g=[0,0,-0.2];

%Caracter�sticas de la part�cula A (Azul)

qa=-10^-3;
ma=500000;
ra=[2.5,2.5,2.5];
va=[0,0,0];
vax=va(1);
vay=va(2);
vaz=va(3);
rax(1)=ra(1);
ray(1)=ra(2);
raz(1)=ra(3);

%Caracter�sticas de la part�cula B (Roja)

qb=10^-4;
mb=5;
rb=[2.5,1,2.5];
vb=[10,0,0];
vbx=vb(1);
vby=vb(2);
vbz=vb(3);
rbx(1)=rb(1);
rby(1)=rb(2);
rbz(1)=rb(3);

%Campo magn�tico uniforme

B=[5,0,0]*10^4;

%Tiempo de simulaci�n y n�mero de puntos

N=input('N�mero de puntos = ');
tf=input('Tiempo de simulaci�n = ');
disp('�Iniciar simulaci�n din�mica?')
disp('No recomendable para un n�mero de puntos mayor que 2000')
w=input('(1/0) = ');

t=linspace(0,tf,N);
dt=t(2)-t(1);
ppo=0;
%Energ�a inicial

vma=Fl(qa,va,B)/ma*dt;
vmb=Fl(qb,vb,B)/mb*dt;
Em=-0.5*ma*norm(vma)^2-0.5*mb*norm(vmb)^2;
E0=k*qa*qb/((norm(rb-ra)))+(0.5*ma*(norm(va))^2)+(0.5*mb*((norm(vb))^2))+ma*norm(g)*raz+mb*norm(g)*rbz-Em;

