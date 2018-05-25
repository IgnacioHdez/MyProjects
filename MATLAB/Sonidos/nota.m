function nota(n,temp)
%Frecuencia del do
f=440*2^(n/12);
%Duración de un tiempo en segundos
%Generacion de la nota
t=0:0.0001:temp;
snd1=cos(2*pi*f*t);
%Reproduccion
sound(snd1,10000)
pause(temp)
end
