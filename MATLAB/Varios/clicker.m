for i=1:40
    h=treebeast(i);
    prize(i)=h(1);
    dps(i)=h(2);
    dife(i)=h(1)-h(2);
    x(i)=i;  
end
%---------------
figure (1)
plot(x,prize,'-b')
hold on
plot(x,dps,'-r')
plot(x,dife,'-k')
legend('prize','DPS','Diference')
title('Treebeast stadistics')
xlabel('level')
grid on
hold off
%--------------
figure (2)
aprox=log(prize);
p=polyfit(x,aprox,1);
plot(x,aprox,'ob')
hold on
plot(x,p(1)*x+p(2),'r')

