clear all
na=5000;
a=linspace(-2,2,na);
b=1;
N=100;
tf=10;
pruido=0;
ruido=0.05;
x0=3;
y0=3;

for j=1:na
p=[a(j),b];
[x,y]=eulerint(x0,y0,p,tf,N,pruido,ruido); 
xeq(j)=mean(x);
yeq(j)=mean(y);
x0=mean(x);
y0=mean(y);
end

plot(a,xeq)
hold on
plot(a,yeq,'r')
hold off
legend('xeq','yeq')
xlabel ('a')
ylabel('x,y')

clear all

na=200;
a=linspace(2,-2,na);
b=0.5;
N=1000;
tf=20;
pruido=0;
ruido=0.05;
x0=3;
y0=3;
for j=1:na
p=[a(j),b];
[x,y]=eulerint(x0,y0,p,tf,N,pruido,ruido); 
xeq(j)=mean(x);
yeq(j)=mean(y);
x0=mean(x);
y0=mean(y);
end

hold on
plot(a,xeq,'g')
plot(a,yeq,'k')
hold off
legend('xeq','yeq')
