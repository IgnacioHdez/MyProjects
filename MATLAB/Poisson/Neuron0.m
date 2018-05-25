clear all
t0=0;
tf=1;
N=100000;
t(1)=t0;
t=linspace(t0,tf,N);
dt=(tf-t0)/N;
Vrest=-0.065;
V(1,1)=Vrest+0.001;
V(2,1)=Vrest;
Vinh=-0.08;
ginh(1,1)=1;
ginh(2,1)=1;
tg=0.01;
Ie=0.5*10^-9;
Rm=9*10^7;
tm=0.1;
Vs=-0.03;
Vr=-0.065;
a1=0;
a2=0;
for i=1:N
    
    V(1,i+1)=V(1,i)+((Vrest-V(1,i)+Ie*Rm-ginh(1,i)*(V(2,i)-Vinh))/tm)*dt;
    V(2,i+1)=V(2,i)+(Vrest-V(2,i)+Ie*Rm-ginh(2,i)*(V(1,i)-Vinh))/tm*dt;
    ginh(1,i+1)=ginh(1,i)-ginh(1,i)*dt/tg;
    ginh(2,i+1)=ginh(2,i)-ginh(2,i)*dt/tg;
    
   if a1==1
        V(1,i+1)=Vr;
        a1=0;
   end
   if a2==1
        V(2,i+1)=Vr;
        a2=0;
   end
    if V(1,i+1)>Vs
        V(1,i+1)=0;
        a1=1;
        ginh(2,i+1)=ginh(1,i)+0.5;
    end
    
    if V(2,i+1)>Vs
        V(2,i+1)=0;
        ginh(1,i+1)=ginh(2,i)+0.5;
        a2=1;
    end

end

for j=1:N
    v1(j)=V(1,j);
    v2(j)=V(2,j);
    g1(j)=ginh(1,j);
    g2(j)=ginh(2,j);
end
figure(1)
plot(t,v1)
hold on
plot(t,v2,'r')
hold off
figure (2)
plot(t,g1)
hold on
plot(t,g2,'r')
hold off