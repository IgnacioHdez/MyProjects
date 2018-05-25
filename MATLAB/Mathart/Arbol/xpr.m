clear all
N=10000;
nt=100;
t=linspace(0,1,nt);
dt=t(2)-t(1);
v=1;
x(1)=v*dt;
for p=0:0.01:100
for j=1:N-1
for i=1:nt-1
    pp=rand*100;
    if pp>=p
        x(i+1)=x(i)+v*dt;
    end
    if pp<p || i==nt-1
        y(j)=x(i);
        break
    end
end
end
plot(p,mean(y),'.')
hold on
end
hold off