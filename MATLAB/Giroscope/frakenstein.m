clear all
N=100000;
t=linspace(0,5,N);
dt=t(2)-t(1);
m=10;
l1=1.2;
l2=0.3;
d=0.3;
g=9.8;
torque=-8.5;
rot(1)=0;
pre(1)=0;
nut(1)=90*(pi/180);
wrot(1)=30;
wnut(1)=0;
%wpre(1)=0;
wpre(1)=(-m*g*d/(l1-l2))/wrot;

for i=2:N
wrot(i)=wrot(i-1)+arot(rot(i-1),pre(i-1),nut(i-1),wrot(i-1),wnut(i-1),wpre(i-1),l1,l2,g,m,torque,d)*dt;
wpre(i)=wpre(i-1)+apre(rot(i-1),pre(i-1),nut(i-1),wrot(i-1),wnut(i-1),wpre(i-1),l1,l2,g,m,torque,d)*dt;
wnut(i)=wnut(i-1)+anut(rot(i-1),pre(i-1),nut(i-1),wrot(i-1),wnut(i-1),wpre(i-1),l1,l2,g,m,torque,d)*dt;

rot(i)=rot(i-1)+wrot(i-1)*dt;
pre(i)=pre(i-1)+wpre(i-1)*dt;
nut(i)=nut(i-1)+wnut(i-1)*dt;

%if i>N/4 && i<3*N/4
%    torque=-5;
%end
%if i>3*N/4
%    torque=0;
%end
end

% for i=1:N
% xp=d*sin(nut(i))*cos(pre(i));
% yp=d*sin(nut(i))*sin(pre(i));
% zp=d*cos(nut(i)); 
% figure(1)
% plot3(xp,yp,zp,'.')
% axis([-0.3 0.3 -0.3 0.3 -0.3 0.3])
% end
figure (1)
x=sin(nut).*cos(pre);
y=sin(nut).*sin(pre);
z=cos(nut);
plot3(x,y,z)
hold on
plot3(x(1),y(1),z(1),'.r')
axis equal
%axis ([-1 1 -1 1 -1 1])
grid on
hold off
figure (2)
plot(t,z)
grid on
figure (3)
plot(t,nut)
grid on