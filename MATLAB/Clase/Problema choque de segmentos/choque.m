close all
clear all
cA=[0,0];
A1=[0.5,0];
A2=[-0.5,0];
d=3;
phi=0;
alpha=input('Orientación del segundo segmento=');
alpha=alpha*pi/180;
npts=input('Número de repeticiones=');
n=1;
pc=[0,0];
for r=linspace(0,2*pi,npts)
x=d*cos(phi);
y=d*sin(phi);
for i=linspace(0,d,npts)
 cB=[x,y];
 B2=[x+0.5*cos(alpha),y+0.5*sin(alpha)];
 B1=[x-0.5*cos(alpha),y-0.5*sin(alpha)];
 col=bar2(B1,B2,A1,A2,alpha);
    if col==1
        pc(n,1)=x;
        pc(n,2)=y;
        n=n+1;
    end
 x=x-(d/npts)*cos(phi);
 y=y-(d/npts)*sin(phi);
end
phi=phi+2*pi/npts;
end
pc;
s=size(pc);
for h=1:s(1,1)
    hold on
plot(pc(h,1),pc(h,2),'.')
end