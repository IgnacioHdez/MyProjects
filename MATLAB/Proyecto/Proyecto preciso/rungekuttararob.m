for j=1:N-1
    
    %-----Fuerza que sufre cada partícula-----
    
    Fta=Fc(qa,qb,ra,rb)+Fl(qa,va,B);%+g*ma;
    Ftb=Fc(qb,qa,rb,ra)+Fl(qb,vb,B);%+g*mb;
    
    %-----Aceleración de cada partícula-----
    
    aax=Fta(1)/ma;
    aay=Fta(2)/ma;
    aaz=Fta(3)/ma;
    
    abx=Ftb(1)/mb;
    aby=Ftb(2)/mb;
    abz=Ftb(3)/mb;
    
    %-----Posición media de la partícula-----
    
    %Partícula A    
    raxm=rax(i)+vax*dtb/2;
    raym=ray(i)+vay*dtb/2;
    razm=raz(i)+vaz*dtb/2;
    %Partícula B
    rbxm=rbx(i)+vbx*dtb/2;
    rbym=rby(i)+vby*dtb/2;
    rbzm=rbz(i)+vbz*dtb/2;
    
        
    %-----Velocidad en el punto medio de la trayectoria-----
    
    %Velocidad media de A
    vaxm=vax+aax*dtb/2;
    vaym=vay+aay*dtb/2;
    vazm=vaz+aaz*dtb/2;
    %--Colisión A--
    vanm=col(raxm,raym,razm,vaxm,vaym,vazm,s);
    vaxm=vanm(1);
    vaym=vanm(2);
    vazm=vanm(3);
    %Velocidad media de B
    vbxm=vbx+abx*dtb/2;
    vbym=vby+aby*dtb/2;
    vbzm=vbz+abz*dtb/2;
    %--Colision B--
    vbnm=col(rbxm,rbym,rbzm,vbxm,vbym,vbzm,s);
    vbxm=vbnm(1);
    vbym=vbnm(2);
    vbzm=vbnm(3);
    
    %Recogemos los datos medios
    
    vam=[vaxm,vaym,vazm];
    vbm=[vbxm,vbym,vbzm];
    ram=[raxm,raym,razm];
    rbm=[rbxm,rbym,rbzm];
    
    %-----Fuerza que sufre cada partícula en el punto medio-----
    
    Ftam=Fc(qa,qb,ram,rbm)+Fl(qa,vam,B);%+g*ma;
    Ftbm=Fc(qb,qa,rbm,ram)+Fl(qb,vbm,B);%+g*mb;
    
    %-----Aceleración de cada partícula en el punto medio-----
    
    aaxm=(Ftam(1)/ma);
    aaym=(Ftam(2)/ma);
    aazm=(Ftam(3)/ma);
    
    abxm=(Ftbm(1)/mb);
    abym=(Ftbm(2)/mb);
    abzm=(Ftbm(3)/mb);
    
    
    %-----Velocidad de cada partícula-----
    
    vax=vax+aaxm*dtb;
    vay=vay+aaym*dtb;
    vaz=vaz+aazm*dtb;
    
    vbx=vbx+abxm*dtb;
    vby=vby+abym*dtb;
    vbz=vbz+abzm*dtb;
    
    %-----Posición de cada particula-----
    
    rax(i+1)=raxm+vax*dtb/2;
    ray(i+1)=raym+vay*dtb/2;
    raz(i+1)=razm+vaz*dtb/2;

    
    van=col(rax(i+1),ray(i+1),raz(i+1),vax,vay,vaz,s);
    vax=van(1);
    vay=van(2);
    vaz=van(3);
    
    rbx(i+1)=rbxm+vbx*dtb/2;
    rby(i+1)=rbym+vby*dtb/2;
    rbz(i+1)=rbzm+vbz*dtb/2;
    
    vbn=col(rbx(i+1),rby(i+1),rbz(i+1),vbx,vby,vbz,s);
    
    vbx=vbn(1);
    vby=vbn(2);
    vbz=vbn(3);
    
    va=[vax,vay,vaz];
    vb=[vbx,vby,vbz];
    ra=[rax(i+1),ray(i+1),raz(i+1)];
    rb=[rbx(i+1),rby(i+1),rbz(i+1)];
    
    
    
    %--Test sobre la energia--
    
%     energyb
     
    %--Plot--
    
%      if w==1
%         instantplot
%      end
    
    %--Porcentaje--
    
     porc
        
end
 