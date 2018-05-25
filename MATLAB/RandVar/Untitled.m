clear all
%Number of tries
N=10^7;
Xe=0;

for i=1:N
    %Set the prob distribution to P(r)=-1/2*r+1 in Gamma=(0,1)
    Xe(i)=rand;
    Ye(i)=2-2*sqrt(1-rand);
    Ze(i)=Ye(i) +Xe(i);
end

[x,nx]=histcounts(Xe,100);
[y,ny]=histcounts(Ye,100);
[z,nz]=histcounts(Ze,100);

for i=2:max(size(nx))
 mx(i-1)=nx(1)+nx(i);
 my(i-1)=ny(1)+ny(i);
 mz(i-1)=nz(1)+nz(i);
end
plot(mx,x*100/N,'k')
hold on
plot(my,y*100/N,'b')
plot(mz,z*100/N,'r')

plot(mz,-1/4*mz.^2+mz,'g')
hold off
legend('Xe','Ye','Xe+Ye')
grid on

polyfit(mz,z*100/N,2)