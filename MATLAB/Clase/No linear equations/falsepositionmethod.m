%Hace lo mismo que la biseccion pero calcula la recta que va de a a b y
%mira a ver si esta recta corta con el eje x
eps1=1.e-5;
eps2=1.e-5;
a=1;
fa=exp(a)*log(a)-a*a;
b=2;
fb=exp(b)*log(b)-b*b;
nmax=100;
diff=b-a;
for j=1:nmax
    if (diff<=eps1)
        break
    else
        m=(a*fb-b*fa)/(fb-fa);
        fm=exp(m)*log(m)-m*m;
        afm=abs(fm);
        if afm<=eps2
            break
        elseif (fm*fb)<0
            a=m;
            fa=fm;
        else
            b=m;
            fb=fm;
        end
    end
end
root=m;
root
fatroot=fm;
fatroot
j
%Plot
x=1:0.01:2;
fx=exp(x).*log(x)-x.*x;
plot(x,fx)
grid
      