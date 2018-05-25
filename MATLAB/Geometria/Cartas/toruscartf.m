function v=toruscartf(p)
%p: parametres of the cart going always from 0 to 1


for i=1:max(size(p))
 if p(i)>1 || p(i)<0
     disp('ERROR: Parametrization out of bounds')
     v=[0,0,0];
     return
 end
end


%TORUS---------------
x=p(1)*2*pi;
y=p(2)*2*pi;
r=0.3;
R=1;

v(1)=(R+r*cos(y))*cos(x);
v(2)=(R+r*cos(y))*sin(x);
v(3)=r*sin(y);

end