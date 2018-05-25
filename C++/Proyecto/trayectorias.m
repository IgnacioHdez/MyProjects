clear all
system('sim.exe');
disp('Importando datos')
R=importdata('Plot/R.txt');
V=importdata('Plot/V.txt');
G=6.6738e-11;
for i=1:max(size(R))
    x1(i)=R(i,1); z1(i)=R(i,3); y1(i)=R(i,2);
    x2(i)=R(i,4); y2(i)=R(i,5); z2(i)=R(i,6);
    x3(i)=R(i,7); y3(i)=R(i,8); z3(i)=R(i,9); 
    x4(i)=R(i,10); y4(i)=R(i,11); z4(i)=R(i,12);
    x5(i)=R(i,13); y5(i)=R(i,14); z5(i)=R(i,15);
    vx1(i)=V(i,1); vy1(i)=V(i,2); vz1(i)=V(i,3);
    vx2(i)=V(i,4); vy2(i)=V(i,5); vz2(i)=V(i,6);
    vx3(i)=V(i,7); vy3(i)=V(i,8); vz3(i)=V(i,9);
    vx4(i)=V(i,10); vy4(i)=V(i,11); vz4(i)=V(i,12);
    vx5(i)=V(i,13); vy5(i)=V(i,14); vz5(i)=V(i,15);
    v=[vx2(i),vy2(i),vz2(i)];
    r1=[x1(i),y1(i),z1(i)];
    r2=[x2(i),y2(i),z2(i)];
    r3=[x3(i),y3(i),z3(i)];
    r4=[x4(i),y4(i),z4(i)];
    r5=[x5(i),y5(i),z5(i)];
    Ec(i)=0.5*1.08e23*norm(v)^2;
    Ep(i)=-G*1.08e23*(1.899e27/norm(r2-r1)+1.48e023/norm(r2-r3)+4.8e022/norm(r2-r4)+8.94e022/norm(r2-r5));
end

disp('Ploteando')
plot3(0,0,0);

for i=1:max(size(R))
    figure(1)
plot3(x1(i),y1(i),z1(i),'k.')
hold on
plot3(x2(i),y2(i),z2(i),'g.')
plot3(x3(i),y3(i),z3(i),'b.')
plot3(x4(i),y4(i),z4(i),'r.')
plot3(x5(i),y5(i),z5(i),'m.')
hold off
axis([-1e9,1e9,-1e9,1e9,-1e8,1e8])
end

hold on
plot3(x1,y1,z1,'.k')
plot3(x2,y2,z2,'g')
plot3(x3,y3,z3,'b')
plot3(x4,y4,z4,'r')
plot3(x5,y5,z5,'m')
hold off
figure (2)
t=linspace(0,1000000,5e5/2000);
plot(t,Ec,'r')
hold on
plot(t,Ep,'b')
plot(t,Ep+Ec,'g')
hold off