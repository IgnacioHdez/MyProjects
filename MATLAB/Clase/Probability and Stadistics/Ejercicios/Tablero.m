clear all
n=input('N�mero de particiones = ');
mmax=input('N�mero m�ximo de puntos = ');
for m=1:mmax
sq=zeros(n,n);
f=0;
    for i=1:m
        x=randi(n);
        y=randi(n);
        sq(x,y)=sq(x,y)+1;
    end
    for h=1:n
        for j=1:n
            if sq(h,j)~=0
                f=f+1;
            end
        end
        g(i)=f;
    end
figure(1)
plot(m,n^2-f,'.b')
hold on
xlabel('Puntos lanzados')
ylabel('Casillas vac�as')
t(m)=max(max(sq));
end
%tf=max(t);
%disp(tf)
hold off