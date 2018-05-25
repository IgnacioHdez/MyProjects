b=[7,9,11,13,15,17,19,21];
T=[16,18,20,21,23,19,17,16];
p=polyfit(b,T,2);
x=7:0.01:21;
y=p(1).*x.^2+p(2).*x+p(3);
plot(x,y,'r')
hold on
plot(b,T,'bo')
hold off