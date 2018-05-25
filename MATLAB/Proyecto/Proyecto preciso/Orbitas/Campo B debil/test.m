%test
raf=[rax(i),ray(i),raz(i)];
rbf=[rbx(i),rby(i),rbz(i)];
k=8.9875517873681764*10^9;
Ep=k*qa*qb/((norm(rbf-raf)));
Ec=(0.5*ma*(norm(va))^2)+(0.5*mb*((norm(vb))^2));
E1(i)=Ep;
E2(i)=Ec;

%p=ma*vva+mb*vvb;
%pp(i)=norm(p);