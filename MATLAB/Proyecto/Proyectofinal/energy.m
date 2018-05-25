%energy

%Energía total del sistema

raf=[rax(i+1),ray(i+1),raz(i+1)];
rbf=[rbx(i+1),rby(i+1),rbz(i+1)];

Ep=k*qa*qb/((norm(rbf-raf)));
Ec=(0.5*ma*(norm(va))^2)+(0.5*mb*((norm(vb))^2));

E1(i)=Ep;
E2(i)=Ec;
Et(i)=Ep+Ec;

%Energia de la particula A

Eca=(0.5*ma*(norm(va))^2);
Eta(i)=Eca+Ep;

%Energía de la particula B

Ecb=(0.5*mb*(norm(vb))^2);
Etb(i)=Ecb+Ep;
