clear all
close all
clc

x=importdata('muelle.txt');

n=1000;

for (i=1:n)
tx(i)=x(i,1);
x1(i)=x(i,2);
x2(i)=x(i,3);
end
t=linspace(0,5,n);
c1=1;
c2=1;
c3=1;
c4=1;
x1t=c1*cos(t)+c2*sin(t)+c3*cos(sqrt(3)*t)+c4*sin(sqrt(3)*t);
 



figure (1)
hold on
grid on
title('VELOCIDAD')
plot(tx,x1,'b')
plot(tx,x2,'r')
%plot(t,x1t,'k')
xlabel('Tiempo ( seg ) ')
ylabel('Velocidad (metros/seg) ')
legend(' x1','x2','x1 teorico')
hold off