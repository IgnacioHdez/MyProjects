function [x,y]=eulerint(x0,y0,parametros,tf,N,pruido,ruido)
t=linspace(0,tf,N);
x(1)=x0;
y(1)=y0;
dt=t(2)-t(1);
for i=2:N
    x(i)=x(i-1)+vx(x(i-1),y(i-1),t(i-1),parametros)*dt; 
    y(i)=y(i-1)+vy(x(i-1),y(i-1),t(i-1),parametros)*dt;
    
%     if i>N/2 && s==0
%         x(i)=0;
%         s=1;
%     end

    if rand<pruido
        x(i)=x(i)-ruido*x(i);
    end
    if rand<pruido
        y(i)=y(i)-ruido*y(i);
    end
    if rand<pruido
        x(i)=x(i)+ruido*x(i);
    end
    if rand<pruido
        y(i)=y(i)+ruido*y(i);
    end
end
end