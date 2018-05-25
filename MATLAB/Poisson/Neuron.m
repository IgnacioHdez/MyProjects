clear all
t0=0;
tf=0.5;
N=100000;
t=linspace(t0,tf,N);
dt=t(2)-t(1);
V0=-0.03;
V(1,1)=-0.02;
V(2,1)=-0.02;
Vinh=-0.08;
Ie=0.001;
Rm=9*10^6;
ginh=1;
ginh2=1;
tm=0.03;
Vs=-0.05;
tg=0.5;
Vr=-0.0065;
for i=1:N
    V(1,i+1)=V(1,i)+(V0-V(1,i)+Ie*Rm-ginh*(V(2,i)-Vinh))/tm*dt;
    V(2,i+1)=V(2,i)+(V0-V(2,i)+Ie*Rm-ginh*(V(1,i)-Vinh))/tm*dt;
    if V(1,i+1)>Vs
        V(1,i)=-0.1;
        V(1,i+1)=Vr;
        ginh=ginh+0.1;
    end
    if V(2,i+1)>Vs
        V(2,i)=-0.1;
        V(2,i+1)=Vr;
        ginh=ginh+0.1;
    end
    ginh=ginh-ginh*dt/tg;
end
for j=1:N
    v1(j)=V(1,j);
    v2(j)=V(2,j);
end
plot(t,v1,'-')