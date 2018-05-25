Tablero
for i=1:m
    if n^2-g(i)==0
        g(i)=n^2-1;
    end
end
t=log((n^2-g));
a=polyfit(1:m,t,1);
figure(2)
hold off
plot(1:m,a(1)*(1:m)+a(2),'r.')
hold on
plot(1:m,t)
figure(1)
hold on
plot(1:m,exp((1:m)*a(1)+a(2)),'r.')
axis([0 mmax 0 n^2])
hold off