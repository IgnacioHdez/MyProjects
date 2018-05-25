t=linspace(0,tf,N);
dt=t(2)-t(1);
ppo=0;
for i=1:N-1
    
    %--Fuerza que sufre cada partícula--
    
    Fta=Fc(qa,qb,ra,rb)+Fl(qa,va,B)+g*ma;
    Ftb=Fc(qb,qa,rb,ra)+Fl(qb,vb,B)+g*mb;
    
    %--Aceleración de cada partícula--
    
    aax=Fta(1)/ma;
    aay=Fta(2)/ma;
    aaz=Fta(3)/ma;
    
    abx=Ftb(1)/mb;
    aby=Ftb(2)/mb;
    abz=Ftb(3)/mb;
    
    %--Velocidad de cada partícula--
    
    vax=vax+aax*dt;
    vay=vay+aay*dt;
    vaz=vaz+aaz*dt;
    
    vbx=vbx+abx*dt;
    vby=vby+aby*dt;
    vbz=vbz+abz*dt;
    
    %--Posición de cada particula--
    
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
    
    %--Test sobre la energia--
    
     energy
     
    %--Plot--
    
     if w==1
        instantplot
     end
    
    %--Porcentaje--
    
    porc
        
end