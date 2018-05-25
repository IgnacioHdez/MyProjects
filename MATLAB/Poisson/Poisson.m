clear all
%Tiempo de experimento
t0=0;
tf=1;
T=tf-t0;
%Número de subdivisiones y vector de tiempo
M=25;
t=linspace(t0,tf,M);
dt=T/M;
%Número medio de espigas en un tiempo tf-t0
n=randi(M);
%Densidad de probabilidad homogenea (n/T)
r=n/T;
% Genero el modelo que luego buscare con la densidad de probabilidad r
fmodel=zeros(1,n);

for i=1:M;
    
    if rand<r*dt
        fmodel(i)=1;
    else
        fmodel(i)=0;
    end
    
end

% Voy a buscar cuantas secuencias son iguales al modelo

tries=100000;
positivo=0;

for j=1:tries 
    
for i=1:M;
    if rand<r*dt
        f(i)=1;
    else
        f(i)=0;
    end
end

if sum(f)==sum(fmodel)
positivo=positivo+1;
end

p(j)=positivo/j;
end

%solucion numerica
%Probablididad hallada de modo numerico
disp(n)
plot(p)
disp(p(tries))
%solucion teorica
p2=(((r*T)^n)/factorial(n))*exp(-r*T);
hold on
g=0:10:tries;
plot(g,p2,'r-.')
axis([0,tries,0,1])
hold off
disp(abs(p(tries)-p2)*p2*100)