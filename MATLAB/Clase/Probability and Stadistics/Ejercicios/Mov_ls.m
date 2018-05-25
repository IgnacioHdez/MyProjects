Mov
p=polyfit(f,r',2);
y=p(1).*f.^2+p(2).*f+p(3);
hold on
plot(f,y,'r')