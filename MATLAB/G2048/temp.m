if n==1
    tic
end
if n==2
    timant=toc;
    tim=toc;
    tic
end
if n>2 && n<15
    
clc

disp('Porcentaje')
disp(fix(n/nmax*1000)/10)

timant=(((n-1)*timant+tim)/n);
tim=toc;
tempo=(((n-1)*timant+tim)/n)*(nmax-n);
tic
end
if n>=15
clc

disp('Porcentaje')
disp(fix(n/nmax*1000)/10)

timant=(((n-1)*timant+tim)/n);
tim=toc;
tempo=(((n-1)*timant+tim)/n)*(nmax-n);
disp('Tiempo:')
ho=fix(tempo/3600);
mi=fix(tempo/60-ho*3600);
se=fix(tempo-mi*60-ho*3600);
disp([ho,mi,se])
tic
end