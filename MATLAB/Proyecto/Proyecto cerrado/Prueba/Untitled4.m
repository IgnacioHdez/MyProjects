clear all
close all
%Condiciones iniciales
k=8.9875517873681764*10^9;

cpos
cneg

B=[0,0,0]*10^-6;

E0=
%Tiempo de simulación
N=1000;
tf=input('Tiempo de simulación = ');
t=linspace(0,tf,N);
dt=t(2)-t(1);
for i=1:N-1
    
    %Fuerza que sufre cada partícula
    for forc=1:pos+neg
        Ft(forc)=Fc(
        
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

    
    van=col(rax(i+1),ray(i+1),raz(i+1),vax,vay,vaz);
    vax=van(1);
    vay=van(2);
    vaz=van(3);
    
    rbx(i+1)=rbx(i)+vbx*dt;
    rby(i+1)=rby(i)+vby*dt;
    rbz(i+1)=rbz(i)+vbz*dt;
    
    vbn=col(rbx(i+1),rby(i+1),rbz(i+1),vbx,vby,vbz);
    
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
    axis([-0.5 5.5 -0.5 5.5 -0.5 5.5])
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
hold off
disp('Energia Media = ')
disp(mean(E1+E2))
disp('Energia inicial = ')
disp(E0)
grid
figure (1)
hold on
    plot3(rax,ray,raz,'-')
    plot3(rbx,rby,rbz,'-r')
    axis([-0.5 5.5 -0.5 5.5 -0.5 5.5])
    grid on
hold off