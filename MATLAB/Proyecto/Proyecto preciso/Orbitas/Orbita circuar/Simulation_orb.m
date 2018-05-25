clear all
%Condiciones iniciales
%s=input('Arista del cubo = ');
s=10;

k=8.9875517873681764*10^9;
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

B=[0,1,0]*10^1;
E0=k*qa*qb/((norm(rb-ra)))+(0.5*ma*(norm(va))^2)+(0.5*mb*((norm(vb))^2));
%Tiempo de simulación
N=2000;
tf=input('Tiempo de simulación = ');
t=linspace(0,tf,N);
dt=t(2)-t(1);
for i=1:N-1
    
    %Fuerza que sufre cada partícula
    Fta=Fc(qa,qb,ra,rb)+Fl(qa,va,B);
    Ftb=Fc(qb,qa,rb,ra)+Fl(qb,vb,B);
    %Aceleración de cada partícula
    aax=Fta(1)/ma;
    aay=Fta(2)/ma;
    aaz=Fta(3)/ma;
    
    abx=Ftb(1)/mb;
    aby=Ftb(2)/mb;
    abz=Ftb(3)/mb;
    %Velocidad de cada partícula
    vax=vax+aax*dt;
    vay=vay+aay*dt;
    vaz=vaz+aaz*dt;
    
    vbx=vbx+abx*dt;
    vby=vby+aby*dt;
    vbz=vbz+abz*dt;
    
    %Posición de cada particula
    rax(i+1)=rax(i)+vax*dt;
    ray(i+1)=ray(i)+vay*dt;
    raz(i+1)=raz(i)+vaz*dt;

    
    van=col(rax(i+1),ray(i+1),raz(i+1),vax,vay,vaz,s);
    vax=van(1);
    vay=van(2);
    vaz=van(3);
    
    rbx(i+1)=rbx(i)+vbx*dt;
    rby(i+1)=rby(i)+vby*dt;
    rbz(i+1)=rbz(i)+vbz*dt;
    
    vbn=col(rbx(i+1),rby(i+1),rbz(i+1),vbx,vby,vbz,s);
    
    vbx=vbn(1);
    
    vby=vbn(2);
    vbz=vbn(3);
    
    va=[vax,vay,vaz];
    vb=[vbx,vby,vbz];
    ra=[rax(i+1),ray(i+1),raz(i+1)];
    rb=[rbx(i+1),rby(i+1),rbz(i+1)];
    
    %Test
     test
    %Plot
    figure (1)
    plot3(rax(i+1),ray(i+1),raz(i+1),'.')
    hold on
    plot3(rbx(i+1),rby(i+1),rbz(i+1),'.r')
    axis([-0.5 s+0.5 -0.5 s+0.5 -0.5 s+0.5])
    hold off
    grid
end
figure (2)
for j=1:N-1
x(j)=t(j+1);
end
plot(x,E1)
hold on
plot(x,E2,'r')
grid
plot(x,E1+E2,'g')
legend('Ep','Ec','Et')
xlabel('Tiempo(s)')
ylabel('Energía (J)')
hold off
disp('Energia Media = ')
disp(mean(E1+E2))
disp('Energia inicial = ')
disp(E0)
grid
figure (1)
    plot3(rax,ray,raz,'-')
    hold on
    plot3(rbx,rby,rbz,'-r')
    plot3(rax(i+1),ray(i+1),raz(i+1),'.')
    plot3(rbx(i+1),rby(i+1),rbz(i+1),'.r')
    axis([-0.5 s+0.5 -0.5 s+0.5 -0.5 s+0.5])
    xlabel('Eje x')
    ylabel('Eje y')
    zlabel('Eje z')
    grid on
hold off