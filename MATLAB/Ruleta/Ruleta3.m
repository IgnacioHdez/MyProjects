clear all
r=input('N�mero de d�as = ');
d=input('Dinero del primer d�a = ');
n=input('Jugadas al d�a = ');
di=d;
for i=1:r
    g=ruletaf(n,di);
    d=d+g;
    figure(1)
    plot(i,d,'.b')
    hold on
    
end
disp(' ')
disp(d-di)
hold off