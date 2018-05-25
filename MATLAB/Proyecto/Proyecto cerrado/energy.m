%energy
raf=[rax(i+1),ray(i+1),raz(i+1)];
rbf=[rbx(i+1),rby(i+1),rbz(i+1)];

Ep=k*qa*qb/((norm(rbf-raf)));
Ec=(0.5*ma*(norm(va))^2)+(0.5*mb*((norm(vb))^2));
%Eg=ma*norm(g)*raz(i+1)+mb*norm(g)*rbz(i+1);
%vma=(Fl(qa,va,B)/ma)*dt;
%vmb=(Fl(qb,vb,B)/mb)*dt;
%Em=-0.5*ma*norm(vma)^2-0.5*mb*norm(vmb)^2;

E1(i)=Ep;
E2(i)=Ec;
%E3(i)=Eg;
%E4(i)=Em;
Et(i)=Ep+Ec;%+Eg+Em;