x=importdata('x.txt');
y1=importdata('yeu.txt');
y2=importdata('yrk.txt');
y3=importdata('ytc.txt');
plot(x,y1,'.g')
hold on
plot(x,y2,'.')
plot(x,y3,'r')
legend('Euler','Runge Kutta','Teorico')
hold off