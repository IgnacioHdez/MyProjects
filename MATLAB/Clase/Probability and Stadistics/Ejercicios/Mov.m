clear all
hold off
pos=[0,0];
n=input('N�mero m�ximo de movimientos = ');
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
end
r(i,1)=sqrt(pos(1,1)^2+pos(1,2)^2);
end
f=[1:n];
plot(f,r,'.b')
xlabel('N�mero de movimientos')
ylabel('Distancia al origen')