clear all
r=input('Número de días = ');
d=input('Dinero del primer día = ');
n=input('Jugadas al día = ');
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