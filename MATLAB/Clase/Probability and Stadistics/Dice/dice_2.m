%Ahora se van a mostrar el número de veces que ocurre cada suceso
n=input('Número de lanzamientos = ');
outcome=zeros(n,1);
x=2:1:12;
%Tirada de dados
for i=1:n
d1=(ceil(rand*6));
d2=(ceil(rand*6));
s=d1+d2;
%El resultado se añade en el hueco de la matriz outcome, asi cuento cuantas
%veces sale cada valor
outcome(i)=s;
%comprobamos el número de veces que se repite el vasor s
end
%Ahora calculamos la probabilidad de cada valor
hist(outcome,x,1)
%Ahora se muestra graficamnte
xlabel('sum')
ylabel('prob')
title('the two rolling dice')
