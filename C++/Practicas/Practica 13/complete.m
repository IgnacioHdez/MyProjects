clear all
close all
t=importdata('t.txt');
x=importdata('posicion.txt');
xtrc=importdata('posiciontrc.txt');
v=importdata('vel.txt');
vtrc=importdata('velocidadtrc.txt');
a=importdata('aceleracion.txt');
atrc=importdata('aceleraciontrc.txt');

figure(1)
plot(t,x,'.')
hold on
plot(t,xtrc,'r')
xlabel('Tiempo(s)')
ylabel('Posici�n (m)')
legend('Resultado','Te�rico')
hold off

figure(2)
plot(t,v,'.')
hold on
plot(t,vtrc,'r')
hold off
xlabel('Tiempo(s)')
ylabel('Velocidad (m/s)')
legend('Resultado','Te�rico')

figure(3)
plot(t,a,'.')
hold on
plot(t,atrc,'r')
hold off
xlabel('Tiempo(s)')
ylabel('Aceleraci�n (m/s^2)')
legend('Resultado','Te�rico')
