clear all
close all
hold off
pos=[0,0];
figure (1)
subplot(1,2,2);
plot(0,0,'+k')
subplot(1,2,1);
plot(0,0,'+k')
hold on
n=input('Número máximo de movimientos = ');
for i=1:n
for j=1:n
dir=randi(4);
    if dir==1
        pos(1,1)=pos(1,1)+1;
    elseif dir==2
        pos(1,2)=pos(1,2)+1;
    elseif dir==3
        pos(1,1)=pos(1,1)-1;
    elseif dir==4
        pos(1,2)=pos(1,2)-1;
    end
    r(i,1)=sqrt(pos(1,1)^2+pos(1,2)^2);
end
figure (1)
f=1:i;
    subplot(1,2,2);
    plot(f,r,'.b')
    xlabel('Número de movimientos')
    ylabel('Distancia al origen')
    subplot(1,2,1);
    plot(pos(1,1),pos(1,2),'or')
    xlabel('Posición')
    hold on
end
hold off
