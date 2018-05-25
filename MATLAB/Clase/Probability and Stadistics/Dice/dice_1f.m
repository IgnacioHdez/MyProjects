%Se evalua la probabilidad de que se den varias veces la suma de dos valore
%s al sumar dos dados
possum=2:1:12;
outcome=zeros(11,1);
%Tirada de dados
for i=1:n
d1=(ceil(rand*6));
d2=(ceil(rand*6));
s=d1+d2;
%El resultado se añade en el hueco de la matriz outcome, asi cuento cuantas
%veces sale cada valor
outcome(s-1)=outcome(s-1)+1;
%comprobamos el número de veces que se repite el vasor s
end
%Ahora calculamos la probabilidad de cada valor
outcome=outcome./n;
%Ahora se muestra graficamnte
plot(possum,outcome)