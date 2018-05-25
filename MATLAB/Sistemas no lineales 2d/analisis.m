clear all
N=1000;
tf=10;
t=linspace(0,tf,N);
x0=0.5;
y0=0.5;
p=[0.5,1,1];
a12=p(1);
a21=p(2);
r=p(3);
pruido=0;
ruido=0.01;
[x,y]=eulerint(x0,y0,p,tf,N,pruido,ruido);

plot(t,x)
hold on
plot(t,y,'r')

plot(t,1,'k')
 
plot(t,t./t*(1+a12)/(1-a12*a21),'m')
plot(t,t./t*(1+a21)/(1-a12*a21),'g')

hold off
legend('x','y')