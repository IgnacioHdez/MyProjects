clear all
disp('---')
p=input('Número de puntos (Recomendos 100) = ');
disp('---')
r=input('Número de repeticiones (Recomendadas 10) = ');
for y=1:r
for t=1:r
    A(t)=npif(p);
end
npi(1,y)=mean(A);
x=1:r;
plot(0,A,'.b')
axis([-0.1,0.1,0,4])
hold on
end
plot(0,pi,'.r')
legend('Medias','Número pi')
npi=mediaf(npi);
displ
hold off