function [pin]=npif(n)
%Creación de los puntos
for i=1:n
    x(1,i)=rand;
    y(1,i)=rand;
end
s=0;
for j=1:n
    d(j)=den(x(1,j),y(1,j));
    s=s+d(j);
end
prob=s/n;
pin=4*prob;
